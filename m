Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE28F2135C3
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 15:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386269; cv=none; b=Z/lX+xbEQDTUIL38ffMc2wHTQodAtJDpEEXEWyBMJ3rCLauadRnYp26YxVOc1v+1qEvUQNgIFQn7W5AseXxNh6bxBpAVv6EuPD78SNa/gbzOi2103MnyFdqTLKpUXFDzA7ySOD6VTUhcaqHH7wa5ghhIhRhgFK437+NclgLZ+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386269; c=relaxed/simple;
	bh=ucvbVh/yXALhRLORxO86EDtcUDjhXV2k7FhsHq1IhHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPRb/y8sq5gGdnXi8IVLv7Mo5xNkXm1MKoiq8SjRvDR3N6KodGBaIw2AKlD2Ads2o2H/G9gaSk6sk/Pv5RyF850YWJelTBllh9LdczTFJvnTBqFOlmmKorqiaQdG1jG+6APz5YdGM+HbFe89y+eKbBS3c2JIDe3dkrC5g/+VFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Gfx/9LV+; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Gfx/9LV+"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d59c8f0979so9856865ab.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744386267; x=1744991067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+No0irtswkb42oZgjOuCr5NaquvvHMgg0F5193JRX8=;
        b=Gfx/9LV+6pkPDa3Mk+dADukpicqWdIn0hWgTDS/vOIZCBRqYgB+fsxGk+efn6dpREZ
         kKh5DYjRhPfIX1jHEVufsK4Y/LL+ivPFGtr/tsp8yV8+iLNqoOByHI9KzOfJ4D9SDYsb
         Gu2zJgnXc5PFGVQGzxVQsIUETFZd6OjiPyEo1mZqc4l5Fw/uUM2I6815omxF0GLUNPz9
         sGEwRGYijSKaW5JNO6QdYEBCUmD8fO6K/N8eDsuLm/qFlR7Kr0PeoLUkLeHNMFZu4yn/
         wAU1tnCPldQmrH2IHqOgApRkm4fGRg7s9HGZj6sDyqoDswn6fDtCsPKq05DFM5t2dlqr
         EJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386267; x=1744991067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+No0irtswkb42oZgjOuCr5NaquvvHMgg0F5193JRX8=;
        b=dtBletMVisyw7pAr8ZQBtAq/wRTrX5lpe90P6HJwdvISXAhiBBuUoJqXl90fNsc5cX
         +aIniiYgyqjJruq6BtjcUeykDYPTrBm2F9meoHMQTvHcDFhdRTHZ6+lM7v0iDLIpUdtB
         eUdQzmbwUD7XiYkAKp7mRNfXtvtE090yh6d6J0no1nHVmGeJMEWVkoaZsAJ+xTU9sVHd
         sqMPmJpD3+rIrItRpQZPzRjhV1sqmt4bg8rCVuTT/ALNMZu6fbvK+K6GkQCRp00iOR/5
         L5WhtG8NGW9AjME/He/oQLbnjPkKKYw49a6qXSGCehLEK/WiqZIjT9J62DhC1y+wtGee
         f/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3agKMtPkwmMX2OyXXgiRQ1yiIydjlz1nmQB5p3wFsvuz2xmIjz4UBoOMPIonNerCAX56pxS8Y/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9jkfA34v9Fn4Vml5aHrEK8ajREi6hX4Bx9vjy3yvaNVsXN0Cb
	WACgg5rklIGbw5lXVyGM6/0GVBDNVjLffEgTrL8rUX/TApLf4JGaPo1Clo5gF9k=
X-Gm-Gg: ASbGncua16ZIvLB+JDFLDfZi1AMnc0gbqW/uJiR8B+hnCr784v7AHei2pGu6rStDisV
	6MQJag4cA15qBjU4mI5uLS/TYbr8oGdbbLpLgp+7huSqsl5zadfPN9woNgPuOJHrAMBf6DPbXBy
	ljWsS6sA8F/bSpTFbsJoIX+o44IXY37tp4SdrUqNsa4lsfzbAxHdnzlWNubc16W3vS64OjCl3ai
	Jm2sfonfIRZ6c6bAeR07zkz5cx0GBNfur2FacqlfJD5SkI6BI+sn2UciHVYhGDW90y+0KyF3UM0
	h5bw6ydnKognh1Iv7KX5gDn7yJNnLz8rdQZiMIzy7aHNf/Ki7EMUC9Zhz0JV3EhHJguUcdWPrkB
	fkcdtpW9wDoEqew==
X-Google-Smtp-Source: AGHT+IFHmGeALO9Wp+63MrFrWPOF/pQKiCJFNH3pXYWduOMBqvBFciOLd/8MEHS0nwfjD94ZFGolaQ==
X-Received: by 2002:a92:1304:0:b0:3d3:d08d:d526 with SMTP id e9e14a558f8ab-3d7e4d0c549mr59399825ab.11.1744386267024;
        Fri, 11 Apr 2025 08:44:27 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf812dsm1276326173.18.2025.04.11.08.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:44:26 -0700 (PDT)
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
Subject: [PATCH v3 2/3] serial: 8250_of: add support for an optional bus clock
Date: Fri, 11 Apr 2025 10:44:17 -0500
Message-ID: <20250411154419.1379529-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411154419.1379529-1-elder@riscstar.com>
References: <20250411154419.1379529-1-elder@riscstar.com>
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

