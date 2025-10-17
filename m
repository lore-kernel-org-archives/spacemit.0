Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9E6284890
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728071; cv=none; b=GHtjrSnP9lzm+/6He7X4MKjfJuO0hOjiGznxMdvImwEMteENP31QVyCcVdRtRAeUxVHbXpYo5q27UwQ76FK5xv+PMGyAZkFyhr7Y1p0Lj2AJQf3qeF4Avo1q+k2vSaheT95OnrGuuSaZ5yWXjW7NimMYC6gKQzMbiZLPsbe22Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728071; c=relaxed/simple;
	bh=gSA8pzE96CptaNNhmH2TKS9Z/TX8WVfVdY5RfpgB+X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+GaKD68QuDQWCe6LyiR80EZp8qiMyFtV0PEvhCMDx3AZ41tn2ttvFJNOX12dnpu07H4ydNRV1yhTrvcNcdeEtJBPWYno+rOPF3o8QbC7yH5A2ZIKa9RWZS/KheqJSsoHl/MeLFUjsmJpSD8tor5JrO6+9xPHjqMBdbNzL69lIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bhT2a2A1; arc=none smtp.client-ip=209.85.166.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bhT2a2A1"
Received: by mail-io1-f68.google.com with SMTP id ca18e2360f4ac-93e2d26fc82so200261939f.0
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728068; x=1761332868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wipx6KUf5lXNnshQnWU8AGb6pBA1b4PqRzR3i29GydQ=;
        b=bhT2a2A1F2VqvEo8w8m8XzyI0fvdWne+cxeGReBquzWx35wAAFcfbNIccQCWW3SSIS
         JCElX092Rt5dQRL4M9YdVhbwmbViy6A3gAegg7MrQARzm4wHLyJJvb/a3WfVVguUiY//
         7IzABH+mctJJSWTouk36VtvJ4kdlqsLYKbxrLDEdFJHClrmOa24tlo3LsEC0gQFQ347m
         xts70bHEDWoAtBt7GfNxFl5NeH2l66gGMK0+Nk+NIqp+pUfoxklllMrYPPzGqt4uZ41u
         FVGNy5eZuY6d9a4sGeh6DIxlYKjeLlmYejN/ozOvcb5UgkGTFgZy1o01kY3hPga2Ycs/
         vudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728068; x=1761332868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wipx6KUf5lXNnshQnWU8AGb6pBA1b4PqRzR3i29GydQ=;
        b=Ckwltc6yF6rbJIOfEQOwmjlQotzONA1Bf2SWv6FmFKF0+4zpWTXJKpVtGi7QB23xRh
         eYL9jxJcIimj6jK17GXtvCnBpo+jPGGimKOzwmj+R0wqwn6IC6FLykDEIF0dmrN3te2y
         bgTPSEGMpxwz8LVMWtqnl3JgsT6ibqGycrwvzqk3T+ybetU53bmpECyT1KyOiE97noIb
         EHwXRnzBcZVvJEK/NKhBQKIpVrn1Sl55GOXOzfs5MFlVbOeO07FApV/kMFGhIXJUc+FJ
         dX+1YRZNVJ2EVl35xa/hwkL6LysKiQvEfRrP35u0ownggJb1lu00TdHD4/ipSBWFtQ2j
         GhAw==
X-Forwarded-Encrypted: i=1; AJvYcCX5gAnpqei20LUe2H+ufpgQOLgUAAed70xU/q6WxrIuBXyhZhPL7XAfLB41WZFSA2UBc+s2XyjM9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6oVIRo0egsNtJ5gTqHyPi/lQ0l/7jSLOJCFFrjgjSXOf3fMN/
	1EtNVpPDOh7rjWg3U8tG3fvsuHd/p3BhsRbcV4eMUzPihrhH6T91zhYgJqLe7/qQHGw=
X-Gm-Gg: ASbGncvlFZ9nmjASp8TcKClpHJ/+/Dh80c2NrUedX6/yZBKhxmaJ0egwR99rg0fj3hk
	SdmWhHwblhG7gu6wT38lnFZzY4+lYJyDnpNUsmUh5PCwZMXkJ61qzn0LUQaHWP5OmO/07tj929A
	5/hehTu0oxyCaFGOc3NyS6fZEBPPOOMTRzWkrwR/29gutwfOo+YusFdbLTWJd+vHWegDE/wPLdh
	jlQu/h+0whjwTmdyyV4HKBmbk048LVm5hGGi0ts8/zSsDe82rtCwYf+0fhHKux/TxiDbg69Rl+y
	U/UfuwkpkA1dJnHNaPayOuuCxbhX91UH2Pxa0EDBAfSUvr0jU3dJbqrVTj9gOLDeToRuOOy4lVu
	LOIXFJ4RQu/UvbdxsdhelU+QjcJ3bb24EyODekz/sjG+JNMRbHLl08/IMZdtr4NlI3h2LAJRjyT
	HpXMfjVvdUwyjKDyuDvTTw3plOMxrKqQZjW5vUYCiaGPg=
X-Google-Smtp-Source: AGHT+IGlmzrh73wRb0y67T37imaj4fcl25NZgeEColbyy8xRcDJKg9j4yQIgu1HP8DHaZFDT+Smbzg==
X-Received: by 2002:a05:6e02:188b:b0:430:b05a:ecb3 with SMTP id e9e14a558f8ab-430c52899ddmr71652585ab.9.1760728068556;
        Fri, 17 Oct 2025 12:07:48 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:48 -0700 (PDT)
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
Subject: [PATCH v3 3/7] dt-bindings: pci: spacemit: introduce PCIe host controller
Date: Fri, 17 Oct 2025 14:07:35 -0500
Message-ID: <20251017190740.306780-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251017190740.306780-1-elder@riscstar.com>
References: <20251017190740.306780-1-elder@riscstar.com>
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
v3: - Remove the "num-viewport" property
    - A "phy" reset is no longer required

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
new file mode 100644
index 0000000000000..89f8b6b579c6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -0,0 +1,147 @@
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
+                 <&syscon_apmu RESET_PCIE1_SLAVE>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv";
+        phys = <&pcie1_phy>;
+        vpcie3v3-supply = <&pcie_vcc_3v3>;
+        device_type = "pci";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pcie1_3_cfg>;
+        spacemit,apmu = <&syscon_apmu 0x3d4>;
+    };
-- 
2.48.1

