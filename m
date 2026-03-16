Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AEB39B96A
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669872; cv=none; b=gGZpdS7KPzWcCRRiNOyeMcsJdj7TD9ESFhki48ApMsQHMmjkchIxAwRweTUubdNqhELBtUE8wX1QC0gL/NVRWQOunqmG+BwqpMORfIL4dLMgRPHDpBPOpJsUOi0V1TrU/oubhxJDtJAZYV25jvmBskxFFI4d59uF4KlLTVkWzRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669872; c=relaxed/simple;
	bh=epbnSIRFEcgFtseIgir8HKOEck/DcrGNKZLBIi+3AcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o39/q7HlCoq2f7RSdzqq3u339goVdvRTkWLijSq4ydBJdaTXUC73CDzXHOn3mH6q68TsJrwPaNt/YAgVCsnPgq23RwjtWr0UFHTxJ+ed6SeZPlextYrNV1kzR+QOW1+uYIo1XK99bNF71b8EUHTyNhNnUZAeD47ruvgdpOtvlKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNJxJSbT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNJxJSbT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b2965d4bso3208011f8f.2
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669868; x=1774274668; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IatXzbXfYasV7clQDZ74AZFa+ggBYqSvKjib0f90qgA=;
        b=YNJxJSbTV0UmlFPSijxexjWCOET/P8+qvw6+J6LvqeZIHlWz/V/o++jqY4EvGdnULS
         Eb4TYqvZbtAlpXMgtCzUXLhzglf2XoieIcNJvbZZpxk2rNdKtyM9DXBK83QxWSgW4vwP
         ebiEJZeIAAR8aEQ8bGiFOBtja1X70RDIqQ0RUmc1coAyRoJKfuFNwFtzSNhTbUPEVV+3
         nr/Ouar6qQm8GuOASMI2p5KNMqXYV04ukwHxmN48DAO4j3e2MCGsfydheIwRsiTlQOPe
         hcPz+KVmL8a2aMSvV+sFfkOErgQztgnhX29AnbcsYP/wEuoKgP/w7rSHGx6LSH7Y/kLV
         whDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669868; x=1774274668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IatXzbXfYasV7clQDZ74AZFa+ggBYqSvKjib0f90qgA=;
        b=iYBwkK+j0M/pleo03BW0r5Uush+SBNQza7VUsYw0e2uJ8lAd93X2ekFtw6XT47Kjdt
         IKSB9q+Gh9WlFAMrZGZ0MOoptHaisoCk+0iW9eKDrr7L2YpLdDwW9WXNXKmEPIJa7LQg
         pUzNFHRBSagT2e1mAhM6O+CTUwoCQo91J2yVZsDKQlLm5jD7/Z5J9rrcKa0+kctkW520
         bzub7bfQ58A/KOXT9aVDQtwxI/w2aCpCmAS+fH9TRBwX79x4Otlid7IFrdD8SeiE+4tx
         4zNfnFfg7XTYN9VsXtTSWnfF4ZBUV6MlN8z4KMOXYtkokyyxWAbLWvHzKM2aVQwftcoh
         71YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdAS923SOtsu5zcGvw7JgoIsgXq3j2qtrTa7d0Vj8nGG6YxUiSUxfjU4AJuqwbbTGD2N+s5j159Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0+U22jKNyrd2YYgaT+Y6ic73Kf96+NfspU0Ej0Bor9/3iMGxi
	FNpk6WZy4XmMYscrxtlyFPo8MEkcCPlXnfod1Rb/4/M/Gan59L8nJ8mG
