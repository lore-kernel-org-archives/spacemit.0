Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0B63A4F27
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056438; cv=none; b=aZjL9bq0Vb5uBD/rlkvM412OUixMA9i9gf6SQy1OzR7dbZdGqFwbJkdz47iSvmI8mAa5fIs/TiTOKCtKJ5Fgiyb1/S4iXZFiRw0AD6b3Ipp//fqTwp52kb6etmX9zzjWbVr+1ZmF4foFdHB+Ye+V82pY6DjBtD09XobCfZ6r7sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056438; c=relaxed/simple;
	bh=iawZxXCHV/teSW9TbByTZ0aCl2jCak1q3AZVPQS3+5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AV3utJPWjKpsMx5UrWvA+7h5bYLvl0yqxqArXJBjXz1pvEUvXNfBQEUutVif1VxWkMZ0UjP/rPtLiqRPcXkrdjfKnq/DjvILJJwY5FcBQdTc3iSa3D5ElRNBUsjv6Vhpk3ARQaJ5dHG7jtd8UFy56ZLo2TxO9abi4A040CWLhjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdjviQj5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdjviQj5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso3706745f8f.1
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056435; x=1773661235; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ9F92hXIJmt/OqV8+0Y8qWB6C+g5fuewMC6KiuhW88=;
        b=OdjviQj5JucNzo2FbFbcypVE++8JqGiDnoUlFrzsoFVoGpMIswtOyzDD9DxAPu7gmO
         PwUDcu77IdEdzMxY3tRlmZsYR4Uc33Ch8vmSY5W6Wz6r5eIggG6CR+xATaMpmK7ZcRRs
         Qmcq1MtxssSziwTUDMCbfQByi/tvfv+m4G4SuHcunoN+bD7cyvRErbGoN92sFC8S46wn
         NDrPY3xMAl9zBUWsYK7JtKD4k/J/2sCQDezB587Jyjb9rzj38qVU7GDin3ETllv7FZuI
         d3Tt3vZ8ZM2qWmpZKRsea43+WYCky2uA0/CqmS5SG1uNOyzSwa+q7rPogdmRRbvCcSr6
         UqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056435; x=1773661235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQ9F92hXIJmt/OqV8+0Y8qWB6C+g5fuewMC6KiuhW88=;
        b=l7lAZ66NCX8ST8XwF+WGSWZv1qpnC4EBcTURS4OWPY6lyZ/cjraEAvqaRcGUU+oVOR
         338h6qt8WTh4eVHpOVnFNGSbZ9WSNbIT09HGDXCDkXyqeH2HDPo3Hmv6r1P6haM7olkD
         2BWvx1Qgj4i3sY5AR/6CPScRKmSpiuMckO1yw15j8JsUQXOggTHuui8RD12ULVdaPM+Q
         6qfZ66fzAGGBd0hawva1FK4f/IZWVgg01PtqqCtUXU5MvCWS5/a0DipaGaaloaPwELcU
         uKqwgpjbI0k4Qf80o4XyCO+A7ogNE9/nm73ric+vE7bVgYJDt9FLuyuqmNRameOCoAcH
         3yGg==
X-Forwarded-Encrypted: i=1; AJvYcCUogxUGcD59UAzOZ0Q7Ni6UJVfVGZUWRFImlaziBgJxCRr/FKDaSL9+NHiofWB43InorqxPneo8nQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyI/1v5yJSOosDJZlicfAMrUw1uSLsp4HhgItsckZR6nkABO+tE
	wNt7sySFi4gvdG6ez2wX7LnWUKHLdYD6jBhcxiR8WdAK6Eg89QKd89h6
X-Gm-Gg: ATEYQzz5w5Xkeh8Ul8o9Wi2p07gfjZ5+83BShTfKVGpxzA1PZtUXa/rezLRCXULRCeM
	qZwL5n2F3by/iFyee7gZV3I2Uc0eoOmQ8umeggG0ThTc8HmgsXai+k3I47rY0BQ4j1DqemDBf9p
	LP1djePdXT0ah9v8y/OBWWuedaIa8G7Sk27vhi9fFMiC5d8XdkDeDU6EuzC8WQToUt2LOLAMdw8
	7F4kBHGKIHepZHNTU9//kxi/9uF7Yktm1U2DTueKHhrMKTvRSwyO+B1mvMUYGL1/nwAzmtCGK5N
	lgq9Z/SH9mANyp1cTJG7nX6F+bNxmUrgtEIBM258X2iJ9gh6w4hejkVlAkmh1fwBtyDR+niMujs
	oJeSYvq/hpj21qbueqYRG82dR0fasBcfHM68wgV94ab61aHgIVoyxeX+LctflfxcdGe9d0i3RBD
	ifMXQDNHw/qFO/hXeuFfG0xmX0aSotZRcfc3G0Io76eVvd5FwiAEeMlhRRIJo0kwJG
