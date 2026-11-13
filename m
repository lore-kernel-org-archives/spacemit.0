Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576521;
	b=fEr5c+kwRyz0Q53hmMBnebgkrlLO6zuyrAvV3hcD5DGrO+RJ0jvtvOBLAF6/PGwayF9D
	 bqniY5Jafis7HBp092+yMzvrdC9kXAeHxy71/wn7P69IthU9Svw6z7OQ4fNTIVQ8D/b3b
	 RVOLiy1jOdfpMZ406i+RZxY5lnkm0WSNK8CSrQXGYMaozndY8lpyrx7pw7R1LyVZ5Zfjl
	 MiDyYpAQEUFBLMfwOoKkLBjJ+PH5udmumqNhEVXRBiFkuMYgI+28b8D+qHoLioOSpkKZS
	 WUa0IJ1f1KOKHCx+pbxvaE2a+X8Gn3KCsuZrfBZTQbsVocUXWpfuYLgrVfUtQ3oQ77g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LFUlowHkykBA07bzno9+ZZz7Tclr3AiMw/Mxprm1brE=;
	b=msMgoH1IWeL5x8gzXcG9yOjLWbXwZ1s+ovw4L9LHlh7PojqA29dCKzbiMn56M6h/x2Ay
	 EHBFOheB17qO2yV6FIFXAq3KzqchyqPGiIduLXBfV9cjjEX2Tdxzf2R7HvBSbar9wpHft
	 WUq5q0aT5z02vqyl+D3G9qQvNHPWE254z6SNDrT0TZUs1UQjrBM9u2XlEMmy3tr7exiwm
	 evitUBsfXY59vxbJ40JOSHUVm368TpE7nC/urez7h4z7qA2LKhaNAbwjdHqf5jpXQeEDb
	 uvcF1F51URfq8MTO8lbgTL6R3twJfxEiZn99fTaBRpXugEutRlaXMAa4BuVy1AzTypQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7oCq3l3;
	arc=none smtp.remote-ip=74.125.225.71
