Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A461E5B67
	for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570321; cv=none; b=si+PW04oT7AHv0ppSMpymCn44X2o07BO2XPLXpqOImUFnIQlMOeFPpRr+yJfU9wsvQJRXOeKEJfEbyAyzkrsNIdIFzuSXPYm5sH6fcx+oHmLS/rNUFeOtfWKYRNn/lHxVyNwVFGe8Idj8cWaCOjgi/uLNgnJkgTqUxvKBJiFA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570321; c=relaxed/simple;
	bh=lhzOWVrb/W5aWFiPKapeZ+c2qWJP4p7yGhuyvcKYsOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bg/gbXFzKa2hSzax50ChlRsEKYo2qCCE9N9vTFTnRoV1zO+aeKbKeTqZ/39EbZCcmVvYL4or1jasP+9g41JmeqPItY11IIT4qpw7d9WzcaApKw059y5+7uvnIO/rzdzX6luDjRrnVeqicTpOuqqxBI4AP+ziJ+5ZZF3Nk0/W/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zuopEdqS; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zuopEdqS"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85e14ce87ceso63606839f.1
        for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570319; x=1743175119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=zuopEdqSAhVTgjaI7RQo9XtqMgb0AcE9/SDW4h6PSJ8inCoX9tgtsJgyWfrd3tehJ9
         gfZJICSAbYZsPFMVgxanopDW92dSOnGBXCcVQHXOzsZ1MFbO1hZvmPJjlvyVq8aARy/B
         BB7CGnKwpMGStz61o5acMBw7eycj50kLLlv/rTUo7CoNbYExnRVdggzwc8CyHSJdKPdQ
         cH2SMQ5KqonNwVulLJADV1IKf37oxZt6LyRzBWxOfJMXJcjEAICQ4CvTyYiOly/DCxeZ
         PTELXUBIqJk1pbOTuhUCgT86g+5if/O2kED4yqhKuZeZYf7qryOLtnNcWzOlQN8MHlVU
         Iysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570319; x=1743175119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=lbbjAPR3OqTUEUM/iWDxq7Jm8KGWyhqpRQjD25p1GBa9Svfx3GPyWW5nfkjv1lRuze
         TP5vfISGNq9OunaWUM1XF/5UqtJ6FTMg3A2EzOWh2z6mdHOqGB+2+JSfD0ibXPWmOlTZ
         tP5eUbJwCPYv5v+FO5oZi3uSOX1yjejvF3UogjMqbQbNlaH2bQcgcuhDRNm8Sq7WQ328
         +aanjpqSN3JO0urjK6AHm9s7Zn6o7fIc1cg+uJGkfk4RIFkwHIfPP2GZOWI0V23EPhSM
         Ud2FwSsQBHPRJZvMduBx1cXrTt7bsj9UPYI8PuLTZXrx4kthPE7ndsElJLZ/lUkxnGD4
         HPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBTF37ivCz+uMTXee7HpWx2WjGx61FKJTj7dmvdzUy5OOW8+7c4DRKItIcdfRTdL1JMkduCIpsjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yynj/floXLzTIf8tQ2I//A9Koona8l79hyeDlL7Sx4q1y0jw+B+
	K6R2t5op7k9y22UcmwqlVht5Re6CiwhgcfWN2ajGK/4UeW7SzzaqNeUIcPwZNus=
X-Gm-Gg: ASbGncvAxja+guNE4kwPoSFw5aTayh4PCkri5KU75zD64IbMKq3Vfm7Yr2V0OHginrf
	kCQzDkp7lJt9ZwIO6fFv9nnwhjbslJlao7PN8aBzrhAj8H99FDhxkgzBG8NiEc/fBxONvcIxeJp
	BjXSaHcpfLKbrfSBm5hjlLy2DVP6cWswfPWakUAIgkmI7v1rmjwY3CA7NB5lpjnyK5gTTx+KQKB
	VCVY+nB/ZuA2jFhFHMfKQ41Kq/AZzTH8YRw4SovwJQUlQCO0rDqOoBp68IGlPDq4u6/dq44IBHN
	x5KnomySnVA42xGUB5GaJDKdCfTwERLPLLYHkyiZYwwgnFjkmAyg+iI8jQGxJm4WKJHQAONTyp/
	5q+9DLe2Yr7sX1Jr2PV/Y/DDh
