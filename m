Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E87F437102
	for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 13:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784901503; cv=none; b=QJfNCCMBZwSVOiFR+nHsbbqRLvDNzFwAh+p3nUvxGLdtG/miKRBBOuWuPVd0dEEJyPXpE7Oa9drADgiGu1ASgThI4iSBLz9VUNW5un4aL0x8tGQyj6wTmsSfMO+yoBOZi0lUUmOKWM8in2giXcVkh+mrwqh1LEtNlzB3K4Q0smg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784901503; c=relaxed/simple;
	bh=9bVq3PKKCCjYfUKFC8lsteul1thSQleu0PchsXsqgeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEt2LVsPll8TnG7PznEoVkpzjkkJWSKabnyfFSU+eOvi7ZMWKsX+7fsYqw4MEIO2rf7iVocRhbm7NetudRPvfuobThfBpTUivzvwsJrfcJbvk1WAGRduUmULefeDV1CkEztsAd6Tsf32Y/Ex44XA1HpnuRHMuWGWP9o+zIya0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxrpmwlj; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxrpmwlj"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e83f1f15aso3967147b3.1
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784901499; x=1785506299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOq8PKa6aIygrh3C9B6cO75yjjM9OGV5sf4Vbyk2dT0=;
        b=NxrpmwljafBqI2w8aDUd1yWUvF23l2aTDYR8py+1O9BdxzndsCM+xRLm2a37MrrAae
         7xaRgVrM4B+zvHZ1hRj72/gawcy7PmHgj6AyooLfNvkSCKJ0SAF8WJHiR1IkJ4ESmI/U
         30fzGwq65LnwnkrRVkxqsaM0AyVc7uDIdM6YDhnp8lr/jF6SIbrOvBiaKJ9wQa2dY99F
         JtKgvKvZuIZXKsp+SgPWUagtX+34BJQpgY4rS28Mbr5GR3Ackz/aeX/pmHYejTWIsoCD
         zgm+JxaWSvDdYNiFdhuuBpyB0Oozn4FlKIaYyCuVPNNVE9R4YcHwTS4iad7EZy6aj48j
         ArQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784901499; x=1785506299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOq8PKa6aIygrh3C9B6cO75yjjM9OGV5sf4Vbyk2dT0=;
        b=dzfghSlRQ6jUkq7LlPXRFjtQHT6p8BxbRKaDN05kAcuQhWGSw2usK/93uh3HtOcVaP
         0YCmuYGvGG6iwPMBIt3gyYtHNSXGedRYOb/SJl1qJPjcMp7GpSghP70GEGaQesltyd0E
         YDZHAVV5Zw4M70kCF1vFf1MGoxktsi09YB1DqcTSg61Ro0yzl9hfS00scNJEKZTdgJ/Y
         4EadlfcqpvBxxxEkoYIOQaSCY93pPwgOpsSc6UqbN+ndium6hjvT2dluQuwBYX/0Ogur
         5xfDLFAWJrByvkwmJsyGmR7q5Rue2FgfOeqYilFy+gZ0etC4O9h/HYQZMPtJiXrPaJT8
         hRLA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+J9YSw6gwzm5r9fwKXNS1zpgEIy1Uq+mOu7F1a5GLkfe+HqczEkBmAFgeMcBH2/WpoORwmgsyUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YydbpxvEwZiOeMIuQpmP/aOswebYyn7MQNEm/QCzNMITlYSWvUM
	kPXsZG5gN8ep0hDXUHWW0eM5WnXy095Ox2RBsoIPW6dMSJslbN+uJtE=
X-Gm-Gg: AR+sD102pBesDFN9mNlaQ3AkTfErE6CYuCncYGDH9GA4yn7+dESv2Q56dwvP3obbxsw
	bjyQ+ztw4G5umnoeIsP6PIpEP0ljauqV2e2ohrMMvAa9lm6w5z1Ad5/JORtT93nk5W3jQQDzNRO
	OpBIVyoPNDsrrhKIAZsK2Xtrv8A4xuITf5u4QjEz7CvhptKSJ5NviJPFADw4vh8N9eKufahx5Eq
	z5HU+6LziUofPGOcyUe/C4jJCrMJcoQmupct8bjrQ/Hq/063iU37ECBABTTaXQHUTDp8vAm8thT
	7ZseCk1GLmwrf3jpwlnbyyFPV9iKO6epB1n6fSxG/u1MZlWxYvfRU/u4bFqu3/5gy1Rof6BjtYq
	OGj15jC89RXBZRfANoHEIRQk74VlgV4reCVNdsKK4Ytm3c0H8+GeIWfSjnmLhQ3td9etGrAVYR7
	bYxu8fhGEFAmeFa3CpTTGUwIrq0/4=
X-Received: by 2002:a05:690c:e3d0:b0:81c:2a00:aa42 with SMTP id 00721157ae682-81f63faecc5mr1632347b3.20.1784901498554;
        Fri, 24 Jul 2026 06:58:18 -0700 (PDT)
Received: from t-rex ([2401:4900:1a5e:93db:310f:3bc6:10c2:6175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f658fc799sm191397b3.34.2026.07.24.06.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:58:18 -0700 (PDT)
From: kr494167@gmail.com
To: alexandre.belloni@bootlin.com,
	dlan@kernel.org,
	elder@riscstar.com
Cc: linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2] rtc: spacemit: handle regmap_test_bits() error return
Date: Fri, 24 Jul 2026 19:28:03 +0530
Message-ID: <20260724135803.81223-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

p1_rtc_read_time() called if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
to check if the RTC was enabled.

regmap_test_bits() returns 1 if the bit is set, 0 if not set, and a
negative error code (e.g. -EIO) if reading the control register fails.
Using !regmap_test_bits(...) evaluates a negative error code as boolean
false, causing I2C/regmap read failures to be ignored and incorrectly
proceeding to read time registers from a failing device.

Fix this by capturing the return value of regmap_test_bits() and returning
the error code if negative, or -EINVAL if the RTC is disabled.

Fixes: a6de182daa2b ("rtc: spacemit: support the SpacemiT P1 RTC")
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
v2:
 - Use ternary shorthand (ret ?: -EINVAL) as suggested by Alex Elder.
 - Collect Reviewed-by tag from Alex Elder.

 drivers/rtc/rtc-spacemit-p1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
index 43ab62494bb4..1de7bd995d29 100644
--- a/drivers/rtc/rtc-spacemit-p1.c
+++ b/drivers/rtc/rtc-spacemit-p1.c
@@ -57,8 +57,9 @@ static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
 	u8 time[6];
 	int ret;
 
-	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
-		return -EINVAL;		/* RTC is disabled */
+	ret = regmap_test_bits(regmap, RTC_CTRL, RTC_EN);
+	if (ret <= 0)
+		return ret ?: -EINVAL;	/* RTC is disabled or error */
 
 	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
 	if (ret)
-- 
2.55.0

