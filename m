Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5146C40912A
	for <spacemit@lists.linux.dev>; Wed,  3 Jun 2026 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475022; cv=none; b=XJQLR+lIVe+clzDneymgDIK5D2LV/RJsuoi625DQBGB8WxfJ+WKtyidFSCd7VZh2ux0ZH+A0+TjD/Ladk9lHSmjPtuTTBIr7KkHxbuABnIKCONza3YD2Q2JoRbtkwwiYvDJZBqvpVV5VzmsznPxSSdET2Q1/qKwccR1jQUCItpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475022; c=relaxed/simple;
	bh=k0/AOP9cOtb4EJR5/WAI6g4yIoJooEj2rBtv86fI7Y0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=rfkenTDMx3KRnQISDPcwKPTDubbmw+IbLElowP8xy+LsHmns9adB4Z8L+Mnr+IFQhYmvzb6zGas9v18COuTni/EPmP4ma4FU9q4ZPATvzap6F6bFQGE4tHX+xOvRnileb5xUG9rlXKSFBgevDr+ScA7basbxgARawghoDJkO0LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jxbKrTBj; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jxbKrTBj"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260603082338euoutp01dbbf86c14220dc6836062074649496d5~1hJiOqTYX2273322733euoutp01j
	for <spacemit@lists.linux.dev>; Wed,  3 Jun 2026 08:23:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260603082338euoutp01dbbf86c14220dc6836062074649496d5~1hJiOqTYX2273322733euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780475018;
	bh=Zs3WwQs+RVXnymBdQxAPfzSp+wBwse81m2k35fLq5OM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=jxbKrTBjjFrU5QAZYAaUwo+UPwoOiL0mIIw/bbLK38+FSoqIB2ngFg7QEeUHru9/A
	 AclbfAh/g5rLHJTVEUcuj6ZGhxqs55/luF8w5y0SJAICH/JefryIbk0fNfKfxXGYrs
	 b/L3P86BEpAh8pDjEOLRmvReSEjQ2XuRZN6bmxBs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260603082338eucas1p2ec88154477479bf0547e5221e0919b07~1hJh3kR9-2543625436eucas1p28;
	Wed,  3 Jun 2026 08:23:38 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260603082337eusmtip1d363b6a634f66c3a628f646a55fce2b1~1hJhdo1tE0717907179eusmtip1I;
	Wed,  3 Jun 2026 08:23:37 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan
	<dlan@kernel.org>
Subject: [PATCH] riscv: defconfig: spacemit: enable i2c driver for K1 SoC
Date: Wed,  3 Jun 2026 10:23:32 +0200
Message-Id: <20260603082332.3200814-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260603082338eucas1p2ec88154477479bf0547e5221e0919b07
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260603082338eucas1p2ec88154477479bf0547e5221e0919b07
X-EPHeader: CA
X-CMS-RootMailID: 20260603082338eucas1p2ec88154477479bf0547e5221e0919b07
References: <CGME20260603082338eucas1p2ec88154477479bf0547e5221e0919b07@eucas1p2.samsung.com>

Enable K1 SoC I2C driver to properly probe PMIC chip on BananaPiF3 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index c2c37327b987..08445df56006 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -157,6 +157,7 @@ CONFIG_HW_RANDOM_JH7110=m
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_DESIGNWARE_CORE=y
+CONFIG_I2C_K1=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
-- 
2.34.1

