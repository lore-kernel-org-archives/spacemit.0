Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434B36F8E7
	for <spacemit@lists.linux.dev>; Sun,  5 Jul 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783240767; cv=none; b=Kbi4aUww+V0L/13mkvBW9q4oRa726BXRC7MehiPujvyHm24K6XSc4Z9pv7saAnsYbaQ0s+n1L0FkBEFT1LrPEEImihgAqO3wmahK1wQHHu5i8hvKyoFLpPOo+DjRKU64MAiC0iizUXyQsWAo0TeRTWIWKB9UbM1/o38+dYQKYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783240767; c=relaxed/simple;
	bh=xcO7pe3BTmwOdzui6/X6iJz8mN0Rp2hw3KbCd40pQDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kwjb4lxeSxM8ZxxfA86yaScAQAwF0umEZueRLFWtB/mXziKt25muMj2rkiBBRgeUWgkHRUvZzVWiinYYsimQKHYiJIvvKAuzIg20yKopdr9wL7B94OrkdWPWOVeAcB62wpms+SbnJg3GmT3xNz8SW3apfKG89NTwu4S1Dc/YMFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ib2sCdUR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ib2sCdUR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so17565545e9.1
        for <spacemit@lists.linux.dev>; Sun, 05 Jul 2026 01:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783240760; x=1783845560; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+ETHGSiohx0vpbbD7DSPe0/YRZrdLOm6Y1hu+YMerY=;
        b=Ib2sCdURImuGM8FijhnAObg1YE6WyIUp7agrTzERnvkiHvdEYzF1lm78WF7CgSR+MF
         7VM14hM1vdWRyPHpKD7fgcE6XGGrY0UjTNiiHH1VnDb2ut+9QZmYgLGqnWItNvAc01Kd
         Wvi4di6DOVxtlyl3XcA6vMzjSJOwuCnO8qtyQX+wgzL/+ermecF0yHws/7P2QXY6rGjn
         plKvkBKGY+VMuhnOp5yUn5isvtfAWM28TouoW841QoPRZrvwf4heiIc2T7hf+AWyeejV
         FamrCYyQ9V3Asi97gET1LKajP4QjmsJqYav5s4oEaDxVe06CzJ0f9kGqnBZJFRmfkzZw
         hZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240760; x=1783845560;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+ETHGSiohx0vpbbD7DSPe0/YRZrdLOm6Y1hu+YMerY=;
        b=E4M90Y8K5D9cRBc57zeKX7qrpo3uuLrLNThrC/KXrPOqWbpgcLQk0ln4D0srn/TPPv
         DfEg5xIkcByb8UHcgBtuciw0wakGtIGIIUrLLs/rK9PMongKj4tWfDc6hf84em5vvXCU
         UBmP2v5tOFdfD+AMRUse+0FifX5dvF/ryGBGAgqg6bqdk64kg+Rco5B4gaMJu6+WX8m7
         ZwxAeHK6mVOmRWKebvm8l4wineHwBodecGjId/5enhIjy0HnKc+E8X3QWrACvSIf+v8/
         jSe0joqXBmo7L9us9yl3aAt5p92jC5HPPQkBKqFvDBG/JoYiW09cYA4PFQkc4GjxLdGV
         Og7g==
X-Forwarded-Encrypted: i=1; AFNElJ9ZreBaOn8A2olNH/AALaoFB402Lc/WnH+KNYmTZ+YFGx1oqV2k8Csu+rF/kOoqJeTszDNIzCCetw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3puMDy6mPha/9fO7B/WJvJtyU6Z1o8d4kV9Iqbid9ab15mN0a
	dcOty5d6Fmlr8AgTho0Yv572typbS9mMMu7LqKkQ0EjHEzJMSFbfZLcEC1vUKOf+aK0=
X-Gm-Gg: AfdE7cnww2/RigFm4WZThK/u4kMkM20fSIhUdFfGeCF1Mu/Tcb2zQ7hPbY6tGKPe0Yk
	iwKxc4+VlqvBioxJwlhV1hzYzruh4AIxiWHtMHGhsSSR7iNxDYCNumrBGTv6t2+fCIVgbazcQZk
	U1Z7vMJRD7VPkfCALKgWy5moJVwKbuAIBkp/fsmk03+KzhiJF+LVEl/ILSkFJem0Kxk7aBR1SYf
	usEA8UE5nCIGX8QEwDVDD1sNbzuUhf+xEwywNNute7NVhd+MFIthdaD7rXRl9/I8c+jNr35qLSR
	E6S2vcy60Ug4cxWPx2H5gcfd8lZKMjMK4rFYsdtTJBM+gTwvj4Km4Rn7Hrauk9KSTigeqQTCA6J
	MbvTKuCq/uzg3xXSUkUEn9MIgLhfeYIZLF3XbRfHRDyrEemVqlJHUttDuEQiT6vg+d5RtK4PImh
	vO1X+GW8JiMaU8hO99jg==
