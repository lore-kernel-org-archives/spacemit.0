Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D763A4F47
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067365; cv=none; b=KeVrlqqJeQruBTh58f831HIJjfKxu6ocPZX1CGJjqMaDl7bSTmak+XfyDtS9YC2pp21rCTjcb8o3BmyLcdp4eWKdQQKFgUxWxK5YQg9H9lvufnlHTs6J3N+pGl2UK76/PQ9iS9xCc1rSi7sYeLXYEjImrR/PHzp5Oop5IKcBDt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067365; c=relaxed/simple;
	bh=lQe/1C1yUclvn5uXddSpw2OgIhgzl5fVc6scliCgVzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRqJYESbIo+xjhMsBsTDMeGb90Lml0cSjqVm5ZGI9IOPQkbCzocsAWgTgeuuV21Bl2zJzAXDoq7/1HhLSoNImv1p0PJ9quPSOR4LIaAkVOokkFVwa6C9DWyxjqOz55aybLg27Iyvo8PLlng0RAHPkTMs5wSpCGGf31J/IKETFt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFmMYjoZ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFmMYjoZ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-671ae79e617so88662a12.3
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067362; x=1776672162; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=fFmMYjoZ9VVqr95Y+Wz40HFiAmEkKg6wCmeuQJrjc85RuvkwTy73B2ARmOmyWIFcNX
         T7LnWtsVApcasEZSvcI1hr2E7FSIkO/ZkWJGRkH9BwtZhlnDQiL8cqjshc9tysrqii1A
         fDXyno+ZX/6ncs26KLencocX4B75He6KhXgyKl2LvJajr0C3G/sw0PoIK+3nKJ1TRf0s
         qccujXzYGWVG6TyaaoozdTxJ3egcuP8idyQ5KdE4UoXnBVWTlnEULwBuqH0Lw0aHmQhf
         pW7oD1WMh14ksfzndJxe4h5gUse5IFUnOwG4clRn9dszdUhKdw0CRR0ScJ6i4felQv2H
         Aybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067362; x=1776672162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=As2nrc0sDed4bDxWhYxAaeJtQdFjULnb9xvirDljeWQLbMJbchsO4Dcjjv3yxLUE7k
         OdPYLAyfHgYsDKLGefaoUFD6jysCgJaDIqRnvyX52u2BOtU5t+PxmJF5Vc736NDHcVdL
         JE39dRftbeI8I7Qfh9redSNuxQC4XDNi7rguQCHM37nHhIbVDhPnl7iNBRuvWTeCdoOD
         /uAHuu3dDFNiqzCMKEqlKQ1uoj5mgdv/D1VeWg8eXvi2eCiI394zm4zNh9j6qldAOy+N
         jMACETiOd/UC64BG24YyQupuXj+k63A4++i3MXlngjz6UVVSfkcGcZMfo0N0Rp+tnT/F
         KkxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Iy0OwlYGoJldZeFvJ14u9da0P0Ykbj18Jknc51K29ZvgZMioF2RnfSTj4LXKpKxtqVJfjQq1kqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBBYEFb6jMebutZaxP87QlNzbzYEWMa4nkUfyBVDhBQsb7AjjV
	9zo4wSOY3dOOTQl0yAtAfFfrEj+fgda5xx/58KkwMeE3GEQ30UTfBE3I
X-Gm-Gg: AeBDieuERlxVLltTTFwEjKAjfTIk292GRqTj+Xyg3yLyfxcEN9dp+flBFcBeVmH2XYE
	9p/j2yr83Hlgu2vmsMXd4pmpE7w9DW9ZjekfP418xHa0FrvaE2G7AQ8LWDEs2qPjtFTHgzvQLH6
	25ejT8qvN9tR+v7bzh5wy1VGFPsutgFD2wNjU6RqDaURF0pT0DUxA1xJg5tTrvXSP601OdsrxdQ
	/+Y/d8t4K07zhM+xxrfkD3lTYSM/7O4iKk+25qRBxvdp58qxCrJN/zWw/PxesAX8iI5PU8bQHhy
	sZPKMuxdK7vqna4w7w4eqJjYeZj1GXfT53q9d/+gI5uvOLxAHtjjJVDf9fPF0gI9Zdrve5SOTGk
	Nzw7uCs6TKLelK72Xt4GyDZZWIWdyrxWvn5qhgMuBNZIgTcLOxPfvmCxkOgJEs6eepzpC1lFEW6
	NcSMWZGrZ/gtxItOuWVI8EbK3/3n1FLZDCy8E6gf+8Ls+CEwPNRhz87DYnryl3OiYv
X-Received: by 2002:a17:907:6b8e:b0:b9c:c40d:bd2d with SMTP id a640c23a62f3a-b9d7277c7ddmr642261866b.10.1776067359772;
        Mon, 13 Apr 2026 01:02:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:12 +0200
Subject: [PATCH v8 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-3-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
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
2.53.0

