Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B313217F2E
	for <spacemit@lists.linux.dev>; Wed,  3 Sep 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893717; cv=none; b=KeB6ltUvGLu3a7xtSBlzuSY+zfAyzulZxOZ82mm3BkRm0BUbD3kO2TZk+Qop8yowVOIQw32Li5y+tbNkr2oODm/YnOf6AqBVNAXLRhLMt/5LPqoHbRvGwFpsi5DfVRd7aZOzazEaxrAUO5cL0aa3vevAFdFbVrmdS1b1AIjj4HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893717; c=relaxed/simple;
	bh=kHulDodA6XjjDXaF8f3RTdeG+b7HsT9DN9fR8XCqMLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ppHKlPwv+oTpVxvbrLeZ5eKinZzTK7APy/gOwUh3PSs1qIG8vJlGBmUPvec5P3A0xzRBuJ4xqmrXvrX3QAz/OHql/y5fntlmAcf8hgIEolK02EvO2HM8CtZp7c3qbjf5dz8rx1j7pkMZbyNjbdrRkUNVp/3mNPEterd4XNAM+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=lJwrQUt+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="lJwrQUt+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so25752765e9.3
        for <spacemit@lists.linux.dev>; Wed, 03 Sep 2025 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1756893712; x=1757498512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ9qYB7I/+26Ck84iyosBQZh4d5xKjRCMcgtP0AqugE=;
        b=lJwrQUt+Js3sbt0HhgljnBRowA/cBzBJ2Kd+YYQHhektSYuLkm8t/8rurfF1zx7Vn0
         eVvq3+ywfW3YqvlJZlNoXSJPo62rps9872LL5QC4OF0EohRCEBFALvhzbMMOw0yxNeF2
         cHxMUBTE1XEEamV6Iu3V4MPoBsJImUS/0TaXHGu54pUNW6+dKLzfVAGYHCw0zTvVq57s
         M6EeBJfuMSE4kJj2WhGBJ1dAU5CBJOHJ7B2drttcY3bNNBD/gF1Wc1UrmFJNPBBZxvwb
         abTaBy0GtWiAqVahFkDVRrn6Li4Q3xhoaWAWhZKsMc+JAGoS+4M7rWkgvLXHVTCq0NaU
         GIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893712; x=1757498512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJ9qYB7I/+26Ck84iyosBQZh4d5xKjRCMcgtP0AqugE=;
        b=OID4phsr3uvuWOaEZxt/ewpXMqUvDr9VQOOl3mRtRZ/yMp0eCnBlOIW2qIZdGwtofR
         G76C8wIM5TxDCYoiV5hjOZuIjGHlpupzsbH9KgzMImXWdjeC6faLYHSauAw1zl+pXja0
         AFumVztjbjr6LAjWDoU9u3E0X8DHdoXiDxBRWAR2H97qFYLVHZG+vqU+WPjKSa9Yaky6
         WD0FKe/cd3c3Vv4/YXVTSk21IbSWJrMIfc9B62QgvZ88nobLWyNnxaEeEUu3kNJF+Z/0
         0+aXeGqrRjBD80YKoaKTgKvHDK5XDVjYGdWHK0XMoVaXLgmxSLA7bbDyiTEbysnjJCvS
         6CiA==
X-Forwarded-Encrypted: i=1; AJvYcCWve6VAgrHxJm/DKP+L+qfGwoVxapg1TJs6Sat1ZslmdvoOdeCqo7w8laM/yDD6bV92LxJLELKvPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNKiOIsgxdd66v6PVWsstgQFzXx2/Y87vSQBbN3IG0M8Zg2CkE
	x7ccuRxvQsy3j/m/npYuYAvOWGs4xIBz8H1AHMvKzJDvIkRQnA+IABtjHWoX0xOkQ30=
X-Gm-Gg: ASbGncsBmTWmLYF7do/rToj+iGpjT5pe/9RTp2W4YV97js5M/C0Fx1c5dnzZLo3e0Rz
	1005GqVtLyFv7p4A4ee4vW9WMgUVF+oh5y2/1VMtVUNM8c04jRHgTAN2q2eQ4fP65zd4jXDHVdM
	FusAE6prawDygX1+O66e3sIfKzhBb3d9npkJn1Bn3y6SdDKtddUhCECxg4l8IBSQYxOMoYdX4NA
	zWvNVGiRSIm2jjnhqyB4dgkL4B9mQFl6nH8Y1NO/oyX28FDqjmCBSgLSigeUn0GpDEl07W+cI6x
	3CeQjxI5UMWZnEdlsrocCbIzJZLCsM/pIe8uuGYnEEHWRpzt0Z+8+BKwjnQ32EGYGXOj1VBsofm
	O29kfKJixaR3IV0St8JknCr4jQOlBj3Ifq9kl47HfxEymmTU5
X-Google-Smtp-Source: AGHT+IFlZq5oArcxA6dWnPr6LijEjpa+jLN9n3zA6K+uDuCGQ1hNKxqSyhK3P1G01ko5LeH0BDMpxg==
X-Received: by 2002:a05:6000:26c5:b0:3c8:29eb:732e with SMTP id ffacd0b85a97d-3d1df539ea3mr11440863f8f.59.1756893712086;
        Wed, 03 Sep 2025 03:01:52 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7e45:593:64fd:6612])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d729a96912sm10945323f8f.8.2025.09.03.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:01:51 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: linus.walleij@linaro.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
Date: Wed,  3 Sep 2025 12:01:04 +0200
Message-ID: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The datasheet lists this signal as PRI_TDI, not PRI_DTI.
Fix the pin name to match the documentation and JTAG naming
convention (TDI = Test Data In).

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 9996b1c4a07e..a3f433b611f7 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -847,7 +847,7 @@ static const struct pinctrl_pin_desc k1_pin_desc[] = {
 	PINCTRL_PIN(67, "GPIO_67"),
 	PINCTRL_PIN(68, "GPIO_68"),
 	PINCTRL_PIN(69, "GPIO_69"),
-	PINCTRL_PIN(70, "GPIO_70/PRI_DTI"),
+	PINCTRL_PIN(70, "GPIO_70/PRI_TDI"),
 	PINCTRL_PIN(71, "GPIO_71/PRI_TMS"),
 	PINCTRL_PIN(72, "GPIO_72/PRI_TCK"),
 	PINCTRL_PIN(73, "GPIO_73/PRI_TDO"),
-- 
2.43.0

