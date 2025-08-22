Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D8263F54
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832003; cv=none; b=YMga25/Q3wIpispyxIXE3nY0AWvh+ZrxMTnAodACKaiwNrKgo4p2ngfDyuUMFf/SDoilJnPcGQVWC0cJs4WM4B7kqNc1RES+PO2BfpEQ2VbeDw0RB4U0pooc6x+NzJV4JWfukHSHcd7+mq2XNwFKEH7wDw3Uvh34vnDf/F43roQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832003; c=relaxed/simple;
	bh=k16Ro7327MWHaqNkOpPs6wLh2gCwtpI8bM29orBEHX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7y2JJx5Ot+59xva9P71I520I5MaTCf+QANefV6g/2vuakKzCghI4Iw4Jy4TwO6qpvOAOwjSipzIgvv0r76xQkMtUsXwwbPZr/b3Es8SIqPJuSBUHBarw64mqQ3cY4P2wIO4bNhFZMJu3jH75QNPtkEJ8p3kZstNjL1RRqfJFFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=gjYI1+qV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="gjYI1+qV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32326e8005bso1858666a91.3
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 20:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832001; x=1756436801; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaYtJX2FWb8MRA+YGF1PwcizqXL95f52x/ivDYOROU8=;
        b=gjYI1+qVMo2Pce94SdgZm4c1WUwRtKDKWfxvKWDQy4aWEvttDxdwVnCIsKAYpQZ96R
         Q9AwgGa5Z7GUJ+t+Rc9FUq5tlS+TaXLfSU7yIDvpLLRcoKhYoY6BmFKWuNU+FzFcR5qH
         hWC5O7cM1DBAOMrrkoViHJprdyHTFvXIhWt8/uw/SJz5q842Nm+XSxUOQ+0m6jJQLyc3
         AOsTQeQbqeLdYFY8ubYul9Erqs6dh8aFVPWwxNKN80TmEsfTt2C0nAnZK6mDtC13md6t
         g6nl2d0P93wYkzRXuldHPGdxyS5FGNQd3Bwu1Ypv+CqkquvDhJDkzjJXpABgA4aOdTrT
         v1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832001; x=1756436801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaYtJX2FWb8MRA+YGF1PwcizqXL95f52x/ivDYOROU8=;
        b=FVvuuupH7VKRmwx5tp2WUQ71GoGtYCQDZeI8Nkht7FA5mvAItcrxVVpnOJXfQMWj9r
         Rh2WwfbofSnhbOgFr1VEaZ9rT3qInDC6DN4zOma/Y7lH/kkCiDgs/KxIH8cFVLrROB82
         5q1bAHcXyPIQxQE15Zih5cBWN3wSqoeb6QjSF+TL39VQ6j7Bf4/lx4m1mx2Zozt0QkcX
         LVHHmC0/BFdOzVwkW1rBajRv7izCmtsr0WEyKFb881tu5lg0TYQw+Sct61NiAnb5It33
         e0Z9/fawGtHMmCYJNh3Tv5XgeldTTYUVS40VqPva4jUW6gL9nI0/KWjUPgYxxh88oY2q
         w4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFXI6/mD+0ZSYuhkIU/T/qkFP2gRl1JUxKZY4msRlmQn5doUCZO/5toK6Sqb2Vc8jwuXLCT17knw==@lists.linux.dev
X-Gm-Message-State: AOJu0YypFmXqy5o6X27SjDoqSRDI9S1pptujhUbVCKlRjI58y9UALCqf
	BU/75phLjVRaCD5Qtme6Ngb74NEyzxYIqhY+5o+SlcWl7dvfnhf4PoQsaMwDV00sadc=
X-Gm-Gg: ASbGnctbMAhQsi0pQswLgfYomisEjzRHFdtG59ajg1tqg47QMBQKnRvL7679gxSz0Rq
	uo7uJ/I5fybR0INqwIn1bIjpRhs8dFRO1TkmAtuv5+Q8tctv+RChl+0AzxDhYuRNTdaBu9bOtz5
	wdHZfzV9ddW+Aj7kRTp9dpr4HXykzmdyVqq5dtKc4+ARDHy0iB3Hhrwa8C4V+bUVGkBKewHg/og
	SvuYDACsxnRvQLn9k9ro0Z1KRDTZUBBY8HGzpRJUzrsaRTM7yWQTv+PW4h03PIIjAmDyX6IaDT/
	HZAnYWrS+xHLWlRiLXwQ3taLrfRlJ6p2pdN4wunwVKcrqCncAvcC1pzsOCvvdG1FApRebgIaRr3
	v23hGDs2gjjHyfSroOVmrefFE+NVxjrgwVQ==
X-Google-Smtp-Source: AGHT+IHtoiI+ywaKLlu/wESYvwFaF1Wdo5+3G/aByEkmXZSAYsSzFIutpoI18vcBU1inhQ9OszGlwA==
X-Received: by 2002:a17:90b:2c84:b0:31f:ad:aa1b with SMTP id 98e67ed59e1d1-32515e3bfd0mr2287803a91.3.1755832000590;
        Thu, 21 Aug 2025 20:06:40 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:40 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:27 +0800
Subject: [PATCH v5 1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-working_dma_0701_v2-v5-1-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

Add device tree binding documentation for the SpacemiT K1 PDMA
controller.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v5: No change.
v4: Add Rob's reviewed-by.
v3: New patch.
---
 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ec06235baf5ca3ecffe7dba9bb425b242985660e
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/spacemit,k1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PDMA Controller
+
+maintainers:
+  - Guodong Xu <guodong@riscstar.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-pdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Shared interrupt for all DMA channels
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dma-channels:
+    maximum: 16
+
+  '#dma-cells':
+    const: 1
+    description:
+      The DMA request number for the peripheral device.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - dma-channels
+  - '#dma-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@d4000000 {
+            compatible = "spacemit,k1-pdma";
+            reg = <0x0 0xd4000000 0x0 0x4000>;
+            interrupts = <72>;
+            clocks = <&syscon_apmu CLK_DMA>;
+            resets = <&syscon_apmu RESET_DMA>;
+            dma-channels = <16>;
+            #dma-cells = <1>;
+        };
+    };

-- 
2.43.0

