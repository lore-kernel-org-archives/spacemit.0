Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9423A313263
	for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369739; cv=none; b=j5QDiPRWeYTmuaw0wLDj1YtxFx6cRteFsgJFhS1rz4LxgYtfwplGHveI4iCUOfKHLYRUFFMQAi21Plt7TURadOKY27S+eOyOd6FDefiD80aMxrJF58csWyzqGHpcLkLjvYdI1RQsYvj8m6UmZ5XNrzHfo8hJNNt7C89Fytat+ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369739; c=relaxed/simple;
	bh=g3onUkgevlk1RjMxAzZNUt+BDhEsfUgytM/vs6wob2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJfecR9Cz5+Tv4lBhtnBCfQmnIln5WyZvDIl/PeB4ApeJCEnKRwNMV9+EWneq18L8fMxJjJBq7kfIZDCc5KnCFkdzCajtLckE59nRYmikj3a4Eq7nBSpBES8G2KMCJ0scL1823ENmDh8vnGMDjlIy4y7/eWfztqzIY0QdPwHwig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZhHspBvp; arc=none smtp.client-ip=209.85.166.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZhHspBvp"
Received: by mail-il1-f194.google.com with SMTP id e9e14a558f8ab-425911e5661so17814545ab.1
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369736; x=1760974536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clcUhTCzkpc78EGP0YwMtfP0eONI0FKHMHfxFBjJETM=;
        b=ZhHspBvpLknN94NnTUrn+ZlcvlWhuX4G2cRmyoOZ5Q59gIMqweu7l3yBzd+BNYPSkb
         iU0+a16pwRQ+j92EYwILk9AmuAOhmWYLKbPibLBL2efHg5WWf/OD3vbRY6beBmLFxg7i
         JBIjYKHox3N3G8UIbm7XLCydtHAsYOdcz3FdgUgsZA79QdDxsxz17LBHy7wJJYrKZaK7
         4gPcUPYNPTv0Rvz2efrz/2uZQlSaDFk8L1HCqZeo+W/oi175CYZL7YnbWLmzFyvvl0f6
         3d2AeXBJANdN2PkNz2FQY1P8EVrsrMtEyGui0+DqR2Nk1+OCz+vuCR8t/O1FeHkMGbdI
         Tkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369736; x=1760974536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clcUhTCzkpc78EGP0YwMtfP0eONI0FKHMHfxFBjJETM=;
        b=uKwkJcEnHqMOCI9XaQ3HlWA+nmSHfAQ2m2fPVmLr3bYjzClynBBSydbTc9aXcAkFGB
         9Wxdx0dbvX58CxxdLxH0D31XseZRTDS+ZQ0zAxeCeVVo8GuN+z/tpjQLUFL/sWW2X/Ps
         nAKiqbbY/90wDPJ2n1BLd4XXZdHxln8ZMLCxZdaJcEonHnlMzskOnZQvlbfSUTTIGqGS
         EvftdaFrcHrw7/kZxmEa34C1JpQ5qmLmof0EyIbgWhxsXorXy4p+jGG5tosqfJnBA6JY
         H6c3RMVmj3IybXiq8sPlmgkngkkgjsatORvs/zBiEJ1HKbugTdtlsWASLaXje3okTyC8
         Ut7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyW3rscwE3ZIMMwQkye+PAYb97aQ62i48x/G9m/FBeZNIunkk8e2dps7H87651BLZ4eKND1p7IFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMUHKQm/523fq6/SS5C5mS1td9GSkvD1vDCU73xmHDMbfMsygx
	rR3uUZtvL0k1gUgxqkjgj45S04UcWbXk9QTwL4lyE7rVXbS/9blT05gbfnX+U2/Ydjc=
X-Gm-Gg: ASbGnct7NMNPGdwZ7WJw4ImWvRCIlVW0J8EG8sZO1jJNZC6FimSHlDH2pHmQoqSHnUK
	lBe0OGOaxv6yWv2cXCIDTZme7kzZO+1fHOcH/bf7h+Wj2BtNa/iyDoohiCjSSNvFJqmcaFd1n/r
	rykcmnJfQB8M1smp7i8O/TY7EO27dDn+bhq2XZQFEXdahdiwfuBBvveqT+MPLoCwbIdI+d2o3ri
	Y2MnSAgqnITzgXDPYpsWSTi1VgoncovsCtsm8t0w2eYGx4lzTkqfCfJLQDH6vcA6ZEifBlduwlf
	v8+ikBtevakD9EN2XopcQzoVwOZziSV3HUc/wcuHimymGgCSidxVGod138PdJNlovdfM+79hvcn
	EL0cMIN3vpLsDzZ0YX+RUJkEzjzquKN3ZCtcwBNmPkkHxCDN8TXUr/wnG4E/ytOpnolfNENPq8t
	TiioHk+svF/y7iCgiO/6I=
