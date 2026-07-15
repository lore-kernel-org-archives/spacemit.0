Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA34420497
	for <spacemit@lists.linux.dev>; Wed, 15 Jul 2026 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119953; cv=none; b=cx01hZWMynEHzYW2tGCIV6VC61ebqPmeLvU53pqI7Vf3WU8KcLYX14n8nVa6TKnb0uF8c2FmtyOmn/MaDyXj4KnM4vaGIcGWnSKduRIC82AV6um9CTuIBjl1elsAXGORYmleGxFeE1h+E081CDIF/q4LCIYj30BbtgBSNA6HfFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119953; c=relaxed/simple;
	bh=jC5K1NA2Qi20lryJrip427XM3Y5XYrk3Gmi9jleDf2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KqD5T0PZxY/1NhZFXn6iTelm+OTC8IASBQExiXUdEMbrjTX42+TjLhlbtOdhNol7PU+TQ3NQEPJDjSebB2Qr2QOMzcXLscznxKwYScqiqFhmLuc4cnjUnkBHatJobLdOp0AT+YzPVheE0E5SF9C8Qn7KoN1mGZyFhMrVsKCTLlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2QKpOhU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2QKpOhU"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so5521886a91.0
        for <spacemit@lists.linux.dev>; Wed, 15 Jul 2026 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119951; x=1784724751; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWcdIs2ci+zPyHZ1UgU5XfiAjrJantGzHWpSqVd+iVQ=;
        b=L2QKpOhUtXwEwY/X+D5h1LnY2qKlXJxeoaQrqw/OiMRvC69KcKX0ZW7RfvjCKNLVc4
         BFgHvymOSsG5DaQ0mJNzXJ0dvpUI9cBYsluSLDnI8LpKoiyvi/wacnLuJdUxU9jCkBhS
         kncvcGEC5xHRYENRDEFgLdOQuvJj6NxzaA/L3Hby0MoN+aB75uwYyjo1Sh1S2lNoo5u7
         xRuuXzqJubLbvFlNHgKFQGamJoeL/QqUcwQkxhydF4BjfBfkgRdJh6K5h+LUuPXk+cWF
         +3TsmtQ2lQ4g82EgwSllBvIyNG5iYuAg03sSzNWPR98BQMxmCR1jBehpsTUVuGuwwLCz
         Bcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119951; x=1784724751;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWcdIs2ci+zPyHZ1UgU5XfiAjrJantGzHWpSqVd+iVQ=;
        b=RHiZfHbauGreXUF4KbIH8cLFgTFcmOQSSmmeDHr3LCOoK6kcThGyNIo9uvmPAP4ACE
         xM+/mblMZ83yRrZ9Rabnp0bw0qvRhAYFJzpJDweNUvWHqNCvYkG8TW19oY1s1qKlOeAx
         HO9nECyG/7Ab8pAGKepQee19PiHmauXLT6Kuwkwytyh+Cxf5BIga4kkVVv7TwKCQxBjs
         bmYzgKmvWrAO6jhd5zeEyaFCVL6QzUdfYztTZUDCj8tdudnFeMeGPMeRlVWO/nWzXbrF
         Yq/fYsAKAuAGVfSWJUGG8Cf9U1c93usPylFsRO9YacRwTHkKIu9lwVql8HHU1L1SbWtF
         aQgQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1/KBwFhPSqbSpJQ2sNfScGl550Md6qLOoiO6Wepkt6T2Y2eFiZJ/3jK86Z/QGLp9zIykPOd/sJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKmemjwBKPraC3FBFyRtu2GkENweiDcHC9Y2pwbv60yVsjhA1s
	kAEbvZg9gtG0H12xs7Z6VJHgLgDke0a3EBTjfJGqukGwggLIfiCukw0j
X-Gm-Gg: AfdE7cm/58lQUO850Ye+CQHmiA13PJk7I+2FZK48izAuwawYXNzIWhLR8BOgvbSI/gG
	y/6YG7wC0MrP8CpLDXQfZcPPW5J3oUQAI8w8MDmL2NudJbKqf+uEPW9+bFGoMFBewHBkmiryyVc
	kvu81GpEiEfkZDkkqzGbPch19REc87utBmzlNQNAa58jaG+q/hoCm/hlhVsLvoYo/KjxPT23usp
	/ZvRQAUaSyqmMMI2G5/2PCZsBemdGKiRxcwZovv0ZOUr4ZZju13MhLK4hHoPPfsPPErIwQ4Y4bU
	As02awW6wZsU5ofd0bcLyYAlBdKgw26R8NBACM7qLldmVv26s9+XDBJRsOyARFsXUh1sbhTtmeX
	rm9PPUEScfAw9V1Q+c7YHQHqEcv2QejjeAlIpqG+hX8OtlB4Pdcm48WgTLvv9YE21hdAl9Q0Zu8
	vOhTlQ24g+snIKf0y8sD3TCYo1YzHyi+WwVX39Ug8=
