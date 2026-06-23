Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368E311C38
	for <spacemit@lists.linux.dev>; Tue, 23 Jun 2026 07:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200827; cv=none; b=mZ982v9GgoAIT1qVkkgjj8GG1okDFr1m0iS73sFaABpaSiB1J8j/+/21XXm76WBFJZlMmxwu6Cd6yaG2DpA0F7d0TFXSY000Ka/kuZQrjbT0KKB4BN8cg9xrxVT8tndpQrwSEjxtOqoFhwjt4u4e0LfgnwHK7n2JyigGwSxuVdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200827; c=relaxed/simple;
	bh=EXUbPBa7rv7rs1r8YW/fmhj7HW1HR6AkwNyGcZQYoYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFbHRtKoAjc+znHllGxzaggmk7Hm9IEzKYMFXWmVfXXSgRuc75KGCvfCjX7nDq4hFHg0kgqI075SgidIZGquTbq5AIfRv2AZtLHb7nXnSDFiUPHDgElmWsGbRqk6hjsGQZPafiD2EMRQPGp/OCKZ6oT6UZEbNtGpszdtePt+HmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdWnOzXe; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdWnOzXe"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84537777d45so4259114b3a.3
        for <spacemit@lists.linux.dev>; Tue, 23 Jun 2026 00:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200824; x=1782805624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=;
        b=RdWnOzXeNiqCYwzFJwLGVu0ghpLw+RmEFab7GXBsfik2cJSGewfswh6vbrxz4YlBAS
         a5NsLsProVpGVOGMp1ifjrQ/4BpZIqySarulrVmpXYH29VgUJ/NzldGv/mEfzCtRFvmH
         5CTB61m9N7XnchfPIUTkSS5D33lRlv0JAd2JFMLHX8qeXcXY2se/KdGLtCDFbz2yeVjH
         /lLl2MtKPkhcfQLAS4Jm3of19kbln/pVi7mfo1UuGGaWuf5E89pZHuXVZLtT3UrIX5X5
         AKPIsLqiImDpeAX0ZQtxtJY0npCA21XDVGPwZ++1jdE2rIiCu5oZP9UT2Mnlq3+Z8rB7
         dFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200824; x=1782805624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=;
        b=dwsdw8pzL03EI2ikhpEoqVU8kwP6tRTEebfkOv2ghwqPTO90JMeiSiNe/9S72/SNhS
         o5BRC/y951g8S9L0NArco9Zx38QYpOigTorEUNL+4uzoRRG/hIcEajezlMuqNJzx3LUp
         H1MVUgE8Y0+nPcq3y6rmadb62odSKoRiJQwnm6S3UlXVpMEBHyvF+gxR2FuzPUfGIE25
         2H6Hkwq7tdu8cmHia73s7/Okj9kMgNYS2ODWTL3B8UFVIhTg3RbprNbyFrqydKY5yqNa
         Gjd5w1qx/VnLGbtPLaHISGauvJiY1eHo5+nN0fCwGzOtXsGmmV2+WlJW3OCVfAf+dP52
         xO5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+AUg4RPRO0rBzq1/wT5tGUjWM9EvDefb89K97JfoveEnO64QDRPOUMlrSk4mBr4K/busfSKM2ERA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVclL7WmXvrw48E26GZVIPyrLIt7+wjvSFtnGcxcHvU9ZhIF44
	xMuhtzyvxuwL5K5k6e9Qu6NzuuBMyxWv7pGGfz7fYrOoDAixSKaK6gBW
X-Gm-Gg: AfdE7cmCJL5SBkPAXpYqpgeVaOGQPPPKhmdlKnNuIv7eLoXqAlb3gIyxlc49zbTBYUO
	C4VyCPGrR190LkOooC+N1XODxzfgpay/AhjCJd95WPWaBTwaRe4/UloreSeK4XMKlEEhjkrSZeN
	LpCg8hfWBtIE4wpgR50EzvnzNONkPszFjW9pGC/Lv2QsG2O5HkTT7xRBI1qw0NCcAHKvasorjjg
	98qVPZO1/u6gyVWDaELkifWBKQksdlK0ZrI0MvkvUo+Lf1CaMQhhIxx0v7rHvQJplD1wDPGFnI2
	K4uQEv+2TKE934MSpP8nQeOO0lWkYvzZmfTkZ+TVe1ld4jD+Mdf77jmVvTmGYTrmseZl5mvYwk+
	Y64jIlptR3ZfIPDZeR5RkSZXbnCdWUjslyJmOp7PmG+w30aniNcw7bDpulI1G4l7YyiO6Bl+EBd
	kRJBl+txvely0=
X-Received: by 2002:a05:6a00:3e21:b0:841:69e4:f21b with SMTP id d2e1a72fcca58-845508d3c1fmr18398996b3a.39.1782200823739;
        Tue, 23 Jun 2026 00:47:03 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8f1a1sm11063117b3a.18.2026.06.23.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:47:03 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] net: stmmac: dwmac-spacemit: Fix wrong irq definition
Date: Tue, 23 Jun 2026 15:46:35 +0800
Message-ID: <20260623074637.503864-3-inochiama@gmail.com>
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

The current irq definition of the wake irq and the lpi irq
is wrong, replace them with the right number and name.

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 3bfb6d49be6c..322bdf167a4a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -22,8 +22,8 @@
 #define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
 #define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
 #define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
-#define CTRL_WAKE_IRQ_EN		BIT(9)
-#define CTRL_PHY_IRQ_EN			BIT(12)
+#define CTRL_LPI_IRQ_EN			BIT(9)
+#define CTRL_WAKE_IRQ_EN		BIT(12)
 
 /* dline register bits */
 #define RGMII_RX_DLINE_EN		BIT(0)
-- 
2.54.0

