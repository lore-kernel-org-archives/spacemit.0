Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D541B35A
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464442; cv=none; b=l//QDqUHm6VDDhcTHvD+tXnI+gIPJLEfZZBI8frlgSEz22FxUSt8EgFA0+EPPUOPjf/pjKF3lKUUscnW40PUsygY1YZzAiFVI94HS4VMlZFEc/EbOEGdwbDDkbVbllbR126EoVSHvdR/6xM7ubZvTQxyQT7tKgVbgxv2jKOvUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464442; c=relaxed/simple;
	bh=oROrpMpGRFTyu9YVgnx3q3a5mnQL/8tXkXG+ZsNoOvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYAmYwjwEO83GqP+64TZOSj4Te67vGlkrAEkfz/fnRx7+vLTRO7N1YR6baxrN5p9Y4p19jq6jch1GHoRjvSncVTrcyWqlu3Q3dbhyhJoWbWG6nOYn4EuQyKdtpkxl+y9l785W7u7daqd8LcTGXtZFo7vfc3+I9Jn/jWxtn/5oGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2yzYNEi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2yzYNEi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso40341715e9.3
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464437; x=1773069237; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vMnihDprCpz00E0mqvOLaz+xzD900tygzUTesRDljg=;
        b=T2yzYNEiGlcD+Bl0SImauiA9gLTFl180+m1hM7AUEc4/eKfN8c8+ChH292XPwxobKa
         loi1igzQbBJg34KQ827SiV9bhgIBWblhHuUm3h3VfLUPEqXtayFOWBeenLh4QVd6rtdc
         lprPDalLLRd/3fDZQaO8qE6P0FlnwI4+aeB/xxdssp3toeCJYnStSbmWcd3Cb/v48BD6
         sEulx2C9Esfx9IWR1MUWA0cz9vJDejUh4K0masArUqSpyToavb1b9ZYRmDLrapZViS8d
         SHvh6Q6g4CPNqan5cpuImqqwfoPRl1mOpdENhDmzWwowbrCTVnCzvM7k9TGYGhfGUl+X
         P/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464437; x=1773069237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1vMnihDprCpz00E0mqvOLaz+xzD900tygzUTesRDljg=;
        b=gJbxqQz1ToWFQsXngmre9t5ANw00TjUHt7NNXdt9IC5SZBOT/cEQItSMFNYFDUzC+S
         J8ZJB56fnSoUK+vdkimk061iyf4S/F9e0VMCsYdwOAO32SwlT5Oi8PWCFablUqShQa/n
         v9/h6ZOCK4P42+XuZBfJ/Ps/IeXMp25tcfF680hizkm+DQuDBWw8cQZc+D/K1KGoNvsX
         75iqiXLqIfIc42xjJT98fTGLusw7u8UVjzbtK8ufxHo9vBjw6Q5Xxuj8NpplBpeKgBXB
         t0Ig84DbPo9sCMh1sW1C8aSWFMtAOAW/4q/ZFgOwzjXTF6/9SshXZb85/QqE/OIXrQ6J
         1Vgw==
X-Forwarded-Encrypted: i=1; AJvYcCVmCt0nq/PDM8nJsJnusJcvA/RAoJVajc9xOB3IJ99pfIEo7o6VGGwaWjzk0QG77VKyA4TPCS2TNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJdP4udNsldPsZfy4FrAqKIde8UXHG2ErpxgvCpxnmJPDfFEQ3
	bwVSSPXMLJ+Y00/FGnGe6/vh7uCc5FI7d9veS9tTTLcIrutflM2jbNeu
X-Gm-Gg: ATEYQzx1+gCa/gFW+1nXViSo/CF0K8o6eSW8XrIa8HnR+0Wf1lhNkRTqc3I+H0Xz0Z5
	FXmXtaFjeZJGmOarheypVZb0UATLS6d1Ot0TppywhOMTOV2BHA7Hrq2ZomdXiRH1qJ+ZgVnpk+H
	tzqcAmxVkM9s2wo3XiC06ARQ4q4A+uJTbfWUrDBmEXWTmndlIg/t9MXXCaQ3+JVwXCCOAfTumgY
	ba0iIM43t3OF0kiwwaUS5RdvJ5Oga6Txq+HVJ+JZaPRAHikF+l/IGhC/iLz+J3umC7ZGyEAOy47
	d+9+Vs35WjlZa3Ryb5easqzCpkVgs6og321+6kvZcRXn+Aq85FjiL5lzyH9qisZA6YMkjWGsZeW
	zzehw0lRL5DyBfim8ea4uFGvGpdYVt18kqCEkE9/PK15GGEoQAJ/t8TbryUGGQb5Gy9hGK+4LRv
	tNA4uIwZW/sWUceGNm6JxTJgMnEvuIu0nVjIqvYJUvpBImN6ea+hD9Eyr2kF+BQO65fg==
