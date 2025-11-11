Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC823559DE
	for <spacemit@lists.linux.dev>; Tue, 11 Nov 2025 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859978; cv=none; b=hAzb8dNmR/fmTCixv3558gMEoJuT0QKtnQpD2S5JJ6U9+T6ke2lkW7yNeYW82ifbbBzC8yElKXkI0iL3M42O0sez85cQJnh9iJkI6cBCHFkyh3i8xhiko1QfBaxjClhchcXiIcM6FkNG5Q6CUnGsDtygagoMOO7G8tv1kw/rbu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859978; c=relaxed/simple;
	bh=9T0WYmDAOm7giXvF1mgj/3D0HBRvqmglFqNtm8BgpMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIZ9YSJ/4J321sJC/+ofbKTtpJXK5BCbVBGjLHXKJnTnxSDOw3raHX75oLYhNeBopLEe52/ppzRa4Rc6uiGSkf5pp6nSXtnUM/jYg9DXpIKyQk61lelHltfwEuZdGPgb0rmOQ562wEzse33eGJ3bbWfSciJQIDrRrcODgpmdfZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+mNZCWV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+mNZCWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762859975; x=1794395975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9T0WYmDAOm7giXvF1mgj/3D0HBRvqmglFqNtm8BgpMI=;
  b=Q+mNZCWVdiEGwTkRO3XD+AjGpBsRwosR5zkBC89jPhlkywD8LD8RIOWM
   SMb9DnZmgz5bjnd6fQVDum97Eqv9h49uwKtq87S2AYoEV6UaYOYUgI8HR
   uZXGbR92b9mwHUSGlpEHCwGaPiwln92HvjNR2bv3KYdYJt1/PyDiqHv5N
   WQA3jKFShtVtegYw7FzuxePPjO767jg80fjEwojxDjNDrvTWau2KagttS
   Nb/nvOz5A4mI3qnIMv4iQtqVH0wcDwUjEDaHK/2OoLeuTJMzFDKvnNkgx
   DhrapivjKy/gDj4WvVm0K0ci60d1PjcNeqZkhC2bGSZKvDvte0txEvIfW
   w==;
X-CSE-ConnectionGUID: m66pmnBvQKO0DFy+ttjwaQ==
X-CSE-MsgGUID: XkK9BJE6SbiSxCsqsg8/Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63922912"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="63922912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 03:19:32 -0800
X-CSE-ConnectionGUID: 7KRySQPbRYeXDo4od8bOMg==
X-CSE-MsgGUID: dkfo88vgSVqNB4eYiK/VeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="226200394"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2025 03:19:33 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 802FC98; Tue, 11 Nov 2025 12:19:31 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] mfd: simple-mfd-i2c: don't use "proxy" headers
Date: Tue, 11 Nov 2025 12:18:36 +0100
Message-ID: <20251111111930.796837-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
References: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use) principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/simple-mfd-i2c.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 5fd0ef3fa44a..8b751d8e3b5a 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -15,12 +15,18 @@
  * will be subsequently registered.
  */
 
+#include <linux/array_size.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/kernel.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/stddef.h>
 
 #include "simple-mfd-i2c.h"
 
-- 
2.50.1

