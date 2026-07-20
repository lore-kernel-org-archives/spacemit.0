Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053B42773E4
	for <spacemit@lists.linux.dev>; Mon, 20 Jul 2026 06:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527744; cv=none; b=RDx8EUr3oCxuNwHpaV6sm6vzJW2eZ53WCPwyI09Ol+j6ZOUeGfbEm3tkjbr5hCZprJjvdA878+FgNrV9XJ5qUVHzoKRPltU8EZA30GFBSwr1KmdRaICORUeVvL8DBGbwNhdRt04d7TBnKQHmUU1AotGU9nqwoiQRfQaK60G2HLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527744; c=relaxed/simple;
	bh=shwM1HefNRy+22KJus4v9+mMlFseAARmlnIc6f7Px/0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jbcTN5Lm/FjqiyVQ0JQpIU14TgRq0XUdkHhHdCVRAxU8JWHDEzf0kOuSaj/5ErTieI3uj81VFiFkPKw/LztSgDkrA6NgZw1zvw4cGXw6htCCZTXwijB6brfV2VbntoyKT7liHVm/Tl1jR1J9ovUnDynPvfp2/GJ9SG0xifnhVOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 79e38432840111f1aa26b74ffac11d73-20260720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:09729ee8-8961-4ba0-9221-0b71309cfb8e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:37a0819a3c3bafd5bb00b2b95efeecc3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 79e38432840111f1aa26b74ffac11d73-20260720
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 500305034; Mon, 20 Jul 2026 14:08:49 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	dlan@kernel.org,
	elder@riscstar.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 1/2] spi: spacemit: fix dangling TX DMA descriptor on RX prep failure
Date: Mon, 20 Jul 2026 14:08:43 +0800
Message-Id: <b402223ebff226782afd4c7da7db4ce34807f604.1784527556.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1784527556.git.xiaopei01@kylinos.cn>
References: <cover.1784527556.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In k1_spi_dma_one(), the TX DMA descriptor is submitted via
dmaengine_submit() before the RX descriptor is prepared.  If
k1_spi_dma_prep() fails for RX, the function jumps to the fallback
path without terminating the already-submitted TX descriptor.

So terminate the TX channel with dmaengine_terminate_sync() when RX
descriptor preparation fails.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-spacemit-k1.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 215fe66d27b4..cd2955949c5c 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -289,8 +289,10 @@ static int k1_spi_dma_one(struct spi_controller *host, struct spi_device *spi,
 
 	/* Prepare the RX descriptor and submit it */
 	desc = k1_spi_dma_prep(drv_data, transfer, false);
-	if (!desc)
+	if (!desc) {
+		dmaengine_terminate_sync(host->dma_tx);
 		goto fallback;
+	}
 
 	/* When RX is complete we also know TX has completed */
 	desc->callback = k1_spi_dma_callback;
-- 
2.25.1

