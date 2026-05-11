Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B03C554B
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489674; cv=none; b=WLTqTw15RWhgbNG4v1d4+dm+mInbndZ3UsZreTDPDpz08XRj+I4UsReUvPcIVZGI23d5y7o5OfF9uBkcNkXEjq9LrCu7E2s+gQ+QXYzclNnrrCZj/5oYWFavZ6W75Odlnha8lwc1zCV/8wVQpDPF+bolYpdVydbXdvqJWYLq/h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489674; c=relaxed/simple;
	bh=FZsgT/q6hf1B/ykkCHeWphCL5sPAC4d/euFpIhy8yzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5QByEHr+ek6SrZ5//u9qtbOGAedQ4SofulePtmNhMgBBXMeC9blwipRx9KnC8yrLZN0kBEP/nmOpzeGvAaNFyxUFc/vOr0hgYZFxrgDfZIYJG9ly8n0sOihf/sbO582xe2SyWPeKqeHMNCp1hjI73ADBOARtCXtccbA4tX87U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpnjzlY7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpnjzlY7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-441209fb77eso2377172f8f.1
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489670; x=1779094470; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGycZZ0oxVCkeN0xv1IJG1TkG4N0VwOrQ4cI2sdWgss=;
        b=ZpnjzlY7rC9EelgyQJ/pP2f89IzkDVDH/cgPo/RtrJuD1zpzuB/QBIlye61hiRc8Hc
         qHCpEMd4Osqo0b69ioXaal5qTuIZlysxZAq6PSJZBf9DXKLkwrT6JSqD0Irf3vXoe6Yk
         R3g8sXmgMEP6iWBtmIgv/phg2T032yYTvUEH61zmxjw8VJuCnJQitcuOyKAluX7gDYlv
         9GbWo9WPo1RRq/MebZMfmbjtqkLCNOQu621UbA/zuBGLIlReTE3b9bjhdfUy3deccsqr
         Xn4GgBpvyAFRml9gGg9HTGdqu2JJaVqPyIkjcUn0UGTsHE3tNRDrBfJAzWYJLKgi0KYW
         zHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489670; x=1779094470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rGycZZ0oxVCkeN0xv1IJG1TkG4N0VwOrQ4cI2sdWgss=;
        b=GDU7V754tY//FhAugeLOK+eYuuqkZP8yRTGmVEasWgkP60s3leA+ZKMLXj1zq4kGmO
         XVvyjFgl4N5TlrdekOguOBtBSPcEYk+YYPVNQZQIPzJa2+/3SZMDL4GvXyKsPFX8ipbM
         rPZrwM9T+nxQ8sTYaGk8xSa3WpJTzw+Thj42DUptraRQCu3QQwKOrUyzHyPy7W1o+tVj
         wQdtlPJzWVzIV4hMo4EKpWzK71elocd7Z+JMKbYicfqP2nLjfW/dz5CrUIOq7uW9iS82
         64+B++rXhampNRfnulNFxozd+KW3TUBMt0z+SAfya8iYs1uqhFBxwqHa42x4Y4ysPN8N
         u/UA==
X-Forwarded-Encrypted: i=1; AFNElJ/BxD7lZDd4r+LUJBOD9hQj2WKShJA2AvXmYFymZ1fMTqE1gyQ+4SIAvW7OA7SO9Rlipf95y0FM3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNxkE28iyUal4VRVKhAOoHUCreJVV8aw8ptiEYcgD7tcHj3Aim
	wxdOTz0SZodKY3LNoxF8rMY9EtIGVyyFCcAg1eIyVKMVqbYjjdoBJh9KuSMjEA==
X-Gm-Gg: Acq92OFY24i39kmnHKfeTchiaIGG940cCXT++PeqUXefBoMlJmZjB16bcG1mkqbArFG
	Dwz0/KYnbhZ+PIFiueLjnvs/LsF056AGkeZ4ShtyxNLjJO04SQ9wxLV2EVLs7OhkNp8/MPAwcC4
	L6PmzsNATqBjJ2YbJS0ZV8En8KiFoVYB1fkz+fwxPkmVWCiO2fwoXsFlgiGlz8gqRzjt/MOFR5k
	3Wl6huELzyIyc9NeV0W+/cHqgrP6O2T5aJKdzCFBjbn9y9O0LA9avwyXWRBzy5MQxpY6S2arMx0
	vdv8/WoZYG+VzrTEFtFQJvDTltfZbTYszuSp20WbHue1LIdXPWaHdbQUi3ueIAXVW38QINkLhpK
	5S6Crs+qR3mqHpGhCg/qzqa+AAzpanozoO4TnxDQCE4XP/m08nHiPXm8QJM86G+awso6uKeBi8B
	B0nZ9tbxeXMQBzRcS7S6kpR09CgUniXrRzov0uPyERI6PywNwYqwvGHqsh7ohxe1ydY+755CjQg
	XR9
X-Received: by 2002:adf:fa45:0:b0:441:29cd:a18e with SMTP id ffacd0b85a97d-452ea07e223mr20899118f8f.23.1778489670340;
        Mon, 11 May 2026 01:54:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:29 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:53:57 +0200
Subject: [PATCH v9 2/8] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-orangepi-sd-card-uhs-v9-2-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
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
2.54.0

