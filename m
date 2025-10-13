Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8C2609FD
	for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 12:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358798; cv=none; b=EZGy/3Ge3o29u/6V8/oSk2A0QRSZWOlEuhe34XzzOsrLILLK3etncA8aJOSYxct+qz+a8Sn1h612g3k2PIasr0RG9qptrD4uo5JO5rqc8Dk+DGHqmWzowuLWnOpXG0BRk04szwdn/a48MTeHcK9vM7Kj4G9TtLWmbATaZgrDItc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358798; c=relaxed/simple;
	bh=Kb8uM3f8qILwL0GDllY38o85KB9kJ69KatRC0T8EZTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdhDM1X3DbY31N+Z/3EnO4iOlzRtcxP7Wu8oBge6egyZXnW/gIDFzEjWTQ6hwQgrGvLRkNq/Q+2+nPj38ZLDUvcpOpKompfz+E3JbG8FdGS2JAVhqEYLO1IRTQk0mmfWwL68kG7TveMhyYrjYhqiBrtrRnYc4hCvmGRekDRPmQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=czK7FajB; arc=none smtp.client-ip=209.85.166.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="czK7FajB"
Received: by mail-io1-f65.google.com with SMTP id ca18e2360f4ac-93ba2eb817aso427998939f.2
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 05:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760358795; x=1760963595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhpKl/nn+BHTlTr14XOcXWGwJsMuOmqiPlR2ItDHNmo=;
        b=czK7FajBQpTlfsjnSFNGN6qSWl7O1V/OM4k+Xh1GGqr1eoBjEEGqgloCyfBnrx68I1
         ZUBq7RKmHsGuoLnB292LlNU30gd5jXypRz4AGpIvJK0tlL3eDugE0jctYZ64rhicj+pr
         B7MQeY2VbD3WlWyitWnce6rTd6EqLHA6WWqMVdTsDimuVPQebluqVcIf+xNSDWyWHmT3
         5z/ydDyzRiMTfGK2H9DPl+sxuQQoUCmkgvvp82dcjYoEahoHZzUsSp46+0Ys4dSajZyX
         xf77xDSwXv8HjxrVk5B1AR7SB9aEThe5anWvLV3aYkMW9y/NvT2e+70AqXMW5UC9xpJO
         tZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358795; x=1760963595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhpKl/nn+BHTlTr14XOcXWGwJsMuOmqiPlR2ItDHNmo=;
        b=N1csIVIaJbbXmB8jDiz6N3AQUTKCixeJmiBipxXfJzGSg7PCp4XWd6xrb/RPrnu5vI
         inefbVqrwok+24sjv0ItotANGuXvAgcc9wUSTwACiWYH45rbV4m7RS6y/Nf1EUlt93Mp
         pDrOcMYLzs+J3CieyWTGDIrPL3B/9+EjWC4+GaFpz/HBfhW0NLy1b4AJri86M7RfHiK4
         O4sNLBk/xdP5xVLIODWfpbr2RuwZi1fM6Cwkphe1fOO12jQxqxF31va6hLQWaf7aZt8A
         a4SSl3TnIQ1aL3yDHVz4Dl1jv26BOmHRAQjngyLI79wJ+fJc7wgGtGXxAkRKMP2TPaG7
         sFxw==
X-Forwarded-Encrypted: i=1; AJvYcCV+LiGYzhv07VnBJormRVtENMyvg6am3ZUKV2UY4TrqQJVOdJ1VMJxC/boNYmr7b1LK6CGDFE3IcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+ZzEtBX/HX+7souDmzwqMDE8bYiaMdZlyOyirF6695k+5Hz47
	whZ0FwHCkmu5l/l/AQ8vv5EnVOJom0vsTwKpOA8iErDxZXcUHxWociRGja7gyb+Fn8Y=
X-Gm-Gg: ASbGncsambKnwfFRX/Ipxso+0ajOXlpT0SZ8GsSqZiZskRk5NF61PG9KNcT31iCwe6i
	6UmP61MthfojDcqj1oYFTQcge5rlgv7vXIk+nlGk92x80NfxwJRIFwwcGCHG0A1sWlot/FGjXkD
	AIQ0MTcRZRtGKf9jLP0V//vPiMs1DOfayz6rYONGYkADe8jM8p5BigRdYX0EPhz9wqqZiMLI188
	kw9MV2jkUPob2CvAd+HGzIjF9WBEgaXSzegzq30d4Uj9zDQGvlzdFPX125T2dx+1bY4WBSzk2yx
	ubSSRsAJqknh6m/EUlnsVY9Dwo7uVYpB6H5gKua27N8fcGxw5Ntu6YbgdUDthvVuGU0o/G5jdpF
	AbUUCZt19nGe/mdvZ/lgK120TooXUqfSB22td4XN44O9brS+a/ZDrQycq46N6OgyZaW3vdBaVYW
	OJ/PnyxupOsr/Jr1Soeqs=
X-Google-Smtp-Source: AGHT+IGJ80l8YVhjRo9dBel9J5Pq3aK8ulue475SHMoRD5VOgdZxLEedWtLm7lvh3HivwJo28VCMmg==
X-Received: by 2002:a05:6e02:248f:b0:42f:8ae3:20c with SMTP id e9e14a558f8ab-42f8ae30b89mr224767205ab.19.1760358795380;
        Mon, 13 Oct 2025 05:33:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9037e344sm51529815ab.34.2025.10.13.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:33:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Mon, 13 Oct 2025 07:33:06 -0500
Message-ID: <20251013123309.2252042-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013123309.2252042-1-elder@riscstar.com>
References: <20251013123309.2252042-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/spi/spacemit,k1-spi.yaml         | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

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
2.48.1