X-Google-Smtp-Source: AGHT+IEUz8WMBAG/xaa2+GBBPyVyyUIOG2h5tJRf01KFeJERuOLi2IrXGmMUndsyBqpsB4JMvQ48PQ==
X-Received: by 2002:a05:6602:7410:b0:85d:ad56:af88 with SMTP id ca18e2360f4ac-85e1ee299f1mr849828339f.1.1742570319091;
        Fri, 21 Mar 2025 08:18:39 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:38 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
Date: Fri, 21 Mar 2025 10:18:26 -0500
Message-ID: <20250321151831.623575-4-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define ccu_reset_data as a structure that contains the constant
register offset and bitmasks used to assert and deassert a reset
control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
a structure that contains the address of an array of those structures
and a count of the number of elements in the array.

Add a pointer to a ccu_reset_controller_data structure to the
k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
the new pointer field will be null for CCUs without any resets.

Finally, define a new ccu_reset_controller structure, which (for
a CCU with resets) contains a pointer to the constant reset data,
the regmap to be used for the controller, and an embedded a reset
controller structure.

Each reset control is asserted or deasserted by updating bits in
a register.  The bits used are defined by an assert mask and a
deassert mask.  In some cases, one (non-zero) mask asserts reset
and a different (non-zero) mask deasserts it.  Otherwise one mask
is nonzero, and the other is zero.  Either way, the bits in
both masks are cleared, then either the assert mask or the deassert
mask is set in a register to affect the state of a reset control.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index f7367271396a0..6d879411c6c05 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -10,6 +10,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -134,8 +135,26 @@ struct spacemit_ccu_clk {
 	struct clk_hw *hw;
 };
 
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
+struct ccu_reset_controller_data {
+	u32 count;
+	const struct ccu_reset_data *data;	/* array */
+};
+
 struct k1_ccu_data {
 	struct spacemit_ccu_clk *clk;		/* array with sentinel */
+	const struct ccu_reset_controller_data *rst_data;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct ccu_reset_controller_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /*	APBS clocks start	*/
@@ -1630,6 +1649,48 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
 	.clk		= k1_ccu_apmu_clks,
 };
 
+static struct ccu_reset_controller *
+rcdev_to_controller(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct ccu_reset_controller, rcdev);
+}
+
+static int
+k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
+	struct regmap *regmap = controller->regmap;
+	const struct ccu_reset_data *data;
+	u32 val;
+	int ret;
+
+	data = &controller->data->data[id];
+
+	ret = regmap_read(regmap, data->offset, &val);
+	if (ret)
+		return ret;
+
+	val &= ~(data->assert_mask | data->deassert_mask);
+	val |= assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_write(regmap, data->offset, val);
+}
+
+static int k1_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return k1_rst_update(rcdev, id, true);
+}
+
+static int k1_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return k1_rst_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops k1_reset_control_ops = {
+	.assert		= k1_rst_assert,
+	.deassert	= k1_rst_deassert,
+};
+
 static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 			   struct regmap *lock_regmap,
 			   struct spacemit_ccu_clk *clks)
@@ -1675,6 +1736,33 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 	return ret;
 }
 
+static int
+k1_reset_controller_register(struct device *dev, struct regmap *regmap,
+			     const struct ccu_reset_controller_data *data)
+{
+	struct ccu_reset_controller *controller;
+	struct reset_controller_dev *rcdev;
+
+	/* Resets are optional */
+	if (!data)
+		return 0;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+
+	controller->regmap = regmap;
+	controller->data = data;
+
+	rcdev = &controller->rcdev;
+	rcdev->owner = THIS_MODULE;
+	rcdev->nr_resets = data->count;
+	rcdev->ops = &k1_reset_control_ops;
+	rcdev->of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
@@ -1710,6 +1798,11 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = k1_reset_controller_register(dev, base_regmap, data->rst_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
+
 	return 0;
 }
 
-- 
2.43.0

