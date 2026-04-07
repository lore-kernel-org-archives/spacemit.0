Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A503A6B65
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550370; cv=none; b=iLIDqrLl4+pQegck9NO3ET+i9ylk5mYP5bB8p692+Apy6xXbKNWABmYIFQg0IdHl0qVIW6Be0tkOC/G0JuIo5gMiYbour4a+GGbIEcNHYpMRJCM6tgzxdKZ9t3z0lowgo8ebL3XWVwJu/6fNFnDakfrT/2SRyLPTLYpmx8IS2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550370; c=relaxed/simple;
	bh=fQ1KMTaWctmz5D5E3ldpes5nl/8jf8ICxgoE0gxmCaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCBN14deDzcQEVqiogFn0QpgLyx/rE0Ez7Hu/sm2YUQLNEax0RHapOM7URrO7Bo+h5ob5by85iQOQomlwIVLURMS8zAeihQ3pQgM7rbnUl1aWntPA3YAWnkEKmJWRSRVlCP3xJE2Dn/7htLujI63weego52xv3qD0VaZNQqvA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXQMh9EB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXQMh9EB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf5d14d6eso3913378f8f.0
        for <spacemit@lists.linux.dev>; Tue, 07 Apr 2026 01:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550367; x=1776155167; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNCE/cSRi77G3boIciBEAZ+63eediPcSn1mPCDdeY60=;
        b=CXQMh9EBR2LUsk7ai1jz1oihdCWUsrcCCkpaPxlRxo1FLWfivTCLFu8jDFLuSXqQkw
         nhJWp0ebzsVfj99VaMFl5vPE3Ok+ageRcxKRu+gAZeF1sqiurnbWE1Nrjjb7gPVhQuBs
         wfPnM/cGSTLwD+4bEKCyHiih1gfRnreLK9US6t4TJo3SMXqzQqUh06eQ2Z7mrC3QBP4x
         r4St/AhEx06q5rtSv8FBOVHlNy6q83uvCND0fMNnouckyMA0hdUfL8GeJyPZX3yPMAdV
         9MmE2CtuN0WVt0QyqKmDZqnSReRMtQYxfgKJIqE9gVi/Mxl2hMHfni38YNuUC6M4WKcZ
         eEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550367; x=1776155167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNCE/cSRi77G3boIciBEAZ+63eediPcSn1mPCDdeY60=;
        b=NeukC7wUSJz5sz8xiZpiG4fLe2wfSb4Rqku+eflATbSYpC1SDA4IbeRy5Q1XUFMOE4
         5FMyzLzqbrvWM/W+Jd0C1sj6ZBIlo8lreupKNY6A2yLYpLVNp9iXyYoOkN3ZwCEtQ1kJ
         RfTTXXJePqq9fAeZw6SQEDfB/g3fVq9sWjMzrBaHPhoe83xPkCswi/TAkFQ6VA+cV+7H
         LpgKBJrWxdMWTFF/FYmdWOltZNdThUXC7npp5RCSbUrSWnRvaEMnDQVFHAyW5JlEznvg
         IupTqgf28NGYpRnIpRsCnkr8n/FC3Xa+SwsZSJanCumRyAVv9IYyQrmJNFWCVAYhiRwv
         rFdg==
X-Forwarded-Encrypted: i=1; AJvYcCWsRub3US+e4r69Qn32XeGeShAS2NJz5t77kmMvxf5OWH9XJzHq28bS8BM9Vd4olCNK29zqT5YWHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye+DGeXubzuGLgkSpJ6gpnBz+FXDFVOXyfzHVF+GwWVbmUxhdt
	6FDCwU0hgO0no0eWDclwnezQAwLwalTlzwBx4IgRWY21MkSgEeuyuDtM
