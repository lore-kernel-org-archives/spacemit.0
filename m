Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65F25F994
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569714; cv=none; b=eq5BMsiPxtO/hBOd+Omax1gUUw+DwAcbwImuOAuayDd/w587Rm6TRcI3pogurksdnqxkhLWmCRUdmgsUpaWp5m6GvrJbRKiFYcFchcrETBJC0cylShEXnR4xjDThHE91vMUHbiVW6im/o9pJhopKA8MDynCm42UEEC9y0l5JxV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569714; c=relaxed/simple;
	bh=Kb8uM3f8qILwL0GDllY38o85KB9kJ69KatRC0T8EZTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rh4/gavD5iF8CNtQ/aHqcEJHzLb66ppMtS0+hHvZt4WkpLakTRQJRgszl1/bcVD/SMXYtxRBwovxu3QMKQ+R8+kSYMZUAeYvDUTW83uuK0ts6NEBarrLv3TUjBvsUAzf2bIN3g16VvYLE6W/FdnQmbO/W3pKFH0/FGhDP13gVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WpS1zBxd; arc=none smtp.client-ip=209.85.166.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WpS1zBxd"
Received: by mail-io1-f67.google.com with SMTP id ca18e2360f4ac-93e8834d80aso187484539f.1
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761569711; x=1762174511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhpKl/nn+BHTlTr14XOcXWGwJsMuOmqiPlR2ItDHNmo=;
        b=WpS1zBxdOnOqZIXCJ6CY/+K1dhjDujJ4qTvAuBc+xdmUIamKqNaA3BdSQXoiNoKbxg
         M6I4kBZYiU5Hywq4j8evRiwuo/oEJbv0XeqNTsz5PsinPiY6BdpPM/Ct1GAxyX+LxgKr
         QdxO9KX7nIeJob9NkOb/IqreZ+CbvbP8Eo/AavkZOFwK8MmR3Qi5vlfi8HoVyTv9j/Vy
         eIj8uhjELBCpsbFX9KHYe81fufCy2dVFqA+SKHubJINa/40iOkFVyAj6n1NLPGPP3Yuf
         tMj1Dh/A0P+GBxCt3SnMKa0NCvpJwM9yMOMrtfYTtzz0qoC6pZBAJz8RirFyNptyB931
         wwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569711; x=1762174511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhpKl/nn+BHTlTr14XOcXWGwJsMuOmqiPlR2ItDHNmo=;
        b=YNzAb8qdF97sEPkhgct4LPc2HOAAioilIi2I12gYJcJXKspElPq7kjQFg1seTthpav
         DC4T4cUVMWsM0lnRoFrLibV5BH6XL0UgvBWjfGDW4aKL2xXNNNhLGhUpeg5rCR965U1C
         6dr2V9bBeuSbdvyoOH7CPAiNqmIcRLioil9K1L2rqonRbHvHeBwfX+AWn4SudDtJS3gd
         pCCMtjc5x/Agbcl6pdddWH0eqePiDEYu8ThMMHNaXZ9kHZp4W76owPjD3yYXMTfeotNJ
         khvX3kMsYrK1CuRYqtgV57ebecWhf5nKjMEfZ5P45MpJI98AlHXFPNEWRyFM6uj+FAe3
         0HAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy0cuL8CTMSC1iBBhaeeB/k8EIsmi2T++b3OqHfsQeSjBm8s12km8o+i88BAqzz1lZzSBQpkDYiw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6zGqGjE+XBLg8RjDArC5Xu30HPsQno/lDLxQdZgbFBWj0OqlJ
	GQZnta4h2mR8uTGCtrQL0ZWx8jD0YeITcFKRBxgwmlqaP7pLd8UVneV4IExQ8xtlD5I=
X-Gm-Gg: ASbGnctSaBYTCKwI6QLiOSh06tgvWT9HRi2dQZgViVKjEIpPUmiC50v7FhxSNaYh9go
	rNUNYSynvroeANN7YwmWAZRB5+nuAYsRou19CnUiAeSpcqIk5w32cVACv1uZYO7+/Pow+dMIzOs
	9JHBN/HKiAYCCIG+NWva4+X++QdXHwwW+xHenE9vN+CEUzJqibsUefiSlEBLAXOvrq6MTBWnwoz
	JQXPjhAKA7odVXDi8u+uUg/ZUTe86Dtcbk6hPtlGhLaJmMHXiZI2hKBR0akfAVbUctCRLlVGkV9
	ngRG+o4I/2PvpircGYlDj7s1tyykn49um4meZX5ujLm1Kei7pK8RKotaNDTcOmprQKIGSAdZ4VY
	v7mlF3Gr/CknSolfH4OzbjWCAuo2vq1pL670+5P7Vj028wSWSW9IKAqwf8Z6E+OsahHkO/uI0NT
	0ylvPuVKoe5DaDKyEvObY9IcRn/6MnZg/hYfD7BAb7P8OLHcgl5RU35w==
X-Google-Smtp-Source: AGHT+IEZEkJbHyJsLtQ9RwbUNNRM89do/GpofJnj3gjkHzKLnBs02AOz2LkYBC9YjYewuyvy3xtdnw==
X-Received: by 2002:a05:6602:c85:b0:945:a198:7726 with SMTP id ca18e2360f4ac-945a1988c63mr751875839f.5.1761569710940;
        Mon, 27 Oct 2025 05:55:10 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359e742efsm249121639f.7.2025.10.27.05.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:55:10 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Mon, 27 Oct 2025 07:55:01 -0500
Message-ID: <20251027125504.297033-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027125504.297033-1-elder@riscstar.com>
References: <20251027125504.297033-1-elder@riscstar.com>
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

