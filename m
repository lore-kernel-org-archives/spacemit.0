Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB21CEAA3
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755110831; cv=none; b=qb9ZadtIetFACcPU3a88BABL0Tc2fP6L29DXXaNjU86D5hMo206sKbuV+bhZKId0izmd5rwR/Z3AShIL/tNa1w5LGDa3ci7pRwcbBkgVbST2Mmh+8rqB7GTsvvg9BbeaDBcKuRBC0N73kbJenvKkN1SgXoROrtoQQgSEEj0ZQbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755110831; c=relaxed/simple;
	bh=6NMcmlO0IFaTOKLW3+FNqZIRth4ITeWpsFOHQnAzm1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMTIMjoA64ntn5yJRtIOeTqmbeJmPsF9oZnuOKsBnppX8yteTiyTWFNQesRBeCpSMsEMwsZaq1C1og8yslQzt6jy1QjHXi5leIqkXNaIuF/OqCbB5B2K10WMaU3BMG0ylbBFNvpqlKnBccS+sVsPdMwmMiNvMgj/IG7q7e2Casg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GGbV6B39; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GGbV6B39"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-61bc559482eso663025eaf.1
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 11:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755110829; x=1755715629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg6P2z9viwKwM9ymHrPPMi8WbmkY0zEdqbuXH3DZMho=;
        b=GGbV6B39D9Kr9pTUb8cNMXeRKOt/PtdL9H38wxazFE6roHyRXLrwNomgweW31LKRkO
         4TX7B4PAo/SHvEuF52jmg7Dfj1vKM83HrCuvZDrTTexdNiIKTUWE+DyvCQmKHRFVlYtg
         yJw+AFzw1c11bhaBXocUtjY/uTUqCfYomLZHOkWRiA9MbE57ob1HTuHSRfhyU3LP07UZ
         9TzhygRqGdmc7qudyY76cn0wTI1kEnEKjDAmUKbqLYq2S3Xfbn16lls1iMlgPdtHtgRf
         nP1mV40cwp/ENV2+vx9QHOFGJ1gb1LY1WFYtl5jC/yNGdZ9py8GXsy6fwa5greBhBrsz
         CabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110829; x=1755715629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg6P2z9viwKwM9ymHrPPMi8WbmkY0zEdqbuXH3DZMho=;
        b=TId8CkFoM/htlLuY+Txxg9bou7H5PE21RCW4b9JzPN+RoK5hL/ZskGrgTdlE2DuGua
         I39+szKVkJdmlYvqrcVeb5CiTxfCNsZNug6HsjHHca+4CeBRKbJj+39Bd2yk2rpDxU93
         pW24PhljmdnO9EcVJUCsA2s/DHgSRh6eTnB5MnbbwMv+m7Bn6xYJz5G8BNxdq8DOJWPt
         tJgJk1Hmx+17iNWZWJFFrf9QobZI7WIRfsMq3Cq01WKBaW2ecBN/22Hkw46KtNflnhLd
         VGyQ0VA+NsIVGi9OGP0KRkiMKIza36JdHBPlvRWVJVbTj6s16HYQ+VinuT9+AOz8VEVI
         4/og==
X-Forwarded-Encrypted: i=1; AJvYcCUIKmOXFmIGN7Ii8eggFBRtDOo6DoushHAL3MVy5QPttPLaalvkvLokyvr0Ih/NmZCAA987PaS4FA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeQCEWX7YPwq58favWnrRMquwKO/RLNhlrbmxmQnprElPz2pKv
	L7eQF8eEAsxUA2naz7EzwE68RpAWx7zkmfNPZYqm9LW8l0+tjcHCUGKIZY1G/vvNTtc=
X-Gm-Gg: ASbGncvYNNNx8QmnVvLXYtVg1D10nUjUf/jXTj60LGViHXe+42W1dUupgP50Vg6v+xW
	tgMFNcd8YOcJSiVSVREtUILWebon3TXWOXINiY4vHJRv+0AL7Pi0QrhPDrHakcmYX2DplSzd1yr
	6KMYzz9bPmS17I/EQ8AdTjIFs6kG0d7740Xi1w24dXRAdn50f3bo0iIsB0jZYOA+6o/4LaRvqRa
	eRGDs0XiU6ux4gqLh/2LxDVju1HCHTyRJEUnlM7OIrU1xBlBLriV8cZia6Fd8XqXKHrUZfW/vlD
	3itoC8uERkkr2m7efUnwDG3C5yZmtm00jQZzJ1ofJjEf5MIz55VOpOpUED5UGshiHQVPAL41RT+
	c1/7nVFs0GFDw3OArrOx07JlG7QjatNRJ/TX54+tTEKl4Z+zmPb57HifGu7QP6BHY0A==
X-Google-Smtp-Source: AGHT+IGaEGAoO/Lp4qxdDE3uhCbVJtjLD2sBuNn3WDyAJ+ppizjeTU30ZG6CnqngpzRN2PHp1/gABg==
X-Received: by 2002:a05:6808:1446:b0:434:4f6:dd35 with SMTP id 5614622812f47-435dea6f7b7mr401755b6e.14.1755110828813;
        Wed, 13 Aug 2025 11:47:08 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd89d7sm3933104173.59.2025.08.13.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:47:08 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	tglx@linutronix.de,
	johan+linaro@kernel.org,
	thippeswamy.havalige@amd.com,
	namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	quic_schintav@quicinc.com,
	fan.ni@samsung.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
Date: Wed, 13 Aug 2025 13:46:55 -0500
Message-ID: <20250813184701.2444372-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813184701.2444372-1-elder@riscstar.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
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
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
new file mode 100644
index 0000000000000..ed78083a53231
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
@@ -0,0 +1,110 @@
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
+description:
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
+  During normal operation, the PCIe or USB port driver is responsible
+  for ensuring all clocks needed by a PHY are enabled, and all resets
+  affecting the PHY are deasserted.  However, for the combo PHY to
+  perform calibration independent of whether it's later used for
+  PCIe or USB, all PCIe mode clocks and resets must be defined.
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
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus Master interface clock
+      - description: DWC PCIe application AXI-bus Slave interface clock.
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
+      - description: DWC PCIe application AXI-bus Master interface reset
+      - description: DWC PCIe application AXI-bus Slave interface reset.
+      - description: Global reset; must be deasserted for PHY to function
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+      - const: global
+
+  spacemit,syscon-pmu:
+    description:
+      PHandle that refers to the APMU system controller, whose
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
+  - spacemit,syscon-pmu
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    combo_phy: phy@c0b10000 {
+        compatible = "spacemit,k1-combo-phy";
+        reg = <0xc0b10000 0x1000>;
+        clocks = <&syscon_apmu CLK_PCIE0_DBI>,
+                 <&syscon_apmu CLK_PCIE0_MASTER>,
+                 <&syscon_apmu CLK_PCIE0_SLAVE>;
+        clock-names = "dbi",
+                      "mstr",
+                      "slv";
+        resets = <&syscon_apmu RESET_PCIE0_DBI>,
+                 <&syscon_apmu RESET_PCIE0_MASTER>,
+                 <&syscon_apmu RESET_PCIE0_SLAVE>,
+                 <&syscon_apmu RESET_PCIE0_GLOBAL>;
+        reset-names = "dbi",
+                      "mstr",
+                      "slv",
+                      "global";
+        spacemit,syscon-pmu = <&syscon_apmu>;
+        #phy-cells = <1>;
+        status = "disabled";
+    };
-- 
2.48.1

