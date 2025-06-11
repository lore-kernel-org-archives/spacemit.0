Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D2627FB27
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646866; cv=none; b=r/T/Sxx2aP9IDE4zDZUGmCvv/OrWvu4NFDsaJ6C2sMgm6XBRQoBcL/HnOqj1K/GyzEIYF6/t5rmNXkIjc/aULSpF272md+MzhzHtzdywNI7tocxUvtAfkPJvpDE+4NGdPzyZFuAPJZgK/w5hePC+Wup09sStsU9Eb9Vug9TBaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646866; c=relaxed/simple;
	bh=OUo46ask5zEdNnxgtDRLYOxKjqeZYpKbIvKQrOHiQr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCEqdGx7kcYjVM8SRTDeI6P6dnWTi4qEJe2As7BCpWNm8XOSf4oDBl1PTF1nnZJBKFM57NcQnYcCBfZlG71vlufDi91JCxsUeTuRoSiHcxozit1dR4SNkp2Q9SUgv96k6aBq1RNVX6p6roPoXtDkoUByRdW50Lztukz3PpuAick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TvK0rTpN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TvK0rTpN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2363616a1a6so18970105ad.3
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646864; x=1750251664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSKx+jiwSQ8DJGzzvr3skZPVBhTTim+uSj665SiqoD0=;
        b=TvK0rTpN1tQUXT/L/rvgbqlFjuHNdXPwDzol4uwyjG9z0+9DPGO9MGbX9L7xMY4QJI
         8yRmowaGDoVQceb+Ho6XYNQrkulY5nzwhIBiJrAAYZYeNOZvOi6WBCAMpGlpwFUCBxvE
         kHcVDvtI8FXZWvUSXayyIIQ+X7ZCUnrLJdNtC4ZNBE4q/sPRlznM5vNnYuRUlBn3qovZ
         vAv6A/cMcR4X03z+YawARetS1+2/xogeNOCKLmcEgUn6VfaW16WI9rKhPxVRqT6DVoUT
         Y7zOajwwcMeFh0Pc/vqz1+lkk7w3+xGPD6YAfDKLgmx6ehjL5NcsHl6KJ1BPkTLXdAG9
         pIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646864; x=1750251664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSKx+jiwSQ8DJGzzvr3skZPVBhTTim+uSj665SiqoD0=;
        b=vI3yG1TdAPoIVIewMmxSU7zmwOZf3sJjTFZHevQzxEiLjlFknXO+0yt59ZDW3Gktfb
         7xij0/fxL4R142ETC5ltxJzdlGNV+13488gXAaRNHDB5ia3h/I8D1Eoc2KW3SBMrzlAR
         WnCdr3d9BaOTwm3I/TwCy1JzrAQxCtzVPMfjymFWqugvQNFg1h/0BtOOrWCv+Cye7H0l
         1zDUBForSnZE5fWpgVJtCo17asBLGSP7hRiAA5QgDFi+8W2SbSlOifc75n2UN2fhAcwZ
         EWoFtRDVIRCtQAlpYNrBqoh/olBeTSAeoQfSb50MAB3nThuBRjQ6aDW/xBCXdfWrXD8b
         14TA==
X-Forwarded-Encrypted: i=1; AJvYcCVUJaEnPqM6AauZBow/OCYQe1bjNS+oVOFDS4QxGEWTMJs+PopesXD7dKe8K3HLN2FVHAEiS6DT0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmE+MMUbxGiYt3EuwYFHGV35Fbr31ZvFnMdAZVQdwP4FZHDaXm
	TOkxpm6RLy3YOha0ZDBntqnK2UL24zI5L9VT+QcyKYxsuxL1DZ+B5Z4zHgVtWHGlYFo=
X-Gm-Gg: ASbGncuofV2lVbhaBW9MK968JmHv4MyJ/QX6fb0qxQb015uTto7k9vMoaOTcNyC0BRr
	Tmm64ARO78uKhcWqGnQuc9FugHW2npW5Dyb9Qum0gnPlRYisHOgFkJlWZvr9MtUKzeRPte1WMvR
	w00XkQJTYOr741XfQOLT7phFZ2Bfni9+LcQxiUcYhyFQgPJGuNLxLWdiSbLVqGP/P0m3WaqsYy4
	LmtVWJTGX0p8xoDfjpfvEEJVX58Q6CWHY1GjH5D8EYOqN7ilZe8tqE3h2TZaeDN6UQjBxedep2p
	z5YIgV6w49iXlapG0b+x0+veucoWeFx3yhX8HNSsiAMKu3U7M5nhz7QfVwxAtWUsjuMihOIUyPW
	c2XBSEgnUJJdW7W/IJKlLmpggN0cKpSjN
X-Google-Smtp-Source: AGHT+IHRhbcivXCxN135O16ueeb4/aUJWfnS89ixSiurI5FZ7uV83frEUoZkuyXDNWNmUKyh7r0P9A==
X-Received: by 2002:a17:902:c94d:b0:234:8c52:1f9b with SMTP id d9443c01a7336-23641b1553emr48488375ad.43.1749646862200;
        Wed, 11 Jun 2025 06:01:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:01:01 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 8/8] riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC
Date: Wed, 11 Jun 2025 20:57:23 +0800
Message-ID: <20250611125723.181711-9-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards
like the BananaPI-F3 (BPI-F3) and the Sipeed LicheePi 3A.

According to make savedefconfig, the position of CONFIG_DWMAC_THEAD=m
should be in another place. It was updated in this patch.

CONFIG_DWMAC_THEAD was initially introduced into riscv defconfig in
commit 0207244ea0e7 ("riscv: defconfig: enable pinctrl and dwmac support
for TH1520")

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 517cc4c99efc..83d0366194ba 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -134,6 +134,7 @@ CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
 CONFIG_STMMAC_ETH=m
+CONFIG_DWMAC_THEAD=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
@@ -240,7 +241,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
-CONFIG_DWMAC_THEAD=m
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.43.0

