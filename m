Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0EE3128C6
	for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369737; cv=none; b=CgnfrVl8zHtvWTV1aIAyaPXiH+Epngt9dtQEhwomhgbA/otTLpeny+6D1GUL5QsujsU8JZwDhJnE8JS5v1N1HR4ZWCDbZxBGvYpEnlUMLvts3UZpVDFxiBK1RtaFSa8F4SLB60D4a9I+Ea45RQCVeP6EA6PwwSq7bNJDim8QnJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369737; c=relaxed/simple;
	bh=hkeK1J/xegPc5qIcOqDK54lS/unN+bKpCdPA2OuYM+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhVaT8Dghmd7vPZi/L3etazuXmVoeO2uMuyGKFdvscOlvP+/z+2jo6o8g1S99oz6gNRXi7jeXbItEJff0Q7ULhvC0386bpa/rhdUHfQZF80vFVzV8kdYsL6Pf4BilNG7s8KRtfbq+5Neu0O0TO0+MxAwng4fne+RQRKJfLwO6NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KNN/6IuB; arc=none smtp.client-ip=209.85.166.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KNN/6IuB"
Received: by mail-io1-f67.google.com with SMTP id ca18e2360f4ac-917be46c59bso480736439f.1
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369734; x=1760974534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItZ4QqP7CdgD+87y0OCgM795Wvqv9yPDWR/uT7250ws=;
        b=KNN/6IuBwHgqDbck2SBqIsA/bXFwdEHJkww0qzITs6yqRMKgvUMADFGOIoxo0NIySk
         llsXB7AXZEEtiTxeparrYZTlOOWHc9HSK3Gibth2hCqKWm90FTB1d0uaPk4aSfqabXkv
         6dcBmmFu8T8xwU0joYK2OS5oELysSN4O+G83pp6UfM1si/pcKZcb2VuQvCKP2nRZazF7
         w4PKrOeTdYMbfeCXTCRguAKriROyuvqvAV1TYxgpRFkvpJrRuWIDdsWQA6hlqyeJEwLl
         dOQdXxfm4qazTByEI4ULKaoLs8jClsP17qoTB3xOsxkqYxQXEy0YOw7vPh66o7qNArF4
         90Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369734; x=1760974534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItZ4QqP7CdgD+87y0OCgM795Wvqv9yPDWR/uT7250ws=;
        b=Ph2/me2r4LtcAw3UNSMFSV9QqxW9AHRruXDgTurjr/x40n+SmICW0D17YnstqeTEzO
         AifvF/TGC6e9/s4Ox/8VGZhxXraKR9NKIVl0/lq/gNexTCq691i/B6TpkSQ3+CC1kd5U
         3N6o0t4/cbGPykk9L2Rz7lI6wZs47pvQJ0C9jkRbVrWTUxyFgiQUMuJZAOr5PrZeU7/m
         qD/94mrg95wxxt7cI28jVAKbZAhGnPkllgZmlULTJpJSsYk4pdcPkmTsTf3IYMVRn734
         PjxRxLhAo/ZpBCelZQRIgry0RsskDExpC3W+6oecKpQ0Fg8nj9H7f1UHtfJgjz/ibDdy
         tC9A==
X-Forwarded-Encrypted: i=1; AJvYcCVbmdZ3r8MW03ujMNuC1s/q7++4o1G5S1K3GMk8nE5nYYDf2Vu773Ro2LI/Zlq3k5APkk6aFoAj7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ+MT7xgd6vStxVfYLusMMSsnZ3WRs/B2B/fdbrEu1NsMp+7E6
	ngKwdKbfbM3FW/rluG8j9aA7wPBvADfA4Jm3j8Rod+5mqCynhqIn9pQSG2b4r5i9pz8=
X-Gm-Gg: ASbGncsBr9Lp5ButoPUlSWhoAfpJfue3zhonloHCsDBwM76xPlAFklQvP6+0OrkU+BA
	d84bLMTHpR3h2wRtExFUCEBwbJohmVFCwj7BjucXQj6fSbxmRtfIqYYH1kq066BZmztnt8wRBXx
	IHW1QPr5y8NoE1gOa4TpGP2/i26WJ4tTsIk5VhHa6VArnrYb+/17KqAEGl0m/FROU5vX0sdfZV8
	bKTiNLNLGL5fGgvoYOYHylnJqYMDJ4t/D4NZj69wu1Ispy69GFYlphNBSR/kJ0dM/TvUpycJufZ
	opAjy07aJt66xxxiZYqiyTTz2m7/xhwJjcYKPxZarsegqo+GXIA4DPTlc3eeomy+cGJb3fOp8Nf
	qr44XWisiudRL9XrzZLRf00YqhPIrkb2bBQuAz9/wwKLZ0RnLPmmH6JgKEfrYDcS4WVP3+3YhkM
	wthXw8ZQG+GbFerzRmDBg=
X-Google-Smtp-Source: AGHT+IFmberiHinW0psgBSVXvfzyFWo7xiMin2ObR4QgSx+XvFz7VLt0jdPRSfZZaq11AbbGpmoe2w==
X-Received: by 2002:a05:6e02:1808:b0:42f:a6cf:8afa with SMTP id e9e14a558f8ab-42fa6cf8cc8mr116550035ab.19.1760369734595;
        Mon, 13 Oct 2025 08:35:34 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:34 -0700 (PDT)
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
Subject: [PATCH v2 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
Date: Mon, 13 Oct 2025 10:35:19 -0500
Message-ID: <20251013153526.2276556-3-elder@riscstar.com>
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

Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
K1 SoC.  These PHYs are dependent on a separate combo PHY, which
determines at probe time the calibration values used by the PCIe-only
PHYs.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Added '>' to the description, and reworded it a bit
    - Added clocks and clock-names properties
    - Dropped the label and status property from the example

 .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
new file mode 100644
index 0000000000000..c821f6cafcdae
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
@@ -0,0 +1,59 @@
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
+  There are two PHYs on the SpacemiT K1 SoC used for PCIe (only).
+  These PHYs must be configured using calibration values that are
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
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@c0c10000 {
+        compatible = "spacemit,k1-pcie-phy";
+        reg = <0xc0c10000 0x1000>;
+        clocks = <&vctcxo_24m>;
+        clock-names = "refclk";
+        #phy-cells = <0>;
+    };
-- 
2.48.1

