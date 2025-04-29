Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94A7279347
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916762; cv=none; b=iyMTexDGdmwHToZmfYFrzJND7SUdp+Hf2WZyvPogjcNhUKH6hC+O1xhJrNbZa8+Bot1kfHArOLkxoM8WcGamL08BkJjspQmuYWIPiBZ9423vUOWaqQYYrVWahUBCPrudg/0FZmEG44hCOsR8/H0ODB9c1oxYBi4GY6iOaVOmIq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916762; c=relaxed/simple;
	bh=snO5UlRxqymfMmKvVew8ZDq0Uh+aBwp66nsHilnsiK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqRmxZKewkG4SFtuyHiPsZxlv7C2KitFZWXyQZ5Bku9T34t1nsJGahQFZyHM9dZbGOIbp4gGngtEhhIrnFydNxmKcYuV+6PAO+Gq4uprkWZSm6k0nmtQShP0dqMW8qPGkDHFLz+eRezGLu+hdveKFI5gTFESG80WzgfzkCqNiJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BLun88kl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BLun88kl"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227b828de00so57021015ad.1
        for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916760; x=1746521560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mEqVehBRCDyoxu9q2vBqacMHsZUXwyFpRPZVYhXUX8=;
        b=BLun88kly5Xj3ffTE/0AIE32Clz/IQMNsS+uffB7gMHSGnQDtxY17WyXY44wEDPW06
         aVL2/lF8fr6IVomYk27dH+18kRQ+/YNRFZ7k6mM98FZZjVV9hM3OqmOj6Vwk3d5dduOD
         ejdyWm0o5yjVhHa1oPJI1CQ7Dwr/UaWrnL6XVM3wivii0KXmYiJ5jqdieKOwnAdQCAkA
         AG6+Rq/WvC61w9RN+mm5gFQ4KKJVMl8cimyrZkCRbEVVk1CvhboFynRewc/t/iO1fRzT
         PxPmRCUYkQPxPH9cCexgBnIN/sd5nPweOIGjoDft2nf80ARBerrSw37oRsqY+hZ7uk8f
         r2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916760; x=1746521560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mEqVehBRCDyoxu9q2vBqacMHsZUXwyFpRPZVYhXUX8=;
        b=dZ0JR7IviLU3Kc2WYpr9tsvGIvd40vWkI8UCsPIvhtJtQKCAFQO1gwYhE/YgSxAl8N
         PHi7oCkOmurV3EdzHJZXhp9LWkt+WwlGBa1vkm0Hgb/kcL5+zM5TjXOlLhY3b81AnHVm
         ixXPzsQvJ+widKgt4fWsPPrdfBbaje+/5s3/aFHE73odNExXDvRS9cMTvIVxxBn+uWQh
         fsLsTd70oyTiFaVnDhx3lkNeY1hoKlrqbLbvLGEjAh0pUank6NArvUoxJiDNoIUEgRON
         swDadG+S/74pGsS3YeEot17iffJTHb+I9JqCqHNOeRj9JzulS98ErJV1mXzPqE2uA3YV
         gRQw==
X-Forwarded-Encrypted: i=1; AJvYcCXg+KmRBi/sYPFyKpbn0J1IIDSmRilYLVistqm9hcjbiD0hiPULhvwSKDpagJTeDP29EwJJA9jElg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqEuU7JqxR/2V80nzKWoEBNxaBDJEu5lXzaa9/l0PY3XpLT00q
	FHjxmjEUzKfHMh8QSF+TjAe5gaStUadr9kp8ejGoUCOQW+SYZiPBDLWA2bFsv7Y=
X-Gm-Gg: ASbGncux2+W2fcPiXhLcyQg4Ydj0U1fMoF5bNkLsRC370KJ/AQXZTvaRKa+BUadbeL/
	sJbD3zDSYIPnTun8sakpGeRaanLQ6LDkEYu4BCLhdiciDMc67VtBJM8PmNeKFqB+Fk3+KPl3D05
	EgVMHAamjKSTREFXmNpWYOErwkf+xyC/s5BXf2Qw+rKrbXZSAD/bJItkOvv0wa+RTQ15bNbpBfx
	3Zf7s2xm2pzrif1fQ6YHisnL0gwivybUz2Cki6kjsd7YoQTp2NpGFacqkXZ3Rf8c5vEUVs1Cn2j
	U/IL9l/hEpJNOBZX2rNvbhBw/rTZ1mm4Ppp2oahz6HXYgvergKZmTvco1U89xx1byk8yUOUrG8u
	B5m8ptDZqhL0NNwJTjJunaW8qzw==
X-Google-Smtp-Source: AGHT+IGnvzbUWhLI/YOaGHPG2HlwGVUVLczRsChSXyhLNMaAX1vRU5+feyFIpxGpmIkb1IMqyytUCA==
X-Received: by 2002:a17:902:e5cd:b0:220:fe50:5b44 with SMTP id d9443c01a7336-22de7037cb5mr28009905ad.31.1745916760002;
        Tue, 29 Apr 2025 01:52:40 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:52:39 -0700 (PDT)
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
Subject: [PATCH v3 6/6] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
Date: Tue, 29 Apr 2025 16:50:48 +0800
Message-ID: <20250429085048.1310409-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
to support the PWM controller used on the SpacemiT K1 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change
v2: Changed PWM_PXA from built-in to a loadable module (=m)

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..3c4d9bb8f01e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -257,6 +257,8 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0

