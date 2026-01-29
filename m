Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C8A23F26A
	for <spacemit@lists.linux.dev>; Thu, 29 Jan 2026 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769660969; cv=none; b=mWuMl6snWx+xv8HgSCG51Be9hbh32gd4Fsr0akWOo4YLwtk9wQXML0G7+mq6Z2X7VevvsECrE4wTQAfrm6oykRlbQM2vY4MEzDn6Vb1ZuoinSaHpiM4JI+OC5k2l4d9pSUlB25puXkG5bEsmRy0bTXzgGWqQip3SP+w0dSbZ9rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769660969; c=relaxed/simple;
	bh=umLeoIezuuzWDN9KcyKP6hmewbYcA3GAdo8L2bv2ZrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m7EL5h7qLIrkTuqo/wNMAhv1LxgpakjyTx3toMxlvhVa/Q5w6tHUEDRJPo0HOGPuSHXLjhG3CbY0HytGzWIcS7pwCau5+H8Yep+dvUhQvmp+7iRMTC9pF6m8YbHdKpoO48Z3/oRleTbkahQzL7c0nVKvsmgbUl5rbHBXs2+mw7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEZmZW3f; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEZmZW3f"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so3884115e9.3
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 20:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769660966; x=1770265766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLsfEdXp1ghYI/zV3x1liW6kVNIuPDvLp5lPLO4doYE=;
        b=DEZmZW3fUJQ7bq079L+ff2keiXQu2bn+sINl8d8CRmkEjJzv08SmbFHhuj0D0GugGp
         pynmdOVFcKctXahKw7mZpINs5/SUQVg8A50ThabYh96p3v/FaG6OQAEsd2PkGcbkXz81
         OAFDZBuHSrNpOXPXrQDCS+odkD+9LBTspDLx9uVHr0We4A+/mVkSrM/OF/k9APYMpnT0
         WrMjPQRXapJBWJXUCvEK4yeKJhC0dvtziciN2zKB27To5CPPxoh+Koiem8hg/cey1D2P
         fRqma7F7veHTDAVRYJ9/zqDkDgvipmMiL0vPDXSwY/aosl13eNoKdhCEI+yBvR4bnzAs
         83tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769660966; x=1770265766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLsfEdXp1ghYI/zV3x1liW6kVNIuPDvLp5lPLO4doYE=;
        b=omSK2ahlpkN3uU3Jlw4n9it83+Ge2gWKZNtyK6B0rkTBsgYg922Or5Pxlacz/mpr4m
         lDo2q/I8h6v+5kvegSATsPEjAvx0uvFAk+P0UDdHLV7RsIF3vXKi6tKqqS15K8dQ1OWv
         hrghvaSjI9H/Mv/6efT6JtUHnEjAqzJ8Ujh1zhzlsGxtPcQJ2Y7yO8zu3yHL8sGNBW8w
         aFnMwlAzmOJtU8nBjpryXePkYog/jiRoy+gwGZMkxZr6WGCzL4wEH4IVNbSWhxPNnbec
         lsr9CoSWYhiOGK8AlC+7NKrlnVm4w+3PgJAwlH85q76lPH6rGYJUKs19Zw5Pa1CmSnQd
         13LA==
X-Forwarded-Encrypted: i=1; AJvYcCUXkT6kEE3C7b1pbUeyhqkROf8IEmK3ScWLHgmGLeXEGLwSHGVBjRCac6rYG5Lb+kw5lY8G0071mA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJfgQqJN/aAmpaKFuVoVlJVHzvSgYgS/X3AkIwhLDtXas60hKz
	AEkjV5Ngc4sh/w2oXI3Cm+M3r/09iCTCOsVzlJZwOiZcnRcQkDWa5xE=
X-Gm-Gg: AZuq6aJQkNPKvv4/jwoI4Tk1X7OSHf0lP/oqHlIhv7ztvouiUenlEYxR3JYyUp+OpEE
	OctsixvJ++N6W78ZsFfehgwPxYNd9G6R7rUxMZeeF8eNHbqLHZ5oXom+RdY96bSwSkRVS68Gi4O
	l/az3N/FZf8alvzS4CC8myVvPUQWJYIJjDmm+1bJKBarBnU7BGl2b0HtMvzdEEWUwLfo0UsD4wV
	LEvxxAowQmgfOKan3o5I0DkILPKlTO/X+m6eeySX2w4pEvlb5kC3ueqDSDpxyBvLgiBKgasArbM
	IJJzFotsrRWzONA51ilQIAmLs/qBHc/zlhKmIaLDTBrlljEyy6c+iJjnVNnu1GA0SFtDx6fB7kQ
	Ul0yGEASjGPTq6Yhzzha8+ZVkZ24dNwifBPrCqFCA+as0H5C26rtvQgwko4WPpa16it5uUh0hgP
	Uw/Y+u
X-Received: by 2002:a05:600c:468c:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-48069c54167mr87577045e9.20.1769660965693;
        Wed, 28 Jan 2026 20:29:25 -0800 (PST)
