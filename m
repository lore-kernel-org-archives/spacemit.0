Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071383C1974
	for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713396; cv=none; b=NQHNfgHwVVW0Mc4yGi+iKElSHV0io9HHF092wqeUu/t3lMaw3wiWNDk2NqSQbHGd0WWSMg0z0PqbTM7hxwjh2oA+0hNNl07PLG45Rj3d6hSF9OsXcenc74e3r+VHjbLrc2jiay6PLkuX5nYQJlzBXMBL6+BWcI1TDhi7mXDFWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713396; c=relaxed/simple;
	bh=pDAbN96tUf4wV59tx9fGSz65rmt+fJIM7n7WWvf5Q6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W4OnYxosH6hLlSReuckhG42xRUboSfdd8WDt+INSs7Ky1Uy1BGTOkCktZozWCrb3NTImmpBgVBGVYZeHAY4AEF5ZbaIMbyhcaIHQ163+B8bl6WCG8dBkpqvjGYDr3ht2qZr/tW/jl/RgD4P+9HNkI5mUJvmr9HLXGkbS3b9RFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bdf39a9885b111f1aa26b74ffac11d73-20260722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:23cf166a-4ec7-4d78-bcc9-9abab6d1eadf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:82e04f2cc73d71d06bc394688386a4f5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bdf39a9885b111f1aa26b74ffac11d73-20260722
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 258169648; Wed, 22 Jul 2026 17:43:06 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] i2c: spacemit: request IRQ after controller initialization
Date: Wed, 22 Jul 2026 17:43:02 +0800
Message-Id: <20260722094302.2284191-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spacemit_i2c_probe() requests the IRQ before it enables the clocks, resets
the controller and runs init_completion(). If an interrupt is already
pending, the handler runs too early: it reads registers while the clocks
are still off and calls complete() on an uninitialized completion. Request
the IRQ after the controller and completion are initialized, but still
before the adapter is registered.

Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/i2c/busses/i2c-k1.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 51a0c3d80fc9..3fe716cc153d 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -723,11 +723,6 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (i2c->irq < 0)
 		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
 
-	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
-			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to request irq");
-
 	clk = devm_clk_get_enabled(dev, "func");
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
@@ -755,6 +750,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 
 	init_completion(&i2c->complete);
 
+	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
+			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq");
+
 	platform_set_drvdata(pdev, i2c);
 
 	ret = i2c_add_numbered_adapter(&i2c->adapt);
-- 
2.25.1