X-Google-Smtp-Source: AGHT+IEq1wU/8vuzVnjoUBATSgPDNzjkdQ/9lH3LryiLTNpDHF/z7PYkRPiy89nhGm+aAHjbFqAt/A==
X-Received: by 2002:a05:6e02:214a:b0:42d:8bf0:29f7 with SMTP id e9e14a558f8ab-42f8736a9c8mr198413275ab.9.1760369736542;
        Mon, 13 Oct 2025 08:35:36 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:36 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de,
	thippeswamy.havalige@amd.com,
	inochiama@gmail.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host controller
Date: Mon, 13 Oct 2025 10:35:20 -0500
Message-ID: <20251013153526.2276556-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013153526.2276556-1-elder@riscstar.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Device Tree binding for the PCIe root complex found on the
SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
typically used to support a USB 3 port.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Renamed the binding, using "host controller"
    - Added '>' to the description, and reworded it a bit
    - Added reference to /schemas/pci/snps,dw-pcie.yaml
    - Fixed and renamed the compatible string
    - Renamed the PMU property, and fixed its description
    - Consistently omit the period at the end of descriptions
    - Renamed the "global" clock to be "phy"
    - Use interrupts rather than interrupts-extended, and name the
      one interrupt "msi" to make clear its purpose
    - Added a vpcie3v3-supply property
    - Dropped the max-link-speed property
    - Changed additionalProperties to unevaluatedProperties
    - Dropped the label and status property from the example

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
new file mode 100644
index 0000000000000..87745d49c53a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCI Express Host Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description: >
+  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys
+  DesignWare PCIe IP.  The controller uses the DesignWare built-in
+  MSI interrupt controller, and supports 256 MSIs.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-pcie
+
+  reg:
+    items:
+      - description: DesignWare PCIe registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: Link control registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: atu
+      - const: config
+      - const: link
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A phandle that refers to the APMU system controller, whose
+      regmap is used in managing resets and link state, along with
+      and offset of its reset control register.
+    items:
+      - items:
+          - description: phandle to APMU system controller
+          - description: register offset
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
+      - description: Global reset; must be deasserted for PHY to function
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+      - const: phy
+
+  interrupts:
+    items:
+      - description: Interrupt used for MSIs
+
+  interrupt-names:
+    const: msi
+
+  phys:
+    maxItems: 1
+
+  vpcie3v3-supply:
+    description:
+      A phandle for 3.3v regulator to use for PCIe
+
+  device_type:
+    const: pci
+
+  num-viewport:
+    const: 8
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - spacemit,apmu
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - phys
+  - vpcie3v3-supply
+  - device_type
+  - num-viewport
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    pcie@ca400000 {
+        compatible = "spacemit,k1-pcie";
+        reg = <0xca400000 0x00001000>,
+              <0xca700000 0x0001ff24>,
+              <0x9f000000 0x00002000>,
+              <0xc0c20000 0x00001000>;
+        reg-names = "dbi",
+                    "atu",
+                    "config",
+                    "link";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        ranges = <0x01000000 0x0 0x00000000 0x9f002000 0x0 0x00100000>,
+                 <0x02000000 0x0 0x90000000 0x90000000 0x0 0x0f000000>;
+        interrupts = <142>;
+        interrupt-names = "msi";
+        clocks = <&syscon_apmu CLK_PCIE1_DBI>,
+                 <&syscon_apmu CLK_PCIE1_MASTER>,
+                 <&syscon_apmu CLK_PCIE1_SLAVE>;
+        clock-names = "dbi",
+                      "mstr",
+                      "slv";
+        resets = <&syscon_apmu RESET_PCIE1_DBI>,
+                 <&syscon_apmu RESET_PCIE1_MASTER>,
+                 <&syscon_apmu RESET_PCIE1_SLAVE>,
+                 <&syscon_apmu RESET_PCIE1_GLOBAL>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv",
+                      "phy";
+        phys = <&pcie1_phy>;
+        vpcie3v3-supply = <&pcie_vcc_3v3>;
+        device_type = "pci";
+        num-viewport = <8>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pcie1_3_cfg>;
+        spacemit,apmu = <&syscon_apmu 0x3d4>;
+    };
-- 
2.48.1

