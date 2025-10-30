Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBE53176EE
	for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 22:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861791; cv=none; b=IWPqNNQh5uOIuzrgDDDq8e2xQxMZa0borL+ATvbgPrgswvxDp/d/B9Xwv5WiGjROFcKFMvqOmV7hweUkQw3eBcY90YXOmM4wUBTWRz+KN4YXQSXxLNlHObf4kUCgUTEz6v5peX7pnflHUqFmMjKZu07p/BEQqco2V5+ihdEuL2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861791; c=relaxed/simple;
	bh=8LppfTqRL5l2SybiAnwAcKY+acsrML8ysTdBgNm1hLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovwcOBhZGvbpoVSNhZm6oEOl2L1OzuKSUm2q6vqJWsIKW3BdOxjJJfZukbxC+gQLK42qHHTDGtxv4eq6aS8QvbCHv24nqwWa157rMrrUbcNFqEYhFgDbhrCQs9q2FLyNd3AJROzAj3TVnSdlCJhQtzsYqVzGZXkTSlWgzb6B5kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JBqGhf4a; arc=none smtp.client-ip=209.85.166.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JBqGhf4a"
Received: by mail-io1-f67.google.com with SMTP id ca18e2360f4ac-94822ad1baeso36433639f.2
        for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 15:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861788; x=1762466588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=;
        b=JBqGhf4aD4s8hI83li2PNH9KPLdi6EhDboK+W5s5RJoiPKa5zsHuOp2Uni3w5aJOST
         KbHRKb1AI2rDMlxedMHhnPGvolqIOn7k03WXGW9TGgTVeSzDWDH4z0Q0rWNmfmfVT+K5
         KGQ9+enGVN46VRbCaBh88Gh4Gya4THEqsE8TR8v7fvHd2UpNpbk5XYUG3g9Po5ZBv1T0
         Y5skh3SL/74LkcHaEGZVogLa9ZB7mYzdkjrQaoNFVeHY7fxm/nOF6LZyWxuiM0c5TiaC
         D+fSuAj93oT2CiF8O3jOcoO4eerkcriNf74rltWRQ/Kti/4LJbAO3NJ33yTpVjRoPt9w
         cAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861788; x=1762466588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxyyAVz+sgzum76hhNZkaYgPP0OtOtVsykA+Y1mmKUg=;
        b=l0r1I+w7H0/3BO3CgWmQlIHn5MTKkelP9O1F3YU8fmvIaWj1tqbt7yUFUTK9VKkcX6
         JVJaDARZap6geQgwClraVVK7xSa6uPCieZD+2lgK6O/a5DDvckRpNPWPWngeL4/Ye/lb
         rVw/caqdAqF/YqC2VHQOfqfRuwZG/iOxi9yQ9kHMyZLx9nCnTYhnoy1b5HZjvKpseEhk
         S/ZWa+B20O2UQvfTaWNt/PidjRGpbqiAsL+GBXcVgFP9YTouwhtQU005luFjjw+PWzz0
         4VbTf43zRBdvojyzX+5lLO9gdeCXnTq9+Tkh+KDw5jJKaJF33Ca5377oSV97PvTzZhn4
         hsmw==
X-Forwarded-Encrypted: i=1; AJvYcCWoL/NkFnmwLvm3ESM07WQLzDI+TU0+BuQ8SQFmmHA+NYBJDMEIPlMhx5Kt+IXtX16H9K1ADx9vPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW+4V2Xy+SB6Gzw2nbv1G1WU1/PyDaVr+esf0J3lS2/HKDVqzC
	OZFzEXgpvjrE2ESevTjC9+EAV3hymxtrQVxi5nK3kYDDAhs8vfHWcr0JXF+MS7p8UL4=
X-Gm-Gg: ASbGncus5XJjcfHFRtiu6jxsnilTuiQIL52STPSkXqxCxeKKjC1dgy1woM4xI+5fZCe
	FTQFdRQ29TuXzspMEBvnQe7hXFbTZZFvDOvtN2B+UwlPMtU1pmzEd2Hw7rBHTgegGRK/PzIqtS9
	cGYS1mNc4X5EHLP1ySpJvMQRB4aqdubt+fGSR/ZeNBQam5LGxN1zZvvbiiLsdNV1F/5ygde/V9G
	YR+d1TGJTKXPTL18e+YX8uDQLURcg1l9iH3a1xlsZrVgqlUAeD6LfxdoarinxFTQTFPGc1D1uiu
	uMBCufzJOOlCIeODSHA+w1XuvGuOIBkfphT6R7ghDLrxfTiPcyBic/219JtjJTfGBoI+5W5+gnJ
	1QTDcDI53mZ0nvAMs2WaOim13qiF4HJKtuThfFJy+5bcH7xMSGpjE0uCLSADdL/KL7GlCkoP1Jg
	4Kj5as7unNm7Jh0MPAqHSWeaaS1rGDqHSc/E6jNMYuY8I=
X-Google-Smtp-Source: AGHT+IGz6tkmi1cHmh6ulh0zCDoSzwGc5CJvBHc1MrsOfeBEWn+5+KxyIgdxU5iCd47VdKbfJn2utw==
X-Received: by 2002:a05:6602:2c92:b0:945:a58e:ba03 with SMTP id ca18e2360f4ac-948229a4807mr241086939f.8.1761861788149;
        Thu, 30 Oct 2025 15:03:08 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:07 -0700 (PDT)
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
Subject: [PATCH v4 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
Date: Thu, 30 Oct 2025 17:02:53 -0500
Message-ID: <20251030220259.1063792-3-elder@riscstar.com>
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

