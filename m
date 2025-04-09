Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF34219A7E
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233474; cv=none; b=RIngAPqCb6ZOPSWg9qsEAIpmZtmzsWlgj7lpR1BPvR8BaTVd3NR3JjwbdvrMGxm2DUyPT/RhnNY9p5IcdEzYpFwK4JyBPWW3FtKstdyjRKFBr1hnQHKJ4KGGySlAC+/Z/PaDxSjeUiRHLxfEFxe35vp8yWr9ziLrUCOPZKV+JkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233474; c=relaxed/simple;
	bh=i6QMZeQliBXGkXhmELOM3S9fM4/68sTvez+Y1SdurqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdfIYHr1daZNs0YriUM7ZhvQsRzODQaOQlmFBj5j144B09D1+6aWbG3tvxeRYHdAe5fCFgx2hv04QqM/cWe4ko/3QARHpgDIvgffQ7r6/hncswa1DoruuEptuBc+16SclN9etfsG66yCYETPoSwuAtvjaX6Dr2T/y5stbpqsRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zP5nJbat; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zP5nJbat"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso7176939f.0
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233472; x=1744838272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGqNrfhRW/VPigxjf78Q+G9LQoValPWHjpgKCcSc0+A=;
        b=zP5nJbatIFl96dM1Z6rI3joo8tc2mcVSGLqVO2jSzxbluot1+kjspyS1h8usbRFLg1
         AVF99yDtfBerYQ4D3092Z7KOTdmyKN0T3BplMiPAXHfAmLtDZODzjqoHf9Rsu/qy699S
         g5+ebEYwOYl6YaVOlGc2MDaEL/Ozq90P/Fz5hr7vHiS6SodjKSpON0qJDyqKQ7utHtvf
         M8mduIaiS7wxW1lsp2bbFs6pklfk9G7F9H1el0pzF5LpSKA47BGFsO3F62MVuILQfp+O
         TN3zQAR2jS3FXW6JSFTut8TqoPOmrjNdpnYXPCjzrjGcNIfOh92hwVkd/6DI1Lslgg2J
         cUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233472; x=1744838272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGqNrfhRW/VPigxjf78Q+G9LQoValPWHjpgKCcSc0+A=;
        b=XN00jyLaTQphi93g3e+B+yH0ME5USGD2C2/GbIQdPdmVf3GZZnlxIULR3qYzsIoKWM
         KvadDeuZ2j0+np8M+B4TpBSGEDL3n+k8oa7eHzaYz2alth+rLH1d6RzWz/VoNJTLQMw/
         y6jwl8JmvBxFjRNorOHPVpgCkBUQT2AeAPNyasuc7VwHOrVKasTqwfTDjHzNKQE7On2F
         jeV8sBe8XxX7eBPAN74ahWmERhJi/22LaPHPXu/WrpmWONztosFSFVASkO6RZQi1ZEuZ
         6azfrcQsryMqGij5bxnhPUrfQUGQmrB/UPvV/TsGnWOQieg0e9VHqGoLfK1gdyS+ZqZW
         vbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg52FANQp6lV5Uju85sY4b/kpQ7yWzAISHRiRi7w1fnEENmepZBVWFqCaQZ3CZ3ULyYlMpOJJdHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOnNNdRvLciJasEcklufNX05Y11HmDANv0WxIk5ko3z+oCu010
	0go1AAK4UFAaIDzJnraxY2VlxoGjGc/ljeyEL3ASmBtept2vEinzx22r9LSbSgo=
X-Gm-Gg: ASbGncu8QcnQTbljBqtngpfL9+pRrU86EpD1PL6oXq+LGttCDylkt31kcQxfelVQE5T
	7ilFFoATEzXbd1QAfzJWRxDVyPxCwvqgZETGa+NdpfK8tv/Adf3OAgdptNZoyKKmsxRcaKYAeLA
	1F4mj5Kwt4OzUarXwTxiigjPgAIGi+93J5A4V7Ng3gWRL+ikTNP0jirAhhByILojkOaljrpmDnH
	T+EOjV4tgODuwzrn8fzFTvVWCIwmQ/oAtO8MXgl8dD5KGD1gffLfCuDGuR0V4enp/xDX1SPnhb2
	+ufZYp/8BmA6p7A+8lzMVM1sUAZqd+0KTbJKDQGU/D2MahrLgBIG9c4+RyVEw+ql4RQDTI57o51
	R1FTq7QXN2vqv2g==
X-Google-Smtp-Source: AGHT+IFEHPef9F0uv3pXsoWPI4R+kvDCIMm2kirESEgvm8sQs83/WxUO71MEUbAIM50tLqB7gPts0w==
X-Received: by 2002:a05:6602:19c3:b0:85b:3ae9:da01 with SMTP id ca18e2360f4ac-8616f19e832mr27550439f.4.1744233471871;
        Wed, 09 Apr 2025 14:17:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:51 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: spacemit: make clocks optional
Date: Wed,  9 Apr 2025 16:17:38 -0500
Message-ID: <20250409211741.1171584-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 7715cd38434f7..201ffefa5fa9f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1369,12 +1369,17 @@ static const struct reset_control_ops spacemit_reset_control_ops = {
 };
 
 static int spacemit_ccu_register(struct device *dev,
-				 struct regmap *regmap, struct regmap *lock_regmap,
+				 struct regmap *regmap,
+				 struct regmap *lock_regmap,
 				 const struct spacemit_ccu_data *data)
 {
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1486,6 +1491,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

