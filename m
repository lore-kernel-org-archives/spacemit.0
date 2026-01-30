Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71F35CB7B
	for <spacemit@lists.linux.dev>; Fri, 30 Jan 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768587; cv=none; b=jz1ZBgWfC5Xn9scadtT5cESicMn+PMZi061bglKM1p/LifYj9sgbe/9/mTEN01L2bse7Ad2PTOSHItwpcQsf9neOW69lSdSFr2oRgaYcB5zL8eUqJKXhNbQs+ksdGkC4pTw2FpzUO2VhAUOY2jPEfM156sppsRxLtx5tPtONQUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768587; c=relaxed/simple;
	bh=umLeoIezuuzWDN9KcyKP6hmewbYcA3GAdo8L2bv2ZrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpZA1u+gyUkgTkhApnbXe+vHm2j8JpHh27Xx+8l9kYdT5oJ15DzBiKoJKDoqr/AeHdPXOuI0Y9ndE98zcbNv69N5QPUTMoFwHhHRGLLajNCoHkFKMvPwlnXnHO8l/HeMnu6dk6J/55fZuIrHAU3BNRfdG4ne/wFFRwu9ekG0jK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ka+5zxTc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ka+5zxTc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806bf39419so19007735e9.1
        for <spacemit@lists.linux.dev>; Fri, 30 Jan 2026 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769768584; x=1770373384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLsfEdXp1ghYI/zV3x1liW6kVNIuPDvLp5lPLO4doYE=;
        b=Ka+5zxTcEfFVNpUe8R6LaneSXqJOJjFJd8e25MBErun636PcTxkBglD6YhhkJqhjxF
         QAB0NZTbU7TZW5mWwjBCGIGY96ExJ/tDILJOlcqY+4JEFD0Og5jkcG4ndd1RhLs27iq1
         GMdZKGj5e3aSwX1Jc/NAcMNCvysiCRZ/U4T76ExB2IH4zzBD8G6Uq1cJdPhbwolel/61
         dQG6PDJQnYmCpkwTK7CWmjA5kL911BHdcLJzCyQwDLheaJEtXtCw7yA1PK8Hjj9v/jUL
         fyed6YDsqUloi0hgbeLrwijBNsuuBhhkCkUDOXQjTpFFPGwwEIRI/lt6+pmk0QLLdaa7
         ZmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768584; x=1770373384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLsfEdXp1ghYI/zV3x1liW6kVNIuPDvLp5lPLO4doYE=;
        b=K8+kSgR0eMY5PkoFpj165pGuOgrKJFwEknxwub63OIS4EqAl1Gm5m2XsXm9ZOioblG
         iUdMWs3Z+jMZmAiGcrUE5P5rqZmfSf+cJWvc/VIG57lJvJMz1F/WXS5vzTSl+NtGTAEq
         mbhutftbfdKziXFAGSIy/WQkOnUk2NJCUXNaQtOa7+3Rsasa6pGafWDHuCaE/7CDg1uK
         nIbFS9mfiMf/ilzqcR6xfcrApniGy1ypWt/PB1vQ48zkVULOItEifEbpviiZ6dBv1h++
         0Q25vvL0T/H/xjhf7z2huCdm5nAGnL2m/xdKDftLTCBeE27rHJpOhw2+Hw4b4YVymUFT
         jkUg==
X-Forwarded-Encrypted: i=1; AJvYcCWtAsUbLC+eLYWHaSA7yO5sDoXjvQrd5j4LAHTShPBSixixqZ6ChSV2DQzU6iOK2rD1JaQmREKXlg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx44nd2g4Ef2q/BeK6E46smGStOYk69r14sLWbVF/wz89gR2UIi
	oDcAG1hT6drHnKO1md+M0PqLXkgbv5XJuYXyIh0WZW2GHres2SSaCOY=
X-Gm-Gg: AZuq6aKijbDlGZXRMAtcKvAMB77yNUTLc9teozZbobWTHVA3wcO6loVmNk2TG7+kTzt
	SW3+NtcxVlnu1XvwzJ16ax5Zq5s+iSRDtqjsvhOYhq2cmEhXczjm8kjatAR60Ap3VlQ09dV1an1
	nMIJbvKAhhwOkdc4vrjkYzwz8jG6yT6ccROtACYIyfiPYYcpXALQZXIQsCIWMhsh/XaEBK9lAVW
	CcFl2undLxacSGeHdYB6e0lmjhie4heAqKhtGfp+W0OcgIMADWrNeoxbh4K9IbEbAJeHRqublmq
	2Nb6/ZfzfH74FcZyoG6BciU1hMqX6EoehTZRN3hlRFXspTH6EI5oglMfpyNfPJ875Upm0pvp1cA
	pWdsapW5XPj2iv7aRM3BwBJ0QrA+4hnP/cK8Qi/U3+lyrQ6uZIULvSoV6yX6XAETNAjajdw+jna
	yGGRAg
X-Received: by 2002:a05:600c:354c:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-482db493a87mr25887295e9.15.1769768584156;
        Fri, 30 Jan 2026 02:23:04 -0800 (PST)
Received: from localhost ([2a02:169:c219:1:2541:8fc0:4fcf:ba6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffc0sm230093875e9.5.2026.01.30.02.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:23:03 -0800 (PST)
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
	stable@vger.kernel.org,
	Tomas Hlavacek <tmshlvck@gmail.com>
Subject: [PATCH net v3] net: spacemit: k1-emac: fix jumbo frame support
Date: Fri, 30 Jan 2026 11:23:01 +0100
Message-ID: <20260130102301.477514-1-tmshlvck@gmail.com>
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

