Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A2A392C4C
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065143; cv=none; b=piT66vwVtViYxJjfVGCDurft/j7onl6AXYuRMF7dcBzgQacumCp3xwb2f2eTWwSD0UB++8YO0yteQpp+iAM1Tv41/JilzaGCN23jHn84TVQuAi1tXHyQf7houlTpU21OtL+M+cfFnfG95CQOLR14vn5weM9XZJOey+/ZB2MzCm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065143; c=relaxed/simple;
	bh=BQj/LtLtvJAa8qPvNururbfdiFEeQmxim48bMkau+Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYhxvxIWSC+ZgWDQy6E2h8JSGfZOxxZF3qjtEsqedG5op77rchpeJEqokdM+QwM/LZ4X1/F5zURC8T/G4838NZOn3p60B42a7CXh7nsI5dmdHKd6GBv7WC4ZQRnnyLO15859Lor7cpX81Tep3om8CcfQLDJs6tZg+pB/S/MN6Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhAM5g3N; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhAM5g3N"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso49941345e9.1
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065140; x=1776669940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=EhAM5g3N2bOMRvDDX4UTNc6D/nu5BkVUYmFkBE4g98a0Z3YcbDsY0QoeMEJAGXqXk3
         lmhRS+qwCD6P1qyiBcfdjqZw22NLIdD/FYSx5Kyz335LyeVF0HgBWLJVFotFoxY384V9
         JmCPG7W2ELgxhUTxnBfxBHjLYSp6MHanGr+BlW8sEfbZu+qOgT3Ufdp38MlFksyc9c0n
         dHaT3/25MkjDC6Wmgk89kpo7uuuNAsVITJNDi6//7jbrO1Bl+p3cZT/4O/1ssKKzPgpP
         hSUsbei3R+v92gFH/VKodK26Osf0LMpKFbabZ7rLY7M/jlgTnV2F82WbYQwQUbq2B6m1
         D0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065140; x=1776669940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=NeIxAppCx6iFyq6gMw/K3jFWl/D8IZpzkSSEtjlmvJ7NqlswFoGjquHIS0CpHLyNkN
         WFZpn0bsJqAmmtBaerDZQZt79edGAyVzhyBusJLMRmO7Ke4ABKT3mtXEg57dg3wNurm/
         8dsI34Afb+nYepFDWJ8abCsy2bmbiMwhgangwbjH1hLGhzyPzjd+vpod94V9vh2OHPlV
         U8CuGFrZ2foZMpvUkl7aBigQNG5HInsAFaWTxQ3Sq3qVz8JobKClKRZFesM+kyqc9Cwk
         eC1tT8+3fmyYa8xfAtiFaiC++sbf0mU3/lEhwlxtDee4yy4m0vYgfazM2O6eLyY3hE+f
         b8kw==
X-Forwarded-Encrypted: i=1; AFNElJ+lNewhfixq6E1rarnyaC0Gn4tS7j/DFzhnXbCg8McT4jKHW3Fzlb7V49fMYXBw4scnPOQ140MDaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb+0KOB3BTfOKW2SzmMSqJQecQqLumFVHVlgn6g7bXosBVrspN
	IVt73xn+6Ouis2Dp+ySlOuUlJk8r1PG42UoJ268wYxvFv3z4+fVUy0Mf
X-Gm-Gg: AeBDiet13PGdEAu5v0LRCrzjHbe7oOCvemKl2I+/ozTr9CiX34KTzpDCDtNoQweWqfC
	8zzG22WNm82PwWR326dM4GgPl6yE4EY7hDMx0A4uIgt+xe16w5WRJG7FvJmphFMhG7U6V0x4crF
	+bvrmGpH9y4qqcr0ThLfEO0E6/7tgGrJd//2SS7gAcHsHM/0Tvd0tj3GUbBzwYao6A7m7Hqps9c
	qhqsCw8M/Y+PRDXjk93nAbuUm44+9Azw6ci4+27+ttEu9ZfvtbL70sPegIJcqTAnK24sUcax793
	hoizA8PKWmKcoHQBowGovEZk36QtmhX01J/huUUvww+hRFTdIa6f+13kb2nyV4yEvOQz7WicdTB
	GLLKrfJzQrmrLJuKeHcx4JhvIBzqTi4WrKluOpwoxsVv324UKNyBhNJxzJVXu8lXeG0hNfEn1+t
	8xthKh7Bh2KwNOEH35dzpjx9n6VTWBV9hop6ohGPWFSbjcRr+UjQmHux6D+iEwuw7a
X-Received: by 2002:a05:600c:8b30:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-488d6657928mr167657735e9.0.1776065139301;
        Mon, 13 Apr 2026 00:25:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd10b1dbsm220827305e9.2.2026.04.13.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:25:38 -0700 (PDT)
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
Subject: [PATCH v7 2/9] mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
Date: Mon, 13 Apr 2026 09:24:44 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-2-16650f49c022@gmail.com>
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