Received: from mail-wr2-f7.google.com (mail-wr2-f7.google.com [74.125.225.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE978606B574
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE978606B574
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7oCq3l3
Received: by mail-wr2-f7.google.com with SMTP id ffacd0b85a97d-48df951fd31so359532f8f.0
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576519; x=1795181319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFUlowHkykBA07bzno9+ZZz7Tclr3AiMw/Mxprm1brE=;
        b=z7oCq3l3wG4tGwsA0tm3w6MXJZhiL86vQbMC4haix4bcb8jo6xcCk1uwQYqMWkjhif
         5fJT85horXVJmRHeGOqP7Q1hw5Yt9QbjP2DxenQvZs1cIALiZLTJQrotFbvUvtpfKNYZ
         x6TXysO+Q6SBRUihHHoub2ML6N/SSnMdy43KguJJNyB9e48sONtRW4B81wrs/mCEC24K
         vVYRQPax9QbdxSdywb6MOTDmWiwsi3n/uY4oBXmh+CwGq54gtT247NcwW+4g22r17SQO
         WqEMsU5YVn90lVBBx2TYmMx1p+S+PL1itqvpoKTLF0mOjRkb7LOTuzODkxLqEKax8Qoc
         nFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576519; x=1795181319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFUlowHkykBA07bzno9+ZZz7Tclr3AiMw/Mxprm1brE=;
        b=CdMTxqJe0pyJ272U5x9NM4Lb7UPibp0lyyya3wob9DCOGB487ztsUR3xBlCWKxU+Tr
         kmP6WTC4RWM1R8I+dXYIdW/d3gr3rNR5zIwi/oXk0dtaPwsZwrldmQWqmbuBMM6zKaUE
         D1oFoq2QGAfewO3stY4MkuUAzmNbhbD3JgZ4BZ5XEzXeSiF4jNomNlPy9zUIRkz/xiNn
         O69lQU4ypKTGi0uqOHy4Q9fWxvqfLhKpib4RjHvRpcr6hjBV2hxE66yDSRJ8C/IplJjw
         NMt33LXigHnWnlzVNrdM6bBBbyHKNNjzL2WmOeni0TAy5rqRWmlxWuamJHhZU1FBwxKT
         Jdwg==
X-Forwarded-Encrypted: i=1; AL+hErH8T9lCG/mM8f+uS0mH79aMOqMKuDj6tyJrqMmouRzNbcwAN+kuPMdbI9zilTQSAm/amJ96ffqkUA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/71fcBAaD50HK19m0Qg8e1yqbx7IVAwKxCWMVqJRi4gF8KRvAq
	gmTwiOwGapxp6qVBP8JLpdJac/MWIkDzccZEV2kQIcfkzMSFKx/8vw+b
X-Gm-Gg: AYBFou1g3uaPTJjetjjtA62TrWjKliD/r/m6w2MHuuQdkmfvHSu3NviFf/TnwPNjZSG
	Ne9CRpfjRg28fti1yMn9W311lT/iV3ogAZMDKbMlNOE75glotYeM6yOObLdejKFxjHtbQhHKelo
	dFHmE44scDraxkIn4ztd/Vro5jRIEE3aBO0U2+EedZtGXMBsX1CnnmsRPr5+Y9pVdLY6Xhv7wiK
	sRuY8aszT3gtvHVA5AizcuA0iYoxYQR88XauvAA4xXVqCGQ6yVnKmNOJQdplxMGofI4C5VPv1CF
	BS2kYdyRM2X4r247GdR7ecxm6Rb1EizZcK2T8amNipyGh8/v15daiQFSroUkf7FBtc+ech8R+Bf
	CsF1PmUuksvDr9NzVn44g7F3F2t0UQ7wcjpfDeGJxuDs9xAFYDqmkOFCcefynlj0xu9dwr1hkE+
	8GmM1+1zd/+ajT1E7+2xJW7iud5+KJGDK0DsQbQRNjvPGXHgShgaPvoSaZzDVwQnSAxauMxuQpH
	6n85afK4NWo63huDxrC1u/XxmOKSCFtYh+u8mml7vTsg1mJOBiB2W+LpnoSaT7bZFlDdaYycr5N
	f9nKQB+OAeBpXm4VNLPCzZFjSTG8BjXQGEpJ8Nej1z9+Aon2RP+2MRU=
X-Received: by 2002:adf:e18f:0:b0:491:895b:4c02 with SMTP id ffacd0b85a97d-49c713ae4d2mr5232726f8f.23.1794576519158;
        Fri, 13 Nov 2026 05:28:39 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4802673f8f.27.2026.11.13.05.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:28:36 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Ali Tariq <alitariq45892@gmail.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	leitao@debian.org
Subject: [PATCH net v2 1/2] net: spacemit: Fix TX timeout work deadlocking on itself
Date: Fri, 13 Nov 2026 18:24:34 +0500
Message-Id: <20261113132435.434615-2-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
References: <20261113132435.434615-1-alitariq45892@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

emac_tx_timeout_task() takes RTNL and calls dev_close(), which ends up
waiting for the work itself. The function call hierarchy is as follows

emac_tx_timeout_task()
    dev_close()
      emac_stop()
        emac_down()
          cancel_work_sync(&priv->tx_timeout_task)

The work never finishes and keeps RTNL held, so after a TX timeout
everything that needs RTNL hangs.

Remove cancel_work_sync() from emac_down(). Disable the work in
emac_suspend() instead, and enable it again in emac_resume(). emac_remove()
runs before the devm-managed unregister_netdev(), so use
disable_work_sync() there to stop the work from being queued again.

Found by code inspection. Not reproduced on hardware. Tested on Orange
Pi RV2 (SpacemiT K1) with suspend/resume cycles and kselftest, with
lockdep enabled.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Reported-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Closes: https://lore.kernel.org/all/DMO74K2MG3D7.15UUOU1O66K6N@linux.spacemit.com/
Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 71a80838bffd..51edc95f54c8 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1732,7 +1732,6 @@ static int emac_down(struct emac_priv *priv)
 	napi_disable(&priv->napi);
 
 	timer_delete_sync(&priv->txtimer);
-	cancel_work_sync(&priv->tx_timeout_task);
 
 	timer_delete_sync(&priv->stats_timer);
 
@@ -2010,8 +2009,9 @@ static void emac_remove(struct platform_device *pdev)
 {
 	struct emac_priv *priv = platform_get_drvdata(pdev);
 
+	disable_work_sync(&priv->tx_timeout_task);
+
 	timer_shutdown_sync(&priv->txtimer);
-	cancel_work_sync(&priv->tx_timeout_task);
 
 	timer_shutdown_sync(&priv->stats_timer);
 
@@ -2024,6 +2024,8 @@ static int emac_resume(struct device *dev)
 	struct net_device *ndev = priv->ndev;
 	int ret;
 
+	enable_work(&priv->tx_timeout_task);
+
 	ret = clk_prepare_enable(priv->bus_clk);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable bus clock: %d\n", ret);
@@ -2051,6 +2053,8 @@ static int emac_suspend(struct device *dev)
 	struct emac_priv *priv = dev_get_drvdata(dev);
 	struct net_device *ndev = priv->ndev;
 
+	disable_work_sync(&priv->tx_timeout_task);
+
 	if (!ndev || !netif_running(ndev)) {
 		clk_disable_unprepare(priv->bus_clk);
 		return 0;
-- 
2.34.1

