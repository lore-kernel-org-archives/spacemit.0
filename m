Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EA827FB3C
	for <spacemit@lists.linux.dev>; Tue, 11 Nov 2025 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859977; cv=none; b=SmlZP/5i2VlotvLIW/g/HvK+ZcEUoqJv1kCciFomuZdM4GJRHjqHh1uaDmrrW6SUaqnRwWILxPAIXMio+UZJD7Q4A/Bkx1XtmqjHOAhAk2FIQx6rdJgeGzkY9WVicm+duKY7PZgxSX0j3YRSEdB7wIaRjZIfhyRucBfvz+d4jv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859977; c=relaxed/simple;
	bh=zy4IxmPtBkptPaMrQ2/mdRSxEEv1YrHvTsFXVxkdxq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfIB5g7bKLSJxz98s/2WEAXkV5VCNISFyD4Mvl0JN0SeHcc6hwqXl3wxncHZnA6MV/R4Q3YbQX6ybXsIrYC8kbH2ppqrfOgfs7FReeDanfU5gHq6uSN+XuA0QxRg4AYgTUIG2OrDrept58iM16fP9wVQgW0AyIW3Xhtt+jjyHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9+6BQai; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9+6BQai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762859974; x=1794395974;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zy4IxmPtBkptPaMrQ2/mdRSxEEv1YrHvTsFXVxkdxq0=;
  b=R9+6BQai98HI7uIN+81SHVFp0N5dzMAq//3aIJyBxmeSGb9YhXZRd7xp
   LT7xMQXKv9PzSdyFYn/3rQvPuG2ICwSehKE9viF3ABtikLWZK6y5fiug+
   o9o5a7TMXj0e4Qx0oIhU4jkgPoGgoTpterk1G1OZO0OKfkgpjmrpp/XKT
   tcvFKnbUPVRdThRJ4vMfHIeXp8q9GrfgpdxPjNfgJpKxG7sH/vzehj5DN
   0zUgI4sUOPPsFXnuwpCCzUUFi4UZx3l5/mE/WLbifcaRwa9fRzPQczODq
   sx0k+WPPScIeFHKd73NPpsvCrAxINWUyqQcAJ2RXipaKWaTLgfIKnKCgG
   w==;
X-CSE-ConnectionGUID: pF5TIMfYQX2LtqVh+D86ew==
X-CSE-MsgGUID: kGSkOZmUR8yKeMPaah2cxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82317376"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="82317376"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 03:19:34 -0800
X-CSE-ConnectionGUID: BkraQmrLRc6DtboMi12Axw==
X-CSE-MsgGUID: /913gT0+SZyyILECWidl0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="193053094"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 11 Nov 2025 03:19:32 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 786BB96; Tue, 11 Nov 2025 12:19:31 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] mfd: simple-mfd-i2c: a couple of cleanups
Date: Tue, 11 Nov 2025 12:18:34 +0100
Message-ID: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is just a couple of ad-hoc cleanups. No behaviour changes.

Andy Shevchenko (2):
  mfd: simple-mfd-i2c: Make ID table style consistent
  mfd: simple-mfd-i2c: don't use "proxy" headers

 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.50.1

