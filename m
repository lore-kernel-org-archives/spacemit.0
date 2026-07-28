Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD870382287
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256747; cv=pass; b=AvDSn7sKnJYg/hLJhEQxTlL+Gxw0A/TrinPbtnvaa3qzkP+odyrbakO0SVh3LIFGhDzpULAR8NwCHGq2i45e0FT5MNOlaPnWUYELYWh0mmI+Qr15lk8sid9CxrVHIvnGVt1YemcoWdaWgc1NsKBYdLJ/Y1a4kisgxzZwTqlnSWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256747; c=relaxed/simple;
	bh=48Rep7MDs/3I3i34alcHAqQIXCCsXicgyRL/cnNNhes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ca8oczM63o1ohNwXJdpdMj08EDvBtqCduWTgmOY0B034RQasthel3i8e5za/r+1I2kQAloYGtcR1GZHP7qoJ5lCnLQPQVlD+lpHjc6bJOpq/+tPEBes0DwjTTxI0OqRXUBZkzDhP7q7ZNPEla8YVwCE3kY6BxEz6I/yy9IO304g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=k6yL/j7Y; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="k6yL/j7Y"
ARC-Seal: i=1; a=rsa-sha256; t=1785256736; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OHdNVI1+D32IEMmRk6uGL3/qHJ6q7a9G5okUexeZGtAl8eEa0Dh9qrFlZZ4SkLqIr6Szj46d6fwZ0bkDOdmPWyCTih2mklNTlZWGpApjMZq4kKq5gP2LpfqTULUc2cZxuutH4dpiFDoyN0U8+0Y4cbRs3fYdWkzYV/ugSq5lxEs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256736; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lX26IaWgGPv6AK4d/vdQmCNHyUuu0BetEpcY1cG4Ddg=; 
	b=nMuKx6PK2Q877DoxTS2nGqxTI4fx33hkFtFVE5uPNJyn4x+2H0QnePVRSHVFUDnMYbmN/P86knlp/gEMhZFl1Cma9/kaEgCHHttvLg5Sf21f0HJuPEom8K8nyf7XE4E7w8phTS65CBTy4YtLv8gLPybSFJ718DeRsNrJQWYFSUk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256736;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lX26IaWgGPv6AK4d/vdQmCNHyUuu0BetEpcY1cG4Ddg=;
	b=k6yL/j7YcMkb5TCuMsqLM2zmS8iIm7bkFYG57ub/w6KLymIAajqRoGhzWo0bZEdz
	h80VBYMUOZMR00akwd/mrwZa6JJ/XjAt7KY+Qdkfv2a0xESSXRCMY1SDPq2PeVLZOVZ
	vfj/ZrFtJjKG5E5jSsAxrRlvv3oeJOG51uN2S9hc=
Received: by mx.zohomail.com with SMTPS id 1785256733497346.2892460990995;
	Tue, 28 Jul 2026 09:38:53 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:32 +0800
Subject: [PATCH RFC 6/7] riscv: dts: spacemit: k3: Fix SSWI node
 misidentified as CLINT
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-k3-aclint-v1-6-aef88614d3a5@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=48Rep7MDs/3I3i34alcHAqQIXCCsXicgyRL/cnNNhes=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybt2un/Xx/KQrztcNcp/36Yg48MeIO1RdkfGP/X15i
 1JvBPvNjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACbyrpyRYc6BLAf/ONVp0vXN
 Uu56vhE7TXp2r/EMWLIgpNddUVhfgJGhOZknb+Etny15XcnaJa7NDRcmVHAUVZYfvnwp52f2SzU
 +AA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The previous Device Tree defined a legacy CLINT node at 0xe081c000.
However, this register space actually belongs to the ACLINT SSWI
controller. Correct the node definition and compatible string so that
SSWI functions properly.

The ACLINT SSWI device can be accessed at either 0xf181c000 (secure) or
0xe081c000 (non-secure). However, there is an efuse bit that controls
access to the secure alias: when enabled, it restricts access solely to
Machine mode. Therefore, the non-secure base address is chosen for the
kernel to drive SSWI reliably.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..5fb719f79467 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1261,17 +1261,15 @@ saplic: interrupt-controller@e0804000 {
 			riscv,num-sources = <512>;
 		};
 
-		clint: timer@e081c000 {
-			compatible = "spacemit,k3-clint", "sifive,clint0";
+		aclint_sswi: interrupt-controller@e081c000 {
+			compatible = "spacemit,k3-aclint-sswi", "riscv,aclint-sswi";
 			reg = <0x0 0xe081c000 0x0 0x4000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
-					      <&cpu1_intc 3>, <&cpu1_intc 7>,
-					      <&cpu2_intc 3>, <&cpu2_intc 7>,
-					      <&cpu3_intc 3>, <&cpu3_intc 7>,
-					      <&cpu4_intc 3>, <&cpu4_intc 7>,
-					      <&cpu5_intc 3>, <&cpu5_intc 7>,
-					      <&cpu6_intc 3>, <&cpu6_intc 7>,
-					      <&cpu7_intc 3>, <&cpu7_intc 7>;
+			#interrupt-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 1>, <&cpu1_intc 1>,
+					      <&cpu2_intc 1>, <&cpu3_intc 1>,
+					      <&cpu4_intc 1>, <&cpu5_intc 1>,
+					      <&cpu6_intc 1>, <&cpu7_intc 1>;
 		};
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */

-- 
2.55.0