X-Gm-Gg: AeBDieuapnZKqIipoHRveofYmIFNgfCkZDz8uTTpubw4aubGwsbwviNmZ6tTFmxxf6v
	VRLtIlo/ejaty+T+ehRSKCnotGsB1SaqXhOAy/VqPYkUrdoPGYi3qLk/4qcvS0PW5Xm8b9giRti
	ic/rsVAbn0G44HIRTG4ZS7lEE5f7S2U6+2YIOe9rZKSEGw1vvyjTGGgBFzfkMiAriZGN4Ry6y+Z
	kSXj1JTWvv3R/tDcu9jEciUlYwPAnwazNyCMiK+JkRrcdqkjAHbv4cHuGDfUmIMk69c+jqcf/jm
	L3qLB4hxqNaFz7Wd5q1v8mFpmg1YhX18hVwegeWcO7x4deW4cXls4owPXH/3nRlBlaQUt0Db5MC
	QTvKNCQwARbobndoeFmbIw2uDTLI5fZFWTy8twEe2kFaM0zh35W8JVEILYvfPnNYDyaJ0V5gpXi
	uIjvyoHjJN9yfgsddspFgODD6nsN0gk0okbFfSQJBIM/fZZFsAtafSl9nlHqcPYJjI
X-Received: by 2002:a5d:5d05:0:b0:43c:fbcd:4b4f with SMTP id ffacd0b85a97d-43d292e800dmr23860630f8f.47.1775550367372;
        Tue, 07 Apr 2026 01:26:07 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:07 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:24 +0200
Subject: [PATCH v6 4/9] mmc: sdhci-of-k1: add comprehensive SDR tuning
 support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-4-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Implement software tuning algorithm to enable UHS-I SDR modes for SD
card operation and HS200 mode for eMMC. This adds both TX and RX delay
line tuning based on the SpacemiT K1 controller capabilities.

Algorithm features:
- Add tuning register definitions (RX_CFG, DLINE_CTRL, DLINE_CFG)
- Conditional tuning: only for high-speed modes (≥100MHz)
- TX tuning: configure transmit delay line with optimal values
  (dline_reg=0, delaycode=127) to ensure optimal signal output timing
- RX tuning: single-pass window detection algorithm testing full
  delay range (0-255) to find optimal receive timing window
- Retry mechanism: multiple fallback delays within optimal window
  for improved reliability

Tested-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 172 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index d9144537032a51a12d7480885f247f4c66583e59..37b0911e7cf2023ad440fbdbf504821457f061f6 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -69,6 +69,28 @@
 #define  SDHC_PHY_DRIVE_SEL		GENMASK(2, 0)
 #define  SDHC_RX_BIAS_CTRL		BIT(5)
 
+#define SPACEMIT_SDHC_RX_CFG_REG        0x118
+#define  SDHC_RX_SDCLK_SEL0_MASK        GENMASK(1, 0)
+#define  SDHC_RX_SDCLK_SEL1_MASK        GENMASK(3, 2)
+#define  SDHC_RX_SDCLK_SEL1             FIELD_PREP(SDHC_RX_SDCLK_SEL1_MASK, 1)
+
+#define SPACEMIT_SDHC_DLINE_CTRL_REG    0x130
+#define  SDHC_DLINE_PU                  BIT(0)
+#define  SDHC_RX_DLINE_CODE_MASK        GENMASK(23, 16)
+#define  SDHC_TX_DLINE_CODE_MASK        GENMASK(31, 24)
+
+#define SPACEMIT_SDHC_DLINE_CFG_REG     0x134
+#define  SDHC_RX_DLINE_REG_MASK         GENMASK(7, 0)
+#define  SDHC_RX_DLINE_GAIN             BIT(8)
+#define  SDHC_TX_DLINE_REG_MASK         GENMASK(23, 16)
+
+#define SPACEMIT_RX_DLINE_REG		9
+#define SPACEMIT_RX_TUNE_DELAY_MIN	0x0
+#define SPACEMIT_RX_TUNE_DELAY_MAX	0xFF
+
+#define SPACEMIT_TX_TUNING_DLINE_REG	0x00
+#define SPACEMIT_TX_TUNING_DELAYCODE	127
+
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
@@ -96,6 +118,50 @@ static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u
 	sdhci_writel(host, val, reg);
 }
 
