Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F83BB699
	for <spacemit@lists.linux.dev>; Tue, 25 Aug 2026 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640614; cv=none; b=t3fN5W1W78BFtBPqXcNat9rilBAwtOgSaU7ZPzHgVvCAa6jXSYoD6SNkC1t4elWPYYZI7vMz8tt4vr2DT+nsNUxH3eGaYi+aHRC7amZtU33u8pitfAq/4TCTRigIQGcBn/mItl4Y5dtKRwpDPXewWjc5tGtcAXQO6lBOOZl3+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640614; c=relaxed/simple;
	bh=Lgw/eoI95cwpkZ7o5jmvy3fkt7m76hFinRZtsPl0Hhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FVAfB7lYeuxdLbHgTxriQfAP+owRe7WER+KxAcBjKxJrWVyy6UDQ92yrAMFp/N2rNmI1g4hY5Ps6BNxyf0yAlgu8UtqPLmUaRtATdGWCpzSkYKmis0zfp3eaJmngYn6cfaoAVe0bNVY3QIrk/R0zNmaPBQo/elpj8K4qc4S4+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxtIBcZV; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxtIBcZV"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so7934099a12.3
        for <spacemit@lists.linux.dev>; Mon, 24 Aug 2026 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787640611; x=1788245411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K08wIoLpKqBSGnc7x1avgOkXlHWiSRY4zZXK6Rw84Yw=;
        b=mxtIBcZV94e7Z/W913Kqhr1/eug8lhQ44c8ZEV2m6aSrhl4nkCB/+OfLVx5gxcx2st
         RHiQMt5qeW+inqxl4WiOswDSoee0bP/Po6pjXhS2Xn8Uau8j1ACv8aSzlB9YjLc9qEFH
         yzpQKIAuN4wD3EbHMU7fHlujVKisVV40XSyvQFotfXFcEGkUD5Xhf6KKLJFfJzFSIYed
         TfDxkoFZvBoefUTy1WRrFwUlHRBCvoC4ZVV5LeWxflr4fljx1h7KrNRPo7l/pwNZ1j5+
         twKwuMRNaoMiuXnfU5E8S5m6Yur66FDO3IDpzSDExiOuzs1UP3z4S+kBHajbm8/tTGyb
         zmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787640611; x=1788245411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K08wIoLpKqBSGnc7x1avgOkXlHWiSRY4zZXK6Rw84Yw=;
        b=sniBqSgAkbh3IQSq9MywNngkpG6wYWLPa2fGFMlHIn/5Ur1LIh+CEe/GagfFHMT03X
         8ANkBptQkRcgjKT9H/ymw5oHC0jF/EKy4mZARtw3oB1tv3PuDQ51SkRH7s5UOtParSRf
         8r5mpqUb+Q2nnoH4VLDdiHPS5o7pDQu0lnOEREyIuVsVKw7ZmkuAsyr0+/510OkXepSx
         OTmlaKjyT1e3xL2/ZToMHEDuMMxEmIRqvSpQy1mbtnsE6AchZt1RLfa5RUGq+0SgypnK
         u28ju9Az8+n8XBwumWUu5cRKrJI3RS8cb3N1wCyzSDLF6o7M4D5k2nmk7z1eZ28qs8be
         bcOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqf4M3MW+SaXf6ccsJ55GNGqTZyUMGguz7bay3DosPfYBHJbZn5vUYqoJw+fizHpwgxKE/C/kL6Qw==@lists.linux.dev
X-Gm-Message-State: AFuF++lGtps8tJGNRe+Wbe2EKxflf3eNwwNGEhksaq0oWz/dgQ+hMiRT
	z02B3sxKQsoVGocpui3a6KGpo/Nl6TNa1tZiuWRvPixyIBzMzyGvuoCF
X-Gm-Gg: AR+sD10f/UqQRUWzCY9Dx9UAt3kPrt1mhJzWDlaRAP2mmxffvvdzdGh9sHnJp5Vkh/+
	DLxy/2mrL1jxxLWWnwue5V774BAaU5gyKVXXZ5b+Qv3QiFD3ADxtysLMTFKdvZCGbRO4+YAwnFQ
	Gy9FxQWjk3JuIEqrFBNUc0S3OaS8CuQK0k/B9LgP54KOGTESeMcybvwSTla1nxkhmdREaFbAgIh
	XNZ1PD647GRy6mDKXrY+SqhzrDoEEuNvFiKehyoSrXCKG86oXjmbIpoXAIe6BBu7XtzEgE3CRYb
	IGLpwCnGN7cTr3OC0AqU4zGnnwkewI9T3r8PHlLjx+bNY7EOjtrrfKixnFTLCR+lqdM0fhoe59w
	TroS7DdSvGxHVq7RKvLK4srTpMWGAUNI5K/M0XxQA7vKQvUNjj4oXGVL0JYf73pA8Q+vgXaqYAp
	RCvcNtGBzwswkaIa3aog3TbBUX5K7JCJYKPx0jrsiD4eN1A1XKr5tgHTj0Z89HgjRWWz54BLjuo
	Rl1BX4aQplKvlcDKmcCkTUhVRV3xZdI2uJY4mGLR3Jgq7atp+Wid9aTnQ==
X-Received: by 2002:a17:906:eecd:b0:c20:f871:1018 with SMTP id a640c23a62f3a-c24920d5db2mr2716175666b.21.1787640611076;
        Mon, 24 Aug 2026 23:50:11 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1658627666b.42.2026.08.24.23.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:50:10 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH v2 0/2] phy: spacemit: fix and enable the K1 USB 2.0 PHY
Date: Tue, 25 Aug 2026 08:50:05 +0200
Message-ID: <20260825065007.69353-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 was a single patch adding "default ARCH_SPACEMIT" to
PHY_SPACEMIT_K1_USB2.  Automated review pointed out two pre-existing
Kconfig problems in the same entry, and that change makes them easier
to hit: enabling the symbol by default means configurations that would
previously have left it off will now build the driver.

So fix the dependencies first, then enable it by default.

Both were verified against the driver source: phy-k1-usb2.c calls
devm_platform_ioremap_resource() and devm_regmap_init_mmio(), while the
Kconfig entry has neither "depends on HAS_IOMEM" nor
"select REGMAP_MMIO".  PHY_SPACEMIT_K1_PCIE, directly above it in the
same file, already has the HAS_IOMEM dependency.

Tested on a Milk-V Jupiter (SpacemiT M1) running mainline 7.2: without
patch 2/2 a "make defconfig" kernel has no USB at all, because
dwc3-generic-plat cannot get its PHY.

v1: https://lore.kernel.org/linux-riscv/20260825052158.66367-1-bbanelli@gmail.com/

Changes in v2:
 - new patch 1/2 adding "depends on HAS_IOMEM" and "select REGMAP_MMIO",
   with a Fixes: tag
 - no change to the patch now numbered 2/2

Bruno Banelli (2):
  phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
  phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT

 drivers/phy/spacemit/Kconfig | 3 +++
 1 file changed, 3 insertions(+)


base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0

