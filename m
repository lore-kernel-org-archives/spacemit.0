Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471314;
	b=2B11pNeJQqlGdqqXTS8/HBqV8g1Oft2Q0DDGObWSw8rMx5tbBLUpDq7dKeDu5X5rC8+p
	 FapvR7ekm1xJwXdlPRBar0+5qlMRFwQyxtK9/pyVDwrN1zO8PalhNsHjlLTxsJV/n0cmB
	 0Zd3KZpjShBvesnEDZhNU3eWGlDmbb0pY9f1y8Ka6yHEcT/S8DrWvfBbQcR5cjgQhZ9Wk
	 svx2xK/ZFEy37REn61GzpyfgD5lJFKHLEAiYmVQ5iA2JiLHmBpcej1ny6/JyvCwNxRbSR
	 LrA8LGhMzZK7bCQCfD0uuid5Qa11ktQhsGfupn0m7wGKsDADhomiqH2CEfAT+87yGog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471314;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fzZmTmGh6zxrlmuOofdQSMLS/zE4pvLqaLe8jBYsJAM=;
	b=GD7Vp39Kd/H21mle2HbG0WhdPdIjHmBN3yO0hOCf85CVBUzf0kJR6NNtzk3riQwjmQ2t
	 pzkPiq5Y8qTgyX1K5JgYFms9OUSo2Ki29xJtbV72Xek2muI4UVwgcQcYLc1pmCGXDjwxp
	 JWrPcgXlHD5H2MtqjFBDlb+MLKrAlVL36HB6mrh+N+NLdBWpycY7gtrDeAaRfE16eCWNo
	 mnmM5ZF1LM2CZ7JGxbzLboPEn0Nf0BoIHKQXrlyHXSgxJ6ZwpEs1H81QFc+QDS2jgXvj2
	 F+w9FjMGqLqZ7wTPVdqBZyJbZvcNLF+zmfLkqkzyjnIn/rap2nW4KGV1Gn/PjGYUB8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gXLagkCU;
	arc=none smtp.remote-ip=95.215.58.69
Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DCE606A8A6
	for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 08:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14DCE606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gXLagkCU
X-Envelope-To: spacemit@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ZSMnWkJIamVO8pDMKRsa4dzIAxKB5tL43vgFe5Xu4T8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471311; v=1; x=1795076111;
 b=gXLagkCUGSsqCj2xUVLmqydxY5ns028U1OGGU9MscR6wI0DnnJfZ+fpMXLf7UHblEP1VqfgF
 8FpXrPydqt/AKoCOhGQm3qoK6qlQNkQEmOQ12mviH5kTAH29HP03rJDr3Iduhup934W3FunAO9/
 +uYCmtMk76KB0+jXHbNmt2l8=
X-Envelope-To: spacemit@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id a198511cfc691750;
	Thu, 12 Nov 2026 08:15:11 +0000
X-Mizu-Trace-ID: a198511cfc691750
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Thu, 12 Nov 2026 08:14:42 +0000
Subject: [PATCH v3 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
 edge-triggered MSI sources
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-aplic-affinity-fix-v3-1-943d25cfbfad@linux.dev>
References: <20261112-aplic-affinity-fix-v3-0-943d25cfbfad@linux.dev>
In-Reply-To: <20261112-aplic-affinity-fix-v3-0-943d25cfbfad@linux.dev>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=ZSMnWkJIamVO8pDMKRsa4dzIAxKB5tL43vgFe5Xu4T8=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfSxu/JzzXca81PZ95Pr3nqqx429eG2vKfMX//Oe/ft
 KyUvTi6o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCLzEhgZNm0vqZZoDBeVjy29
 /fKm8ybDZwUH7cQenH2mX1d5l0niIsMfjheLa5T29b5Y+f9n3tTWH6ecbp8Kjf69KCWmRM/QQEq
 PEQA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

In MSI mode, all APLIC interrupts are handled by handle_fasteoi_irq().
For an edge-triggered source the APLIC forwards each edge as an MSI and
keeps no state after that, so an edge which the CPU side drops is lost.
After an affinity change, the next MSI can arrive on the new CPU while
the previous one is still being handled on the old CPU, and
handle_fasteoi_irq() then drops it.

The fasteoi flow also never calls irq_ack(), which is where IMSIC applies
an affinity change that was deferred while a previous vector move was in
flight. Such a change stays pending, and later affinity changes of the
interrupt only update the pending mask.

Use handle_edge_irq() for edge-triggered sources. It acknowledges the
interrupt before invoking the handler. If the interrupt is still in
progress on the previous target CPU, it either waits for it to complete
or marks it pending so that the handler runs again.

Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609f..5aa9607fbd83 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -69,6 +69,21 @@ static int aplic_msi_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (rc)
 		return rc;
+
+	/*
+	 * Edge-triggered sources are fire and forget, so they must be
+	 * acknowledged before the handler runs. The edge flow handler also
+	 * replays an interrupt which arrives while the previous one is
+	 * still being handled on another CPU after an affinity change.
+	 */
+	if (type & IRQ_TYPE_EDGE_BOTH) {
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_edge_irq, "edge");
+	} else {
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_fasteoi_irq, "fasteoi");
+	}
+
 	/*
 	 * Updating sourcecfg register for level-triggered interrupts
 	 * requires interrupt retriggering when APLIC is in MSI mode.

-- 
2.56.0

