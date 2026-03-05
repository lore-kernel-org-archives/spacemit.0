Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB5B2E6CA8
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 06:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772692802; cv=none; b=mG0VAWIflqXMuYbQHkliRioPOfe/Cmk5CwFHmgQeMrBjTGuT1IZ2D46nVlBKzam1Bc+e8jt55DY7M4xWDCLYcj8EoDBlPWNNqJpFm0yBb6UkoYv31oe2msl7u9zD5+YS8pYj6MEQOTChebVUwVGx96GE3VrfAESovOBhWdoD2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772692802; c=relaxed/simple;
	bh=67EEYkV9nesdrtL+J3bukmoV93P03pyLoCKDk/FLkxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvdfBT5pNoXx+ItXW6rhN0JCv+W3azrRIbTQ+kX2LPvOhvxVDg5EPj+pr8OzW5fOtIKPP5LRTJFlJY29f5JZaaEHahvtsu+3HnsLaZL7YoT+69L6bRRwAoakBKVVXbCNhH/tPTX/tmwWJ0oI5iY+0yTo6xvWZW90Sj7L14PaJfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAXqg01JalpW7+uCQ--.48975S3;
	Thu, 05 Mar 2026 14:39:49 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Thu, 05 Mar 2026 14:39:38 +0800
Subject: [PATCH net v2 1/2] net: spacemit: Fix error handling in
 emac_alloc_rx_desc_buffers()
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-k1-ethernet-more-fixes-v2-1-e4e434d65055@iscas.ac.cn>
References: <20260305-k1-ethernet-more-fixes-v2-0-e4e434d65055@iscas.ac.cn>
In-Reply-To: <20260305-k1-ethernet-more-fixes-v2-0-e4e434d65055@iscas.ac.cn>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CM-TRANSID:zQCowAAXqg01JalpW7+uCQ--.48975S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW7ZFykGryUXr17JF15XFb_yoW8GFWDpr
	Wj9as3Gwn7XF4Yk3Z7Jr4xXws5Aay0qFyruay0yw4Fv3ZIkF1jgF4rt3W3Jr48urZ7XF4S
	vr4UZw13GF1DZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRHKZtUUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Even if we get a dma_mapping_error() while mapping an RX buffer, we
should still update rx_ring->head to ensure that the buffers we were
able to allocate and map are used. Fix this by breaking out to the
existing code after the loop, analogous to the existing handling for skb
allocation failure.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 338a2637b1da..5a5cb61be08c 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -565,7 +565,9 @@ static void emac_alloc_rx_desc_buffers(struct emac_priv *priv)
 						  DMA_FROM_DEVICE);
 		if (dma_mapping_error(&priv->pdev->dev, rx_buf->dma_addr)) {
 			dev_err_ratelimited(&ndev->dev, "Mapping skb failed\n");
-			goto err_free_skb;
+			dev_kfree_skb_any(skb);
+			rx_buf->skb = NULL;
+			break;
 		}
 
 		rx_desc_addr = &((struct emac_desc *)rx_ring->desc_addr)[i];
@@ -590,10 +592,6 @@ static void emac_alloc_rx_desc_buffers(struct emac_priv *priv)
 
 	rx_ring->head = i;
 	return;
-
-err_free_skb:
-	dev_kfree_skb_any(skb);
-	rx_buf->skb = NULL;
 }
 
 /* Returns number of packets received */

-- 
2.53.0

