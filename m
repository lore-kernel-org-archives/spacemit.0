Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFAD1D9688
	for <spacemit@lists.linux.dev>; Fri, 18 Apr 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988053; cv=none; b=HWNJxLEvFeKabPGCtdEE8LRP/yd8OeOtBKluXBtnSNWxaYjw6LIbKWdEldtlaN5jBP49mKatDknN3A8lmzq643s4R16kkxed65mDiyeZEzoY7GrUHhdn2WvKU1w8lKq+Oq9IJeejKGibif/zcjXT02KygoRjAOoKCmG+2CjQn+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988053; c=relaxed/simple;
	bh=LcM+0F3zugynCUcrEX7U/7HbeipG1GSteIItXQPdhjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1FDd6f6BN9IAs7C0Q2AicpLVnJntxpdaJHIcnagXtmLc1J9k8K4ixrCI0tj46cdQtQrVPtuXfF58Tmw5wLd+S8JgSHz/o2F+/0mechwux1tP97Xb7TpXfnq1X014PEy2RCZdc88zhDM1FdluR8rN2D/Kr3qJVx3iT0N/LxY6dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lo6K0hYs; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lo6K0hYs"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476af5479feso20445791cf.2
        for <spacemit@lists.linux.dev>; Fri, 18 Apr 2025 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988050; x=1745592850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaw5lt81qT1qo0WLXCCCbUzvwZO95HiGQh1l0h3tFD4=;
        b=lo6K0hYsRHHAal9VkR+KzCPsGJq0aoaUaRKxc395xY6obKTYpTiUrlHcVVVmzDWh1I
         dse55aruS91F1LDU25VeLOhsfDuFl8u6kt69vU8/bSZ5Wj70C5vyp5ssGk37Mr0ukyUP
         0PCOA6+QbEHOPixeM44Ht5SU3yjt5OtsYLsPP1EtWBRb67EpoqpF3/JLe5XMTMSkz+Rb
         AaGxT3LdS/l+VnpmHYpKsHpjB33dF2fgsMk0+9izOI1DYg+L5kisFlHzDBzh+cZM66Vx
         xEV1Ysmh61x1f3GB0A/cqHAonPzfD3taDz+ce74eQpzilru/pLWyGszd878PuY/65OpF
         lquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988050; x=1745592850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaw5lt81qT1qo0WLXCCCbUzvwZO95HiGQh1l0h3tFD4=;
        b=AcpeoCcuBly2D/Adn/CoXy/Gt24VsUdB0N9M4fOfHTMHytLh9Dp/5dWzE2zuGcpCOL
         0LM2Jd+hDvittUtvEUjDo9lEN2iqJp8A9x0JyfN2gA3HjLdW8uKLOK3NucypqWqtVojy
         vwErpceEkBbNdxd2jwsCQ1iIicXdF0w+iN+4Zhqcho0iPNIq7In8LJm97zqm/FhvahJT
         Q9pMr3n8Kz3t48mnP2s3ApeBxZaC6eGOnDs7kzmK6FUzxxr7e4WA8WyWLbYEYK01qv+6
         7cAHKr3ofKsC2d4G8OLK1/pAe3yXoGtGPOg0KmhqkSathIbEssuuR2s3mufGH6F0a7OK
         LaCw==
X-Forwarded-Encrypted: i=1; AJvYcCX1/romz4bP7RdqL3Z3xbShu3C6YwpORh8Kg3sty0JQvrOp0FRB6TCUFORLcApu95mtDk5w7lCgUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrXIUlfQLe73zFfeVgRlaCO2LJUiHeFTsb5hw48+GZlTfu8WHC
	CH6TIegJPJOJ8R4Zo4XQrbbgINTnwhB7z9TJoz11GVlD4b8exrwAoQzWG9Q21fY=
X-Gm-Gg: ASbGncvz/vvJfs7fGzVuQLp+uJhj3ihiFuBBrp3IEq1MWjodjfnm7h+0BfpXSE8u8X8
	zHywB5aYuPgfKI1hZ36jYzq92bBwWCLl9B5l0VsbqAOTC/8SCwiqDoWSxZAOmqGhuvKi+JGVbG7
	pN98ly6PfgEUpP4uz4BupqHIPIo97/phbK7U3sm25EGi/qMH0iDU49pr4TqG2JVMqzmYzs0xlmB
	s5KSAryfBQ/0i1Qab79bby17O3TI0JOxy9Jeo9KaAa+eDbCHoHPkA2I1ASBoeEen8eMZMHnrF8+
	CVk8S9K7abrS/4HQNj2JXS5Ibv427bSXsuHi4MChRhNsNneeuqKWk/m30uU23qh8Kk2HwQulp+6
	XEmUlyg+TUtjz7w==
X-Google-Smtp-Source: AGHT+IFvYy7PkzuSyv6/DahcPqSuURSVxow9I8GZ9PMmiSUagXcMHnpfEu6YrBdLJKJ9ltUJ181r5g==
X-Received: by 2002:ac8:57cf:0:b0:47a:e70c:e1ad with SMTP id d75a77b69052e-47aec399e28mr54297341cf.1.1744988050449;
        Fri, 18 Apr 2025 07:54:10 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:10 -0700 (PDT)
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
Subject: [PATCH v5 3/7] clk: spacemit: add reset controller support
Date: Fri, 18 Apr 2025 09:53:55 -0500
Message-ID: <20250418145401.2603648-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/spacemit/ccu-k1.c | 86 +++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index a7712d1681a11..9152cce00ce90 100644
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
@@ -1042,6 +1057,39 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
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
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1090,9 +1138,37 @@ static int spacemit_ccu_register(struct device *dev,
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
 
@@ -1121,11 +1197,15 @@ static int k1_ccu_probe(struct platform_device *pdev)
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

