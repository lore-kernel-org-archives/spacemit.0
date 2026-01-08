Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C88F4792E2
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882176; cv=none; b=rTwFEoGKHB/+S1WihWvAkG5Cofdm+9+NrtB4h3D9boNvxTARpODgjmpLpxPK3js+N7Xu0OgiOy0/4VnP1SRJj2EPAyNBC4zWasQ3uKZrHpEqszMW/PQmLnxJq1wYBlP/Q5nfJbBn/oeZx78hsoCPhsNqncnkuNre02xbXjqbhuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882176; c=relaxed/simple;
	bh=TZxwBPZMwUwAZyBoR4nzSuYjLpKcgODqlH52ROD/x78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MnJZpjl5yoRfbdJGTMm+PCIrUyqOLtwgg0yF2WvqiUokelzJ20xhfFLbV2PEvG5zccVu6tgHggPmw9q519Q6buqfG6jlIROfXPfo4bL2Cftm+U8xsRCCrSYkPb+hSyF/I+7vw+vdCJIwAdTKtpKnzM13YgYxQbXjZuRCbDsBURM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3WpC95pD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3WpC95pD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso2370355b3a.3
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 06:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767882173; x=1768486973; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vG0owjBEwvZUXN6LOKfNDq1Vj4x+0iuwUy6IyITQKNQ=;
        b=3WpC95pDrj9qDcHFsbWAkFjEMqIfXYWxhvQAVXTC7Ug0OYvlyyRg+Bzc/sbm0d5gYU
         0q1G3X8gZY5peAse92JFDseQUBERnfRBV+qmLMrJ5FCvSiZQ7DJwmuZQuLE2vkhgDWfq
         UGVOfR6SKx4aje08sg3J0prWbFCoJcfV+rPtSOxbU4Uhk6ktBdUk+sv+xI8ri1QFmB/x
         WY9UP3FoGLHyJGNlOFrmj3qfUt2bxYMwpt2I5Ju3ElWri6DzfRllWE+GXqh7vXebncuU
         0W4247OtxigpnA/4ILaLaq/zkbKcgPDpUG9v2l2Z3qWdB7Q67e7ugXYf1PeDi4WS5eEB
         nxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882173; x=1768486973;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG0owjBEwvZUXN6LOKfNDq1Vj4x+0iuwUy6IyITQKNQ=;
        b=O9NDzM62aRNy9pXiSTsHwJ18hjwRM6TkJmrdvZ/OcTiLzX7eGwAKpu55DTUg8MbBqF
         ZW0XBq1zQEERmsHveBhIscC20baG8epPi1j0NmsVi0o8AFq7rF0oA8905VDu6hQFWxnP
         /Pi0wc156SGUlZMoga8bamxH7qkMMc2P33TOdqTD7epvLhWh5j9gJz/6UoMpTvaeFKQW
         5sLBAQ2dofdRcfBXJdgpACVJlrLELCSjJceDcIi1Kx4e+awYvPh7qSkY6VNw3ZK0UGS5
         1X7pE5jesPCPGUuNYbdMZnLPmNtncOkmS5+9vNjQelrqbXAxVfeRYTR+2eHkPVAnEK79
         pOHA==
X-Forwarded-Encrypted: i=1; AJvYcCVne5MsAhhYEK17rIECsnvvbeRxOhfBM3TzrjN+IgreoibNf3T1tBZRhiEU3h3jhTJp6tKOsOtRCw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4yNIXpXVDiukVMugIDQ6APJzD3U1M3BlknoRTpt8mpT/eqzxC
	C/Q3mBQqrAZBmzDbS+WvhZm2raMt9ePx+deycGMmrYN3SStvoi2jVBScEMKQD8EVVzA=
X-Gm-Gg: AY/fxX714xYHulFqOldhuh03p30HFq693OPwfUwQgSoXAyvRsOnvKTINnPwehioclei
	OdkvHAgHtTtt5hwxyLNZHFVoG02+FhCSP15mycDekybxVsfjnsNYyjnbF2X3fm66uLRENMdYLAI
	e9v9AFSU7zTT7sx2GysdxeSQu5Ur35asMpfcb+EWyt/EKJDOUJw/L5S64Kkb4f4AOdPhWxcpJYL
	zGwpTfQ8FkgjhmkEemr1X83159qs1weaefjXEHz6f8IIGeQRsPuAUWeom2/GeiAlfC62073t8aM
	vgRrcIohPDQeyy8nl+DLwFcOo3L81UuRIohSg0H02YfyLL2hkbaIbKnrDWD7AZBnwrN0ok1nHZV
	gGm/GZZCtqZpEaItKzhOEZLo6PSokFoOIgiq9+th+2JrftXosSJX2FrHuNDT6YXXNMmuzuLfqpL
	QiI91wiiqnc8sVoUki3dWII3a9M+9Xq3k=
