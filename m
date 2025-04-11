Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735A528D83B
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 20:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403919; cv=none; b=BVND3zDLQw3PdYXKf8tfUWxHvFhjAj336xhy7h977FcZT1pm0Y04JCKY+KohAmjDpGDhIyrLmz/U5rrG9zA7A8athkv3V1Mr8QH16CVttKuThnrwCJ8iOdMoPYsgFO1lLdRazwQ93SLB6dZ4xAhXacsCSi90KVKgUQ3HhDtisdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403919; c=relaxed/simple;
	bh=35gorawSDcrg8QbS+s+M/Qi8sq0tSP1dR9KzDN+4gxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwv8RPNNzZQs2GIG9FlgeXOr8F1eER0+f6IYmLVlwhH/VoVZFezmyFE+1JpFuoapXffi5et0svbXiUc8jUQuF5GzHVAp4ZGPx5mEdFupo4N+aE3kzmBzfdgy+qohtoti6ytYK3L7y16ThTXDLr68Q9ttRrz/kYjuogjWahXs3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TLf9BFvn; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TLf9BFvn"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86135ae2a29so202409139f.2
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744403916; x=1745008716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0009F5O9wljpHFhP0qBedRkQq+IjHXl/vgFyYcghGBI=;
        b=TLf9BFvnbTWJ+LMl9OLRUxP3RuRz2CRBA1/Af5XHZ2aSJIW639mrWyboMDij6pw62x
         whM0pJEZlCE4Q6mc1mBG9PfSp8IN+8mGkxuubWaGgtV1ATcT7RSFKZQVwcjq5VKLkj1z
         BgnoAYYI8Fp0QR0ScK1maspiBSbWrM71oqFSW6ClsAo8GcRkLB2ULaRy7uGjPQ92Cr42
         qTeC826pJYg5Npnwt/AGsVNnMItPof87Th6CYA0KexDsrbl78ZaXu+XuQ3zcnwvbWleo
         HqTxtwBt2pLhciPAbJHq9q5Hk8OdnHJ8cwWZSIeoNXfcwSedIyvXD7lZya6QcsTq+ewF
         KxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403916; x=1745008716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0009F5O9wljpHFhP0qBedRkQq+IjHXl/vgFyYcghGBI=;
        b=dCuxI0ZCta0U4LN/vTaODvUFzcUT0QmpLAT8OZYI/tQhjDbnT3e91hTUT8DdiALLmf
         wPeO/PO13/0dAoT9rhUuJUzLfPPD4l1wfcXrO1E1VCWIvxCjrHASTV1KhjYcZ4WRHWaT
         zH9zScTI1SDWa8GwM5M5nklBg9kzGdu/6Dj7tLvEOdbgc3pjtWTt4R6ZVsZMEtwmATXE
         C2ZUC97zqkdhv8x7JzKQNpsTkE2TKlDGwswH76pTPAGc/HYdvjw2DuJOopEEvib/SO1X
         0dVtNJHm8s62F8Agn5ZjX0CZ33/emMhUUIFHTQ1biOU1JJYA1yFs1oVhOSkOBGdf38nu
         45Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXOT8LmgqeAwjSUS88Fp0deh13l5QwXNIfNPciJIKjNY2ftoVlt4aH6cXmmu7YbFusb9E24U8Zx9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOU3Z8HCseYR8gQYdB1NCAXvZakUGaYRaYUxMTo52bARDn3KrY
	Vm4f2Tsx2tgLb4Kugwta6xe0hi6AmecQDWzEC4iOvt1njEQ+TfJwD4NLgtgQP7M=
X-Gm-Gg: ASbGncsfeA6tuiTBF3jBWGfPrVJfbJIzmKAMgfxanXe7/snYYOW5E1dVnXQfhf+pZMv
	gR8OS2fYtEIWWYNceafkGf8hWAO7GNcnT/v0M4f8Hf/ZNP4WGq9WSTQgHVAgLTzIYKqxIIjzTKY
	mmZzXrBh+9T/ErSSL+Kf44WtH7SUpK9wOfW0o0mqTrvzAaUblwo9jfdrx05Y5EW7vOAQ/Zg6w9l
	r6HEL/4xeQqsaCLF5BADtZVEmweaBVTqhbmbgd4jWU3U3jIEIk6A0puIGtYG6Z7YnLTGwMYVX3c
	Ii4v7ZdjJXvhTqILkMfyb6v035iIBTzQhDft94FzePDEV7fd+ZPmvEFxcIVhMFwLp2XCtanoClr
	FjgscUrYxigFv8A==
X-Google-Smtp-Source: AGHT+IGqHP+A8bUdxXLeOSya2xG9dcuQXpXzTMzOhzOj4n3d6/OcbE382cLJQUug9NIF/T7vU4ELFw==
X-Received: by 2002:a05:6602:4816:b0:85b:35ef:b1fb with SMTP id ca18e2360f4ac-8617cb63bb2mr542148039f.2.1744403916511;
        Fri, 11 Apr 2025 13:38:36 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2ea1esm1420787173.123.2025.04.11.13.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:38:36 -0700 (PDT)
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
Subject: [PATCH v4 3/3] serial: 8250_of: manage bus clock in suspend/resume
Date: Fri, 11 Apr 2025 15:38:27 -0500
Message-ID: <20250411203828.1491595-4-elder@riscstar.com>
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

Save the bus clock pointer in the of_serial_info structure, and use
that to disable the bus clock on suspend and re-enable it on resume.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/tty/serial/8250/8250_of.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index a90a5462aa72a..d178b6c54ea18 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -24,6 +24,7 @@
 
 struct of_serial_info {
 	struct clk *clk;
+	struct clk *bus_clk;
 	struct reset_control *rst;
 	int type;
 	int line;
@@ -138,6 +139,7 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 			goto err_pmruntime;
 		}
 
+		info->bus_clk = bus_clk;
 		port->uartclk = clk_get_rate(info->clk);
 	}
 	/* If current-speed was set, then try not to change it. */
@@ -299,6 +301,7 @@ static int of_serial_suspend(struct device *dev)
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_put_sync(dev);
 		clk_disable_unprepare(info->clk);
+		clk_disable_unprepare(info->bus_clk);
 	}
 	return 0;
 }
@@ -311,6 +314,7 @@ static int of_serial_resume(struct device *dev)
 
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_get_sync(dev);
+		clk_prepare_enable(info->bus_clk);
 		clk_prepare_enable(info->clk);
 	}
 
-- 
2.45.2

