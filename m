Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F4B1FCFE9
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916697; cv=none; b=OgMTBGOev0xflTZbpEY1LaYtlY07H+2ckW73wMlba8XJQHjbeJmubMnW5JqEgCKZJAg1jq1sGeFyQzoH5tIwlgvQAaoeHMWKrSzp5kAodiTy2Bk8FRfRMP1eezzUeEwd7gW5nx/SLmWjGwraR/PgB6mvoTqugCr51eAaxwdNBfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916697; c=relaxed/simple;
	bh=ZLqnNRXBAVw2yotWdLMWiDrIuKC3zLz8bFoRIWISSAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFIHtgC4DhoK25Xr1E9FHc0cUb+jP0Zg/z55T4q3BZUd2hJ67qzFatCubWlSuXboFw+/ZutBbQGzr5+vqhp4iGkNtgcXjRZzSGle7EhMbXeFV7Lf3P1GkojasqA++P7lBt+0rbGjiFVFnn1VQuE+tq4LcBCAwy7w0foZp+yAODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=T/rhpch0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="T/rhpch0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22438c356c8so62645515ad.1
        for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916695; x=1746521495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf1MyA5jv2WhmjchTZbgQeXneBCKmWDUyNLFyQlB0MY=;
        b=T/rhpch0dThO5KhTHkNRhg34PgWwIq5SE2uMRThGw8uarCQYP6EupiX3jg5pp/0eY/
         CLpjLuJtmV1YlFBBA6NXQ563ynsDDS+fFhZZxw7xzMfyY6fz0jhVhI2Bdola6VKnnJwX
         GDN2bJx7/mwp5DajHsUVSoyAtEdMDRLd8XplRvBLijTzi9cEj+uV5sE6Iz5+ouoYloyR
         pZX+69zibYAOxaNhNlAp7OCcyEIzArIPAJkdVrISL7Iuz1CPNdBww/fURdlEhM7IP9mb
         WzYwwOLKeB8cUI6ihC/hj+TwDtTkNuzlzq2UCOzClNqhJJ0IDOdTgqCMpTfMEXD4v0De
         5gBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916695; x=1746521495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf1MyA5jv2WhmjchTZbgQeXneBCKmWDUyNLFyQlB0MY=;
        b=X4sgepFwYbEleFqufXqgKiafSP7cX5qHm5PLzlzBgpVAeWMEozc11foohRXy0MA1+p
         qhFTWBFckbbWBNrUZekb9NWg4aNMn4MrvNcABljpAuD9OwOaC/wtJQzl7hykBXzG2Pjt
         eBxmZXenwkso5ylTLRSpn+ClsLxGVBJFLNFiWyDgPbYxEQq+feleJyxLS+MUWQ3BjtZ0
         LemVILd05MR+3IvNb6DWLmrjL8GazN1Xzhcso27DFMHCyTAtaPYC/oksjQVQ3JtMR24E
         RDTu2EFDjRznTHfV4RfsjNZr51lAo9Lb8yFL1kEevvkoc6I2vDJIEqzAclcdlDOy6ALZ
         lRcw==
X-Forwarded-Encrypted: i=1; AJvYcCVoZHti6jbDZyrVuiFNy+9ML13x+iqtcVlRTKX1EiOK5gEk+CKS/j1LOzaBgNViB3KoulVVuu7xCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7WiTLIjO4zNOMeF5FZ+HwdPjQkq46Z+pQVO0lAMJ1Jw0YVHBj
	dm98ixdu8caiXkMvezr+TJ5ADg+O1TFFKvh8auNGOrYKRJZ9ftZsXqGGDV9A4nc=
X-Gm-Gg: ASbGncuEpgWxPZOT81pCbjRpeH8DkuZfouN/4xP8GNaBtL+4rkcTc2U8ewA9TelxnHN
	/dpOhqa+VJ3UDiCcSzP7IA54Ads3yvWeuOWU3QZ43O8wGvGO1HJFfIW7PPWbmBybyzD16BCxfAr
	c1kdLnTDshgZsLHY2rKNHU8UM71uPgV0OKFKz8j9Pv9SJYQXlufhoSqjhg6s18xUkrOHwgOPO38
	n6ObAW7P1Q/YsJj2ncXffW3HgBvd0LHNkBR1BPwFXFa0G3PDkPeSIeGpzaZ6rxCXnJthhgLAxvk
	B871Cpj/J3NZqXnoBCHCUkf4bDwBAuKFeDypeZ72SIxNIYDHnNI9ZXWI0fLe9iwp8bQknDcEP11
	JUiEAi8FXpuoIqek=
X-Google-Smtp-Source: AGHT+IF/YTb11QJo7KHbzLovwGKhpZslh/Bu4+pqk61lazM/ExJSKXK7osXi8PFQQCc7TGaXhCoayw==
X-Received: by 2002:a17:902:cf07:b0:224:23ab:b88b with SMTP id d9443c01a7336-22de5eca712mr35763465ad.8.1745916695179;
        Tue, 29 Apr 2025 01:51:35 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:34 -0700 (PDT)
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
Subject: [PATCH v3 2/6] pwm: pxa: add optional reset control
Date: Tue, 29 Apr 2025 16:50:44 +0800
Message-ID: <20250429085048.1310409-3-guodong@riscstar.com>
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

Support optional reset control for the PWM PXA driver.

During the probe, it acquires the reset controller using
devm_reset_control_get_optional_exclusive_deasserted() to get and deassert
the reset controller to enable the PWM channel.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Dropped the addition of a reset_control field to the struct pxa_pwm_chip
    Using a local variable for reset in pwm_probe() instead
v2: No change

 drivers/pwm/pwm-pxa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 430bd6a709e9..f6a862531601 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -25,6 +25,7 @@
 #include <linux/io.h>
 #include <linux/pwm.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 
 #include <asm/div64.h>
 
@@ -160,6 +161,7 @@ static int pwm_probe(struct platform_device *pdev)
 	const struct platform_device_id *id = platform_get_device_id(pdev);
 	struct pwm_chip *chip;
 	struct pxa_pwm_chip *pc;
+	struct reset_control *rst;
 	int ret = 0;
 
 	if (IS_ENABLED(CONFIG_OF) && id == NULL)
@@ -179,6 +181,11 @@ static int pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->clk))
 		return PTR_ERR(pc->clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
 	chip->ops = &pxa_pwm_ops;
 
 	if (IS_ENABLED(CONFIG_OF))
-- 
2.43.0

