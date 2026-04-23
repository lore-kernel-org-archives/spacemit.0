Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B1919C556
	for <spacemit@lists.linux.dev>; Thu, 23 Apr 2026 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776985470; cv=none; b=DCaxv1+orNtCeYj+CtDPvMZOKUqyrbCtt6oEhb+udGqULrgQ6GR9JI7edVzZ42zrsHluHl/6d832N2h1jepmdeUdDn8/qgYxVlQzphJaTZK4ee13u9cdj/xyBxC1BZQsO0dqBGNQtyg+cj84uHqHt5ruz63GXsw0GoeM+oI0DBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776985470; c=relaxed/simple;
	bh=erx80ktmfhC9oapl7jG73U4xyRNc6cD1xGEMZX4Wvy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IX66bLdjTRhjp3o0kB7tCRpL2F1RIQsbmr9nacPXaUoXl4brA0L1KWWKkseWazRBPK1ztlDSIaciOVuqHYniHEnlyOVbqSatvdEcmHQ/QLjAMs9MJyLlQGE1c+rxh/EKYMu3zPJqWtx9F+q5oJeVpMjLnxIRjiE8VY3y7U/2+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEWa04mT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEWa04mT"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59dcdf60427so6457925e87.3
        for <spacemit@lists.linux.dev>; Thu, 23 Apr 2026 16:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776985467; x=1777590267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tNmFsyAqLll9djiLitvDLt7Sq+VOfMkML8WGxUmnec=;
        b=mEWa04mTkvMv4WUOAFQbb24PmB8pkDSF654VGsDjvW5Sf2nhO0apFJ6zEhGIrV7jJU
         fup3Y8Tk8rlPX0GnHM6d5b168h50MmDoGbMuv1syQ/5dpJGjNz+3LzLFtxk2uSwXixIr
         qWAvoEeil4DKHEwAdZoqhao52VFQhRT4zTVJ/aDHmh/KbIOt3y7SD+PGT/WG7YvZciXT
         UWoDI47Fr5b2lNOEU4M1rlUlSh/dH3/tbWVLJVL7RiHUDf1ak0j9jRzx1miPXWfCGf3g
         Jbr8csO3Pk5SnvEnCjIluzLGXUPaKpmZ7Zy2/YbOhfGU0YnxO/0+X7ZDYZQGMgdbmAKu
         ks1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985467; x=1777590267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/tNmFsyAqLll9djiLitvDLt7Sq+VOfMkML8WGxUmnec=;
        b=ExTjC6k+fTFJYIcGk1A31Y5h9GUGt2M8y41WzJi7CVCJg0nZuAI9M9jTPK/k5YJBZ8
         3BwK0gAfiS57w/URWuCj5SM2NQSvbtD957MVGfW3qsohOWrn1EDnWLeHh/+mTipohICh
         y1T1e6gPhLi7lKBisWH1N9nblh9XwyxtslzXKiBV+aS/bu0jz315ni+TDc9f2mPIGPqi
         iCxIOtP96GkvIGGsHFnhwYI1HMlybognMd/51N3gDQHqoiItokGVoQFCzKgvvV4ljIPt
         VryHBFoEKQtpQNihZFaN8Ua/5qoUhm6c4ZNM0sxwg6ByqK7Ic47fGuhyOIW5KG57+lwE
         /aHg==
X-Forwarded-Encrypted: i=1; AFNElJ9xtSfYz/p9JxkVH4dy+c4SGMbBfvQwyxGtfp3hsWYIynyuuPQkwNZkFvBou7uD7ENkDT9H65YaDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBeNpQCun1vw1kM7vNw4ftxhaWvxkylb021vjqfnVpzYHAd1ET
	HpEVU+MszCIsn20iyJSW6+CmuoneVnJLICXP2ehv12et6Nj9YSrz1z/B
