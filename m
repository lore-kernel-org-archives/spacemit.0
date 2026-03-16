Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D91639B963
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669868; cv=none; b=XGV9n8lnvOpi9cZloyyheu6qDnjWSGY5TneyI5KxwnL32xlJlItq5ZDPGfYcvsNTh0iKvOCmtf8FTJ3orBrn1L9I+7fM7dP0SrveU/VrDjd/E5K3pTg3LJQ7xk/BMYq0qtf5+lqAe9xfc1nKnaH+yprlN/Zx5+MmXumOfSEXZgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669868; c=relaxed/simple;
	bh=vmF2pgWK2VUkaN/torpDV5fO5DqEsvTqOvhELAztUNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8gdr3ul7UjKokaf4huKJckNeXPnGf5qhrSQyvFdyyWOH5Aro1+yAp6UnDUC91bi7h/sVRn+Q6BigJRO2wQzfSdu4pRJa4G/iLYSd7fvu2MwbMm5niIJDeHG96VAXRwatx1UlpPMS+J51bdhcaAMmwnZ7tFL7/kUcD30ozHxZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV4jmI+4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV4jmI+4"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b2965d4bso3207960f8f.2
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669865; x=1774274665; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O74WQNc1aV3W+cT5lrJjmSbPvv2lawW0j0OjNB+99fg=;
        b=eV4jmI+4MUdAzo5+1l+NNWYXL8u53geAdbxPZCjLDr5hVyajSM31t3j7mshvk/epB9
         xvZlW+NOllcnNf/5xyFz5TzYmfKWqVbvG9YPuePOjvfq3SMbTammrKdjlakStW2xZfEK
         Lg7rUhGMj/XLBOrOeF1YVmSbhz9Ex6PleBazNsf72X3t+cwiMeFASxffBFwphDXxjWxA
         AFYLsItTMoXleZ0wVm7DddYV05T6WWwqdoe/siKVJBxIHnvBYyoQ8EedgTfRaexc8Ddd
         paoJdojEloEAQEfSkBxApqDlEi4R+0TnSxj5K/bU2R8/ThIyCwgv+PkfHi5TRKVvbsKr
         Nd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669865; x=1774274665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O74WQNc1aV3W+cT5lrJjmSbPvv2lawW0j0OjNB+99fg=;
        b=PiQOaK5u3QOxtGwhBmKNQnoUWLUidrv05/P3tG7tG/p6IsQEFQsalI25S6L2+/YG3Y
         n2HVUX2d/wpWvFSKuNPlB0hrIOu2idKb5MnaLNP6tKM6+s+bKl4oJg6NfCMY813ozhxK
         PqXgrucxroZ8RbjXXceFsZY2rtUgDZqTuBzK1tOlaBV2dibaykiGQAPmVoR6mfatqvss
         fkPE3BsvKStzsc/GfM6vQ6wruQOeJhDRbTnmwxket06cruutidLTchQ5Sh3oRab6TQEN
         6tmRvahluRcKe/kA8ANuRVL8vIJsdDnGnq9pBzcoD4oyP1k+jKJm31Muw0qvsLYaR2DD
         bGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZMn8B6elQnotTsBj7oEdWmbiFz4o68kdMdychSrKyHhWIvNflaKb1VX+nFjAjhUU8CfI4kQPrfg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmcq+ImsqrrKMEmnHWQqPCaq1ASoe1gRdbfL2xFbBlM2JbDY4x
	hdc70AEWeNUU3rldRkawwXfuRsk+YAJgqpnYMznzAST5d7/Ep/xCc+ru
X-Gm-Gg: ATEYQzz6HZ/KYkyFqfs8rnuqDLL67qXWF+B57JldyBdTf2RjGZwdgM2zHg16nnQMVJj
	Ovpfyee9ZFEAejcjRiTwwjY+yCof7Dm2+Kr9iP6jgzV1YamRN6EcBCKXKVg6nndYecrnvIYjbbo
	I0zV7NG1+Ox7YRQ23z90lAFDYTNScrG5iX4mEySG6w8m3h2nA2ZYyFjr3mpu6eDGbV+BzGsu9uC
	gIXPkrC/Vk4ykyIrPPdlGRI1Jbk8Qo1dIW0v9btMhEXJPHOGwQrz8sIik1u6j51oO/iFvXlNuyl
	AR2xu8XC8Ytr5ekqie/H8Xf/hGWChme4uJl94WaSBQo56Pm+/oaR0B/XPvLeT0L8Fo8aFtdMihq
	9C7eeMd3q4vKb55bFWN3I9j2BHy5QtWdrpAJ072U5FDHS44cUAKbWgNUfwsoeuhAaiUL8PluTmA
	z3wI+WU87N63Yefy+sItxLfZhh8cFet5eIbmb3W0ttxrOgHQaw5v1CI5tT+bzTgXKN
X-Received: by 2002:a05:600c:698e:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-485566ca5cdmr217587185e9.6.1773669865177;
        Mon, 16 Mar 2026 07:04:25 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:29 +0100
Subject: [PATCH v3 1/7] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-orangepi-sd-card-uhs-v3-1-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
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

