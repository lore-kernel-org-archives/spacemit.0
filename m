Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC896360ED5
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 05:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956724; cv=none; b=e6YkoOCe17E4I9zdvk/dMzn51+khnhj3RGp9f1hFSNH1FBCibbh7ePKoWEycZ86j8kjC3RFj3W7KjBoWADiOD/NbvvTDyJXEklKeiiKpxTDP6XcnHahOEy85XzePU6OaLD9oUMQodc3b+mXrmU51LlXz6SIxZUGTNzWDZa+E1to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956724; c=relaxed/simple;
	bh=e2HtZIpFAeEzBhd8fEr6izzVbI4e6Mu4fEJXjQ+ijhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TF0aCHdpcB9Tn3dS4nK2MkukJNhwv5PqjiHE1vB/M5mnWANjPOY9vbqdxHGu6+KyKgVvaE8V+0EC4SRS8ppwpEQnOnMhomnGNTQp7eLPzeLCAvlZrboBj7oMAyG+jWdyGaoU6/WXQ3UfpO7KgOPBQ1ciwd9kILv7gbsKoHIGSmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FprYUMPB; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FprYUMPB"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso887286a91.0
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 22:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956722; x=1785561522; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ycy+Qjco0x+8uNmV749kGmpBtIQZVaDIzcG2OSIxUnc=;
        b=FprYUMPB5KQixdnUKE7dS9noF14+3ZpJ4rObzEFtlbraFv++4KPhGuD2jhJn6up0Fz
         s23bzniai4b4THI7IzCXhvLDjKgaTNH7z3rs2uZ1nhf+iLY+tmJyUHyIAlm7oY0wbQW1
         zkCCNSguE0hPfb7pW1hkd2DU7qP1OvgJO7xnbs4+iIWYtXiN3tDvpoJ/V5pUVG43NFgx
         yamYazHAMneN7Ia8XTYZXbmhaI4ZGb8s3xmrPKz+TGXad0NOcd7Cle435X6TriWaiQKx
         VSMxCqXXmYGF836JquptCC5FrmYJdAz1YxhRO9LsPTdVg1O53sslXVWM22nnaWmiQ8J6
         ubWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956722; x=1785561522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ycy+Qjco0x+8uNmV749kGmpBtIQZVaDIzcG2OSIxUnc=;
        b=CgLVxlT7vdu1RrqLuBOMBHkMlLTy94ewocAKG2VBvrp38bIj01W4VoQ2YJfF6eWepR
         YrKoAI7fTQeO+tr04AgI04ZGDpAn8ZIrv/obGMtuZXtFWg82dZnmU3iC0+0AOzKFIcaB
         yo558HBJJxSeZzcNDP1UHMK74fHLYtgCE5pdgQ5hUpj3RxrjcEeM5JBa0iMFM8cwdBSC
         sZDad0nczWPMY41w9snL1pRL0IF5qvLkJeFCqw1r60IHpfTcCGHqOMH/cCc5WQEO7Fzb
         EQV6GwUR5sInW27SljbsuWcu+M7VRt/90IVz99RpF6VwgtI/xfS2OWYYRnSNH/b/9IO1
         cbsw==
X-Forwarded-Encrypted: i=1; AHgh+Rrcm1ysTUfdzzSPoFy9vqDDlv8vXNAFVi+2wlmnyOnVwP0n5cfWkemo7YOp76xIly8jiUnY/Vs3NA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjHdXXPU+6VkiOr533AdTU58ca+RYTX0Adl4HexIh6mZVnBwyw
	Yl17WvJVk+BYI2JajGDxmOy0dzIMfEwN1iLHFMYbbm8v457cZVCfdAYVc07ZZW5pxSnxwA==
