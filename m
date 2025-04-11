Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF44829CE1
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377288; cv=none; b=C0H2hTNo2XLNPahJYcJbnbhDGejS1kuqzq2qrT0YDahQUP6KZwiZR9pe6IWiTHNG7ebnWQEiWMscLsYOc1q7DLKzcVFWzCGg7y8p4iDOLsO2cgzm3zM1Y9ln8rDJ8dbH74G1nyhsy8H4O3pz3eZVOGwqS1/288n2SodhN17oaDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377288; c=relaxed/simple;
	bh=Ch+fqjo2jOucp0Q9pAQyUt/W5onTs4h2zU2vjVST0DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+Yb6PTXPi3u6H6PiLQ8P81wPeh/CfJ2K0eSzBcz187ZlMIJLoFeGoiC6Wbh4kxk1ONkg84M19DoXmZueuo4kvGDAUaZbQRPu/VGRV5mF0/6CpggX7HzknJgpWCHZji/4257p7bPEAkmKmzDUTE8UA1myXSA/IMwKfQ/bctRltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iz75eits; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iz75eits"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22622ddcc35so25228825ad.2
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377285; x=1744982085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qre57TZAkUnswgts6IEzV2m9ITum31ZFo8SGzVvPyaw=;
        b=iz75eitsZpGSGzf7nHIpQxk1PW7cxx7gXhMaqWC3jdbQHt3j86uH8VJftRci6KpHxx
         NuTn8OQOWYAwSrCptbNoVrR9uU6fE0v4drzBcvDnfkLjiv8bt570hV1DZybh7uIKkj2d
         rdWG79cI3JO8qvwDhZ+UJMkqOJBlrOwHSQgU09jltIMzpsfIKDpXzAmj48gjvpIQZWoJ
         ntHsAfsgMSqEs5FcVMkLsyapYdX07wgFnhGku2PUOZruz/7PA8E4z6JMRxTjnY1ooWAd
         wu5xzxfLIH8X4H1+QsBf47Yl9LXn9JPB8ngeMqXaFBqD4e49Mk14n9czqbpaFr2DxTbT
         MHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377285; x=1744982085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qre57TZAkUnswgts6IEzV2m9ITum31ZFo8SGzVvPyaw=;
        b=IWuaMZu3ctDFSuV+AKGFGIVgNnVJnw9g2mILRKpDvHM6Ws10Ewt4I5xuKZ0DJdohVL
         ls034XCOpNEhi50KhYi2HCwExmIyLMV7E9yEW+CKlNunrnxfpcg1RwJBmOvouQqEBClp
         bJQToZzIsIKJOzxAHSO/nfDxojdsKrGUBVjYUxegr+CZlvsmVVuGaSp5vJBTI0w8/W83
         yPtEjamrKLc6wK081OJDMUoCc9NxheUWOmNT7CW5AeNmzUXn/cpNivbsmj4LEErI0lof
         vzGnN4MyI5v/qJWLPPlsJO6Cb+8Dp3GWkVD5uJxSeCkkWw7HPBl6xcspLhn59oCLEosa
         5T7A==
X-Forwarded-Encrypted: i=1; AJvYcCVIgkALGSCKpCaEFtl4rC23iz6RKesvnTAxspJnmUdH2O4KhNdez6zriY2LJoB9Po3mYfzR/G454Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPpNScuA8IFcysZZFk4+UzEaOakWhVtepFUIbHG7gv2crQnu5p
	P6w+7Yh3/K9lAhR9KPa6A77ditsL3R5G5qdaUeDtCUoA1UNhBeYB1ehXbF7p/qA=
X-Gm-Gg: ASbGncvjMmnCtGFhnBTNeJtvzE44QDcaOcaT1fdeXQY7t9SPOSSJvAEqFwbOWr4MKVn
	iWJCzM4UL1tj27HB0pZA76GcK9IBCkKDyzwJLT0wJzHalv0XRv528ae7jChkVFqD8l0XKzryVIz
	pY2COyPPve+rugrx5dON+dPU49BW7tEw0+fVT8G1c0vBHUeAUsAJ2ee8Uj7ZXGe10xddPJMLIRS
	wGqwM9qvSgNKgWxDFrEdQd2aTeXT5L9a+lCEuAXzrUxlcZaXFDyiiWLS894S7F/UvIXmTHIhm4u
	InDaqMaVzRFn+lvNDQn58sYfhXNkP5M=
X-Google-Smtp-Source: AGHT+IGUnh0jzuOwIhS7mW3GbrnlxFqJLF/GhatlTQ8Fz+bqzUxj4AuJt7AlIxLYz74Fdql/j1nWVg==
X-Received: by 2002:a17:903:2a8e:b0:215:9642:4d7a with SMTP id d9443c01a7336-22bea3dd45bmr41851535ad.0.1744377285123;
        Fri, 11 Apr 2025 06:14:45 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:14:44 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/9] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Fri, 11 Apr 2025 21:14:14 +0800
Message-ID: <20250411131423.3802611-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset updates the PWM_PXA driver and related device tree
bindings to support the SpacemiT K1 SoC. The changes include
modifications to driver support, configuration options, and device tree
bindings, enabling PWM functionality on the SpacemiT K1 platform.

It has been verified on the Banana Pi BPI-F3 board using PWM14, which is
specified as a pwm-backlight. The related device tree nodes are set to
"disabled" in patch 7, as a reference for future use when the display
driver is upstreamed and can be enabled all-together.

It is built upon:
1) the clock controller driver that Haylen Chu
currently has sent out for review at v6:
  https://lore.kernel.org/lkml/20250401172434.6774-1-heylenay@4d2.org/
2) the reset controller driver that Alex Elder
currently has sent for review at v3:
https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

It consists of the following patches:
Patch 1: Add optional resets property to PXA PWM bindings.
Patch 2: Add reset control support in the PXA PWM driver.
Patch 3: Add spacemit,k1-pwm compatible string to DT bindings.
Patch 4: Extend PXA PWM driver to support SpacemiT K1.
Patch 5: Add 20 PWM nodes for K1 in the device tree.
Patch 6: Add pinctrl settings for PWM0 to PWM19.
Patch 7: Add PWM14 backlight support for BPI-F3 board.
Patch 8: Add ARCH_SPACEMIT dependency to PWM_PXA Kconfig.
Patch 9: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.

                     - Guodong Xu

Guodong Xu (9):
  dt-bindings: pwm: marvell,pxa: add optional property resets
  pwm: pxa: add optional reset control
  dt-bindings: pwm: marvell,pxa: add support to spacemit K1
  pwm: pxa: add support for spacemit K1
  riscv: dts: spacemit: add PWM support for K1 SoC
  riscv: dts: spacemit: Add pinctrl configurations for PWM0-PWM19
  riscv: dts: spacemit: Add PWM14 backlight support for BPI-F3
  pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
  riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

 .../bindings/pwm/marvell,pxa-pwm.yaml         |   4 +
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  32 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 315 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++
 arch/riscv/configs/defconfig                  |   2 +
 drivers/pwm/Kconfig                           |   2 +-
 drivers/pwm/pwm-pxa.c                         |  16 +-
 7 files changed, 546 insertions(+), 5 deletions(-)

-- 
2.43.0

