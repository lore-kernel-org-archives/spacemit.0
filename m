Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888FC3A1E92
	for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 17:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766770355; cv=none; b=RWsN7D6oQF1UvGrf12XOMacECMCUwwhxqjavQppylrwx9g+YYKGNayduSTIzDfPwHEoPG1uq9jQcXUnt3NhswgpyNVTDCwfjvChmgiG2sFgaysRJzrJlnjTt5BdjIhuqcw5KQX/J0E0Ot/iaDV4vDEiEf8YkjaMNEEwyyALbImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766770355; c=relaxed/simple;
	bh=PsjgW1fnmOdGnNqFkZMAxC+rOmDEaH/d5UQFZOB7KSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IRJy1GotMJeiQ5gwulTuUCR91reKxvdQX5TwAw4l7uPOfW0pUx7A8r5b9x2nFT5mqNTgDkKTRuCrh9PVgBHyjgaKyXhrT4/DFRoSo/ryGx05225OBZvd1qkXs5zFeKWBidpwy+hNIgAK4nVJpWmPQp1qvJillqWIN5kFdy6kbrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KvRqDapI; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KvRqDapI"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ba4197fbd4so780785485a.2
        for <spacemit@lists.linux.dev>; Fri, 26 Dec 2025 09:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766770352; x=1767375152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciwqItzOvTH80EkqRK45xqhfDMd2iUMF4JpBnkt+bcA=;
        b=KvRqDapI95w22lHW1en+9ubWz7yLDOSIu/ZRY+bDKy50bXEGd5HFjz6d7mFijgfuxB
         YPDVLOjJ9PQmG75vAxB3xad4LGfBdEH1MN8gPWmqYeTv9qpWMEigmc/kHcLGTzXuE/c3
         MX39HjMFBLGRZz92nfMKPBv83mf9ATym7rZLtFlFWCPJEQ/GkCramCKVdCpPdsjC8kUk
         3Z7cW6ND80TkdGsojv6tg12evli3Qgpkf8AqelGpOVB0x8mlkVLcg4rGoNp9DzEic22W
         FUj9HlYz/bQ5Rit2Lrb8aiWkEgyyT/a9reNFf4y9RplXLF7n8Uiz3Alkt32pk82ZUmvf
         raIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766770352; x=1767375152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciwqItzOvTH80EkqRK45xqhfDMd2iUMF4JpBnkt+bcA=;
        b=GlZttJTm7pjfLvyGH+0gmSpxagJrz9EgiZu18tTLxyum+JELBl/y+8Jf1A2tNa10H/
         CkVV9Kh2WSHdMceu2DASri4hZWbjXdUMtdgeC4WNzxM6estYp/cuW00AU/hY3grK/ZIp
         /9ZXMxRsBbH8Yhp7bGS+JONnxcPSwmnnS765lvhRYlymy0u/BcICKgBxjktesRKvGH57
         RMMURWDM29xJRwaZvekHd3blO0S/xQy9JJ8juSgjSzKbi7PJznkqIsIPAHQ2WqfAxj4W
         VmawVNENJl507rIthkTONJ3+QzfEjTjPP1+8qSBuc9E8XyM4aCByxqUcLV+hmhTdgsrL
         KTng==
X-Forwarded-Encrypted: i=1; AJvYcCVBVD3GfpVFB9SL3T+TyY6CXfiBSx0UMgY4TJArTp4j8CJxWZq+ve/fKb1O/Zw+7AN6EdLt659org==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbNgT8rwi+/WBIGCa34LIWYe8N2TL1DRA6M409kjNRnZhl4hj0
	MyaJoO1E8EeeztoOtaxkKysxkRl5yXmv8fAGEaI5l2XiAzuHDIACjvHZYb7WIDc/5R8=
X-Gm-Gg: AY/fxX6XN6x9+o5knB60ni3j83lttbG8ptXyhPgvFfrftPlqa2MWNanlPUh0jBGM16V
	5QbjKYUfxwujyL2zluOc/1LIRzbAXbaA6SgXrFT0ZOI1Jr+bMH1PljZfpkPaLJCacKlQEEtQC8D
	0iIDUtGgMaXrt0KXH2h1ySNKkGP71DBHqSffvggManD7zDf0SuyICORH+yqg4UbJwKg3EoC4uyW
	DahVuWwbNJwlNHmMLQWVkJA3Pz/sKt/axSSdGJbHmwywlAydOXs5+l8jo4lGpEtXraZW1mTIbbW
	aKnDT/fccXf3mIJaDLw4ehvZ1F5LCKte0dxPqZ/1jMyteI+24ab0BcvicvETIxntUZt00QoR+Ks
	iBuqflmDapmYRsHWwWJZxeg3Xv3gxCkDT/7QzvrdBR6lFav20UNmLy3V6x8lFFfVf7GH9bhiRlj
	PKOLy7tZbHFK+3v4H5qGS1xGvTfxTfVPy1e6QNHFl38r+KaP668UvUTA==
X-Google-Smtp-Source: AGHT+IGBstnrzq5tGM78o3fmlA/RjQNKRMjqUXsz1wbOluahiwHWTwU9dUEJYN2xiG5mCT00aGrX4A==
X-Received: by 2002:a05:620a:17a8:b0:88f:ee0a:3d66 with SMTP id af79cd13be357-8c08fbbc94emr3534421585a.80.1766770352281;
        Fri, 26 Dec 2025 09:32:32 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ee7d5sm1751075385a.49.2025.12.26.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 09:32:31 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org
Cc: dlan@gentoo.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guodong@riscstar.com,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
Date: Fri, 26 Dec 2025 11:32:27 -0600
Message-ID: <20251226173228.2020411-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT PCIe PHY driver depends on the common clock framework.
Not specifying that led to a failure when doing a COMPILE_TEST build
for the SPARC architecture.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
Note:  This is based on phy/next, which I find doesn't currently build
       cleanly using "arch/riscv/configs/defconfig".

 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index aa2d30e0e3261..3bc7378ea8658 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -104,6 +104,7 @@ config PHY_NXP_PTN3222
 config PHY_SPACEMIT_K1_PCIE
 	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on COMMON_CLK
 	depends on HAS_IOMEM
 	depends on OF
 	select GENERIC_PHY

base-commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074
-- 
2.48.1

