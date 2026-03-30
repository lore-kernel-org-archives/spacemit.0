Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3FE3ACEEB
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859911; cv=none; b=FA2vn3FFfDdqMfSltpO3c4mRReGhiXJ68E1Vf/V1fmJCcPdnNwXY3so8hiRDz8EEVyf0rY7z7RsxZ3bnt3FDDp1AjcFTJPEUlAdo9Yogma9AmbrfjAEntTG/XKIYsvQjyvqs5oimmApA66R0/WdlZvankY43Op0bQTcB+uALwpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859911; c=relaxed/simple;
	bh=IUPCWZ8hYMJ6U/wvZl7DQy7F8lp73m8qXu0Aa8Qt1UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofMqrWw7A8o9moO7Zjk9aDPJhQFKQG6bARCxs8N1YImoj2TNcMp3Jxj3ccxpDMghdTaxnPxyoM035zdOlsmfrb0fQhxMtuShvjf1Nx8zzInMgbGEx9NXTZ/YK5yp1sw0+bEkdNSWLRNJsbNp+LkYFduXL7E0uR+UTXfRzXR4BFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LI4r4gnD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LI4r4gnD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fd27754bso41457855e9.3
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859908; x=1775464708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RM2PI1Utklboaim1+XGDH9DAYZ4UPq5dLeIx/PUc2kA=;
        b=LI4r4gnDdl+muxO2ILPCgR/MfiH87yegis+fmQJ6DyFJuzEySePxkh3Aq4Pnc0cTfE
         pR0afp4qhfxmwOriTt6yx+o3y6PUoJ9DSEdFVrWG6PoTBSU5UraRTDfW9R9FdcOYKOJA
         02CFiNEFBnWZ0srU4Kyeo/JqNFi8/LpfpQu7Q3Dh4UFJL8WwBo555+NBWMHLQXlNBECx
         jDt0Tn5yBcaZ9sI7qrpm+aVlOXGW6e9ZxjmCP/r1RtLQf3asVz5eGrAnVF79YBab+FFx
         ezO33nwRMhxXODY0AIgIwKvXIQwJMifJ7BfMZejC1kkG2i60Z7xWliHUzHrNcwHa6WP+
         yPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859908; x=1775464708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RM2PI1Utklboaim1+XGDH9DAYZ4UPq5dLeIx/PUc2kA=;
        b=kQdhePra7AwmR5FT84kPAyNEHN/iSI0FFTZV30fvQHOu+3/cTeIADb6DPCiL4P1TBn
         wwYUKHkoXJWSD5e4ORor3QsPy3l9rj8PQt0Gl3ZoJwu7FEfCxwqvdcPkj+3Vh2OoOsw4
         590keOTxmdGDq6cV4iFeTANq3XuWR8oKqwME80Htz4HBBwqjqdIwSXviGg0DvWC3CB/0
         OuK3XPCEKYR9fCsvlCBsR41S4UeZ0zfNf+ia1LDTmXp/i1riCwfqXPnEc1lv65qNWbTp
         /ACBAw3ITgSQoHn83vC3HrtWHD/P87kWDJ+efVI1gdZc91RRDSRgkFXHDxgUu2gRbFBd
         1Yjg==
X-Forwarded-Encrypted: i=1; AJvYcCUK9ZicrvJfMmkEvZjRv7QRiRyrV4P7AaPw7OMDRVgfB/vBZVkC/07Tcnqes+IDxFIbEbQXTUbkAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCbpAEg8Tp1GJl5ihjxOICnE6QBPHcB69CWK/IGYFAhutFWl68
	ElOcKTkZpCSr6lYm6mn//2/aOHYTIcxkv8W1fp5ckqlbPw3I3qXgYMs5
X-Gm-Gg: ATEYQzzhxaWmW5Rz5NkNfTZlv8EHf15iYhIg5Up1S5E8OcvKutWlbeQYRC+BCaI5Szh
	jhmgKRfc8znf/SQBD2eYfFK32y0HzDE+BZoAxv8JRT/mzuluAahOUX7YpHkL9wTmtUgj02ZmHeG
	y1cmoXFa+21WuQl801kEzmBM97M4QjDPWMvDpl+FK5t0qA25MLkozosxKXsZaqo2kddxc2jTkvy
	DoS480pAMmsxWBNCWnttzAfS4daDkshtfVvuC8pbg8TIfHFkqmfPAueFqo2rcNGtaW063mQjBa9
	ew/n7VSHoVxI3wn7am/dRrZo3BNg5WIVu7dFwxof8O3knflKZcWydlVoDH4TgPm5v6F4+1jos57
	bi0P9fZcexi8O7YvoEv7bhUFYE6O0oqMd3lkAnrngAdHV6yAw8421A77K+9gEBen1hAd1eIMkEU
	9zqTjQCdfwoPEkt5orCSEYsLobAi6M0F9kZ8tbql8VTIG6P4Ji9wuYyBSf8f5BkEr+
X-Received: by 2002:a05:600c:83c4:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48727d8816amr191754305e9.13.1774859908252;
        Mon, 30 Mar 2026 01:38:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:27 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:04 +0200
Subject: [PATCH v5 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-3-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
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
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770..234e258af25996e7bbcd0b70366c7480bf62bee7 100644
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