X-Received: by 2002:a05:600c:c16e:b0:482:e5d4:b7ca with SMTP id 5b1f17b1804b1-483c9bbb8d3mr200785895e9.8.1772464437211;
        Mon, 02 Mar 2026 07:13:57 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:56 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:26 +0100
Subject: [PATCH 05/10] mmc: sdhci-of-k1: add AIB register support for
 voltage switching
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-5-89c219973c0c@gmail.com>
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

Add support for SpacemiT K1 Analog Interface Block (AIB) register
programming required for proper UHS voltage switching. The AIB register
controls SoC-level voltage domain coordination between the SDHCI
controller and I/O pins.

- Add AIB register address parsing from device tree
- Implement authentication sequence for secure register access
- Add voltage domain switching for 3.3V/1.8V operation

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 2a982bca2a50ca96f43af7b4de5bc4fb4b5b195b..9425bde6a72541bd628997e91f957072a6266c25 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -68,12 +68,19 @@
 #define  SDHC_PHY_DRIVE_SEL		GENMASK(2, 0)
 #define  SDHC_RX_BIAS_CTRL		BIT(5)
 
+#define  MMC1_IO_V18EN			BIT(2)
+#define  AKEY_ASFAR			0xBABA
+#define  AKEY_ASSAR			0xEB10
+
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pinctrl_default;
 	struct pinctrl_state *pinctrl_uhs;
+	u32 aib_mmc1_io_reg;
+	u32 apbc_asfar_reg;
+	u32 apbc_assar_reg;
 };
 
 /* All helper functions will update clr/set while preserve rest bits */
@@ -220,6 +227,47 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static void spacemit_sdhci_set_aib_mmc1_io(struct sdhci_host *host, int signal_voltage)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	void __iomem *aib_reg, *asfar_reg, *assar_reg;
+	u32 reg_value;
+
+	if (!sdhst->aib_mmc1_io_reg || !sdhst->apbc_asfar_reg || !sdhst->apbc_assar_reg)
+		return;
+
+	asfar_reg = ioremap(sdhst->apbc_asfar_reg, 4);
+	assar_reg = ioremap(sdhst->apbc_assar_reg, 4);
+	aib_reg = ioremap(sdhst->aib_mmc1_io_reg, 4);
+
+	if (!asfar_reg || !assar_reg || !aib_reg) {
+		dev_err(mmc_dev(host->mmc), "Failed to map AIB registers\n");
+		goto cleanup;
+	}
+
+	writel(AKEY_ASFAR, asfar_reg);
+	writel(AKEY_ASSAR, assar_reg);
+	reg_value = readl(aib_reg);
+
+	if (signal_voltage == MMC_SIGNAL_VOLTAGE_180)
+		reg_value |= MMC1_IO_V18EN;
+	else
+		reg_value &= ~MMC1_IO_V18EN;
+
+	writel(AKEY_ASFAR, asfar_reg);
+	writel(AKEY_ASSAR, assar_reg);
+	writel(reg_value, aib_reg);
+
+cleanup:
+	if (aib_reg)
+		iounmap(aib_reg);
+	if (asfar_reg)
+		iounmap(asfar_reg);
+	if (assar_reg)
+		iounmap(assar_reg);
+}
+
 static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 						      struct mmc_ios *ios)
 {
@@ -233,6 +281,8 @@ static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 	if (ret)
 		return ret;
 
+	spacemit_sdhci_set_aib_mmc1_io(host, ios->signal_voltage);
+
 	/* Select appropriate pinctrl state based on signal voltage */
 	if (sdhst->pinctrl) {
 		switch (ios->signal_voltage) {
@@ -341,6 +391,16 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 		dev_warn(dev, "Failed to get regulators: %d\n", ret);
 
 	sdhst = sdhci_pltfm_priv(pltfm_host);
+
+	if (of_property_read_u32(dev->of_node, "spacemit,aib-mmc1-io-reg", &sdhst->aib_mmc1_io_reg))
+		sdhst->aib_mmc1_io_reg = 0;
+
+	if (of_property_read_u32(dev->of_node, "spacemit,apbc-asfar-reg", &sdhst->apbc_asfar_reg))
+		sdhst->apbc_asfar_reg = 0;
+
+	if (of_property_read_u32(dev->of_node, "spacemit,apbc-assar-reg", &sdhst->apbc_assar_reg))
+		sdhst->apbc_assar_reg = 0;
+
 	sdhst->pinctrl = devm_pinctrl_get(dev);
 	if (!IS_ERR(sdhst->pinctrl)) {
 		sdhst->pinctrl_default = pinctrl_lookup_state(sdhst->pinctrl, "default");

-- 
2.53.0

