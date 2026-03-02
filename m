Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D52341162B
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464438; cv=none; b=iiz/WgYvVL565PRyblXe0FXFKDnEBEpbw2l+GpxxkYl47In7WDKKOpE73ydFXN6Yfca/Knq+VmYHg9e2i6CgXjbbQij69mdiYj50CkLcEAKumIWs9XoDfpWkZXvMSmYVQmS94Q836fLYmvKYtvbZOGdLWgNOJJ/r8mtrNXJ/dGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464438; c=relaxed/simple;
	bh=l7yFNiOmqsvt7j2PZxlgkxZHr4AJ1C5sRtgpqni7WX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBZ2h91p+9lVrP/wINiP6POOAJTY575M5aiUG8Jl8oX41MVc9EL2x67/Tohrkb1zQSjPni3Toa9YuCOV+5FkfRD0fR8vE5GOwLF96dNWkzSQ7m7bMDh6hfv4MM+KXiVk4ohHZzB/8tt3MXom+WomfO9yEPuNNtl7M3h0a9SeG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fySQdLv1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fySQdLv1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48371bb515eso70317945e9.1
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464435; x=1773069235; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBh/BEMhIYd7yMIKn9wpAoeG/vOOsjbo+uR3/+VkGQw=;
        b=fySQdLv1HYdqpT1A8UlfRVzr/UFp/CbohFW3IMUkwOxjYX5szHc0M5kbkaYT4AqqTe
         ffl9bevFAS4JydSEDStzleFt20fOb83N9khbvEGxGpMVWmSqpw3jo3vxrFn8mf18vcIQ
         XOIw7uO6Eu3ZIEk7ImxjxMXhRPCVCHC4VlAdv0Ww171RPAbGhCj8RBfVgSvW1kK5zmXQ
         zshFC8WsYUT2S0wFEuFw+jidjtaQu3mXDHDJc4M6mFCnaTWputYOzTHCUaRIckWpqksH
         17IIzcmxmbiVD/CYiHvHd1/opGQPCqeNp0HFP+RGSZw2UJ7WdOrJY6+7HJoDK627yiJv
         wc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464435; x=1773069235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBh/BEMhIYd7yMIKn9wpAoeG/vOOsjbo+uR3/+VkGQw=;
        b=gw00m/SJP+yeLlY9Sq8Hbj2pvGSHhRDat7OifYI3dTymVQiL0mVyzLMLRgE3301b5r
         XOGvg/uKMyGC2SAEs3AoBtFet4HKThAHnULkv+KM/bmXsazjd1Joew0dpciHxkZlDocz
         5IDuBVQRyTLxehUU1p/D/53BhHIJoBSOrGyWb4WqeM6PM0Vzn3hPp8ucpJCCDVsK0o01
         emEqFzH5FIq8o+jkZuSWds2qaAU3Wq83/Tmpnt5w1q3qBfwhOlt4299f9VmoBvKQ6c/l
         ZSgjoXU+JoanoKR0Q9DINKOy/rXYZkmmBciDKGxX9XZ7cZLaKUFkPUxdteR2yKxwDheQ
         3S4g==
X-Forwarded-Encrypted: i=1; AJvYcCVgHdXMy+wWgUhgYgejRw5q4/cxJnBjRCCnURd43WUkZgkYq+Vg78fmY3xdWhpW/mmuTSAUhrsEsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5PtBI9kvmvGslr8NVwO+FlhFSBwg4ve3ay6Yh8MPkzun7Qnp0
	9Nq78rg93KcgT249hMRxQ7S7bBvewR4+rabzJTil7BZn5ODHHM71hq9R
X-Gm-Gg: ATEYQzwgc7917rnjqCBnyaJexv9Uc2KrlUu6tb9VScVmcLc1C6NJCuLl8z3jJAlc7Rh
	j30lTpsMXilIhif8QWRThcDtw7CDSPkiu52gIu2fVh+7mmLM37J258E9WzxNI/i1Zw9tOXIH64q
	thj1UqmSjQOJdEw/RVxo3Iw9/4gDu9efh95QDV8hjKSJn4tKxGDI+KJGY8puLkn9S3gxvpDjRMz
	sfS1pcoI7cgsKK4Iw0oe4qB8/zDN4dW0fZ3QAYvNG7ovfnse01+4R5kDYDf1T0dcIEJPkuaxxTC
	AFE6hCRmgy6pG12VF8L/+cc3Dj++VuLGosOWYcWGKtoV2Vl8VOoRwE0AAfQyEtnGJ7OcdLY8JgN
	D1uLaHt6qWocFXIFiDfHt5/YkJQpK+QaapnjtLjJebBHkuOXI3xiuW/NXdMRN97lm8m7Sia0vkY
	0lMXk5WWD68iylY07kbGgOGqmv0wOc0rdi/yKVf3NXYU8YoCjxRt98tlLv1CdihzPVQg==
X-Received: by 2002:a05:600c:3b18:b0:483:b01c:9508 with SMTP id 5b1f17b1804b1-483c9bb7c0bmr236115405e9.2.1772464435275;
        Mon, 02 Mar 2026 07:13:55 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:54 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:25 +0100
Subject: [PATCH 04/10] mmc: sdhci-of-k1: add pinctrl state switching for
 voltage changes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-4-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add support for switching pinctrl states during voltage transitions to
ensure proper pin drive strength and configuration for different I/O
voltage domains (3.3V vs 1.8V).

Pinctrl states are optional and the driver degrades gracefully if they
are not defined in the device tree. This allows boards to enable proper
pin drive strength optimization for UHS-I modes without breaking
existing functionality.

The pinctrl setup uses:
- "default" state for 3.3V operation (higher drive strength)
- "state_uhs" state for 1.8V operation (lower drive strength)

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 59 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index c260cb89704ae7a25bec0f07831d495553405bbd..2a982bca2a50ca96f43af7b4de5bc4fb4b5b195b 100644
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
@@ -219,7 +223,42 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 						      struct mmc_ios *ios)
 {
-	return sdhci_start_signal_voltage_switch(mmc, ios);
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
+			dev_warn(mmc_dev(mmc), "unsupported voltage %d\n", ios->signal_voltage);
+			return 0;
+		}
+
+		if (state) {
+			ret = pinctrl_select_state(sdhst->pinctrl, state);
+			if (ret) {
+				dev_warn(mmc_dev(mmc), "failed to select pinctrl state: %d\n", ret);
+				return 0;
+			}
+			dev_dbg(mmc_dev(mmc), "switched to %s pinctrl state\n",
+				ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
+		}
+	}
+
+	return 0;
 }
 
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
@@ -301,6 +340,24 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 	if (ret)
 		dev_warn(dev, "Failed to get regulators: %d\n", ret);
 
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
 	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
 
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);

-- 
2.53.0

