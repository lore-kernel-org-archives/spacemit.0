Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B169F386557
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065179; cv=none; b=b4E638aQ7e43phORfvosOtNQVrCGh2XIZwdt+WXwVu0t64PG8kF8yTxkGUM+tZbPPCUhVUB84htWs80rk+cyBg7EkYlfVOsdnRKkoQaU98uLNxvBtggO03pTeUjI+VFlR+vbhkeP9D/rp3UaY5svfXlavX83W/c89A82L4S1t2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065179; c=relaxed/simple;
	bh=GAdxD2ODxB/c86QgzU3hy4MnLe5aqdkbVZkALteNG0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KiRlSbLr6CUNLio8WMz/83iRh/UMCvIyQ3hV1rveGf4RTt11wiaIt1KI3mIopKctMKlyWtvsHn1au099IJw2bS/jSr1WbRqCzDdnmchqz2pXso/DesfqYmzQx9wGvTjfFJlwJ3nDgtHI3T6TU/mdjV07WyaLtaiWferxt4Xe4VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBhd8CpF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBhd8CpF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so2927566f8f.0
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065176; x=1776669976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLi9neqVCeiJM5TwaR6TR5n9frPeJnqk3U/FYZfnxS4=;
        b=mBhd8CpFNMu7ah2wFmRqY94gITFEbKhWID1Ipt8r9e/dalsaSlInSmPurk9Ff9Dr1v
         KMXesqh5wNuEtVTmJ55AHpSQRy+7Mp7WRpJcRbD+0ICaNB//ArsinT4zMocEPEtKVtnq
         LSPENIHonpln9UUtxHKn9fBOmhgYGmBom70AaYkATgWJGQxqA4PcMQ7il99Mby9QU3EW
         7ANpF74k+8PITi94vWQGLitid8LRvEq3ZASNxD6j9tx9qx7wnT6xkV4KV413rKBI27Wo
         M1wm12wwQ4a3WYP8VkSGUk3QDXzLI+AcfcDLIPaMU7koQz4BMyoJlXpvGh7GDeaMSSoL
         nBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065176; x=1776669976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sLi9neqVCeiJM5TwaR6TR5n9frPeJnqk3U/FYZfnxS4=;
        b=GhtTy86XnQstk4e3D46DeS2oO1+x/P35Fl/66KT7plPpkTwPSeko3PMZcbSKs7HKyK
         vBSZBVhKFZ187Mv33HIpqmto0aP9a+4PB2zRXIr9RcirmjGYkfYlkxbLzNPtDHwtjWJn
         0FALI7qx2kwjFpPuRNVajtuG1JQlq8LbabvtiV0cCsI0bVYSm41tOWXkzgLsC5kQNJYL
         1yZpJxxq9ZUqWq8ba5R3AdR40PqRTz1ziie6CdlmMzY7I3N4jntr7sAvGU9J7x8FMIkq
         E8l6BB+QiPZAFdNYfagWPe9uvO6hdtRynEnNAJ68Wona/m39/0xKJISIt40thks1UOpV
         1d1g==
X-Forwarded-Encrypted: i=1; AFNElJ92de7WEyyTxVvCAIm5KpIhbAYO/3c9oCZhnp3fR+9yT2CQ5EBK76mSvbVEsRTTlTzlubRHLriNZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFPasYBWx1sNLAmDHId31pmGF5xaT5lykuq+YrCocyJ6kJNM7D
	TQiA+KzH2+4GLNwENqXgOmvSnbhV/ygTa+LfxUtbNpoQ+cuB4386j0KE
X-Gm-Gg: AeBDieuUux1EZKpZCQcFFUtYTo1C+In1ZJJsbTmxqoQalygejjBaK36ygVj+js3e4fc
	22tRo01x+228Qzue3PMsnl3dJWhzUYM/KNWBGIaec7ofW3Jtkz3RS5+VDtleb91xMo+4ClAOyEe
	9r1BmH2SpMRm5TcOkqlJ9O6tlHrBTVfku8UDrpJf1AsDZQGupdfGEn8mn4h/Tyni8UgJ6h/zhUg
	THOVPvkESlmlG2gg5nXtN7P+QEWJt8Lyipl3zmmuNdqvqjmeBfsh6gqhxUPjuHkJ0JCcyg8iSzU
	g664erhi4yxqguZZP5xbiT1qMMp7layImIgjLdHubLdtUSlMAnrfL/H1zUWRAJ7wNA1ExJ5Dbhw
	1CryP1kkzymWQNVCcq/RgMPctwrmfNaHognYa2DftDxa7aFrT1tWzgzuc+erqozSS30CNER7MDL
	Al6E33eq0XcythCgyOFtlkoMyHiiE4YdyYLseke8rq0/2nNGCT5SjAxRXymzQmmoTfl+e2o+xit
	oU=
X-Received: by 2002:a05:6000:40dc:b0:439:bd70:610f with SMTP id ffacd0b85a97d-43d642bac24mr17193587f8f.44.1776065176004;
        Mon, 13 Apr 2026 00:26:16 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d76eeb2d1sm10741963f8f.22.2026.04.13.00.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:15 -0700 (PDT)
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
Subject: [PATCH v7 4/9] mmc: sdhci-of-k1: add comprehensive SDR tuning support
Date: Mon, 13 Apr 2026 09:24:46 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-4-16650f49c022@gmail.com>
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
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 172 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index d9144537032a..37b0911e7cf2 100644
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

