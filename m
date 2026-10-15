Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5150C55820C
	for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090605; cv=none; b=rBFJr4gmZ3LKTtMwg1LgHBncwqB6V2hAl+9XxncPpiO1oKbZtc+5F6WIfClMiDAiFHnL0X4CgW4YRl9S76w4gDDaB8eP1rV9styImaksyUEMEE5zOJ5ptIos1JQq9IJeZfYM41tB34CmW7cJn9obfrVa2v4zUcerClsRK/FK3/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090605; c=relaxed/simple;
	bh=WfTIScce4+xOI3ZOn4jbGBOjmSx07uEqCRWoRnAARnM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eNcR+Cp/UZe2vFmq9IbgKf/xyXtbsHNOMjTKMsChAbz67TO35/MtKO/AR2vPlcd2zl/126LZk6ceQ1wCIavXIrM5ptN7bCPX7H5+uyN+RaN0OuBUgwELOQA05T6JbFdMB7N3+0rE0BCoNhgkulIQttN7hLLj7TryHfqdjqq55Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTmVBFoZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTmVBFoZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ff680331aso27495505e9.3
        for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090589; x=1792695389; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WFz+OPWq9luKuBDqe0uuJVjFv3DbmqRC69UJmoS/3w4=;
        b=hTmVBFoZRDvwEipQeRdWEyQCVFLzBpqseoN7MVoAW3i2nhb+SG45s6rpFbH8aJzbFl
         FQU3NiCCiokYYEV2fG3ErcLbadaOGijCWWzOkPHoESSuyM19EmxdTwokevqL8uVBUN4v
         L7sq1m/mszRorhKyxpjZQe3Kmkk3WoYIJdZGJUS81si90IN9fYoudMnTwbn/mrEo/35e
         IQO0P8NGVLWd0h+TEPq0TP9kxse1j18zRkbh0xqatZJHXgZxz5DRn7rWcIx9fMZvR973
         /ihzGuepSwULzoNpIDz2s/KyU3vouR6ZKCuRtwoHPj6HY35+9mHGW3mQKFvZKzjrfBmd
         y89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090589; x=1792695389;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WFz+OPWq9luKuBDqe0uuJVjFv3DbmqRC69UJmoS/3w4=;
        b=XFkX91XcC0nMrADt1bLBTZ/kNMJ4xZ6Hq9jBCm8j1XwxgNdpr3xRGVKqwK6MNoJiB+
         SHGbmU6jXDaTBJDSPiAjBS2et8wMPC3yx6POyzBd/VqXVEypxcq/77gvcrgyw0qldep6
         7MgAcv4yCQfPkUZddu5DlGUdiVC265h+80HP34/6PjqJ7btMCoNBLn7Z/z4Bw6pcsspW
         jSCot3yihGMFNZ1Ik2wqJsc9494Um+rXSiwPXWt8DMKq/wQXC+xX5E3nX/ZxdZcbU+UC
         9DHzFAViovf6Sexe5menBHij0I5pshIWSKqH6tn7ubSMnHvgtymc+dmZAQJypRWxl1my
         QgXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdH0kMmNyz3A7+wvwmA7+n0KXdTDeWzrNWvTfAg6ZO0UFiTbNyCHfLzDRN5dQNf4VK+k2dL22thw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ1ZjQCHUhZ4ZsSHD7/QFTf+lUqRd+yusublijlPRdsgREpqWG3
	neqD6dqkIdEuwpTtiSZQq7SDZLa8S1QIya5fsPggLIwbBaNZ6EgAzFn7
X-Gm-Gg: AYBFou3EA1NvsdWoJ7sA2Bx8c43lLv9VMqfN/PrSHnhzCofBtnxFGpi2njDQE5wb5Uv
	CjdG4aJnIeILBbXES3rXVv6sgQbMDid87A6l4osS0JCtwYJkCefDi6xwqcyDsKGyEUOBl2N/nT5
	Ge/KoqsAbIPW/olK9Vf4OyHFKQKANsU++rgHBDqu0WYoKZT2fm9K2gsIX6YZ66A0GDad6bKoCiW
	3X5TCJ1yBK1JO3QvlPWGpyT6AbZOoUsQB4Uvrdx8w7Ta2N6ezmGzMLcOxECMhObmCgBxTEKGL6R
	6OUKtyescLjF/4HsCLxRysIfrY6qaeAaLlsQSamZqWtFJEybWd7mUIq2W16+MpXOtik2rkjlocC
	kk8JfFJjl5nfTm3lwluJHtiVmGNT4lZH4Q7q9NjeQ29sRwlokTExHZLxQ766DIgfo2Lht/CYs6E
	yXczH+/dePOtKnRJstj2b1BRSn//sjZ56TuTs0pi5KeEWRrp5VTztPYWkDqYSwhALNP+YYZiSF2
	AcZkQ49wAsX5kDN4bzHrnawmyl1ubutv38ust0H2Q==
X-Received: by 2002:a05:600c:3144:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a18e48d362mr400641705e9.15.1792090589045;
        Thu, 15 Oct 2026 11:56:29 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:28 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH RFC 0/2] riscv: dts: spacemit: Enable PowerVR GPU on
 OrangePi RV2
Date: Thu, 15 Oct 2026 20:56:04 +0200
Message-Id: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nj3fwikGhBpm56QamugVGKhbFlipmpgVmaElBLQVFqWmYF2LhopSA
 3Z6XY2loAe3MpI2MAAAA=
X-Change-ID: 20260413-orangepi-gpu-02d839d6506f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Enable the Imagination PowerVR Rogue GPU (BXE-2-32) on the SpacemiT K1
SoC for the OrangePi RV2 board.

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
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powervr/powervr/rogue_36.29.52.182_v1.fw

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Iker Pedrosa (2):
      riscv: dts: spacemit: k1: add PowerVR GPU device node
      riscv: dts: spacemit: k1-orangepi-rv2: enable GPU

 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  4 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: 7e986b457d43edf8dd3eb3f6c34e55e92cd545f3
change-id: 20260413-orangepi-gpu-02d839d6506f

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

