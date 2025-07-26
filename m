Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBB0246BD1
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535417; cv=none; b=D0qMmjP2u1fO8KpQK3FlDbeMVUras4SnWvREsyNfYJbmHpHwhEfhe1mzvcSDk322RahoRTTq4lob+7DELWWREajrLHEjqDzwx4/GXnG6oEOumezkWvP7L0qy9lQUQ0nYSc1OFuCxpI77EpLKIpRJDWqN3yMHZqoigiUPrHdU2J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535417; c=relaxed/simple;
	bh=i24VZQoL4HdNicf8fZrx7hfEBriE1Lb+9VIUFSrq24E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FbBHjfw8XXnqwJYATM+arfM592KPi8zJQ/i2KWB0g49k+pLBQfOl07tzpRaClqasz8FJ5toTo35XYx0DX3wd2m+yTyAWWSR2Rh1sPz/O7GazpqNNMXz7eB7A8uj7tDvzkq80F+Ivgmwnv/tiKpVdpCCGPcFowhEUcJj4ZDCckwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2wlnxlyd; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2wlnxlyd"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-880f2623a6dso96361339f.1
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535412; x=1754140212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBjRH5dYFSfxMS2Dw/xrzSnit2iXBotKiwm7tMWcaRU=;
        b=2wlnxlydiOYhconIFum0yJyPWvRndFlm5CzIBxJSzgVj3mARw2d+C0ooQq3zAPHEeD
         9z9305dF0Sn1gY6IqwkzUGdtoFdv9xkbf5HqmtifLdU9xfgQHOWaZh5qlwNufzcE/Lxt
         ICvGWa0RVf+JswIbPnaoGoj9jo1yRRY5IFwIR9FZ/SkklHibuVkt/8NiKW95cBYhaBWi
         GAf1ZtxinYIX91at4B6ZtYcc9TDubf9eKcb9iIEiIBZEb+Ib2MW1D4t1u/SabZR6Tkr1
         +HXBzgzp2qg7fChUe8AnkGrGa9VQPmBNsIiLVv29z9gj5opaH0LaFSylUXWH0Y6q55iX
         NLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535412; x=1754140212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBjRH5dYFSfxMS2Dw/xrzSnit2iXBotKiwm7tMWcaRU=;
        b=OqlGf2uUQ9yHmCtrr/Wz1yfMJSls0zN1KiwStHmWl3mAhfg9g7NH9kun1q/2Zemb27
         Pd7JKOdUm9ZUr2m3HlSQn+8207JYbrYWO537rOtSHwDpv/0NcPQm9vqhli1fG0xrSEO5
         /8mfMnA82EcpWLxvidQxsE6sapHEHstrWLzhnPMUVOR8VXRpZIIQRanAscSQi1sBCwmT
         3K7eGTx3QAV1sH5ckU8RabY4QaXR/hZdSIr00JxSFdg5Q9SjzoKC29uQ1dwzAKVw7Sn3
         EM3gy97Wod2x9MYxGDxksPzj+EmXcKEGF6alvT74SJPX29FldSeRFMUMt29XUEzFzHtI
         KNTg==
X-Forwarded-Encrypted: i=1; AJvYcCULsQ/uAjwd/LmGIrGZvuyoUIP+ID8pzPBUuXsiK9vIIP8A2ifiTavys1V+sTAblPeNH8xmrlbZhg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5WA2DKKnefS2ckQrb63DKvrdo1mKhO1gnJ9LXZ5GZ9fEKmKn4
	GpzF4RlMxctgTxkDbIeSDcHzMDjpVYYIGAOIhgiieor5cKjMkFUzF8hXVBOdBFD+/WE=
