Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990B532ED4F
	for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 22:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861792; cv=none; b=c+v3yOzojKmNojrPtgk1yyH0AGJvzeO4vr1Di1rYDFAdOvlZmwCGJByONobZSVH58rqC8gWyfjFF/Yd+lDhPJed13lO+J2OT1UQ0KJOpmSE3yFLb3EZ1dKFrIEWzybPwTpbpdkqiXu+nCd94L9Hugcc8a0LNcW/UY8CiKjgWFkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861792; c=relaxed/simple;
	bh=g0TyjQoYgqKGdvJozDxy+nVzO7SebxSVHgtLRKuRJfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UVsBQE9sMq7mTgUgL0ncMtfMnzCPP97WcJu3uBkxNwt7ujcXyUHIfNokjWzOunvD3kOtfzwfsAVak6x6NxdP+eSQ944HFMVZStbupkqlX2wF13whDriTryKm8wHyMhAje/dC4RXDv/sEpfUPGCE3o04sMEEjdDOytTEwSMQ16uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=nCagaSdM; arc=none smtp.client-ip=209.85.166.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nCagaSdM"
Received: by mail-io1-f66.google.com with SMTP id ca18e2360f4ac-93e7e87c21bso154764439f.3
        for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 15:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861790; x=1762466590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY8F6K1rIyJfyukY+3kGi6ZJkc+idzdw2ZPLZkTQgao=;
        b=nCagaSdMP1GfAJXKwlCPFiycs8GJOpUvIwKBF90pq+VikYZcVG+Mgc4sCv49xZEAs4
         m9/ViX+pHQLAV+swKOEiNYcv0RW8YXCoYos9vtoVfm3Fj7fcUq9FF3W8DvxenBQ2vT+y
         Kc42vF3/L2BdFJXB3YzaqMsOOm4foUSPOZ3UomWABBRzW5MGpfme4/FMoJt0XD1dt0tx
         KdvoF9FIbzdK3yKwqOEJUqzZ5u2f6K9kYFXVToGDBhUtRSIVZS3Ctd5rdxvle4jn4H4Q
         UHq2mMkmyp86jYrRlsQuFCQjWWbT5fA0L96AAx9Qbp9+oIm+2GdKug6F/q9H8o3ZYZdO
         QS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861790; x=1762466590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kY8F6K1rIyJfyukY+3kGi6ZJkc+idzdw2ZPLZkTQgao=;
        b=gOITkaKBUdN4K7/3DX6juuICU66+q1+UuS4WEoqCEN6l7/58U6NRVyoDEqKRgM+WDM
         GNCa84lrMFTK/JYrPouqYCfKlJ+9LU6LAjRxVfvBkVeRlu3+/q0+7FdUfGzHKhlPYrrZ
         QOSotVCkP3Dh0zCHOlkudh6C9fbSWk1POfAjDQfYA4owH7W8We0CAuNpxlAbGxBCsTQQ
         8K8i1DZJXdOb+C0g/DRd5NHfX4lNN5IqrEuzX64oHdRVgaRWRhv7MPCXYXS9lS8vduRs
         AHojcsvaleDRxSqZhiVvaAZqKPr8hp4uuqAqSibUH8W3zUdt7XGhTotmIhrPJY2+HcI5
         hEBw==
X-Forwarded-Encrypted: i=1; AJvYcCXEQEKx1kZmt5jV/Whvr45LpvAQWQocFb1N6EhOogDCGWJL47cYmOcWjr9J/lT3ZDPgT2zgN8eWEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEZeoJq0ZPTzJRWteuwPcVr3vrM2RkziV3keMDsc6YxN5XIJ6e
	KFPf7sTFeZ42pGZYdOhhXxtItOXHVX0IURmTxVivszuRU/bN4WTLgOAHDn2g5Ko/jVI=
X-Gm-Gg: ASbGnctL5Ls5IJJ3T44w3J9wivvprPQ+WbyoJtJeQ/9vROZFtkpca0tWhrdq2zy+ctF
	yY59mv7rjT3uZhx1mpzGyClu3lgYKlNQYfH7AS8hk+s74Y6fPRzz4ykWZ6trDy7M7tdItlMJS1c
	uUv0UtOcYB8piKjaZPGbcyyHZv82WRDdMfhC/Rl33e3kMeAFxOT1VXVYUU+/4gzyXYjSga+K8/7
	zgdLUkCL4Utf8U0YUROKuPVvZI1HXe0gRGwXkT89t24VMb6BJc+/fp56PoDLmrukEt2RLB1FTS7
	N+BpTpP0jXRRHD/K+9paYpubHQiErzK4YtE4qUBlMz1OAfy797cQ+ZudwS9mYrw18HZJXLrtMlW
	bsxeVyt2Qb8AN9RVi9zENHkvzDIlzfm8yCRaPdjpQpfA4pAottPyf/nGOdXybHPm4WUkN8OhdBc
	AR5P8ofXNe9VliiTFKpSKe2/kCJmvditiSWEgvIjeiRPo=
X-Google-Smtp-Source: AGHT+IH2ECDLiEzZGe6B8hcsGW+TrKbN+u5OLPyvgHr1FicCmPHECAKFwVMLTlNXVAMST58dw/pRxg==
X-Received: by 2002:a05:6602:1545:b0:943:83fa:ef49 with SMTP id ca18e2360f4ac-94822a4fb5cmr226769439f.15.1761861789674;
        Thu, 30 Oct 2025 15:03:09 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:09 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: pci: spacemit: introduce PCIe host controller
Date: Thu, 30 Oct 2025 17:02:54 -0500
Message-ID: <20251030220259.1063792-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251030220259.1063792-1-elder@riscstar.com>
References: <20251030220259.1063792-1-elder@riscstar.com>
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
new file mode 100644
index 0000000000000..58239a155ecc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -0,0 +1,157 @@
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
+  interrupts:
+    items:
+      - description: Interrupt used for MSIs
+
+  interrupt-names:
+    const: msi
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
+patternProperties:
+  '^pcie?@':
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      phys:
+        maxItems: 1
+
+      vpcie3v3-supply:
+        description:
+          A phandle for 3.3v regulator to use for PCIe
+
+    required:
+      - phys
+      - vpcie3v3-supply
+
+    unevaluatedProperties: false
+
+required:
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - spacemit,apmu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    pcie@ca400000 {
+        device_type = "pci";
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
+                 <&syscon_apmu RESET_PCIE1_SLAVE>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pcie1_3_cfg>;
+        spacemit,apmu = <&syscon_apmu 0x3d4>;
+
+        pcie@0 {
+          device_type = "pci";
+          compatible = "pciclass,0604";
+          reg = <0x0 0x0 0x0 0x0 0x0>;
+          bus-range = <0x01 0xff>;
+          #address-cells = <3>;
+          #size-cells = <2>;
+          ranges;
+          phys = <&pcie1_phy>;
+          vpcie3v3-supply = <&pcie_vcc_3v3>;
+        };
+    };
-- 
2.48.1

