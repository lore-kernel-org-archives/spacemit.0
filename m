Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE7C361670
	for <spacemit@lists.linux.dev>; Sat, 19 Sep 2026 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845593; cv=none; b=anEyEXjb7BvjH/vlOL0GYFVIxNGQ2fMAb369os4s953WXTgHZTwwDn5xlr/C94VActlOa7oYqLYx0PYXUd0yE0D49MT95iV0FDRdpo7urIfsQhjkEkHrzppsSe0RAMydJFIAoFBmnxjASgBCAyOQ+5S3b0DBG3Q+N+v0szlsxGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845593; c=relaxed/simple;
	bh=7eA14pkMyRijHLSluOg7mImGg2JgMqno00/5HbUy+ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJxv14O/udee7htOGTFbBYFcsxeSPaf94Dzi9W8zCff5oulVlFOhbkMQY1dEd5q01s/B4WVfIeiOaGw9+om1JYxgPpUb1UJdUt4p9j+IWyKoaY+GJq88BGqVjbNK/Ckxismnt1kfB5RzSsFcf6rOT9hlQKrmVAEfKYrZCyGaTSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOyumWUL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOyumWUL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so606056f8f.1
        for <spacemit@lists.linux.dev>; Sat, 19 Sep 2026 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845589; x=1790450389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNn5LfmzIp0Qiso4NKlxppBej7z4xYBUzlf1B0pA+mk=;
        b=pOyumWULOUXyFhYRn44KEQ2CJpphUx6h/pbOKQ12fmu8WCMxULrw+GX1FIk43Uzhbl
         4ZAVqBQtb6Lnim6ZC0py3T06BAuPyfEzOyEbz51zjn34dFfkwqcqHFvPreUYBgslF7tF
         I17j8QsxldESecF49v3BSmPBc3JLKJ1uLm8KlOsfrPCALrb3bWf6T63P0SUpQBliXJ9F
         Tr23DUnPmJJWFNB+APhddGKKT0AlXbBCjP2OczHwf44Ke2Tvn0Hq/IaidcFvYTsQkk1y
         eJ8iozGTFW7Z/q+CTJWbd2lSpS8pCMmJbBiWev4v/Jf10mOkucxr9gUAyIAhyVsFt+OW
         S4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845589; x=1790450389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNn5LfmzIp0Qiso4NKlxppBej7z4xYBUzlf1B0pA+mk=;
        b=MWzoE+Bj30oWqILOnT7IVHYVGdpl5Hedp0qS4jfRdX2+WB58uxCH23zr/Zc6kRFxxo
         adEBlh7/PQMjySy1dp73Vhj1wuSvDRx3h5V4KTCEFtqHOqDoNkgxD1YqoS0Kg2mjdPj1
         5BCIVy7HG+aW7ZuO+6SnC7wr3oXYMPnRq/388+i4aAfky80939rbNR6q/c2RzyRZrl7B
         /XmM+UJHIkuGs/08E1V6loXFSYodxBNCWDyqBV7y5bGqMMnM3vme0W2uSLEwI5ySrDKz
         oApKE9A/HYOktWC5+jwDO6NxiSL/0nWtQc+aS/3D/r0ytl+HjpoyK8Xzj8Myi3SQ6sD3
         VuFw==
X-Forwarded-Encrypted: i=1; AKwUvBx5PVVUOpjJOnC1HX6wRB0HUL/M7e6uEpFM+hM62GGaxloGt7hmB2rOZlV6m2QBev4FlylKStCt5w==@lists.linux.dev
X-Gm-Message-State: AFuF++nty8wDz4MLxd2kZdOY1PwVgY1SiNrpXZrar2dp0SQmTbubq0bg
	izwYuEuPodSfCXHv3ibB5awWDS1emy8c8Z7AySvZ0eGLil4Z4R7v/jOw
