Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68193392C28
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065170; cv=none; b=pjvfxJ/6HYmAj58F8m8zGgCJYtVUsEbF9gmAfxtxcPtxPfWfvMtjtSBfUDRVqUTpW5R3wvTSyzfeyGQRvZksivp71dkcmoyQwEV1O6YfJ+dktjp6aoZ/8tVyq3xp3iqgJ7EynvYAjDgj+veOTy5Te3afsJUlfySzlFzqcnlMY3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065170; c=relaxed/simple;
	bh=lQe/1C1yUclvn5uXddSpw2OgIhgzl5fVc6scliCgVzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZguVYA8MV1cKUPMZFz/Oo1RGK3vQG6YAOXQabtztBTa5EbMIlp+8FaYX/BA7xIAE+IX3Mvtsbx9PTOvfjCBJzcYm9Mloui3SnwgSyFS+5bGdyqQlSBtqp06JEZZGscSBeu8O/bIwoSWxiyziPzmsNmKBCPTu5ba3KKLOrMTL1bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEkYb6m5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEkYb6m5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso42882275e9.1
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065167; x=1776669967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=BEkYb6m5Rq1bhS8Xf1TYrEXVrBcvUuR74BxsBEmXLs1rRW++j/2YulNlzaHrFaQSVd
         9rvGZVEANXWn5AzWaRiyJdD8Kbxau0qKK7PqTDVSlyDVMNr8pAAjJ9uoa1m841TKc/Y8
         YIIkEbW/MSwXKEfQM+Niw54dC8Vkblq31+btEGGCDn61TvIADwsi3jkyeHesVo84W/9C
         4TYg8DSYQf9MuCQsv9kFTSsVnerXiO2jURubfcUz0PntRACmlnN/4EEsJayhTjnjwtky
         S9FX2U48OZRtFVq7qkWcHngUFapSs0JtDifdH9Ge8PivJ3JpMFyknlGXFfOOgE719gBV
         II9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065167; x=1776669967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=K4m+X6g9ib2b2l46ANkolAIrkHHbX2iLJuEoqcXDZ48xWAugy1INOCv03HDVdNVf/J
         rspnGRcsvk+jiPcpogCWokXbLEvAf7LBuk4THy4OCgAbJH5UKJzQuk+9Fivmu78Tt4Bv
         +mag0TVpqQVPykPOoCD0dFBGyZPQQu+CS+87MzZwCRX6gGEqoYQijp7hH+IM9/uyba+c
         36iJaOOX7/TuzV3vVKbuM77Vkzhaznaeuos+3E98jxLjsTRYN9cOasdFLKyCXEX0ZJbS
         XvGFWUpj7wI9HbzAJJ0FdhcRGxhKNBSxGVxas65cmLst3q/01G2VwcL/wRFgxJyUH9dA
         W4ag==
X-Forwarded-Encrypted: i=1; AFNElJ9vbapfByaByGEwi+k80efaJ6U4rVnSz7dtvFpGm0tC+2d61f6lr0clsw+HKXOxczPiQP4Lz40DCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhwqu08C+cAf7H9nHzZ+14wxpZ+GwezGvtke1dBIIwKjDi+IrT
	87UAyknCQafvbKETjVf6BaA35VXsbiPHFBxDhSahL+OwUWDwHKJCSHzT
X-Gm-Gg: AeBDievBiPhEFrUjglvwNQafMNy0mBoqLfj52b/GZIabEqpeQ/rPso4pe3Qdkuc+r1G
	F81jMJXyIsx37pO/xJ9obvJ/3afgPBKE/F4Oivso+DVZ4xgeJ4yPG8YPEPeUEgc0P5YvlwyGdDM
	dzQRBvvpMknuJSUDW7EpdrVAIpgQQ99TcYyQVzN0sPOTJrFMa02U9A01WoG2JbdMCE3v6R9lxVq
	+zPpNDc/eNAlWd/fzfLh1GAq1XXA8lKH/O3AVkV0s7ZmqHyt4QbFvxstNYBBpq543FdaDjjiz8P
	z2ZutYxBsUp5Zg9SGkRkExgsrZksSQTGvhYUbNaXx/r/SSl3/ERS7oLYwxMCu7viJ1F8kOKuZvu
	Sn0ik3nGlmF++XkQw84v8tli4Rbs+FuR1aqCftjZ48vywLv9atCMvpkKNfW01xBeWzcTGsnyLpL
	OJS5YJll1bs/nN/B+v3bBc4JOvo0FQbYrhybLqq2mt5US8QKCxYmM8DshU8c2+3zo+wTlMSMUMx
	pU=
X-Received: by 2002:a05:600c:8717:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-488d6816f5amr164955675e9.3.1776065166673;
        Mon, 13 Apr 2026 00:26:06 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488df2a1237sm322180555e9.6.2026.04.13.00.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:06 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
Date: Mon, 13 Apr 2026 09:24:45 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-3-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

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
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b85..d9144537032a 100644
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
@@ -219,6 +223,46 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
+						      struct mmc_ios *ios)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	struct pinctrl_state *state;
+	int ret;
+
+	ret = sdhci_start_signal_voltage_switch(mmc, ios);
+	if (ret)
+		return ret;
+
+	if (!sdhst->pinctrl)
+		return 0;
+
+	/* Select appropriate pinctrl state based on signal voltage */
+	switch (ios->signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		state = sdhst->pinctrl_default;
+		break;
+	case MMC_SIGNAL_VOLTAGE_180:
+		state = sdhst->pinctrl_uhs;
+		break;
+	default:
+		dev_warn(mmc_dev(mmc), "unsupported voltage %d\n", ios->signal_voltage);
+		return 0;
+	}
+
+	ret = pinctrl_select_state(sdhst->pinctrl, state);
+	if (ret) {
+		dev_warn(mmc_dev(mmc), "failed to select pinctrl state: %d\n", ret);
+		return 0;
+	}
+	dev_dbg(mmc_dev(mmc), "switched to %s pinctrl state\n",
+		ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
+
+	return 0;
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -252,6 +296,30 @@ static inline int spacemit_sdhci_get_resets(struct device *dev)
 	return 0;
 }
 
+static inline void spacemit_sdhci_get_pins(struct device *dev,
+					   struct sdhci_pltfm_host *pltfm_host)
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
+	sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "uhs");
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
@@ -324,6 +392,10 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	spacemit_sdhci_get_pins(dev, pltfm_host);
+
+	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
+
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
 	if (ret)
 		goto err_pltfm;

-- 
2.53.0

