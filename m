Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E824E4BD
	for <spacemit@lists.linux.dev>; Fri,  7 Nov 2025 19:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762542968; cv=none; b=onI/v63/Qa/rDPtkPsWZU1hJUyuz5P8OB2H0LIdvalYbXCs/1ELp2uwSZW+heqQUnJUCrwf4oI86xrHWOuIvrH85SnQlBaNW30Al3zuPjlVwqoGp5czbpYbpVOm5qErupbR4LUlIEh3FuNjypUQWM81usFSGi5w60W1Eq/d2MBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762542968; c=relaxed/simple;
	bh=YHBye0L9cMHXAeuikElziIHL0SY2EvFZooP/HwyaGbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrMuGSdbc9hgxrlVE3bPpo6qio5PPUzEPMeyBe66WT6EwaKm4aIoICUUUXd3sfwIdq+jmp6Wx5Muu2qtxx/6Rw4hsZIUW82U5JfkG0naRLx9OysofxMAbULB8DMCHlNHZfceINYMvIkXuN9e2C+sFFSBtns2n3bLgRmT9xY28Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=b3eWZroj; arc=none smtp.client-ip=209.85.166.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="b3eWZroj"
Received: by mail-io1-f67.google.com with SMTP id ca18e2360f4ac-948673fdc47so35149039f.3
        for <spacemit@lists.linux.dev>; Fri, 07 Nov 2025 11:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762542965; x=1763147765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay3vJcZn8gR8uhIOX8xdTsiqp7cEn/zrhd4VkngAbaw=;
        b=b3eWZrojk4C1dMwWpWZdlqNJYKr5T3BinTEDwz5K0cEVVNdk0T2LiDI8b1ABchBQ1+
         hl7DvISb5AcNF1R3lxamxyc2o9cvlTBygETMNTkSGdNTz5zCIAkk6Qud/V8r992W85Bk
         XwJvuuJUyxlof7FUYZxfF6PPQif/uDwsSpnBecqULUr2sW4Yq4yDT9MwCkVBEFgE44GZ
         EMmiEMr4RvwiuRDrJnavKe3W+xeGyMSul2SbqFH4DWR81rcW4kr5NTfh4py26aEbF8fH
         2oPfKsXJ7ECKhPN4lSwa6HKpmM1mMuYq/4z18p7sbH9dXg2AKyXo/DtF1MBgU9Pq7Jit
         jdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542965; x=1763147765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ay3vJcZn8gR8uhIOX8xdTsiqp7cEn/zrhd4VkngAbaw=;
        b=ZLdULgyDjGGGjteUIiWQqkABnuGq4DXkNk67K/QciyUQTHf5EBmXx2fy3yqPLcomk8
         fvvjHPD6YQkdIOk1PzeiJZ38OpgSS1eJG5xRkLPqnSWY4xB2ii1sxupg0q4VmLqlRdTS
         nVvpYhqQPdzZEIobht97Z4assNmVuS6dVpeJ8mE0fAVOlTiVKRHFvZpfntoD4I1rBnTb
         VHUQM+VC3TOKmSbOAPb1EWNn6YfuOc87jvIBCcbP5eUsOk8v8JZGy9aT4AzzwaDIaJH9
         Kqk6Hcy6KCsjPvq2fdiSzzomPU31yF/H89evxl8+tSSq72ruC9whr/QdTKYEFJZPOGUp
         2cXA==
X-Forwarded-Encrypted: i=1; AJvYcCVXv+x/jmhQfwwgR1EM0D/4gKr3X5RnGrHHGAjzRrBUttc47HaGG1MYt0FWPawKRVlC6x5I5b37og==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw5LJxD8aCigpolATOlUqilH5KEQBONeYcmb2s/YB/cac0NaPy
	dj80V1q6QjPdgInRqpJt/DD4HgXJQlO2wZTxXbobK93enAWMiYiDnDjUtjS3CJUEaSg=
X-Gm-Gg: ASbGncvUMPM5SBkSF2mthAHjbr5zTM5YxpeGReCQV/QCDj+jVDre0QhHRrNYktkI30W
	XCnz+ywz+awuRy/eooYq6KjjDfwX+yCVlKdDPAigcAGKeGCljp4gClXXqEw6N492cSkg3J9Z2Gv
	9yD5hgrvCoq2vrj+Jyys7ge1bljrFok/3G3q89+MvWm/e9OmfhRAOLuvIyWkcJnivXVkkR73Nh8
	n+z3zRv061nqa+ZjOWnQDZsdSXxHbEO4cm82yF5uG11omoc93vh7uxlvfiXjawPSRtblP0hXYYO
	3STnIh542yRRXOWfpCft29XbBGfADTgasnWOkX/tZJT56b5lzQLAkCpEmoXpeWar7vWAf60bcXR
	5RYWBhuwb3jIgisHn7zaD41nhfqn8He3z39AFZTnQ7Y2VTAFK+zvbFiFPqpzHsY96RlX7xn8MM8
	8nlEnXC4DGa20KhAcfwXZWZMhfxABcJ2AF8qsDcRfA0AM=
