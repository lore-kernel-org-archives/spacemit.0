Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568AA1B532F
	for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132665; cv=none; b=om3rjh3cWgEjC6jHCmJPlECaVPhCLo55c+LNXxJsKH4EVNzpiACinOYNNz8IBbVAMM4Oe4QXDpJF4sGQ6Ov1hvOUwX4s1euhv9XR5F2JeL4g/jV4Gq6rj7w2xVv1TgtTlVYhW04PFY2FVtI3lSToY4vN6IQvHCjDAon1RbI88Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132665; c=relaxed/simple;
	bh=hn7YA7XmCyOpYGIUjgJ8uMsi3N8R4QuPxrjMUjRQFKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zj4SBGPlzp1JmCL3GmyuqM6vkzF/NfYCiBSN6ADCZ/ONRUBAqJnxvjw4QbGL0rmt+ulb6Ir/iBpEjKdnDWTgfhzgZSkZd/RhAUarVsRQr0IgKsuOVjLKXgkc8w9a+Z+GWNlknD81qWYadj06LFFcjYtudWIDCGzOVEuIBrjrPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KOWlnEgH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KOWlnEgH"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so3649167b3a.0
        for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 00:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132662; x=1745737462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLrawCtHSQaSge3rP8I64g0W6VpqwKb/nSX+gldLJv4=;
        b=KOWlnEgHV1WQvNorJX6z5Nq7LEogFPRBRARFCt4cCE+e6nGvnRkfGB4Yf6wk3DpE2O
         Jjd2KVlHTwwKiXMmAD6e7ytCiRVzYrZ79q2Rgpu1cD1s2z456JTOePHMTj/w+Qdc6xNF
         9AiYxLMntSejLr+eywLk7gHwomulWtOAeqADxJEexIJd1qzXnmMfIdUbYMKf1gowuixm
         BLR+AWq0b25s5PjHmUQzqpMi6MjTROaFo7/UG4tDHoL54aI4bLmIJKsKwxUNy6n6dsYt
         GdeNI7bavqZNMCfAGL4PN58MGgdkeGRenDiJTAaiawznlXhmaWFnvt4ZmhEtkL5qSx+L
         fFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132662; x=1745737462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLrawCtHSQaSge3rP8I64g0W6VpqwKb/nSX+gldLJv4=;
        b=pynucXXRbed0Uw60T9c9pS5H1vx4ce/IDIivu98RH7HxjRH0MTHk60UKJhwgw181qF
         pWWWooji4DOgkjaUtvMwJEPkdvl7H74r9C7WeUqxVaMzhMLPM+GIIfVDHzV5eAvUriu6
         LicW90kaaC3OVPCfXrzXbYCrQOQ+H0aqaYDWfxykTQRBA8Yd/bepWirAZ9pTUkBAPraU
         ltAwxYPMB+iJ8eKWuuf/LZ835VPMQnG50E4rry5kp4YHtu2AVakzBepyhNgQEllh+zPT
         WVqLf111afK4wRDdXY3Lwlp734dPCw5cFJv3DPXgXu2+2dHUMs4ENTr0Dm7flBTWVQ1d
         VhIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5qKtCJKXqwXG+Jmol/IYkOHIFGY7e3oCDOToqxF+ryDeOtLrqR16TVzT7oNb3A/nLgDfPLwcgMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcwvyMysjRsfq8oMzjdQZEvGJQu9GsR14wiAN2tV6+cxPyN+Hd
	ysK8OkxtHQ7PYNKC8z3HgQwN9RA7iOwFj/dh6p2TKA3PiEj0b54qU5f10ozGsww=
X-Gm-Gg: ASbGncuCndzPZcr6yaJxC3ZDdbxvotx0dnc5juCeH6ZrOvEpDJzf8TX6YDR3y+DtCVf
	d9mzDm0cKUDN1Ap6ScUrueoJVTEqfqUOBp25WWqEdPcbn9l+i9OVJfiSSUYvebcaLC0vzjHOeSX
	eCC0xBIunqOsfXXRwFWHRJOcgm/bxSAs8frjhLIx0Pw+xOz4x5btFMpR8T3Q7u5L0OkSnpqchGz
	oUzolpaEstmpuWP9Am1ixiwyFBuzGEe+Ro17d7Esn/OatxPL0/FaqNMhdDG0cPVDMH9GMbkb6mY
	wtetbSoFcJiVkCl9eP5RO1H9TyvsXQ==
X-Google-Smtp-Source: AGHT+IGsw49Y1EZHbpB/CU2efSGqgI49mepGyjPNnwH7IpvujjQyW84NHrrsk0hDbuCp/nEw8aQw0Q==
X-Received: by 2002:a05:6a20:d705:b0:1f3:1ba1:266a with SMTP id adf61e73a8af0-203cc4ae6ddmr10558452637.0.1745132662405;
        Sun, 20 Apr 2025 00:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:04:21 -0700 (PDT)
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
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Sun, 20 Apr 2025 15:02:45 +0800
Message-ID: <20250420070251.378950-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA driver
and updates related device tree bindings. The changes enable PWM
functionality on the K1 platform through driver enhancements,
configuration updates, and device tree additions.

Functionality has been verified on the Banana Pi BPI-F3 board using PWM14,
configured as a pwm-backlight. Per community feedback, the actual
pwm-backlight node is not included in this patchset but can be found in
patch 7 of the v1 series.

This patchset is based on the following dependencies:
1. Clock controller driver, posted by Heylen Chu (v8), with
   most of it has been accepted:
https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
2. Reset controller driver, posted by Alex Elder (v5):
https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com/

Major differences between v2 and v1:
 - Dropped the addition of spacemit,k1-pwm as a compatible string in the
   PWM_PXA driver; instead, it now falls back to marvell,pxa910-pwm.
 - Removed pinctrl settings for all PWM nodes (pwm0-pwm14); only the
   pwm14_1 configuration is included in this version.
 - Changed PWM_PXA from built-in to a loadable module (=m) in the
   riscv defconfig.

V2 consists of the following patches:
Patch 1: Add spacemit,k1-pwm compatible string (with fallback to
           marvell,pxa910-pwm) and support optional resets property.
Patch 2: Add reset controller support to the PWM_PXA driver.
Patch 3: Add device tree nodes for all 20 PWM instances on K1.
Patch 4: Add pinctrl settings for PWM14.
Patch 5: Add ARCH_SPACEMIT dependency to the PWM_PXA Kconfig entry.
Patch 6: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.

Best regards,
Guodong Xu

v1:
https://lore.kernel.org/all/20250411131423.3802611-1-guodong@riscstar.com/

Guodong Xu (6):
  dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
  pwm: pxa: add optional reset control
  riscv: dts: spacemit: add PWM support for K1 SoC
  riscv: dts: spacemit: add pwm14_1 pinctrl setting
  pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
  riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

 .../bindings/pwm/marvell,pxa-pwm.yaml         |  17 +-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   2 +
 drivers/pwm/Kconfig                           |   2 +-
 drivers/pwm/pwm-pxa.c                         |  14 +-
 6 files changed, 212 insertions(+), 10 deletions(-)

-- 
2.43.0

