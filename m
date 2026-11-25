Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580150;
	b=VIwY8j9C75gw8x6QGxSB1qRShw/q5UbPajpZemvxx4SVQPUQ4StLrbwHO26PBLM7DNSS
	 SGtjn5q5/UNM+rpCORfN+y7J7fsr2xJXS/MydVFs1rcm8heutOrs8KaskCzqgO3uiA6oY
	 XNMEwR90Wcksnv3HJ5O5f6xd62GhuMP97nmNNac8PQx30XXE2oXv2DXuh0iRk/pWmTfjI
	 B0TU8mkV7SKoBnfeAssKGdhrifYhiMjP3xs9QSZ9xjLJRZ7OwvH/oqxK4F7KD3b/YvT6Z
	 GnHIBd31NlTZL5kGz0ViyfMckJRe4KD2mJXvgSZWE2he7cbUopyohT+zfnCPNVFRL7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
	b=jSuINeAPqkwkg4gGIOhWL01SL0uNkQ3uuPZr0wJIW/j4QMluojO2m9TQhjkEBwdWV5wg
	 oWMoWMFPuaqXlCJ+scn3ESw0YMiyT69Cx8MfT2RjyZg4SPUbCV6S1Rf6wW72iPXnT31Rh
	 WXLj3dWoOTI5/BPtiA7Ap9ev2RxFU9I7wWUDJEecpnT1ycwYsJER/o9UBDIeWZCWMz1GM
	 R9BSWLR6DtC0yKOhnTkckVQeRzjwI7tqdFX2jsT+r9/tBux0wgujQ+KME2cJBERmqZ7w2
	 +TyiD1SysKKh0oTWrZMDU4+FXUbOsxH8Srw7Scd0Cf45geBB8F9iTPL/HSpBS/42Mmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSChWoWM;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4136606A338
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 04:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4136606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSChWoWM
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so2518788b3a.2
        for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 20:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580149; x=1796184949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
        b=KSChWoWM3sdBGumOBfboRTi+kSYIERfu05sR+4hv6yVtAUc6yGm5iCmGdtjolbjc90
         LnxUBPtgDlaE49paP6A40O7X5WGshdYZqrQsI8cMRjwQ34Wc59PKqaCYixs3Ygu/0uaU
         P0O3HToH86gWkhmg61hxJcCIfZBdAlcxc8GDB0fCKqCel1r2WBFPbFEPzE64wx+4XOwH
         PJsAOIIYwHEFIKPpptLSghNK7z9pZN5xVtvkdj7AGi+CG/JqHAo4jIIb0197KPX9FbmR
         ofLfIH2y9cCFnURLqAvt/D1cf3/pTI+zVM1q1biN5X7ayQYEI36OGIfUlb3xoHHf8HUE
         9rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580149; x=1796184949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
        b=hnVoQ5DfhYsjhtme8qhrOJoZ3H6eTsEt3CTICVOhI1ItR7qvjrxWdsyto0cR1DPh97
         2ychSpeknkmsYFGweJ8vctEW8x2kaKlUl9g8eJb1JO9E8sxMmhTIIgstJw64MEoNPd0N
         zdrbMUvmULSdGJ1dTrkPUebGISTBimddDcXTZRfqC9g8ekSmodaU0SRHRkAq1dGEt53q
         5loFMu3PtvGhP2IS6/AXgwB4kgj3JpkXNyNEelW67A2EL/j4CS15t+ovVc3IOCSfeZ5B
         Y3cJWGh6CDOipBJfPY9zL8CkoALHOUQOhcJVa0JZOUPQHa+ZzscDfNo3vojJWqztkD/+
         TCKg==
X-Forwarded-Encrypted: i=1; AL+hErHqrkqGkEixhjJGE8JVaYQCAyCNiDg5BYs5PXYLHhhX93zE36SdcyWemLXTnudsWTqYiJK0mTga8Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8pE1h28qkotMomthj8uYEIOtbR7OWdq7bytcmhZkePTeiQmGMI
	2AlJm7DTzYoDcMBqCXZ7ATe1zuKkdV/+JUnHQ36pz6Icksae4mXtivBT