X-Gm-Gg: AR+sD10as/Od2bZPUfOAO/1IA5cbBIper9yYuEkYcgtMkWPtiEtOF25ZPUUKltr+93T
	RDMTQYLkeC9+9pknT2i5kloKqpbaDC7MmrBCTfcIsiM3OWPFw0cYTXBPkrckghd71h1Kpvq3rn7
	F3LQo3C7IY1UwW5ZtOMmGLl3tqkDcLs1iXgJ3lX4065UQz292kNAaDZrUyMb/LLOnJdvhLEWq5g
	qGt6GuoZ2JiSqHlRtwRRe2N0YQqzt5kuwMBeoZdWUm0LQnAfxkhOyDBEguLZMcQrYNcEYGvEzc9
	RU4pj2MMtsvXBL4fBYoZ3CYzpVL84p7axoNIf1LjQ+lTxtMvv8vxxY8470Zi7w0U1dfvA4oXSeo
	I5kr1WvtNxsnBIvqqu1Vq/2WLiSqWGvvC10IYWUyVBil8f6EVbPjTsTQ=
X-Received: by 2002:a05:6a00:2d9b:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e593ff0ccmr644911b3a.13.1784949438724;
        Fri, 24 Jul 2026 20:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:18 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:33 -0400
Subject: [PATCH 01/17] dt-bindings: display: spacemit: add K3 Saturn DPU
 controller
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-1-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Document the Saturn display processing unit found on the SpacemiT K3 SoC.
The K3 instantiates two of them, one per display path. They share a
compatible: an instance differs only in which register window, interrupt,
clock and reset lines it takes.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../display/spacemit/spacemit,k3-saturn-dpu.yaml   | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
new file mode 100644
index 000000000000..97ea9da4b68e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-saturn-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Saturn Display Processing Unit
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  The Saturn DPU is the display processing unit of the SpacemiT K3 SoC. It
+  composes the display planes and drives the timing for one display path. Its
+  output goes to a DisplayPort or embedded DisplayPort controller. The K3 has
+  two instances.
+
+properties:
+  compatible:
+    const: spacemit,k3-saturn-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Online (live display) compose path.
+      - description: Offline (writeback) compose path.
+
+  interrupt-names:
+    items:
+      - const: online
+      - const: offline
+
+  clocks:
+    items:
+      - description: Pixel clock.
+      - description: Memory clock for the compose pipeline.
+      - description: AXI bus clock.
+      - description: DSI escape clock.
+      - description: DSC clock.
+
+  clock-names:
+    items:
+      - const: pxclk
+      - const: mclk
+      - const: aclk
+      - const: escclk
+      - const: dscclk
+
+  resets:
+    items:
+      - description: Memory clock domain.
+      - description: LCD domain, shared with the downstream controller.
+      - description: DSI escape clock domain.
+      - description: AXI clock domain.
+      - description: DSC domain.
+
+  reset-names:
+    items:
+      - const: mclk
+      - const: lcd
+      - const: esc
+      - const: aclk
+      - const: dsc
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video output to the DisplayPort or eDP controller.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dpu@c0340000 {
+            compatible = "spacemit,k3-saturn-dpu";
+            reg = <0x0 0xc0340000 0x0 0x54000>;
+            interrupts = <90 IRQ_TYPE_LEVEL_HIGH>,
+                         <89 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "online", "offline";
+            clocks = <&syscon_apmu CLK_APMU_LCD_PXCLK>,
+                     <&syscon_apmu CLK_APMU_LCD_MCLK>,
+                     <&syscon_apmu CLK_APMU_DPU_ACLK>,
+                     <&syscon_apmu CLK_APMU_DSI_ESC>,
+                     <&syscon_apmu CLK_APMU_LCD_DSC>;
+            clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+            resets = <&syscon_apmu RESET_APMU_LCD_MCLK>,
+                     <&syscon_apmu RESET_APMU_LCD>,
+                     <&syscon_apmu RESET_APMU_DSI_ESC>,
+                     <&syscon_apmu RESET_APMU_DPU_ACLK>,
+                     <&syscon_apmu RESET_APMU_LCD_DSCCLK>;
+            reset-names = "mclk", "lcd", "esc", "aclk", "dsc";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&edp0_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

