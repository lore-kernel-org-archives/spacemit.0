Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CAE23183C
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464446; cv=none; b=H4Ef+SBhiY5nscndIr6r3uLRQaAi8S23R9BuTwaU+7G4K4L7iTsUZaQd+/ovlYaBfQfNmc7DTj4yOiEbGcqcTXaBGl1+UYi7odcl42SfbBhFnrGTKCQvXLN3KFXjQ0AaXRohdypQT7+0HI6svA8erEsq5qtL8n/tTQDzoU7EIks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464446; c=relaxed/simple;
	bh=GcZr61TwOvUtUfWMRCxXjJRa5feWxGnGJ1rS2AAyvgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCL0XfGEh3Wx3URvJuZDKtCQkR5p/YjsZrkHNZ8B6T+e0rFrBMbPlOkJuaki8iWaTozl02roCgagyLIZ3lvVndqkgRaQEvMchWHxS84VMctx31ezPjpQ3BSO9pNf5cBElwNGL3oXNRX9nVe+5ueRxozifDXjAjvr8gWGlJ14bcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsIxrL/f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsIxrL/f"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso41207265e9.3
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464439; x=1773069239; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI0ZXWmHjNvtD6IpJHMeOdxd2SjR4noe2NBQlRy+ENQ=;
        b=MsIxrL/fwMW0vs486KZ3BJLf5jBSKGmEDyCyxpI/8AcbKuCxie8TdCP8BTOjD48xyP
         Joawn6KHkopNU660ioK6TJ12qqOM+RC6WFsabzvKnA2kcvaZ7TqbjU3qG8KRn+RrNmQy
         KcW/iPPT6jkVf14eiy7uOqnZaPHmVQn/4gMHD+uo4rD+G/W0VKW0x5xjkfJGkwM1snLM
         2mDhAc/lmOa0CiSSFiPMSk2RYWKIhBC84cYJlnGyKAPC1qHJVUyD60YNtsGFE6xndK7t
         76C+KZGo1ZYZQzoNyzfsf2+aWV7H3nm9fwRvTDva1VbeRTYoOinsTQi8VY9D1E7BwAUa
         ncvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464439; x=1773069239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sI0ZXWmHjNvtD6IpJHMeOdxd2SjR4noe2NBQlRy+ENQ=;
        b=le3lxWm3/oyH5t6I8nspHbxxDk2GcmrS3H9l+MPz9B2jZCrKH3eFgYbB6D1nBD6hI6
         EjkIlErKbfVteVmVW7yawsLhksMAj3E4WUo9GZrbgfI7OUuutbC3RVIcmTceDJjJAnCH
         Iiwd0illnGeJIj5tf9JzvvT+qCsw0PxGIFCK7r2URbNUGLlRhMPux88KowalVPKRPOPT
         ncnI+2f5wZbUVg8gPrEIJflxUWwjUCvXqbLnzt/PHDB6o5XH7/9gCwIR/0oEsDLOd2C8
         nP8JowtltxBtxZfLGkG0j2FIdD9wzrlQpZO8N4U/ass962F5QUXNLXVnJPhJPTCltFTM
         Ue2w==
X-Forwarded-Encrypted: i=1; AJvYcCXJJ9y2beGYleCDROEp4Di+opzrlkLV/5j4Ynu+PF3VbGB30KF51vCvIvELicoPBIjkESWbiPqFZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQvguupZ1gAb3emBxV9DnUGq3n15EQhKYC2xseEBuH1crh1yvP
	6sdyXSPi656bvHIgtts4xgdMRlDuOOY6YqIMLEMHaB+/mnMxgwiuuVV+
X-Gm-Gg: ATEYQzxhb3wXFTmG+IuT8oEXJxHvvhNbZqNpTzEY/8SyuHjsG6nEWFdrO0PP5+nh9vS
	WgjWT17FcbBPzlHVZKjzMvYmi5w4y7Jk/T39zOZrhpZhKHGalx73fEruLgJWQUOYzlkf5sFWIO1
	4SF9ZMsqpfkpWvnk1hf2RfkPpHvLcM3vqCz69q9xx7TPESAt7UVPBAVCLeTMgZYY4+I6hudWo3a
	9DkS9epfMTlBR4DcEG3c0hpqxLRj3UmRjgMNNHL7y9oz78xklru869TirlWXkp2bI2bhFt+0r1u
	3cfkCcOwRufS3WbSV+tt10j5yZ/IWFS8+XfMTiyQWTSABen5TLyI5V0TW4Ck1x4F+Li9r9TrZLS
	c3X5n/NiRZ3r+/exH8WP38gJ0ydcQt0Lbow6EuAA1iPjNa+CGAIVLwlnoMA2+BD5YVYcBVU6p7M
	oDgtRHF083EPtn8P6urFu0NoiA+5q9Fyumb3X1YAiY07ggfa4qbzLysaJ7tSk5X1axbA==
X-Received: by 2002:a05:600c:5395:b0:483:709e:f22d with SMTP id 5b1f17b1804b1-483c9c24797mr190414855e9.27.1772464439170;
        Mon, 02 Mar 2026 07:13:59 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:58 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:27 +0100
Subject: [PATCH 06/10] mmc: sdhci-of-k1: add SDR tuning infrastructure
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-6-89c219973c0c@gmail.com>
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

Add register definitions and delay line control functions to prepare for
SDR50/SDR104 tuning support:

- Add tuning register definitions (RX_CFG, DLINE_CTRL, DLINE_CFG)
- Add delay line control helper functions
- Add tuning preparation function

This infrastructure prepares for implementing the SDR tuning algorithm
while maintaining all existing functionality.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 62 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 9425bde6a72541bd628997e91f957072a6266c25..34a1b9c359193be7dd5f07d1f3d6565b5f40e7ff 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -72,6 +72,23 @@
 #define  AKEY_ASFAR			0xBABA
 #define  AKEY_ASSAR			0xEB10
 
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
@@ -102,6 +119,50 @@ static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u
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
@@ -335,6 +396,7 @@ static const struct sdhci_ops spacemit_sdhci_ops = {
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_clock		= spacemit_sdhci_set_clock,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
+	.platform_execute_tuning = spacemit_sdhci_execute_tuning,
 };
 
 static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {

-- 
2.53.0

