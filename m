Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945226;
	b=GDq29RWilV3u0/R//KErKf8x5aZR6+uwrxuwFOErc+7IMs8LOTDhtwjqRMJxyWR7cLtT
	 4qGpJHZsk1Oec6bvtJiLGEgfVj9aB8JVRvuTUjMJUmfGGW6Zly6k2MLKq1adb0lqXL7lZ
	 gfwoCDqXRzx3g0tM8mK6JPWw/MN5H3gx3TDMrHN3h0JDb1W5EkqPnEMVlQcVEs9HEyfHV
	 DaJHcJ01lZH6TRAFvxf+zWrrlNPr0r1yTUtR7VqrHDWk6bwKV3fX3kpoPxndvctv4hB83
	 3KhTrs6M59YwL3jJyiQJl6n8ud8MTCcAv4b6EdGRzZT8x5k9jN0TI/mkRZb5HdPvTRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
	b=Qel+MhGa65D36cBQ3RnCQpK6tPF/QWVF5V0I84RpyNIajcr6cUh0U2lUN6zmMcU5Fb6k
	 Bi14lWnuWYqMQDKHNVSZ6rdFPp/PQ9iVR4XTot2sLscdcLcBXnO1CNJn0Mh9BGWg4xat5
	 jKcO3Fn1UXpGc998jl7rSF7jiLS7EtL55eb3aj+qk0LWp8R1ibj6fyn3HHkPQ9m27WMh3
	 nEJuKvzupbGEgu9XfPmjwFOZHuWNUVIchomAeFJhkSB2o36BJvqmzuSKNvo8LZZ2k8Ktx
	 yunTKIFTQkv8MuOrZDpOASYVZQN3H3N/0rmkpIR2GbXUrQpeXu/qiAlnsyB1wn2Q57Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jErpv9i0;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51E8606A326
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 06:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jErpv9i0
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso704325eec.1
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 22:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945225; x=1794550025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
        b=jErpv9i0cJfGMuY9/iU+qFPB17mBWwe60VjBUwP8RQ91zMCWgadO99rsqdLMOI9KO/
         dtLtNXxnjf0nQB534aEA7wrtXoEgeoIaX7hqkd8FUs4QdAgnRoKgKJOWcO/hdfUW8vxL
         hiYDb0Dg2+zhuklZDZOLrw/aH3T+F9knrly8Lyogcz/+xU62NHslY1NWhO4L2sdHDXeK
         +0VA4+v2NaUqxoCJGbU0sxKSYJHQps9/2JZoYynIyKxgyrqTfev0AniR3XlcK33Kt7ED
         DWw5pH4T7x054/XDh2eteurNo1KKENfYLmlgEsICtI/ajrCodsQABKcNg9JzBTD0K/tb
         3cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945225; x=1794550025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
        b=mGCuOI4xzLj6PZlv/lNxZQ30y8h96P3VK7/zsbnz2oZ6M27ocLBB/LlZk383Dul63R
         mN1NSEH7EZbr9V17d8bigJPz4lAoTxxtCRQ/IJwMPGR7tDRNUFygDugeQYmBxib+MsKW
         cXd3yvAq0x5X/12wmF6FCdYnl5rcCkVZPi5ACdDqNIUxazdmRujswVRUFahsVzQ41YCl
         MfJoXWCRZptPZJEZRMb8KbxzTgorIujna5CLr5w3gHiyxnWwajZaDs25gbCbxePZScvA
         T8g8gcY1qTwW2KKdoF8lyMZRFtLdA2n8J4tz0PHNI5vPEApexTiPTpFCGz72H+o2AsrA
         bzSg==
X-Forwarded-Encrypted: i=1; AKwUvBz08PtnxM67nJZzDA5hkjhFhjgH+EBALcLTHin3ooMEBcB6JG21NDwzBtnnzYAYZp0ySLIsOU56YQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8WyNEoIEi5ipVCh31tzFhdx+faCJDWzys/T8iyz35MVvnkcldB
	/fc+Ig4l2ha/11Jg27fXP8Lt1+07OvJl8KPN8FexrCxBtjm3UIKfYNXH
X-Gm-Gg: AYBFou2YvYGh5IthhdJI5lubwn5ynbXOctQMTIsDx7ny6/4dwQj9493VCMEgpIfHmrn
	bhYGc5ibF7GPIZs97BTT0u9xDrC/snapTG3G17lzkYNGomBjYLxYO/EOXg7iBcm6t4RPJzUTK1h
	bBcXCkUIBW6jDulaU4DHcZiC0qZ5Ga3hKUSUoMk3q1k6CkyASe6pbhJrufw0PpiynXDli/MYpCM
	Rh586ifObrGt3HpBelUMn7SlX5dxGh3yfA6tB3hSDAmdiAbCciP+T8WV86EviK3Iuw+7VYwtjxR
	NlWsMzE6YxcG+qUPXvLsQLi8fGxeMYmWBmopORvA7Fl//lUQXo+oWGunpKg16SrQ7rzs3V9zAU9
	nPQqgVIScl3FS4o2hwoi8VQ5NNXX4dAoxnJD44xnZ7saRyvHSJMUv2xxJb96p88asoP1DBAHLJy
	/BrhuPibjymfULt/zcmWEHpv3IeGRnGCG5SIjZ4FYtDKFo7dY13YDdVTiLSPpt/RlEbs436TaOs
	YhqcAlkv2tYSHonvxoTrZ1Ri8qOd9CiykNI/jS2d7WRsLFDnkY5kva1v+wC6XSdkiCnmcruRAxH
	HN3MREdMcDRQMTcTMo32Ru6kRCya5LzP0dclZI0c5baHBpBnlCzz
X-Received: by 2002:a05:701b:450e:10b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b25d35462bmr1797486c88.35.1793945224722;
        Thu, 05 Nov 2026 22:07:04 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:04 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Fri,  6 Nov 2026 14:05:23 +0800
Message-ID: <20261106060525.346873-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SpacemiT K3 eFuse controller and its readable bank 0 and
bank 7 shadow windows, which contain temperature calibration parameters
and other configuration data.

Define the AES_WTM clock and reset, little-endian data and
controller-relative NVMEM offsets. Use fixed-layout cells for the
temperature calibration parameters.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..93f4301c8289
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/spacemit,k3-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 eFuse controller
+
+maintainers:
+  - Jiayu Du <duge1256@gmail.com>
+
+description:
+  The K3 eFuse controller provides configuration and calibration data through
+  shadow registers. NVMEM uses little-endian data and controller-relative
+  offsets. Read access is limited to bank 0 (0x104-0x123) and bank 7 (0x190-0x1af).
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-efuse
+
+  reg:
+    maxItems: 1
+    description: The 0x400-byte eFuse controller register block.
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+
+    efuse@f0702800 {
+        compatible = "spacemit,k3-efuse";
+        reg = <0xf0702800 0x400>;
+        clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+        resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            temperature-trim@19a {
+                reg = <0x19a 0x2>;
+                bits = <4 8>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..0a9eb764ffee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26525,6 +26525,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
 F:	sound/soc/spacemit/k1_i2s.c
 
+SPACEMIT K3 EFUSE DRIVER
+M:	Jiayu Du <duge1256@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

