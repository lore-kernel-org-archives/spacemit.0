Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028384;
	b=5AoPjjfOUEualALwOlPx8cliJRkkzYr8y/KLGDGsC/kJR5+kwru+WxRJOhOxq8uC3MP2
	 MIBLbBgE/6OxBBjei1WyTKRqQ6rUSeGGj5jcY95OxCIuk745UxLGlWJGj390QK7caqLvX
	 EjB74QXCVZPnsMrKdmA/QCMMgA0CrySyEmXV18Pp/Ox+TnyTJ/G5KS7vNc9Xe3nAJMiE7
	 U8PQfh7OqP042ylCxk7Lx/oLb8rGNeG3bKRY6ihvvVPuEjnWLx2wtLtuidKBV8u0GBUcJ
	 i+d8ZgccPDYGx9VaKvMKuM9vAhjuL7/z8YAlle+T6/jeV4nXMCr3ysUUmRdAG6KrZ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
	b=NGmCskCbtiP0qCpOWI7OKKqsb84BDPQgF7AFcY77jKOFSmO5yIwTH4e1rcAqqlZjNIHu
	 JZrGDlh1T4XSaIHSMUruduR+wJT6Ig/aC+wqPIEIfMBR7DpXZy7YKBBJPUIXw5tr7/aNv
	 yHOjZgdv4cEOf1Xd8/orFFYAVeQ7uWCX0i6gautjoH4jQPvOjG5GFd8ZVPHwwO5ohzMoL
	 l3OsO8QYIsEDGN6LXjNp8kGlWfLXsit/PuL63wBBiaaaVhuYNHMBnmQ3zC0Ta3+Ziht9E
	 QwLCvwarlTWGLZnXTUPF9HqHRUKn5J2EwzGh2jawGKYb5a02+ueBxGJ+fMavA6ZOGhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FaFE5NkC;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1078606A31C
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 18:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1078606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FaFE5NkC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb61185057so11661395e9.1
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795028382; x=1795633182; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
        b=FaFE5NkCGqgbBOGpZXDaOQzlQ66P9QaaQbgvIUwKoQ0GPV69S0t7IIVhFKN7vpxg0m
         Elf/kh9m4/bpqp5qHxFnaRgdjaZ4FeCZrg8Ce7kxiNTPMaCtPXUdIaODeL9fjny3iZuB
         EpMztLuCsVzYlDObxVBbFYbiCYjSZUeePSGkC/HOEhAnO65UTu3HZ+T7G+IHzzhdNPdy
         qfSmU0FN9fFsuHddxWfm22jxbAQ/eT4Ybhi4K+KAs2OZWmEJyHp/rHbK81remp/MAskP
         MwAMd05bJWhAG1djH1ZYDs5UB1NllR66DqgHSqwPMpKSFQkpdKTPcJiOZ84yI0HSo5bf
         zwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028382; x=1795633182;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
        b=F0A0Dv6j6YkWKdhBb9IEGzqSogw+/A/DiVVazSAUbyR0dsMdrK4vdErvRRl4/moP5i
         1CJOOciYqU/Ge3vNpQH99gg+mj37jxg0ksx+XcsJMX+/iQAc9/dDr/BKzQlPuH7bGp4f
         qe58fpGsCVgJxz1rMKweub4uFCr8GyaC0vfdY+X+qMlPxl5UMJgADGuepBArKU2yoX5Z
         zu1bisqGBF4/VPColk0YWjfSs+RngVqFCmeKADKCYIhGaDwuwjVmJtwZQWWyl7N6auAT
         11ZpbYtQULyw6GnBSvm+NTlGGE0SKULsA0hQ0Um8uN7LyIwp0rZWQYYiOI5MmImt7/3D
         ECCg==
X-Forwarded-Encrypted: i=1; AL+hErHr9U/TKE2HSAUG5DosJyQY6VJRwhvATICU08YRyquC+nWvqLAgucW8TqPODuA+1iVGL/1aIiqUlQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/YVxtMMwDPQFHJvV+rq5i7OHOmq+UyztEytb7cgncbCP8ZSZAo
	qRorLjdL9ya96o7mBInpGi5i2FnB9EPf1Y9PKF+WxRJDrLE9CBHJoePM
