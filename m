Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257433987
	for <spacemit@lists.linux.dev>; Sun, 18 Jan 2026 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731334; cv=none; b=JRUi9uyPhWJJ/pUqbvYoc7N1U4xrtVSUMoEVN5TJTC+sfdkt1nHMhihiqUY9plYaAGwNGaUPCXx2qi2YM/U0cnFYXJbocSRhkgzuGCvQj9JxTIk7REZrTBD1Vwj5AWFYXoi7H7Ka/Kl9nN+C0CgILkT5GaiUnqtF1swmoOesHMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731334; c=relaxed/simple;
	bh=SUwlnXQPyg4COSmH9BKT1CCGZCUeOYlp1zUHDF473As=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YHuo7oVZmIvwpCg5Mt3ceVPwRC3go+8kEJX6uwBg6teOyLzw25HJbyd8yd6xIKX/y+LF0a17WSVuDtt+hm+S5O6ehh/ChbtNiDS/vA5OXd97QW2RREyq/1tz0MtR1U6rVVdr2bnwZW5vSPuiuNrBSz3ug39oZsdTJHJj4QaqBd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3108da648;
	Sun, 18 Jan 2026 18:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Yixun Lan <dlan@gentoo.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	netdev@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] net: spacemit: Check netif_carrier_ok when reading stats
Date: Sun, 18 Jan 2026 18:00:00 +0800
Message-Id: <20260118100000.224793-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bd08c367e03a2kunm70d59ed02d74ec
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR5LVhkdGUsaTx8fQx1MQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1VLWQ
	Y+

Currently, when the interface is not linked up, reading the interface
stats will print several timeout logs. Add a netif_carrier_ok check to
the emac_stats_update function to avoid this situation:

root@OpenWrt:~# ubus call network.device status
[  120.365060] k1_emac cac81000.ethernet eth1: Read stat timeout

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index c85dc742c404..d7972f247bcc 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1080,8 +1080,10 @@ static void emac_stats_update(struct emac_priv *priv)
 
 	assert_spin_locked(&priv->stats_lock);
 
-	if (!netif_running(priv->ndev) || !netif_device_present(priv->ndev)) {
-		/* Not up, don't try to update */
+	if (!netif_running(priv->ndev) ||
+	    !netif_carrier_ok(priv->ndev) ||
+	    !netif_device_present(priv->ndev)) {
+		/* Not up or link, don't try to update */
 		return;
 	}
 
-- 
2.25.1

