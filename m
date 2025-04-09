Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44314215F5F
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233472; cv=none; b=Roy57gs7edSKAJ3Ib0Wvqy89HkZMo1DPU0nuak5Zq+DraY48Wq8XjbX0BBPxjSnaE+jHDkwImYgi7P84Lw+kb94s0U2CeGv997xzpMlb/DHxBntrjbGv2OyYHhL/6O28vFiCcF5b66C44fwFuBC3IIyBll/2xIRlFeHMLDV+g2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233472; c=relaxed/simple;
	bh=xu/rmbyAwS83GsCFaLxaM7ZFQXHgPwGGt7mhXq7PvRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIkxWhTANK6x3NNKfYoht634wKV9118OQ9GZdF3MEggCPMOtV+bh4eiMPZ8SHGIAkgFwhweToJ77J7a1uowrMhLimjQkVrnLuRv5eUnBl7VbMpRqr1+O2vMvtRYGLrYXohWccaLk6aU3KxXyXcmeEar9MetkkkFx/Is6NsnwqF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zYRc56S9; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zYRc56S9"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-86142446f3fso4739439f.2
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 14:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233469; x=1744838269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vaVE3Er2gRm6pRja50190vA7NVtS7/61eybF5RG2eo=;
        b=zYRc56S9dqdfu0R9R9yYw0XAnBTX/yMuF334W8Zg38y2mKapj5t6Ur7GAxvwow8YUM
         gXK4aQWJAHQzlXLZdIK+G/qDULRr3+5RPgRCpPdD2JBT1BjP9jOHhHdNHgxGpnMwnIIF
         4SFlz2kGjbj8sEu2Bzfd0I5rkLkxlYChmwX/kdQXp11O/gbvqViyRLvAhyjcPfbaCDTH
         uIiKs6ORioZF9ZLpD7JOwS+NekQy4+ONo1Dx8Fczhi81jVemzfo1wb9YSNEQmrMpR99K
         FhCjg5teMKSJSLw2NnZ9zY97hg6T5pHTSn4u9jNqcQx4waJDILq72R8tq50xSfD1vdKf
         CpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233469; x=1744838269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vaVE3Er2gRm6pRja50190vA7NVtS7/61eybF5RG2eo=;
        b=gqKTAHrRStVc6IRTE3k6VXgx8yYsR+nnjd4jOPRPWJOPER3wqgTzaO/gyfu9jJaUxv
         dTccA+gwFqxK3en49lHzqdqmBaG1Y3sUBXlkxnDam6bHCXcUZ3NiITV0Ja48nolZHijP
         fbRAt+PzqwOxplvF05RYqxmPmn2Z+FKRS9asFBZNdX+7WiOaisGnDR0qrrfrm0yc3dlu
         kKkx/SjiI/DRhb3iCkel+mNxu2bgUlW8/nLv+loSzHkUfqWlrUwdFBpHyIrY9kfn6AIf
         UVSSQo+np28D0y8Nf/Jcu2SI8UXzJVM6BrqmJVPezpGmP2gz/ZI5H09xg42z9ihMVsd4
         uoCw==
X-Forwarded-Encrypted: i=1; AJvYcCWvGgx7MXA7BdvdCJjZFKWiW7F+7l0qAV1c5N2+p3+2PeCtjDqEmBlr2rsrtK8XoRj/u7jx/7fSZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzPSho2wJZP0UbwWG3jZnRdOxaqs6X3cRvtS1MralinUZYBYT9
	6VngaWnF9kKY3T3LzUwHEnEIt021cXg/ieaoHkxRoTVhjVL3NO8sipScDgQWnEQ=
