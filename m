Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4D3A4F51
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056434; cv=none; b=lLSir6o3oKgvjvid5B8HT8mn24eaLU8MJJxoxHlHoin8YKbMfx4w8VWabro0RbN2PyqK8irSLaE3syYUryysrITFf9jsOJC9LkCtnKk3mrW3Txobr1Iifuko0fS5Cq7XixYbNYx4XLKLRP+X6lQGm0Ig1zPIGwyIRbxEIXv9qvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056434; c=relaxed/simple;
	bh=GhO1Ie4U3ZfzS4l/Ko0p5yu5WuTegwhHbdrsMIKUNZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8YgIguvo4wMG/TsUXJ0katoj7WZNz7P3qolWW/FhU7FIO0saEHlCg50eSQqWOOEVtAVUH75X+KD0s86rII+v3/ln2CLXIJ3l2UUC+LDcLj2i61n4vgV22GnnoPlpiSYWTgzKGfd6aSfMTjbdZw1WrL5cwxOWLbsRODQYHEJyhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ri0VW6j4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ri0VW6j4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439afc58ac7so8845386f8f.0
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056431; x=1773661231; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJ9vHPA28uIZwZHl6zG8+rB5ttucBEvrM8sqwTl5hfg=;
        b=Ri0VW6j4V6T4Cdl4nsVecC38LIQEBTIP7Un/F761eGnxSGpg3t4trPLMG0aO8BHYBn
         VfU//wvo6ao8CquxLmoK2lH2qumAjQe46uHYh350jKqJlbyv6HQn/G7xtqMR0jWJjyvn
         twu25g+tzxyfBAUFJLxyMM2DcFpDIcny47FQwujV1mHYBGq1ipaF1SVcIIzKMkK5gUgk
         SP1a9LV3Z5oWqRvovylD+Q9JkWCQCUBzJhV0x2Uqyxi2ooOB2Od2GHWqxuK7vc/6CrUx
         Pxj7MUq4HllMmTkxA3CWe4Ba/T1fToPZkqB54vcNce9XC7shBgB+/Wr1wJryBSQrZxih
         Ob3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056431; x=1773661231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJ9vHPA28uIZwZHl6zG8+rB5ttucBEvrM8sqwTl5hfg=;
        b=JUVROmsKHFbqX0Nw7COOywqmhhMpCI9jGc3OGg1AbrZ9OSKOeJfEHfZ9D/ktpnajYX
         Yatbh5OYZEEc8NsNlYxsh19g6UpS43XBhq2HtVKhRmbuhJY9v9XhYUxiD6OCCDfgQxSA
         kySX47XdbjvH1oWNNyMhyf9HWQCfHeBTC5f9Lij2BpxdO6/Hr97Hh2c5xd9+oR/IidjZ
         F/k6SK0e0cNXmxNiadUqOQRnko3UA6lmHKiCeQDhTKqZPmdA6Dl2/zlQ1JCarmy+rFGd
         EpycFQRQ/66/UlaFqKjfc/QhBHGLWvHfXKKmrT1U6/4HeaiPYe4U946jQELW3HOpjcjb
         xPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqMLiUaTeuqsO7jTtL1/swrdDcj9bENIAvKqB6a9zG38fWCBfPc/WrgU9rILy1RK3E4SyIriF7CA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgZ46FP0OOUpfa8Hg6Egw0Rk1i8lIBA6NvRKpbnpr9Q0GuKxsC
	7A16j1jqpKDq2c4B38qbE+FvVTXjrKutTuTM2iekhlQ+ZJ2j/PCUCNGXVChGXw==
X-Gm-Gg: ATEYQzyL1GcZvzeljBBEMQ+Yvin+mRu9KznHKCLSEk95tDEDM6kAckC6rzLvm39lORW
	DUWPXfst3+NwhOH/M/ye6+9mt897inl3yvDQFYNfaoiLrYQYSmSFh2v8YafNU+i3PbOMwNZ3By3
	HPvDgHFpfq+vCJ0jAQd3KhKVZFXOkSHI/2eBM75T4/zkkXSY7fEKdxaIRW4/XohBg7dLOs0hMza
	YKXiKPj7R5PyR0/Mze9+mTV+UzUqPhFsY1GCPE/NVIoioFIEYvDR3nZHZmjZWxUEbOs41/gJn6O
	2dx3ihBqz2GlnfQf66FvNGFJx2BFsxJBu8AGKMegbJzhdT5UeQbCIm5QubT7H2AA0K9fvST2Kya
	MRPRmd+xH6IiubXD9D5+/RwtMg7E+lUmzv5pD+AmK7bMoImq7MhaeF8l1gamQc58IBbf6rYnwEu
	8sugFqc2XBMkK5H7Obg02Vl0T5OGYfYIJJO4ZbCweom+ufWBhytFA8fcaRbsrvYBL+
