Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBD42FCBE9
	for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802158; cv=none; b=sAzUwyfu8cEGvyrraNoUqu8EuwERID3TMgjmb3JMG2DmBbqepJQm804SF0p51bKfYkv9eQKlJG4hsUzLxVCbi8YfrBmgIPJQn01apIEqBKHDbTI0nes7qiF48f53o/3e0kR1t/yqgfRM3Su4gq3RUzlm4fbMNnvfFo9xceV8q14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802158; c=relaxed/simple;
	bh=43Z/8NqB+lImfs4U/BepJjVu6mfJNgbmQiSwlgjFlEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qm2N1aVjmoX4vuTL78EST+Av9mDNMyTmqKstF3iWDbHpt091DNSj/fqktke20eYAV2KnRyeYEmtltQcKWlVarDO1+SyCJ1yU1dfis2HVE0YVbVkfqmdTvnpoeZhYcUIFMwXC9cx5nQWeXA9Ewoy92KrYWVR7buUNTHaPab/fmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vmf11Gpb; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vmf11Gpb"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-4258ac8f64dso7995075ab.0
        for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 05:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802156; x=1759406956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR2b9ECnFflIMj/TuPVkfctyOHxTY8RYfTiR0F4tDBs=;
        b=vmf11Gpb7icdKHHz6gv7s/1KGLtpptNaewwAkYTSxgAs/HpAUZj1wWkV3nwT9w+IUO
         nvPx3yvjPv/7igqgPSYHAY9b5ym8HyHMGhYDX41HqLwGoxsapPqFC0ReTXs4kPyeTgNu
         1c+RholHSImjFRzka+JmN0WSsSVmM0v52LfAUSLoMy8tH6Ajn22ZNmdWR3DEUwd7gEqG
         ZU69seSrb7Au4hRCCcsATQhGJ/e36wn7CtUxvVA7ldOfYnv7OJILjShVVfZRK2wEhIT+
         E2ItXl3kgp0owNYkN7iThQciZPJM+MYs8XXOls8Rq9yBSVEEo3awiJTRMjYhyWZ4hBie
         uB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802156; x=1759406956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR2b9ECnFflIMj/TuPVkfctyOHxTY8RYfTiR0F4tDBs=;
        b=vZyQhqaP9FIUhQGp1cVKp2LaaMdYKLyCKtmO98WaZlne75gfc9PN2WFCCDswHVMqZS
         cIhANDcrJrgBKAnSzYsIkZrSoo6umIFDh+XlRGsulBHg3RKhKLH8pQI8LHKANCR9hZmt
         yyle7nESQJ1uAwmWq02q8VhNgSBn7zC739aB5dfscUZe7bvKeUROpgk2sPP0NSI3QbNm
         o0wGJWe+kqvhqXStrfAyAJNPBiMSXmKfbqk2weSrf8Oozwhv8AKrvTG4AGli+JyMJ6Je
         S3LvR6svoUkWMhUVZocA1OkgyjC08sd3u7AldgzjYHeYOIhJ4r5y7TnYjxnOzEOWFsFp
         YYtw==
X-Forwarded-Encrypted: i=1; AJvYcCW1BYwRJsk9qoLcoXu19JzjpJfIEFWCXVVmjqu7S3y66Nqnq4Pv1Xe7s05rD3wyGQMn7pvPSECiCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkyeS9+TeVC1qBva4L5Rv8pp2Qp3we/b8fv2sHqK4ux4n0cqKN
	jfrWmBJZWsjgk+VX67EL9fbDne52vkTo0jTw4G/gdMpSKpotiGkuP7e/TPWvetMAVjI=
X-Gm-Gg: ASbGncstSz5E9qxoUlVFXzmJX53y4mEr+/50vfo0ybTPkCv3OKlQadwsXy3j4TQHuIr
	tPOJOJl8dpn3C/3ImKShRLzZ/p/Ty2GIoOIMfJzIDxc1CWO9FWlOVbmJjaIOg33nSTictxn15uc
	N2uETMkSa7R77Jc8GpXswWW8WJ4a6gJ8vOJD+T9o2ovGc/z7E9TxtUZTI9T+vRn1datn+gbcmTQ
	8ckwpZ/iFpVhamWCDIPhdKnA9EtIrTBGIP8qDyRMG1Z7UFedAVndVakZlNqtLdbo82MT7mkkRKe
	RQ3OPzhEGn5KIkiVeacIU2/lZPqrjMcdcx4/vkyWH+iJRANkeGzhuVDQkvKdP6cXuEC47sxXuAl
	/bj7jiKlW5tbjQeLE4ZXkMjgXOb31nOUAjyLIKbFZuSknbRyDWGHVkMdPvGSGW7vrDA==
X-Google-Smtp-Source: AGHT+IGXougzNJET46cVI7dYg1MBBmNvBI2khpSbf9kpI6chuugK0VkxyAwHIuwro6Yl7j98iqwVzQ==
X-Received: by 2002:a05:6e02:378b:b0:424:7d95:b90b with SMTP id e9e14a558f8ab-425955eea63mr47747165ab.14.1758802155603;
        Thu, 25 Sep 2025 05:09:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5b29c1sm742821173.62.2025.09.25.05.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:09:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	junhui.liu@pigmoral.tech,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Thu, 25 Sep 2025 07:09:06 -0500
Message-ID: <20250925120909.2514847-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925120909.2514847-1-elder@riscstar.com>
References: <20250925120909.2514847-1-elder@riscstar.com>
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
v4: - Formatted dmas and dma-names properties on one line in example

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

