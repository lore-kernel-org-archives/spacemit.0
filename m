Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BB3D3322
	for <spacemit@lists.linux.dev>; Mon, 27 Apr 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298526; cv=none; b=IoqFL+iImSZpOWFMqMcGsO5NDJHZHv4RJ88cBZ/WbYM0HrMcEq2UXGi0Ual/8xMJtxnY+DuxQkoVM142Hb3x5mzv8Arpx9u6Epk1J0WH1weROeUeiZcz2am6Tf7w33nV3PxoBVNOvg/9xJSEtQuTN4TLNzcVEvUU6TF7DCGn90o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298526; c=relaxed/simple;
	bh=fJhg2u/iTIaljZD3q69iV8pLDNtu38nnqnZrJ0s0POI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9qk/7VhSFVC+2CNuR0AT80293i1ugOdzM2c69Dp5c5gL7to550KbCRoYazVu6+mMt62Js3atbzU7RnRN8tNfCbKOihZtm1QLqIIq8I/8l+f40vDZPgNoZkdsCm0P4ccVBRwURyHByMALTgIoqdKj9jHtjVdxVxI68t/iOEC1a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jS9W5MEc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jS9W5MEc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b0afa0210bso46879365ad.2
        for <spacemit@lists.linux.dev>; Mon, 27 Apr 2026 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777298524; x=1777903324; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0oaBw5eNc2BclV3Ait+0PeOTuCPczoggHsdIRqUpS0=;
        b=jS9W5MEcm9d/tjRMgQjjjmRYRKEKcMynpZ/3kNxT9ahnK3ke4twon8X1PLjtTqyGhS
         4VLDXLUE2Jt58rhJcoCGKDXx4fqCjR4C5tLs98dfH6z0Tyyqan7w6y2hJtElpwLbftwg
         UFOaPLGYsyIdHvVjOTUJ8/5hxhypFwnR3cFozjAny2E0w4BAqGWWusWKeMvWyGREF5f/
         NSAZ8LQtbv0uxVb8l8TAmPFlZ+GQ0Z5bVTFyIcPFhbBjgVsSLRCnh2oaeLSxuKrC6Xm2
         /E0kPVHyxL/8OPAyHOB2t3Ou+6fryzmhqwIHqqxE0tQy7G9eGqivTKQAh8lS5XJemIaH
         43LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298524; x=1777903324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N0oaBw5eNc2BclV3Ait+0PeOTuCPczoggHsdIRqUpS0=;
        b=HgiXKN1Eq7Yhu6PZlA2PztMxIN9mjxScUehWWFOktbPcY9o0X3pTCFpj5327Pqy3SV
         YZoebZBY6p6ID8UVzgDhvXveviKn6PncxiaO6i3pp/4PCEdFL4Y4MiSKQNPOt9ImUtgm
         RBKWazDRmmivY9yhW/712UmBntpZfudFyau4vVRq69lcexi6i5H6UmArqPhicp9FfrsJ
         evdnYUK5r2c5fHH192NAh/7vlnGq+AKVGkgSg/U4w17hqLdMtOQa+nnfTzB4KkeqXlIP
         Lqobl3FQc1gQh+lRWJGuBxCydrU/GF0SCtPXAJqSE2zEYIxiUT4CJz8xqn7ujrBpwT+d
         UrRA==
X-Forwarded-Encrypted: i=1; AFNElJ+leJVaPUHeXG/ieAJu+JwB8UXvB/HYLVTOaxoFIT4aodBRuf31XcW4Cy0X1Ts+Aux1DvPIXFOSTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwK5fxYyirdjuYLdCWEaqHMRn47uk5m259jkd6Plxi4fEfoUQv8
	B3FsqRQK16SsJEfeiolDD3f/T24SspC6VodSDheUGxQTIrWiTFP3hXz2rGwUSG5/oxfncytR7tO
	wufqgDcN0fQ==
X-Gm-Gg: AeBDietAR2jovHyIl1Hz9M5ARQutQx0wk3yfeoSFGe6o0ow3BkRxWpGeD1hipYbLO/M
	oG06aFoFnb1yVQavK2AYBQz13RG6sG9KMafwHz4VB9JlTYjjFy//J8+5VrSCVPH9aHNXnYZ9yKX
	hERsaG6bjU1EBZy68YC+PgglilE9ngV1jl7eKGv24Pl6EQdOeJLok56FzO190fkMOZZCwPVuQA/
	bRVRIgZVLp/O4JlDRJJe0k+P4GYdQ/V3D+qyKtgCSO+nzw/ns/oO9MH6D5tpjtidODsDUTonT8l
	r8vBhMVYqA3QMimHku0sz/4eu4WKBBaAgBV+O3effJpTir8ybwmc7gugfpXFTSjwsRjiBGfio0B
	Zhx1FOHhrD+ONnQ0Hrq4A+YmPqwL0a2uttsYy7pYlCRR1hblyU2WVlH9KubjRYbQeH2CVbslw0A
	++6oNocQ8AlOjJ/9b+YthnlowlLRoyFZ5mgTla1AdzE7hNJtDjSBfwuA==
X-Received: by 2002:a17:902:bd44:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b5f9fcd9eemr318233315ad.41.1777298523356;
        Mon, 27 Apr 2026 07:02:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm307143625ad.3.2026.04.27.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:02:02 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 27 Apr 2026 22:01:27 -0400
Subject: [PATCH v9 1/3] spi: dt-bindings: add SpacemiT K1 SPI support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-spi-spacemit-k1-v9-1-ff753b551302@riscstar.com>
References: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
In-Reply-To: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.1

From: Alex Elder <elder@riscstar.com>

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v9: Fix commit subject prefix to starting with spi
---
 .../devicetree/bindings/spi/spacemit,k1-spi.yaml   | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..e82c7f8d0b981
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Alex Elder <elder@kernel.org>
+
+description:
+  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
+  FIFOs, for transmit and receive.  Details are currently available in
+  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
+  K1 Documentation[1].  The controller transfers words using PIO.  DMA
+  transfers are supported as well, if both TX and RX DMA channels are
+  specified,
+
+  [1] https://developer.spacemit.com/documentation
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-spi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Bus clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    spi@d401c000 {
+        compatible = "spacemit,k1-spi";
+        reg = <0xd401c000 0x30>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&syscon_apbc CLK_SSP3>,
+                 <&syscon_apbc CLK_SSP3_BUS>;
+        clock-names = "core", "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts = <55>;
+        dmas = <&pdma 20>, <&pdma 19>;
+        dma-names = "rx", "tx";
+    };

-- 
2.43.0

