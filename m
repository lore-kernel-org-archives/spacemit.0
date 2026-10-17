Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B191D3CAE99
	for <spacemit@lists.linux.dev>; Sat, 17 Oct 2026 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260108; cv=none; b=krj5nAH/uIdVi2tP+N/QGZN4ZJJGQ57Ib1ME/dLZbIQ+mbweLK5gSXQi16iDU1L8Vien5eJpqKu7p3IsnS/f7hckpvSEyS1/QlUvY+VJPHV4XmRMWsec37yNy2S2MxuWjQzzjjYtHecW66DFShk/MyT7K0WwFB95nOTPvqSxU2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260108; c=relaxed/simple;
	bh=OC28K9DeVAvdNt2i4HLQhvj/9KpHA1D851pZfGYKe8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLjsYZwZR/nXh5GLAjELYj1Ax3s2LIm8mY/Cc1vh8nZO/+nHFXdJaCH29qky6fztKc+HTj5rIJk503/6gkAAXgZH4FNeH5TbVoVKvsPBzua7QAlz90OH727I9BtOk+7HQAR8uD1tql2BWttUjOkZs8hAsDefrlDN7MKXQOF+YOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxTbdJVU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxTbdJVU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e812e2b31bso4453685ad.3
        for <spacemit@lists.linux.dev>; Sat, 17 Oct 2026 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260107; x=1792864907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpd5O0R9+duoKDmKNVdsMKIxn7WvXRY/NssiY4nj4tc=;
        b=lxTbdJVUQgUiP/Xh+mlR/gF8IlSjlBWwoMoVhI4vysGUhaqqmX3A+/3QNSCI4eOXB0
         egr4NYAn0fH3mLg0rt8ZZJ5Zz1dO25KBflSTUUVYvvenQT8uNXR/QbYV1BWysJ7lNccd
         7EdklVqBrE7mPVIncodPSETdXVRBdnN/1eYgcK26cHzrp0ZqiXZR924ws45Q2FmhcmAM
         x4jlSTJYo8JtIzqf6bJ/mG/edNTxrVftN1ZunoRJZGCTBzAGb1tPzWMyCZRL7hKMZzOd
         O5TcPc0D16MCsz/YACA/TW6KvNqfS5eoo2uu1r5s9N+WxTqxOUuLRxCkcYt+caiob366
         I8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260107; x=1792864907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpd5O0R9+duoKDmKNVdsMKIxn7WvXRY/NssiY4nj4tc=;
        b=jNlBp9i9twHSRF8hM2/QfiZFYZ2J8SYNuycmORUOIzsMs7Nb/Xea+H/Pp4PDLdlknl
         zBDVzLGiAiOM5mKlkIOZ65TJINmo9ZZ+G8i3SPfgpuOyFT1UEZT5H5aOVVnkwQSciewR
         FImyOiXbh8yL2Br+oaZZjslt+fJOzkYaHV55uxauoMrheM2V0pcmCwkIfDnKKXrRn6be
         p6uoskSY9qQhoSxF/MIXua+JsSp4xG1tI3+6T82PK++/biW/6MgO/2exAE46xOyPEx1Y
         2gp+O33rupXCVvBCdE5eg1ZQqZ3Jr/8FBxNt7xVYbhK4GuIlCuHPmO0+NuFTI87qehOr
         I0Cg==
X-Forwarded-Encrypted: i=1; AKwUvBzIKM2vvb+0nybxi32KXPi5k3nGY2MX36wpU8PQh+QAKaEjZ7Qk5ndmU8Jnv3RFWki1sO+pmIHfUw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLiE6xr5VrRrkGYjgF2AOWsSAjCrhOeRjORpH7V1L6AU2YdW0wf
	yXkuS9SMIc0eVeRKGzR7801T3HEb3Ii4SOyZt6yZxsj1voVfaGxnTYNR
X-Gm-Gg: AYBFou3anmBBTXWKd8UIokXojWNALsrJQBf1HyqW5cuon8pYdHOtUiH65fHMs4dB4d9
	kdb/M3y7BIIhY0icoxzNEPTYI4phEqcbish3Zbqkdg76LX5dHBt2bYQ22/rVOuMMQZGTPh88Xty
	GQDemC9L6hbYQh7hGhb1lr8FHFz/frVhP1QJPOIWH0yYIDLArt0R5hJQznwIP38ppp7JkRK/uyE
	7LueBlMaAToLG63+x/BMPrChbh0OQz1sGcEZejR9cqPJICg9R5yasy53WWSht9fq0SPzoa2Qha5
	thYdG1mOVH5wLyfiS+u+pM5+TY1F0Ak4Un5yi2D4wp3CTAojRablQiXJxNKNHOnKkj4XbVdheKk
	HyQKx2FS7y6CRdfqEZ/cGRQhhUPOGQpjMb/uqqdlz75wc8Q4rK0g28LNZDE0CVS6GYN/Fk9vyvD
	ngk+pGi0pOVw/Bmb2oPR51sNsPQZvhL3T+I+ePvIlovkFpBUJ/ktJ2SUE3AJFj2s8SFI+xXUetk
	Br8Rx4h8Da5kRCW1sGyYMMDKk+Zxno+lEWsXgOpvmF8Wdq76Tl+23G0scLwHdplt25uNmVELtMX
	WpkKSNe1w+GI/tgH4QSZ6tUfaLVd8XX5nb7gO3nU4Or896+9+A7oUQ==
X-Received: by 2002:a17:903:a90:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2e9a6833906mr30171515ad.3.1792260106924;
        Sat, 17 Oct 2026 11:01:46 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm23030035ad.2.2026.10.17.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:01:46 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 02:01:39 +0800
Message-ID: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bootloader SPL on the SpacemiT K1 runs from SRAM and needs a handful
of nodes before DRAM is up: the root clocks and clock controllers, the
console UART, the boot media (SD, eMMC, QSPI NOR), the board EEPROM
used to identify the board, and the PMIC rails it programs before DRAM
training. Today mainline U-Boot carries the bootph-pre-ram tags for
these in per-board -u-boot.dtsi files.

When I sent a U-Boot patch adding another such file for the Milk-V
Jupiter, E Shattow asked for the tags to go upstream first, so every
K1 board gets them and the U-Boot overlays can shrink [1]. Earlier
there was no working mainline SPL for K1 to justify them; there is now.

Patch 1 tags the SoC nodes in k1.dtsi, including i2c8, which every K1
board uses for the PMIC. Patch 2 tags the board-specific EEPROM and its
bus, the PMIC rails and the SPI NOR on the boards that have them. The
set of nodes matches what the mainline U-Boot SPL tags for the BPI-F3
and MusePi Pro. Pin control and regulator supplies are left untagged:
the K1 SPL does not enable SPL_PINCTRL, and neither the P1 PMIC driver
nor the SPI NOR and EEPROM drivers look up supplies there.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series. I have not run an SPL built from these trees on
hardware. On a Milk-V Jupiter running Linux I checked that the EEPROM,
PMIC and SPI NOR answer at the addresses described.

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch, where buck1 now carries
  the buck1_0v9 label on musepi-pro and the OrangePi boards
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/u-boot/5d323a11-da4e-4071-bdeb-ab5c03e8f85e@freeshell.de/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  4 ++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 13 +++++++++++++
 7 files changed, 48 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