X-Gm-Gg: AYBFou3BKO/Ic1DJUUgQXXN+YqoipbECGwUA8BjBduoRR9UimV3+7dZRd+j5bu/MXit
	wcuJDD0XUyOKwi+1uOOzUKm8PZd71Jh51I4UzzC2WTKdhYveYIOkrJtgpckRg3MG84s7Ee3SFsj
	pIWj1LdJr/n+h+00Kvh3ai99nN9yRY4FxyztOuhfnZw6uV8bJUXZZsoCo+xfZ1XEdNV3e/yUaI6
	HcJ5CK/xM64JyUq4u422U/RncwkDhDAcTD67a42r4C+qqn9+vRKWr+EgCmPAx5EocqA67Bg2N1a
	/Dmju2yKwQC9jXDmev5wdttTHWv96epjsfmXKkA9nCEMCUnPupMUtcedqQn2P/ryMDT+XEaep0q
	RLKbtdgg9v2BGKTQ0HBaUQaQRgB1Lvnb4rQoSxfqYGiU951ZCLTCXefGqL4Gc2JpVNjENBdZp3h
	4CaA9E1Ls/8+GB9i8qiopnBdG9xqPRNMaCnbmqnFnNfwq4OMi2WRt43lYa8YWRtNHr1D2+DiC5Q
	XwdHbr84EZqKhdqrWWWTqu36y1tTvYvcoPSQaQo7a5DIQGPyVs9LsueRSH8KsivYkOkvEqX9/Gh
	57awc2a2jcNpMtg0TJkUL4bvCK2LFO0IGG302FhRGhYmF8mJHxZKZ1+Zbf7CF7nInex/kdU=
X-Received: by 2002:a05:600c:46c7:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb7da45409mr75914615e9.21.1795028381836;
        Wed, 18 Nov 2026 10:59:41 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm95966965e9.1.2026.11.18.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:59:41 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 18 Nov 2026 19:59:01 +0100
Subject: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WMwQrDIBAFfyXsuZZVq7Q95T9KDhKNWWhi0FZag
 v9e462XBzPwZofkIrkE926H6DIlCmsFcepgnM3qHSNbGQQKjRcuWYiH3Yj57c1Q2Ku8Wa1QT1A
 vW3QTfVruMVSeKb1C/LZ65odtIY5c/YcyZ8hQKq2N5nWx94uh53kMCwyllB/fEJ7+qAAAAA==
X-Change-ID: 20260413-orangepi-gpu-02d839d6506f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Add PowerVR Rogue GPU device node for SpacemiT K1 SoC.

The GPU is integrated within the SoC and enabled by default.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Add PowerVR Rogue GPU (BXE-2-32) device tree node for SpacemiT K1 SoC.

This series depends on:
- Yixun Lan's power domain series [1], which provides the genpd-based
  GPU power domain driver required for proper power sequencing.
- Baihui Liang's dt-bindings patch [2], which adds the spacemit,k1-gpu
  compatible string to the img,powervr-rogue binding.

The GPU firmware is not yet available upstream. A copy can be found
at [3].

With this series applied on top of [1] and [2], the full GPU bring-up
path works end-to-end on hardware:
- Power domain: GPU power island on/off via APMU
- Clock: GPU clock enabled/gated through CCU
- Reset: GPU reset line deasserted
- Firmware: PowerVR RISC-V firmware loads and signals ready
- DMA: dma-ranges correctly maps CPU-to-GPU physical addresses
- DRM: kernel exposes /dev/dri/card0 and /dev/dri/renderD128
- IRQ: GPU interrupt registered, firmware watchdog running

Userspace rendering requires Mesa's PowerVR Vulkan driver
(imagination-experimental).

[1] https://lore.kernel.org/linux-riscv/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com/
[3] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powervr/powervr/rogue_36.29.52.182_v1.fw
---
Changes in v2:
- Removed board-specific enablement (GPU now enabled by default in SoC)
- Simplified commit message as per maintainer feedback
- Dropped redundant status = "disabled" from GPU node
- Link to v1: https://lore.kernel.org/r/20261015-orangepi-gpu-v1-0-03566a615660@gmail.com
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..7f2573d869ca 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/spacemit,k1-power.h>
 
 #include "k1-pdma.h"
 
@@ -1119,6 +1120,16 @@ multimedia-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+
+			gpu: gpu@cac00000 {
+				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
+				reg = <0x0 0xcac00000 0x0 0x80000>;
+				interrupts = <75>;
+				clocks = <&syscon_apmu CLK_GPU>;
+				clock-names = "core";
+				resets = <&syscon_apmu RESET_GPU>;
+				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
+			};
 		};
 
 		network-bus {

---
base-commit: be95fa81c04dd67616faaa2872babb9ac39d4251
change-id: 20260413-orangepi-gpu-02d839d6506f

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

