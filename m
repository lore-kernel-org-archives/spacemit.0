Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4E31E886
	for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758297562; cv=none; b=TM2OakLJcHu+LByrSk9Y2rg0KemPsjz0YWrrllFnK7g/cD/NkeJGQWOj4FnUKJqJLuRkWOFSJf5uWVHJDmA1jManxz19KqvOb/sFcLYemTcyTUvzxc1ShRhOeBabNoBy4827RzkGTvOH+kzyHqBw3TYs0opHi8tsdlLAvyUHPEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758297562; c=relaxed/simple;
	bh=Tu1m4SIRyMkNsGkWApazWOavfNUwGLJRvb/wyPROHUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6VRoSkaUC/UXNu/3gB3DZc35IfO/soM8RrL+En+MWiMMMu25plHq6DiXrbruUXz7fFk3wtdYiprHLfU1c00BQCUNjLCjprJHcs8hztNbcWqfNqUvBozBEjyzt4CBPyfhIYSOfgDcv7NWvuh0CeWFdI7+hOkquBfu6tVb29u9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iob7nAKu; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iob7nAKu"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8a72cb31fabso21468839f.1
        for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758297560; x=1758902360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWnIy3h9DqFi8hL/FxVYtOO+Zhw2LnLXlA055wp2jTg=;
        b=iob7nAKuZEeH7VKHD4RtHZNTEQNJB8pLU9blB+a3RW5UpN1Wx20+nVWQHb2e3jOpxR
         lGOjPgq1C6i7lsoD8MRPKEaim/leyO3q2zqdpwErTKbMJ15xyGu6JhDv8HbopPxgBWE8
         YEcUSnINR0WojbRZWPSbIaKb66TLwgFzaCU2hb540SjFMhVpusnVolNT6Zdbyrcwt62/
         QoiAvWaSwQQXRAtcsEG1Y0FGdLxqMVlBn+n7h/6i7uhaJpXsxs8bX034SEMjf6Ndlqsb
         StmLk7DYMNCCsl3K4ig7RefH2Q7nXfnO9CHrHTI9+I73xUl8IYLX1o+q+IZLaOteZeZS
         T/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297560; x=1758902360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWnIy3h9DqFi8hL/FxVYtOO+Zhw2LnLXlA055wp2jTg=;
        b=ZkU0cbd6EzlPPDnIKLYBHlel1J5BvR64ka64IH1+EmSNx1Lyu/oJOlBTi3TerDBoxc
         NeLVDt8sbzhdx7wplTj/mVJZ5ok4FF4k2BrjKZ+UKI01A4NxKZgwmZID2cMJfGXqSImW
         MVOdYtpsOFKW0v3i/9/pDcqUrzzaf+T7YC6kcApW6v9SUDMGm1RoMBE1Xq3KXx9m0cQx
         xzo4poIR/dsljfWF7CSmIY/4QvLaGPitqg4wwmK6I8I4J8MXr4wgmhFsMU37pFIMXxZ/
         oKFY3GAQ2lBJzqxCDt/WWaMYEs+nyFs9nwl3Av6UmJM+euRte7vcd6CU1mVIUOnmcaQ5
         xyIw==
X-Forwarded-Encrypted: i=1; AJvYcCV0TQZKaTG/QpXgDW975puGMjIjDLpSoRDJv1ZXBqA/HUm0ssDQk55l/h22BZkfpk0Hdcm5CtaebA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTN+f+XS6VkIIF0MasJnXv6YNQOi6OTgNusk0JW29/UngMrhxn
	cByhdT3sXfvSA+WUXNpcXZRqQJ7IB9fXuD8AJ3lVih4f9LPMl6J+GFELBhTSdBynqPg=
X-Gm-Gg: ASbGncve4wZONFNkj+XV1Xxnr71SZByy85FwKlyGLMWpqnyHN4DN6gn1iqV7xHFtLPY
	9FfwtDp4bwGsxnvPnIz5Pyy8+Oz4Ip/K92Ja93HNzXZBUyAwbrrJ5iM4Xq94lPurYno3B1aa8Xj
	DyfBKcYHuwft83GM9i+MDovIrwcrk4IB0JpDiVRY1SW8lC5A3MTDhKFzmDUxoAnXAphnrwSlk2J
	Di14OcJDmTdSbcFQpyLwoB9M+TScCcJhCTbW5OZBez1ih9SbfBHSOTd4pyDPrDPogdO3pXOkxM/
	jcWswZBPZnrJcxwEvXkKyDEVkPlwwCTfgJSYSU095nqLFqAkutrYpix8GPO/YyZ67kcg3KSSCJb
	A6d5p4UNB3vi5Lb456Ie1g8rZYNGg+faSVJsmJhdcLH2SYv+HACmsZSKl/4GC1DDDNgPpQBvXs+
	W6
X-Google-Smtp-Source: AGHT+IFmv81oG4pNPO8796J1c2ykEr19sbWYjJP5tljzK54z44hQ4+akVUbqKVCyKhhKtpuWSkCbWw==
X-Received: by 2002:a05:6e02:ef4:b0:423:4ff6:aad3 with SMTP id e9e14a558f8ab-424416da9fdmr93720785ab.7.1758297559632;
        Fri, 19 Sep 2025 08:59:19 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa460bsm2250898173.52.2025.09.19.08.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:59:19 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Fri, 19 Sep 2025 10:59:11 -0500
Message-ID: <20250919155914.935608-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250919155914.935608-1-elder@riscstar.com>
References: <20250919155914.935608-1-elder@riscstar.com>
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
v2: - Use enum rather than const for the binding compatible string
    - Omit the label and status property in the binding example
    - No more spacemit,k1-ssp-id property
    - Interrupts no longer specified with interrupts-extended

 .../bindings/spi/spacemit,k1-spi.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..a6978212ff570
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,87 @@
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
+        clock-names = "core",
+                      "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts = <55>;
+        dmas = <&pdma 20>,
+               <&pdma 19>;
+        dma-names = "rx",
+                    "tx";
+    };
-- 
2.48.1

