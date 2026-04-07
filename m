Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8723A542E
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550367; cv=none; b=j+AwMHI7fg5yFbMDgl8RTUrFZcrsJR0HCb+TRAmMSr/VcKj7eQ/2eCfYirxxigkZNYQy+c9QMopwwIEPvX8gTY5FIiOh9m255DCvMc+49MJJi5wMvKuPnBlEZSkRR+UfMVSe+Bd7/fmgJxXHJjAJ2kz/1xs24W1BsmlV+DZfax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550367; c=relaxed/simple;
	bh=pYJvYi3wGayZHU9DE3xysB2ygNEcNECfzw4JJTA9oS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvIeMHX2jAQ63EB9hpni+eg6YJSTpJvVKQh2emnnxtyvh0+zozL8/RgHF0Z/CGfKHn2N/bjLdnVcxgK9Nd63daAfPZkCOU7ikUgmju41F5vcs90pUCOfCChRb+QR6qJDUzpHIPFVLmABEOBNc47N4n/XuoymtMTfe/N2j4srAa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEkqOJ8N; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEkqOJ8N"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b87970468so3702660f8f.3
        for <spacemit@lists.linux.dev>; Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550364; x=1776155164; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peA/baapFwTx+WaActDGaVNbab5ZZYgiEvN0ikh1DXM=;
        b=fEkqOJ8NnsrJ0bkYbernNnqub0g6gMnCHo+Y8y3RLXFIkLVwjnGnVTZbrbVHsFUuta
         5YimdR7av+8ss7JxqSR6w7VIi/UOBF2lfCtoFdaRLR0HJgoA84d5ME0L1wt0G5QqwdH5
         71/6RJ6hc5cZZS42ZMjiuBpZthr2D6NY/Mjy/DDJ2wthQ1Fds0Hxe1yiuPBxtH/PFKHu
         Lp2CZwvyypIa7hgGuFAUszTTYYz3kbJlc7+WaJXwczUwzTt/NZCQjo4+859bg8XG9N4J
         4AIkfN5rq+9kHJ8Hw48p8xAwPNSQH6buQCZkCW25e+yylD1O740icvMIS0vwEUeFTQGf
         pMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550364; x=1776155164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=peA/baapFwTx+WaActDGaVNbab5ZZYgiEvN0ikh1DXM=;
        b=MNNxTevTOHtTl1AhM4SjorVbGGKeBqeFzJmUAkwACm9/gNg88gHsH1ZLYAh8yVO4Nl
         ZcYaUhZ7D4KBF39gSTZ2zMKgZO8dtBlrdtnJblIuHjQw9hZa/tdVGFLKh7UcasHlpHO1
         0G72zpUIK/PyT6X3r2wU1aQVSeif0gAwNJ+d0S+2T5pRskv26Wgs+anPwKNANxZtwufg
         i/AIXFrcZFDlWlVLORyVD7xCPL7XpvYIMw/Vi6dCNAvTfN7Unyv9EQMiNeIy8OD7fZtM
         dsOY+ih5dsjFouYxZhTvcjGIdTIrhPtHZ34wAQ7xZdtvl+7JXib6JiC5+wpJWPSqX44L
         hoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvLSi2BUy4g9XMHSxsZjvwYvWKplmHtHLqyG9FvByxnkr1j2Mt0uVDOnd2lKNCKjSjM+3BnqpGWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAyPaaROG90cFgK2snVi1nG2bTLd0M5ZumNoFAW0oF9sSV41rN
	QHsRElO6tlyvsyR05o7CbkUmdlnMNFDBEQJQ177yIacO0bwt8LdP8hbK
X-Gm-Gg: AeBDiesi7niQ5lkEtbJaQ7Zmv6o9McfPv8x6+I2EiefIoIq3uCTxHDE3fZvgEQAfhtO
	YG5o9f+IVDrB/fyH12TQvr5IHwu+6uGzG03bQK2OKD0a5MY7L76/6kcxbaRcgsmftdggrArgFcU
	lJOFq7YFYNAkN/5uRdKCNUYUKK6Q7EVUO2rWiI/jAD6nTPBYkhSpms9DyaLRHiqZcyht9IC0M24
	7n/CWy1Is+rIlbKB8tCdYEsJ8qgQ/IIrpvSiK9wlgMiXLRgU809D4FYaWrC5x8c0LBlnYIuV4g3
	KoPG1gJTpJhHHnbwzqBgx4EWCZaor+JlEq/owllq6nylMKnLlxyCtdHEwNcUcRZ56lyg6EYfSw0
	c/gtzcafHePYp1HzFp1ldhCgFa0FJ30GihH2Aw0Znl1TX+zEpFYUwUePozAhYFuegUrunlTXTpG
	huN7cgnLN7E2RLvT6bvr3qdeA1Kn4XEtOOBkV7FcNoBy3KAGAUPy+4wXHLgD5/uy/a
X-Received: by 2002:a05:6000:1446:b0:439:dfae:8083 with SMTP id ffacd0b85a97d-43d292dbc56mr23436623f8f.38.1775550363826;
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:22 +0200
Subject: [PATCH v6 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-2-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
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
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
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

