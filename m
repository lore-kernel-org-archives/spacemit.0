Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3C3C73DD
	for <spacemit@lists.linux.dev>; Tue, 23 Jun 2026 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200822; cv=none; b=dmYjwx9aAnadOYpUMKuTfw79Y0tIHPWXrhiZT/6VmtlIk7z0JvArJWYdYyaNVp9iCeZzClxevES6j5H/N/kHc/PSlMLwmXp3WIhUzjVymcaUudfqWig4rbk9d6b9Vn5XveVyBBbER+eOKx0SUZWVFJeN/o6MN5T3+dJZ27eQmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200822; c=relaxed/simple;
	bh=iw7EtxLgSRuUovF7Ujv0rAtm9UNbY51PtU1f9KhFbPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTqgUWMjl2C1zZ9zbVdezqMW7hqkYfnGAuetsaHyOCTeYJ23W5AOeW/5UX03qqKcSmkdjYU2F8EYJEbLFKkS2ahFi350Aonj/E/sHIAim7XYsm9f8gNz0VXMroIouVMyCril4GX7E9fY5z+Y0kAsnaGE9TXDgmLjU6bGWbrW4G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9FM21lK; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9FM21lK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c85c531d4a9so2186099a12.2
        for <spacemit@lists.linux.dev>; Tue, 23 Jun 2026 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200821; x=1782805621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1Fyw9fJmtAP3F6H/X4okbn9VnSF0X5lGAx5UXg/ZEY=;
        b=Y9FM21lKo3Ezu+IB3f+wIDcoZt7d7u/1H6h3+1/kwHhPLeZUl8iKvr8EzUFrui0TIZ
         dizsWsDwbuCwp3mNOn3IIbXh99XsafL17xVnamNNrTpVng2j/fon/KuGWr3hjGtkMJqf
         /gU6ksRRnbbbRAamL25GoeEihSSI+gi1M+xUS5vHjwd4jzl4TNMzapmYquKcDda3+oyM
         p656sCh6wMC1L4qALze3xDbLgIDmZ+PKh6Z9qeyDDspjP0eJCHZ5ETzx/PPc7hWz8zGT
         wL+IQb1Vpyy8x4i9kw+PDPl2G+ZbV279k0MSZsfZCu7gGfOlN+nIv/lEQezPovi8Iuxm
         L3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200821; x=1782805621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1Fyw9fJmtAP3F6H/X4okbn9VnSF0X5lGAx5UXg/ZEY=;
        b=ZEq4+gdKXsKnTe6dBrEyFh0z9J5st4ASKH5DDnb2QPtPb+2PCvzdscp/pFMUY8+k3g
         ku/PjYYVs/eu67uzA6oobo48WgnixZX2DD5DsWqckYAr8ss4m0Dpv//nxQGJgI7aA1ol
         yp5Lz/e1sKnDidX/LANrjGhDZ8NRffOOFXT8OJAHDnmendeV64fCSZIHGrXrWwCv2P3w
         AV9g0lSUND+CfGs+08jvF2J7fJ1H54VOxRhqdw2yWIhvplhLZbrDioHkxMgTiW5C05cb
         GCkSIGeaSlG79w0JLWGceT9qtV/dHfToT9Kq28AVbcWOzR5+Z8+h9VeNqv6JSg/YMbAq
         Uvig==
X-Forwarded-Encrypted: i=1; AFNElJ/CUIYBFg+ke+oH98zhJnmtvtfSVaIVBAOJVoGqdTRWUio8HmRahyttg5YB320SmTbIcw5hdr0CMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxDWpMB+drMyHE4lKNaHDFnQCdoI6b0DzKeeFapTJkq+1U9H1Y
	SH6RET94q7wL2CyN3gdcXS3HxNNT7gcWUnSK9GvdNrTHcjNxszRo79gc
X-Gm-Gg: AfdE7cmxkuTe27MPHBY3VBzc5koNpLcS6xM7x29PZB9jVR8ydKAXWi3G1pjEG6IbJyZ
	3u/HONKSEGje0xWcS5HV3YaPjQPeL5+L0+lVMxBtNkZD6C4Xhhw+6wxaBiM49dKfV1XjPxAdEsp
	vOqDcO7zYj3DZxrpba0RkeMT1L5dpdkiXOwSokpvF1hgIceGXWba4K+EtzmpOUK+uYw3WNmHGPZ
	HJefRcD6Ge7Gue37jMjeA7ss+OJo7yP0aaRxXyBpSRRHm6Tj87m53SYJG7iv9nHByN9UXT0wQwq
	ReQ+a+FY6DTSqsZmTWQvK3V5NQge3m5v/TfaoYiin8oMo5PnFRjvscV5vRGKXDziZscSAtydooP
	61nME8+6DK9HDGNl01ZLOnSde2ZCjDym7UyJBUPviwV94JgMiMmWn0mRpK0ymhuq+S4giZe1mdZ
	Hr11TSP1uVxB8=
X-Received: by 2002:a05:6a00:22ca:b0:842:74e3:48b5 with SMTP id d2e1a72fcca58-84597067827mr1756226b3a.13.1782200820845;
        Tue, 23 Jun 2026 00:47:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e76a0bsm11039417b3a.36.2026.06.23.00.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:47:00 -0700 (PDT)
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
Subject: [PATCH net v2 1/2] net: stmmac: dwmac-spacemit: Fix wrong phy interface definition
Date: Tue, 23 Jun 2026 15:46:34 +0800
Message-ID: <20260623074637.503864-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623074637.503864-1-inochiama@gmail.com>
References: <20260623074637.503864-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current MII interface register definition from the vendor is wrong,
use the right number for the macro. Also, correct the interface mask
in spacemit_set_phy_intf_sel() so it can update the register with the
right number

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 223754cc5c79..3bfb6d49be6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -18,8 +18,10 @@
 #include "stmmac_platform.h"
 
 /* ctrl register bits */
-#define CTRL_PHY_INTF_RGMII		BIT(3)
-#define CTRL_PHY_INTF_MII		BIT(4)
+#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
+#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
+#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
+#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
 #define CTRL_WAKE_IRQ_EN		BIT(9)
 #define CTRL_PHY_IRQ_EN			BIT(12)
 
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

