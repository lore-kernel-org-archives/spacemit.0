Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F2F2FBDF5
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107341; cv=none; b=ZRnZIk7Ug9ykV6h6SmrW2PyWLH3Pd9VnkEg+ZeP1i886VhP0a5/WXDcoSOuyOCIXTfpEiToMLu/LFKgwbvUS472+hlnGgumceQa20SHZPQMnvqu0nOMMKfWF2Oy8J1x4aHC3VBGmBJlwNDCsNUrMySdD3bFiMYy4yEAa9Pz9Rcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107341; c=relaxed/simple;
	bh=FJfkRSPlH5B++1U1zhMTRNFqmbjHdSkWFGe9jzml3js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NQb3anRTnBi6mb+1FU0NDf+tb0OGkvFGis/uUchRE8adxXfB9hgl/9Da9rXvDCZg4sgFR6rlPECaAWLMBwsCESfW+ywauXh0UMqda315wPjvc1gwQ7bpjoSHQVxmjLZxiB1KJVHTGk/hDmkbru4Pnp9kMsaOel4ori2tbPzRuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBlIPcA7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBlIPcA7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0c20ee83dso127912565ad.2
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107339; x=1767712139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PemJfqgrS11N0rN844byXVfn84NqGSNQTH1UI9V6ZpY=;
        b=JBlIPcA7mnxIKgZjXJBPPvZWgX0JiXLrQYiJRj68XopExbMDCYKZY/JS+OG2S8tpr1
         j2mFjHRjB0jp+w2Pi8gUMj9p0uzkEOLaG3uOgE5A2goPMzL1PV71Pj8csFRsmH4F48pA
         Tbt7HmOiMUnqgtOdmKnxiimAgC9nR+58443iwiw38Eb5gFbOhaGZ3VtCJQxY+MNHwMy2
         a0/Q4YZkjZUXX/EC7DqlmhjwXqsASadmZbJK4FzXi3pTgKKcBeF0HvkisK0aP2UWGBCq
         +dnn5jy2C6cv0VqE/RPfzk7YtGsP7WWy78DM2OB6GIZX8vaBpK9la/Di/1txpURXe6aN
         gnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107339; x=1767712139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PemJfqgrS11N0rN844byXVfn84NqGSNQTH1UI9V6ZpY=;
        b=SwQG7SAsO8Fspt1oNbPBODlvtuyLG2GZX6vE8SNmf9f+yxjjVNiWJmg/xktfNRE59n
         lLIVz/IO2Bez/9+/2JPW/zl2yh+yujx4dJ3pujospXDZtacWtBf9Elqr6qSVfJOS/CmU
         JivOUNOl2dRPxjuudwG9LlfLD+/6qZIDOkePFWhQKdAbu2lAZhDinJZJ7bbCYaXO7eZA
         VPr4hBTZLK4ktRotYM56WkWac6sid3xC4J33Ovokp/QlD5Cr1+Y+T2UXmNRdPAmxAMSv
         ySm34aCIxZTcaN+q+Xp9OXc1Nx33dj1iixrLFuPp86B5krPAhmkHk9uRJm88O4Li++r1
         cycw==
X-Forwarded-Encrypted: i=1; AJvYcCVQafjAgAqP6C1Tr6qDXNnWp5rgzvnk1QJ0szofr2TylJO4BpyCxWFwwuNaIc+loxX5VAjkZ+NLdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeYGIC3Mv/7jC/aN77VXJdxg3dMbrX/lNksv9IaEsZrvrdy2MV
	vjpoCBtv2jDswzXzUxd0GQVEeHcQPculljw94nEr79nTdqSBdwUkfeNM
X-Gm-Gg: AY/fxX4DxyYKRfICZSiVHp8uqP8VS8ntwj9cTg+OItlpdBfhS3d636u27UHBHIg6JS3
	ZWD7MFNyaxynli07xhgIDSo1UI/YuI9KsKdhWRAM8gBEekcny9Y0Ls6FB/aw/znOMgdB3RPb7yF
	alwFL6kamhqRso4pUi3IGUX/rXT2CWjqSpcClmlgOD5NU05KfQzGGVM5IWHnmKztPDTac5p3Fa6
	GDUKmnQy35P+RDZQ9sb7C+NQ9keQJUMRqJi0toP+cyiqJqCpD7hd2S2QOscNWNRACJShn5vwL/g
	6DMJo8bdncfI4iO3AU2T+B+1i285L0Q5qht38xYg2po6Q+56j/euJm+xd+O5xPXKVb/0Wk+jlWQ
	IF/xSRvRsYTT/4vW96NPNnpWqawPO0XWM9GDdjvDSJS3bNYO2ePQ2nu/E36cVTZx0NIsGLbTbot
	blD63z
X-Google-Smtp-Source: AGHT+IFOqjFWFdi8qdqJlYdi2yUC/4zRYrjnSmKV+0M3gGTfJ9R/5gjkPTHwfTLiXvQhvLLg5PgOkg==
X-Received: by 2002:a17:903:3d05:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a2f2a507bfmr327890665ad.44.1767107338428;
        Tue, 30 Dec 2025 07:08:58 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bc9sm305130385ad.36.2025.12.30.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:08:58 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 2/3] i2c: k1: add reset support
Date: Tue, 30 Dec 2025 23:06:52 +0800
Message-Id: <20251230150653.42097-2-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230150653.42097-1-jyc0019@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The K1 I2C controller provides a reset line that needs to be deasserted
before the controller can be accessed.

Add reset support to the driver to ensure the controller starts in the
required state.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5..23661c7ddb67 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -534,6 +535,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = pdev->dev.of_node;
 	struct spacemit_i2c_dev *i2c;
+	struct reset_control *rst;
 	int ret;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -578,6 +580,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to acquire deasserted reset\n");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);
-- 
2.25.1

