Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127E63A3E7A
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 08:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067363; cv=none; b=gOHxceDG63BNnccm/MVfkEy0RqY9R2i5SGWPjGzy5yAi1VO3Hf6op+fCvLrfOOR6gc0C6zta6b3JCdvA7wxGRMXzcKQZI+U1o0wUJskFMrRk9UnUhXSk7x6MBLo2Yn/tHtcgWHgUn4KyPhw9hPsUzSqTZCHFIxVEuhWut9pEijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067363; c=relaxed/simple;
	bh=BQj/LtLtvJAa8qPvNururbfdiFEeQmxim48bMkau+Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPkL+8rF5QiKWX2BOI1Hp8u8gra7EYvQhyZVcL9gu2Hame8tvsnCLWJuQBQBCv20kXcllWP5AfK512blJQ6enACTtdUG3NBYHUKHcJVZ9nkRQm/kNT0s4Hu1CFd5BzB3/LVxv2Szi1o5QsjnB2AcVpQ/p5ghOi2eDp7EJ6cJwzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMwmmtEW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMwmmtEW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso3983033f8f.0
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067359; x=1776672159; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=lMwmmtEW6v71Pc2p0UMPzlUuy/IgvWo80msF7x5arwpay63upbxdZSLgl5cY3IfZaa
         be/DxzAVayCvIL8TQX+rBWiefJQv+rK79TUEgRsNZ2Ckt+LkGB5zNc82PKvsDcuBDTom
         SVuDiwTp4IkTPrKi9bP6pE07T1O4kIL72L9MhaIfUcsKkasLOf8LXCwxu1EbXcySHaLW
         ful/pJqNy02RxFlGSUMC7FbhKrEVHrxIUqRkhCR1U3br0rFwsfuvcd40Qc/Jj5Sc9DIt
         HTZqZaPPfj7z84CY5lC2/ePWyPuOU/jWUW8tVJLjsa6+zK+bUi+s1qWGQsFDyT/pMc0l
         nHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067359; x=1776672159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=AEMGv3lJhTO9X3XoFhhGo7YTC/OaCFMMGN5/a7n4nAlelqy1VP9gHhxJMiD+25hGZh
         Odya8FfZ6IT6HFp058skmllhNrcdwuqh6EzO+bhmYmdyYdO2ULjMjB62SyTYiC87jyYh
         ZQdoqH6DjXQ57X2Z4GQCrTk7nh1GRknkzIjfeCU6TOGapcwJIXmhp3YRKbnJjf7g1uY/
         6Xe8Slk6eHffdcGQ3QTDRxffcbFhL2kW1jYmgGt8L0mjmaR6KDNiQMGceaSfKvaQdzKd
         0xStkBZfE398efrMRnweYxwRcvdseG8vT60CzLfzs0IL+8FaKY0pHYJVlwNT90vt5Cfk
         vxxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hDv1U4AP1VTCLcbORnLERNKrIxIOppwyIhr7SO2+uCAlRDRPoGFuyRPrSwfYAU93Vdkw+sJ5qjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNaM+DyKJFaE/SnlnmA6m0UnHIfB+wEzuVCGIyJSgl1gDgWfiV
	OD3QHXdn3kJFFZN1QzN8DScNT+jWNdNh5r9DWsm5i6DuYyVcLfCo19Nn
X-Gm-Gg: AeBDieve8P5SVGsGLr4HO8g7jPrs9VbX6vKGYf/vMJjZaNUZfPmwUx4p5IpEdh5Sxxo
	BxUrZt8UKOuAEX2w4Uzhe9FUsYoSWDk70gdFxlmZ4jgqvkLoJjwrlzUZOeTheoJ+SR+yx3DElzO
	Va2PyJdrAGegj2EiGAZ0OU2IqOaLwhjmhp75CDQ10+qwam5wf6SteTSSSD6y+XzYFSAQVdpew2N
	gdleS9rSn/z5JAPtN6SZCf82t5kCrNLXFE/Lc/MVcSngE0k/zG8rD+79EUwhqx1LBMH3QsYXJGr
	vPcvhv3v+hDPGiVc+HvQ5JY48FWT8sZRpO0LTu8uG/LeWDffUKWXzIvYdmZ6tiUuAciDSDj8mIM
	Et/4N0CBAB5RllvB0xVhomqsUJkmGP6wgagqWZrHHYTY7c3B6cWXW+mBr5+YzoWLyvsI+2dIlqc
	TB1CWdZeQ9JmQHC0wqitpIdCfvGV26qeqLlXW0s0yI/FJBKd3SEXeyVpWd5MfkjiO5vOjXgq078
	MI=
X-Received: by 2002:a5d:584b:0:b0:43d:7783:c677 with SMTP id ffacd0b85a97d-43d7783c827mr5141524f8f.42.1776067357834;
        Mon, 13 Apr 2026 01:02:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:36 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:11 +0200
Subject: [PATCH v8 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-2-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

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
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842d..0dd06fc19b85 100644
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

