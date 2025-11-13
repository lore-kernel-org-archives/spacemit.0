Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D961E2D5921
	for <spacemit@lists.linux.dev>; Thu, 13 Nov 2025 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763070349; cv=none; b=go3/AcWoloIFn4aap9Z9dXR3gdqT+rRXKLlNy2Q70QDPDy5BGQ/uSNQmr5t+UoiputQYWlMlNxZO0QGRsJpP2lZdp6FyVa486QI9G4FTcJQu5fyQ33KmgwQjf1b8grH+HD6RdfmMM/m2/u5vJHEQo/KIL7gHbMJCX4vvF6AeTLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763070349; c=relaxed/simple;
	bh=AxniUDFPOEBa6Hk3PEu2qbO8OY5+iC7H8GeN4m2w6cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxU72Hzg3FMTfTsSJ6us0SCydLyI5NbIWeW4iFwEtJ7eIRCfxHayk8tHLD/7v1Tw1o75qkdKy+0aC/tXiZaQ1siGa/elsC2ANcND4YQiasUHlal/+KYqtYfBEQ3lwYMXMaO2psGBx1wp0ydgbXCucVjDLVmTKBaTjbgdMW+0CUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=V8buQ7ZY; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="V8buQ7ZY"
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-43346da8817so7970365ab.0
        for <spacemit@lists.linux.dev>; Thu, 13 Nov 2025 13:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763070347; x=1763675147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=V8buQ7ZYTeCbeX7o/zWH6+KkVWSIA9Vl6A3P7xyNom/7njhzwn3rS7s/a08EfFRojM
         vaC737EAzk6s1Tjl4mNF7cs2Kzd/KOqOCFA3dQDMe5Frr2cGA2L2nJyOwNjvJ20/Faxj
         SLoNV9867KQRSZVTJ8+z9DdOdDhTdOuvmXy4NS/xxWTddWF1FGhVd3asjhwLDcayC/vb
         HCgdrGQmMJlDnJbCN0QVy1FIWuBeE+GafpnhZKMI88RiS5sxm9jJVIjSp2zE5Ouv0Lp7
         YXeCbQvXYUBWqiKtcSEgYs7FFk5staUlEv0wO7eOX/OJR9nMY18pQVzwvrsA9tEqI/M1
         uj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070347; x=1763675147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=AX4+WyT4+0CdatAIJXGPe73sA+cdB4iRygo3xw/7k5uDkWamyFC8UJhFAid6R2yJfX
         62flLnnIKC9hb2fsaSXNOindpqPyonbz2u/ML82XMCGoHjaEKaXOVTW4vVqKFUmfDjat
         tlH7Zh3aBlTHl4VKU+SuKWSSAJJUJzAhl5pZmKWj3WxkVpyKWzgnFI6YNDpTAJQU2UbA
         zEi1J0p4ID5cCHKWbP3CRxmfGDIn1yh8i+GcIGevO5RCkQHitNjAJlNoURRr+yuHK/GD
         5Iu/8Z254SvNR4ZErd2PcZ6s8/BwO7NizIUU+gKRwefC+7Ffl8N/FEiyqiNUb8hknRKe
         co2A==
X-Forwarded-Encrypted: i=1; AJvYcCVnMweC8E8IL/3ZGQGGrW4N4Tw2fihMsUn11lcSHJIXDOeotN2N48ID4JXXJChI5I/KGs0/qmcbHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8lTivyVwGh2zy0pXAC3CiVeKCYPFz06jZdaqOgp1rwLqigk5W
	n27tyEGUwDiik4yOsCOxTNVFmrPCFyrZc2Sy+rOaEPkMvy0MKp6aec9lCz1QOxIdJsc=
X-Gm-Gg: ASbGncuzKGqR7qAco7F82x5reVagnt4iCpoR6xtRo4IWuARqaqkpXk6Jjzlnh+UA6Oq
	qCCBMA3audMKJ9eptCtG+4tDGFeHfJp3GGMyF6wlEq4rlm88+6DvCdg305KdtZ277xsfS53VaRk
	/JMCexCw9aURJdzpH7VG8sk49cPi6sbuj7kNKxLvzx6wJSPkUDSgj8l5Rg0q9VD/aXrx/D+ZzEi
	2M2FRbvLtdNfLTfMLnYjDSZPXhBLQahSJzQfBVpVUkIBLOq7EK2rfucJ4EBfFWFaRkhAfT6IP1H
	utB9CVmfVdO8qo27xGOiuXds+LBbcEIhiKJ1eN5AoFbJbMvWbMDPxBxfKEmjIzhXVDpCQfJcN3G
	arMFqEtmULpoQRVuk7NAxUtKZYgXc6R0dkCb0jA/HQY2LFFTuEY4ORHhN/+IKvIZHUiQU0B8buy
	czHuoAdYj9//U1lhyuK2ZRqHFjyQ0RbJnLiJgf2uE+zE45tDbJrrnZGML4xySxVoLF
X-Google-Smtp-Source: AGHT+IH0iaOFvKkFoSvyh+E7QrJE8ooJ0JLk+JkYQy9a2bR8btw1mCKtxexcV6NZgeMvAElxAUOLHA==
X-Received: by 2002:a05:6e02:c8d:b0:433:786a:5203 with SMTP id e9e14a558f8ab-4347c4c87d1mr64708185ab.10.1763070346997;
        Thu, 13 Nov 2025 13:45:46 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839a4ac7sm10877115ab.25.2025.11.13.13.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:45:46 -0800 (PST)
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
Subject: [PATCH v6 1/7] dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
Date: Thu, 13 Nov 2025 15:45:33 -0600
Message-ID: <20251113214540.2623070-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113214540.2623070-1-elder@riscstar.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
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

