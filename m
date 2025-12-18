Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46A134B40F
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070765; cv=none; b=btdIIQTllBwQfYhvy/yakGX+s0B0Isjrh5MipwsdssX/vkdrfXy1i54waWd0GWkW1RD9xH/JttP8SpnRz+FUO7e8BhkAKRtBIjsRSmCeQnwo5Hwz+9SDAAGHM+gozsgk+YLD0x237z2VSsxHnUrgldSxuZoCPX25Pp4EmazZdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070765; c=relaxed/simple;
	bh=AxniUDFPOEBa6Hk3PEu2qbO8OY5+iC7H8GeN4m2w6cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDSiC76ook+Qs4T8aqrTiRlxntvrWqhk5vzcD+Av6yNVBRhhwp6iiS7tQS81WkHfChZJxwrzF4MNuBIx4V+Dyh7SJPSOICBZItajWaCv/Tntd8MHZlVUHBoMp+rQgGDRAtcXTzua5U/DlTRJNk547PI3VUrA4XLrMGWHj4mKBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XO4eCe7e; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XO4eCe7e"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b25dd7ab33so55179085a.1
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 07:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766070761; x=1766675561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=XO4eCe7e1Y8G6bjnJaB0Q1bNZesL433o7iu9B/p4cTp3Om/gN624sGpk40sXcZXmB7
         eJZhHCQZUFhyy7MI5GzpdUg842+hcPOzpWyEAkKPpRlpBSs7bPQ1JpLZs4QVeCFki9CX
         JkiKTdD0yRpZNQyOkh5l7P11NkaQ8zX70N3FsnZGq+xURo4o+BqyzQYFXW8T9KgHaij8
         qW6ZKECa93v+cGGc6XRLoXBAsUbO6oOuwyMzMhEwHlVA0NLyJZDr3MSjPY4h8ALXWzIC
         mvvECmL5bcqBkl5cUtWIm2nEMWKUwJ0ZDSsERZNaregWYCbr2yUlLgB19kcE9fN6W700
         gIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070761; x=1766675561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLTdLkz5qoTZ4VZft5RozafvHivyKGwCA/saZ7bnL/c=;
        b=jDiDb3Onl36uBxfVJlM9Gt/Xpd5M2LCRyQ3A6vVi1fVtmvB/uwpeBG/couIGXX6Su7
         04oGcFWQ2X9TsFN1JWsgHPz9eWhonvMP8JFRR+rHKsptw/RV8Env3EquLXfBWy6V2LHx
         ljGv4V/y4WXea4zJ6Ay9NYjapklZO7Fl95R7MBvt+8nvB0LY6rQxPSklrKIsGpD2GASG
         y2kI3JtpfwBEqsX/ZmcvV8qeJ/HsKZnc2qKwNb4+dPVqA7LwcAA/yQuS8rdSM7TpAgU8
         Gd7bXywxrTa9wHto+275hEIVo+bTqupUc7+RHrfzcq2ywjAkr+HeG1UnUkSvm0gmf77q
         lY3g==
X-Forwarded-Encrypted: i=1; AJvYcCVL4EeTNCnY4Z4OXuvQGDnreAm8PA33jFsmCEyYiTht/InJn2mbJ2Gkzlivyj4bCx+R5r13aVtdIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZiC5tiNo5JKxodJTiEmxjo7Rrw0FBQ7SECNY2hSXVQaRnBKtv
	0rlnXcGA0LGjt8TCFxn3Yl6BaDnAzhg97vQ1DMu6sBDu8H7uWx9i7J5ZNXPbjNK39u8=
X-Gm-Gg: AY/fxX6ru9Kpd8kXBsuognxBU/9GHqnpM+/6gM7ZDjpydoDWOiTHYOC7W05sc9yrKYY
	e+jeV+cYgEDznblDaSBCE0kGqyfWTBWm/N/sXzQf4MnfSUHzx3w9jfycuitW7HJvoaHI8GmqYEM
	CJcfkGxWXivOCujimvRt+QnYmyRjPPCz2mdhXuA9rRmbizATLkry6WWGHAMB9dmRvnLT0/4uJvW
	P/qc1dwnkPDIUG2IklAWkHR7lMHUTSkI2g7dSMTeQX6IdQ8tI0rQR+z/t9J4zBJ1cy8wDJZOIC1
	IP4n6nM7nEWvLjZ5afnqdwPUbcc3ilaFWZjB/30lfDl9WZDiL76+9frlmP8IkqFR7lR4BiqgJ5H
	LgEBK9PN7xkdCz7pOGaDpFQfNE5plSKQ8hRdEImIoEAFt47mptdfs6AgF3gG74ZS8jmWGzMM/vv
	DbIFfAhAyYp6Pd7olbS9wDjmktOIZnCFUJchrCEIaXV4YCzXdwIXK3Pw==
X-Google-Smtp-Source: AGHT+IHSKbVF665YqEXD6O7jBmj3jVOl2qS/oc2FAj0GURakfZVq9yDRUofhfwxuBkxQ2pFqUC7fSw==
X-Received: by 2002:a05:620a:6919:b0:8b2:e88e:a518 with SMTP id af79cd13be357-8bb3a384dafmr3194221685a.68.1766070761282;
        Thu, 18 Dec 2025 07:12:41 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d6952sm186866985a.3.2025.12.18.07.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:41 -0800 (PST)
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
Subject: [PATCH v7 1/5] dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
Date: Thu, 18 Dec 2025 09:12:27 -0600
Message-ID: <20251218151235.454997-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
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

