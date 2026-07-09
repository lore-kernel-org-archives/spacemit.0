Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94443E4C70
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590891; cv=none; b=e9wV1bilDIBmZy7qnXItebaDAcfXVA/npbeeCs5IaYCF7Ei/jZCYT/BNbwkjAdtKOLrS+pMwAPv0pq0OvT7GVxGU/3rM4WXq64FCKH9GW7Ww6ETx4lcCpzUOLbP9rLPS2u4X0OFt0OQhLqnb9o2VgLug06I5s98G3ey30eZGte4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590891; c=relaxed/simple;
	bh=DsM/VOtxUEEMvGQRQ5EKrlk10ZKhKeuMUg82hGLFFv4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YTDirLBbrf/iqNjj+FoD9YqA8nsAOVvPYWPBIdBkQGQpJY5IClVgcDq4AMm3qJUtMevUDWpVPnB63Vyr3hdcQKE8tzN0vvTbnqYCktsI2jyDCWoi54R4D8GsMO1vNkoiXZpasK7VO4oPciAHEQ+i+iJOetKMjx1D+PxqayEXIuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 307b4fe27b7c11f1aa26b74ffac11d73-20260709
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:06dcd722-c7f1-4258-812e-564d68123145,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:cfee955500d6a5b5be8fc46701b4f8ad,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 307b4fe27b7c11f1aa26b74ffac11d73-20260709
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1940864867; Thu, 09 Jul 2026 17:54:34 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: troy.mitchell@linux.spacemit.com,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] i2c: spacemit: fix spurious IRQ handling returning IRQ_HANDLED
Date: Thu,  9 Jul 2026 17:54:31 +0800
Message-Id: <aaba8ba228a99f580050004c5b7e262d855de44c.1783590752.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the interrupt status register reads zero (no interrupt pending
from this device), the handler should return IRQ_NONE. Returning
IRQ_HANDLED incorrectly claims the interrupt was serviced, which can
prevent other devices sharing the same IRQ line from receiving their
interrupts.

Fix this by returning IRQ_NONE instead of IRQ_HANDLED when the
status register is zero.

Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index c2d090f6ba80..487f23fde725 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -728,7 +728,7 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 
 	status = readl(i2c->base + SPACEMIT_ISR);
 	if (!status)
-		return IRQ_HANDLED;
+		return IRQ_NONE;
 
 	i2c->status = status;
 
-- 
2.25.1

