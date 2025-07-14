Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C471023BCF7
	for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486024; cv=none; b=gnhfaHNwxkLE3mK6nMG/BJeioa7JLQDEMaJnhLIm7HH5AY2SVNV6tOw8j8yb+wu4LkFt+Ow6LA1wTz9cv/siVfFA6J/31t7i9nxh+NfHNK99lx/rUDATtNfM1DZQ+ZH7Yi0h/8P6FaXZhPbBDxQMroOICvwT1VRmNykO6OPsI/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486024; c=relaxed/simple;
	bh=4KPyVnkqnA6b1PNIcB7ie8tzayQaIfMIQ14OoYISvso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsqBjJSDdbZCtgE1zvap6fwdN2Gs2xxzKQZqEQGTscAio5Xk65DnV9/EGWsNqL0GWerSppTUGjfnfLpxbJuL3caG+LDGHSt0ocbn76IdQRjL/6UDgJFj+6MX73l9nONTpbwhd9SnfI4d+BigdyZ6H4M3NATKen8wouR8DgwR0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=R9IlOheX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="R9IlOheX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45617887276so7078045e9.2
        for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486019; x=1753090819; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNWYOZeX7/6WvQlTq10OWDC/eEvu8idMvnYMiM3ozYE=;
        b=R9IlOheX1MueIw5N9buSoazb5uf5AewD23KPeaFR1cI4H7W7nUoq2HMCp21+5Afi0V
         /+F7CczPJByz1IgR6P3Z+i++KpCy1DHkNEIeWuiCkAYaha320e/R+gB+jzN5GmtctUiY
         YowRof9vG8azFyihck5v8+1OK5d8B91SY24ssIc51slJ4GMA+aMYCMqiGZQDbtdDhF+I
         JF9asnni5gA5fe1ArFPNBBvSUS3U9GVDdifLglORAEc/DHVuK6AL/Mnah+ePe1PtiQ2o
         LMAV31nbgg2TiUGI0s2k2R6ySTAGtzKMQpdWgLS3jtwIKEhfrLlzFKQ3uePOnjYeSQT8
         kCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486019; x=1753090819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNWYOZeX7/6WvQlTq10OWDC/eEvu8idMvnYMiM3ozYE=;
        b=g0MnGqYtIe6YaDzkJn+mfMSbz2oFy4cjZGQaLBDBtjxFzlZj2WCBwrdf5/qRSCNzkw
         +mis13bgbNqojHPeFLQvWDPmw7lzsSrf1DN402lKY4LolW0s9Gn8SacOz/123FGPkOJ+
         nCRDl8G3I6wuYNeqidINnBkiHS9l+WCamgI+jR7j2LO4vmpmZAtiOwSo+OMnvzN+yYiA
         Bosi5Hltzsq6Lo7JLdEROrvrzEI8rSX7vCmXAsK5ZzWcvTwOUG+9m2XZem6U+0hDwehW
         QP8QXigiO0ECUA1HEAcz7qebLO9VuedSCiXG3WT2ZdM+25wTTffJUx9eIQtFlfNXQ3g1
         q4QA==
X-Forwarded-Encrypted: i=1; AJvYcCU+pxfmRFkdPJSSxInzrW2YTFrg3Rt1ZUla/dXw9Fuegdp4zftjewxCY2IcRDK7riwoQGZWo67g7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPEx2uNtsQWbpdmW0WCerF2HmwLBGqZX2QK9LCcoZoHv49Wq7I
	Uvt/NN3mei2gqo8M/G+94oseeo2UaZYEDcs5V/7C4BjFaNaV6wlssTOx2iJATGteWTM=
X-Gm-Gg: ASbGncs4GyOp2ssOWXZ/DXkU54kj7Csnv0U7mcI/IFokW3aeKdovAzG/jlyy2qHJxxT
	4tiEqP8y+tdCUYZXvE63UHLkaYSoWBQ7XveD1dN6Ff3rBUY5/jLH5Ql/Uzm5acVIfJqk1oVUdnm
	V4b7F/qwqA+i16qabV4DxxVUMuOxBEwS1zVZX9z/LyYVsJsu1RGcBlbHOxmZgNUoeM8xx5CzPqF
	r6m+64MLMkB6cyJ6t5SlWRTcjSpQ2Hg/jIiO+LzMWlG7Z9m6tw1bjJqARBQo1tRrDdcMea33zCo
	NBLaoJJc6MYz9dfy42SoFzpgmt8lMIUVOa1Oupq1E2YPov2Cf5oEPK7pYckHk74cvtAdB0idQA=
	=
X-Google-Smtp-Source: AGHT+IH7LWrI288pfqr0DobhXiBAETFLObRARl9QHaXZq8n40/zrMI7hQXZgqc6YvjtV174ymKHG1A==
X-Received: by 2002:a05:600c:8b55:b0:456:1204:e7e2 with SMTP id 5b1f17b1804b1-4561204eb05mr46649275e9.12.1752486019172;
        Mon, 14 Jul 2025 02:40:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:18 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:28 +0800
Subject: [PATCH v3 1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-working_dma_0701_v2-v3-1-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add device tree binding documentation for the SpacemiT K1 PDMA
controller.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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

