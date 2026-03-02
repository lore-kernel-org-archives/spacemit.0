Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0444F41322B
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464448; cv=none; b=HlBl1kDNtxI22vuH5TbzZgHdnJrLgXOOtolRMjZ0BmNeHdurR7QhVhBwigVUpfp5vbnwufv3rOmiuXinNjlAP04m3jULxEdaWsuIYdMPdwiHDS9dfeoXTdKyXy9G92CqYBfyXiDe9lte3rvucPzd3TiVgI09dyHMeKjk3amMnXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464448; c=relaxed/simple;
	bh=YGXsqqioq9kkrCwc3vs62N/3x0ZWHVLmrt+qJu2Nu9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tY8fqfga9iEPOTJvtzMhUwW5iKRv/aDM1OTUokvvB3fJpWFIPwWCWUu0/LwZsPHJlGmFCrEQYoTTcbTS1dU3X63VHC4YvmIwVLVGOb9TpHRjqxNi09QTi5af4pjWnqpF+3w1rsxRUUw5u0z4W92U2bikOzYp8GNj9TgTkOD+djQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R12B+IoU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R12B+IoU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so52685245e9.2
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464441; x=1773069241; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeFtmpd0OzFDMpfzIzFKTIa4npbmPiXE0EW+dCwlXrY=;
        b=R12B+IoUB+qGfDsBDKRSUWd5axmD6navxltLQT9IHxBO82cHAWqrI21XaRUxvvnl/q
         cNqAUH7gE/IBLbVMH58oyIpxJMZhW/gZWfi0X9LmI1xTwuOMO2z3B3aAT+Oe3czG1vwA
         K6IyQCWQm1lqE13gpFQXEv6EtzZaGXjEEne8T2p4l91X5pS3D2g9uQfYCLGKkJB/k5QT
         Rdco5emEE5UjBzJ5qVhhj+H47QflCRW1TkBma5v34JfnL4Wu/elrF7CehpLgaZ74UMSZ
         WeQ2vx+YsdTpbztWktEyrKpEpjkHLXeCibeUY5vOskaAcK5Qr0HrP9LTYmo6tJmXGI3B
         OCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464441; x=1773069241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeFtmpd0OzFDMpfzIzFKTIa4npbmPiXE0EW+dCwlXrY=;
        b=itpqGqEBUe81zHMvo0Wjr1/YloO/m6gC3GFZ/ETQsYCxeDomtowCWKzKqxQKukJBfZ
         Hwx9aiDqGajPchGv0mcnpAmj754VKiQc+0/08vcnAAxriDHbLFOyIhjscVu88wZgXbug
         P+c7dFMnn+R55hUP4Zar5J1QDLRPPGLDZEnJmvZW3EYNAykCqB4aJEp405Od7kAvQjhj
         gEzGwFcIiCzaKDI2qMC/sL8DruHUUQDtLrnJV+DZT0hh9FqQsCs/qS0Bowqpb/gYRZcD
         1Pkff7Z/Ws8/Zw1yGLD0y3lLiQX/M68Pkg89lu1SXd3PvcW4R5tekHP+X+FK7ByJ56aF
         6VhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyCa+4Cx2dMlygPGUB7/XOnhipFU3T2pkVeVtjqFJqNjSLDd7By/I2EAkUgGQFXoQM5mfrxmGHzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOpvsCNJ8LsMEh3nnhS1fKhJtI8z0ZTFGcpabiZxMU307vHNSi
	LTR4YrlcJUrjyd5xrn4u2gyR3R2EHJtHmHjQ7D5fHdRvRWp4MTslLzGR
X-Gm-Gg: ATEYQzxVnXmcMjRinEvMFOMYG2anMXcCpHj6mKPKNAYgcYv30qt/YF7eFSCHp/Elp8u
	NgHbTUwO07p5iZx4x6l1qxnIpDHlBL52WGyTbmohTKFhmdkwUbG66qZhjkK0AYgT2kvB+IBd9i4
	OjVw0P71i2CzBqzhi1+WQFKqk7nHIT7Oo3+/Ae/XAinnWDN3sjAb+BMMc+9znN8W1KDNyJ5IpNy
	X22RR+J9zUTn1LDtGzmuKH96YIpMJD0dFFds2t2L2HcjtCKVK1yZGYixPLHI0IqD55L2vuLoO8G
	O1ZXtGAV2OM/gSJcnQaU6nzEsKVYb6e2nsHGzHaRuFMovDbEeoXzyotu64Vyzrgra2Si/rcshhV
	bm9WQLqjnECWVlV8g8+Wwnz6yZADKSe99i8i4XT84ssA977YoX4SiOhlZS+2peoTHDryD4cjPMU
	Liyl8LtxJxiqJRiGsYLr8Bi1prbpUSop04BNWOhKtPhVnuweCq2FIejvK6Ed1CxsFqFg==
X-Received: by 2002:a05:600c:3550:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-483c9bedad1mr235668315e9.17.1772464441044;
        Mon, 02 Mar 2026 07:14:01 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:14:00 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:28 +0100
Subject: [PATCH 07/10] mmc: sdhci-of-k1: add comprehensive SDR tuning
 support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-7-89c219973c0c@gmail.com>
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
 drivers/mmc/host/sdhci-of-k1.c | 118 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 34a1b9c359193be7dd5f07d1f3d6565b5f40e7ff..95b016bfb5598acea4166257d12af54d945a0c13 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -88,6 +88,12 @@
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
@@ -256,6 +262,118 @@ static unsigned int spacemit_sdhci_clk_get_max_clock(struct sdhci_host *host)
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

-- 
2.53.0

