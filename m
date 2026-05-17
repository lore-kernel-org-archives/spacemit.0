Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8910304BDC
	for <spacemit@lists.linux.dev>; Sun, 17 May 2026 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982567; cv=none; b=WqdkYSXb4V5rvo5jcuBdk2Dl07D4ZfHFwuXahRbH7I2vht3lfDDhfy57AeanpPJKR0GuxYYg4OxltKFLKQmmpB2L3KV0UJUTP4YxbIBfI4pgffzyASbaOWoaSWZuPUalJwcZon5ldPpyNMD77isQ1et1Va4/9SG+DptvXwGt7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982567; c=relaxed/simple;
	bh=44csRfRZMQMnbhYT2ypXHrgXGaPwDpJHCybAdwDm4h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gt60kbK3ik/edZ3ebOtQ24g1/+1eEDFpM4vhj8gBzXqlgXhi134yXAqyokbP/inFfr8O6mUFDhej6lT7y5YPWSR0a1tIkI3TmEiLKQFw6nj8pfCVT+YMfZevCMhneSxo8fggsrG5r+u5Pl7Et51oVUCGSVcz5NbpZ8nm7RGjn+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2E0BUN9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2E0BUN9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bd80b3aa13so6732985ad.0
        for <spacemit@lists.linux.dev>; Sat, 16 May 2026 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982565; x=1779587365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCXH+i9l3J50hp/oNhGfXSVKTT+GnfnP1ORn6KkZK5A=;
        b=j2E0BUN9Xy00FQYt3I3QgTthq4o9g+IGEHR09+f4P7rkcpPLBEQZ2EL9QOtSlZ6PkN
         sMqg09MMg2iY5/eJzGOfGIIQfDfyeruehf4namgLlTcl9atnl5F6U1KssfuFA9dlaaLG
         YPe/tyPbQczgm1Uj5co92J+Gi1BHwLbZtr14qX8MW7jtHQI9GVwXdVFAllCfpgVvvpaS
         QBN0uGXRQUb95Z3HltKfHT/lm08wpeNnaD9ckAfNBAMrjWl4CQmB4sWh70HPa53MqfDC
         QEWF+AtmmrKCJdFddiGfYO+TAhG0J8vgXO6MjBftlQgNhyHJi+am+8bzR5n77ysVZIip
         QbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982565; x=1779587365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PCXH+i9l3J50hp/oNhGfXSVKTT+GnfnP1ORn6KkZK5A=;
        b=RK7RLYp9X+JrsxrZQ3b0Vc+4F7AsPW+RLQoh2+4Edu751EYDsbiJ+y0VYAJ73yMXoq
         z1yAWWj3rwFkiEs6V548pqWmbJT7kxyE9XfmE9ndtBjjKmvIBMSy5LnJnANgZR31IJ5m
         6nDUE8yX5xhjsnZui30hPoJmapX+ehcwKy9PUByQNILCSJC52LEulKwm19ihTV0DFqSc
         fk1ootRr9q3U8Mc6C8hODoiF6MCLmDHdi3gK9NAyM5DC8nB8i7vmVvHz3UWA3wPhqCUz
         /pX0TSdyx+VtcRSP6R9uJlpLTPbEsBDym1sgxyysxneabhocUiY6HZWh5LKbMS0DTjuJ
         LrdA==
X-Forwarded-Encrypted: i=1; AFNElJ+iHBx6Yu8DqV9thWMWcF1OjwNoVlueG5NQWjG5THzM0q2kl90bavn+MWKpmmYSKSn4uEs7fexKxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg4KIXyk+PwCSYKsAU+MM9sElDBgcms3wUGiIl3fsz2lM9SygZ
	fTTlHbWymVCjRNF2SxPpCZquqjkq9zwP8HcjqODlmGPEpl+hM4qoHfAn
