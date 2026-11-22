Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369128;
	b=k7VJT12loCqPxCJ4B3ITkgzs6jJyKvISk2vbl7mgX1KL6o2Zx8qNftcWkw2W+GXdgRzJ
	 oWgTAgWcGuoBHDLLor8DmzpfHrsu78QBT2xQPX3K9TJv1C/Kl7CzN71ZDZc5Bq/9pY+iN
	 3DP8GlDFPyxr7ntLledJfsw5X/33NyVO/3NPdfcRWQTcYRsOPHMuUq6grNJBLRfsya4yz
	 WXNviZ3EptlMwKDAa2wd60JJyCiWZnPia1iDuoLsLKgXZs1XP0vH/L+CkBIXEhhpBYVEz
	 zcMZsOSLmSnX3g+q0GIE5gAZZKOsPev8RJvAaQNXOPhzpmrg6tr6iCye9+hzdqGD38g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
	b=s8Y7q8wZdR+zQjrIUETcDOAZAfcTXpBB5Os14IUosezyE/WZoY4Oe9sHaRyCIAFR2vw/
	 JZ/fJwvr9YrE6+DHY6CjsSnF/TF+nSSyXuQxGZGo+c2O3GspdZfOBmgt7EJunkRR6kKb9
	 OwqMAEiRW4bkisibGoidmnM1Iy0syIDE01buvocyocf0daMsuVGSUxZwSK40qAUOS0itQ
	 GVCiobJSCjsJ2TMC7CE0uYbjR1r0k3u0AlTGMnoljdBAV2o4Z3ymonhzMG+1IXJ5F5H6b
	 TfDDHYTQmOzj7qWFluxylxOFUFeGANN9kj65sc+3tBHTQ2pif44q8V9yTl/nk4w2pZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/AzmnhS";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73351606A33A
	for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 17:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73351606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/AzmnhS
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3866a784546so3094544eec.0
        for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 09:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369127; x=1795973927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
        b=Z/AzmnhSS26VOFkhUU+Cgh9fIJFrTDAHa+E0wlN6hUE7uJzH3nHvB0rkaSFIJJGuV0
         P/zsYeGs4PWjypDy1hq3NfTtGq/iNuBfRQXxgSQeNfHVd3aZSqfj+os55RrkDlnuUz2f
         iOeU1aA9I4F7JjyeuoPJMSDZ7a3JNi1PgOZew4zWb3Zdk2SH8RmKh8bEyXo2rRvr9Na6
         AuTWWW/f3K8fa8jlWYo4SHMX8y1CMVZ5COT8PLZe04kQh2WyzCBXMyAd8F9SmoiGGj/2
         b5k05H4mG48CvWH/Y+DLC9bbZARRbOrHlkwR4Q1a/zaXBr3bfeUSmK+l83bqMDD3PE3C
         ZQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369127; x=1795973927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
        b=sSKRkCh/PfbRhMn7x+kgfjnyptuV3WMBHwVBnc47kAAcvaCQBN/yw/lAsBgYEZeqjJ
         S+dVNzWeB2tjIx9qEgB03i08HmjqlWK756ldxLG3A6B0DLt6L7A4TWR1vG9L2vvexgDH
         +Gi6e8NtZyRaKIS4kTw9UTXHO9qF7Uaxj2xibTY6H7EVrXNtz/pCxco/74qKmmoJRqnR
         UHZwj4eT0alH7hB2yo6OQfi2VMV1Cu5idME31AzxtQ3kSV5bdzbrAtycxp/vk7Uzu5A+
         qKetbSpLZZfUaRlLlmbsu5w8YZagiiuQK2GIPtiM1IVPk59YwauUjnycdUlX/iH1ROeP
         RNDQ==
X-Forwarded-Encrypted: i=1; AL+hErGjXtlsaLboAOwx8LlDduHjZGQRSxSGu5M/hXDTkAmC1mMcHuOQ/lSo+lftJYwVBsmblnNFQf/O6g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Dbsp/SBF/GJImb6WkTBEM8re6sPvfin4FKYj2W4m/OAXmkVeg
	rIeX6LpSLGx6kstQPCSti1bZrbbCnCtFxQJKJiiKUqvRfMYg6E0S0eNA
X-Gm-Gg: AZFdTZcheNrdaKRIE4+vZLZMgPWD2VA/4iGqnFi2wqtXtlE3QbgzdEJl51XP5t6W4l5
	wO1dihQ5VILhNOzllRKV6Xt0JdcNkreeqnS3RhyImzFO0bKFOdf/yfPNg8BW5HMQ5CR0IN4ik2U
	vm4WrnZKKHdjSOab+euMXqb1rh/gSKRyWr2cV1z+RlyEXbavz63WFCoLnhMAXgEAEXZ1ixBlYoq
	TBFPliwroWnyQNSjcMuaG9D3bU2/lO+MFRTKUWJaSgz2JQ+T//4REDUs4JxLy3G3xz3Pde9mNhy
	CKagT2owv4xg0jdRhUj+xllwPIWW5GFtzg+jZAi63OTQT/uKytINuCAfnzwk0JgVwK+BwpWcZR0
	qzrrHPJDF8aFAaELl757f5Yz+1/kPyHZIfM9zn0oGzM0xN1hi9S3D7d/+ezRE3CUe3ujUpF2QvR
	FY4KFqAKR0zoLv+RW8iyLfiuQbtJBnHz1WaIVyE/EK2gTtzZn8SB5PnKU74jDrTif18tJmC/1Ir
	vO4u9dj/D6lRkh9xkub67SKA3trPNxGB9uhiLTN9pGy4XN5PkwxR9qzTKFGoq1Jep65Ep+1ZNR4
	3UXC7TscIQHYd+N9d4QyblNb+N7ga/51WXK+67icXQkVPfKnVw==
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr11040411eec.5.1795369126430;
        Sun, 22 Nov 2026 09:38:46 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:46 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
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
Subject: [PATCH v3 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Mon, 23 Nov 2026 01:38:08 +0800
Message-ID: <20261122173810.2409146-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
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

Describe the SpacemiT K3 eFuse controller, its clock and reset, and the
bank-based NVMEM layout. Banks 0 and 7 provide configuration and
temperature calibration data.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
Conor's Acked-by from v1 is not carried over because this version changes
the NVMEM address layout described by the binding.

 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..a7c27ed1e3d3
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
+  The K3 eFuse contains 16 banks of 32 bytes. NVMEM uses little-endian data
+  and places bank N at offset N * 32 bytes. Read access is limited to
+  banks 0 and 7.
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
+            temperature-trim@ea {
+                reg = <0xea 0x2>;
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

