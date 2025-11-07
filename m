Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024222FDC59
	for <spacemit@lists.linux.dev>; Fri,  7 Nov 2025 19:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762542970; cv=none; b=Q7aUmZcX0vJruEOAsc1u9hRQy/CxInqAWOb3q5BqgRSKNg5IUmahWycvmC3ZVJ4HjxuF+SRbu0c41V7HjbFbhEIz3Sj6rGAmJKWMzTio7jPlX8KnE2geofPCUtUiPo4M6UfGLRGHueyjNJPtV3T1Lzmqe4AL3WqsH3sAr0P9S+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762542970; c=relaxed/simple;
	bh=sRruweBkfCUKeKY+4KjkSn4F/iG2DV/1VfBb/BhsDZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZQlvL4v+BqHtjDXpY3ug/lL0432vXp6Bb3oAawl1levRIwTznrwVzUWSUd6lle3J+PwzyDkalEHwyzVBRIdgEfC3YWBTDZxsl4rJMaIo9XJiHZ3Bo1ekYu/DX0LoUrNYE3ntU5oLIRz4wfc/KQyqMLmAhf7U2sred1xz9Fbigk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PTqFBL62; arc=none smtp.client-ip=209.85.166.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PTqFBL62"
Received: by mail-io1-f65.google.com with SMTP id ca18e2360f4ac-9486696aafeso100916439f.3
        for <spacemit@lists.linux.dev>; Fri, 07 Nov 2025 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762542968; x=1763147768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5IlZ+BcGNZCeyUh2duESv6HKbkDYinAEGH9EVCnUC4=;
        b=PTqFBL62201Rc1HHtOYSRg42+9ZJZHI9cflRpMwtEwC8CATuxVDKym7+U148/4aLKB
         7RVw+9xR9/G1sV71jVpAypLv3q28SX1uJcrqfewNOZtMya6mK4uCqBhi3fbVXg9G8F9E
         L8Lsxf/bq+sE/zzzRDKqAtgu4wJGmhkJuotK9PzwibvVIy+WIHkXJYQLDTkCN645VCIi
         dDJy24XNvsnY6EuTzDTpq6aDrPxW5+JKXIXO8z4KcfJZqutxtNtlg8AWk4rL2lQVJQmh
         voLabODOQyz3hwspjcaVIlIguv3opBDcjoYpvMrcCEh8xDpyI1VzVIvcbwAOOof+5d1S
         asQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542968; x=1763147768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h5IlZ+BcGNZCeyUh2duESv6HKbkDYinAEGH9EVCnUC4=;
        b=SNWMeMchyo0akoi6CX7d1FL3vodzI/xei/LmdL3GCs8zuybuphYY3xAfMUZL84Q0ti
         YnXTvrYTJ0TQI/DBFCmiH1Nv1nSRUuDWZrzHAbBIzzdF5ajp3fd3FjBWE7yYOXsKgQOt
         602SfKJElGmxoeh83TEOpo/GxPpjxXHZnWpJyYfWo8mWE8BQJ+k4TIEtw8Dd1cMke94U
         tBJrG2hQdnn9nhXJjJdDjwdimweoxxm/lsGTEwRCSDBp0MJtWoivPubFp8YFx2m3gK97
         w5S2vO9J9j2vnDenrL3Mito02D0T7G5gM3iWt865yYAdzuyzI82r4wdrUvRUcoGoCSCB
         OGVA==
X-Forwarded-Encrypted: i=1; AJvYcCVjJDg3u4oak/get3HuOPt0Y5kNLyd/mIROERjb88gsBgHc+W4hreqLdT2omfcikhVbsUqOs6GINw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ9U1Wttn53Kuy57Kg3KzNL07/KYPdgr5B1bhJCGazJOmIVTe8
	xnqJp9wRO1JXfpviSOSLBP+vKkwJdk5ryLs0dPeFdVuzN7ujCiL1PnkzeLViUJaAbok=
X-Gm-Gg: ASbGnctHqLdQs0o8s5PwLhhBkygIO+MIeX4cnXKwm5F5Xlbja/SDLRUf4FdF4UPu6NR
	h15iZsibXkvpFUT2nRADVE3AYi4YAu3Kun6ereumFTzMlZyAyxhCu6SjHYwK6dwmqpFTPzE8mUw
	i/IJ2/wSdm7pxAb3UdtLu5lamV/Tv1CWLp5h3mmL7Uf0Q/X6nypOvADyDIXPFO1ycJYZ/035ihl
	7sRQ4it5kWvdqRInscLW3TG3h4tWRz33FHFnUwba5TpMCnDKI1oW23mmrTE2zSzkUo0ZP/qLg0I
	tQz2GvJy42xYqNakACrjm44FKGjS7nkT/SJnIBEpayGP01iMRon9JtixXK2MbZnjIAXodmQ7/ZC
	9zHx0mNCEbCVXJ5jIR5FGW3qNF5BVQ8iMA+f11Li8G54eUnP3tya0Jxe3iExBvvHUZWEONCD16G
	N24eJqn6el/XdcqeQM7oFu29F2b7Pp+Yr3wbrozeWQYwtu7KtHqv+vFQ==
X-Google-Smtp-Source: AGHT+IFZam7Hqt3zr2oxzYLeVzDLRSLo2Bp+3tqjEso6cw67eudPvcEH42p9OLjhZ3z+bvZTCPzhCw==
X-Received: by 2002:a05:6602:3d3:b0:948:3282:284d with SMTP id ca18e2360f4ac-94895fd12c0mr51877039f.11.1762542967912;
        Fri, 07 Nov 2025 11:16:07 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888c34c6asm118772939f.10.2025.11.07.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:07 -0800 (PST)
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
Subject: [PATCH v5 3/7] dt-bindings: pci: spacemit: Introduce PCIe host controller
Date: Fri,  7 Nov 2025 13:15:52 -0600
Message-ID: <20251107191557.1827677-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251107191557.1827677-1-elder@riscstar.com>
References: <20251107191557.1827677-1-elder@riscstar.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v5: - Add Rob Herring's Reviewed-by tag
    - Wrap lines at 80 columns
    - Root port nodes will begin with pcie ('e' is not optional)

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
new file mode 100644
index 0000000000000..c4c00b5fcdc0c
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
+  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys DesignWare
+  PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
+  controller, and supports 256 MSIs.
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
+      A phandle that refers to the APMU system controller, whose regmap is
+      used in managing resets and link state, along with and offset of its
+      reset control register.
+    items:
+      - items:
+          - description: phandle to APMU system controller
+          - description: register offset
+
+patternProperties:
+  '^pcie@':
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