X-Gm-Gg: AYBFou2VQ3wxVHcDeB8LenO0jlNIURfAhOglFsR1jDUXderjkLhs4eBx+i2bMVLDTxh
	TMQQlG31ot+KOtJep5ipBfJhGM48Ro1uTGNXy/O0NP27oj9WUdaSy2wrNFgAZkfG3X4dB2XuPeJ
	bkBQkiNFJ3IL/fusP309soagL2FG9bsaLdl5W2NMnyDxt4NNQVi5hd9sl/wxKnCheMrlYlsTvRS
	y7Eei9e6ACRtyI3T0OuFsUIP+/cxnT63kvKbbRTOF30h8Mtf0Rtrx9No3bazcSytC6ve/SJizLf
	zaE5Wr4UwKY0SsBafmVGhvDL8RXkck7awnYvjdKTnJnPDwrwDcapPTFyZQgF34uC3ai36NP/zGc
	Dd4DcJ6TRFbPf7bk1m2qYX067QBWCxeGJTPfuqkkN0EmwRfBh2DHWzH9gRzuz/cCXjEYbcEKxtl
	ppu11MQg+6OCN78A8sIa/djIC2FqVvL4878wneFZNdUsCL7mIvsNW5oFUCB2ipD3aFfwoA2DQdk
	EoMZ6sW2rfYxcpZAkWRaBKxBZ2LM7lIkp8MepITrzsuAFTzzFWk
X-Received: by 2002:a05:6000:41cb:b0:486:fed6:d7e with SMTP id ffacd0b85a97d-4871db11bbfmr10180389f8f.22.1789845589033;
        Sat, 19 Sep 2026 12:19:49 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724593bbfsm8097078f8f.27.2026.09.19.12.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:19:48 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: andrew+netdev@lunn.ch
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dlan@kernel.org,
	wangruikang@iscas.ac.cn,
	vadim.fedorenko@linux.dev,
	maxime.chevallier@bootlin.com,
	troy.mitchell@linux.spacemit.com,
	netdev@vger.kernel.org,
	linux-riscv@infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] net: spacemit: clear TX descriptor on fragment mapping failure
Date: Sun, 20 Sep 2026 00:19:37 +0500
Message-ID: <20260919191937.271202-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

emac_tx_mem_map() writes TX_DESC_0_OWN into the ring descriptor for
every slot beyond old_head as soon as that slot's memset()'d local
copy is committed with "*tx_desc_addr = tx_desc", i.e. before the
buffers for that slot have necessarily all been mapped successfully.
If emac_tx_map_frag() then fails on a later fragment, the err_free_skb
path calls emac_free_tx_buf() to unmap and drop the skb, but leaves
the already-written descriptor memory untouched, and tx_ring->head is
never advanced past old_head (the "tx_ring->head = head" store is
skipped by the goto).

So a slot between old_head and the rolled-back head can be left with
TX_DESC_0_OWN set and buffer_addr_{1,2} pointing at DMA mappings that
emac_free_tx_buf() just tore down, while software considers that slot
free again. The next successful emac_tx_mem_map() call only rebuilds
old_head itself; if the DMA engine auto-advances into the following
descriptor once it finishes old_head's packet, it will fetch that
stale, already-unmapped address.

emac_tx_clean_desc() already treats emac_free_tx_buf() and clearing
the descriptor as a pair when reclaiming completed descriptors; do
the same in the mapping failure path.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index f7f16397a2c2..d641ac26a1e8 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -803,6 +803,9 @@ static void emac_tx_mem_map(struct emac_priv *priv, struct sk_buff *skb)
 	while (i != head) {
 		emac_free_tx_buf(priv, i);
 
+		tx_desc_addr = &((struct emac_desc *)tx_ring->desc_addr)[i];
+		memset(tx_desc_addr, 0, sizeof(*tx_desc_addr));
+
 		if (++i == tx_ring->total_cnt)
 			i = 0;
 	}
-- 
2.55.0