X-Google-Smtp-Source: AGHT+IHCQMw8gkgpun15fOExG5Sy7WYN+BCNzSaipPURAOzJ4FqM/yDv4HIDN8wPjwaYW4Sy0gZ/Fw==
X-Received: by 2002:a05:6602:15cf:b0:948:7c51:1977 with SMTP id ca18e2360f4ac-94895f83afemr60413039f.4.1762542965062;
        Fri, 07 Nov 2025 11:16:05 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888c34c6asm118772939f.10.2025.11.07.11.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:04 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/7] dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
Date: Fri,  7 Nov 2025 13:15:50 -0600
Message-ID: <20251107191557.1827677-2-elder@riscstar.com>
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

Add the Device Tree binding for the PCIe/USB 3.0 combo PHY found in
the SpacemiT K1 SoC.  This is one of three PCIe PHYs, and is unusual
in that only the combo PHY can perform a calibration step needed to
determine settings used by the other two PCIe PHYs.

Calibration must be done with the combo PHY in PCIe mode, and to allow
this to occur independent of the eventual use for the PHY (PCIe or USB)
some PCIe-related properties must be supplied: clocks; resets; and a
syscon phandle.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v5: - Wrap lines at 80 columns

 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
new file mode 100644
index 0000000000000..b59476cd78b57
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe/USB3 Combo PHY
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description: >
+  Of the three PHYs on the SpacemiT K1 SoC capable of being used for
+  PCIe, one is a combo PHY that can also be configured for use by a
+  USB 3 controller.  Using PCIe or USB 3 is a board design decision.
+
+  The combo PHY is also the only PCIe PHY that is able to determine
+  PCIe calibration values to use, and this must be determined before
+  the other two PCIe PHYs can be used.  This calibration must be
+  performed with the combo PHY in PCIe mode, and is this is done
+  when the combo PHY is probed.
+
+  The combo PHY uses an external oscillator as a reference clock.
+  During normal operation, the PCIe or USB port driver is responsible
+  for ensuring all other clocks needed by a PHY are enabled, and all
+  resets affecting the PHY are deasserted.  However, for the combo
+  PHY to perform calibration independent of whether it's later used
+  for PCIe or USB, all PCIe mode clocks and resets must be defined.
+
+properties:
+  compatible:
+    const: spacemit,k1-combo-phy
+
+  reg:
+    items:
+      - description: PHY control registers
+
+  clocks:
+    items:
+      - description: External oscillator used by the PHY PLL
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus Master interface clock
+      - description: DWC PCIe application AXI-bus slave interface clock
+
+  clock-names:
+    items:
+      - const: refclk
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  resets:
+    items:
+      - description: PHY reset; remains deasserted after initialization
+      - description: DWC PCIe Data Bus Interface (DBI) reset
+      - description: DWC PCIe application AXI-bus Master interface reset
+      - description: DWC PCIe application AXI-bus slave interface reset
+
+  reset-names:
+    items:
+      - const: phy
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  spacemit,apmu:
+    description:
+      A phandle that refers to the APMU system controller, whose
+      regmap is used in setting the mode
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  "#phy-cells":
+    const: 1
+    description:
+      The argument value (PHY_TYPE_PCIE or PHY_TYPE_USB3) determines
+      whether the PHY operates in PCIe or USB3 mode.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - spacemit,apmu
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    phy@c0b10000 {
+        compatible = "spacemit,k1-combo-phy";
+        reg = <0xc0b10000 0x1000>;
+        clocks = <&vctcxo_24m>,
+                 <&syscon_apmu CLK_PCIE0_DBI>,
+                 <&syscon_apmu CLK_PCIE0_MASTER>,
+                 <&syscon_apmu CLK_PCIE0_SLAVE>;
+        clock-names = "refclk",
+                      "dbi",
+                      "mstr",
+                      "slv";
+        resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
+                 <&syscon_apmu RESET_PCIE0_DBI>,
+                 <&syscon_apmu RESET_PCIE0_MASTER>,
+                 <&syscon_apmu RESET_PCIE0_SLAVE>;
+        reset-names = "phy",
+                      "dbi",
+                      "mstr",
+                      "slv";
+        spacemit,apmu = <&syscon_apmu>;
+        #phy-cells = <1>;
+    };
-- 
2.48.1