X-Gm-Gg: AZFdTZeDb/ch3mFpjDCMDucYNWBfRbXXCG4FCKNCUXQPuMw5EktIGRZCMpweTjwDxqY
	SXkPifKfAJ2IcTHjUlzD64iqQ0TDKFlijeHAUPBEG0Un/qNooVWBtOGlNUFF8Qmg5+mwH8gZekU
	uh5+8T9/LDQh2t2Q//QfLiby2lEo5Y/hxgmTNUq4PpRf4A4Q49GoP6BZAiY2jVd3ZPiIgCpSZaH
	l5B2IRGxL8e1pm8Xb5cKlYzPmtWOwT9N8seX9rdpmTsNaLJ7wYkUjHekgHiEC4BIW3+fhNKU/Er
	8Lim9flKz+GLnEmiV/p04mjnJYrIAYtS9YE6UDBGl9FHmD6pkk2IHBl3fTZ3rxdbxh/qaq7fJYI
	RSzr9ljWyBAuW4hzL+QNgDfE3dw11CzoBsQhYLboT1l58EJJT96wtcxPQw55zIK8VFydEYE5u4Q
	e4cvokCV8CE2fM+UthEpRj0ZY9RTG1D/cUfwUziSkcOIeJ2PRSl7ab21cRiqwzrP10yj+El19DN
	xD7qbVCeUUXiLYRU4sxE/cvPfDXlrHh/UdiImxCJeB3ahN4zzIKd2Q37tHvDvfYXua23QXOws94
	fG2CH57VK/OKXMnnJzRL2IhjUK0=
X-Received: by 2002:a05:6a00:1f14:b0:89e:9c7e:fd49 with SMTP id d2e1a72fcca58-8c87b9cf695mr14659779b3a.20.1795580149082;
        Tue, 24 Nov 2026 20:15:49 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm8204660b3a.46.2026.11.24.20.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:48 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Wed, 25 Nov 2026 12:15:19 +0800
Message-ID: <20261125041523.242588-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
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

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 55 ++++++++++++++++---
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..af32e427c0c5 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 PCI Express Host Controller
+title: SpacemiT K1/K3 PCI Express Host Controller
 
 maintainers:
   - Alex Elder <elder@riscstar.com>
@@ -12,28 +12,32 @@ maintainers:
 description: >
   The SpacemiT K1 SoC PCIe host controller is based on the Synopsys DesignWare
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
-  controller, and supports 256 MSIs.
-
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  controller, and supports 256 MSIs. The K3 controller uses an
+  external MSI interrupt controller and may use multiple PHYs.
 
 properties:
   compatible:
-    const: spacemit,k1-pcie
+    enum:
+      - spacemit,k1-pcie
+      - spacemit,k3-pcie
 
   reg:
+    minItems: 4
     items:
       - description: DesignWare PCIe registers
       - description: ATU address space
       - description: PCIe configuration space
       - description: Link control registers
+      - description: Data Bus Interface (DBI) shadow registers.
 
   reg-names:
+    minItems: 4
     items:
       - const: dbi
       - const: atu
       - const: config
       - const: link
+      - const: dbi2
 
   clocks:
     items:
@@ -66,6 +70,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +90,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +103,43 @@ patternProperties:
 
     unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 4
+
+        reg-names:
+          maxItems: 4
+
+      patternProperties:
+        '^pcie@':
+          properties:
+            phys:
+              maxItems: 1
+
+      required:
+        - interrupts
+        - interrupt-names
+    else:
+      properties:
+        reg:
+          minItems: 5
+
+        reg-names:
+          minItems: 5
+
 required:
   - clocks
   - clock-names
   - resets
   - reset-names
-  - interrupts
-  - interrupt-names
   - spacemit,apmu
 
 unevaluatedProperties: false
-- 
2.56.1