X-Received: by 2002:a17:90b:4e8f:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-38e17d96412mr7448999a91.5.1784119951167;
        Wed, 15 Jul 2026 05:52:31 -0700 (PDT)
Received: from MacBookPro.lan ([2408:8256:3310:8e00:f02b:c960:26d3:2b22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172cba1fsm3036140a91.5.2026.07.15.05.52.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Jul 2026 05:52:30 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: wefu@redhat.com,
	Zhengyu He <hezhy472013@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peixin Xie <peixin.xie@spacemit.com>
Subject: [PATCH] spi: spacemit: Correct TX FIFO slot calculation
Date: Wed, 15 Jul 2026 20:52:15 +0800
Message-ID: <20260715-k1-spi-tx-fifo-fix-v1-for-next-v1-1-02024223b08a@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260715-k1-spi-tx-fifo-fix-v1-for-next-43cdd0d9213f
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=jC5K1NA2Qi20lryJrip427XM3Y5XYrk3Gmi9jleDf2o=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqV31qlRwpRvEkyvTUy4uncIOL9TlEAlgjz+Jsp
 RUGLads05eJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCald9agAKCRDN9pw2gLgN
 2BgLEACEiMAXQf5d7wzj918XbzCyvgH3JojkX5J45Fs6Qk5AP0sNvlewOxIYinhm1gTStnxa9Ta
 LB+21b+WXPxgVfgGrCnDfxpK/rR7SLZkmgiJNmpXhebrKDHY/2DMvzafZu37EiihZLNqX/dRhTa
 EpZgLe0zfD3pn6czo561TLMaV9SQDzNLLitsnJIfpKtO5FrRq4ChBsUnYNp8CQpk5DMXEaYRbVY
 VNz6e05pjjA8Q0YDd3yhVMAV1KVSgclq81Q+qERowiEDzKDo4oQDxS53et25Fxtj4UkzXwx11t0
 TCAS9FPA30049y1aqfKDMs9d3czb0X8GOj3oLBVPkc9CEX1v7ae32kwjCshr27whNfjFmEGmbRb
 PqzWfjtJ4cWUDJ8oCaOtellab5Eo6PhQ9tlyG1R3W/V55IHTGu9uq7zMKcDMYA8kK8I2js/OR/1
 PaXRfvSdg5kBgkjJ4KRAn3bpyW5s1HlrWOVYzA/XOogRS54EU3UtygZ0ymdFIJ3U/soev51RthE
 cuErPy7pM9cbzy1lFw4/Qisy00azAyJn3mMqsK6knbU/X63chY3FChgNTo5jTa5ptFvSAMGt3Um
 yysNS34cLkUBmFq/IVKS320JKIEoANLVZ1c6n2VjDW19ineJEXurLCk5HY8pwRhMIH5lhE8CQJL bg0AgFEW2lf4GaA==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp; fpr=26CA97B1A229C229822278F254AF850165158959
Content-Transfer-Encoding: 8bit

In k1_spi_write, the count variable is intended to represent the number
of slots available for writing into the TX FIFO.

The current implementation uses FIELD_GET(SSP_STATUS_TFL, val) in an
attempt to determine this count, but this register field returns the
number of occupied slots, not the available space. The previous
implementation attempted to handle this via a ternary operator (? :
K1_SPI_FIFO_SIZE), which incorrectly assumed that the hardware returned
0 when the FIFO was empty (meaning all slots were available), leading to
incorrect accounting of the buffer space.

Fix this by calculating the free slots: count = K1_SPI_FIFO_SIZE -
FIELD_GET(SSP_STATUS_TFL, val);

The associated comment has been updated to reflect the logic change: The
old comment reflected an incorrect assumption about the hardware
behavior, which was the root cause of the previous buggy logic.

This patch accurately and concisely describes the purpose of the new
calculation.

Signed-off-by: Peixin Xie <peixin.xie@spacemit.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 drivers/spi/spi-spacemit-k1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 215fe66d27b4..0faf7ffed676 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -494,8 +494,8 @@ static bool k1_spi_write(struct k1_spi_driver_data *drv_data, u32 val)
 {
 	unsigned int count;
 
-	/* Get the number of open slots in the FIFO; zero means all */
-	count = FIELD_GET(SSP_STATUS_TFL, val) ? : K1_SPI_FIFO_SIZE;
+	/* Get the number of free slots in the FIFO */
+	count = K1_SPI_FIFO_SIZE - FIELD_GET(SSP_STATUS_TFL, val);
 
 	/*
 	 * Limit how much we try to send at a time, to reduce the

---
base-commit: 51ed53630915c9cc290036fe4f430849e23bbf8e
change-id: 20260715-k1-spi-tx-fifo-fix-v1-for-next-43cdd0d9213f

Best regards,
-- 
Zhengyu He <hezhy472013@gmail.com>

