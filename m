Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51A23A6411
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056437; cv=none; b=LLzQJfIdgm/JNBiAJWr29N0oc2DZHlrsBdHKK02kFHwp+ScZTzLd1pFv4WeORFVrgE4+kCstEKKfvzDpuOZMCO0l3yloERGEtITCsnHghOnWNHlQ+RMnLJZd6rmAQSQtcUyUVDLlC5tmmjZCb/aNKyHGb98jqekGAeAK9Z4Y+oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056437; c=relaxed/simple;
	bh=zh+ggJ1R5qBO3E8+3w58NjmsHpAAdOtGm81LBUggVYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A7OI0de1Q/V+UW+UhZthc7NtD3otRu1jRwTYlFyw0xntu5CLv4iKXFSaNuelaFC6G70sMrSRbm+eg8QOQNnC+XEV2bGCQo9ehUbrE+zCpk6O75vPgQcPX8bUH0t30CHBt5yY8fimNhs8/5ksdz7zLQ2/jDeFWvfBigckrdb+8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIA8OCTT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIA8OCTT"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c5b40f60so4566173f8f.0
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056433; x=1773661233; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YpjhzcIYcSxtAdjQVzNzPM/tyjIJ5Q1jULtAL2eLJs=;
        b=DIA8OCTT0HSjXF3VuQPsHQLoHrc2Dul4FNbH32CQ+mZiR3qjeQfClwsX7nEPieFuiW
         peuC/4nR6Ghnj3uw/0r8zd5PRvuvkjUbi7gEpN15YToPM9hkdI/zZknD7wnYgTTO9wcE
         SaiEr3Yt5+bwPLG0Kx3e92I+koeyxlCrtxVRSTnt35xXC8IrBuwEZUFsKV3/kf/HflFm
         v25EJyd7B/xLqIlXX6eAj2uklsVrm3TKA8eyP/rRVmLHDPxfocfMKz1rfhNYxN94U0+E
         5HMIwtctC1GNk6IbOZ+nDgFfEaFZLTjv6r66+NCBRjC/BkrkXeonmR8ZqvIW32cOGe22
         Qe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056433; x=1773661233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0YpjhzcIYcSxtAdjQVzNzPM/tyjIJ5Q1jULtAL2eLJs=;
        b=Rpe7tuI8ne3zqaApKpjIX99QYVg0pJiyAiSz40yukz9w50QyvRnEFqi6uS9QNmNqbT
         c6iwwMlaZ3um5jQ0tl16nLLHu8JbcmmK/ihrQ4AL+Cswa+AZc/whSBsUZbxsIL3JOnOf
         dvCZZydrRo+/Ye8ENh0UXsJsQ60e11Q4L1WTY/xNgukmeK/JXLnpVDs+YtQmyHyApta+
         E+AO0TNZ29H7qoLqK6PQnjkWvmxUmg19m/47mzcE6R6+Igl4wd1lRAHEnF5+5ZgtOFBE
         cuCq0rH/b1Qy1qd2+TOonljLenqrmoKaUvjtJYaon29Qkwy8QEpJS/Ga1M+gyFySMOLL
         NIOg==
X-Forwarded-Encrypted: i=1; AJvYcCX00MJGRHK1E3bwiRQR5l07uSlrCoU9qskH/cyL1FJ0cQ0VWa5KgpRHntBst/C+4Fj2llP5Fi4ITA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqfK4Rl5ID6Eagz5UGdnyCNRyBBiXdeoUJ9sXUFjM52RdM7V4Y
	Cyi1T1xjC8oAyV0AyG+3ZQrCX4JIkim8xKFkllOr+LwVyu1n0aYc8gu6
X-Gm-Gg: ATEYQzyQo9VLOcqYo6xM1aDazF5MIjDdU7pHnFOhDFIjgERhhbwlG0OJgpaOPpPrSF6
	TNb8a8tVcXQXO6fFj79a+wB8EijpASGK6h7r8nlOKoLRROrdsUHdOAqL3m5MOsPbfmrVCjNhdoC
	EOcEeJlUBPTiv2faM+ZC8ucTblOmNv2sHvxn2qWPH3G+WyQjf2PFbODkgz17eqEXu7XFugiOZdX
	Hc1cUIUoae2RIfWOPw6J9wO8IQOH4F9GZCxukZOKpyivhp9QAdY5HOrjgQyzM/DoWweey8zZYeN
	Q2CWbaiix9xsR7Js3jEp07T8G8UUmOTiOEhubPZvdJtjIML99GWbnHT/ybbLFaRolsgR1Ji/b6x
	S78PmC7Zqd/lRaeyr/A9WXdj5X7CPzyhymCSeMWVjaY9w0HZxSLNw62rhyrdypeTNcfFfDSgbgl
	I9cNYxC44ywm6nMm2jBd8aa0Q0Y6Heh98JJOLS6klYILPN/c+rmmn58+3tKbIDk+w7
X-Received: by 2002:a05:6000:3112:b0:439:d242:e8fe with SMTP id ffacd0b85a97d-439da348327mr18838818f8f.11.1773056433101;
        Mon, 09 Mar 2026 04:40:33 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:13 +0100
Subject: [PATCH v2 3/7] mmc: sdhci-of-k1: add SDR tuning infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-orangepi-sd-card-uhs-v2-3-5bb2b574df5d@gmail.com>
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

Add register definitions and delay line control functions to prepare for
SDR50/SDR104 tuning support:

- Add tuning register definitions (RX_CFG, DLINE_CTRL, DLINE_CFG)
- Add delay line control helper functions
- Add tuning preparation function

This infrastructure prepares for implementing the SDR tuning algorithm
while maintaining all existing functionality.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 8af117a8e271c04a80d8dc7bb5ce12075652dd7a..79cb7c8d0b6d9c4206bf01721651c8efe8a173c9 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -68,6 +68,23 @@
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
+
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
@@ -95,6 +112,50 @@ static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u
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

-- 
2.53.0