Received: from localhost ([2a02:169:c218:1:5130:f7b6:9c17:fb83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e474csm11650096f8f.2.2026.01.28.20.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 20:29:23 -0800 (PST)
From: Tomas Hlavacek <tmshlvck@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dlan@kernel.org,
	wangruikang@iscas.ac.cn,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] net: spacemit: k1-emac: fix jumbo frame support
Date: Thu, 29 Jan 2026 05:29:08 +0100
Message-ID: <20260129042908.410326-1-tmshlvck@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver never programs the MAC frame size and jabber registers,
causing the hardware to reject frames larger than the default 1518
bytes even when larger DMA buffers are allocated.

Program MAC_MAXIMUM_FRAME_SIZE, MAC_TRANSMIT_JABBER_SIZE, and
MAC_RECEIVE_JABBER_SIZE based on the configured MTU. Also fix the
maximum buffer size from 4096 to 4095, since the descriptor buffer
size field is only 12 bits. Account for double VLAN tags in frame
size calculations.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Cc: stable@vger.kernel.org
Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
---
v3:
- Set all three frame/jabber registers, fix 12-bit buffer size field
  overflow, use actual frame size with VLAN headroom consistently.

v2: https://lore.kernel.org/netdev/20260126171449.83288-1-tmshlvck@gmail.com/
- Added Fixes tag and Cc stable.

v1: https://lore.kernel.org/netdev/20260126135919.77168-1-tmshlvck@gmail.com/
---
 drivers/net/ethernet/spacemit/k1_emac.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 220eb5ce7583..cd6879d7434c 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
+#include <linux/if_vlan.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -38,7 +39,7 @@
 
 #define EMAC_DEFAULT_BUFSIZE		1536
 #define EMAC_RX_BUF_2K			2048
-#define EMAC_RX_BUF_4K			4096
+#define EMAC_RX_BUF_MAX			FIELD_MAX(RX_DESC_1_BUFFER_SIZE_1_MASK)
 
 /* Tuning parameters from SpacemiT */
 #define EMAC_TX_FRAMES			64
@@ -202,8 +203,7 @@ static void emac_init_hw(struct emac_priv *priv)
 {
 	/* Destination address for 802.3x Ethernet flow control */
 	u8 fc_dest_addr[ETH_ALEN] = { 0x01, 0x80, 0xc2, 0x00, 0x00, 0x01 };
-
-	u32 rxirq = 0, dma = 0;
+	u32 rxirq = 0, dma = 0, frame_sz;
 
 	regmap_set_bits(priv->regmap_apmu,
 			priv->regmap_apmu_offset + APMU_EMAC_CTRL_REG,
@@ -228,6 +228,15 @@ static void emac_init_hw(struct emac_priv *priv)
 		DEFAULT_TX_THRESHOLD);
 	emac_wr(priv, MAC_RECEIVE_PACKET_START_THRESHOLD, DEFAULT_RX_THRESHOLD);
 
+	/* Set maximum frame size and jabber size based on configured MTU,
+	 * accounting for Ethernet header, double VLAN tags, and FCS.
+	 */
+	frame_sz = priv->ndev->mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN;
+
+	emac_wr(priv, MAC_MAXIMUM_FRAME_SIZE, frame_sz);
+	emac_wr(priv, MAC_TRANSMIT_JABBER_SIZE, frame_sz);
+	emac_wr(priv, MAC_RECEIVE_JABBER_SIZE, frame_sz);
+
 	/* Configure flow control (enabled in emac_adjust_link() later) */
 	emac_set_mac_addr_reg(priv, fc_dest_addr, MAC_FC_SOURCE_ADDRESS_HIGH);
 	emac_wr(priv, MAC_FC_PAUSE_HIGH_THRESHOLD, DEFAULT_FC_FIFO_HIGH);
@@ -924,14 +933,14 @@ static int emac_change_mtu(struct net_device *ndev, int mtu)
 		return -EBUSY;
 	}
 
-	frame_len = mtu + ETH_HLEN + ETH_FCS_LEN;
+	frame_len = mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN;
 
 	if (frame_len <= EMAC_DEFAULT_BUFSIZE)
 		priv->dma_buf_sz = EMAC_DEFAULT_BUFSIZE;
 	else if (frame_len <= EMAC_RX_BUF_2K)
 		priv->dma_buf_sz = EMAC_RX_BUF_2K;
 	else
-		priv->dma_buf_sz = EMAC_RX_BUF_4K;
+		priv->dma_buf_sz = EMAC_RX_BUF_MAX;
 
 	ndev->mtu = mtu;
 
@@ -2005,7 +2014,7 @@ static int emac_probe(struct platform_device *pdev)
 	ndev->hw_features = NETIF_F_SG;
 	ndev->features |= ndev->hw_features;
 
-	ndev->max_mtu = EMAC_RX_BUF_4K - (ETH_HLEN + ETH_FCS_LEN);
+	ndev->max_mtu = EMAC_RX_BUF_MAX - (ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN);
 	ndev->pcpu_stat_type = NETDEV_PCPU_STAT_DSTATS;
 
 	priv = netdev_priv(ndev);
-- 
2.52.0

