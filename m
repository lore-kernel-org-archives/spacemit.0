Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A27370AE5
	for <spacemit@lists.linux.dev>; Thu, 18 Jun 2026 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764920; cv=none; b=adbrVV6d6qNuXSbo6mc3mtl8ruPXRgu9EfulYTq/38ADOTMA2c7eNZ/JA7I136FcCEg6Uo7vvnvy+fcCQ5bJOeNDf/0NTFKwBf3egzui4qjlaPCXJDJDk7EaTcRb+JUCwDqx5Yfm8MvJUIWr/p9Zc1O7W3jrkIb10RLN1SMRF48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764920; c=relaxed/simple;
	bh=WLF7/xznf2EvJR4gFlmVaoocRv93ZakQpL8lMrw/czI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUsGBslu5yjeDFoGJiMAeb0T+3aabxY5s9PA9/dehPbR+hArfDptvUQ6ItqM/P+lSNMGtKV52XIMopyGDQll3knoBwjgCspueju7vcHI2ORyR6IW4o/ukcUygkXqs7fwv85cufiQJpstn/YXtfHCBzwm/mo0wiWc82gtI5EiSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFGaV2TE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFGaV2TE"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso301339a12.0
        for <spacemit@lists.linux.dev>; Wed, 17 Jun 2026 23:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781764915; x=1782369715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq+UrIAjX4AZwds/jvySlMBzvhIQPTWIB6Jqv3g81b4=;
        b=rFGaV2TE5bWRPk04OM6xqLNlIjuxeynozHj65jQHWNS66//TfNELwqUDuD5exm71wQ
         PHEUvtmXkf8e0dkPMdbUKOzqJf23u2IrstwyUayjN4UqPOUy0D1NTkVYVqwPxW5vZmi8
         m7ZjFy1rTmCbA+OTwpyGN9F+rHNmgQi1rcRhu42gKoLVeEe9cxkLlbN2Ucn2tH23rG4M
         sZYnO2XYpQEMW9Ffjc3ziJDgmEupyUkU/iNEw1ozpqWKXH5Usf1qVJ+wbxWXzhdk9Wve
         8jziBF/FU79iPWK1o8CpvPi9pKlrRUT5s34TagdTK9Q1htq5HmTvFi7WB6ZTDkdsiThY
         wXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781764915; x=1782369715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq+UrIAjX4AZwds/jvySlMBzvhIQPTWIB6Jqv3g81b4=;
        b=Bh7OF0PO7zVP1jg9iRWkms/Kii/Fgxntb6Irl4NrukMOjmQDPuHS4UoNtqYp9T24h7
         YnYrIskjlyxQDQYvhJe29oM7wbE7rEmhargLOxjtX54Z9ImCSJCzyJacBybUaTvLJNcS
         7ML7pgSEz8ppFB1Ez5bUPlUulYZkK1jRAQOLVVFHe+MC7HI/F/MUlUIaAiVaml/EdSbM
         y2yt3ShBfelwhVxQwuSRehU36Oc8U4+IOqRU87WrQw6qeuRpZeYjIg63vhdkETTRR9cv
         vlAKmKu0Gnqnbq3Xed8Tnw8bw7liXvy7CgAeRmE0QzzQmpUSBOSxvjh3eQ1u2RcHCHTw
         tNiA==
X-Forwarded-Encrypted: i=1; AFNElJ+uRBRMLIGo31eL/Qr4maI9tmimkov95WC5uq1+xEMVrtoMLSYG4YCiLpL3lCCm60hxiHBC0NE6VQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDU3E/jbVFgBT5SagxpUvaOlHYASGYL2C7SP21E3NRRmHDCbeQ
	K+zGft6Px1fkChqP6CDqHSBwIaQx87ki93nsV2adqvtRF5/OJFJ9KO67
X-Gm-Gg: AfdE7cksWSHsEHJXrcDFeTcZE6NH3ekR42Is0sVD7KwUM6seBkUHe2F1P6WgMD5w8nK
	xYaDZr8ZelX8zI1PkqfeGwKXdI4p0JX+CSvQcEKic+Sk6l4crqMkkVIs00PEKJnCF9u1FWYCM04
	SRPxQELEK1F92jBPMH3JuwOTTtlDaleXioLxvGeH3MRkyvojdwCsw3RSw2F4X7Oer9kcP+TG53V
	lAzJ4f7jV9UCUXzDFgQrWufxSEeCpNqEOQd1wJ+zSytClfnKJpPg8c1CzbELie9naKH5F47PkCE
	V9uvhvN7obDQDT6bSt5r4VUwYXgfZwEJwUwS3DS+ukmTHKtTVEtRC+m5O/jM0nmvOF2wWMA1fDg
	ZuomEmaCz8swpIx7vVgQgpfGdm/wxr4/uVs84q+cjMOQUG5I7G1ioMvEkITitVhR/Oebn1AbchP
	PUUoLfib8uE5k=
X-Received: by 2002:a05:6a21:4d17:b0:3b7:9aa8:3be3 with SMTP id adf61e73a8af0-3ba4d0e7999mr1744739637.2.1781764915177;
        Wed, 17 Jun 2026 23:41:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d156sm16799602a12.13.2026.06.17.23.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:41:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yixun Lan <dlan@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net] net: stmmac: dwmac-spacemit: Fix wrong ctrl register definition
Date: Thu, 18 Jun 2026 14:41:43 +0800
Message-ID: <20260618064143.1102179-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There register layout of the phy ctrl register has something wrong,
fix it to match the right layout

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 223754cc5c79..6feffaa3ef3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -18,10 +18,12 @@
 #include "stmmac_platform.h"
 
 /* ctrl register bits */
-#define CTRL_PHY_INTF_RGMII		BIT(3)
-#define CTRL_PHY_INTF_MII		BIT(4)
-#define CTRL_WAKE_IRQ_EN		BIT(9)
-#define CTRL_PHY_IRQ_EN			BIT(12)
+#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
+#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
+#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
+#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
+#define CTRL_PHY_IRQ_EN			BIT(9)
+#define CTRL_WAKE_IRQ_EN		BIT(12)
 
 /* dline register bits */
 #define RGMII_RX_DLINE_EN		BIT(0)
@@ -118,7 +120,7 @@ static void spacemit_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
 
 static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
-	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII;
+	unsigned int mask = CTRL_PHY_INTF_MODE;
 	struct spacmit_dwmac *dwmac = bsp_priv;
 	unsigned int val = 0;
 
@@ -128,6 +130,7 @@ static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 		break;
 
 	case PHY_INTF_SEL_RMII:
+		val = CTRL_PHY_INTF_RMII;
 		break;
 
 	case PHY_INTF_SEL_RGMII:
-- 
2.54.0

