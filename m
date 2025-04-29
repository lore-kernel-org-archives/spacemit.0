Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34A42F56
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916730; cv=none; b=YIDwVhq/Ye/GQNXJqdwvtQJs74tnEI2YY7jEIKyn82n6lkOmD4hD5HJfsV93eAwSYYQzY0/WCzdqlRG28UEOQrbeEScyg3uh5Wp2rp9AcnEQzr+8k77YhQnR/2nPcLmK/FufzTRinoiBB+MSjtYAdP0WkmlIwDmdn96EH9MY5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916730; c=relaxed/simple;
	bh=+TPnSjs8Rsq4uRl5xcYrXceVeJccwtQIFJM7/CmqG6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSobT+jUjk9M4YjXxKlQUN8UBvyGN0F7rReB82hxho/fSO64XTEEJ7wQGdoKXRrC2BJ9iEVrKDiMUgRG4e0tOccOk+bpuW7iEznaECzvP4y0FpAlrN7SITJHQ2yQ59PUWENhOQj4QQNdaMeqIcIu1QZ48YBesR+ejRX4BP5TzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kg0w2qNp; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kg0w2qNp"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so5460546a12.1
        for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916728; x=1746521528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSBQlgtaQud3VdsTPycKFsE/56jYgj1sJoxgbag7Muo=;
        b=kg0w2qNpT7N/Q+Ihj89dWYusSofsOzlcZ/qVXvPNMscbSBI9HjABgngNUz8eHg99TN
         KeoA5N1jVO69icZwWpigxWwnoC9UNr7OOluJ0CdP+Yl69vjWCHrJ0xEQ+0X25SzB+XKt
         qJg8fXYs+wyb2suvmk86wXvrjjrrFlXwv7sVxbat2TyyFAwF18pyP1zyBrNv1qcaYgQY
         eBNrCbnPkPmGbrybvJKrTtRWeENk+JIta7PIlov8QQwPLlqoBZ4w1xq2AjcpmP2TeIO1
         y4yGkdDxw5JIKJVfqcqGMSnWD+6h10aTSqkrJoix639PI+0WeWDN/phHkG/72joOHhq4
         lSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916728; x=1746521528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSBQlgtaQud3VdsTPycKFsE/56jYgj1sJoxgbag7Muo=;
        b=rQSOFWopO7RAWxlOPENKvr4AqvL8/y0NHMsSDn/6tm0vTa9F227LeVeZ99bDoeLFV+
         ypNtP4DOVXLWAu9Zq3zrrCVUI3EIvl2EwYjexD8i5YMscl7XaRGCo05zaiQ4yWOGq0kG
         obmBAW2Tu2ajchDyPMHrWhi7v4Kysv4CJACfd7IKmhDR55+3ZJD91gSJ30NHsrdPHUJJ
         dXWDp6aR7+6cotTStyNl7fk7+cMm4EfpkTMqsFPOjxa5zI7pGuPGgYUq7DP8zRbvMjIF
         b03AbbGYg+Ktr8YHebernlOVlXu/kPAE3BlOfYtGKgb9CgqigIUD1Fe8IU7ZJgDGGIp3
         pYaw==
X-Forwarded-Encrypted: i=1; AJvYcCVejLBNKVFeBhqz9MvZaykl+BPp9B4H3bpRgf2amzS7mJl4317NXZUKDetPiamXvvazY61GLyv7yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNRY3RmUEF83fPNe9ZqeoMtBKJYwjLGTlItPXpAxoLEBLss4VL
	A6QMIdrrJk37kGI5vmboVu9QWkMB7xqAA5VR3HQslNgRx5uu02LkjCXjE0qeLJU=
X-Gm-Gg: ASbGncsWl2mTNzfgAIc/VcIYjoTfiS/3QZ2aNXq/r7IFinbyIy8aN6jJB1D34o9gxnG
	WltnjerGm4N7CC70XCm7RLs6SyE/0x5outF1Hc9v6gd8BMi9/FQJhaQLyYRghyna4RFCqNcTkM9
	RuTDiwrkRLe0PAGUE4+wAz4CL74yzws60oV8lVcVslA10qHoAYYaexEc1K7xfCC3s2SJL1KUmyj
	xSkZo+jaaBiz1H7EGtYZCPMgwUbgfHXEqFH7QwYpwDkPJLHmbBETaxls6yUtvqmfn8gQ+3PYQno
	Vo6nyMB4rMV+0YfhWaw8ajwgBKVmalyXbxFmBPLBo21WR778Jue1vsDOdHmSHlSQrfM2owSHdnP
	nih10uwVb8naIiEs=
X-Google-Smtp-Source: AGHT+IFKhORMMaDYdgpl/9rwoGwyfPRj2XbuzQCabPPPwxwDnPG2aYuvtb08xMFG1iEWZeP3qzi2Vw==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:6e71:e55 with SMTP id adf61e73a8af0-2095907d1bamr3201920637.6.1745916728038;
        Tue, 29 Apr 2025 01:52:08 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:52:07 -0700 (PDT)
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
Subject: [PATCH v3 5/6] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Tue, 29 Apr 2025 16:50:47 +0800
Message-ID: <20250429085048.1310409-6-guodong@riscstar.com>
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

The SpacemiT K1 SoC uses PWM_PXA driver.

Update the Kconfig file for the PWM_PXA driver to allow
the SpacemiT K1 SoC to use it.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change
v2: No change

 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4731d5b90d7e..6731669e724e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -493,7 +493,7 @@ config PWM_PCA9685
 
 config PWM_PXA
 	tristate "PXA PWM support"
-	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
+	depends on ARCH_PXA || ARCH_MMP || ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  Generic PWM framework driver for PXA.
-- 
2.43.0

