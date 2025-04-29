Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE83279347
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916673; cv=none; b=AFThFm7S8o7LYCopy540e356kIg1iqTT2OPMNl76lN1JUNBmINxClaaX1clPdNH5gl3cPW3uUBpLnQKiOv0aMn9+x2G4o0i28eBkVVvfEr4S1LH+DYQW4mWtZ8gli8qnO9gO173WlSoglhu944mpFwxBGtVHZU7yj1yH6zU/U7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916673; c=relaxed/simple;
	bh=YsDFhu4HcEnff3t1qXe/L3ejyCjNlMTtIe/MIcb0h08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOY4jdhTexkgkPBsWwGdXjgPS7Tc2gWInnnz5hu5jVgGLo58uulD45SQF69KfNh01VcA2PwyhNvIiJD07weMV3vxBUOaYD9ogRnB1ydb4zg/dqlskCqKW0GyBjBwZCh/zBoOQljrRou+uRIgqPhZlHMSh3u9ewk8vawjrAoCelc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=N+m7NJ/v; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="N+m7NJ/v"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736bfa487c3so4706273b3a.1
        for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916671; x=1746521471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YxwsaEgj+Q0Omu+vZ1eyC37eLFX1X+cgZiMPV4Vs2Kw=;
        b=N+m7NJ/vR3qcygRpQsSI78B6ykLJeZoUqGbZCf9omF5HHq1pM5gJ3T3Hjr09ehel8R
         iRnO9snA4MNhDtQi06GjuKXuONOWDs2PVLEkxoXU/Zz/wtQad/zVDxoC4E5yzif/9nO7
         vw+W0z5Z0aUf5eNEHE/VDwzTTWrRaI2o+Y8HK9Krz+bTzPHzmEoVzCmoJo8rujIBlBsR
         Od57wCz4ozSA4xSGqtwxM1FQgcOBDd6uH2GN56S+eQCIreq2ACKX/v7ePq7Li4RR3zdw
         7GGFSIqoucFK+XDHGjo1x/LjWh2y6Rk0QDABPcsAUqcmvo9kCEOE30d/5nsSbMB9z1Um
         nbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916671; x=1746521471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxwsaEgj+Q0Omu+vZ1eyC37eLFX1X+cgZiMPV4Vs2Kw=;
        b=YPZxz1jAcs5nH8F6hi+9VW3dgQCh/P9yPrXcMiz7P2aUSUQDSc8SvCpN3djCvIouyy
         HtNJLMFTwKY+p0rIzbK+Wjw8iwNB3tRLOZYjN40d+ytIQn1+tU0wznl6dNacchQGXT9U
         +xq/5Yzi1JHZMI7sJbeBthPooYa6ZX3KfP74uTvrAZJ7Or42lrqNeOWonya46zvyA6Fi
         fMPBBoSPaOL2MochOew5JkuzLCRRhaSDH5NPF9AwnEHIlFgixdKjBUmsjimePM5xwI3o
         BUA8beaYvpYCR8YZ/iOA5DOkGVYCOjkqJpKLYO5D6jrwtjwlVlH0OMBc66fW0N329x1i
         bNZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt5swS9XjLeP6Qi5gO5h5u665WnAz3oWCeAmrRYl6h5uDY7D1TpYxyc7Q5QBd3VV7NrE8lCudXVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhcIGdUo7kfeqwM5yfmC8diH8ijNuIciWxoTYoVxtvhGKkBy9r
	YXJnHRRE/fTb/KaEKgAbV/3e9vsLbjMWjO4HeCadsnhl9Djmxe1SVdikY+czV+o=
X-Gm-Gg: ASbGncuaTF/CfaBjwWXa3BzJJZlfcKCuKGfJBHGAXktBH06zizcoIQAlqCx9wVE7msU
	7hECTkj/c1UqpIFYG0ahPkh2rfoHkk691t17uCA1e7fi7ji0stiISVDNkipLqx8tYRNB/2rSEwf
	4pZlqGcH9WXtzlQ++pjcs9cu+l7bFXhW3IlzILKSxEvTthhmJi/rZX+rXdNQHJpzCOAFAKplCyy
	11h7r9DzqW6DgLJNpetibmGdPHiI2nX/l2zlVK3uQ4Y0qVxXSs+z7UjDloCd9bzhIqHgRFRIepK
	Yw1/idal5rsfoLDdnhVz8YgGyP2nCXpx8gQyZcgc4+/32JN2dhpqVthWJsUcXJR6DCWf6BphXwW
	Ks4fQJ4ndEIMhfdQ=
