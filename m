Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8ED37F73D
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256734; cv=pass; b=jXDmK2+FG1aAtboHPQ5zjw4Pf8C3eRzLhztvWFYRClbQPYG7I1GagFCwcwEKIT+rSzGytfrmA/cnPmKQYRZcyOK7z7OJLp+ZJPmh/b6rktufWzwQxtJgkAzCYzA/euLHZhRD3WO+0gUrcl50t8AUIvDrvApdMBmUBZ+oQfgrQJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256734; c=relaxed/simple;
	bh=Frwc2MvlAbiznnBizEt3nogB6Czp3WvfAsigHEMPLrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOsh+FDc3rMBGrXNTtjVJTqg0wEGsToGnYwE77/P/VEToS+pYMAEZYTiC3z3c/ZJVkrUGopAGyYkyh7fNK8YzlFxGgHwe0Abb2ipELlU+3mSlVx0u1bkzsLucepU20f0Huc4HYAoxqtAPqUHF8OlF2QPN1vRpDt5xfmgcuWrIc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=hIa0/GIm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="hIa0/GIm"
ARC-Seal: i=1; a=rsa-sha256; t=1785256724; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AlcWADz0Xgy6+LecD2pBXRCkAy7D3qtsEiNmlMiOPkY9b/otXsqo2/wv3bV5ZRrDzqKff4/18VKQDckF507sIfu8oO8pYZh6482KLFzNkE7napic/EvSzIhE+Ao003lOF3SEWc8eYDcQBEn6qTN0xPGyEhzhv9FUCK8Uttw+gCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256724; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lxY+NrD/rzbPBVjPgMOtBmqkSRWTvKCDGdud8uIOw2U=; 
	b=SKaaMiorhjblvbHFw+dJtct3dl+P6Js0zV4pqWQWgTRo/ZfNBTVwtvTbncudW5SrVRQhAOT3SUs0DtpIInoEJlA6veJR534k6yGyMY4I36DezuHnY3HTnC/ZJVIKaQ9d0wCQWaW7k3EuwAEhm8RD5OC0XzU/YKemiYYUTSpbjcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256724;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lxY+NrD/rzbPBVjPgMOtBmqkSRWTvKCDGdud8uIOw2U=;
	b=hIa0/GImo+pROQ6kGFkWDDp3owmh5n3exQldD1y0p0eGSWSjZuYqbunZXrxL+k9L
	VQzIu11KYSsSNyywPWf3aHwLZe1yQRjvGELlF4LM1WJI9cgFMb7ShNzi0HpEsRawCzn
	iQhQRPSrn7Q2tv5A9lFt7w2nQwPUYeFzN+Ws6Roc=
Received: by mx.zohomail.com with SMTPS id 1785256722707281.91982650070634;
	Tue, 28 Jul 2026 09:38:42 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:31 +0800
Subject: [PATCH RFC 5/7] irqchip/aclint-sswi: Add generic riscv,aclint-sswi
 match
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-k3-aclint-v1-5-aef88614d3a5@pigmoral.tech>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
In-Reply-To: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=Frwc2MvlAbiznnBizEt3nogB6Czp3WvfAsigHEMPLrg=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybl0/ycgSNnvytmOyStk/f3O1dgrrXWLs2TWlXbDO/
 t7OE5pXO0pZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZhImygjw96Ga9nPhDg2vVli
 EsIusGmtbMHvN5eXCW97ecZ//r0r0q8Y/lfkTj23SXl9CivP/dQ/ndtDZD+Yd15P2yHMrl+dKfe
 7gRMA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add match entry for the generic "riscv,aclint-sswi" compatible string.
This allows future SoCs with standard ACLINT SSWI implementations to
directly reuse the driver via the generic fallback compatible (at least
until hardware-specific quirks are identified).

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/irqchip/irq-aclint-sswi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ca06efd86fa1..2bd40c3ea288 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
 }
 IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
 IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
+IRQCHIP_DECLARE(riscv_sswi, "riscv,aclint-sswi", generic_aclint_sswi_early_probe);
 
 /* THEAD variant */
 #define THEAD_C9XX_CSR_SXSTATUS			0x5c0

-- 
2.55.0

