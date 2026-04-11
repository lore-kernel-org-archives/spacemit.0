Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC223AD511
	for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775833503; cv=none; b=Hm0SM5QhBt7iPKOhcXlB6U9atPtxX5k5wvoCGOJoZpcCGrmHCmBPGnLQl2qNXeE+URB/I8LkNC+rvGB7UbiqGs2mLmihwc8+ofVyPFX2JQ1G5MGTBsisVR0x2qgIrFGfZ3Bm9SqBKiKLUSfJdiRiWtIqrTNLyMuOKBUch5mJl0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775833503; c=relaxed/simple;
	bh=eheJmdgPgeqGeik3qq47b8UOd+nLsPopHTkXCW3k7Og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9yz5YXxiwXt0cLeVPRduEgBF2ETWEvOj5YcAhM5bE7YE9R7U1ILmq3RGgc+qtnEk/UhYeJDotRhsl3FZJ9vJGifeGjKFFb6Qnn/9qWJ3BO7ZHY9N4ZRFEDMALgBryvafMafW/qtiiNoBPR3QiTl1PXAVCNQoH6a92KjaxrtMso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=N1TFHyGg; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="N1TFHyGg"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82cef263bedso1078957b3a.0
        for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775833502; x=1776438302; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGwxGNzPNhl8p1KQjYaA0p0dmTpV8/UPLRrlCuE9w44=;
        b=N1TFHyGg16C9QXfbQSnw6IU/sYp7MRFdw0OZ3J+QMZXBSp682Gt9wse+/MPaQhTqUk
         hwqY2RGLj9U4kGo9SVGUz8F6IkFAEfidTSAkZlHoge5LI0bdvwWMAPQ5gVdxUcp6r3CJ
         vf7YsN8bq0v4yVRIbe8F/mSP3OFMjtenAHcDZ5x4xg9HwIcTb6sZ6+cci10VTj2SDNmH
         HX6SzDOkmVCL2QjvyYPAmlKOvKeMHa1DDZvwhxXT2SSgdASpKebqbRhcsPrkZqurRwPr
         0YwZBH3xD3Vc0WLB2ldkBtq2V8AW/9kHipWcZffLlxkVMzEVLB1LhyILlGORQ6cMg75a
         rRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775833502; x=1776438302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OGwxGNzPNhl8p1KQjYaA0p0dmTpV8/UPLRrlCuE9w44=;
        b=IUCAgii6GPub4cltF1qsmK0nmumr+uOmkQSeNdJs0D1yMJF5gbM+khRVyCrG/r6m4K
         AUhC0uAzfWK6KNXpJpDDmMTqOOEBpCw3ARIFbpz54R2DVwhbZGJnNNW5MuLcpdNch+qp
         UsDZG/CCDzWdhC+pxCo/B2QfbmqHN95hS8y9cTg9H5sZ6GfFfWeO5ibVWeCJZJxizDyb
         5DsMZvpNDGJzxZ0hmHsOYpsZZ5+iwVfPf/qfASnbfAoURKxY9O3Je3n6C2KwQSEOtvtZ
         5Crn2MaMFU2bTk7MgfRmGjflNcp/jT41xH/ALJieUYOEET5PT+Ke/QZUEUg8O3F8x0ug
         xFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaXh26NybF8aQAMJNOS1kXqVUSzXhUCy86/VtfPgiwLHbULxmSSk1MxhTx/5Zd6x0PuDnM6zvaPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXXH2619/ADXxN48i0Gx8+UBMua9yowHoe4Idfmq/Swa2IIbs9
	yco+9SiWnYCnD2R8bzU5Vh70hqBjCanE4k1oYlFD7wr5og+xfb43/xW5U/TsqGl3elg=
X-Gm-Gg: AeBDiet3KwkVEkbZ8gL+v85Fw8yehVcWPBKuBczckch7kCI/CBins+SkvHOKbKprfzr
	rsi+WSyvk9CdM+LHAbgjuK97PlHTgrPYwAdZuSolb9rRkyLjzk1fHsoFCsMy9DkYRZoTgqKL5hL
	jcj0OXZqW92NIe3DZGLeFkj55kWZEeb2seAhMBmBKsWwqvyjRINOIl36MfVUNY7iwDRzCSxvDTo
	xynP9v154EGgv/i3Y5XvDmTm9zkoJQAzdHfzxC2TMZMsxGxHmmHi9DBk71LARBmYv/pUDKiZuMY
	pWmN34lCUgNMznJRxiwU5ccgbJMmkyGl6UixXpaqdeEYg6+wOUkf1Q2BcMWvEk/D4t/20F4h1WX
	sapBq9rXUJYpc0ThxdX4NxcZWYj4MEm+ZozBVIythQQEMmJdG2k2QyV/jGXLJCX+tT6NGBeJhE0
	f18cUyZ7quEWehLBWLBxu/o4ShSk6BQZAItWvc22Fx/JUmKtEB+it5lg1Ve8YbcjB9
X-Received: by 2002:a05:6a00:808c:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82f0c281379mr3779253b3a.19.1775833501946;
        Fri, 10 Apr 2026 08:05:01 -0700 (PDT)
Received: from [127.0.1.1] ([45.8.220.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4d5413sm2970532b3a.40.2026.04.10.08.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:05:01 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 10 Apr 2026 23:04:20 -0400
Subject: [PATCH v8 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-spi-spacemit-k1-v8-1-53ebb48a4146@riscstar.com>
References: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
In-Reply-To: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
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