X-Gm-Gg: AeBDietp9Tw9iV6UAyb2eQ9G99k1+vK4qiZghtf+haJsOZ4RBcONi0FyH+Z39YofyKQ
	ZjUy0PAghNyHqZkLAt1o3rm0Inpbzo1+qnYRf6b3ngiLU2JudevOSRc7LdoM3WU8/H8E2+MVP7T
	mHenDzXxBu4i9WKG7TfQZDuV+re6zHmye82mxnHagytZ6g7uXTC6e5PFinulXM+Y9QzrCCSEi/F
	wyl+8HDj41xQQzkixG6R9QJbCYJuMrU1lFdmVSC/yIW5fjhviALV5rlntaAhH/FV/hl6/Yns2qz
	eF71DR6TRe5LtGKwIvIJU+YRWb/QsX0eKaHZlohXMlle55QKFRwhncFkYVfbfe/xvf2G2HMza3r
	92SgM9IPX+hIJMkvzJ53QBeCLafyf0QUD9CChRz4KrpqC+2TEUJfsx+y/FEGA0nTniRsvJgTulm
	GSC/j+Hop/HBHfHQQEQUgttMRJ44Dvf42AzrLedy1iC25iU8i/oQ7h5L2o/vqG1PgrgMM=
X-Received: by 2002:a05:6512:118b:b0:5a2:8568:826a with SMTP id 2adb3069b0e04-5a4172eece0mr8485360e87.34.1776985467167;
        Thu, 23 Apr 2026 16:04:27 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm5567888e87.30.2026.04.23.16.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 16:04:26 -0700 (PDT)
From: bigunclemax@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yixun Lan <dlan@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
Date: Fri, 24 Apr 2026 02:03:35 +0300
Message-ID: <20260423230338.442497-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260423230338.442497-1-bigunclemax@gmail.com>
References: <20260423230338.442497-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maksim Kiselev <bigunclemax@gmail.com>

The __reset_add_reset_gpio_device() function currently expects a GPIO
provider with #gpio-cells=2, which prevents using the GPIO from
controllers with #gpio-cells=3, such as the Allwinner pinctrl and others.

Extend the parsing to support the GPIO phandle with three args,
where:
  args[0]: GPIO bank
  args[1]: GPIO number
  args[2]: GPIO flags

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/reset/core.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 352c2360603b..18fb50ca645f 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -868,7 +868,8 @@ static int reset_add_gpio_aux_device(struct device *parent,
 static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 {
 	struct property_entry properties[3] = { };
-	unsigned int offset, of_flags, lflags;
+	unsigned int offset[2], of_flags, lflags;
+	struct software_node_ref_args sw_ref[1];
 	struct reset_gpio_lookup *rgpio_dev;
 	struct device *parent;
 	int id, ret, prop = 0;
@@ -879,7 +880,7 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 * args[1]: GPIO flags
 	 * TODO: Handle other cases.
 	 */
-	if (args->args_count != 2)
+	if (args->args_count != 2 && args->args_count != 3)
 		return -ENOENT;
 
 	/*
@@ -889,8 +890,13 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	lockdep_assert_not_held(&reset_list_mutex);
 
-	offset = args->args[0];
-	of_flags = args->args[1];
+	offset[0] = args->args[0];
+	if (args->args_count == 2) {
+		of_flags = args->args[1];
+	} else {
+		offset[1] = args->args[1];
+		of_flags = args->args[2];
+	}
 
 	/*
 	 * Later we map GPIO flags between OF and Linux, however not all
@@ -902,7 +908,7 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	if (of_flags > GPIO_ACTIVE_LOW) {
 		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
-		       of_flags, offset);
+		       of_flags, offset[0]);
 		return -EINVAL;
 	}
 
@@ -923,7 +929,13 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
 	parent = gpio_device_to_device(gdev);
 	properties[prop++] = PROPERTY_ENTRY_STRING("compatible", "reset-gpio");
-	properties[prop++] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
+
+	if (args->args_count == 2)
+		sw_ref[0] = SOFTWARE_NODE_REFERENCE(parent->fwnode, offset[0], lflags);
+	else
+		sw_ref[0] = SOFTWARE_NODE_REFERENCE(parent->fwnode, offset[0], offset[1],
+						    lflags);
+	properties[prop++] = PROPERTY_ENTRY_REF_ARRAY("reset-gpios", sw_ref);
 
 	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
 	if (id < 0)
@@ -1048,10 +1060,11 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 		goto out_unlock;
 	}
 
-	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
-		rstc = ERR_PTR(-EINVAL);
-		goto out_unlock;
-	}
+	if (!(rcdev->dev && fwnode_device_is_compatible(dev_fwnode(rcdev->dev), "reset-gpio")))
+		if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
+			rstc = ERR_PTR(-EINVAL);
+			goto out_unlock;
+		}
 
 	rstc_id = rcdev->of_xlate(rcdev, &args);
 	if (rstc_id < 0) {
-- 
2.51.0

