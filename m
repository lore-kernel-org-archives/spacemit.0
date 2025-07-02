Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAD328DF16
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492230; cv=none; b=V9jxZM99wJy6Em+LgIIVyV1CHytGltbN5K1YnYPhEL9W4qFbR7I+ovDeSdJwX56b88N6Erh25VfzlTksagiw07MJXRNIbPJZEJcGt4SwQlaB19FFZPMhrhrX5G+jvJbVQV5qiIRIUtBGezq8AfPSEF04LeE/5fycRsFDkKpPMH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492230; c=relaxed/simple;
	bh=WB/IrpIB/wfBJbu5dFJUlcKQY59F+HJ0MTfMkd8sfQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGKeYL3NRxrv0OPlRVuQIXqTw4hW2/a3MMXgplIXBpSu9j9R0HCQQM2WY7RJ/KolnRhpBY2WqvRjsi7gFGC19Bk3lXY7krp6CgxCeoSFFLFBz2vajMKe5Q5kGi+6O2Gvl3uXJcALZok33EmJQzCOU+/wzryjJwJYbgmygX2N0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ItLz7wMN; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ItLz7wMN"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso73516696d6.2
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492227; x=1752097027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z77tQyjzfW0dcmF8i2CALNcRi1lkFInteyFHSr2VXyM=;
        b=ItLz7wMN9L0CltZVgFAhg36s+CM1xuaVLwGaMiN/9wgMhvldvvOAdIjK/0r3jetybk
         tSVmx5eVRjfE4YWHWf23W+4zj++Zyf2/F1eZl4vJAU2eBFffMwireec+BGnZxJZi75eY
         4Y52u4/BXuTgtMDt0K79InpH1EPB27rL+Fw1w5I7gckPqQuPFu888EDeB82kzrzQ7K8+
         FARrYhYng0ntn3k7X4WXZyvJRojvOzr4da1y2QrxfrMhg9iWaL59csIRu9XIsfS2U9uf
         pUkogkv4gsMez76xcjJjtr9tYasts5U8rlq//lcMxKV9ld3AB0oTUZiisGRMAqZLms2W
         wfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492227; x=1752097027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z77tQyjzfW0dcmF8i2CALNcRi1lkFInteyFHSr2VXyM=;
        b=JZRSmxgePeFnU+/cxE77kcp+AP3or01aG29Fr5QP9aTC1fGJM1iufSOQXecW+kJIbi
         BmhhNdFUJXnJtjPZmkxLT/p7P0fcMBqqzOj4oQRP5OaIvEJmUJsYUWx86o+8uWaNexBh
         A/QdufkxbcYU0tZ5htOUCDo5SczFWwU5VzZ/h1/jIhd/+1lAbD7sxCCX09gofHX2799h
         I5mm+CSBXD9J6LXkZFBBETx+5PnlKaBL0/oDdOGpjucIyusdIlXUYCxaUszvR41gGrxQ
         UO3hhqTAwKM+5lo9v6JmmCJMQSGTlDLBo/WRR1j6WUYBYhjLyklyA3C3RT7lBUnj+jno
         jChw==
X-Forwarded-Encrypted: i=1; AJvYcCXukU+7JSI2/+mXgcfRRhqVDehYNeTiv+FLJTi2IYcl6dlMnRG+x1hdnQQ4QqY0ZgdD4V+7eypjOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPBAq4hlOE+eF+7EX75DWmexT0mxszm7RhbuZs2oplwLqWTrRU
	CjsePGYuwfKumWKe0z4V4SCsY719ueCU8cYJspicEHGX89khZxryXeG3AOOGTlqHYKk=
X-Gm-Gg: ASbGncsj0sO80oQ/nhJQaKua2WI3S60EAJwsRjxirgbtoXW59ILeKI9IgJvzGnLDYwl
	Qhw/fC2ik+aR2sIlubP3FTsKKanTD6w30wgh0pUElSExBXTdiUPM4dVtVLlS9jD7xo4Imta9Exn
	XtafkjG6HqDlsECZOiMDcvxhQU1Bm5giafxEoE7IcqATh63RJFl6/bCgFfLIcAjRCqDwMQwtlPP
	fGg49cDDR94zPwkrka45TxSTNjYHfLdUfAu2NiwvQOyqIMHrqMPSGs+EEmFPOFDCr+3YLOmX8Ay
	e88BH0vTI96F7yhEGiNRw6sh3CN6OrBVV5ZMaw+yB1k9OdGI2brbK2m6bQfeQho5Nniuexet6GT
	9y01dDHSUK4i0INO2iYP/CrSWe55BT3kraXY=
X-Google-Smtp-Source: AGHT+IGRObx6Rpk1Zs9IQPZXVPL/wda/SaVAzAggTxX0GxDaBqWEjwz2sqTqj864Fw46dZI0C1TGsA==
X-Received: by 2002:a05:6214:2342:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702b1c1ed54mr54743616d6.43.1751492226919;
        Wed, 02 Jul 2025 14:37:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Wed,  2 Jul 2025 16:36:51 -0500
Message-ID: <20250702213658.545163-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All devices supported by simple MFD use the same 8-bit register
8-bit value regmap configuration.  There is an option available
for a device to specify a custom configuration, but no existing
device uses it.

Rather than specify a "full" regmap configuration to use this
option, Lee Jones suggested allowing just the max_register value
to be specified in the simple_mfd_data structure.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v2: - Allow max_register *and* regmap_config to be supplied

 drivers/mfd/simple-mfd-i2c.c | 15 ++++++++++++---
 drivers/mfd/simple-mfd-i2c.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..3f959f4f98261 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -33,16 +33,25 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
 	const struct regmap_config *regmap_config;
+	struct regmap_config config;
 	struct regmap *regmap;
 	int ret;
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
 	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
+	if (simple_mfd_data) {
+		if (simple_mfd_data->regmap_config)
+			config = *simple_mfd_data->regmap_config;
+		else
+			config = regmap_config_8r_8v;
+
+		if (simple_mfd_data->max_register)
+			config.max_register = simple_mfd_data->max_register;
+		regmap_config = &config;
+	} else {
 		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	}
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
 	if (IS_ERR(regmap))
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..706b6f53155ff 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -27,6 +27,7 @@ struct simple_mfd_data {
 	const struct regmap_config *regmap_config;
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
+	unsigned int max_register;
 };
 
 #endif /* __MFD_SIMPLE_MFD_I2C_H */
-- 
2.45.2

