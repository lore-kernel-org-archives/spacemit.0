Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B723033A9D1
	for <spacemit@lists.linux.dev>; Mon, 26 Jan 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769447699; cv=none; b=fTmrKgxWPPVzC1BTSY6z5zuYvg4UEIBM8sppembjmmkELlaKtvhPsa+8UAblQTxrdBsQm0FUyjnEhK93MZPiyRmIFBFA+osyuvYMKKe2BVPdBreoyWTxFNAzRSzYkAgdhwRpg+9gPVP3tpai9rTkqYZE1JHEQgSid6WLt1MYd2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769447699; c=relaxed/simple;
	bh=m7gtpX6JlLNBi33iHKaUJijwhNaqEtEM+3TbX6tlFCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bDC8A/yDjwT6xZ3/R8b0v2OdWVQNe+oPlFNeLcjc7r8VIloU3R6C9sTg6wVuYH3IFKdTakzZXMXeSO4cyckRisc/xspczQ/WmlWo/Zdm47+SNhLvMMGBF1TF5adVge2UKuOoKY19WsLQmwBBYaRWjGdk4x+wKFXakq0aOk3D5Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApsIwo0a; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApsIwo0a"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso19277635e9.3
        for <spacemit@lists.linux.dev>; Mon, 26 Jan 2026 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769447696; x=1770052496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHXVzDDBmvnIJ3lzKbW0IxNth1KaCaSoyXj6yfLdil0=;
        b=ApsIwo0as0HgG5ooojmv0GJnvDAHlXjNtHFsZRVnE01f4UU0fu+GCSw4nNug2HQQQK
         bQr4yUsgIuaiPMqPJmDYIY5yGMWS84AQkKvjM34BSaFXBRIRyvonHYjMei8vTXI4LRw5
         Q4TE6SkwMJyIGI+vpbFjFE7PxAuTtQNvYfpnBrJs3sbDuwugYRi13cFbqcH/lL+ZgqrE
         elaReLSn8WOkMCOPxQXsG5vIuCNiOSat9LQ8ryDDQnviECPTnhyutKU0w1P2CnE1LwPV
         vBZFxHsLy2ZIMpsCYQLxrjRGd5uOxfF2X+b6NDfFtBfQ8d8xdmHXs8JoO5Z8LcEVHPQL
         Zf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769447696; x=1770052496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SHXVzDDBmvnIJ3lzKbW0IxNth1KaCaSoyXj6yfLdil0=;
        b=uy+xnbE3/WrSwTuF//0h+cAHkrvgBKlte31mx7e3pPL5UKZ/k8kFx7Zi1duYTrebSz
         /iq1mjpylDDQEm4Z6Tp/DBK3VrZQQElsWsGNjJn62/0eDbwDGT4tXo/H3r/lksAIvOqH
         7DP0LNBDi6zF1Q7EG04fY8lHUJ/6Qm/Z0zuG5AVHTzGA5myfh92HG1XXY4uSbmZp/7P+
         FB06+k3SZk84c5I1Bdi2VLbQqn7PGpF8qO6wLUuqA5ir5E06uyCPVxi5Gey33Z35n6x2
         uPskUpYPIojNBq09wQeSCqtWGRdiDJzQD9cgl571oLjmNHE3CfBbOADyCbWVW2/WV7j3
         nkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFtwEGU2qNN1huLgkaChJBWJtL3amYbih/ic4zMUunAA+2GJp8RItCMZZOH9KmGE8oLdybRUS3Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjAHh7zohu8xuKiGRBCaSBJeO26dCkFN/fnBt07gsL+t/IXlHG
	dPgy7sNChyzDHdGS4j7xb7yS1nY9L5fzN4LFk5P8lPR5XuGITHggQKc=
X-Gm-Gg: AZuq6aK4qp3qatJl0lhQYfirMgvZOqmH0FU9GIouFUrSZiGd7nxA1UShZLnv8z3ATyH
	TpwWsf2ibE9+51+QDkLPeh3iGNRozVaBZx4SYAwYvnOi+Zj/B+yvPrKsfwas5XG87vu0L6mcFsf
	qBeoKMoiCZhTehwAm2s9HnCV+nwkXWc7faPh8IbYCbrLAfnj+ayJT80ZK9kgpR4R0EiC1CLKT5k
	ZrwPl8uJuzu4eBSgi73OQIMF23CdF3ST6WX1mqlz6gKdGFwz1Klf0axGTabjpAsz7DhpOTfMODP
	loZwKsHfDisSiZkGFCvLKUmBaEIdplKXMNh/qeywvQm4WnUhP4PoAG80FG4eE4MM4GR399Zr6ui
	cUGbgoXY2/RyvcvmkWTE9odbaC+PSexekCjFIy6YlSZdqnkqcof/p09zlMM7ovBmAJntmKRoyyc
	8izS9Y
X-Received: by 2002:a05:600c:5395:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-4805cd40961mr78662845e9.7.1769447695886;
        Mon, 26 Jan 2026 09:14:55 -0800 (PST)
Received: from localhost ([2a02:169:c21a:1:5aa8:4ea4:a58b:fc48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066aaf30esm3136815e9.0.2026.01.26.09.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:14:55 -0800 (PST)
From: Tomas Hlavacek <tmshlvck@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Yixun Lan <dlan@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Tomas Hlavacek <tmshlvck@gmail.com>
Subject: [PATCH net v2] net: spacemit: k1-emac: program frame size registers for jumbo frames
Date: Mon, 26 Jan 2026 18:14:49 +0100
Message-ID: <20260126171449.83288-1-tmshlvck@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126135919.77168-1-tmshlvck@gmail.com>
References: <20260126135919.77168-1-tmshlvck@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver allows changing MTU up to 4K via emac_change_mtu() and
allocates appropriately sized DMA buffers, but it never programs the
MAC_MAXIMUM_FRAME_SIZE and MAC_RECEIVE_JABBER_SIZE registers.

This causes the MAC hardware to reject frames larger than the default
1518 bytes, even when larger buffers are allocated. Frames exceeding
the default size trigger jabber errors and are discarded.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Cc: stable@vger.kernel.org
Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
---
v2: Added Fixes tag and Cc stable.

 drivers/net/ethernet/spacemit/k1_emac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 220eb5ce7583..31b1bdb2827e 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -228,6 +228,12 @@ static void emac_init_hw(struct emac_priv *priv)
 		DEFAULT_TX_THRESHOLD);
 	emac_wr(priv, MAC_RECEIVE_PACKET_START_THRESHOLD, DEFAULT_RX_THRESHOLD);
 
+	/* Set maximum frame size and jabber size based on configured buffer
+	 * size.
+	 */
+	emac_wr(priv, MAC_MAXIMUM_FRAME_SIZE, priv->dma_buf_sz);
+	emac_wr(priv, MAC_RECEIVE_JABBER_SIZE, priv->dma_buf_sz);
+
 	/* Configure flow control (enabled in emac_adjust_link() later) */
 	emac_set_mac_addr_reg(priv, fc_dest_addr, MAC_FC_SOURCE_ADDRESS_HIGH);
 	emac_wr(priv, MAC_FC_PAUSE_HIGH_THRESHOLD, DEFAULT_FC_FIFO_HIGH);
-- 
2.52.0

