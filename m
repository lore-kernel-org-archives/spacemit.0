Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291286;
	b=OixMLqcWPl1HoQJ2Wso3Fijbr7gtJDA1VKrnIjaoXrRqW2BhqOwLIWSWXvc5XxPrHwls
	 GqmMsprdIQEcTWk4cvXAY/DxtTK+JsMWi09HKfk/m3n0D9VGh8xbGkBp6O9452ITsU2N6
	 gwGWe1dlgcWiQWGvKGjsqWNGnpweBMJqGX8RfOeYPcNUEbpG0TJhBohSzxueh1zhMZ79X
	 kyBrj9sh2kUEFdXXnkb+GQ3gz8LINZm8l6NRXK/GVWxxYC7PviTHpxF/+muXbinFZl+aZ
	 4UooI4BrLpt5Sfno0t3MvUv4nwuEcj2nA98/LJ4n738W3hzww9Hx6eZaulIa8mootaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+HOH7O4j20KDfBtKxtSGJ323bTE8G0lrShsobfiCmIU=;
	b=WzYhxR/liODma/SoosFB1QJ3OOExXn42IVvNcvxR4iUoRS84btT0t22n6NYa48sM23t6
	 MdNG7zIUiYWEsIU1gwKTm275nu95zmP0adTXt9Scih1Wc3xmfK+tMtsnJbdf5timVqi+Y
	 q7YleAUaxU1MX0NXAsTvEgfiJBpw0m0qeR+HiItDfYlxZc0dkFDsqGR+6LcY2rp5941eP
	 C34ILkSVrP2X7sQq/htFm9jHHkYRdEFyUVWsyD8AsAtZyYi25FywAOQqEtHHwL2tyfiCx
	 6cGFhKPuG2SNZRrnboQhE8Hx14VNlcufAEvvSSn1uUro7oTpXba2OvwTozS31HowU/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuSFUqKi;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49813606A326
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 06:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49813606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuSFUqKi
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so610500c88.1
        for <spacemit@lists.linux.dev>; Mon, 09 Nov 2026 22:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794291284; x=1794896084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HOH7O4j20KDfBtKxtSGJ323bTE8G0lrShsobfiCmIU=;
        b=HuSFUqKiUcZ+g6jL2tN3y+OjkEj4JUkU9gw7SKu2kE4TEPfNnd4T1J+obUgNtI3AUU
         Wz+9HayqDjQqlZomEtrHU2GvaWfvheD094uloet1eBBr9wvtnlOFu8Cr+1AEDtuwN8P3
         g3S6uBMZMMZb0mhDj5t492grVDbb94fCVMZIAUseMiQCGKel1gl0MgVdcBc4x6XgKoFJ
         uZbn77K4+WTt/mTnecGpfqGA6C94ZFamF10sSPAxsgmYUSV863h2Ro3SJrzc8ct9BjjG
         rDnW1HXH2KkSXX3ERhn0fWJAnKFswopNZkeQuaHpSniaG2B+NTDayK3DTnVzXSORhtJw
         Mnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291284; x=1794896084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HOH7O4j20KDfBtKxtSGJ323bTE8G0lrShsobfiCmIU=;
        b=HrF/C7vtrHsXzFhIBOL03rMJI9yUOHMkIVxvCX2JNb0MCfDRkH5udEN1afQT9Bem2A
         6xad9GM857jdAhAI2px7nhKrOL5y8zEXlAgqk5Y65aXTZk+KQngVcKmc7sV0DYI3pLQM
         Pbw2QUcKT6R4XXMZ7/IvisSCMK4xA2ug/MUN+6URD/9QipDIFNN0gdqMtQeEGDLQwJUb
         DaZEf8Xh4pDV4LQa3TZT3GAF11y9iqw9kIBH7/jkBrYduntiurMR8jq4U0nGQmFyny14
         Rqnh35d8WUgtAezvliuK6w10dwz23UdFUlMj+HwXpxQg4tKlrzwgTwcZx9f7G14PbLgv
         /+rA==
X-Forwarded-Encrypted: i=1; AL+hErHLEd2eJdGT0/CoaasgQpJzehlyWZMDdiYJiccAj7tozeD/okq/wZirf4uPf4wafn+3RnZFuPhshw==@lists.linux.dev
X-Gm-Message-State: APuU4Z91XeG1L2pMOUvXmwZ9zfpGmEqvvyqy2zgooTlThfm0d1FvGNFC
	a9yEfhUppZQOTefWM/6obkYD6tiQJmMTOHvrxxXqqSLUi4nJ76oVAB8r
X-Gm-Gg: AYBFou0leW796EXqtGQEb7fOZaE/ZL7X+JOj6iWFIw0175Lmh1v9eWHTBBqvVGkaOPK
	ASyFzDUqYJm8s8Ed2+1rA6LAuxm4vZwA+KsZcA6N9ya7+FUTT1Wrt19W/Yv4r95GqhwW5V8EAVO
	OokpswUjIFFygyGtm555ivLweUcfdGZHSe/bT4WoH9Fr0STIg05T70csKxO7PKo+APHl2VDtzCF
	qhdKqVMeFY4wcuGOKPBj6UindsHgSa8XdTYfCJn4Qr31Qt70IZhQ6hHuJVs/4guY6WdvE7UDVRk
	xOs80wrtmSZmLG5pYCFyJsPAuwcMeMSleWt1q1JG263H3v1tEHql+g6eXZwMNFr1HedKtBEaQEW
	3oyZlSqJUQ8MVRCryZqP4acnVeGTRkCmlFwuBB3oGmhGo0XVrNFo3sYNEEb2ejNCWG5ZJcf9vpT
	lxOVPDPJn5qJrYtM/UIqIYOPCZkKDvMccX7vgoW5mV0tsXEI4YIw+EASzj6q3hKcZTW+6d5c7b1
	zY4ynEveS/A246HDXv2z5bIIbmoin8RAuZ8esmrq1kuNOJXMgbA6UzEp+MA3KekdiUkkSBvtvh1
	exw+Z+8I3z3aDGOi8L1kM42CiLxd1LAI
X-Received: by 2002:a05:7301:488b:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-3751c53546emr2305164eec.4.1794291284219;
        Mon, 09 Nov 2026 22:14:44 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm3802316eec.28.2026.11.09.22.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:14:43 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in atomic context
Date: Tue, 10 Nov 2026 11:44:26 +0530
Message-ID: <20261110061429.2036-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
to wait after triggering a bus reset request. However, this function can
be invoked during atomic I2C transfers (such as power-off or restart
handlers running in atomic notifier chains), where sleeping is illegal.

Replace the sleep operation with the driver's internal helper,
spacemit_i2c_delay(), which conditionally uses udelay() when running in
an atomic context, avoiding "scheduling while atomic" bugs.

Assisted-by: LLM
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index ff32876e24d3..f4b21d7efaaf 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
 		       i2c->base + SPACEMIT_IRCR);
 		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
-		usleep_range(20, 30);
+		spacemit_i2c_delay(i2c, 20);
 	}
 
 	/* check sda again here */

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.56.0

