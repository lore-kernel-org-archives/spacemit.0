Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CAD33F8D0
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728071; cv=none; b=p4hn+q7D6j8POn8GlMtXkOg6daQR7Y5B3/2Xpxio6/6hhHw0wpubFc/ikTi6UOzFJJNT5us4rdpPizm7bNl+M2gYoI+iUnd2s6dOI3dpMVL9e1E7+3nhOkkLDe0nTizRCD/BM066Ur5d8WF9elRORaVcf9aX1ScgF1lYNJTZ6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728071; c=relaxed/simple;
	bh=LLI/HQYDWhCmej4ouNtvXFhwrmFwQGLMws3w9xIK1/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRGyuhYd57E7/OGQ9LDijCeHgfxT48LkGMmJ843slbFg6QqM0NrSw2KDI5wRsHJnVPdB0sPW2+z2HShMmakvkL71McugtYHMD4ia7fSaf4s/8rVQlmlxkH+CV2CgvK4VpANBwk29QO7Bb9GPLos0XV0xL5XW8EQvjJeDtvuFdXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YJjmCvrU; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YJjmCvrU"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-430cadec5deso7111485ab.1
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 12:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728067; x=1761332867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/3BQdd3vn0d3oIHDdjobMfykMV90YiIp5S1jVARxr8=;
        b=YJjmCvrUZ8ca1AaK+o66eJrSMmxXWuF79uM/hbse9c7GPKT2fKcORW46GBevMMto5k
         eMrakXDw6bHJjVwPPJHuqxoe6p/9Sv/eAChd9qkye/pbhmFr9JwxKoGvf6xRaiABIzNO
         PeWJbjdiCti5Hye8NKD5I2iISJxE0NdFV42bnB2xb8svoRaD6B4uJyKCP2og0bESmibc
         AKhhhhFhWEDNSixjiWyusYjT6e/TAYia03fC++sCGaBppJxbiKH4J4+zJpFgDucOCSvK
         mUc+pW487GRPbBa5lY4NJuEb/BOBwiE2KqwPq8RSo2iirj5QsNGspktbEqn2/5Qg8T0B
         RaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728067; x=1761332867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/3BQdd3vn0d3oIHDdjobMfykMV90YiIp5S1jVARxr8=;
        b=Ijsk3GhutlXUGNSLzHC6hdCrrChQtzaV01n97slPxk6TXqx9yj4E4EGeRBOi+QpUAW
         QuqepnxgRJ1SncqByrUbWAe1AW3EwTS5zfgtS01yeXJ9WWxB/IoBf6064ugtTwvXVeNl
         SWJyA/eRY2Yyq2LSVy9dVuAxsaXAxc/6t/J2qF9nGbsUs5ES4uBB1SvzqTvxlwrv85Lv
         ri+srlrlNWeIkZekwxubebodE3W1HXH4/Go78tQcW3vW/qhAbpkqbefpE0U5ZM0S3Afn
         o1aXyC54q+I+Y6OrmvSo6XYf3TUs+T9422aerwtrS6V1UaAdvQyfkJKDK/r8E0NQnW55
         tcwg==
X-Forwarded-Encrypted: i=1; AJvYcCVq9Sj8XOWpVx/L6RRZJPL8R61GPY3gb8OwpATAOwhou8aOEJdWDvtNdumC+ZU9T2hYzE0wUv12lA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSsIpQpffKbN+2NvPq1WBcfYqBZZpkJYi7rDawDZWA2oKKOJzk
	a4IoGPxQ6xtUnVaUSMBztWDlMdWhF43I8nLWG0pKZPK1IUqbmHf9dt7sVZDWBfRN07E=
X-Gm-Gg: ASbGncu1naWaJLLLKACiE0OmV5TVNjnkky+Vc1mk31MLblqoNFRcK8OdRWrHSRlggM4
	oF9la6vBejQ7laRCAKlpkXgWbGI41lG8DXG3QP5ImJcyooPrA9lYzdNyhvTEAOEsJN1vnoKzqSW
	665zUM49ThKCgZCNMijFXUF1mUzpS7/Cxe1S3LpKvX8PDk1N2GFd+r/tfGq52Xino5nwWpDdqXM
	lOTac4AavupWwQSeHkkpk1/z8tjNHb7oSdcTnZi3gDIh97bmhetppGXoIXR1TfcEmXipylkBhf6
	K8WC/Ngfdpz5vFF3nxTcEeR/k3fn+7MQvaA8TagEmpXIKXz46ygdHxgxr6Fhn0q2W6FYOBZ1JyW
	OV+J1cO9ZaeUn/V7APZuxLGGDyDaH72J17PEXM8+1bXmnCCbvFH+dBrZWw0y34VUdea0xobwvNO
	T5r8Kzfrlj2+6jITSr1VRS2JPK+BsNzzVLiY/xvQczkesAOy0g0KhCQQ==
X-Google-Smtp-Source: AGHT+IHRtsRSfhWCT9BQG3DcVkrpn6NA7ODycaChUBpFYwB1ZdnsTh8SKsqwMx76IAkXTipom5mlHA==
X-Received: by 2002:a05:6e02:148d:b0:430:b167:3604 with SMTP id e9e14a558f8ab-430c5209bafmr76757915ab.4.1760728067217;
        Fri, 17 Oct 2025 12:07:47 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:46 -0700 (PDT)
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
Subject: [PATCH v3 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
Date: Fri, 17 Oct 2025 14:07:34 -0500
Message-ID: <20251017190740.306780-3-elder@riscstar.com>
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

Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
K1 SoC.  These PHYs are dependent on a separate combo PHY, which
determines at probe time the calibration values used by the PCIe-only
PHYs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Reviewed-by from Rob Herring
    - A "phy" reset is now required

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