X-Received: by 2002:a05:6000:1886:b0:439:b541:a091 with SMTP id ffacd0b85a97d-439da8a2cd8mr18675754f8f.56.1773056435052;
        Mon, 09 Mar 2026 04:40:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:34 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:14 +0100
Subject: [PATCH v2 4/7] mmc: sdhci-of-k1: add comprehensive SDR tuning
 support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260309-orangepi-sd-card-uhs-v2-4-5bb2b574df5d@gmail.com>
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

Implement software tuning algorithm to enable UHS-I SDR modes for SD
card operation. This adds both TX and RX delay line tuning based on the
SpacemiT K1 controller capabilities.

Key features:
- Conditional tuning: only tune when SD card is present and for
  high-speed modes (≥100MHz)
- TX tuning: configure transmit delay line with default values
  (dline_reg=0, delaycode=127) to ensure optimal signal output timing
- RX tuning: test full delay range (0-255) with window detection
  algorithm to find optimal receive timing
- Retry mechanism: multiple fallback delays within optimal window for
  improved reliability
- Complete register support: add delay line control and configuration
  register definitions for fine-grained timing control

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 119 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 79cb7c8d0b6d9c4206bf01721651c8efe8a173c9..d903851b9be0e1d21a2b30636f5e63a52cad0dc2 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -84,6 +84,12 @@
 #define  SDHC_TX_DLINE_REG_MASK         GENMASK(23, 16)
 
 #define SPACEMIT_RX_DLINE_REG		9
+#define SPACEMIT_RX_TUNE_DELAY_MIN	0x0
+#define SPACEMIT_RX_TUNE_DELAY_MAX	0xFF
+#define SPACEMIT_RX_TUNE_DELAY_STEP	0x1
+
+#define SPACEMIT_TX_TUNING_DLINE_REG	0x00
+#define SPACEMIT_TX_TUNING_DELAYCODE	127
 
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
@@ -251,6 +257,118 @@ static unsigned int spacemit_sdhci_clk_get_max_clock(struct sdhci_host *host)
 	return clk_get_rate(pltfm_host->clk);
 }
 
+static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
+{
+	int ret = 0;
+	int i;
+	bool pass_window[SPACEMIT_RX_TUNE_DELAY_MAX + 1] = {false};
+	int pass_len = 0, pass_start = 0, max_pass_len = 0, max_pass_start = 0;
+	u8 final_delay;
+	struct mmc_host *mmc = host->mmc;
+	struct mmc_ios ios = mmc->ios;
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
+	if (!(mmc->caps2 & MMC_CAP2_NO_SD) && !mmc->ops->get_cd(mmc))
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
+	for (i = SPACEMIT_RX_TUNE_DELAY_MIN; i <= SPACEMIT_RX_TUNE_DELAY_MAX;
+	     i += SPACEMIT_RX_TUNE_DELAY_STEP) {
+		spacemit_sdhci_set_rx_delay(host, i);
+
+		ret = mmc_send_tuning(host->mmc, opcode, NULL);
+		pass_window[i] = (ret == 0);
+
+		dev_dbg(mmc_dev(host->mmc), "RX delay %d: %s\n",
+			i, pass_window[i] ? "pass" : "fail");
+	}
+
+	for (i = SPACEMIT_RX_TUNE_DELAY_MIN; i <= SPACEMIT_RX_TUNE_DELAY_MAX;
+	     i += SPACEMIT_RX_TUNE_DELAY_STEP) {
+		if (pass_window[i]) {
+			if (pass_len == 0)
+				pass_start = i;
+			pass_len++;
+		} else {
+			if (pass_len > max_pass_len) {
+				max_pass_len = pass_len;
+				max_pass_start = pass_start;
+			}
+			pass_len = 0;
+		}
+	}
+
+	if (pass_len > max_pass_len) {
+		max_pass_len = pass_len;
+		max_pass_start = pass_start;
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
@@ -344,6 +462,7 @@ static const struct sdhci_ops spacemit_sdhci_ops = {
 	.set_clock		= spacemit_sdhci_set_clock,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
 	.voltage_switch         = spacemit_sdhci_voltage_switch,
+	.platform_execute_tuning = spacemit_sdhci_execute_tuning,
 };
 
 static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {

-- 
2.53.0

