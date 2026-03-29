Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489A2FFF9D
	for <spacemit@lists.linux.dev>; Sun, 29 Mar 2026 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781138; cv=none; b=fyhgFNv3hVySGdKP1JXs05fXiHHsu9YXMd5OZ/aWZnWsYwWoiSgSR/XzTQDBlhSsalRKm98IHAwS6+nysCfYgJ5Od+LbWLn4KLYVmC0ja6ytvLVReC428xsTk/Q/EuXLi9XnxKVUATzsHOdKhncCLr1lzIEJC4OhHjJY7nzgzGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781138; c=relaxed/simple;
	bh=Nt5+AShi6KSw8qm8QneGXWAkXR9kja5xtq+Gswryy9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yk0PbbeWSYLlmPUOZ7l7iTloq+DLhFaQhp/JK5dcTZ7qjukzYBjmhLhTn2y2lLQ9gkY83zPA2QRijC/mALZAEPPYpYlrjK4OOpWvefhjNvHVYqMjntKHiMLrbalaVMl5B6RRltlNxrwPJRVRX5EXE4Pa1K0IDuRQAwe/RbW/klo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkRkyjX1; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkRkyjX1"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2b0603ee486so21522955ad.0
        for <spacemit@lists.linux.dev>; Sun, 29 Mar 2026 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774781137; x=1775385937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OuCLPjsEadPOUVMbfsmJNhO61+7qHRvYnI6+IDoFMc=;
        b=rkRkyjX1axPkUIYfzCrwl3P2d24KyX9nExEHXA84L6/g/2us759eX/qMm5bnMp9BU5
         sW9TeJzC8mIUogCIcwOOzdSOOpbSuccDVM6cKvc75tR8wneFjlmBfJgF7iyjcopbPgA+
         Rq3gfjd7TSF6bSxmbS+QxNYBRG0XRVOxw2nKuPCs4Y0M/qG9aOpW0UIRKd91qDTZeN52
         kxs6LbB++l4s1zaO9nhTesf4e1d0D9IiQN1vv70ENG3zURSALxwxue2FZm6alJYm+NF8
         s4rjZSU5/xKzlP8KO2CqtPDFClHuF72WbzPcVEPJq9hCIW+w1Wc/LfmDmrbLvRRbM3or
         Jwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781137; x=1775385937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1OuCLPjsEadPOUVMbfsmJNhO61+7qHRvYnI6+IDoFMc=;
        b=RjsKBeA53a+NF8Ah7uxsnNVrk/H/CdTe7AO8etuqWzaaoAos7z2sxYsuuD1eeCD0v9
         LgAhSLR7E6x5Oj7M9qtSfLVGQUKLt2+DhVHZtlBlJGI1Yp6vRLLoYbZ20yphiJ24QSpX
         QgVFf5958c03yXhVDgTf7iEV1pM60h+fXFFgY4Q7C2OVmvqcznElKGlSiuIVhUWyhNSl
         MfFFKu+zehecktnzm9ADY1gz1MdEDIZfNiFmYs/sPU/SWe10PLF7A2z0RrC0rb0/AU+O
         i1TlnN5e4khCoUaDTc0dbhJMEtjxmaBaoEhg3UoAxiA+HEE5xuRx896T/Ahi/9yZb9S+
         HWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM63Tq7K2u62rOJPTcNDXe7qkKIpkj2jY/8tyBMY6Ch9nAyH5J02FSQ2EAD/6R+7S/AMzvgYxqtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZdSU0i0Gm5kQo5b6sXd+HUH/huerYgzkuyB7duGxkRkFaBbC4
	pDbY0G209aEh1TFWILns+ifmaKJKdwdzN+beq3mchh0zVHUPM4/VIyZG
