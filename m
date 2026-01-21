Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EB5392B95
	for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986925; cv=none; b=sFz/RZVoKMp6rKTvUwlVeU+xJFqYiRP4bzvxS150HLk6TfDVOjhmjhDbb+XtzjHjO7BA1tNYI3C6WF8JYtpimiYLhU33XLhsHZMsuucFKkw7gDhI8azshSdoMUnMXdLetIauaATr/MC/VBF6tYfmjpz2pdjOQP2F/0UdgZPK8H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986925; c=relaxed/simple;
	bh=aI26termfloRMGA7Pr8/Ede7Zg+JV4cDdwVSFbO7ZC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVZnHGI2DRBBD7IbKACSuuhiBJ9N3IvmFVqAEmryAs26kl3RXuR42xahA1PXHbIjVBdHk1Mtr5OiOk1iVkzldwDXu48ddAno1lcz8yDiAy5UVYBLN99l8I/7Yrr2DSdkcOhkFxQfBrWzlJkrzhPiKJt2LfoL0KCfnVFRG4ua1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/FHk/D0; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/FHk/D0"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso4150588241.2
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 01:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768986921; x=1769591721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJLNhxpUuunLpKkwMWOBq42/DhYih3hY7Y23pMOtVm4=;
        b=R/FHk/D0mi1EOv3lZ+0c8Cyy8Cbc8mXsUzDpXIYPPJaDMrHUt86ko/tQwGdqBsAJo5
         nGXQ1TONqKlun+sUBJk8BV91XXZRTl5xpQX/ASnN+dleXlBYvKUSYe1At1Mj2CKYK6eh
         XfuKd1N/HPPXTlh3Aa14a4d3P4VB+UcXq8ya4XXBnLKigsyj/CYFCJxssYpOHZUPjpgS
         2fwm57PsZSy3+TSO7qcwMWi0Ch/T1S55cITqAlPhXJy6OE0h+F6OhJP+P08yZSST9tHd
         Pim4rn29mb12U+MR6S9ZtBq6UrR55vZ39da0cwIEp7pi1a9fJhaSZe8pS2GKssNO0apk
         k8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986921; x=1769591721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJLNhxpUuunLpKkwMWOBq42/DhYih3hY7Y23pMOtVm4=;
        b=itSsFq5CqbtgoFs3xNeriuRu5uGC02qjiQnlNyjk3h7y4Q00brYnikSalGlLj5gTF6
         RmoH3JQ9zBYCv0poacOhlO0U1bJXqBiBZAvptDbV4/Zg3zLa7SHSNe1qS8hZITsKdEis
         5zFlPN+Ix3SWXNJVgGKsRku6o7LRUmb6Fs58CaTzbuZ3P5WV0YPon71cKRps8DCNO49a
         foB3bl16rIUeRlvBUly6/l6pG/aU0DbXM5qRqjvikzCQGE5I5CertrqNVZg00iD6C2M8
         3+kiCuKYkam8pMtfMXVzz0dbRDxZS1tXR8pFHSc1sFfaX4ouTKtZi5pVMI4oiuVdP0fD
         7IzA==
X-Forwarded-Encrypted: i=1; AJvYcCWS2N0Diuk0vyW94hywnrCCZ3W6thB0ZcnwARw3Iy8ObPHAz6vzxQSmOPbufqDDkOk4lu9BoJQoJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVnsVOgE1Y5KvY0QbKWup8K+TZZCBzTj9CQmZXKAlQqmlHJEtS
	4sQ6cdBUy3hJZes2l4cQlwyWsrkXA6j2rZTxWmiqdYv4lLCi5So0zCRYXGWRHRby
X-Gm-Gg: AZuq6aKXeuZBxhohOPFcoc4yvpFS8m8JaomXxPBxCFq20Kw2/xZk7chfYv9eBgWBMpA
	i2dTnCVTfY7p1btnohErzgbJ8BNPOVlCY/g+up1lVsOfALNn0hDNsVPtJ73xhxMPOvP5jWkOg+j
	rkjzNKMC4/iHiq36lC96I0lhqmRzh1uuPL/zminVYOhii4jDnE0umDOPObu7xA2z34j2ent6WLc
	Q8fX8EaVqqkIab2cpl4tNqFl7TFZVvr8SCwnNgmye7Aq176zpg91NXSHeEyOWRMrGzOWq6W9iUi
	pRWGsxlUEQ3EIHCI0xugBO5YuQMh/peGIWIwzwiUQgw2QDV7LknVi7NVG0J5D6cJngwy1eoRZLv
	QnQYcildOsOS4b8LBE9n2fB6xptEMBMVsJjJkH6/8Nf3n/qtlbUGEjtD2tJOnEen59f/Qz9wJ1c
	tjbDnROjKTuA==
X-Received: by 2002:a05:7022:1e01:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-1244b36efefmr13558965c88.34.1768979613029;
        Tue, 20 Jan 2026 23:13:33 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefac48sm21239676c88.11.2026.01.20.23.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:32 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v2 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Wed, 21 Jan 2026 15:13:09 +0800
Message-ID: <20260121071315.940130-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121071315.940130-1-inochiama@gmail.com>
References: <20260121071315.940130-1-inochiama@gmail.com>
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
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..3c2c6cb6b10b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -34,6 +34,7 @@ select:
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
+          - snps,dwmac-5.40a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -108,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -653,6 +655,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..e69f3b60c51f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,103 @@
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
+      - description: GMAC main clock
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
+
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
+    eth0: ethernet@cac80000 {
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
+
-- 
2.52.0

