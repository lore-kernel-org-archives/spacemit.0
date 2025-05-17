Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F02207A2A
	for <spacemit@lists.linux.dev>; Sat, 17 May 2025 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747491959; cv=none; b=ou+iRyhVj8b2g0uhaH3F8UsC+cod9BB3yAdJIG7x4SHSX5RgdxpG8HzMNUtfOm6mf5byHRAsRa8Q71m23G0iHamL3xwdQ59zaO1qGo1ZyJfVSZio8LY7sBWOlFYkJ466S9L3yXS174Q9mDtETipAK0SUShfReCCPrwy9aAEGVLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747491959; c=relaxed/simple;
	bh=6bqBZsjjVnFn6jOeNhxcj9u19+XW6AhkguFvG12Z2RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvKGANsajAf2zX7llKa7Py+w9M2Wi4sCXLLMlFL5W68fE3KfSb8ZuCxWZB/DQ1SJkJjVMbKp7RGg5Bx/ZWmt+s7/zqfY6gSDCoQAP7843gBF+VJxk5dzRzbf1tahUMKCtYFV5rAElkRNRX5Br9qpnjYBCI01qHO8H1Lx587GARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.32])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1562e81e3;
	Sat, 17 May 2025 22:25:50 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Sat, 17 May 2025 22:25:15 +0800
Subject: [PATCH v3 2/4] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-b4-k1-usb3-phy-v2-v3-2-e0655613a163@whut.edu.cn>
References: <20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn>
In-Reply-To: <20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>, 
 Junzhong Pan <junzhong.pan@spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747491939; l=2715;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=6bqBZsjjVnFn6jOeNhxcj9u19+XW6AhkguFvG12Z2RE=;
 b=9cQY4UbTtsuqgFK1sCoeKD/rZm9Kr8ML3SGGwB5dE7wJKGAv8uJASzVIaMqQ8LR9NfhLwjwNA
 FKCMnsbgrZPDg6r0m77QbOWCRiLI1ijqjj7GnT+uci4T4pPRA4ZlB2p
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCShpLVkNJGUMdGBpLS0oeGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVISVlXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1kG
X-HM-Tid: 0a96dea3112c03a1kunm1562e81e3
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBQ6Lzo6STEwUSorMCNJETBN
	SEhPFCxVSlVKTE9MT0JKQk5OQ0JNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVISVlXWQgBWUFPSkhINwY+

Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.

PCIe portA and USB3 controller share this phy, only one of them can work
at any given application scenario.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Junzhong Pan <junzhong.pan@spacemit.com>
Signed-off-by: Junzhong Pan <junzhong.pan@spacemit.com>
Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../bindings/phy/spacemit,k1-combphy.yaml          | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3c2e7dfb34a27b5d9e0a14193d0cc1c64c16c8f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-combphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe/USB3 Combo PHY
+
+maintainers:
+  - Ze Huang <huangze@whut.edu.cn>
+
+description:
+  Combo PHY on SpacemiT K1 SoC. PCIe port A and USB3 controller share this
+  phy, only one of PCIe port A and USB3 port can work at any given application
+  scenario.
+
+properties:
+  compatible:
+    const: spacemit,k1-combphy
+
+  reg:
+    items:
+      - description: PHY control registers
+      - description: PCIe/USB3 mode selection register
+
+  reg-names:
+    items:
+      - const: ctrl
+      - const: sel
+
+  resets:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description:
+      Indicates the PHY mode to select. The value determines whether the PHY
+      operates in PCIe or USB3 mode.
+
+  spacemit,lfps-threshold:
+    description:
+      Controls the LFPS signal detection threshold, affects polling.LFPS
+      handshake. Lower the threshold when core voltage rises.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xff
+
+  spacemit,rx-always-on:
+    description:
+      Affects RX.detect, enhance compatibility of some DFPs in device mode but
+      increase power consumption.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@c0b10000 {
+        compatible = "spacemit,k1-combphy";
+        reg = <0xc0b10000 0x800>,
+              <0xd4282910 0x400>;
+        reg-names = "ctrl", "sel";
+        resets = <&syscon_apmu 19>;
+        #phy-cells = <1>;
+    };

-- 
2.49.0