X-Gm-Gg: ASbGncvobU4FBs+/T6D93LE6YdgtQGc8QIpAsNo4tAv6G+Vbn2KUBSRqC3bIIJr7lsY
	8XT9qmBL35UxJRY6VFMCEG4cqIDRa5pjTu/TqJczUEsZJxMftIpZR4XVBNlaLCIFpUKisDuvI8V
	2vi5sc+PkocFsFpa8VoXkbG+iySrKHsLwPqjijJTiVTuyKoRL3W/wPw7eJNlAo6m6ZmZaH0Gu6i
	gsh8jn697zK/IdQwkXsQanbr4bsFGs4Iy1EH/1+KnzCYDUsYVN4LrbosnY0gZmBDjzWXb0sBE8T
	4ASuCQNQefzuqm+K1H1P5bZ1cSzLS39or2jL1cJbPBFcFKvwgpW8kovoBKPKM+c8UuCR6RfGmG9
	k7wzS91b9CjtQhA==
X-Google-Smtp-Source: AGHT+IEBY6acRolvlf2WpeIkQxW3UfG8KM2JL9zhL0q472AEywVb8BQfsGSSvLHW9BgVjXxwqB9IyA==
X-Received: by 2002:a05:6602:370f:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-8616edd5b9amr43972339f.12.1744233469422;
        Wed, 09 Apr 2025 14:17:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:49 -0700 (PDT)
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
Subject: [PATCH v3 3/7] clk: spacemit: add reset controller support
Date: Wed,  9 Apr 2025 16:17:36 -0500
Message-ID: <20250409211741.1171584-4-elder@riscstar.com>
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

Define ccu_reset_data as a structure that contains the constant
register offset and bitmasks used to assert and deassert a reset
control on a SpacemiT K1 CCU. Add a pointer to an array of those
structures to the spacemit_ccu_data structure, along with a field
indicating how many elements are in that array.  Resets will be
optional, and if none are defined the reset array pointer will be
null.

Define a new ccu_reset_controller structure, which (for a CCU with
resets) contains a pointer to the constant reset data, the regmap
to be used for the controller, and an embedded a reset controller
structure.

Each reset control is asserted or deasserted by updating bits in
a register.  The bits used are defined by an assert mask and a
deassert mask.  In some cases, one (non-zero) mask asserts reset
and a different (non-zero) mask deasserts it.  Otherwise one mask
is nonzero, and the other is zero.  Either way, the bits in
both masks are cleared, then either the assert mask or the deassert
mask is set in a register to affect the state of a reset control.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - The spacemit_ccu_data structure is now used, rather than
      creating a new ccu_reset_controller_data structure
    - There might have been a few other minor changes, but generally
      all that's been done is a rebase on top of the new clock code

 drivers/clk/spacemit/ccu-k1.c | 86 +++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 8a8d228b46c3f..2a8c514be4b2c 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -11,6 +11,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -129,9 +130,23 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
 struct spacemit_ccu_data {
-	struct clk_hw **clk_hws;
+	struct clk_hw **clk_hws;			/* array */
 	size_t clk_num;
+	const struct ccu_reset_data *reset_data;	/* array */
+	size_t reset_num;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct spacemit_ccu_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -1200,6 +1215,39 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static int spacemit_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller;
+	const struct ccu_reset_data *data;
+	u32 mask;
+	u32 val;
+
+	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
+	data = &controller->data->reset_data[id];
+	mask = data->assert_mask | data->deassert_mask;
+	val = assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_update_bits(controller->regmap, data->offset, mask, val);
+}
+
+static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, true);
+}
+
+static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap, struct regmap *lock_regmap,
 				 const struct spacemit_ccu_data *data)
@@ -1247,9 +1295,37 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct regmap *regmap,
+					      const struct spacemit_ccu_data *data)
+{
+	struct ccu_reset_controller *controller;
+	struct reset_controller_dev *rcdev;
+
+	/* Resets are optional */
+	if (!data->reset_data)
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
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = data->reset_num;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1278,11 +1354,15 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_reset_controller_register(dev, base_regmap, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register reset controller\n");
+
 	return 0;
 }
 
-- 
2.45.2

