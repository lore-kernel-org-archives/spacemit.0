Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2838533F8A0
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728069; cv=none; b=K1GUSvM3KW4ZS2Q7haSd5TRaWogqitgagXA6WzyI0qSHEXVQJrr3/6wAJgHnXbPiV1uBQT37RnRG6rtF3fS9HCccQA+ILAaimQzQ3/LY2uYX/+z4cbvliKFZeBFZJ6QTW/auwe3VLYNRw0D9duVz7QFxw7wLRopoJ136AVf06qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728069; c=relaxed/simple;
	bh=7WrOPVM0gt+b/Q/c9vY/ADstDCH0ZLchyGhM1A9P4gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRaNm5Wjtw5WhukcIzDAWG8n97bCap7QJ+DcrpjPOMmApTaRJlFFtmfbVD6hZpQuQjXwjWbAQgFH4/3MvlSUxjSfqpf70P8Ktkg217KbbN+ZB/TrmMS4GB6w49UK3uSmnyKBBY2/0nRWU8ZIbjFt9tWvonDxXbMtorQloVd17GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GIXsLcx8; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GIXsLcx8"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-42d8b15548eso12133685ab.2
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 12:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728066; x=1761332866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnj3ndeUMae3NyNArAGupVHJsLP7DcySgmrwpRjKSkM=;
        b=GIXsLcx81MuwQ2emTA6Q1DsPOETKBPJKPpgmyT0Q0s2GDQMLARY8mDuLe9j8D/IEF3
         bLPHARsqgYuT8YFe/jTxeCShxIqz3NrCUb3JiCiDSqs38b0MEXF8sqqp4WLFRyOXkg2E
         4bQ6n+DhaqC+NlvktdzHUUsr1p5/DIFT7wn89U+mEkmmLJVDM9gHnAa7bJNMlIBc3RQT
         ogDmv8eO1GEH12s92ZXE8jI7e3c9O9dfcZeVye4795kEb9ZvTWOpl0ff1dhfLlLxLgUA
         3LL/tffw0nKTFxmCLx/IkynnSH1WH5m7ses/u0yzBc+mc3cE/MYnUrarJAgZTodiTK/v
         rngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728066; x=1761332866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnj3ndeUMae3NyNArAGupVHJsLP7DcySgmrwpRjKSkM=;
        b=ETL6J/Lr/HJbGGK4DFM7FevmrHDGJWlrM1QTigkypyv8u/QrUnn6V+1Qt0xpudYmAP
         XZrEnWDiiuZJHEwX+/1eMMP8nV7UAECA2q0+H/sZDZPlqiq6WkDnDPvfZtnidt30vd6R
         xYkHYdZaSa7bSuJ+O6R0VNw0SBUEW0hoYT4LLpp+nu/6g/QAs4PG8CPYGB5IYNhWlrLG
         98fSIg4W4iaoWCyrrCv1NR9ICYt62WmVjF3OVi0mECswKz3NfznYjtjADumkmWv7Lo6W
         hU/8MZKMTqun/acREiQGA2/cH8C6bVqkVrVcl3I52ViNwbnVjRRfoP3WVRKFk65Kyp0y
         vCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1TcBiPlUO+HcHCkvUhiUhD6cltbT9wkL36U5iYN1vC7TjmFTu5x6ucs7m6Qar8Kozk3giXISQOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy199Nz3+gmS73yMEjOonvvmPu8I68+wagW+9aHbwUfKYQcAwJE
	B5v4lcwJvGucpv3FDt0TxAfyTai4ke0tRaSPyS0LgXuST4SX0T741RG0LJwp8JS6UiY=
X-Gm-Gg: ASbGnctTzhbOaPU4Vx/GdqXcGP7hK7Jmbiz3Z6kGjFWdI2QYmWvZuOlzt/vPCflMPMk
	QsoogXwELSNpGH/D3zGdYMUPpfJFGtyRZy8FzkcRiNQoMlfI92ry6KPuepnkndVQzV9zK7m2kI2
	xSLrLxSn1Eu1NLesFEEJwooAczFgiuIx0wtBGooP5qsMaSmipgApk4UQkn7pm+sC9bCLjeZ59nx
	jzyN9cbKX6/JhIE94UnVHkWxF2mPrXOvhMQOlMaFggMBKHeAXOB6nbymye0GjANzhB0zZWa3nJn
	0uWL6BLk6c+meOC8FU6d26etoUYWJZ7Xjiny5aI17Kco3n8iePYG3s/9vT2ufGpr9eSogFYT9wz
	B7XnkFT6WtO+XaSGaDYhPaUYdcsLWnCpefHGe2IPxsuziLyFcFTC/T5MGCmte2jUq/7V9NbQ09a
	FkeSROp6jhURVANqXb9jd0su2edk1+RIvZkNS9Nd7EQqCXnEAjkLTS8g==
X-Google-Smtp-Source: AGHT+IHytZYPq3sSfMjOZfFYHMcFE2wOrzrpGR8N8DWI8WbrnQAptaEbQ6cEghvzh0pSWjDXYscmQg==
X-Received: by 2002:a92:ca4d:0:b0:430:b05a:ecc3 with SMTP id e9e14a558f8ab-430c525f528mr67642975ab.9.1760728065914;
        Fri, 17 Oct 2025 12:07:45 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:45 -0700 (PDT)
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
Subject: [PATCH v3 1/7] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
Date: Fri, 17 Oct 2025 14:07:33 -0500
Message-ID: <20251017190740.306780-2-elder@riscstar.com>
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
v3: - Added Reviewed-by from Rob Herring
    - The "phy" reset is listed first

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