X-Received: by 2002:a05:6000:24c9:b0:439:cc06:e134 with SMTP id ffacd0b85a97d-439da6632bcmr19064373f8f.24.1773056431160;
        Mon, 09 Mar 2026 04:40:31 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:12 +0100
Subject: [PATCH v2 2/7] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-orangepi-sd-card-uhs-v2-2-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add voltage switching infrastructure for UHS-I modes by integrating both
regulator framework (for supply voltage control) and pinctrl state
switching (for pin drive strength optimization).

- Add regulator supply parsing and voltage switching callback
- Add optional pinctrl state switching between "default" (3.3V) and
  "state_uhs" (1.8V) configurations
- Enable coordinated voltage and pin configuration changes for UHS modes

This provides complete voltage switching support while maintaining
backward compatibility when pinctrl states are not defined.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 59 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 585c7eca6ebf253aac466dd37cef029deb63f692..8af117a8e271c04a80d8dc7bb5ce12075652dd7a 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include "sdhci.h"
@@ -70,6 +71,9 @@
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_default;
+	struct pinctrl_state *pinctrl_uhs;
 };
 
 /* All helper functions will update clr/set while preserve rest bits */
@@ -218,6 +222,42 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static void spacemit_sdhci_voltage_switch(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_ios *ios = &host->mmc->ios;
+	struct pinctrl_state *state;
+	int ret;
+
+	/* Select appropriate pinctrl state based on signal voltage */
+	if (sdhst->pinctrl) {
+		switch (ios->signal_voltage) {
+		case MMC_SIGNAL_VOLTAGE_330:
+			state = sdhst->pinctrl_default;
+			break;
+		case MMC_SIGNAL_VOLTAGE_180:
+			state = sdhst->pinctrl_uhs;
+			break;
+		default:
+			dev_warn(mmc_dev(host->mmc), "unsupported voltage %d\n",
+				 ios->signal_voltage);
+			return;
+		}
+
+		if (state) {
+			ret = pinctrl_select_state(sdhst->pinctrl, state);
+			if (ret) {
+				dev_warn(mmc_dev(host->mmc),
+					 "failed to select pinctrl state: %d\n", ret);
+				return;
+			}
+			dev_dbg(mmc_dev(host->mmc), "switched to %s pinctrl state\n",
+				ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
+		}
+	}
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -242,6 +282,7 @@ static const struct sdhci_ops spacemit_sdhci_ops = {
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_clock		= spacemit_sdhci_set_clock,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
+	.voltage_switch         = spacemit_sdhci_voltage_switch,
 };
 
 static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
@@ -293,6 +334,24 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	sdhst = sdhci_pltfm_priv(pltfm_host);
+	sdhst->pinctrl = devm_pinctrl_get(dev);
+	if (!IS_ERR(sdhst->pinctrl)) {
+		sdhst->pinctrl_default = pinctrl_lookup_state(sdhst->pinctrl, "default");
+		if (IS_ERR(sdhst->pinctrl_default))
+			sdhst->pinctrl_default = NULL;
+
+		sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "state_uhs");
+		if (IS_ERR(sdhst->pinctrl_uhs))
+			sdhst->pinctrl_uhs = NULL;
+
+		dev_dbg(dev, "pinctrl setup: default=%p, uhs=%p\n",
+			sdhst->pinctrl_default, sdhst->pinctrl_uhs);
+	} else {
+		sdhst->pinctrl = NULL;
+		dev_dbg(dev, "pinctrl not available, voltage switching will work without it\n");
+	}
+
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
 	if (ret)
 		goto err_pltfm;

-- 
2.53.0