X-Gm-Gg: ASbGncucU3T2DdaO8/Le8OZdbhNAGA4LxOPDDmW06hfYa8zez5CniEmZDTVUDOMXq6f
	79QKrlK+HZwyK1RJDbgoP+r9u+sQX3aBEQEG4tN4MCnqSxmf6E3n/K2SbUR0Bb3EV7451cahoso
	Eh8y5qkrNqPgy4jjzYuj6xoz6by06Pt9PYTFEHgCmC9zKKypk8RNxKbA9Z9r3iKFdp0znckwVRB
	4xpcsz+be+S/zGTgA7XWAGompuLbNFMuRyClLw8B3XLmNs0uyObTEuzcpruIwIbu2pwBg96DDDk
	LXzQF2SNWCsIupz/TEoo2lxDWRhmIEOkRJOiz/W09/il0diOvX1CVZPvCr89LTUz0hUA5cu3pqS
	zD19xmLHy9TEvM4agRvlf3p8z/Fwyxr8NTlGSx+rljjtgxlpQUzdlstuNhfJ/5NluAQ==
X-Google-Smtp-Source: AGHT+IEMiSe1+TI8S2A/w2fU5yeWMCGvndi/cNc/yR7qunidcz9YFlCFnwcgzawUglMsdcxbT5XxBQ==
X-Received: by 2002:a05:6602:1582:b0:879:c609:f5a1 with SMTP id ca18e2360f4ac-880229bbf86mr905586239f.12.1753535412429;
        Sat, 26 Jul 2025 06:10:12 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:11 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Sat, 26 Jul 2025 08:09:56 -0500
Message-ID: <20250726131003.3137282-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All devices supported by simple MFD use the same 8-bit register 8-bit
value regmap configuration.  There is an option available for a device
to specify a custom configuration, but no existing device uses it.

Rather than requiring a "full" regmap configuration to be provided to
change only the max_register value, Lee Jones suggested allowing
max_register to be specified in the simple_mfd_data structure.  The
8-bit register 8-bit configuration is still used by default, but
max_register is also applied if it is non-zero.

If both regmap_config and max_register are provided, the max_register
field in the regmap_config structure is ignored.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v10: - Rename simple_regmap_config() -> simple_regmap_config_get()
     - Introduce simple_regmap_config_put() to free regmap_config

 drivers/mfd/simple-mfd-i2c.c | 45 ++++++++++++++++++++++++++++++++----
 drivers/mfd/simple-mfd-i2c.h |  5 +---
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..3622f189c8342 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -29,6 +29,40 @@ static const struct regmap_config regmap_config_8r_8v = {
 	.val_bits = 8,
 };
 
+static const struct regmap_config *
+simple_regmap_config_get(const struct simple_mfd_data *data)
+{
+	struct regmap_config *regmap_config;
+	const struct regmap_config *source;
+
+	if (!data)
+		return &regmap_config_8r_8v;
+
+	source = data->regmap_config ? : &regmap_config_8r_8v;
+
+	if (!data->max_register)
+		return source;
+
+	regmap_config = kmemdup(source, sizeof(*regmap_config), GFP_KERNEL);
+	if (regmap_config)
+		regmap_config->max_register = data->max_register;
+
+	return regmap_config;
+}
+
+static void simple_regmap_config_put(const struct simple_mfd_data *data,
+				     const struct regmap_config *regmap_config)
+{
+	/* This condition holds if data is null */
+	if (regmap_config == &regmap_config_8r_8v)
+		return;
+
+	if (regmap_config == data->regmap_config)
+		return;
+
+	kfree(regmap_config);
+}
+
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
@@ -38,13 +72,14 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config = simple_regmap_config_get(simple_mfd_data);
+	if (!regmap_config)
+		return -ENOMEM;
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+
+	simple_regmap_config_put(simple_mfd_data, regmap_config);
+
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..6fa36b3d7a217 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -8,10 +8,6 @@
  * shared by all sub-devices.  Children can use their parent's device structure
  * (dev.parent) in order to reference it.
  *
- * This driver creates a single register map with the intention for it to be
- * shared by all sub-devices.  Children can use their parent's device structure
- * (dev.parent) in order to reference it.
- *
  * Once the register map has been successfully initialised, any sub-devices
  * represented by child nodes in Device Tree or via the MFD cells in the
  * associated C file will be subsequently registered.
@@ -25,6 +21,7 @@
 
 struct simple_mfd_data {
 	const struct regmap_config *regmap_config;
+	unsigned int max_register;
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
 };
-- 
2.48.1

