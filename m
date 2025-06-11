Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973CE283141
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646764; cv=none; b=LP4fXP4tiE5PZIFqKG2Q36fsb3KJX11FjHdfAP8fDdyX6kM/tPtq3Dc8xW7GXaHCjyHkCmNghCXYDUWq/IaoFTVk0QRx630VqK/4hY8wUsQLFvLMzBSkBnXXlB/21YFivEj8iiQ+l1WY2QUgkmX9NGzImThbD+4MWjZXVhGFk5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646764; c=relaxed/simple;
	bh=mfvf7YBc75gKcXozHj9WT3obpDew9OmkoOmyIZbUJOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIQznyZ60V6UsDgJrEH0x0HpYcAeNwCmYmQ6LedYIrys8z6nGH6hWlcSD8Q3rOYLPEkmooGg1DRPgs+5vDy7qHRBumnDOmRcm+Il3Vv6e0IBdPA+wxHdoBoz3OWSzqjm+1Z5UoQC2r0O0Lz3fHo0k9n8MooLl8H1yjlmE7Vg3WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CeS0ogZa; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CeS0ogZa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23649faf69fso1014125ad.0
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646762; x=1750251562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgXKWx6LT0v0t2kW4DENrP//N1tJL1EVc4tejq3gXuU=;
        b=CeS0ogZabAeMrwKnMx7PGwc4j+f4A6BjKpCOgsnpZuXE+QYZxkmon0pIjmj6lywRoi
         6Nnj7xrGArb7I/oktbmRD9unC7LBcF7vtaQjhD9SawWKQKmp3zOn1ntqgznjTY6iTWQO
         5o3YYWQ8Rlqk9tmmms1wYdIss/wK7j2YhJA6QVgNoPP683UVaGC88O7nmw51+vk6HXrE
         n7v82rj0oDNj50l0IU9OoieXX9dUqFZid9gpxGC/2sdx4OfTOA15urbGmqBSaZ9/byNK
         h7VdcWacNVn2Ny2hBHlvolu6OrpvzhukoxkB26pS9gcoM3qc/4z3iMsD42xtCpZB6HKe
         CVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646762; x=1750251562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgXKWx6LT0v0t2kW4DENrP//N1tJL1EVc4tejq3gXuU=;
        b=aFL84gqN32ZMKE8tiSusqHVE0UzR5R/3CLk6D4W2k8s6KyWIr9wHgkJ/qnniMqra42
         dzrc+4RBkwGeOAXmWtmBLneEAGrV6yk2QbHTPrZczdZwiPCaPTeudV6SyV10p8070Etv
         PGzn1jlfFcif1u0h1Y7M6VJCL6IeuXOHiBtKDStgjVXi5eQKo7SZcRF0JW0BP669l3f9
         8y0t8kB4Si8eJdXtfbKQAbdLQbgJ8cfnapIVaw7CJ7C9lPWuRUuWHZRahw/nVRYDKNLR
         sJw27bzlOdiro6Wf7uyhPjmaNt7ySXf/DIF7iNo3s3Rc1m9gbMcX4KRkUwp6DaT01HBK
         5WpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5mafbadsIUFKfr1Zb8kLHd62SJgFWirgtEhmDvKLX/BkveBdFuu9LgAu/vLcYh64Gd8pJQ7ZVrg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw49X65m5/OQGCT8F7TH+omM5xYwE3hXcT3yqhMtRJnqSReKBKH
	LxbMTenPYpxQb2PCM2qZEfhW/E7QqsiYV5jgNEKAdhQC6I8vuFvce0H+bE8T35pkHIU=
X-Gm-Gg: ASbGncuceLxyKz4UpagpvAAlvTd+2PpWDzZqazecgunxSRzjvCgEEFy8zttzqHGLv2s
	9rA9dKP5r2H2mnOnQKz4H11Cl6wgFY/qPiwD/ewCTBLFmkqq2kxuS7bgTPYdwHVPfG0s5cQLb3a
	Q5pK8JuZlNI4ZmG7W+cmM+FPtiR5Gprqg88f94Rim+dwZp5wbc1kXyIaJTJOorb06Blr1gQnAoL
	4xZzGxHozF11fxD1FpQqIghiA/xUaCiKyuuzGQIWcQmCRsrB6T7xaiknd3SWVK/q5bP3OlgcZC5
	7S1FyqIQXHDxlK1uYKsDXPd6+7kO3qxW/FZgMKErq6dzWWTYwR7W+7Fp7SwSncVXUvGZWrNTeZB
	5vT64mti70CoXmlhH/QDSm4QSAwoyv3tj
X-Google-Smtp-Source: AGHT+IHP+0owmszooM6L86XNZc5ha8+zkwg20Qojl6bQqCgBkl02MT2JBYiauh7dcDoSUFp6EUtZTQ==
X-Received: by 2002:a17:902:f78b:b0:234:b131:15a with SMTP id d9443c01a7336-23641a8aad8mr44833385ad.4.1749646761961;
        Wed, 11 Jun 2025 05:59:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:21 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
Date: Wed, 11 Jun 2025 20:57:16 +0800
Message-ID: <20250611125723.181711-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
controller in the Marvell MMP DMA device tree bindings. This enables:

- Support for SpacemiT PDMA controller configuration
- New optional properties for platform-specific integration:
  * clocks: Clock controller for the DMA
  * resets: Reset controller for the DMA

Also, add explicit #dma-cells property definition to avoid
"make dtbs_check W=3" warnings about unevaluated properties.

The #dma-cells property is defined as 2 cells to maintain compatibility
with existing ARM device trees. The first cell specifies the DMA request
line number, while the second cell is currently unused by the driver but
required for backward compatibility with PXA device tree files.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
index d447d5207be0..e117a81414bd 100644
--- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
@@ -18,6 +18,7 @@ properties:
       - marvell,pdma-1.0
       - marvell,adma-1.0
       - marvell,pxa910-squ
+      - spacemit,pdma-1.0
 
   reg:
     maxItems: 1
@@ -32,6 +33,21 @@ properties:
       A phandle to the SRAM pool
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  clocks:
+    description: Clock for the controller
+    maxItems: 1
+
+  resets:
+    description: Reset controller for the DMA controller
+    maxItems: 1
+
+  '#dma-cells':
+    const: 2
+    description:
+      The first cell contains the DMA request number for the peripheral
+      device. The second cell is currently unused but must be present for
+      backward compatibility.
+
   '#dma-channels':
     deprecated: true
 
@@ -52,6 +68,7 @@ allOf:
           contains:
             enum:
               - marvell,pdma-1.0
+              - spacemit,pdma-1.0
     then:
       properties:
         asram: false
-- 
2.43.0

