Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F1238C1B
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 00:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017025; cv=none; b=QK8NdGxnTa1a8+VuMP5Z7PIFmxOZoRr2ZDOO+i4CuKqAA/AYNfPEpukQhxkiCt1fyABDFVpTk6VengndfREiNKcQ1FEP4gPCYfsfpssrj3+dLqjIwkMlnHi6AhxtykIU/GUT057BKi5QeQIppsAJP0A5fo8rAPX2bMdmwnwu3LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017025; c=relaxed/simple;
	bh=hnJ30MhACPLAzazphFsNEYJjgsYJCLO8n/Kdkd54fAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFth0MDlAczA4DCDh9cuJdBs0HzQfA91XoFdMVkmZ9GXnhKXs66ZLY36F407tshSfdzN5EFwXWUE6Lgu6NlWBK4FjvAWqujazaRVwbkGNEAzkOTCC36l7gt/Vv7koskFul/gldJf1Z06f21JMCNkyt0wMq4dKZTtoPA7irltngY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbcrsIna; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbcrsIna"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82735a41920so4102639b3a.2
        for <spacemit@lists.linux.dev>; Sun, 08 Mar 2026 17:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017024; x=1773621824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=BbcrsInaA4KyPzcGM7CowIcUXK/waSzMqFgmVDeH3GKgbm9VhdQz6sBAmPNL6QGUiz
         QQs5mpQdBYG3nMc+BIb98LG7q67dvsEAU1L5o0QaxaPwUwwyjO0WBdcLA682y+SK2O69
         CjPBNxjhzCZUt2I1LMvs1q2oc8sY1dbvFdWjYZwvqx+RdVUigjvTUEcBIhSxfbknYh1N
         zdHwVYP+fRveRwQByNuCEAmCR3zQZRanyaMqG/8x1dF0oW1Tz1CZSdZXPq5U0pPBLC44
         Qa0cw3p5Rlm4+fRRTLHhvRtFw2B/CMUzKtRvv/bcdaXaczQ0BH3AMDNj0baTzVjECkEF
         rukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017024; x=1773621824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=g7ZvnHPcwUzT1Mv+8AkO3o0spVaQJ8dGCXCrgFPBaNLu+60qY89O8+CwL3gQg2hhGF
         JSYK3w93XrFA44XHT4nGHh2m31PtUHozPolHVC/XkFJPNsc+/qoRQGeA0nwooaeL67tD
         dmDsq+WqPd/Awp6U4AILYjXfaPITETkZEhWPeaqbWplQRlHhcIU9MKh9A0TqjIApbpC8
         T0gFvG422c+QWAODw2lxkmBB0MEhu5oYZF1jNFdpsSz48h4bgrvlKW/L0C68KQ7HVXWx
         UFfTBbrZGE9Y2KWPsKKy2bC1A53wZEEkW21kRDUbWftUruDWDOgM2cx4ztIA4zMOiIeK
         CT7w==
X-Forwarded-Encrypted: i=1; AJvYcCXcg1XOhtaeIw9vupPZfSWpLh0opsfQxE5fxv387rW7sB3A+OBSqn44VXaG4KHY29BLfUbjvH4TsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRdqwkaOczcW8C9so2QY50ir4kCeo78nMYImbFNpyG9WNlpruV
	+mGgGd0dlpOuPYlzhxqRElt/j9cZt9GsRR5P+ZvYahwT6nxGhueIb6vI
X-Gm-Gg: ATEYQzz377UbEhvnaFRvmvQxCsfmKFLOmVgnjWuG66hH5RDkyM2y9xOH+4S/js1IDaN
	MHcukRJY+DVUifJ3aqRLh2ldUTut8YNWIqHy2QfVDK4NPndXIohAOU4if9Nym0HJb5b34kcVCdK
	tM5TfEYT4wIW6/f1yyvVNLUDuJc12bKlD9KHynALSHJJmaAV2njN8QzfUkq9qRInK0g41uOUj32
	lpYM1uX0c5Ku9nrtHh6HJBiL791l5auHcovdLNir6SZyaptQnfDFsBzO3/z6CnQDWnDVMLTPyes
	0usWisYLyn5nNFtST1y4Aa3MU8FCeyhNmNGwYTKKW4Q/JtHWk1jt11N+nWGGrsr37T2jqTygjCR
	Lgjf8SbdURl5EJKS5C9gmphkor0d60xI1wOtms7o5tqp69aquxqJD3Au+Sk9RknSm/v3YFfsKlN
	8nZNNDHa4nmCDx+pTImYu8Kh0=
X-Received: by 2002:a05:6a00:1581:b0:829:a131:8318 with SMTP id d2e1a72fcca58-829a2f813f7mr6833727b3a.44.1773017023904;
        Sun, 08 Mar 2026 17:43:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4635d62sm8441226b3a.5.2026.03.08.17.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:43:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
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
Subject: [PATCH net-next v8 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Mon,  9 Mar 2026 08:42:42 +0800
Message-ID: <20260309004305.315018-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309004305.315018-1-inochiama@gmail.com>
References: <20260309004305.315018-1-inochiama@gmail.com>
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

