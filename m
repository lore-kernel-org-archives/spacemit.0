Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E3309DB0
	for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802645; cv=none; b=r3TK2xgH0o1bQ/CclA2vnGqSug3hdYPjQf2w7y+7uF3tOnu++2xD2FoDo519X3bj06h10I3A02Nlc2/x6auKWR2d/j/5jkgp39xvv00lfc47CB6cW2CnqAJWrHcDr2dqj+dnWqxj80kOk31cOvXMFoh6X2eNHyvLmkXKbIabuZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802645; c=relaxed/simple;
	bh=43Z/8NqB+lImfs4U/BepJjVu6mfJNgbmQiSwlgjFlEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nP5dDxACZmQ+BRSUsFqS+73C+xGMrTOTcY8vdmahFP2BhkSA9ALirEOsrx37//c8AJyEUVxXrsmtuWAlVimhV7G4XsBZIU2d1SsAfDX3NxO68QKpsnHys+tuGDaokq+c6Smt7SRTuBRzmqVWBEFGewSPEjj19MIzNd91NPbtDJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=h1gQk6bF; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="h1gQk6bF"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-9032edd72c1so74274739f.3
        for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 05:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802641; x=1759407441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR2b9ECnFflIMj/TuPVkfctyOHxTY8RYfTiR0F4tDBs=;
        b=h1gQk6bFVBvP0KjiWT0or0CW9EDsUUdJGxvaQwH+tT9gz++6vV/NO/sk7F/gv87ivX
         Lq0u8cijbdkaqJot1DmxnmhBHSAO6PJVXsloSaB9Tb/hCpoG2xz2gUEPXxR26ZGRTpoE
         ooSyuqhP5nE4Gxp0uFdmoxxqFN/62pTee+t4nSfaQjJXs76Mw6p2pWzPsD6XRShP10yb
         6PZehjSFCkXzsuXgozgzjL1EuSSDZ2rOZ1TC2p5yyZ0TQvuruoTrOrzkKFy6MHT/8YsX
         aLNZQJcptz/PAAtaCj6gKa1gG30B51lgIgl02Zbimf94GrVy2tivolgeoNfIdXBtlQyE
         a5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802641; x=1759407441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR2b9ECnFflIMj/TuPVkfctyOHxTY8RYfTiR0F4tDBs=;
        b=bfEDvw7qDuDYw21wv9fzkvY7AY6cW/LVmDn2HEv3M8AOiYu/zdtblQBJgNMzSUeod2
         2Tg/vCvBVE7EfujItNOk5t9Zs/QXBa1iUoDnPXd9YmfBisG6k8TpzqYEAb56EVWRXkDN
         c7jVe43FF7l3brMnLPrNOXcyyARGjuEqbtWT1CNn5EpcFaI1wwdpFn2mimw9PBWllBUI
         OhzhhIUzRtCCpsuLz2wQwDxglxQdjE+eBuwrQ2nv7zfgOaykaKYH4ZlQfM6L/FptmcSi
         QdsakhrLis1/XZWV7B5Fb/rBoaf0CYdE5QxbCu4B+vbXt1HkGQO8BVtwxkoJxQ0GHHhx
         Hgqg==
X-Forwarded-Encrypted: i=1; AJvYcCVBrY2uvKnXYOY1AD34X9nFmX9EYSTtvftrmgFFQsmNWb9+L4I3vh7uS/fy1mhge4ghWqd9AIMd/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfzVHdeGcEKgFV8Ju608tyag8/SRHb/30JLr4PLTn66QVRbt0Y
	M/xQyWpNsJTaL9Qh95FYT7HLP1VNe3s2Sl3T/rdcjdSEHYD++jNrf9m1VhhzFg+WJ9c=
X-Gm-Gg: ASbGncvrrMjHoPlVwRWj98uvy42OJ7tI2zY/p3Uf+TGLFAqhv39+zcFcIGMKDT55TEk
	Ufkg/v8LTNW8/haVv/lDFRogypmmQgMlT77PbeWkCNF3zIQbtDCiA0+Z77rtPgZY8feq8EnWD6H
	eXOZcCJyeJ7YRTB95oPKAT/j93VKUc7GAPU9rMp/FziQ29CBE0edfbw5e78Hm/t6K5CH2Ftjyi5
	Jsh18UhfPVUtVolPDDlbfdh0Sr2cS6GRYGUCP31arC6z2sOWrd3IrtYc44rVtpBQSINeJj8Jmin
	NDHYFoyC7jeWCSkvoMWhaF9z4E3QzOZVDihjPP5KST4I2SHRayK/74OITOoTSOls1Y1Tixzkcr8
	bb1yLyYQhiEFQgxQsS7RjTLVMbfpb+CjQHCzF3M0EewSpKMeMZt/36eZPUfKQyNim7Q==
X-Google-Smtp-Source: AGHT+IG4wPSqwPahvB80HGI0vgDXc7ga/ScqHe+FN+6P+4lK9aExGKMJr/7vetRH34Lx70dFVQXPBQ==
X-Received: by 2002:a05:6602:2dc5:b0:88e:3632:ca4a with SMTP id ca18e2360f4ac-90152604880mr472882939f.3.1758802641154;
        Thu, 25 Sep 2025 05:17:21 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9040c57fa59sm66918439f.16.2025.09.25.05.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:17:20 -0700 (PDT)
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
Date: Thu, 25 Sep 2025 07:17:11 -0500
Message-ID: <20250925121714.2514932-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925121714.2514932-1-elder@riscstar.com>
References: <20250925121714.2514932-1-elder@riscstar.com>
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

