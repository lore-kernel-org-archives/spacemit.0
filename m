Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430072264D9
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777728704; cv=none; b=pPWQ0MpoMRcKCSxLIwZO/tMEHezChLnXWX1hoUeFxXfZTOvPiz/plw6B9is65wdl8wvcW/EkVkOOlyIYqlUxnCZv/zzCE+2nnJwdF/93zrzHXCb9YimnWcvVtlzK75cKhXPSo+KyIDYzeNOEn4Hza4pgjnbmQPqR/sNJv3WXv2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777728704; c=relaxed/simple;
	bh=t/N7N/XSOQKrEzUs/D2pxm3VCD+rv1UW1/RKIJtP2xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRoq7j7CGiNxcO7He6p+Em8i/fEUHXyQ5j8jK2Z8zPuzWglW8m8EN1H9nQipgt6WXVHE+0VnS00krdIbdEvAluPwmHLwEzGvpVjM67C6M4Nw7uiCz6/+P0IdmTBKAFjhjcfqIXlNr0srTOyH5CHy5PHb9FP1C5czKL/YXXGuC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=YF7RY0XC; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="YF7RY0XC"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3650a628473so936398a91.3
        for <spacemit@lists.linux.dev>; Sat, 02 May 2026 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777728703; x=1778333503; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nc44VxR2FzsNOtDOyeTwEzMXfi//+xA2TCBmgHk8I1I=;
        b=YF7RY0XCTHjmpVz3iDuu2G1EncuiaQ7kritkPb5usy47K+ijvV0U0VBN1L5gyrF3/8
         Be6QTxwjz7F3RUEfKjhMxsl6N44VatTGYNMNVzn1BkAAS6Y4gFZFt5uOipEgbxK92wYE
         7aehZExvICCQXTVndJ51IGCd1V1ZDTIKiYes6R1v8wHVLEFG/ZxLbpxPAto+z+n7evVd
         3Az335nWCpg2XSDLFEQt0i1cKCDGY0yDyCNnwQJBfPmrjfduCcGcddNNpLOGkVm7rjkf
         fUQjZaurFsPQzMt63uDdHx3zXBWHeXq7Mh/ttpWX09u3vVN9KUQfOTN9yc29aUvdH0ip
         5Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777728703; x=1778333503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nc44VxR2FzsNOtDOyeTwEzMXfi//+xA2TCBmgHk8I1I=;
        b=RdidKWaJLLzLtFKMzrTyzP4RNccz+5E+XU7FZGDBqkywYsei9W0XktnQWt4fGoiAi5
         EeSb48XuXR58LhhGwp1mEpceMbc+02mF1YL71dn4iE0wofmoVvyql0qx/7KtSeojSF98
         AODVGkBcod1/k4b2KXk15u2wI1fdk/PoaofJVYaeMUVvsuTO+ydLuFnIJRVGxl0ldAN5
         175gVNi5dogu7OgJ4hmDgpKK54HPKjWN1x6xNkvQcv3duZ1h6435sp3Q4C6P6KbAvq6P
         1f5QgWfvM4ke0O4/ORalQUZ8yNi6iQnb01p/7BDxLYlD9V9MCQkTmpoQr9l3R1T4jHLf
         IY0A==
X-Forwarded-Encrypted: i=1; AFNElJ/a4nZgmnQxvxAm+2CO88hm13kcf5+cxCYfbKqR0jHUihhBe4pRLEzMmfuntvXT/5iF9Eb6ZrvIaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3HILGLP3W0R6RmHOjuLFFKPNAx6xwWtN0LhslLWsJu1pSivhD
	gMr72pjt5R8AwVeUty9PAYUK37dAR52h9zp/aASbBCZjay8MpF04NOzUElGaIqKFGfE=
X-Gm-Gg: AeBDiestOdmmDtFenIGhrNYo2lkBcaJYshhFJ/bFjxE2ulHDXfjR2sE5T6ihvh7baUv
	HuTV8XqKSs/zVqW5u/SRzfhOLjiO0Y7pCGG/FPRAc+FTeqIyyPlwczH1C5afi5qaeNvhMCwGSzp
	DarXka9ygI2FJB/IT03Ts9x4khIn7vGx/7Ie5DDpGP13HOFns/JvJcvhlMnZjEn+8Rm+3xOtxTT
	9Tw4AwwloZwrcJ+jCrdJmtmrXahA7p9r1IS9n8pMg+Jm6CWZVeZJrtrHgG0A9XUiawLsFZnYYy7
	nsLVXf/pHXBTKeWpXnYh3uWUouLiI3hfPbh7f5vuKapDrGpWVttXEmPV7sn9fiDCQ1qM/GV7zLP
	1zYc7YoH6gEDTmxYNO2bvo56lnbMlXP6B5LT2z5gzDUTAemA3ESXI/b7iMls20AAkMcU3jHidf6
	OxUEmWibOgOC4kjMKQI62Sb6j9sKqtvp3vEvC6A5NiYM296X6Qi0Cb5g==
X-Received: by 2002:a17:90b:530b:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-3650cdd0ab3mr3593006a91.8.1777728702492;
        Sat, 02 May 2026 06:31:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec02ab2fsm5647937a91.14.2026.05.02.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:31:42 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 02 May 2026 21:30:51 -0400
Subject: [PATCH v10 1/3] spi: dt-bindings: add SpacemiT K1 SPI support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-spi-spacemit-k1-v10-1-f412e1ae8a34@riscstar.com>
References: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
In-Reply-To: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
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
v10: No change
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

