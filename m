Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680941624D5
	for <spacemit@lists.linux.dev>; Sun,  1 Feb 2026 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769940386; cv=none; b=bD8/oMkMVcfiAXfCvYW6bA5NIBYY2gAiDrkGg9Bjh01rnV3juwuiJNj+Hy+Txsci8xdoqobeP1ciNB6pvgAtATzabRg69ilKbAAGTcK+viHNyx2cph6hGnVrqF6nEgonEyRMRwH8CS8QZ6r3Rts8Kq48s2npmhiOSei9Cr1TMLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769940386; c=relaxed/simple;
	bh=sXcdVP3N/+yvnmjETfQKLlDPT9R3oGVcZSZN8wFCzjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SZRShivPsqPKjMH9Ex/R99e3ZbTzb+Qx8/1YRQ+fe1DQZNFbGY8lSp9HFKJ5fVSQnUkGZnAEJz8Ufg9Bl26WxQiq0NYCCmm6LcSwQFxv4mLF+mL8K7rirnZxp406b2CUY3fzkok3y4eq1LY5SCW9asKlLAYdHjaApHWF5ls6XQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.150])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32b14fae9;
	Sun, 1 Feb 2026 18:01:03 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH v2 1/1] net: spacemit: display phy driver information
Date: Sun,  1 Feb 2026 18:00:01 +0800
Message-Id: <20260201100001.33102-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c18a6168503a2kunme4974dd01a937e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkwfVk0fTUhLTBlLTh5MH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSk5LWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+

Print the PHY driver used and interrupt status after connection.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
Changes in v2:
- Simplify using phy_attached_info()
- Link to v1: https://lore.kernel.org/lkml/20260122080001.73921-1-amadeus@jmu.edu.cn/
---
 drivers/net/ethernet/spacemit/k1_emac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index c85dc742c404..b308e97d6bf2 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1614,6 +1614,8 @@ static int emac_phy_connect(struct net_device *ndev)
 
 	emac_update_delay_line(priv);
 
+	phy_attached_info(phydev);
+
 err_node_put:
 	of_node_put(np);
 	return ret;
-- 
2.25.1

