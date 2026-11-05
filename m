Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882154;
	b=EPH1pi4k2djY/Y5ye+DGEVPzo9PTKjOlQOrl51/WoS4bSTBSIawut8ekuRGY405Ewsk3
	 1b1H8xoZSUODRSyleV76dqNbcmJc/2lz/gq0mY78YYxHvjvpvNdrEYX82qkWUWC3w8dJx
	 leXBtn3G0cK+yCJOy2rJPhS1wWB3I5cOWgADx66W9pqDQxbsc+ZkQEnuQaCZF6xQnXxK6
	 URUtP2x7yZ2BPCN4pgdf12/aACnBAJASp8xE6dNV8VPN1D/GspZ1kfP20eHVNOJOxEVBH
	 Av9MAXN+LrjtnJo+pf6Bc4NRp82V/dFy5ZtgEjEoQbbPaKOMW5ruIeOY+IwJ3Gt8baw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C/jFN8eJhh5ybkPCJN1GH5EEF9QQtG/kp2iWAhig7A8=;
	b=WXnOij5N33M345SRteVSnbnpOASURRmwDi1875OMJTAo6xA5yhF7eiqm6rdHzo/c+C17
	 x6hUJv/tWVbIgq2Aq35B4v7kfLpvPuyHjVn0hd5hcYxc0Sc2z7KZ9BnsqUe09cdLJqqAE
	 Q7vV2j/xisS4lQ4EMTwl7/WwcU9NpbABwcX/5yV3tyWUFavcltYA4UKO1nUnFX5i0glhU
	 +wXWM/zJmRNhhfDZPdwsHPQYruL7llxual7zZijhbKDHZRGmR4zyJIhQof0KBbFIQMtqB
	 OzKfmQrh50f1ULy4xrZG8cC14tn4gWH7D+8HGMetSf5yVmJTVk3UDzK4VQnvv9cMSBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9XJ7Y3e;
	arc=none smtp.remote-ip=74.125.225.128
