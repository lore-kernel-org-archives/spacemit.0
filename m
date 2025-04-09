Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8B1E5209
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226543; cv=none; b=cSVMQE3av8TZBLmKFZ97Ar2lFks5/mWGPsCVPRztvQ6e8JSBqS7ntEdD7YJjwzzWkOyaR5f6clF0L2XTxOCcBLV1KoYe62PpBYBHOW7lB/q8TeAEY1hfxXBX9eD33llcIU18DriTjVZZEWTYB8161Z5K1hvLPZUxQ9e1jd1WG4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226543; c=relaxed/simple;
	bh=Y2ilGHMUTXCya8rzOvmKtYifGjbu9RYpGCgzY3UBtUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiUwrgdfGV3+V2aH8HrEFuautRKb3cCiNX+3NxFRqmZ5X+nCpTl8uSYmisNneNxW1PZ73POciF+595lJbDIj0xpRxaI8kcdr+xMKatVLale6e+t06zUhzV1XHh1tpM86N494seHsEaBxQh3SbaJ2eb1d+KbmGqUgqOsZVGFYsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vzeAUwlG; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vzeAUwlG"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8613f456960so2729339f.1
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 12:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744226541; x=1744831341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNl26J3HRC4XsI0NsNHSQT2PLx01D+6pAV6deX3HHJI=;
        b=vzeAUwlGfYyxZqrwuW56ZOVxJ68JbSGNdObhrfxO6qlNYmIKPVnm8lvIhBbnmLoCml
         nE5DXcdqRlQaMR5sVGctgqV6YaQJaXrlQhysa8bjWeKBx1J0m0D//Fz0CRuf2L1UYXpl
         EcywUkzmY1xPkSli8W3CKdSPg7+FpBw/oCrbGOpacvRy7Ih840o3t18L5mTIkHhAfX06
         BVcs+EW8QPbqJWRYTC8UdV4hMXzmPOjr5TUIlsDOUkgWhDk6laXSyF/KvzAHBz/QRUud
         +56fME4Rr3+Bhzwt2p8AntsC2OLh0hswfXRExZRpMYxS4UCIXcH0teiuLph+30JE8E0V
         ez0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226541; x=1744831341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNl26J3HRC4XsI0NsNHSQT2PLx01D+6pAV6deX3HHJI=;
        b=MKqxGdMw6of79vDgo/mohL4cKWMkSGuW76ls8gN8URT4Au5XFGdT2SDTztdZspBCZB
         o5Ch4i1cj/7ZUCUVxFtvx67M2Q0o93NrJedC82biiVObraxQUeM7JajcrIuVmQlujrqm
         OAR9VqgwXSh84XE5WGKI7fe8lNyIrVkM7/tXANCV+5rRG6wk/2hnzCAVf86c/t8U8yHb
         Ci2WJ15shjb0QnuBFdA5vthB8ICXr+xtXmRC/kOdmJB1ep4JJGv4onYMjULlUEyhyo1y
         pExWGlBmCvHl+g5PhX+WZL3DrCn/0y2V8vw3ZctAC3KtEV5JObRf4KHexNKht9epdgwH
         /r0A==
X-Forwarded-Encrypted: i=1; AJvYcCVCTSyZ5eeAF3zf/X5XkIK4+3SmUS4dr94h/g7Fy696GgD28rEv0AYXKNIjK5Dp/3lQkzmsBAio7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8Hb0vI7Zm7qKM9DlMg3vXV6g58A4zcvh2dqbv/KXNyKFVYmEM
	FNYAQclr75eOwFwY751rzOWzQtEGqUcklgEAxA95cPIrCMzSTFqbBjtz+einDY4=
X-Gm-Gg: ASbGncuD5FlGbgg+vP2KwGvn88fTptUEAyucSN2gTEBO7MiEg0b9TvmnSy5Ay2Sa+H1
	qYSySbuoQ2htREgoc7te4OduwlW05ay227nLL9jPSfkfuGWwnywuKtoFUJ2M0CAsa8uLK8VjF3T
	ZDo1FGtwuBNOJTlafb71pr1mYKrJ19ducXUPnqFgJNKSK9ENQdA//k9klsVV2xvH6bx5IX3H/jT
	GsaqnnFFByg/4y68oVswVJT5Q3s18JQ8V4GYn3nNrzqdBq0L6LaRFyamKcBMOXtkis20sf+Uxk9
	w5V6N/HTxZbbY8aS6fJD2hXHhPRaYGZHiC4dYppqbelWtbTvJzciM5oF2QXCrMF0hG96VGFHupi
	rpnCgkynCJntIGyG0mAHY823k
X-Google-Smtp-Source: AGHT+IHad8+4ZGmSEydVvWi93B5NhjlEAMlDrR2UwaWJMa/MsGHo4UvOCZSyheMgn+3uP3r9HQq5+Q==
X-Received: by 2002:a05:6602:7210:b0:85b:4319:2a2a with SMTP id ca18e2360f4ac-8616ed25080mr12867839f.6.1744226540652;
        Wed, 09 Apr 2025 12:22:20 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf81bcsm373459173.10.2025.04.09.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:22:20 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] serial: 8250_of: add support for an optional bus clock
Date: Wed,  9 Apr 2025 14:22:12 -0500
Message-ID: <20250409192213.1130181-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409192213.1130181-1-elder@riscstar.com>
References: <20250409192213.1130181-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT UART requires a bus clock to be enabled, in addition to
it's "normal" core clock.  Look up the optional bus clock by name,
and if that's found, look up the core clock using the name "core".

Supplying a bus clock is optional.  If no bus clock is needed, the
the first/only clock is used for the core clock.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: Update logic to more check for the optional bus clock first

 drivers/tty/serial/8250/8250_of.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 11c860ea80f60..a90a5462aa72a 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -123,7 +123,16 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 
 	/* Get clk rate through clk driver if present */
 	if (!port->uartclk) {
-		info->clk = devm_clk_get_enabled(dev, NULL);
+		struct clk *bus_clk;
+
+		bus_clk = devm_clk_get_optional_enabled(dev, "bus");
+		if (IS_ERR(bus_clk)) {
+			ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
+			goto err_pmruntime;
+		}
+
+		/* If the bus clock is required, core clock must be named */
+		info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
 		if (IS_ERR(info->clk)) {
 			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
 			goto err_pmruntime;
-- 
2.45.2

