Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF84634BA30
	for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 22:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758146852; cv=none; b=qLjUR7URbzbx2vRQFGTinkt2HauYcZJRfQPhsiHbFGgv6EbJ9S2tFQE/m4olHso0+hdNtnOsI/xAyqZTfZjWtffqQRc0SaaSJJERkt4sEfW7aaEtshORkRHaXqpf+7rnTB2lVy/bGBkvSc7tII/6b+bAT2DtB5qbDFrFUNwST30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758146852; c=relaxed/simple;
	bh=NnqiGgPMZUUR3po+CxEQhyl8uMPY80BcoRfsT7bEz7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8H678FNmGQj1Ar7AAH0cSKZ8JxrJ/FTWjrlNrGT638acBKQkjkPHOrgVScU+8H7EgQ4liF/DpBC9Pa+hODiGsls7JL4k6KeywLusXZzObOp8d9DaQzOdqK+cgvTOTTM6LHAUcaoRvXZZDHS4WRHwV64WdffMTZC/TwW44GNMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CACiAsY+; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CACiAsY+"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-424144fb09cso1517905ab.1
        for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 15:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758146850; x=1758751650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O00X8I4EestpaFHM5Nwo1tPeldmi7z2kuF+pQ0jsL/o=;
        b=CACiAsY+z8iYLz2Yd82RoV6d3ynEcrSwIG8aRzLayNrJoeIClMTXSlgF6tp5VuW4AG
         A7MhPcdBL/xZssrD+gwmNL+3ldv+t1y/7amlyWY0vDppwiQPzSRNqMW91SEozCwdg6dT
         xONx+a8KBrK5DvAufEu2A+8RgX9r1cHDGI6dG6+llFFFrkFPYUuWm4sg4/cEIhw8z5RW
         suY8+4W/Zoz5pX/WOYNeBC35bIydRuEw5jYWvOByC0nZK69qG3Y9sCCICW00GkLfUlJQ
         BAOzPjyhPjH6MQwgz1e+juo3x7J1jDeiqA/GBgBoqI2WYOkMVxofcQ8ROK2iXf5ymZ2R
         vOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146850; x=1758751650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O00X8I4EestpaFHM5Nwo1tPeldmi7z2kuF+pQ0jsL/o=;
        b=QgieDDVHkxHkd5aAfWUM0cn2aaNybeklvTYlj3EiKeyyCB4KK2m7Rb23vzyFI++g8a
         UDFDCT7MSFHBNSCAzg9pt/tqN5NOazOPuWaJ4TIMQqUM80b0B7fEWT4S+/lJ9EXQl8/Y
         sdROzGQiOAE34yeeT6ruRzJq1i9sUrWLBLpECrnsP2HZ0dkcrE3rAGBA+ZoQqKvJfssc
         Yv5soHd8bpg702jYhxmMpfKDA7wN0Yfyc9dZZhsnKDyHZKJzTycifP17Ao2qK66VxqRY
         n0PRPdmcpzKRYP4EG5c3HEBc0odZOYiRzNAAh2J0zhZpPuT8i9+cbYAj2MC57Zvy3RgC
         iQNw==
X-Forwarded-Encrypted: i=1; AJvYcCVLAnf/yfmVhSyZl4wIVvj32VXft078DBJg5O7u5GGUUEVUls029mTU3ctdkH4D2D2qvSRm1unhmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9s+Zevnj8RGJd0Dckixcxg/xjubKjD9iQYh14Bi2aDG3nNONE
	cy1SCCdKUUiyTx5DRdMh8r156c3wQztw9wqYlGtIFYXuA/T46/pEqpIDeOLJ9F6VWjA=
X-Gm-Gg: ASbGnctAUa5UTIj2+anIDD/6zHsgH8oRIPJz27HhDZaaVnrv6PM9jJ8hg9jURBgQ1aL
	xf3Vg01TPXW38K/eoQSyANJHherFG3IdeqsFvg5+JS4bnOVILK4UJVUx4dcH7kELnWF37+s1+9M
	PDe2NvKE/X6IMCE8GFooE41wfMp4D90Hahvo3ALea5sAKJzP+jIZMlO+tQi3W2sSEC+pHj/k+qk
	KJM/BrZZ1pmOonRfYEAquJ2ICzzVqK0QcO2hDQxq9/p9gSFdDEMyirOIGbsrMGVVYZ1J/KRaphf
	mt/YxzASdaUyVMldXkdyYCtOGVuly5fPJS0ybCCz4coSOrXZmLOi6ciT90BsSa+gFTeJTzr7YZg
	jNMOFes1iusjnUv1bT+HJ0YjJHZuUTpgA1lsE3RqwKsVJP3N40oNY8dsSxEu2+xHVmBROlnDya+
	smIEpUulVN
X-Google-Smtp-Source: AGHT+IHLVokmCo/lQggG9vmsqXV4YnaHaWdJqCCztWwsUDldvrgs2sfRdEFI4EmXfG+REFOg9/CmjA==
X-Received: by 2002:a05:6e02:218a:b0:3fd:96f6:375c with SMTP id e9e14a558f8ab-4241a54ae45mr48172145ab.28.1758146850031;
        Wed, 17 Sep 2025 15:07:30 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9f6fsm2346335ab.22.2025.09.17.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:07:29 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Wed, 17 Sep 2025 17:07:21 -0500
Message-ID: <20250917220724.288127-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250917220724.288127-1-elder@riscstar.com>
References: <20250917220724.288127-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..5abd4fe268da9
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,94 @@
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
+    enum:
+      - spacemit,k1-spi
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
+  spacemit,k1-ssp-id:
+    description: SPI controller number
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+    spi3: spi@d401c000 {
+        compatible = "spacemit,k1-spi";
+        reg = <0xd401c000 0x30>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&syscon_apbc CLK_SSP3>,
+                 <&syscon_apbc CLK_SSP3_BUS>;
+        clock-names = "core",
+                      "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts-extended = <&plic 55>;
+        spacemit,k1-ssp-id = <3>;
+        dmas = <&pdma 20>,
+               <&pdma 19>;
+        dma-names = "rx",
+                    "tx";
+        status = "disabled";
+    };
-- 
2.48.1