+static void spacemit_sdhci_set_rx_delay(struct sdhci_host *host, u8 delay)
+{
+	spacemit_sdhci_clrsetbits(host, SDHC_RX_DLINE_CODE_MASK,
+				  FIELD_PREP(SDHC_RX_DLINE_CODE_MASK, delay),
+				  SPACEMIT_SDHC_DLINE_CTRL_REG);
+}
+
+static void spacemit_sdhci_set_tx_delay(struct sdhci_host *host, u8 delay)
+{
+	spacemit_sdhci_clrsetbits(host, SDHC_TX_DLINE_CODE_MASK,
+				  FIELD_PREP(SDHC_TX_DLINE_CODE_MASK, delay),
+				  SPACEMIT_SDHC_DLINE_CTRL_REG);
+}
+
+static void spacemit_sdhci_set_tx_dline_reg(struct sdhci_host *host, u8 dline_reg)
+{
+	spacemit_sdhci_clrsetbits(host, SDHC_TX_DLINE_REG_MASK,
+				  FIELD_PREP(SDHC_TX_DLINE_REG_MASK, dline_reg),
+				  SPACEMIT_SDHC_DLINE_CFG_REG);
+}
+
+static void spacemit_sdhci_tx_tuning_prepare(struct sdhci_host *host)
+{
+	spacemit_sdhci_setbits(host, SDHC_TX_MUX_SEL, SPACEMIT_SDHC_TX_CFG_REG);
+	spacemit_sdhci_setbits(host, SDHC_DLINE_PU, SPACEMIT_SDHC_DLINE_CTRL_REG);
+	udelay(5);
+}
+
+static void spacemit_sdhci_prepare_tuning(struct sdhci_host *host)
+{
+	spacemit_sdhci_clrsetbits(host, SDHC_RX_DLINE_REG_MASK,
+				  FIELD_PREP(SDHC_RX_DLINE_REG_MASK, SPACEMIT_RX_DLINE_REG),
+				  SPACEMIT_SDHC_DLINE_CFG_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_DLINE_PU, SPACEMIT_SDHC_DLINE_CTRL_REG);
+	udelay(5);
+
+	spacemit_sdhci_clrsetbits(host, SDHC_RX_SDCLK_SEL1_MASK, SDHC_RX_SDCLK_SEL1,
+				  SPACEMIT_SDHC_RX_CFG_REG);
+
+	if (host->mmc->ios.timing == MMC_TIMING_MMC_HS200)
+		spacemit_sdhci_setbits(host, SDHC_HS200_USE_RFIFO, SPACEMIT_SDHC_PHY_FUNC_REG);
+}
+
 static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 {
 	sdhci_reset(host, mask);
@@ -191,6 +257,111 @@ static unsigned int spacemit_sdhci_clk_get_max_clock(struct sdhci_host *host)
 	return clk_get_rate(pltfm_host->clk);
 }
 
