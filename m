Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C7421A457
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 01:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622866; cv=none; b=BMasSetjjVe/YBqbOxgBEH1yA5UDoKvTrqvVLqpFM8hAfgH/Q13TXKgxVzJgOBHutPWf/sNuYCp1PaaxN6zglhiJgaOlsy5YTf0NxV9on5seepaELsRRmpbVxcEl3GhitaSRAioDdvCfIL5Dd9BbF0DgWI1bYrVhzJ6PICf0v9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622866; c=relaxed/simple;
	bh=hnJ30MhACPLAzazphFsNEYJjgsYJCLO8n/Kdkd54fAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qe2n8trgB1SCrp0OFLDvf2DcsKMf3Qt53pG31sA0FeRSq6WfkK52sxnQqbO+Mx3iE2fDxgMXA7jdJcBCARmjXqAYJuCO8cKq6eTctLdDzzx1DiXDo/Oqnd7NFZnnHbDoVOM6g+gDwhHXpg09NAKL69d3uYBlqzt8kt/EdCz7ziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnrD9qbn; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnrD9qbn"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829b2019b39so2036509b3a.3
        for <spacemit@lists.linux.dev>; Sun, 15 Mar 2026 18:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622865; x=1774227665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=nnrD9qbnqk4Y2PU0EMCLcO/qQC2uDo25hZ6A4SBTkM3x4L4zh1Ap/DqxzEj712+dJo
         HIpGFfudFgt//z1iNKEg5z5s0qggoJgmvY99Ew8sEhmB3PaJ+TrJatYN9b1H3zF2u/Rh
         7MP6VQ1il6aLw2h5YGZChYeOMo0QTpGO3qI/s/h3uuiBHKwz2/y1nrXu09h9uxAgsxI3
         5Lhru+KxMg8FsrmEBvhx9PS8+DmjVOiuLjX15s3FOk0XDT0VD7VQHf3ni5gpmddS+XEw
         5T4Q4ifMrN7FwNNJiN8g7ayXP8olk0PrqVa6lcDNjcxwHCuXSqMCRTMZCaJfA7bzE+lq
         Fquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622865; x=1774227665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=hoQA1xNL1UYcSVnjttz2gkUup2ZYd/HKR8RFk9m/8BbWDUFdkhRfoece3s8tkdGwaS
         T1qAzhQyimLHHwEtezkTQjE8wRPZt+rEW9I3obM4lCUUDZw2Smzom9Yo+/J6I0vS6GWL
         iwWSJ3atLgJgeNqbIj53NA+5LIridENDA+Y+l2rX3DDesxJdoQ6aFlLxSn6jB/cFaLNz
         NpvHbAH6jozgiYPp1v9u0IMNuQ4woigvmclhezV6hklfgZjI2nUtJlWIu/2TS7g1AhO+
         aHmWnThdqs6f8jq7y78KVeRd5PLI5ZW3tKZDYGpntsECt5vW1lvFM4Wes4IzEJk+3vHu
         HKNA==
X-Forwarded-Encrypted: i=1; AJvYcCWocX2frjYfaMsE8EjK9ra+sOymIFfcZeWNNtYukiOl9BrYG5w1ggHKvz/7IqaRgGSFDV+I7aDJxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsHyQf0TvuhcCpYimtb5M/S64lRjvObFkeo0Rbmq4b6hJ3UxW3
	8mvu4oRFgFhuHltDbiUhfzoqPzTxeGfJi3VmNbC9TerA7bY8cHalx0aJ
X-Gm-Gg: ATEYQzzI3nnXWvaIyxShqgZPjOK7MyjSufo2ZvdKsY5uebVwB5AxSbQFuFvBPHofvZL
	mJu03qaSOhZfpyNo5qnI+r53CVKw2dGqAyF+37QR4JEF0yM4K5nobvxeSXvsnHJZOcvbfEKF7EP
	ihjy5uePebFwO21bg8kg4SbWyWgvY9lgd6s80OblhztRTz9ERD4+7hYSOd5sKeW8qfWOnUYofhP
	wp5oZYMTXQSuzejHR4rm0P7+Hb2SWnquRohrUwQl0wC7xWUYId5OhCDyk7YriNKWr2EyI7GHnlV
	HgpNuRQbsaiNtDwSYVZYYAccA5bC4t5/jpi2a1QSlJczC6RbJGZOJCuAjviaYg14OIeyQdPCYoK
	PWkfPO9OxC9uV1HSZQ7ubicxoVuv8xElyZQcFQ2WzVn4FPF87Bwn+aeJkSw2z4HlcEYc6/v3uBX
	Uv6iPG0ct4mxcD/ptf27MykTmicE1xqijfVw==
X-Received: by 2002:a05:6a00:1251:b0:824:3670:66b1 with SMTP id d2e1a72fcca58-82a1971ecffmr10178945b3a.28.1773622864545;
        Sun, 15 Mar 2026 18:01:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072414f8sm11598232b3a.4.2026.03.15.18.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:04 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v10 1/4] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Mon, 16 Mar 2026 09:00:37 +0800
Message-ID: <20260316010041.164360-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
MAC (version 5.40a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 38bc34dc4f09..98ebb6276bc6 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -109,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -656,6 +657,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..678eccf044f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: spacemit,k3-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: spacemit,k3-dwmac
+      - const: snps,dwmac-5.40a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC application clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: MAC interrupt
+      - description: MAC wake interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node which control the glue register
+          - description: offset of the control register
+          - description: offset of the dline register
+    description:
+      A phandle to syscon with offset to control registers for this MAC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+  - spacemit,apmu
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@cac80000 {
+      compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+      reg = <0xcac80000 0x2000>;
+      clocks = <&syscon_apmu 66>, <&syscon_apmu 68>,
+               <&syscon_apmu 69>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupts = <131 IRQ_TYPE_LEVEL_HIGH>, <276 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq", "eth_wake_irq";
+      phy-mode = "rgmii-id";
+      phy-handle = <&phy0>;
+      resets = <&syscon_apmu 67>;
+      reset-names = "stmmaceth";
+      spacemit,apmu = <&syscon_apmu 0x384 0x38c>;
+    };
-- 
2.53.0

