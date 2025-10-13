Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A730FC30
	for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369735; cv=none; b=lKOuSmqSdyiJtqS30rFmSjNftbNYimnNYVcSBwz+78P4gGJyU/FM995/FdB5g8IawjyTAIp2vZIvxR4PAD/4PM4y75H1mp7ULC3QtvdCgYmDZaYdb3uWBi/clGAqwHLzE+K5WMe0as6q/PwInHzZMTPj4TDKTrh14X/uIf9UIdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369735; c=relaxed/simple;
	bh=BpOZ7MH28/mxqVI8xL2FBxK2+2yB/1BVmp49i4x2sTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOBxMAoGwWCgk/tp8AaGOfcArod0x/CcOoCQ7nIslGYO6HEdISZ3Ne9M1wITTotVgcUBuFUqA9Z0WEvh4SNUP9jAixxF4TQXrFu3XnwGYhJfHF0q5jBLuk/40yHaxhmjnLcxIaqqXvFJalB7zLW47sMDMRGnvNjuo+E0oig3em0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kXTEDNmp; arc=none smtp.client-ip=209.85.166.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kXTEDNmp"
Received: by mail-io1-f68.google.com with SMTP id ca18e2360f4ac-93607aec358so72221039f.0
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369733; x=1760974533; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoI6kMthZduzT8ZYZ3qN3cAQpgGG6MRRgU4QbQyijoo=;
        b=kXTEDNmpSCFkPiCd/AJ6GntBfrSALhgjBNR7fsmPzdX8w4RJzoeQ27tYGYtXpM7Bvb
         n34bP0PL7r8CS463gRrMMuWCWRTUN/B1ji7u2heZwvfUZ+XYPmBYEWw99sWMzB5iuNqG
         akSYHGxAqIt0WlV1RS7kW2jP2mLfKdFdK+n2e0ZU0fxDOaXeqjv2w6hyzKhB4ybPrzrN
         Lt/vmrazhdY1sohs2XrfeA8fFHPQJGHFMqoLfbSEdynBsSnlRmKtrKPL3IjL88bhLTup
         7KQ16tSVVqdmhatdz4PCzX4Uo7fzugHrs7vk+pIUZARAS26SqoF8IiewLAz0Lkv9miui
         AbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369733; x=1760974533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoI6kMthZduzT8ZYZ3qN3cAQpgGG6MRRgU4QbQyijoo=;
        b=qNfGquHIfSxk4Eb6XjmVegX5WOuEjSY3HhngCU8G5b5ciwajr588zGfi7u3juS5Qo3
         EYXOqlUkX1n28sCz6Za2I4HSCr47C+71kSRelzP22g2Nqg1mXmQuId/mQfj4azZdZql0
         D0AcqYBNIfBO4RIUgiJNDDZjh3FYUhrL4eX2xLxGqjohu5r1/yMdfISYrpUQ33x9ulg3
         2+/NOjkH/VEQdweMbl3FRe4qcY+ZwXvoDAzk34g2dQfK9gFFBitgG8nl0BVzTtXk6KbS
         EKNd1Qc4yKNdP3Yr0nZLIj6a+ZrZcn1JREQkUGt9sSKonuk/BKsu768eTwrTKDo1xMrO
         drRw==
X-Forwarded-Encrypted: i=1; AJvYcCVqSAtj+dRGPEwuzDDHjeZUXLEe3a3xJ8RsNLfMW8Tvbr2XJmkLR9ZN6MbK8ksGp0vqq+AwmLWDSA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpv7oi4Z4sl5Du/imu45boy7b3s0TLIGgb1he6kZ/85BivfIeM
	UUBGejtcmZ05XQUJNyh+qkob31+ueICK6haUEaA4HCquFVq6AYj+cn96Dk8+rH/5neM=
X-Gm-Gg: ASbGnctLkQKbr0A0a51t1A0ondwYO0IniZ7wLcsCnBICSNZjD8EIfRoeqrYLRmVRQ51
	7OLKNK+Z9hFKGUdt9MsvJ7jycPklJ90UZ8fHL9i/CveMysgp440HXOeCnBU5PVT+6ghzdxY6Mce
	d65d+nG9/3Fjfwn7Ne786VsH5TD1wvg08Pse99o0jDDSwTpiP/N25oCbA6YL3eooDCrjSXmeCCD
	Tn/fffZxLToZ4PjKXvsFDVkNv0Z8rL8cR6olbRsfu/Kjv7pstjpuo6LJKhEU5noyfOxQgUk4xfR
	G+yv0MZzx5CQKXT6nStvJpLJElC6VdGZDOS9z4TyPxWiStbFNp0CvhnPFFC2UqfBCyavNNTqFql
	qGggtXWFspiFEwQA7zXAmMRlqCLGiaSZfghYR7mVekOZHha/zkwiJ+p8svWFdNOwT81elwMhI9D
	Fa1xe9rW+t
X-Google-Smtp-Source: AGHT+IHNZy44agm51sCB0W97tyTX1zzziU2yBhjgQ7PRISv17V55+lCQRt+SG1OTrzoY5/d0w7/HeA==
X-Received: by 2002:a05:6602:492:b0:900:1fa2:5919 with SMTP id ca18e2360f4ac-93bd19882e8mr2625044139f.9.1760369732669;
        Mon, 13 Oct 2025 08:35:32 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:32 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
Date: Mon, 13 Oct 2025 10:35:18 -0500
Message-ID: <20251013153526.2276556-2-elder@riscstar.com>
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

Add the Device Tree binding for the PCIe/USB 3.0 combo PHY found in
the SpacemiT K1 SoC.  This is one of three PCIe PHYs, and is unusual
in that only the combo PHY can perform a calibration step needed to
determine settings used by the other two PCIe PHYs.

Calibration must be done with the combo PHY in PCIe mode, and to allow
this to occur independent of the eventual use for the PHY (PCIe or USB)
some PCIe-related properties must be supplied: clocks; resets; and a
syscon phandle.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Added '>' to the description, and reworded it a bit
    - Added an external oscillator clock, "refclk"
    - Renamed the "global" reset to be "phy"
    - Renamed a phandle property to be "spacemit,apmu"
    - Dropped the label and status property from the example

 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
new file mode 100644
index 0000000000000..6e2f401b0ac27
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
+      - description: DWC PCIe Data Bus Interface (DBI) reset
+      - description: DWC PCIe application AXI-bus Master interface reset
+      - description: DWC PCIe application AXI-bus slave interface reset
+      - description: PHY reset; must be deasserted for PHY to function
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+      - const: phy
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
+        resets = <&syscon_apmu RESET_PCIE0_DBI>,
+                 <&syscon_apmu RESET_PCIE0_MASTER>,
+                 <&syscon_apmu RESET_PCIE0_SLAVE>,
+                 <&syscon_apmu RESET_PCIE0_GLOBAL>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv",
+                      "phy";
+        spacemit,apmu = <&syscon_apmu>;
+        #phy-cells = <1>;
+    };
-- 
2.48.1

