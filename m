Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1DB36E48F
	for <spacemit@lists.linux.dev>; Fri, 27 Feb 2026 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179071; cv=none; b=U/I3N6jKcDmc4FIjUH6kJHntfaJqbFoQPpdsL8PNIGJQTWCZ+YgPhm+Udrvi9C15A8zNWPX2EnlBNDtrUElQew99gGmL1kbM8bv4qhOG9hVMDTGONpwaPNRNn7TVqPd0GKkvfX5QcW68i4hmR2902/gLzAAZSipqeVrOvdg9S3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179071; c=relaxed/simple;
	bh=9Lx08UaLnU7Uwnp2XhPN2FqDgQsacRlyZD2mwcG3pic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1nO2k44pXSoIqxaaiqkTE5E0ScOY10GqpcjH6Mc3qtLDdwEgAsKjSQmX0iNw5DdRbDbbGe8AXovY0cgIfy1xjan/TmXhkbP/PRKF+vHWEWIEK7X69VGtIZfxvDlkJV2WffPfM+XF3JhCPBlHRjW7mGxbxXgr1+Dg2VDmcPfZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNns32G/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNns32G/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82747396358so653811b3a.0
        for <spacemit@lists.linux.dev>; Thu, 26 Feb 2026 23:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179069; x=1772783869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=;
        b=NNns32G/tw5CntpF0cVh64QWzBSt+B+9XVtO6G+DHiAA/A/s8yUMKlAL8VqN/l057j
         Wbib0G5QVZSWIFmQrDynBb3NQRmPsDq6reJLpcSsb0H9c8/9hSWK8CbDdLx5cdGH/YcT
         Xjq0VtHSoTmGPw0demB3r11KvfRE+a0pcNe4rY6sLKTHUcb1gwhzPhqC6WlKvLAKQlNw
         GV6jFk/AvdM0LuAZN/NfSl0pUhbvLwgc3u7mv8qm0bFStL5x7J4qXKV4qVBbw6EzvVKk
         GSEO4Cm4TPCN1Eka/Zciv6cgNx/LsKZfYo+hp0Zgh0Qmqmbzu3e1z1hR9H44GM6OZck3
         csOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179069; x=1772783869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=;
        b=Uee9MUPqgjN+gLXPq1eDLkCLsP8t24UeaxmMbO+YTCzFOBPmnpvWT5yG52PXivdC6S
         pPFGuSuNICF9kekYGwqKMG92jf08Z+S7Dw3mKHgLL0kM4f+vKD1UgYYDYfSHLl0e3q0k
         cMcactGkim9omJth79XFCbiaZqPdVoCThEnn/a5f5Y8CruX8c7tg7HxU6M6WUSez4LQ+
         BKFGzMWQo7Trxd8EH88bP4ZLlyALhcFFpCTVf5zc1+K8v4/s5e/KMkdIrgcNn3fmrG+I
         L95iO6+5+Og3vx+//MCuozPAOcHhnLAp967i2bcPwxGYN6VJzLIKQ0buTAeeUASJihWl
         AlaA==
X-Forwarded-Encrypted: i=1; AJvYcCULSYp+0rV288dxIiWmPc9a4byX5PQU4fEBUbpGowIBfEzWrmvRtoG4pWxAF3Zx1968+jPDBNlDQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcwwCLbh84PR0QlmFwv9jFE/X8qKBzy4qwzrsZ4ubOSJen8c0R
	lo/0gjIvQf7d704hsVMObZlChaGXBqDDjKoe5voqjtJXywuuzfmv/xkh
X-Gm-Gg: ATEYQzxNDw/rX0/PSDOboh3EjAytxn0pFi6LECHH9OAianWiNOklmVZoftOe6/sU09o
	eJvePPwgAqdh9u0LsSS4P4dDVXWnK3cDJ9zw4U560sXEx07Z3YqISmtxvoOEC2fzDB1WYNT7G9n
	5ONdlvJmjnpizOLtOS7YbJ+q2NiotLEFAwIhuxEEPGJ/JV2Au/GyX4JOv8kBaXblFj2sfPhmH6U
	3RK8rMx2W9e+l/n5bDPux/Elsu3vhxDHmUYxkl35DEgmTkUtdzrDZM/TgNPM06frlsoC5ULl1Y0
	ONY7S84iNMCC9mUS4cZ9ITLFWHfxxLq/lUOV66HH7/GhCZDp3ZdmHvE4ZKOict50jkKNJIJJ4D3
	Lntc+ZcACfdJS+dH2SYX4PyeKIUTYv3aDBHie7Em/o8E0/P++eczA5QWntDIGTQNDox2I1VjO59
	4WiHObHSBy4pqcUohnBmrPyA==
X-Received: by 2002:a05:6a00:1a19:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-8274d97a3cdmr1844514b3a.26.1772179069377;
        Thu, 26 Feb 2026 23:57:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4c5e9sm4315422b3a.2.2026.02.26.23.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:57:49 -0800 (PST)
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
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Subject: [PATCH net-next v5 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Fri, 27 Feb 2026 15:57:15 +0800
Message-ID: <20260227075718.2243818-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
 2 files changed, 105 insertions(+)
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
index 000000000000..274f446b5e5e
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
+
-- 
2.53.0

