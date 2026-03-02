Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A507B40FDA9
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464435; cv=none; b=jt9HJXf+ThFPZB+S6u9VH4QkqdVndy8lAZeZBHRCLxT5a4fhmEtfFeuioZ5O5re4JcGCxyllk5/MEOIeQUowYXQ87e9UteDtcFRbIOxjkmHlcHJV5hq4Ew4Bzs3hsT+f3a7n4ArMXWU2zL7zVekxlwNqJ763auXu3FZjNeoNSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464435; c=relaxed/simple;
	bh=d7a13S6dF61g9+cfR4EleR8xvtk9XXvgHgcgm1c6KYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JV+sbTVJEOrFbGpC6f1R8+uQc2OeQ19Y0tyKTAowwZB1jun9QeGRgpjulDYa1ganxl4j571Ng6/GecpEkkcdzSNAM23UpJnAj1mPT0kU1BDYEehwCEOsfkc/Vsz4PHMb1YrIx9+Uh5xCUR8kZCfE4zZ7+K6lKE83yWR2wz74TKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ase757lp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ase757lp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48372efa020so39364695e9.2
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464432; x=1773069232; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjMmH3TKAZLFeVk2hH9QgAPKoSKsH6HVvsl5OwBldO4=;
        b=Ase757lpS5Azw/pjWdK777wrUK861iUyL+RdGBbszwEWt5W3V1LUAqN8f+6Z2N3Gww
         HJDGd3R2fJjormv3TBetzGi9Me8ig2KOW1yaGn4ZlvyfpipeS/qvAr/oVuOKAIfB3OcE
         r8VuOCBIWSrpgb7GF70xFF3dPgEzEweAoa0d1D/Mj6Z1x0KECcOEEZ1D6G+0a20DNBPw
         TZJS2TVjLdXx5zsUeCp/0elRrLgX7DNJZZTp/65M2n+t31L71RbVOR9X1Xk+iaQSBnhc
         UsvfMC0MVoYlrysE9ZQOULA3cfpojbf2UKBpdtPdGyp9IwQVuLlVhsrAA90hDEtYSGv3
         R6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464432; x=1773069232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SjMmH3TKAZLFeVk2hH9QgAPKoSKsH6HVvsl5OwBldO4=;
        b=vio+7LIVkMdkJEuh818ljiRejwi58kptAsT+9fYdYtC4fcUI8bk8BL9GS8cVgLH9ch
         yilNF+5QUSIa0r2RTWY4Ls+OM1rRiXzw0QQcdZi1h8bDildgeqfjHs85Cv67qUNkMx70
         74puX1DzwCGxJemMtRo8awH94eycIZJQ24L5AfwF7PwJshnkTv+Dnay/h3dF1lYCuHSW
         fm8WW2sS9Y2Xv9S4K5nJOIgQXqsMuyTag2orF3WiskLyCEPJ8WKGjx5Z46jfbGU4liBi
         7d3iuppMIomwt0TUmvHLMFLod52IeBcBeU+hxcpi/+cORZQGlMoOeg9JFQQnDgiU3Ct9
         YQFw==
X-Forwarded-Encrypted: i=1; AJvYcCUrR2KABcXBczh0o8xNMAAAB4H1j5Vb2RH3/5KMPWqwgsJfTaMPADrLAtkl132++k2sHHNJRkPoTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTeAiiE3WUcF4bkoT5dBI49nG+3H8i/LLPYT8XJVsGpcqHKg4+
	zn3N5e7ZHKfF0pqfc4zXwKR2Dka3EtTfueZs3PeTKeFZ+1sj/cKtqcL/
X-Gm-Gg: ATEYQzyv8huvT325x0cVfdaPJBIPF1QW7joFg4FxWD1lAXM2EnoT4Qd0SsrNqrSfcTp
	7kwd64rFqrNENkfMxFZY/80LDxpe3dj3v7K5BSR6OuGz0xtFPkUWcdM79MyecxBawooR2sNZTxS
	kjyLCt83gM8Cw+71INKt6B68zosZeczA+L2SViLmiyXK2xA7t4g/65X9r8KXbDKz396ZVD1pAaR
	TtXRV7YU2oAtu+HEsbcsP/RNvYo8ppA1pwXlB2KJ6x5Qf/00D9L2Zk+OmiHxrhx/rb4dy6KeLjw
	HJc4y1nLQaRXE8wwMWZ42ve2/SLTxjtj2Xvp/7JVKs5VvTaBqrnNO/ym1KhLDN7OJCgk7boTbbL
	4luqC5ir5Hwcb9aEAX3NX2fmscnshE+O0TX5jBbZEQ6nGIavlJLhXYRKvW3xXFKcOKkCWiPQs5o
	A/hUh1DegXCp1Nd58nEzKjr9HLspLgN3MY2VwDJgvPcWi5KDW/xgVOV6z9bz51wI1HXrAdeeMx8
	/fh
X-Received: by 2002:a05:600c:3e86:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-483c9c1bc0bmr208716755e9.30.1772464431872;
        Mon, 02 Mar 2026 07:13:51 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:51 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:23 +0100
Subject: [PATCH 02/10] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-2-89c219973c0c@gmail.com>
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

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0cc97e23a2f9c7b2f9376318a8a7ebb860571504..b703b78282ed8d89183c816477c149c0a565618a 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -20,6 +20,13 @@
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
@@ -100,6 +107,10 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+	spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+			       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0

