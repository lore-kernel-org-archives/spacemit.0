Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07523380FF7
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256730; cv=pass; b=g+1ZzkWIJR9hUmknLFScEvRCtV/w2AW2xgcBjyLI2VCY+RZX1MxXW/rQhkA1JyVhACxPdXFgCLSkfhzjqaHQen3s6FEuk+RQIgwZH7wZp4QymX6SaFw483mIca5mxiYDKM0HEjpOBLnkEt1zMRMwZraz5N8DBIbSzu7eeqOfoPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256730; c=relaxed/simple;
	bh=nXwVHGNEMc38S57dTyE8iwYIHXDvTKlSFZlWaErD+uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XeA7nSsY99EQOqL4YpOnL4dRZJNnDYOk088zcB5u3RhVOOhQvqmfxlE7vUHRdwhKRU8MJHtEs3cgfw+Laps8iPOGUbVnG0yVPH8oYkA9FQDZlvoPCKUmLPLahNTyR5mHkw//mWzzFpDUog5BfdgoLbvf3GRXQA1fv+GHBOFr8fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=TPhHlZoD; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="TPhHlZoD"
ARC-Seal: i=1; a=rsa-sha256; t=1785256716; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dzRrFTmDuFDhWCSeO29UGkCY86sG6qgQsdAusMlX0YEdrwK1eUyNXY7JGgdTmHOjAUbanMaKKPeAozTYaOhXSsM3QTYTc3kG5CIW/Hcmk8xeg2lpF/J5gLzo1EKgZaS75ZkVee6ploBEdsrujVmmEiJFNq+R+atyKF7QbMdDUog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256716; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vNK07w4i28sJ0yvnkxA8bU9FVrodICj/zVtQdViMRps=; 
	b=d00qwRJYVOKr5DmeJizESxt9UsmkUYhmSQt9QsyhQfsUSXIvKQGyTfozu+xX+2H+55riDTA3dHh0amh8vwyhj7qxZ6d3nV952gqdy8pfQaecXpiT0FtOehh9FC0WdR8NaRqbIb/YTBnSP2YulvrlDRpTB566QEpjFOcX3V9mVs4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256716;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vNK07w4i28sJ0yvnkxA8bU9FVrodICj/zVtQdViMRps=;
	b=TPhHlZoD5Z+C6jD+ce7rVm4c1pxxO/YwV+Nua8ljKj7+Svi+IPtufgbYHhQFPRi/
	UqRtlk52xDayG1hdBPESE3WZHB9K6U5IBhLadb39ZRct62WoOzwEIIAVxnhOWCLJA0t
	4EteireQLAPiroKraGA4m18l+XnK5CQ6G7dkZ+QE=
Received: by mx.zohomail.com with SMTPS id 17852567144881008.9054051243619;
	Tue, 28 Jul 2026 09:38:34 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:30 +0800
Subject: [PATCH RFC 4/7] dt-bindings: timer: sifive,clint: Mark
 spacemit,k3-clint as deprecated
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-k3-aclint-v1-4-aef88614d3a5@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=nXwVHGNEMc38S57dTyE8iwYIHXDvTKlSFZlWaErD+uA=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybl25xtl9+bH+g+5PL9if+3Gem7+jZ/fJx5xcV9lOr
 6+5VNSl3lHKwiDGxSArpsjC5S/+z1qH59sRgdb7MHNYmUCGMHBxCsBELkgxMvxQWPtUX6p4y6nP
 HkFP7y9zbMjNfix/7b3B6ZX/d1W1ndBn+O9wwCz0/byj6oHrWs5Wfb+85qhwykmT3Ts8DK9r1ap
 GvWACAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The SpacemiT K3 SoC actually implements a full ACLINT interface rather
than a legacy CLINT interface. Deprecating this entry prevents improper
usage in device trees while maintaining backward compatibility.

Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 105e3ef539e6..bdb58f97c2e1 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -34,7 +34,6 @@ properties:
               - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
-              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
@@ -61,6 +60,10 @@ properties:
           - const: riscv,clint0
         deprecated: true
         description: For the QEMU virt machine only
+      - items:
+          - const: spacemit,k3-clint
+          - const: sifive,clint0
+        deprecated: true
 
     description:
       Should be "<vendor>,<chip>-clint", followed by "sifive,clint<version>"

-- 
2.55.0