X-Google-Smtp-Source: AGHT+IGhx3A/wj4Hk+582JwjqSFzDkdpdx1sot8ZL2RVpGltKUxE6QM8Lk2cKloIC492Mbf2xP4Tng==
X-Received: by 2002:a05:6a00:8c10:b0:7c2:60c6:8ca0 with SMTP id d2e1a72fcca58-81b7e92875emr4959062b3a.5.1767882173412;
        Thu, 08 Jan 2026 06:22:53 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm7927906b3a.53.2026.01.08.06.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:22:52 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
Date: Thu, 08 Jan 2026 22:22:13 +0800
Message-Id: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJW9X2kC/32QzW6EMAyEXwXlXKM4hJ+gqtr3qPYQEgPRLqRNK
 Gq14t0b4LaVehzL89kzDxYpOIqszR4s0Oqi83MS4iVjZtTzQOBs0kxwUaIQCm4FBIq0QGNVV5d
 IfaGQpfWPQL37PlDv11MH+vxKxOUcsoli1AexzV5PICqOokGVS8lVLQDBzd6MTk/6Mkza3XPjp
 7cd/2yuOPIGeAU3BHO/Qdqb/AyrBA6dtn1VlEoVtrgMNC/e5z4M/3BSqh2ylskthUbsaqlt2Ty
 7Ox3pOOWWNlurHBUEI9med3Rx8eHnaHLFI/Df0lZMB8hqXsu6s5TeCy6auOiwB2XXbdt+AWxYk
 mmTAQAA
X-Change-ID: 20251229-k3-reset-8d9b751ef391
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

This series adds support for the reset controller found on the SpacemiT
K3 SoC.

The K3 reset controller shares the same architecture as the K1. To
facilitate support for both and future SoCs, the existing K1 reset
driver is refactored with the following changes:

1. The existing K1 driver is moved to a dedicated 'drivers/reset/spacemit/'
   directory.
2. Common reset operations are extracted into reset-spacemit-common.{c,h}

The K3 driver is implemented using this common infrastructure.

This patchset is based on v6.19-rc4 and depends on the K3 clock drirver
patchset [3] and the K1 common clock work [2] and [1]:

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/lkml/20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org/ [2]
Link: https://lore.kernel.org/lkml/20260108-k3-clk-v5-0-42a11b74ad58@gentoo.org/ [3]
Link: https://lore.kernel.org/all/cc1cb833-2c4a-4e20-a50d-109a4919e274@riscstar.com/ [4]

Changes in v2:
 - Patch 1:
     Update the commit message to explain the why.
     Update the spacemit,k1-syscon.yaml to point to k3 reset IDs
     header file.
 - Patch 3:
     Use dev->driver->owner for the reset controller owner instead of
     THIS_MODULE to fix the module reference counting issue pointed out
     by Krzysztof Kozlowski.
 - Patch 3 and 4:
     Update the K1_AUX_DEV_ID and K3_AUX_DEV_ID macros to a simpler but direct
     form, one benefit is to improve the code readability. More discussion
     can be found in Link [4].
Link to v1: https://lore.kernel.org/r/20251229-k3-reset-v1-0-eda0747bded3@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      dt-bindings: soc: spacemit: Add K3 reset support and IDs
      reset: Create subdirectory for SpacemiT drivers
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/spacemit/Kconfig                     |  36 ++++
 drivers/reset/spacemit/Makefile                    |   6 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  77 +++++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++++
 .../reset-spacemit-k1.c}                           | 107 +---------
 drivers/reset/spacemit/reset-spacemit-k3.c         | 233 +++++++++++++++++++++
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++
 10 files changed, 584 insertions(+), 110 deletions(-)
---
base-commit: f10c325a345fef0a688a2bcdfab1540d1c924148
change-id: 20251229-k3-reset-8d9b751ef391
prerequisite-message-id: <20251219012819.440972-1-inochiama@gmail.com>
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474
prerequisite-message-id: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
prerequisite-patch-id: 96cd13293b888c05f400daf529c3cacf17ddf002
prerequisite-patch-id: 5f6579799919c4e2e12c8c836ac4164b00ccaaa3
prerequisite-patch-id: 11e8d5cbe6f3610aa362dc0051b3173001d0a5f4
prerequisite-patch-id: 622d6606913609be04f66006609550e8c3e7f22b
prerequisite-message-id: <20260108-k3-clk-v5-0-42a11b74ad58@gentoo.org>
prerequisite-patch-id: 44a51fa6a6f0f9d2c5b7bf3295f3272d6bb7005a
prerequisite-patch-id: dce85ac6e4e94b1d2622a8231ddab3de766373ff
prerequisite-patch-id: af1fb571f0d19d72e69dd41d15fc2dbd730b17c7
prerequisite-patch-id: 1318bffbbe6044cb4ef0f77c6756ff96d69ecdf3
prerequisite-patch-id: 8856cecc299cdffcd18acf9a7476175a4d65e62e

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