X-Gm-Gg: Acq92OHo1EPmsJeKUB17ZfzzpZX2ez95z4knMrWEvg8xlJDzXVMnFdpYkqFkUXIo4iB
	SLPOeUB00vNKU74PMlozWu6s1yoZczM2UX/SAvkQSpE+wzcdPkWs0bOBFwvB85zvMWxZ15pz7tk
	ZOfEp+WIT9z2TnzVPtrJA0+6RFSvTLPLv89XN4VEEqVAKnVBkQQoAg+tx8mcbjBpa7U56ZKLt5F
	IqtbGsFlzMJngMM+mLzbDcTRHWe3HHNmgQhPw1s2EHFN3RIJ8607YyB0KrHYeMyzrYrjpmCelhA
	uHi7ezElfDzLKfdbDfXTQ4OY4Qo9S6BymId22UXPZwhHBxIjZ0qJ57aIKOiiSdQI2DIAF+D9tcD
	op81PdyfwdIBFe8SWoNKtnM05E7g9PHDtotgxK6OCtWy5xh2gsMTkevXDJL7gFtz8i00pFJp6Q/
	2mdyVCtQ8u+KUqv8jDXOaKxhtCkxlEh5Fkdw==
X-Received: by 2002:a17:903:1209:b0:2bd:d4dc:a4f9 with SMTP id d9443c01a7336-2bdd4dcb523mr2759755ad.26.1778982565125;
        Sat, 16 May 2026 18:49:25 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49a4sm95507955ad.38.2026.05.16.18.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 4/5] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Sun, 17 May 2026 09:48:39 +0800
Message-ID: <20260517014841.254085-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
new file mode 100644
index 000000000000..46147a37a9ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 PCI Express Host Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
+  DesignWare PCIe IP. The controller uses the external MSI interrupt
+  controller.
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-pcie
+
+  reg:
+    items:
+      - description: DesignWare PCIe registers
+      - description: Data Bus Interface (DBI) shadow registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: Link control registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: config
+      - const: link
+
+  clocks:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus master interface clock
+      - description: DWC PCIe application AXI-bus slave interface clock
+
+  clock-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  resets:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) reset
+      - description: DWC PCIe application AXI-bus master interface reset
+      - description: DWC PCIe application AXI-bus slave interface reset
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  msi-parent: true
+
+  phys:
+    description:
+      PHY phandle from the Combo PHY, the lane number does not depends
+      on this, since the number of lanes provided by Combo PHY can be
+      1 or 2.
+    minItems: 1
+    maxItems: 6
+
+  phy-names:
+    minItems: 1
+    maxItems: 6
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A phandle that refers to the APMU system controller, whose regmap is
+      used in managing resets and link state, along with and offset of its
+      reset control register.
+    items:
+      - items:
+          - description: phandle to APMU system controller
+          - description: register offset
+
+required:
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - msi-parent
+  - spacemit,apmu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pcie@80000000 {
+        compatible = "spacemit,k3-pcie";
+        reg = <0x0  0x80000000 0x0 0x00001000>,
+              <0x0  0x80100000 0x0 0x00001000>,
+              <0x0  0x80300000 0x0 0x00003f20>,
+              <0x11 0x00000000 0x0 0x00010000>,
+              <0x0  0x82900000 0x0 0x00001000>;
+        reg-names = "dbi", "dbi2", "atu", "config", "link";
+        device_type = "pci";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        clocks = <&syscon_apmu 89>,
+                 <&syscon_apmu 56>,
+                 <&syscon_apmu 57>;
+        clock-names = "dbi", "mstr", "slv";
+        msi-parent = <&simsic>;
+        ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
+                 <0x02000000 0x0  0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
+                 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
+        resets = <&syscon_apmu 76>,
+                 <&syscon_apmu 78>,
+                 <&syscon_apmu 77>;
+        reset-names = "dbi", "mstr", "slv";
+        linux,pci-domain = <0>;
+        spacemit,apmu = <&syscon_apmu 0x1f0>;
+      };
+    };
+
-- 
2.54.0