+static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
+{
+	int current_len = 0, current_start = 0;
+	int max_pass_len = 0, max_pass_start = 0;
+	struct mmc_host *mmc = host->mmc;
+	struct mmc_ios ios = mmc->ios;
+	u8 final_delay;
+	int ret = 0;
+	int i;
+
+	/*
+	 * Tuning is required for SDR50/SDR104, HS200/HS400 cards and
+	 * if clock frequency is greater than 100MHz in these modes.
+	 */
+	if (host->clock < 100 * 1000 * 1000 ||
+	    !(ios.timing == MMC_TIMING_MMC_HS200 ||
+	      ios.timing == MMC_TIMING_UHS_SDR50 ||
+	      ios.timing == MMC_TIMING_UHS_SDR104))
+		return 0;
+
+	if (mmc->caps2 & MMC_CAP2_NO_MMC) {
+		spacemit_sdhci_set_tx_dline_reg(host, SPACEMIT_TX_TUNING_DLINE_REG);
+		spacemit_sdhci_set_tx_delay(host, SPACEMIT_TX_TUNING_DELAYCODE);
+		spacemit_sdhci_tx_tuning_prepare(host);
+
+		dev_dbg(mmc_dev(host->mmc), "TX tuning: dline_reg=%d, delaycode=%d\n",
+			SPACEMIT_TX_TUNING_DLINE_REG, SPACEMIT_TX_TUNING_DELAYCODE);
+	}
+
+	spacemit_sdhci_prepare_tuning(host);
+
+	for (i = SPACEMIT_RX_TUNE_DELAY_MIN; i <= SPACEMIT_RX_TUNE_DELAY_MAX; i++) {
+		spacemit_sdhci_set_rx_delay(host, i);
+		ret = mmc_send_tuning(host->mmc, opcode, NULL);
+
+		dev_dbg(mmc_dev(host->mmc), "RX delay %d: %s\n",
+			i, ret == 0 ? "pass" : "fail");
+
+		if (ret == 0) {
+			/* Test passed - extend current window */
+			if (current_len == 0)
+				current_start = i;
+			current_len++;
+		} else {
+			/* Test failed - check if current window is best so far */
+			if (current_len > max_pass_len) {
+				max_pass_len = current_len;
+				max_pass_start = current_start;
+			}
+			current_len = 0;
+		}
+	}
+
+	if (current_len > max_pass_len) {
+		max_pass_len = current_len;
+		max_pass_start = current_start;
+	}
+
+	if (max_pass_len < 3) {
+		dev_err(mmc_dev(host->mmc), "Tuning failed: no stable window found\n");
+		return -EIO;
+	}
+
+	final_delay = max_pass_start + max_pass_len / 2;
+	spacemit_sdhci_set_rx_delay(host, final_delay);
+	ret = mmc_send_tuning(host->mmc, opcode, NULL);
+	if (ret) {
+		u8 retry_delays[] = {
+			max_pass_start + max_pass_len / 4,
+			max_pass_start + (3 * max_pass_len) / 4,
+			max_pass_start,
+			max_pass_start + max_pass_len - 1
+		};
+		int retry_count = ARRAY_SIZE(retry_delays);
+
+		dev_warn(mmc_dev(mmc), "Primary delay %d failed, trying alternatives\n",
+			 final_delay);
+
+		for (i = 0; i < retry_count; i++) {
+			if (retry_delays[i] >= SPACEMIT_RX_TUNE_DELAY_MIN &&
+			    retry_delays[i] <= SPACEMIT_RX_TUNE_DELAY_MAX) {
+				spacemit_sdhci_set_rx_delay(host, retry_delays[i]);
+				ret = mmc_send_tuning(host->mmc, opcode, NULL);
+				if (!ret) {
+					final_delay = retry_delays[i];
+					dev_info(mmc_dev(mmc), "Retry successful with delay %d\n",
+						 final_delay);
+					break;
+				}
+			}
+		}
+
+		if (ret) {
+			dev_err(mmc_dev(mmc), "All retry attempts failed\n");
+			return -EIO;
+		}
+	}
+
+	dev_dbg(mmc_dev(host->mmc),
+		"Tuning successful: window %d-%d, using delay %d\n",
+		max_pass_start, max_pass_start + max_pass_len - 1, final_delay);
+
+	return 0;
+}
+
 static int spacemit_sdhci_pre_select_hs400(struct mmc_host *mmc)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
@@ -326,6 +497,7 @@ static const struct sdhci_ops spacemit_sdhci_ops = {
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_clock		= spacemit_sdhci_set_clock,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
+	.platform_execute_tuning = spacemit_sdhci_execute_tuning,
 };
 
 static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {

-- 
2.53.0