X-Google-Smtp-Source: AGHT+IEctMKqKIxfKHwBx6+1Ghb0+9YYYgqcw8OVqlt6Q6s6LPNYwZUXZToj5U3b66+aQrGv2/impw==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:93cd:59b5 with SMTP id adf61e73a8af0-2046a646f3cmr19836662637.28.1745916671308;
        Tue, 29 Apr 2025 01:51:11 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:10 -0700 (PDT)
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
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Tue, 29 Apr 2025 16:50:42 +0800
Message-ID: <20250429085048.1310409-1-guodong@riscstar.com>
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
patch 7 of the v1 series, with modification of pwms property to 4-cell
format to match updated binding (#pwm-cells = <3>) since v3.

+		pwms = <&pwm14 0 2000 0>;

This patchset is based on [spacemit/for-next]
  base: https://github.com/spacemit-com/linux for-next

Plus the following dependencies:
1. Clock controller driver, posted by Heylen Chu (v8), with most of it has
   been accepted:
https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
2. Reset controller driver, posted by Alex Elder (v5):
https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com/

Major differences between v3 and v2:
 - Patch 1:
    - Added: Reviewed-by: Rob Herring (Arm) <robh@kernel.org> # v2.
    - When compatible string contains "spacemit,k1-pwm",
      #pwm-cells must be 3.
 - Patch 2:
    - Dropped the addition of a reset_control field to struct pxa_pwm_chip.
    - Using a local variable in pwm_probe() instead.
 - Patch 3:
    - In k1.dtsi, changed #pwm-cells = <1> to <3>.

Major differences between v2 and v1:
 - Dropped the addition of spacemit,k1-pwm as a compatible string in the
   PWM_PXA driver; instead, it now falls back to marvell,pxa910-pwm.
 - Removed pinctrl settings for all PWM nodes (pwm0-pwm14); only the
   pwm14_1 configuration is included in this version.
 - Changed PWM_PXA from built-in to a loadable module (=m) in the
   riscv defconfig.

v2 consists of the following patches:
Patch 1: Add spacemit,k1-pwm compatible string (with fallback to
           marvell,pxa910-pwm) and support optional resets property.
Patch 2: Add reset controller support to the PWM_PXA driver.
Patch 3: Add device tree nodes for all 20 PWM instances on K1.
Patch 4: Add pinctrl settings for PWM14.
Patch 5: Add ARCH_SPACEMIT dependency to the PWM_PXA Kconfig entry.
Patch 6: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.

v2:
https://lore.kernel.org/all/20250420070251.378950-1-guodong@riscstar.com/

v1:
https://lore.kernel.org/all/20250411131423.3802611-1-guodong@riscstar.com/

Best regards,
Guodong Xu

Guodong Xu (6):
  dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
  pwm: pxa: add optional reset control
  riscv: dts: spacemit: add PWM support for K1 SoC
  riscv: dts: spacemit: add pwm14_1 pinctrl setting
  pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
  riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

 .../bindings/pwm/marvell,pxa-pwm.yaml         |  35 +++-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   2 +
 drivers/pwm/Kconfig                           |   2 +-
 drivers/pwm/pwm-pxa.c                         |   7 +
 6 files changed, 225 insertions(+), 8 deletions(-)


base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
prerequisite-patch-id: a5d2fb43fd88525fa6c8ee767c31adfee87f1012
prerequisite-patch-id: 8a8d0eefd0b4423d87f3c093b451a0fa60622ec4
prerequisite-patch-id: 30f92f93e5b3577bde61424303f21c709a715ec5
prerequisite-patch-id: d774b8281b5c6a822445365ee94925e1ab6c7a93
prerequisite-patch-id: 54a4f5d065eb9f212fd99efec6e7e06abbb9bad8
prerequisite-patch-id: 93962be60d1b58a98d947edf51b4af9edf513785
prerequisite-patch-id: 5f53f8bf16fb067628092daebc4831293261aa01
-- 
2.43.0

