Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155DF25394B
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388721; cv=none; b=pywea8557+jPBt4bkLPRl8+wHAEnuKih7VRvfNaiqkh8wya+pJTH1m64AIb5v92durBkg5LPPRjigSDWK6Ftm3VBbml4szL6TPRLuIZwzT9AifChQZYU0mbx9Z1i4ez6m5rOuQMICWgrZRNAlq1Qrsx671QLeM0DGFKBKFOA3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388721; c=relaxed/simple;
	bh=UrNWY27+WGuXhBrr8FZ4VtBPQzBe5GWLS5gaqBEezLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgem7+auKmb+D3+WKXDjT9FR3QHhML6pu3eQw7Zn0yWJ5B5+wOc5meuXXuI6M5Ie7yq8vzTVVla0nmKwfCBtyEn1Si5FUbFWJt/1rwLWzQkA8ARJoCSLXHl01UoIPUDeVLfDPqTYOSxmj/mVFJvYa2geNVOQiQeaOwrQtBAHGdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eA52OA5q; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eA52OA5q"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-87c0ad018d9so47861439f.2
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388719; x=1753993519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUWJeO10MspBNvjbgvonhw7oiCj7Ud69EwF31dVMKc0=;
        b=eA52OA5qBBYsy5FAVjrdTmkFfvOFHT5A0PpRUnGZ9DAeG/QrqxlHil5tVPyPwsfSCv
         ldwMB5kkcx4NLyE3gY/Y6De6S2ztNy6Bm+Tfbtpc6/YjrmyzJMeaWJCKGzVCSRLi3QTh
         E6dqfsVjQmbwhECEEGE3aRV9a47vzkslDNckNKtsVOjhTcTZyDv0d68663wm/RVc3DNN
         sQvLDYPjjOSBaCCSOPof7vQ99QUBWglEDPMLvUI4Q3y7VOX7Qck8lELWWUYmrcBHf8Nu
         AeysLKFpAHp2DW+/N8PjbUe+xYi+PTrenx/FIFywByCAdmYydCRlGtaJKeogBt6N1UA0
         dXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388719; x=1753993519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUWJeO10MspBNvjbgvonhw7oiCj7Ud69EwF31dVMKc0=;
        b=P7zrILZhgHF1USiTc0D+pr/KU0SnkQBeBEc68yYKmI0KCa9X2ZY9mJ3WObmIVf9+37
         98c85jNPwS4YhbYf8zzJyNP3ADZT6yWT60iJJmEnNvSJvWGHgglC/6GjppRuXjulRPVN
         o8RfH+u0LWWI/4zwOYstSHBV1qvkfy6ot7/z+L6fElLgKQiwsyVhqeV2inyLmLx9nNhY
         UGeUJdWFaKGbZo7cd9ZsAHabbuoL8nETDV2/qwndiHVRj1HK2NfgQDJX4Rel983E+yvp
         cvQUYyd95ljyDMl0iEUmAInFBuZInPr2ZWPN/Itruh1g7nm580WP3QNmWB/j9bxwc9Jl
         OSTA==
X-Forwarded-Encrypted: i=1; AJvYcCWgj+st2tXFl3/BLaLor1GZgyL5HYo6otSLh7sXOR1KFTsdeWfrOnj1aPi9A1hu2CitBKOB9MOPcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXHb63zeQ0/4IAsKID7esPV6i2FjtdzlsYPw/yxdefx/0nveF8
	Perva0MtJmexeBpWiCN4kgOGxoPVkhAuyWYBbSX2J5KY0G5RjYAGCnxmLvHYf71UL1Q=
X-Gm-Gg: ASbGncsL+yoThDpjFP/2FV2xTGt/lQWkPcQNHfqXXwQt/8mj3j251osYx4wlg6ekERL
	Ste5Wf10Xngrj6WewzW5oVirm/Er9p8OAodRKOuaRvOD9FMYCiU+iHMqnbAsOwoflKEkIjGi6hJ
	hiHfe21yGzKG9n1DTkGoLce6opGmTZvT/6YUbYC0eLx4o7UJecV3j+iLl+zqnloFAnydBLcBNBy
	zk9uHbB234zkrTcetFG/26ewmAuiQsKH9bwpq0KA2HSZX9qBdaaykesE8npP+KlQUtMJNuXK3j3
	vpKTahxNnKXWb/M38JCDOea4N+hojWMRfkJSW/nlxGFQy4I9lA1lk5yy5dIDCN5aFqNMrlqyQG4
	Uyu2gIaLyFO2tFsTBFUIflJkbZdl+/xG4zOzsYHzY
X-Google-Smtp-Source: AGHT+IFUp9h4K9IBStIoZAgqsn9asnHHUeYZME463FiGof5MP3p6oGHeDXOYqEh2MNkn2bzq84JyzQ==
X-Received: by 2002:a05:6602:b8e:b0:876:7876:a587 with SMTP id ca18e2360f4ac-87c64dc5c35mr1342670039f.0.1753388719095;
        Thu, 24 Jul 2025 13:25:19 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:18 -0700 (PDT)
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
Subject: [PATCH v9 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Thu, 24 Jul 2025 15:25:03 -0500
Message-ID: <20250724202511.499288-3-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
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
v9: - max_register takes precedence over regmap_config in simple_mfd_data
    - New function simple_regmap_config() encapsulates providing config
    - simple_regmap_config() allocates a regmap_config if necessary
    - A small duplicated comment is removed in "simple-mfd-i2c.h"

 drivers/mfd/simple-mfd-i2c.c | 38 +++++++++++++++++++++++++++++++-----
 drivers/mfd/simple-mfd-i2c.h |  5 +----
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..f3ba79c112d4e 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -29,6 +29,36 @@ static const struct regmap_config regmap_config_8r_8v = {
 	.val_bits = 8,
 };
 
+/*
+ * Determine regmap config to use.  If no regmap_config is provided,
+ * regmap_config_8r_8v is used.  If max_register is specified it is
+ * (also) used, whether or not regmap_config is provided.
+ */
+static const struct regmap_config *
+simple_regmap_config(struct device *dev, const struct simple_mfd_data *data)
+{
+	struct regmap_config *regmap_config;
+
+	if (!data)
+		return &regmap_config_8r_8v;
+
+	if (data->regmap_config && !data->max_register)
+		return data->regmap_config;
+
+	regmap_config = devm_kzalloc(dev, sizeof(*regmap_config), GFP_KERNEL);
+	if (!regmap_config)
+		return NULL;
+
+	if (data->regmap_config)
+		*regmap_config = *data->regmap_config;
+	else
+		*regmap_config = regmap_config_8r_8v;
+	if (data->max_register)
+		regmap_config->max_register = data->max_register;
+
+	return regmap_config;
+}
+
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
@@ -38,11 +68,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config = simple_regmap_config(&i2c->dev, simple_mfd_data);
+	if (!regmap_config)
+		return -ENOMEM;
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
 	if (IS_ERR(regmap))
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
2.43.0

