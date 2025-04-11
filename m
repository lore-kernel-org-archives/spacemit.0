Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54538283CBB
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403918; cv=none; b=FBctVKOFCgrDJaIDl1WSNg5LNeVWuR8nuSk7J1C7XY6bNfxTszoEVn5s60KrSXW1gT2ma2+P7rdLH9pkRdWf+Q71EiJYaJ2lISW6Cot6foSQBz8idB/chuqv4JhDrj8nJjoUaikvfUnjpuUv+pn+bsIobL/VeQRX17Tw8zsj7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403918; c=relaxed/simple;
	bh=ucvbVh/yXALhRLORxO86EDtcUDjhXV2k7FhsHq1IhHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6DxdEMxAGv9HZN/zKnBq7RHKSqg6rXokmwbuX2/9aGqIocMgVyGpV7sIJwiMHkqiVD/tdxnHJ/A/2PwtXgr6F+LcUHfw9gys3KnjtlRR4MLs/Xc1s5dhQsKGZtIY90XQBadO3ZNoumKKBxQS+3ZrFkBcxklUKEGKioSltIELW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MrTw+Y/c; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MrTw+Y/c"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86135ae2a29so202407939f.2
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744403915; x=1745008715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+No0irtswkb42oZgjOuCr5NaquvvHMgg0F5193JRX8=;
        b=MrTw+Y/cISatrW+eJoa24QzaV+uXETmo3U9OysKRwBT3v8v2kKqcSLIVnqXOn3hWpX
         EQLKn2Q7HL17F/bPeU+nADfOK8mO+hcHrEZm5TGi/2FslhqzxSbKBJnV6FJX3SC2a3M0
         jOrLURTQBghDP7DDQozKZsmPV/UTQbFti7i82ymwQ4SNKmCC3Rnx1uI009OwMssPNtbz
         K8dkpmzvKDz+Gj8tkfep8wzViunRzQJF/XkuxPQOyza6ESjPP3wuPl2sW8Opv2G25jX+
         N98qI1cVttGukOj2QzU+1OgEu8bKWN4kMbhhC1uNgLMd4X4Im5+fwuYOjK4u9/uXYTVd
         Y2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403915; x=1745008715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+No0irtswkb42oZgjOuCr5NaquvvHMgg0F5193JRX8=;
        b=XDWJyb+pz5W1gUvcECSifbzHHrsmNcYPvv6+QesEL0V3xB5keAjlS1Qg12LEt9gHA/
         rXxfEKK2BZdlPqTSBBwG0h3byWjklQWvUskvqo0FM7u/5u4efob84Z5npCL7kk2+B2lo
         pD8XBgVb23VfzY/SkLo3JssZtphh8ntU8Z3nQEimlOIlk2g2NRxnWrfBGAsFbsCm0BgL
         Sq2qJ2mjCcnYqfcSUMixfsKW297mgEHJBjkU+WDFcFDa9vJTZawdhkBMYDUoeJBmbV2V
         TiAD6yQUoW4QoCfe7Khhzen9sKD7dpxkDZ50Pgsudr44pqMoPrWQ0jl6AzW5J0L16oO0
         5tFg==
X-Forwarded-Encrypted: i=1; AJvYcCUWrqIgRoEwBm55pcXQOlOvGGw3schv+WBZ26q7mofTlWpqAdbLfJQoFGPafLIglxlHzF4E+6Kujg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws9TZZNfUFXbCFSedH2jYDjdw5cgWfksKxrEogIGJN3vKTXnQQ
	/GykkZ33qY28eTyv7tTu65S+/FBZG4hO/w1F5Xx/7m/gU9IgsDId536Bd7vyQo4=
X-Gm-Gg: ASbGncsQWviWoCQ6Sc9//0vERxkmJ3oXIT2g8lEeINmlvyc8RwYZ6X0zaD2Cd/dTq/U
	/aLTDWyR745UjxivU3m6SDK2rgIWCNa5JQHUSD6OHr0ltA+eTl/sC2PRNZiQEqswoNdIGVUhTdD
	vCOhHcrKYrveZDSOtAHaCvAcpyx44HMiBk6zwNjEMZXB3Vutelpk9TwSuTGJJhwCKcHHMW9Ykym
	ClqOgOnCoyx6K1al4rXtSa2sLwpIqwUs3PciP6R8x/DBEeEz6g+BYX0pDXNx9yL0jt8qZh2IAsb
	LWdzX3D1m+E5X+BRqDc61GqmDD4i/LAghcJOgEIRPdr1zHfKHoTNHvhmLFrVLA6H+JYLvLDHwo4
	9ZnF3DzJhfVVVFnKmetueV3i7
X-Google-Smtp-Source: AGHT+IFI78Dq0uhLXGQ3VPmWnhBpX7t1jvh+2+h32uhUwjru/tDqrj+isW0Bsi4fpyNX4H8KLkVFTA==
X-Received: by 2002:a05:6e02:258d:b0:3d0:237e:c29c with SMTP id e9e14a558f8ab-3d7ec21bdfamr43241385ab.12.1744403915441;
        Fri, 11 Apr 2025 13:38:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2ea1esm1420787173.123.2025.04.11.13.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:38:35 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andy.shevchenko@gmail.com,
	dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] serial: 8250_of: add support for an optional bus clock
Date: Fri, 11 Apr 2025 15:38:26 -0500
Message-ID: <20250411203828.1491595-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411203828.1491595-1-elder@riscstar.com>
References: <20250411203828.1491595-1-elder@riscstar.com>
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

