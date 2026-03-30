Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1488E3AE6FE
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859909; cv=none; b=pFTQi1mWF4zScWuNCf1TJGh/wj7y623YMOJHpbhAqbKBMTAJSr0t9R+ixWDY47vlzkNQ8GIvDeWJcdjmUkSIPIeOst1oCoeEMUk3dS9SM7DJhzxhpUQiX72b/F70hEekk9oNGVMifsm0TMQwZhJ/A3k1rzEXU8ufI3gFGbg0VLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859909; c=relaxed/simple;
	bh=qUA8SRWMHXak4DMGjiU5xSTobYDglxv6lNBrFgz1elQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUMm6JpBgTVYKmGkbIUXcm6JyStlENbuYPxFjL0PUw+E5o4/jHO7R3ndJl39z5ImyGmn62r/A80cy+DRNGynUEvWSIIdVLr4rRg1saOAA21l1K5/lTEuuYQnRO0P7V29fHl0Dfu/FQ5Ho6GNkv34FNfIaHLqG9vb1PmKpU16hFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOvhnS7p; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOvhnS7p"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so55854925e9.1
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859906; x=1775464706; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=AOvhnS7pIZ1vXWwd218OFddzpcrlCpDCpLiW6fLpWqFm1Vka6L8HP/JOpP8ewxTyuk
         For7DUCX/PddK4JMKUERBIAbboOd7Ng7G7SxigEKDOBPDAmQwOJq8omCbodlfCsaREAS
         R5wrtROJSSxsyHClY1Fxr4xnRclsVjmiAMBpbgY6O4C80hK9iXM1AKADlhxVAmxsAmYH
         DQijfMCjWonoa6w3lnSN3UeP8v4yJNSQEtwj6v7+w4yx9gpr7GjHS2CDlqRC1JPeG9FE
         ka0LyRm3+5Xr7UGUoBP5z2mEM79z/wEynw6AKihyjogaJtzDOcpBP7Vk+QcYIpdWVmva
         Fbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859906; x=1775464706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=cQ7dPRiTemV/pqTufjUKrCFJhi8e8igHnlVFuI0LY2RTMkI42vwbIA8Q/hxH23sJvx
         Vg1OvWu2dby4qj2aFkXk9nUw3wijNVHsOM6twE16m57oQTvDjVhtsy9tn4HBnddXah2C
         LuvlaFnmT87FsTUq5Ku5xoXXgH2egophbRQJXey9MqzqgbHFnofT5iXCHVzLVqhcWAU7
         bEvrW8dWIt9PxGxZFMEk1Kra9u3BmKbbmi1noAgtl1Par/KLL6LIJqdgW4+tnef8tg6T
         nhlMR8XFPdoumfjMfkN2WUMt3ZKMDAO5aHG/S0TALODE6Zgp1guJDIojFvaJafwomd7X
         65Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVvyoHvRdimMbGvgdqnFjHFW8I153JjX+Qc0jmjWokcC5SX33ngDdPMOX7n2lYXOv5oubY6Q7pm+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXKGADyKimFxnzaOKGoEyIidT38l46hfl1aUwVRV3LJzDPMl/k
	T4LDWetm3N5MRDhFm8bKba8DgGihSS7MLKx49aAPitVOAy6yeuYgn0iC
X-Gm-Gg: ATEYQzwU9a2CDjjgeAOVp+NdFFBLlNj23eDYeFfA2njSGNJ0UvWjFJy5n+9WREJrQeX
	mrdlxwZ9Zxcf5VLfpy6lrcotHy43e+FB/IMLXwcmGvnAYSeNplvLafqtLhzq3ORZndojB5hEuSF
	2N2SE0y2kS5zKAhertUuSPnF/5Nxrlr8akA1F/BPgtZIrEYFU5o31+TUSmy98lDcDqPG26ex4TM
	iXtFoQsda3LanFN1SIfkM8ERLvnJvixTiVXXs+jD+DZexBgy/39mFEeLx+sQW+kZFMnOXEAlUVB
	DiEkDV7hCMycu8CaBBKP00jp2FE3tes3fnrJ0tAveF7Ip1REnHEQZ1OaSolxxzXZlJUGO5Vbs0r
	PDqxNnTZ1jZd0eZLw/m2KHiTDOg+bS2nBsqbDYW9gp9ONaOIogKg7QKzFJuhOu7gRh0oPpqKyK+
	PFCj+XfG9y1X3qd7tWoRTpj4Q6XU9BvNCOGc5ooMKNpF7G3KDYtOqlevJwSqkoUUJRfJ6SdAAha
	L8=
X-Received: by 2002:a05:600c:1d0e:b0:485:a4de:f4f9 with SMTP id 5b1f17b1804b1-48727ee54bcmr204093705e9.27.1774859906374;
        Mon, 30 Mar 2026 01:38:26 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:25 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:03 +0200
Subject: [PATCH v5 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-2-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

The SDHC_GEN_PAD_CLK_ON setting in LEGACY_CTRL_REG is safe for both SD
and eMMC operation as both protocols use the same physical MMC interface
pins and require proper clock signal generation at the hardware level
for signal integrity and timing.

Additional SD-specific clock overrides (SDHC_OVRRD_CLK_OEN and
SDHC_FORCE_CLK_ON) are conditionally applied only for SD-only
controllers to handle removable card scenarios.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842df90c7a94a290aeec22157b378fc1..0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -21,6 +21,13 @@
 #include "sdhci.h"
 #include "sdhci-pltfm.h"
 
+#define SPACEMIT_SDHC_OP_EXT_REG	0x108
+#define  SDHC_OVRRD_CLK_OEN		BIT(11)
+#define  SDHC_FORCE_CLK_ON		BIT(12)
+
+#define SPACEMIT_SDHC_LEGACY_CTRL_REG	0x10C
+#define  SDHC_GEN_PAD_CLK_ON		BIT(6)
+
 #define SPACEMIT_SDHC_MMC_CTRL_REG	0x114
 #define  SDHC_MISC_INT_EN		BIT(1)
 #define  SDHC_MISC_INT			BIT(2)
@@ -101,6 +108,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+
+	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
+		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+				       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0

