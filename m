Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736532E3372
	for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034200; cv=none; b=Ahq5m7C9NjHRH5t2CUMKcJui6KprnZirsBDEmkjTIGZiLEg6XOGk/1TMwzx+2v2fXmVj1lkC++3Mio6kgSKLUU2sTc2D4f4NQS2ARfrS7gyPU66xdDBwyPukppIl6zcvrQqOV99oN5FInBcyZtJM4//l77BfSLR48pTKZ1pq1IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034200; c=relaxed/simple;
	bh=Tsq4Cj77x0Uz84CFPrzoZFbQG9zudBpa1tvUCC6Cylk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=duntx8CEI01PsXc0Ye9tAXjyQTV9lPR46sywQz3sRluregYNIh0wiyox1s51fErSuFpZpgAkcE7y6/Yyxj9Mmq3QFg6N+rdsAf5mzNwWUYdVmyikOkvRzXe9eIxX5dD5FDFPpphjaAqX0rDQojXS40v/ubNmd3wTjVtZF/Z2Qh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Snt031Da; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Snt031Da"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d38ddc198eso236934285a.1
        for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034195; x=1751638995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEeEDXRCRhzfd7WiQWk3nSeJTZHMTuZTnU4CBiNxmaU=;
        b=Snt031Dax/KTLUfYz0G+F/cL/jtvi/QfmwetGTvPNRHfF1ewCd8aqt460umiw7dP89
         Opi65vrRpu93bRJV2cBI9zNFtcP6mCPMcuqv0uxBh6WDe6u3V30BCu1N0dNtjiAE2kr+
         Fp9PDwHR0xxwaA/2NF8Hzl08F9qMPSCqyyEuUbdsCs0HhIDI0Zn3sn6oKASLZchNtxFh
         +ZQR1okiiih9gxlQ2xPjc2aw2J5OH/WtyifN/glFK/2nn1v4VH3lQQJNmamcO1pI80qi
         wbKVVwK7qn6bPf0oMiCd6ARLAvAbwbVgKaMOJqJf63h4H3/F37UMcwC7SpZn1VydkRLd
         cTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034195; x=1751638995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEeEDXRCRhzfd7WiQWk3nSeJTZHMTuZTnU4CBiNxmaU=;
        b=pZUDQol0Qwy9w5LrDSjIts0iVTUS5j+A+XMmlR5Dtom2P2DpT6DMWeZPjeAiTWSe27
         w3bKpqoPOeB/xf57TvecgGmvaJIkWe/lFkWJV6mEwP4ukzFKTuKZtfv6kyqCJkMn1inu
         olDKAqQqOrbAdLGssMTIcHNcBdK7aWYIO1IMkPKfDT3AGpCF1jJ3QVtoUi0XkrxM1TGC
         PPvpFCM3wZUELmyuFpg3SjnQf1lj6Kv5k49jJ5Zue03/pjc8vU58Uh+gHrf8dskQ3sUI
         E+Cn1oDUheWn78nVt86vsD9u0sh8eFT+BYZd2kWSNH6iuJEmdnuKbvxWqFkHH7RYNMaB
         x6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWpV7fPNKSAciQ7ikIUvPxO0CqDIgia2dTPyunAm4PiVvUS8r2cquLVTXD+Z6kPOjMx/cRSTdWopg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTqU1JdWXNTyHBLT9B58C3/aZ4wUazp9D1eKsL9YQNDyt3JdGO
	y260+TAv/tptiASCMnn/K36KVMWD2wtSJcsT/pA/tSP3ezj4h/VlRJxc/bDO2XwYTkQ=
X-Gm-Gg: ASbGncswqKctIrvRfmw2sDLBD/3o/vYdfwSZm0ouKTENY4T4QwuCAMDOqAlnrGHCIkV
	S4Q7xL6imJ8+K1dA0raqNzazmEoH5i5TAxo/cfOxI7KKNhBRaypbFmqZDkyFZfZ94M5aLPNuW+/
	1Z0eUp9cqAyYMNRaTstgc0tHNL/DoWx6Klz/MvvHocBCrLDivH/EaNg+Q1KsXkK6wptEhl9glU0
	/SPEgFFie9huUXz/RzDMMA/X7jPYTvHDnHdbEnycHJsZ6mP7UdHWS/VeDwbAEZLFcCutJwgxVcR
	toryq1cDzNJJd+kBOViNqIUrPJiX5wzSIovWPIcd1eMYWdCpJhlKrVl9TllSNNMfREvrVcWIIAp
	61jgfw+1qcsvAMKKMkRTFuuU3JsToMaHztLothIThXSPH2Q==
X-Google-Smtp-Source: AGHT+IHjeJKicOQMrv5A2JPa7JA08EcBfBp+Vurfdw26JNZtOFtPu0+xcyBQuRqWuhl/FSD4KBiKAg==
X-Received: by 2002:a05:620a:2b87:b0:7d3:8ee7:ca10 with SMTP id af79cd13be357-7d443935786mr517736085a.2.1751034195204;
        Fri, 27 Jun 2025 07:23:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:14 -0700 (PDT)
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
Subject: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Fri, 27 Jun 2025 09:23:01 -0500
Message-ID: <20250627142309.1444135-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All devices supported by simple MFD use the same 8-bit register
8-bit value regmap configuration.  There is an option available
for a device to specify a custome configuration, but no existing
device uses it.

Lee Jones suggested modifying the simple MFD implementation to
remove the generality of the full regmap configuration and add a
max_register value to the simple_mfd_data structure.  This can
be used in the regmap configuration to limit the valid register
addresses if desired.  It's simpler, and covers all existing and
anticipated device types.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v6: - New patch, changing the simple MFD functionality

 drivers/mfd/simple-mfd-i2c.c | 18 ++++++------------
 drivers/mfd/simple-mfd-i2c.h |  2 +-
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..c1dc315d44dcf 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -24,27 +24,21 @@
 
 #include "simple-mfd-i2c.h"
 
-static const struct regmap_config regmap_config_8r_8v = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
-	const struct regmap_config *regmap_config;
+	struct regmap_config regmap_config = { };
 	struct regmap *regmap;
 	int ret;
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config.reg_bits = 8;
+	regmap_config.val_bits = 8;
+	if (simple_mfd_data)
+		regmap_config.max_register = simple_mfd_data->max_register;
 
-	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+	regmap = devm_regmap_init_i2c(i2c, &regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..4121fe1bc1d70 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -24,9 +24,9 @@
 #include <linux/regmap.h>
 
 struct simple_mfd_data {
-	const struct regmap_config *regmap_config;
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
+	unsigned int max_register;
 };
 
 #endif /* __MFD_SIMPLE_MFD_I2C_H */
-- 
2.45.2

