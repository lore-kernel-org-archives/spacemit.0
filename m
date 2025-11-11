Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACA63559D8
	for <spacemit@lists.linux.dev>; Tue, 11 Nov 2025 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859976; cv=none; b=ruCDDItIsRmLSsc7DCAyITgphet9uO22rLmu4vLOYuyFmcaa5RoeZLDyJeX+IXovomi8SlETAQSJYEDPeu81tJ9aAz8U0KOcIm09i8wggX9PcgZWwU0+FKCqC8bNVMGr2gj4IxMN1LxKFzbFU91InmWKxIh6e7jp9VO2rgpcIYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859976; c=relaxed/simple;
	bh=iFxkT7B47RCS6uuoDSZiQSPOjd+qK9G8OyWkqKGNTlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9xzdIn9cx9aj6U76gM4jvZTRpddV0gDzia/wDCsb1VuVlcBMYEcJGPiFompqgatRv9ebh1FQGnwDwI7KTKGshthqCoIK2oDjHcbqhP6Dedk0b6vsLl6rk0N1BgMf6El4fmnTBK/61Yu47ZpesI1A5tmI9m6ecDqmkbf+w+BQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMmEhf4Z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMmEhf4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762859973; x=1794395973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iFxkT7B47RCS6uuoDSZiQSPOjd+qK9G8OyWkqKGNTlc=;
  b=ZMmEhf4Z6akJ1gqdLingMccmjBXsJkjOtJS4WKw2JFvpS7CHE/e5jgWu
   L5Ct8zMx/al+gVfWZ3AOaPRZuiEt8YE4DlG20X0r2nL/E+NJ73B/6p2lv
   IVFA9NUqVVpFuVowm8LNjtcK7ZN64yZN6byA/luOTurb/SHPdMhAD4a5j
   UDisEHSfedtAXCzSFjnDCBM6oNkxSDtwBGDd5ouuytyjhmEe2hEInR57M
   tkEYARRrnLDmjFv7sl3D1r24OlTdBKf6CB/G3YzN1135HUyYpch1Z+tL4
   5HhBCwLaGSTY9pqDhETQXzz3O/Hoj2M/hVtthS33JT86NjL4PQ5Rbd3Vp
   Q==;
X-CSE-ConnectionGUID: 0mX/Q2vKSISjSRZ1oQ18MQ==
X-CSE-MsgGUID: bygZLTaeRdmbkHjN3m3lAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63922920"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="63922920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 03:19:32 -0800
X-CSE-ConnectionGUID: LM+Tx7byTUSiOs06Nl6lFQ==
X-CSE-MsgGUID: c/kstrYRQOeX5wjS4aPC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="226200395"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2025 03:19:33 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7B64397; Tue, 11 Nov 2025 12:19:31 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] mfd: simple-mfd-i2c: Make ID table style consistent
Date: Tue, 11 Nov 2025 12:18:35 +0100
Message-ID: <20251111111930.796837-2-andriy.shevchenko@linux.intel.com>
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

The lines in the OF ID table are written in three different styles.
Choose the most common in the kernel and update accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/simple-mfd-i2c.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 0a607a1e3ca1..5fd0ef3fa44a 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -114,11 +114,11 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "fsl,lx2160ardb-fpga" },
 	{ .compatible = "kontron,sl28cpld" },
-	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
-	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
-	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
-	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
-	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
+	{ .compatible = "maxim,max5970", .data = &maxim_max5970 },
+	{ .compatible = "maxim,max5978", .data = &maxim_max5970 },
+	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705 },
+	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a },
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.50.1