Received: from mail-wm2-f0.google.com (mail-wm2-f0.google.com [74.125.225.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC303606A33E
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 12:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC303606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9XJ7Y3e
Received: by mail-wm2-f0.google.com with SMTP id 5b1f17b1804b1-4a2d6bfe8d6so6354465e9.1
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882152; x=1794486952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/jFN8eJhh5ybkPCJN1GH5EEF9QQtG/kp2iWAhig7A8=;
        b=s9XJ7Y3eHdwyjN4qcHIaLwrn/7qar+Pa3jZDec1zoFDWMubGgQaWHQyrYouq/1zR0q
         SoM+5GEDHOSF5Lidhdzf4nSzATkZnbGN+q5E109CKDnsHB+e+I++DCRvMicz8uF+o8ZA
         zZB5Yb8vAvT226splcx3AdYzd9r3dPAYIKUmYGkdWKtWVzA8rRCv0OVLxhc+WGO5MBk9
         DapN6f1FLi0MS3vwTKYkMgO7YW9GGpI6kNjty+iiapPLMPnUjUuveSs6J2ShKwDxAqz5
         WU914znE7De13a1n090guU4GenB7qqAMlGe0b7FSDRkMCzvyGf6H1Y+2tpbiKz6cnbT3
         QX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882152; x=1794486952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/jFN8eJhh5ybkPCJN1GH5EEF9QQtG/kp2iWAhig7A8=;
        b=t1y4zRsJUdb7lplP+DNaNCjVOQa5VYLfVnpLnDM1VQuW9hjLhi5fAqkm3H3+bQFNGr
         mj6vwjDP9+S5jrWKp7JwoY9euSnwBljRVo+Ds8sUAy90zblBTDu7KHWiBd2APX8Gk3YZ
         LI+Sg5RhE1fZfHEEWT4LbTms96RLhU+foRRrdYqxBTFI9HKW8Q/oCjv8Q6FDW7IB/FKo
         Xj6Gx5v9J0h5yNbMP619ilvk7v5F2i8P/dx9ICYXD9GVBzlerIAvVR4CrQblzziNu1Zu
         4k/uXR557dGPWHLyNaOP23o2EzOL8pTWam5s9HFu2+Y1d/spFLdcFWuugjTmH7OfzqV2
         RfXA==
X-Forwarded-Encrypted: i=1; AKwUvBw6wWL6MbwP7VWNiijURVjHt+WFhvs3mYG0Knb+dQMcIMd/i3U8wzCS5IXV+dtFogCkwjthm5WCQg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/L2uKxsZ9TmLD2n6TmKBuRYIzHetuEohY/nvkIwzmGtroI4Ca+
	v2yY8D7fGIuZwS8gtrmAB8zFIqKLX3FPfO8hNTxD8ZDFIvh7+OocWoYW
X-Gm-Gg: AYBFou1WEOxzhu0TEdODJfWLH4bRPVDUSAANkdd6iPJaUuWXEFelo53WhDBV8P9zPyf
	skOD6pZzi0rQdz3jl2jUSA524bVSSW4qeEP1JgdxiwCCc0mFoztZGtPbqy2gopCqAkiYzm5DaFc
	06WSnIK4SU2FGrQD22Tp6Gv6i4v0a+Ubh2y0WpONMokiCnymsgoWTejNoNthB3QQ4TNGZPKKOGA
	9O+ZaaMAvfpK1lPOuBV5XUXpDcc5UqFe8TQ2XKJon6wGquIb5KB6MJP2wEQBM8CbYhrEbGUw9se
	2IaueMhM07XxMMIpBNWd085yVO/4EvfsUmvZelSgOKjnd3xIC7hlQ2MKymG1/ka4xzG+giR4HOJ
	pr5KsPz7qgd782ZG0CfP0PIgVsFAd1znsR6hWNMQF8MXvjpJFABmO7U+FlHx09y5kXF+p/OERhW
	hef095nECAD0vmcm0eySwyyNeuGSsj+jNYjbn0iadi18cEPoZeeQP0zfwNgu8dgv56l44abXqyi
	0qv97KJOUElvvhCzBzrOSL3LmANjA1Lp/E4zXAIXotwtFMrCvItx5ZYuXVOCvFuoY74QiinmZXR
	yWJrT9TUn1XDs9RvwRCuSjAIzH/KVEOaYD6w
X-Received: by 2002:a05:600c:3547:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ac1889d442mr421740485e9.22.1793882152080;
        Thu, 05 Nov 2026 04:35:52 -0800 (PST)
Received: from workstation.. ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm114419535e9.3.2026.11.05.04.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:35:51 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Ali Tariq <alitariq45892@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
Date: Thu,  5 Nov 2026 17:34:37 +0500
Message-Id: <20261105123441.2524171-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The emac_resume() calls the emac_open() and emac_suspend() calls
emac_stop() functions directly without holding the lock through
rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
with rtnl_dereference(). But since no lock is being held,
rtnl_dereference throws a suspicious RCU usage on
Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.

WARNING: suspicious RCU usage
drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() usage!
Call Trace:
phy_detach_internal+0x490/0x5f2
phy_disconnect+0x90/0xc0
emac_stop+0x114/0x626
emac_suspend+0xac/0x126
platform_pm_suspend+0x72/0xe4

Hold RTNL lock before emac_open() and emac_stop() with rtnl_lock() and
release the lock when functions return with rtnl_unlock().

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Warning Log: https://kernelci.cloud-v.co/scheduler/job/549#L2168
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/557
---
 drivers/net/ethernet/spacemit/k1_emac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 71a80838bffd..aca25a9e1e9e 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -2033,7 +2033,10 @@ static int emac_resume(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
+	rtnl_lock();
 	ret = emac_open(ndev);
+	rtnl_unlock();
+
 	if (ret) {
 		clk_disable_unprepare(priv->bus_clk);
 		return ret;
@@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
 		return 0;
 	}
 
+	rtnl_lock();
 	emac_stop(ndev);
+	rtnl_unlock();
 
 	clk_disable_unprepare(priv->bus_clk);
 	netif_device_detach(ndev);
-- 
2.34.1