X-Gm-Gg: ATEYQzzHCmMsgeIVlxq9gYhs+SRbIeaXKTWmMbhsJre8yQom5Thm9ONYcBeCMtNWspA
	dYK6z5eiKW3jAAwI0+ec8QKzdwy6PqaGg+/HcVBQRpnr9fE0YPuQGgVL9YaHnZSjLY/wI00i1DG
	/KQvy0lEawpueFrLvkTC0x4sjP5QLjZaOSOgx3YTdDXQj5IFLEu5v4Geoq3oBUbHjnUdkMVw1SJ
	L4wLqMIfAqLxDRX2SE+nFUVciZMlbvNJxfLspVamZH6ldu1uv0mcwOw9jN3/rV/LBvmGiCijcG4
	T+REoR+qShAjQ28JkLCIqHKtdhIvQBSwZaYhcaeA7Gnw5NvOP8qfK8MXp2pJoj+uVTvWH9HnC/V
	i1CkFlYGsO621BXDrDDiLkrAXYUkgnT1nZ3T3nlo7BMuTayBCtLrzEoMFqC/KMwKTSeNatWlwBt
	+/7wP+RA3SU832BZGLl8F69M5fe11v24Ex
X-Received: by 2002:a17:903:2f82:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b2497e4b68mr29510625ad.8.1774781136332;
        Sun, 29 Mar 2026 03:45:36 -0700 (PDT)
Received: from localhost.localdomain ([1.203.66.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265e7basm57611035ad.21.2026.03.29.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:45:35 -0700 (PDT)
From: Gong Shuai <gsh517025@gmail.com>
To: shuweiwoo@163.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lukasz.luba@arm.com,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rafael@kernel.org,
	robh@kernel.org,
	rui.zhang@intel.com,
	spacemit@lists.linux.dev,
	gsh517025@gmail.com
Subject: Re: [PATCH v3 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC thermal sensor
Date: Sun, 29 Mar 2026 18:45:07 +0800
Message-ID: <20260329104507.4101836-1-gsh517025@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Shuwei,

> Introduce support for the on-die thermal sensor found
> on the SpacemiT K1 SoC.
> 
> Include the device tree binding documentation in YAML format, the
> thermal sensor driver implementation, and the device tree changes to
> enable the sensor on K1 SoC.
> 
> ---
> Changes in v3:
> - Fix indentation and variable types
> - Simplify clock management and redundant assignments
> - Link to v2: https://lore.kernel.org/r/20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com
> 
> Changes in v2:
> - Move driver to drivers/thermal/spacemit/ and update Kconfig/Makefile
> - Address reviewer feedback on style and structure
> - Improve variable naming and comments
> - Link to v1: https://lore.kernel.org/r/20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com
> 
> ---
> Shuwei Wu (3):
>       dt-bindings: thermal: Add SpacemiT K1 thermal sensor
>       thermal: spacemit: k1: Add thermal sensor support
>       riscv: dts: spacemit: Add thermal sensor for K1 SoC
> 
>  .../bindings/thermal/spacemit,k1-tsensor.yaml      |  76 ++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 101 ++++++++
>  drivers/thermal/Kconfig                            |   2 +
>  drivers/thermal/Makefile                           |   1 +
>  drivers/thermal/spacemit/Kconfig                   |  19 ++
>  drivers/thermal/spacemit/Makefile                  |   3 +
>  drivers/thermal/spacemit/k1_tsensor.c              | 281 +++++++++++++++++++++
>  7 files changed, 483 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251215-patchv2-k1-thermal-5ffb838fc1cc
> 
> Best regards,
> -- 
> Shuwei Wu <shuweiwoo@163.com>

This patch series works well on OrangePi-RV2 with mainline kernel 7.0.0-rc5

$ cat /sys/class/thermal/thermal_zone*/type
soc-thermal
package-thermal
gpu-thermal
cluster0-thermal
cluster1-thermal
$ cat /sys/class/thermal/thermal_zone*/temp
35000
37000
36000
36000
37000
$ sensors
cluster1_thermal-virtual-0
Adapter: Virtual device
temp1:        +38.0 C

gpu_thermal-virtual-0
Adapter: Virtual device
temp1:        +36.0 C

soc_thermal-virtual-0
Adapter: Virtual device
temp1:        +36.0 C

cluster0_thermal-virtual-0
Adapter: Virtual device
temp1:        +37.0 C

package_thermal-virtual-0
Adapter: Virtual device
temp1:        +37.0 C


Tested-by: Gong Shuai <gsh517025@gmail.com>

Thanks.
