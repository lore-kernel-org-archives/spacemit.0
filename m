Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE9B214209
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386270; cv=none; b=QBkq1TFLmtSUTw7pUBZvMiRhztKywI4CBu1judh4rYkamYeuOfto7u9KCkPJeItmXMFgn0GPFHJSHEUAl0fjisJUXxr05+Pic7gwv+iq4YqNrHdtDz/x2gAR2IJ5x4/+WvLqe0BTo3vb6aiQSmGXt9XMbqHL9mDMUDrqtwVvUYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386270; c=relaxed/simple;
	bh=YTCOV5qFH6rsTE5f1V8QRlk7DYXjTy4SSao1Noq3mc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PewcPR6Gqzholf3kyaNnSM4v3QofT46e3QFt3BMeK9PY0OBJumm8XR9MlvfFJj/vZiBZeCinUC9YMcYZDelfvKX/YHBNrvXgamZBhmUagQBt0OzEO9I5cJuXRWeKd1Zln3eMjjYl/KgEh32WJmnTvJrX55nAz5EikhZQ1V3PN+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CURgduj8; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CURgduj8"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86135aeca58so67935039f.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744386268; x=1744991068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIR6+1UCymjCvWnHm+vRVxN4kx6Kunaak/TDrneY48s=;
        b=CURgduj8YNfUSIat5DM8hV5TbxvWCMjRtRRBXiCWycA/7YKRa8bTa6nU13M7eIvD6H
         pE6JOvITmzrLoRqjEk0VYoPHLRUO6v+RHl/RlcFxTAuk1+Q1iKtP/YwSNWLee81EJSkI
         SBPSVvoCsZ/Ctb299jWzTbiRuy117tE3xeSfHs8she6FWUk1sZcuCWcFpAgauHAASgc/
         X9XuS9ipFpfLS98FgkHafWeTB1Vi9PK/xIE7Bw5Iqw8TK6DtFO17uRYHisRtciqwssa2
         yyIjMseo8f0qwG2l0+5nwq3TSEW2BBRO/XtvGB0GkSuWx+MfQP7UUjKrEKoR+nuRXIbd
         a03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386268; x=1744991068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIR6+1UCymjCvWnHm+vRVxN4kx6Kunaak/TDrneY48s=;
        b=SULcv3OtOkqOtGQhtVgagIxNCLjiGYkAZlf8Put8hQBo3hHde1ztvCCPNcMaQ128zB
         +TSW6HV8HRdPVzZXYe+WFwwSEHBCoIZ/dCKvGq++9A5ig9ZuURDz7yIoEa/0Fho82qzG
         XvHvq/kUkSxgbjJDMpkGJmmy5wATSiA9qewL7APPKT0evgpXcTs9R8DDD0GJgixDYhzF
         OAWY1A6Zs5R8WA6L6a5X2gAx8yrE3h7Z7tgfQSQ7Vr39KPzBhc7Cfb7wIierug/zasmA
         K5oB/hvCxj0pVC8JV5id+34rpb5cFhvD00lmsFWofUuWFiYPcmQz5yMUBSCSNg+9TERF
         Okdw==
X-Forwarded-Encrypted: i=1; AJvYcCXz6AtqVXWj+MuGWOHGzidphEIzOZFCayzYbh7kD5pv3dm+CBdLPYFsggKVfq2g4y2y5+c+/2dERA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVVhATI4uG7Ts+eoXesWUtguXSJmUhmc7WsyzTq77otyn1+4X7
	+Wukc9zLUTyVsvxTM4HydeGODilQpjODaDEKA8ucstiSsQtJ4kITsws1Gj2PWdw=
X-Gm-Gg: ASbGncvXlxsWDSjuQKl13c/qpFgrFEhdjd3UGjF63qlRr67J5QSJNbB9B1Y9Kg+CO74
	uBDOXXIxKp0ALyCq6x879i0nl8G93oC3d1mU+NVcGiGA4cQ/8v7Cw3/vpu0uLZEVJi9SEspZNl5
	uwPrDMkI9jDk6SNWEvzdF48YAZOPLJ9Q3fP09FvlvLpfM59GpuSAYwKewIw0A3GVePb/oiGnfPn
	5BsGICaimQOwfha516rHrC1BjZs0tyhZp3MH/Qy9s1PZzanDMPYTRP7M9NKuViEDkSThoG/equy
	BZH4/YEmEQnERSlTo5LK4Z2aZSHUPmshFLBQTJLLAlECK25iL27admoT8MF48peUczY5/Jd/AlB
	zw/dC8tKLEae0eA==
X-Google-Smtp-Source: AGHT+IGFDCID2V9OQ58DdGxUCrdRPix2Sm9SOyZ970XE5klNUQUYc7yCAtoOB8Vh9getD8RZI/2TFA==
X-Received: by 2002:a05:6e02:3601:b0:3d4:3d8c:d5b4 with SMTP id e9e14a558f8ab-3d7ec207fdbmr28814495ab.11.1744386268085;
        Fri, 11 Apr 2025 08:44:28 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf812dsm1276326173.18.2025.04.11.08.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:44:27 -0700 (PDT)
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
Subject: [PATCH v3 3/3] serial: 8250_of: manage bus clock in suspend/resume
Date: Fri, 11 Apr 2025 10:44:18 -0500
Message-ID: <20250411154419.1379529-4-elder@riscstar.com>
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

Save the bus clock pointer in the of_serial_info structure, and use
that to disable the bus clock on suspend and re-enable it on resume.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: New patch, managing the bus clock during suspend and resume

 drivers/tty/serial/8250/8250_of.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index a90a5462aa72a..8f2529f699e0a 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -24,6 +24,7 @@
 
 struct of_serial_info {
 	struct clk *clk;
+	struct clk *bus_clk;
 	struct reset_control *rst;
 	int type;
 	int line;
@@ -123,16 +124,15 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 
 	/* Get clk rate through clk driver if present */
 	if (!port->uartclk) {
-		struct clk *bus_clk;
-
-		bus_clk = devm_clk_get_optional_enabled(dev, "bus");
-		if (IS_ERR(bus_clk)) {
-			ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
+		info->bus_clk = devm_clk_get_optional_enabled(dev, "bus");
+		if (IS_ERR(info->bus_clk)) {
+			ret = dev_err_probe(dev, PTR_ERR(info->bus_clk),
+					    "failed to get bus clock\n");
 			goto err_pmruntime;
 		}
 
 		/* If the bus clock is required, core clock must be named */
-		info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
+		info->clk = devm_clk_get_enabled(dev, info->bus_clk ? "core" : NULL);
 		if (IS_ERR(info->clk)) {
 			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
 			goto err_pmruntime;
@@ -299,6 +299,7 @@ static int of_serial_suspend(struct device *dev)
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_put_sync(dev);
 		clk_disable_unprepare(info->clk);
+		clk_disable_unprepare(info->bus_clk);
 	}
 	return 0;
 }
@@ -311,6 +312,7 @@ static int of_serial_resume(struct device *dev)
 
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_get_sync(dev);
+		clk_prepare_enable(info->bus_clk);
 		clk_prepare_enable(info->clk);
 	}
 
-- 
2.45.2

