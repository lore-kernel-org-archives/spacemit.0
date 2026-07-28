Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166903812C2
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256761; cv=pass; b=FAEcOIyY1eRScHkmEAvpz5vJClx+zOkLb67ceXnnRKjnJOPn+NrG2xtDpPOiS37Y4ot0vO/2fxuG2ym4Z4bdTcWM1Q9y62VWsvJGh0cYuJdhZwjXGzhzzPIdXm10n/XddF3hz+9GmYAqGV/XM+rbD/58CLqIXZl5XFu85zUOYoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256761; c=relaxed/simple;
	bh=FN8Vnkhxoqla2OthuLvn5E8IS2SHFT42d30jgVTbcK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AN6DkGthhoEBn3ji7G6zR61sZQxTywAlThFWpSDe4QVG2K+6bXzoWfIwOnJwDHXT+PdAS089RW/GGoHojI7VuZBOEeby2dPo6+/jhkv5VwZOG07I3Yvpdc31Dtfgy7rmLT4fv08qM51SEnwzbsYTMwanoZQavIn8OkD8TB0JO+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=rBjNWlU6; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="rBjNWlU6"
ARC-Seal: i=1; a=rsa-sha256; t=1785256750; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BOZrot9dbb1uHAR9gWmq5se+r3KOMZs+yKLYt1L8X5LdzyDvG9twk8HdvFCoVuZ72kOukEePd5+JrWDz+/cNTbR+/dX07FCRdKpSjj2vsBqItAWwkRxb5Duub9gY9j4pAA76Rz+jVVBTElhhqnzr1opEkUJWM02lC2G1KxrUKvA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256750; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X2S+idwzoGger5xZU/BVBMwhfPT9h32JuWpjJHcVuJ0=; 
	b=Aj9UzEYcQxVEtVzDDy3BEITXP09w21P2crcHtpnydS05CK+YUfKBne/KSOme2ItJnvy9qiYg1CEyCaxwGuYopnzXIntiMGee6M35OxDj6iBHTaQu8IE4UIEuA4oq+FVfCYs9A9h9Rf0Ff+26IjvHN4nzHJ8/LoenD5cqsJapdrs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256750;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=X2S+idwzoGger5xZU/BVBMwhfPT9h32JuWpjJHcVuJ0=;
	b=rBjNWlU693oaZlircDdM47C+TGSeYHdyUKrGkJmWkpOc19OUo4MKzU1ccL3qznYJ
	9qOlRzKesu82W1dKSO+g7Yxfu8qFCpam5/aDvlZTblN/oBforXBo6J0JUtrrO2PnG0A
	tAk70QcSQdliyyQ1sNBOvjQXn3AzU9GKWcieKov0=
Received: by mx.zohomail.com with SMTPS id 1785256749033781.8640098721687;
	Tue, 28 Jul 2026 09:39:09 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:33 +0800
Subject: [PATCH RFC 7/7] riscv: dts: spacemit: k3: Add ACLINT MSWI and
 MTIMER nodes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-k3-aclint-v1-7-aef88614d3a5@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=FN8Vnkhxoqla2OthuLvn5E8IS2SHFT42d30jgVTbcK8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybt3b13fyfdaj/ZK1kx5raO+eH3nl7kOtntSuP18+N
 W6R96+w7yhlYRDjYpAVU2Th8hf/Z63D8+2IQOt9mDmsTCBDGLg4BWAiBj2MDB/2xaok3FkX4Ppc
 Npvl7tO7H7geLX1xwI/b6XztOsZjZ7gZ/pfEMr3xt3pq+H2Ni2/mcqVlz+Kfl65fvXLi9EjZAw2
 n9BgB
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The SpacemiT K3 SoC provides ACLINT MSWI and MTIMER controllers. Add
these nodes to complete the ACLINT description in the Device Tree for
M-mode firmware such as OpenSBI.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 5fb719f79467..ecb5f4fcd8fd 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1303,5 +1303,24 @@ maplic: interrupt-controller@f1800000 {
 			riscv,num-sources = <512>;
 			status = "reserved";
 		};
+
+		aclint_mswi: interrupt-controller@f1810000 {
+			compatible = "spacemit,k3-aclint-mswi", "riscv,aclint-mswi";
+			reg = <0x0 0xf1810000 0x0 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
+					      <&cpu2_intc 3>, <&cpu3_intc 3>,
+					      <&cpu4_intc 3>, <&cpu5_intc 3>,
+					      <&cpu6_intc 3>, <&cpu7_intc 3>;
+		};
+
+		aclint_mtimer: timer@f1814000 {
+			compatible = "spacemit,k3-aclint-mtimer", "riscv,aclint-mtimer";
+			reg = <0x0 0xf1814000 0x0 0x8000>;
+			reg-names = "mtimecmp";
+			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
+					      <&cpu2_intc 7>, <&cpu3_intc 7>,
+					      <&cpu4_intc 7>, <&cpu5_intc 7>,
+					      <&cpu6_intc 7>, <&cpu7_intc 7>;
+		};
 	};
 };

-- 
2.55.0

