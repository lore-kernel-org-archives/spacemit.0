Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833965;
	b=qtiBWyuiK3dutmdGdP6ekOT8xhe+9gYWBwwWxVJQQ3UljpH/MQU1WOj6Mi8ts+EqYHE7
	 3vEtwVkfiqDj+0guowDtolEfubgcEHRwOHdahyMdfIDKg28PwFo1md4GN9lyT7hMi1X/t
	 wPtSkjZj7O+UjKov3X8dOtmceWA764qH8wy16X6utvNx9aHjmnUG5SWhF05PSGLNUUFqS
	 wFDBDKGMFDKv49ZN6YbLvxczYgT4HgLTv0falp4WaPvvx5gaXtXlzcKlbHaGD/cbcMnsJ
	 uUMLEjnFOb5PkRz9MzyYXv6sHDahY7Z61zm/v3DCt2v7MK8HxZfucwCIv22Y0quq3Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
	b=uFQ8a+xTBWD8FTSUuKHdXUaF6rhPWcsYz78/GR60X7uA9zulWbVyLRPe3wovGK84QpU7
	 dQZ9LmKCxPXVhEnmKhL/TpTrJ9CqU7f2CKH4zNl9eSLQ/p0wNp2ZD8fnIBduvW5b7de1Z
	 ffgj3N8nCiW/9EmuaB/LHzkNsyxgyFLmniZAnnT900Xlma4pdYbkUmrsKWaovF2yUOiBc
	 wjCEw2ckXg9Oy0Bb3O5k3EozBqLEP8qVea+uptc8ivQ6eKYGslWJEuBLoA1NI1knKj4kP
	 ZeXTIVEuae8/8+kMNFkRPqSVgN7HF1+//NrCjnN2k4jDROHPjaMLxloqygFRDeOPGhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h4Qxfkuf;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37915606A31B
	for <spacemit@lists.linux.dev>; Sat, 24 Oct 2026 09:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37915606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h4Qxfkuf
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b3c37877so945261a91.0
        for <spacemit@lists.linux.dev>; Sat, 24 Oct 2026 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833964; x=1793438764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=h4Qxfkuff2W4pfRtwk0wM9atfCBOaKn+d60jsjEpRiuTzRwMtavgXIeYHFvd+C/qhy
         +ix/bVvqSc5fqdWU2LQWgOANGIil8qCsvSxzvj7rB0WzgCVKPiszPV+7gymBTf2RBr0W
         zCF58CW4WsQwxpR2EjuEECqcYtD6aUIiG4lRb7zQF+KG0kYeuaezANJD250kaEwfHoTo
         8W81DirrgX7dJJzV2wxmU2LuNHKu1ibUrqWnZbNKcb2E7iA+uW9aNQnXvWSmgmgN+PcI
         wfcnM+KwSIv04i7mFhTvcioAJ4I8r+1g4rhdWfWMsyIPmlTpg2PQREwrFAwiEdMct6Rg
         TzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833964; x=1793438764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=eavs6q6V7zQ4g9JasYKAj4yj19xfrXPgFIHSshEwXVjlnBQWyo0lNj7VDzl1hZEzRv
         3lSZSB5pF5Xui5vF5oU+hyqIMA+m/v0DpxLt4gZT0zwtDFy/x5xXzif9vYHbNRkLOCuE
         BN3Ma6V6Uddu/oM5GrVXNxm/aRtw4yvWwYhrQfypBWhE5UxbztqSgHfbI3gQ8VrLw4mw
         fLLSU8yVX8kQUS2B1Njvy7dpjoeXVXi3vtBsFi+G0XZKj3zwuAou6Z7SgmUqjYVwzNdr
         Da9IbF/FA3SObgFsSTLEc3TAP/iRlbIPYTwXNIvjFxdVP5CxDFv/oiL/M9DA6a6z/gs4
         0QXw==
X-Forwarded-Encrypted: i=1; AKwUvBzP1MJAAr+bwMMIUPOHJQDsHtfA4O7LxM2nhCXQ1urR+WquxrRIg+/RvtPG+eROOns7bXs+ZOSoRA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIT4ZIpkX47XO9vLekJztDdPYkwcPxEC+Da0/XqrJy778fhR2qM
	4wqAKljIcVqSA+w0JYD+Hig2TfdMgBLXwUf2cDRK062Kb9dEyVT9MRiC
X-Gm-Gg: AYBFou2wRuRwrTcoyn2bA0lubXxtWs/6UZe9bkmT9t5VS3XAsdOfSWuQWXBn/0Z+avy
	yX/Xmmx6x3l3AfnTjaU6smCVYQWFJWdO4xn6OCDQqWJB5wrz+6givoMld7uO/o+p/4IN/rUQ+OL
	ahk8XG2rpoiIaQvW9xFIiNhX/bAK/HiKVr6kmd7gCOI3QIXflvifz9OSU8QT5Zm5tJD+cP2TI7s
	SoMClyHLDKx2S+UlJdP+TVTuhwFI6LCst2PfnhP3FU/k+nL3nsx4xGVI1FhvafhBp+RAFWJQtkb
	2a8eHysUL+6Tksb9mvVLNzJUl77G9Z/F8dKXKbFG8uCmByrq2+/GvRQmltTTUGwPfBWBbfTbHJW
	+3Bmd09V7/IQ65evluSLCgV0nTs+m/7IKysE3izyH8Xr0yPLS8wonzPRogo6vniDiFFC7E6tfAT
	MmHEiU2sJ+QBtP8hklSFH0J4Gi9N0Bby+Ah29E56O21tIfUeiKySz9njmEKbs2gti/Y/MlqNZW4
	H5T5cFS5nAT+aE+PEakl/lpd8gZUqraMf4e1qfhdLNcVSgRJKmZ9NDMV39QQ+MHA7kJ6g19drj+
	/dBFAQGlp9HoF1jVGfNg0A79a7qToECxjeyHVHGfffPdZYkfofS4JPEJstLBgtKAAMhYnYMZ+QD
	Pcacnq8T3oabW599RX+IY2K0wHBCOHZRx/BY=
X-Received: by 2002:a17:90b:5823:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adeae7644emr1496748a91.32.1792833964552;
        Sat, 24 Oct 2026 02:26:04 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:03 -0700 (PDT)
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
Subject: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:56 +0800
Message-ID: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
that stage sets up DRAM. This series marks the nodes it needs for that
bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
the PMIC rails and the SPI NOR in the board files.

The vendor confirmed that the BootROM itself does not access the
EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
sets up SDRAM, and DRAM cannot be trained without it.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series.

I used Claude to help read the U-Boot SPL and the device trees. I
checked the changes and ran dtbs_check myself.

Changes in v3:
- Reword both commit messages to describe the hardware instead of what
  an SPL does, and drop the U-Boot paragraph from patch 1 (E)
- Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
- Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
- Drop the Assisted-by tags, see commit 1e035297ffda
- Keep E's Reviewed-by on both patches, as the changes are the ones
  discussed on v2
- Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
 7 files changed, 47 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

