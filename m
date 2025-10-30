Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB542EA485
	for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861789; cv=none; b=FtduFPRkdhcI3uvHLKhCba/6ULZaZfVzwFgxsIx9n7LmYgEzfLm6kY8AzU5LPxTm8DqQ4aJOTQljHPG6TxVt9EUHsB7EvMFrsc8n9r8C4W3II3CPwoTo0IiXIMoVEtbCVGGZAdtBDHVy8hkyutF8OONZ2l/48nJAVMEw0yF1vok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861789; c=relaxed/simple;
	bh=AxniUDFPOEBa6Hk3PEu2qbO8OY5+iC7H8GeN4m2w6cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WirlTImQrEwFG9vjRr3WcU64PLP3PftySOZmhNPPKkzsz8i1EbkDaHwn9fjlEY9L8sM+/vsbwLgpi6B/KgL/f5a+rNxjlXj4mnOpheZ58bPGOqxqgcAHaO/sqzK/FB7ng2DDEiyU81e48BkDVYrQimIkLlWcnGRPnpL4NEHTchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WMlKWFIi; arc=none smtp.client-ip=209.85.166.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WMlKWFIi"
Received: by mail-io1-f67.google.com with SMTP id ca18e2360f4ac-93e2d42d9b4so70028939f.2
        for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 15:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861786; x=1762466586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=WMlKWFIiZBtoTY+WlW8MIDqWDfZNlKae39EBofuORM2CUIt41PX6qjDNJFynUKFA5w
         lM3ZjmPpN1flTruEG8M8s0YH6aBu6pNo9q8QC9uNSDjN8h16ae8jSRplkWBa74yg7Gon
         Z67vQQwQrWojmonJXsoZqK743XI9ECqYkqm4FWxf1Cd6Josjf1XogaPQQNK/Ovc8mg4U
         1uzOaJJzdPsWTxneKIMH0INU3d7Gg9ej0GxxwDs+paMxdui5WPy29oEjNm29/9RPcDov
         R/MsrTw5s3pzzhIxH2LujJcCHQLDV8QbE7qsmZGVIRVB55aUQIVY/Ekt+UixaP0NtwA7
         7URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861786; x=1762466586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=Txbr2EpbwxxN7R81l9HMUdea2I0IyJ7BilbzVsW5FBO3uPoXjPuKPvAX0sqMtmefrS
         kuS37e411G6K5RhPM3hmwzzTKdimXfv7Z3fPN5uLQtbGj/MAKTivlTrwsYhe6JUaD6Pr
         TFq45lN58fTxfMGPpXXNedi8wTCMo8dyWL+JFNeAwvEGcs4bduvVvNyM3LMCyR2nbuAn
         5/uc3UM2NwPwXEuXYaPV2nseHVAgMfbngeAMlnXhjEqLqvLdwDdf/Xa/njfnOLqcoBBf
         PnsWrw0IEq+rx+u6epkgnoyJ/mu5ja7b4b4sCMl3EzR5JeJhXEafS9Lu3opO+xb+UIHq
         03XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPlyGbe3y2g/CV0Ap3K00KriBf7xEJItPNmz3sDINUgDkOLZsmwqJU4bbnvgZ5TTm/NTbBDggDrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8HduVJTIjotStsaq0Wa7whLDwHNw7eq+0UPmXmJWkuqemT4KC
	6T4gj2KcQBDjFl+W6kBqIqcQTOksZNjE8V38XLRQqOZ5l3ClRx3cYguzvUjREDbNk6o=
X-Gm-Gg: ASbGncvIZkSdoGpojzFilF7C28B37NW+W+KK60D5Sya05jMJLlXWRwRUPLvXk/8psjg
	qM/ftjaRny9FzqbbYcNaRxUICiVBDa1npHEH45B7kXNUr3v6aR0xMK6BABj4bUhyxLALAC+Wr3M
	IJ+nVol206v9f50OVli1qdnaC2ox1lN5j1p835Pk4Wqo05R69fY51SZF04+lHrhpoAf7hbN+1hp
	fnDTXtPoWUP1f8vTiojA763ngGlcfwdWDdbJFTl0Zxt7vLBaFDQ2RgiXxE4O9POztqNI24Yc1fN
	S/yM6/116MFLuBw9+TOGGSnBv3bJENeDyTVE1gf6KHK1T4OkjIdvSAjw0Tpy7E1mDGEfso7XNMk
	57DB2hmQvSS1P+l28OE4xJMqNIFubAhu98KmbfYHzn8M086WYq7H9YCeo20XrXUewDrsO6A8zSH
	2nMAwhONU+4XykCQMS8YGSI5pXQh/PCeMK2GeufnouZo7H/J8I5ZIn2Q==
X-Google-Smtp-Source: AGHT+IERTz8/RfKm9GawJGpzZTmHeZoOg9wp59F2G+F2vF71sv/DVlu5xpB+F19/2euE1IqCd4PCrQ==
X-Received: by 2002:a05:6602:3c2:b0:945:ae17:9ae4 with SMTP id ca18e2360f4ac-94822918f39mr229079939f.1.1761861786258;
        Thu, 30 Oct 2025 15:03:06 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:05 -0700 (PDT)
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
Subject: [PATCH v4 1/7] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
Date: Thu, 30 Oct 2025 17:02:52 -0500
Message-ID: <20251030220259.1063792-2-elder@riscstar.com>
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

