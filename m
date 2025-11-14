Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E402DE1E5
	for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 18:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146672; cv=none; b=DQNitwJMmE0ZqwiDHTC5Z62p6KiTBUFOUXjjAokvGN3iijdlp7ngIKRLU4Vkfz6sEyWgcuROeSegxfNi32KozrbTRVz3y1bi/3I/ky9An14NmaD6TKdRmnHVupSrxSfOt1cb4PLAibW6W9uosqtDtCJmg+nYNRja/H0gREo4Kqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146672; c=relaxed/simple;
	bh=XwugoKuomUDrG+p0l71T9I9NwQMJJEnRIz/ooxl9piQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQ79qfeLaFf0qhiXChajKieHXnAoKB8N0kTzRjRBLhq9GO5CE6pHzRejmnizr5kkvRT6aPq/UAfXsncd2rhtYEVEqu5m6CTGi2Wo6deOPfnVIfXHNbf6aIajod0D24UTQEvkKAMsFVLnkrCJ7PpNWnb6YmJ/XGmadtWQMn+/jow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=U2xYk9of; arc=none smtp.client-ip=209.85.166.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="U2xYk9of"
Received: by mail-io1-f66.google.com with SMTP id ca18e2360f4ac-948e03b096dso99462839f.0
        for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763146670; x=1763751470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hu93jrgt16GNM8HBZugqTHoqi52uFXrn0f1Yp7esaAs=;
        b=U2xYk9ofW8W2cGVW8qI8+QxfLwhdd6IxUJat2k9y/dHkbsKS+PylV1lsrZDq2frDqN
         EHz6HDxOYBWzbGFMUf+zN3izhBFR0cZf0dumnkcYTmYf2PTQHqnG8kYuhtYLPMtRTjxt
         Bt925J6fTHpLSRgExLyDqUWXLZ70M1g+kh+ZsF8dI81ak6pVFgCvsMZhpkJQKotFSpFT
         d63sLnvSUmphnPfAZAd6zV1CugKm981K3ZSqNza8j3pTrM3H/8ePq5QYgOujv0fOVzDb
         LUHl7SaogpTfJyiDJXsRIW7OWWAD8J9wpvzmy/FeYxQJD5LhseySIboV5cIO5BCyfXwq
         +fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146670; x=1763751470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hu93jrgt16GNM8HBZugqTHoqi52uFXrn0f1Yp7esaAs=;
        b=cMEDAkPSwwD47giyI1bT1TrnlYanNqoduGoTE81RgxKxk0nn7LMnRRy0mDU9vbG0ju
         RBN2H73UDGBkgWZclnitJLvUew5jcEc4ki3aQR0xlDVU9vv4XVFb7HpTWmOliXRU+aHR
         QtA8PZ842QhvuXkndMusR/p8WZR8O+AUQYx/5Pm7T3Qyp0Bbvml9+2FUtc5FPAXgc/Bj
         y52ahxTIAebKThtEI+pUBlFL1kK1fjkKY2QmpnWzCm5Isk4KOfWUbVRQgOD784R0V1pW
         KDgixTg+jurjbEO9KcDReibhMauQIhZMsVYDvSGGcU8IQUe1+sHnDSh5kQSSZ1ImysCq
         scbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQcN9tJKdhHNHu9DEWtesJJpPL2kVuvjkfyN75XT1QK7RtQyPVzLAh1tpiEQ8p3fRA1aviK6Rc/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5dkTmmpIaYg7irbqXh1jLZ6KKza/lEkUD7kMVWlDWm5sKW4yn
	2LsHbvTiL51d4DblTS8Tw4cj1XwIgDjNsfrVVJIs5ky4joPF8JxaHbREFPpf3TGLy30=
X-Gm-Gg: ASbGncsAlMdzLZNu9K9iLeEi2OXk87GKgzWm9Nje65kjxoV7wFtgTiidJ0fSrlas8Kq
	noRa5pVI4ZLIm+vAQFwK2DNLy17/RKMWIkzzeJreymk7fWek2X8ucb8wAg7juXwigJV/GnaJOIa
	eEE2Ve/7PfW+uMpA1E4DASRKkL9IDwCw6Y5WoeWUBdXm2T3YbdBU4iichKR9L62BLh4n5wMuUuc
	5U9oKa3DuV1i/84IiymNWHEWYym9kDbQazXcNQAYivIeca4KiAgwu9U11tzb0h3aArR4VEIRYaW
	+2HMfP511IvRLTurrqXZlGX/emlyKdFkSF2Yvuid/xfGVTNrSxdnff1IIKEdwD+WCUZQLoN8xdG
	OSSIRz/RedgLK/Wdqjes8zS+FCBFpEE9tZ3ZxzEP+eoMWNiQPxwZ3xJiwGYHdvk1AzMcOWzBuf5
	Ywn6wwAiQdTRzCJUmrLmD3ZbBap0B1sCFzkBvgPMz+NcchwMhILxCNgg==
X-Google-Smtp-Source: AGHT+IFeZ+nEollEKgDhQ7ieSd8muaJyYhRQJB6yiY924Ch6n+G3VyFq8ZoZpYgmOsoQMLWRQOm8JA==
X-Received: by 2002:a05:6602:640d:b0:948:8be8:a8d7 with SMTP id ca18e2360f4ac-948e0da72e6mr647783139f.13.1763146670137;
        Fri, 14 Nov 2025 10:57:50 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-948d2ba690bsm278679339f.8.2025.11.14.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:57:49 -0800 (PST)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v7 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Fri, 14 Nov 2025 12:57:42 -0600
Message-ID: <20251114185745.2838358-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251114185745.2838358-1-elder@riscstar.com>
References: <20251114185745.2838358-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
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

