Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702A318EF4
	for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 02:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784860953; cv=none; b=A3uZZ8qaq2BmLyacoTwbNvirFd9yah/14yTbmncVHwAKgdBYYDtVjkBSxVJMn+CxtbfB3RvPdmp0oybJvE8nhTvGDnUMWUSES012ilAlwH0fR34YdH7P11kwhqeF1Ez5QDCQY13DMrub3IVvOWrAiU82Aj5uNiIP30uVHNTDeTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784860953; c=relaxed/simple;
	bh=Kcyf6DRHa971EXj2kBZ35LGhRul4erajhh5T/3cAz7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GqevE7NwTvgsHAPl+7DPtFxC1SqAfhWjdxmj9lrIKX5XLq+Ktj172g0LXJiDRt52ur/KyzDIida2wbzvrr8zsU3RLMMoRdofIktwss8ZNi879+vorr3hVjteXRiOEEMNHLTROGUvA2Hq29Tid4EUFJnv4QPG2WXPJoNvp6GxeZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXlIdL2f; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXlIdL2f"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf41bab353so17536945ad.0
        for <spacemit@lists.linux.dev>; Thu, 23 Jul 2026 19:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784860950; x=1785465750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4bvXbXayEnCzzJXqVJPK7lahyeIFGKn1fz42KqQtbg=;
        b=cXlIdL2f9ANKDt51pnim32NpnlK//khCIIMttZR5zxq0dBPQmHWX24oIpBt8FOGme/
         97J2gXOM6tM0ucE9aGxFPpUXDk41iJk6ewVrCezlUZtYHg7DuCtV//eauP5d+xbUXsil
         lrVeXWKve4i2FIeENG+wjxYjFJWixei0uNJVAq7JJYvbPn7SxhZkKzVDXkPv1rQhI7SL
         j9G1mfQX0Yzfqqv9RJzneO8eCsBjEWi11wZIcde1cmlJfoIbVPkZG7AbxJOdrvj2BVEs
         TfFLpPA9MUmrEyAFwPPwuiYRXn16qQkOQyJtXqi0kN/WxOdqEqGo/IXq9XczdJ/S3cP4
         bM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784860950; x=1785465750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4bvXbXayEnCzzJXqVJPK7lahyeIFGKn1fz42KqQtbg=;
        b=OMh0WMG+Q4gspvz0EVOPOAPZxMNFYJKKb4CYQo62sT7r3pIswQtDjcPO7qhpMDZum2
         H6B1EFWSXSV5O34PzHAC/OJA1KBZFdwTakvw1VgdR4GTswi/QupT4VTKLS7isZeza4rB
         fLHeVEQ9JSg84cnA75sHfTto+HTW9cD9e4IrWfaJmSPKd/dcITjuyfk072GpIjVNDcAM
         /8f624VvULei5u3VzdsTFuYB6IdChkcCT1zI3utE2wVm7L8b5cs7IKmgn1PjSCvsGO2L
         6DcaRn0FTR2u5p3bnM9WRwhHnTcCAILHBh0hHm1YvVMDWe+ZZ6nG56daklU5FTMI5hHx
         Xn8g==
X-Forwarded-Encrypted: i=1; AHgh+RpDWgOWfCI35EXvBPsL2u0kOhysDnv+zI0KyW5t/t/2RXwpsIRDhaPX1smQvssskej1Sqlo5kl81Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFbJGkJJqLQR8CQPj49EF6FT8N+cbzc+26RU5VyKH7A/dqireq
	8zNAYIlcB6MB3odk8TGt7WmsUmfKJVuyh9LEbXKHOgiqv7xHiDHIbTw=
X-Gm-Gg: AR+sD11NDrCQf4bCNFGjwYM6c6Im2YB0gbTrWp48CqZ3AaeVqiGSVkw+4UW5fMEsJHM
	auwXSfk8/Bn7BnYkdiZgSJEdlNdYKHtomeYy2cC01/wtliWIxE/e+JpOvChRvJ4l8ro0BdvfVTj
	L27TeoAWhgpaA5la2KUd/KhfuCvnZ0XC2VzCTMYwZu4Z8QCtbSQfLbHV+tvCn6ZSw32+EWB1EYR
	Sz9eR9ky9v/qSnp5Rs308UbJW3TN0R2sHEEllw1u8mxuE1bmCSx4a7nFYRen2VDhqiaLMdFtmt7
	uPOX4pSoMzkB5GUIH7k5iTSKHJuPqgynfLtC6oJkAgBTkPiJQBFMa2Q7r765VNnULMKQ3xvJSV6
	fSTOze/5EZQNA2sWiX8piJR4P3uWm6u//kj35UC74RzyLsnY8/cTGahVq3icVdh34qfIJP+m0py
	9jYwSlwGCoym1bX69bhYuEqb7s8rg=
X-Received: by 2002:a17:903:2b0d:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2cfa71d9468mr61759585ad.17.1784860950411;
        Thu, 23 Jul 2026 19:42:30 -0700 (PDT)
Received: from t-rex ([2401:4900:7b1c:a30e:8622:dbfc:dd30:d90d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm24761728eec.28.2026.07.23.19.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:42:29 -0700 (PDT)
From: kr494167@gmail.com
To: alexandre.belloni@bootlin.com,
	dlan@kernel.org
Cc: elder@riscstar.com,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH] rtc: spacemit: handle regmap_test_bits() error return
Date: Fri, 24 Jul 2026 08:12:20 +0530
Message-ID: <20260724024220.10113-1-kr494167@gmail.com>
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
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 drivers/rtc/rtc-spacemit-p1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
index 43ab62494bb4..c1820c920ba3 100644
--- a/drivers/rtc/rtc-spacemit-p1.c
+++ b/drivers/rtc/rtc-spacemit-p1.c
@@ -57,8 +57,9 @@ static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
 	u8 time[6];
 	int ret;
 
-	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
-		return -EINVAL;		/* RTC is disabled */
+	ret = regmap_test_bits(regmap, RTC_CTRL, RTC_EN);
+	if (ret <= 0)
+		return ret ? ret : -EINVAL;	/* RTC is disabled or error */
 
 	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
 	if (ret)
-- 
2.55.0

