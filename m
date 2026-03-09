Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAE03A4F50
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056433; cv=none; b=RDyVzoA0tFB6KZlOCO0F+yMPQYNOq5XuN1nAScUZf1JgGHIK6EYQFhfSkTvHvFw9PAyYNPEcCZqM2Gg7GpnmKcaNbgfF8asfA3ZzfiukNfmqj1PICkofNcBNFRBIAffYGnQTApgTwo+bxGAAGMS8QEepppcq6yQKwHVjLBHS0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056433; c=relaxed/simple;
	bh=ZjPfOEay4iJtYw/Yc+++kB4+JFWKKrhSslqGPOY6h3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EM22Yjy/V5BmRvD5gXASpzzxNR45PbBEwJeti36M4jB4huftvcvMr7+u3Uhf0guDL4/YyF6siQIu/ecPkQR97CMTNXsYfYptF6JzWo42rkNZSP+04hB2+Gigft0h0XSlFDqc13HBnQ8NNbQFMI9GnVHAxkEHxoEp0S5jsnJ3048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQk/vEoR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQk/vEoR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439af7d77f0so7361420f8f.0
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 04:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056429; x=1773661229; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENoXAlYlr/CKB5p2K9cJMvCPGqe7WoN4P4jGKMHaZJw=;
        b=AQk/vEoRAG2/9pthmypffkdz0qPJp1OV/OxruVA9hxSScw4OEAmLp+ku4x2Wmiy18q
         gzRDaAv/nq0wlL+/7kfHmRKQqUGcKw6JgccJpdKTm+MbTHpVLSHpWL2dgU/E9WrM795r
         uTykFCo4+ZYw2gg3k4HKVqkGcNWnuhFW9+0zfCciV+7oBo1NQKg9G1FkKglFPAp7p1WT
         bE+HDh6EkhgfkNIQ54cWSbtWuGynpMmbSeZ+FHQwGbENJYHyTxzM5f1EEbGruNFirw8g
         llvAOPR8euxzuHL16th45tPZk88fgjty9Tvqy18iTX1b5o0lOKQqVT1j/3orY/+U0iJO
         lrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056429; x=1773661229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ENoXAlYlr/CKB5p2K9cJMvCPGqe7WoN4P4jGKMHaZJw=;
        b=TpA77GBTtEEy14YAGTXhx4lY0HifUfsK1yk0Xh4rNPgoqQ0ds81IIERvuVfhY3WGsl
         rfX7rASj64zFmdWAExhdcEPOhOZE/ZnZFvrAGBmsXaY7feEpKgg2q6xBpcwmrx2jlFwT
         XLLPhmJoLl6gItIrDyFthF7AvWuGKQuVgmATCLPMGuDOpOmp3usvrg+vLnRWL3XfzKFu
         JSH9FY4W8NNR6vwrZ3sbXc+fBlHkWrdJ+9qEG1oBmLKyiCPAj98jzlVtSXpA8RmIPtxG
         w8Rmyzhm37zlY28wfiAw2DXzMm8ZSZ2HTsO1GM1m/fUuFikvlbjBFc9C6XH5lNP77ujk
         6f3w==
X-Forwarded-Encrypted: i=1; AJvYcCXZHGe1mvyIwXai460udYo9H0+hcPL0fbNg3aWOSrSdK0G+TJKTl7ciT1R0kx412scrdK/NLH7lww==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywof4vr5AvohCW1Stib8PbFESj2OKco9H2TGHZdVm19ANuctSRC
	Mm1xME3AIX4ecMCJ0v+5pDiQy5yKV+whS3TA6Jgyqua1bD3Gi4W7YY+Z
X-Gm-Gg: ATEYQzyNW1l+mBhM+S63ZOmXdRf/MkmpTMZettXWGYAoUMfXVy3PYt96oXCUrlrZUfg
	OHiNMboAWifQSL0x6ow5U8iIAP+ma83RYr3lDTowtuzCG02dyJ/0JCkiQRk0Z0/BJtPbUZh/VMy
	z4umtaN66BPha48a+0zd6/sqZGvuePZLoFZU4pKmVlFh6ay/O+pnjsve+8amQv4Sj24xJFYBxaD
	pY1B8zR3ZGr3i7HcQCzAhldHNKjyzpF8NUi7GtXJJhJYt+CfkimW21HmWazKc8h9pjdPPeOHw6V
	jFT7sPLz8DKoiIA5z+PnMRo5kGKQWtGN2ksQeDgjkTDJM7oBJvCOGcMe1WzwzVa3fFR13MyyUsF
	GmvLCr8f0Re/im9teTk2wnz8OLTgTOgAdup1sru2+LRTJmA7ePNfm17MKeuGnDUtoxGjBCC3HW7
	knJ1gOWcrreGISNTb1Qq0lPATR+3r7W/2D8yvfAKg1/y0OTX5l72ez3jEhVWTXq8Tb
X-Received: by 2002:a05:6000:49:b0:439:be67:a02d with SMTP id ffacd0b85a97d-439da67c0c9mr15289084f8f.31.1773056429202;
        Mon, 09 Mar 2026 04:40:29 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:28 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:11 +0100
Subject: [PATCH v2 1/7] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-orangepi-sd-card-uhs-v2-1-5bb2b574df5d@gmail.com>
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

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0cc97e23a2f9c7b2f9376318a8a7ebb860571504..585c7eca6ebf253aac466dd37cef029deb63f692 100644
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
@@ -100,6 +107,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
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