X-Gm-Gg: ATEYQzxho7TpcsR9WSQZZb4/GlKbMbzWPNaDqluRX2kN1RLRhlfS6K8pXiSJU7NMVlI
	uWtX6ltaao3jqbdHaVUKqJxcGRjE1WVSUjGPWi9mxTUo3kcPaAyYj4eJEaqiF9ExNAJNid/R/pu
	vI33O5Ip2ZzGbFl67zvaY/+c7ePS392U4OWRtQWh0gah5HC/kO0YEskI+12BIN5LcualRxIzup5
	rbfjLEh0tsCGLqJSvA8HtQ9bmsQxnaSFjZzG1eI9sclng3fYpx7tSjSBYfpB+CIZplwNdhfoUKv
	bVOgOAukwTATcI7rsQ98pAm09a6tAsTSaCvi6QYErUNWAATo94naiuiWAvJLanJkqEKlKZKdKVq
	iYWnByrQNCoKUQ4itq3IreFFNvxjIGZ+2o7gqBDfYTyYhC+L3SNToTJ708/hUcMkX4cttt9TSY4
	oWUP0ua13PhZNRBDbWetKmBeAzRJQ4w06gMN0YrzCJAHCXO/aPhtOs00snc8aQWC7U02c+0BBb9
	Zk=
X-Received: by 2002:a05:6000:4313:b0:43b:3e40:2223 with SMTP id ffacd0b85a97d-43b3e4024dcmr9315126f8f.19.1773669868020;
        Mon, 16 Mar 2026 07:04:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:26 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:30 +0100
Subject: [PATCH v3 2/7] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-orangepi-sd-card-uhs-v3-2-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
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

Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770..01afdadcf70796704b272ee5a31543afd5e01188 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include "sdhci.h"
@@ -71,6 +72,9 @@
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_default;
+	struct pinctrl_state *pinctrl_uhs;
 };
 
 /* All helper functions will update clr/set while preserve rest bits */
@@ -219,6 +223,33 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static void spacemit_sdhci_voltage_switch(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_ios *ios = &host->mmc->ios;
+	int ret;
+
+	if (!sdhst->pinctrl)
+		return;
+
+	if (ios->signal_voltage != MMC_SIGNAL_VOLTAGE_180) {
+		dev_warn(mmc_dev(host->mmc), "unsupported voltage %d\n",
+			 ios->signal_voltage);
+		return;
+	}
+
+	if (sdhst->pinctrl_uhs) {
+		ret = pinctrl_select_state(sdhst->pinctrl, sdhst->pinctrl_uhs);
+		if (ret) {
+			dev_warn(mmc_dev(host->mmc),
+				 "failed to select UHS pinctrl state: %d\n", ret);
+			return;
+		}
+		dev_dbg(mmc_dev(host->mmc), "switched to UHS pinctrl state\n");
+	}
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -252,12 +283,37 @@ static inline int spacemit_sdhci_get_resets(struct device *dev)
 	return 0;
 }
 
+static inline void spacemit_sdhci_get_pins(struct device *dev,
+					    struct sdhci_pltfm_host *pltfm_host)
+{
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+
+	sdhst->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(sdhst->pinctrl)) {
+		sdhst->pinctrl = NULL;
+		dev_dbg(dev, "pinctrl not available, voltage switching will work without it\n");
+		return;
+	}
+
+	sdhst->pinctrl_default = pinctrl_lookup_state(sdhst->pinctrl, "default");
+	if (IS_ERR(sdhst->pinctrl_default))
+		sdhst->pinctrl_default = NULL;
+
+	sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "state_uhs");
+	if (IS_ERR(sdhst->pinctrl_uhs))
+		sdhst->pinctrl_uhs = NULL;
+
+	dev_dbg(dev, "pinctrl setup: default=%p, uhs=%p\n",
+		sdhst->pinctrl_default, sdhst->pinctrl_uhs);
+}
+
 static const struct sdhci_ops spacemit_sdhci_ops = {
 	.get_max_clock		= spacemit_sdhci_clk_get_max_clock,
 	.reset			= spacemit_sdhci_reset,
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_clock		= spacemit_sdhci_set_clock,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
+	.voltage_switch         = spacemit_sdhci_voltage_switch,
 };
 
 static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
@@ -324,6 +380,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	spacemit_sdhci_get_pins(dev, pltfm_host);
+
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
 	if (ret)
 		goto err_pltfm;

-- 
2.53.0

