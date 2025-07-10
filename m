Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D182F1FE9
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169877; cv=none; b=d9vEziVHQLVvcWLNFRfsDVHhZfOMBsyuzpk623xAJ3o7dzIHjQd9VCI/C6caXlgJ3bP32ZBCPurY2+0V8tvdsh7L0L3ccX1TfXstzRcxZKE9U3gNiyYiPCmFuz1PvMs8bTGeRTJYUFrvGQjjFx0TQQzDGbhypSLi+AafsNTfT5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169877; c=relaxed/simple;
	bh=qw54s6+dB4TTXuc48Qt7Fv1rhcl09JsKjrdaymOOvwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMgLJR+PH8y2Y7ZNFIjqQk5DiN4WtwuVLs+FIccjk9li5cMZas7t9cW1bBz0SL9A79ZPmyQ3Wmn2QhG4B7wjZrzjd4Ojm/PaiQ/MLr+GRQWCJizR8O0AhDUJK8vdYFmN+Lg2oUb2MQrC2u2cl/Q7yX41sYuwrF8vN3h4vxM9zDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XNijBIYn; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XNijBIYn"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a9bff7fc6dso11469981cf.1
        for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169874; x=1752774674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPxd+P8tmDwx0y+W1SNnV+rw8aIzaBC1lp7afJoBcgY=;
        b=XNijBIYnWrRgKOPtldshVQCd00mQDw2+PciMbvvRsYoCq8fyLZMQf9LwygC+gZOCBZ
         aU1pBLlsDjb62y4/zCVPmmJC/y8tf4Fd8kr1kWQL4ep21ixneKptph/pW9DIu9Mu0EeJ
         QBUNw4K3A12ACcLVBBLH2lgKOOPV/MWrT/P8KDlV7yrcTLh2lX/KYXjE6ympELtnQSni
         WvWTRDId7idwYAQbjVEzsgtgCyJEDYgfIoC+PX1876imNuzcAOFS6PUGlB7dFUNV6yX2
         b2jyJLDaaXP/pxBix6aWkAEJ/Zof3eLdfdUeq+xEvZb30H2yfi5gusc9UJjiyvbJ7aDV
         xYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169874; x=1752774674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPxd+P8tmDwx0y+W1SNnV+rw8aIzaBC1lp7afJoBcgY=;
        b=CkxKWY+Ik1Kv/9+NGOiI7UCP8W2OWWwVouBAwmjihIFp7ZLAMUqcpZr5n376M6/2HP
         Cy0JXTKkpjrAFrI1+gOc+T3PvKZ4vMbNzR+ny+5DH+cDZ5MOzxZSVIHD0MQgFPjI6stJ
         rvNPDKoszOPfV99eOMsABbASJ0Ki3f2KNpJSUOI2GlZeoGMRg/ZgSBH1jw07TJs0Up3H
         WSBs0OPWINuxJeSUHLLI09obgudqSyWxRmV4P+1My7GKL75cpN+0mN9VWwKCBSy6Ogwv
         KVj5W1EIusk3PAKN+jCN4Gyfv+eV0EoDMPtaE0ysmomaqxe3mi5Iak4/V4oIaddxPsol
         SqJA==
X-Forwarded-Encrypted: i=1; AJvYcCWYoXUuu5RXa+ICKbBCGgkPUYHHy+IMC3V57rFzQurvMFFmM97WShGDBHdbHvZUUUw82aUYatPOyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUQBRlBu8sL6FWP8sMi1zXuTGulOc9MUXMXkDUIiVj/yiibjED
	sRpspuwpoCYDhC6vjoRHoNnbmFm9IqttaXdR7YfRsudXG2OQm9t+cC+d1dxkhlckqro=
X-Gm-Gg: ASbGncu6srV8h3wonYLDs3ED4l6cJitHb/IJljYQoKGzSooBztmpFAjwrp/fO5hE82j
	Yq41ChSUNdjxj2/1OqTh1ux5FN0gdzRD/MTRYNPgbbpsbU4H5RdrkBlo4ZbgjAd8RLqaXsEsL0t
	yHZ+qU0uM/flBU3016tM3JAwMl/fZ56s/IDljR+YEsQdMfsDssnqq4pEu90KDOOEvLctwPk2x8A
	Z5UbrIrOKTg7QqLDDexdz11ksz9S46aT7HJu8xofQJCk9mwBFHrT0ppizke+lVvg4MUSDHGdS/V
	uARU+G843LiP/8lQOcfo5Dcj2HB+Xn8WUXg3vboOhBT86wtnlv/8pX3L80NTgrQyAwaFWOYxvwe
	wH7nNvdC/C36SHFgtRQeSI2Xyh1Gfoy4dwpUNdBkKEwdE1g==
X-Google-Smtp-Source: AGHT+IEkx+AOQpLVZceBJR6aNNu41el+MInso6QxhBVwmiG6+XiP3kC1/9JcknKd6ozM3Mhkp6rCyQ==
X-Received: by 2002:a05:622a:1441:b0:4a9:a608:43eb with SMTP id d75a77b69052e-4a9fbb4f054mr2871861cf.20.1752169873838;
        Thu, 10 Jul 2025 10:51:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:13 -0700 (PDT)
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
Subject: [PATCH v8 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Thu, 10 Jul 2025 12:51:00 -0500
Message-ID: <20250710175107.1280221-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
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

Rather than specify a "full" regmap configuration to change only
the max_register value, Lee Jones suggested allowing max_register
to be specified in the simple_mfd_data structure.  If regmap_config
and max_register are both supplied, the max_register field is ignored.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v8: - Use regmap_config_8r_8v, modifying it if max_register supplied

 drivers/mfd/simple-mfd-i2c.c | 8 ++++++--
 drivers/mfd/simple-mfd-i2c.h | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..5138aa72140b5 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -24,15 +24,16 @@
 
 #include "simple-mfd-i2c.h"
 
-static const struct regmap_config regmap_config_8r_8v = {
+static struct regmap_config regmap_config_8r_8v = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	/* .max_register can be specified in simple_mfd_data */
 };
 
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
-	const struct regmap_config *regmap_config;
+	struct regmap_config *regmap_config;
 	struct regmap *regmap;
 	int ret;
 
@@ -43,8 +44,11 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 		regmap_config = &regmap_config_8r_8v;
 	else
 		regmap_config = simple_mfd_data->regmap_config;
+	if (simple_mfd_data && !simple_mfd_data->regmap_config)
+		regmap_config->max_register = simple_mfd_data->max_register;
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+	regmap_config->max_register = 0;
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..ea2a96af8bce4 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -24,7 +24,8 @@
 #include <linux/regmap.h>
 
 struct simple_mfd_data {
-	const struct regmap_config *regmap_config;
+	struct regmap_config *regmap_config;
+	unsigned int max_register;	/* Ignored if regmap_config supplied */
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
 };
-- 
2.45.2

