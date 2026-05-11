Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFC3C0626
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489675; cv=none; b=IkXW7yqvT76viWgDR9Fzgaf/gfXIkO/709X6km6ruM4qSjNhjinLteCFv52t1Icedu609GhVuHGwZXgsn8KdP4kLbQj/pFGjtbO6O/2caf/3dxBJ9aMHkwI1fZwGghEIehg4BEVMC26NeG1ZyIpy52KDu5c/5xiVQxu0lJm2qO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489675; c=relaxed/simple;
	bh=9RGpIlc1D936kgYlYrsQ9ImDNx3EFBBX3C/qUpnsSvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tY3lP9Mx7ijUFyi+3Wgz6cU18rIYK6vW4mWU3AjH27Tfn1LGXnEEFI1/12AH+Ow4bAqxQi2qcIOthCVqwTCFB+qcvnstm7WeATTurJTfHyxUuQLPc2f+Vzv4E3LYISaxjlG/uqUZ6sZLgWrCUiJPF/i08NJozM37Glx1BQTYp3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMmz4IRO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMmz4IRO"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-441209fb77eso2377198f8f.1
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489672; x=1779094472; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQW1TmR9evC/67fcZb5WXGa69DfOLAbqQ0G8sRDSbLM=;
        b=VMmz4IROSkpOXLpg+leSdnBI+itrKz9kBqDmOuzq3TWAdVG1eMvq1rWX7YEffpuU7c
         /UryySvjLfJncEq4XVS+//Q0w+GP/eF4x+fBiBFhY34vsVI2bjHtMU3oOYPNz30M7BEF
         KG30tCtPW7umgCZSyACF3GH4ByPC9MpI3+IIbm0+WGSEYlemOyUtmPHbpWPPdLU+gpe8
         slc3YQqoO5W/jrno6W1ZROAGHJzV5/UERh7lp8buRnILvQnoaqf5XIzJMSzCNbNED6+g
         vNIDKIDDfbnI0n2nMV4VlQ4VtmYO3zp8XP1WK8Kvd/VR80Es5kCeRBUULht1uvp8ysIy
         I62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489672; x=1779094472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQW1TmR9evC/67fcZb5WXGa69DfOLAbqQ0G8sRDSbLM=;
        b=UTxjD622FkZ84eRbjpJUSgM7W3qi88BjZ91wuS6geRRXS+57ECRryeCOGyqXQAuoQb
         K+HZKBU+hr78BN6pDf6sU82dS+bgo5E8nmByVbCW9EbyBgQ/dGRXc2c3GgDvV3DZ743V
         dvqXN21a4t9oR0/Pk/ciTxgp7LkN5T0OeyisHLCyLO/aWrKVh2dd4DAgaR0g6ocbmGmz
         MoFXphFbZ25paIsoDEr5U1tHxu63AAaVYuwj7V5BM7aE1V7DDxriJ/CfWrNnuemU8Q8l
         NqlJc2Nenvn+JjJ+ttXXLBCQplWo+alZ8bI3NQsrC3E8vjYKrVfihz9hEF2X+GU3miIF
         Q3TQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XESry+5y9aHclf7JhccipqtIUvo8LZBmT3QbrAiJbaWJuPJuSxSGp6THdun01h5rFcpZQcEl+AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIVe0jgF8h7esnZJOcDWDJCqpPD6qB1i0qr5Rvp5QfHInbpy3G
	GTaKl9TaOwHZHBVqIoNwQxxKbAVlg1FOR7kcdD5qzuKw+zauHtNk313PJ8Fixw==
X-Gm-Gg: Acq92OGCs5DUJ+LC0FDVupMtUq+SDes2TBMLLhmC4cSRyegr2qs6RDGa/47EQEGyC/a
	BPIofWJm4bTQvTnihTgDiNwNGPNQ+gxjgLTGDKz8SWzPDcNa7v73GRQ72QLQ8Yc7UOfjgXxja2P
	oGtVrM3vaSDDGsfce820vCT9rWwVnQoFW46RFV0lkG3IJrrkNQ+V1OSwtBI5Bh/sz9x0rsLdLew
	tzxPXkFFCavvH8oe0yWSF6WIupG7WaXXGikm/HaI//yjrrfWmKUKz8xz5sczTl+e/nKkQiXEAXG
	N1GZF9aPMYtoEf987EMvgBqIcUE8Ldr6nmbjYtk8q9xA88Yqym3wsgVi47OGYtQs2N4Fmibtafi
	CzIYKjHbUJQGmI7Ij7C39URYghosWUvFZE05el2/X48yvld3UFMak5Dy4IUWirzZAXajWFTEC0E
	5U3F4qK1u65+wh3I5kOQ+wlQTpcw0Sf8a/j4ErZ8fZ55jtnwZga4voBl0DJ9+XUIljUA==
X-Received: by 2002:a05:6000:609:b0:452:bc74:b129 with SMTP id ffacd0b85a97d-452e9ca06b1mr28253152f8f.16.1778489672083;
        Mon, 11 May 2026 01:54:32 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:31 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:53:58 +0200
Subject: [PATCH v9 3/8] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-orangepi-sd-card-uhs-v9-3-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

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
2.54.0