X-Received: by 2002:a05:600c:4e11:b0:493:b549:3be0 with SMTP id 5b1f17b1804b1-493d11dd1d9mr66980765e9.17.1783240759206;
        Sun, 05 Jul 2026 01:39:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef1807asm258611905e9.1.2026.07.05.01.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:39:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lubomir Rintel <lkundrak@v3.sk>,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
Date: Sun,  5 Jul 2026 10:39:08 +0200
Message-ID: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=xcO7pe3BTmwOdzui6/X6iJz8mN0Rp2hw3KbCd40pQDo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqShguPRcS1zwcItJ0B2kpRagpct3lTujC6gVxy YGvluRc5buJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakoYLgAKCRCPgPtYfRL+ ThdWB/9BzmNcPE8phy3T4E0fYQBt4FVzBOGD42JLah32QnkergVTmb+90x4tK7Ok6JGqgkImXxL Ib9yagywAKum0x1E4zsfA2wWhgU4UARE2m0caZDTD6IkiGLHRbk+mBTS/NOf4lybTWQGqkJqezO BUs563Y26XZb/fclva2hGk6i2cSdjvg8bXpWKoHV37tLMO5D5q18oWFq+Jxbwyj6LTntS2ENNOm Wy21tdilDqvLzrCWOFHT2VasjSEiI0GRcj/rMqYemLSf/f1IakmrGaPsi19B5KWM8euV9qn8P/N buKhv+7derzV/lsUKBsM/iXUXqYqXfYjm2eR+bPx5IPkk5Xd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The SoCs that this driver actually works on all imply OF already. (ARM
selects USE_OF unless some archs are enabled that cannot be selected
together with ARCH_PXA or ARCH_MMP, ARM64 and RISCV select OF.)

With OF known to be enabled a few conditionals in the driver can be
simplified.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

while doing a treewide cleanup I wondered if these conditionals are
relevant at all. A bit of research found they are not. We will get over
losing compile coverage for COMPILE_TEST && !OF.

Best regards
Uwe

 drivers/pwm/Kconfig   |  2 +-
 drivers/pwm/pwm-pxa.c | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index e8886a9b64d9..729776086879 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -569,7 +569,7 @@ config PWM_PCA9685
 config PWM_PXA
 	tristate "PXA PWM support"
 	depends on ARCH_PXA || ARCH_MMP || ARCH_SPACEMIT || COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && OF
 	help
 	  Generic PWM framework driver for PXA.
 
diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 156c0c74cd80..c4d73acfac49 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -136,7 +136,6 @@ static const struct pwm_ops pxa_pwm_ops = {
 	.apply = pxa_pwm_apply,
 };
 
-#ifdef CONFIG_OF
 /*
  * Device tree users must create one device instance for each PWM channel.
  * Hence we dispense with the HAS_SECONDARY_PWM and "tell" the original driver
@@ -151,9 +150,6 @@ static const struct of_device_id pwm_of_match[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pwm_of_match);
-#else
-#define pwm_of_match NULL
-#endif
 
 static int pwm_probe(struct platform_device *pdev)
 {
@@ -165,7 +161,7 @@ static int pwm_probe(struct platform_device *pdev)
 	struct reset_control *rst;
 	int ret = 0;
 
-	if (IS_ENABLED(CONFIG_OF) && id == NULL)
+	if (id == NULL)
 		id = of_device_get_match_data(dev);
 
 	if (id == NULL)
@@ -191,9 +187,7 @@ static int pwm_probe(struct platform_device *pdev)
 		return PTR_ERR(rst);
 
 	chip->ops = &pxa_pwm_ops;
-
-	if (IS_ENABLED(CONFIG_OF))
-		chip->of_xlate = of_pwm_single_xlate;
+	chip->of_xlate = of_pwm_single_xlate;
 
 	pc->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->mmio_base))

base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
-- 
2.55.0.11.g153666a7d9bb

