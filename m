Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6D2D23B8
	for <spacemit@lists.linux.dev>; Thu, 13 Nov 2025 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763070351; cv=none; b=n2+qdfZ6taSECxY56RdFXrrT5TQszvx4Yf1dU+xOf/kUQDDtmoa89H6w4lmZgtdfJxFIPTw72nA6My6YYMOF6LzORx9lrlG8zHPO54FVF0WMCJdsy6IGH+99OwC40Gm9UcM9lpIjhmmQhFtsTzzBkAMqw273QidSpXVjT7lANsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763070351; c=relaxed/simple;
	bh=8LppfTqRL5l2SybiAnwAcKY+acsrML8ysTdBgNm1hLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usKIhqZM5K9mCyot6gLJqxTMrpLM4zkIKZDnfx1Hl2sfxRgnUzNBgN867OMn666XK+8wg/KR54FNlUQIm0SzVPC+vYxE6TVdGJq00sW8kjadSaOvCBKLcIDf5jSq34ZsWO+ncBlwnG492TFw+HWmF8z3qRYBXHJZqAX5xu8uk9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EkE5AMJu; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EkE5AMJu"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-43320988dcfso5950295ab.3
        for <spacemit@lists.linux.dev>; Thu, 13 Nov 2025 13:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763070348; x=1763675148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=;
        b=EkE5AMJuHPoZ9yNGAbXpTDlXWyPbFDMXq3im8avoMHql/s7XOSgyPtT8G1uX/GULd3
         NXpb1URQ62tU6mPUMspPKnon0VPOPibrU5yzOgcENx2Sd2M6qswVXtbDoDhRlFf+Yd4/
         DXawBxbbSyJCpxTCD09GULxXp+Tso4L1K4Qrcsi5z8WJkqYsCviPq3koIO1g8sT/L1DD
         bCwu5MUtjxCKP2D2HkoZP5GjvtGgP3kq8ikb0Zsk+dSOK3QojZG1/wUQv2ZlV3/uFaUi
         d4I/4XaCBnQac7JFFw6Mor8XN5rwQZ+pScu+33czScpw1QPNfmlzjc7LhvhpY3jHRu1o
         jEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070348; x=1763675148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=;
        b=pHsiOEvjfauW4NdUN0K7WPEV7710ACDDTpWw2KOWPn5ywiSI4MrThCowyCE5mme7f2
         qQ+pepHDFZS28Mk2374vI7lojWr1bbtjkgcv/k5fzhF/4fUcKmBjK1eGWedbALS+Lch0
         QxSa0NNfOQUhGAYqtxT1LntZMCBEwlq+MfvbDvt7m2v8RvEVcFh9Ymi74kKLinrUZvQl
         hhZoilFe/+zQeAFsOtuIyzliDsQ9d2IC2cCnDVdSbUgfMixOVonHznhmbCEV0yicPqtX
         HggF8Dwl1N7Q0KOrMXFl4dPEsE/h0w8Z8ksCAYYbwjXth44Vep601g3esGFzzMe7Q95v
         cR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2zsk6/TIeHombx4Q/VZmJhTvDNjKkEodnknRA7GQXMG92w21tNCuRJTJkd/kjuiuVEc5B6H2EAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6ji2OaQAb+0TVuBrv3VV6d3YpKxM1lXZHQCmWV0dRHZlZNvt6
	njOWzvgaXUzDYwM/HOmYL22kGpOiA1gbhwdVs1WQnpn8vV7PzGEf+MhJ/wYY+gVySzI=
X-Gm-Gg: ASbGncuBNXYTKbigA9UCMVChaCZf2qYW8+zhdwg+GtElZItw4VMrdMPkQX/EBq3PoKJ
	qSpomZyjvVOssHFwlnoFzCGX2u4UBIGwh1rHC/wfTFRDrxuZCngKXxbQjAmd+ebFEaKRCovpfmE
	aZgJEXOpKpxOo76kV7+dI7I32UzqwKRId/1dfd5nJ1qJEUOW29lyam15VTbBvysRsTtpZyF2E1N
	7WxOgCoqkjr9HZkWIM5C/UFKodkdlDpLFluhAYVwdtBOs1DutG9C8Gbrw6z7gfv7shq0Amox+LY
	JR2qwmYMPeiEA8KGPWzcnrP5vTe8w1joLeRJlxhmPNFhu65Pu7NNuwTYKDp12wZhPA+DIgXBVbL
	BG35c1Im7ywrEdjj0LpCk2HLUU5NqTigjDzB0lVF7nd3znbvvgguJKi/jWb4RPPwMilWZPLpoXO
	fdosRkPm+l1JkT47vSbHF1lOaC7zYlHrdYNqeYPbrCdd0yc4xCg8IlUA==
X-Google-Smtp-Source: AGHT+IGBzq32Gwd/w1dsCQxRVXMGXyEzSrmOWSlAFvmiA2MTt5gy/g9voUkgRjr4rNHNd8IF81q02A==
X-Received: by 2002:a05:6e02:214e:b0:433:589e:294f with SMTP id e9e14a558f8ab-4348c93ed24mr16120625ab.27.1763070348557;
        Thu, 13 Nov 2025 13:45:48 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839a4ac7sm10877115ab.25.2025.11.13.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:45:48 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ziyao@disroot.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: phy: spacemit: Introduce PCIe PHY
Date: Thu, 13 Nov 2025 15:45:34 -0600
Message-ID: <20251113214540.2623070-3-elder@riscstar.com>
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

Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
K1 SoC.  These PHYs are dependent on a separate combo PHY, which
determines at probe time the calibration values used by the PCIe-only
PHYs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
new file mode 100644
index 0000000000000..019b28349be75
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe PHY
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description: >
+  Two PHYs on the SpacemiT K1 SoC used for only for PCIe.  These
+  PHYs must be configured using calibration values that are
+  determined by a third "combo PHY".  The combo PHY determines
+  these calibration values during probe so they can be used for
+  the two PCIe-only PHYs.
+
+  The PHY uses an external oscillator as a reference clock.  During
+  normal operation, the PCIe host driver is responsible for ensuring
+  all other clocks needed by a PHY are enabled, and all resets
+  affecting the PHY are deasserted.
+
+properties:
+  compatible:
+    const: spacemit,k1-pcie-phy
+
+  reg:
+    items:
+      - description: PHY control registers
+
+  clocks:
+    items:
+      - description: External oscillator used by the PHY PLL
+
+  clock-names:
+    const: refclk
+
+  resets:
+    items:
+      - description: PHY reset; remains deasserted after initialization
+
+  reset-names:
+    const: phy
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    phy@c0c10000 {
+        compatible = "spacemit,k1-pcie-phy";
+        reg = <0xc0c10000 0x1000>;
+        clocks = <&vctcxo_24m>;
+        clock-names = "refclk";
+        resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
+        reset-names = "phy";
+        #phy-cells = <0>;
+    };
-- 
2.48.1

