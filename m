Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEAE36CDF4
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891230; cv=none; b=pzKYVEKZNhivox+TMbW4FvljJ8zLOc8VNrKHsIsV84M2yd3zlELJIE2JRkDCtdkcunlmSZEn7sJvyO3Mzlxi3ttcFOrW2YG1s5u366XM7ub0LLJApofSJs6BArcPPiKbMxlFbVsb/kR96TGJ9LwYmCKsJLiK/JNxz8FaXkaf1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891230; c=relaxed/simple;
	bh=0+Y9hEB70xxqyIY6tsWCzgo3WT4f+mm90U6/OsPJkFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCFO+2g1ucqHCiUNeRRmVNOQbqlfm8u22fxafjEsff9+DQFOSgMsRJfq9//wfkBvHU+T+LjhUlGFodl6fi12+3x1dposu6tm3Z8jyzRwTalepez394j74KxmSCSwShXp7kRj+TYKJ4mF8SuWhvyEjw4m0bzTaib0WZYa5hSzOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEY54cf4; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEY54cf4"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5634d866615so3550097e0c.2
        for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 22:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768891226; x=1769496026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=;
        b=EEY54cf4RbXZROikd6shMdk6nh8IJfxSjOsnoM7HMFS4ZXZQ23oQA56+YkOdQ7WSQq
         /X5k3bU57FPLa9NVd6zMukhedyctapGsYUmwaUOrBAS6KXlDNW2P9m53TA7mCTkCOS8+
         0IblVmVb4VdT9N7zT/ayreQYdyli58u5R4dS56aoPGf5R6YVJO1ujlIWlOdnsFweG/fi
         iLxw+BQDszmv8i2g1GR2UpBl8hp31Cq0JOaC49BdNlNS5hfqm5kvJrnnB4G3VPVdrsY4
         Fe8dE6UaQ8RSkpzdUQxtj5aOYhCty6ixLZ4Rd+1o9pZbD6uQ7IXctp5Vt0llMoK+HF0Y
         rkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891226; x=1769496026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=;
        b=itmw8clsyNSao4QoVfOqIdzRfSmyGbfy7TJ9oQ1uV23sjtwG2Ca3L5XVOo3rV7JfI0
         xXoO1773+nv7gMtV+TbJf2SD/nuqiFmXQQTYcYWxKtJG6CHUAeLQWVKOGEVaWPKuosq6
         dgSpeclqnGQw6A1iVrx9M3AigwMDovdXOmEsC33qrDFTwTqhJf7G8D6+jxv0JncOGc7n
         h6cpdKxgwx5Ts/b5p5yMUvkgT8I/Mwxkwz/fB8y+VCYbwiK9muT5r+cyrXZZb05tGpwi
         mM9reJfZ2fBXxbhvIe9KWPJ7ADPb3QdEYrL9ffkitK8WnMTEYFIEDMZVfH2UYbc0JyoW
         9XbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOk3k9yUBegwQRRYTE1xxkAwFP/hsFIHGv2QeupbvC0EjWgHIZHPoVXZTR+qa8nSAwivhzbfwFlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIXpCXtiQXItwcHOS7g7GJFzz11w1a8k9w/5yt6O6LbwMET3+k
	h3SiYrw9MbAT6hHH2hvkAHBjYIoZd9nyuENmi6X53tlFb2DK+lj0jPGUVvvrpHMd
X-Gm-Gg: AZuq6aLWRyG+A5nLb/t3jAPpdupGeALoOjalMFcswD4WZYTv/9wqhEbR5sBb32QSag/
	A7FGnpKpb0CrYUAHDPh8gYhisIN/x9e0cupZYWbqyDNvXpdw5oUC3hqkLw9BKMvV13QapZP6+Ts
	BAnLf4J54fR31yEKZsL74qVZfXpRznvkfNAgMTJw5dLbNcY4G6Ny9/4etOQzQLIBwghySqumK8i
	OAiC5GhkLivofBPFEnuU09A087bm8rEDCJr0PCX06zDO2rhoY9IWsh6wRC9N08oXg3BL62izmim
	UpzVeta5dK+dlO6Jqr/rYD+3LqHvKmZhRRE2OjT4773ipI77bVLBXjRwu4fYcb7QIrpDNuNWgfH
	GF0gmfit3SnyFyNQDl0Sd6iwQoJQ6M/EbRF4iR8dTjaQCE6OBUprmrf90AKYdXRROHwimRLHS5k
	DdW0xWA3U5ng==
X-Received: by 2002:a05:7300:6d1f:b0:2b0:4e86:8157 with SMTP id 5a478bee46e88-2b6b46eb100mr10720484eec.17.1768883786512;
        Mon, 19 Jan 2026 20:36:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15459859eec.9.2026.01.19.20.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:26 -0800 (PST)
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
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Tue, 20 Jan 2026 12:36:06 +0800
Message-ID: <20260120043609.910302-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
 2 files changed, 110 insertions(+)
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
index 000000000000..58dd98f79e8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,107 @@
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
+    minItems: 3
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+      - description: PHY clock
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+      - const: phy
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

