Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA913388E45
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 04:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569695; cv=none; b=c3rH/GUvBGEYZVX66rYsUd7b06JUDOSsrO996EOKTC9tqr3IntVJG5IN7+jpmCGP/UcKevDgAz6Kbj6K1DgAlY0/XD9lBRw9iMSNRVP0JfEOCh7d75GxtuLNxNXewb8ggympWPmEUNopvzanCyj3SppkQ2akcHBzUD5YNQ6aCIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569695; c=relaxed/simple;
	bh=tT7VHBhWW/0ENtiLY3CsIjS6UXJSVBBo9toNQ+Sp3xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNr81CR0IH9rsBD2sdlyD9OFPpd3zTYfFkkDFnVXKTspS1hsOJsJ0gEszjpU+QIAd7NEh/xa81ypsC8tTKyQLMcrSDnj5FKt54qehybHcGBlEzJSvsm7x187tyaofhnjkLwbIYnvKEQwWPssGczLET3j6YJl+aUewhtZ+3Yk1S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkDLz2TH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkDLz2TH"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-846970f0acaso469826b3a.3
        for <spacemit@lists.linux.dev>; Wed, 08 Jul 2026 21:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569693; x=1784174493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4ITEkWMTQ7J+Xoqp3nk8zHPj5XC/FSGr4Xf18I5rrE=;
        b=NkDLz2THgm3qBG13CTWIKfKXlL063+qmnBgaldCQaH4uQuHGt9hvlphXgDbUrHZt4q
         /O/ZF2aBbavf2z6Gvye0EJFH5kil9Sn4sPMWTAE1Z6FQOqAxT4Fm+7EzI6LKWKvdKPO+
         F7Cdxjuj3N/36h38514liPNRToL0A5V3RryCldEu34IdgHR8jfcrKmgpzTN63pwxARx2
         0L2UdB7rx3OcCKiykSmyrDU2ayJmBCKNE+0VVF5iDKrbbE4lHFzxN5t20LoPMbOUC2QU
         ikcxD89K+XLRZ/YcVFHyaqZPFn0trl6gb6Ac+z+quy84IKKhexYaTwvRo90EpgZqPEeY
         YHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569693; x=1784174493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4ITEkWMTQ7J+Xoqp3nk8zHPj5XC/FSGr4Xf18I5rrE=;
        b=rJDLRDzgUX0uNRjfeQz/PVqXNwlL67wkA4Ngjgudo5Foq/b27hJPbJ0BfUoT4CVova
         NShltujrfqB1yqDfw9pC+3ObwdE5Wx9MahxLcF/4Eb1hpo1yHLXHruHjbqrIwsvGRlZp
         Mfahk7Q0zbWiKTwL5TM7Rh+jWF48YmLQ66QNzMeQgjrAvDRCli/S5etWHN2vmDRMGO85
         pon+W274JsE2HFK5VmT+TNwXz0Ec+Br2rFngMwPT91QW5j6niv7ZJHxo1qrrXg8cDhMN
         q//NMkFD9E49UaRrWl8ljZ3RGPhhdddmwo8MhaFHS59px4VuXdrwoDkCXL5xFac4Jayy
         cofw==
X-Forwarded-Encrypted: i=1; AHgh+RqsD8cEE7eJz1AYTOyVFtO9Bngt57A+8UbLSyLb9XVO4s3GAPZQcKlTxtS6g+O6Nb/eBOQKK3fsJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFukKFlRMv+YPEuonAkZS2guaRIrL/JwD0/CkTN32pfqV8oxxF
	s3ya+7529STpTlUpzhk8WLtRoLHGPhDVyfVs37ma/V/nZItOrsWNytV9
X-Gm-Gg: AfdE7cldEPZcrkyGAvVzJ6Mbzl38pTToZq01iZ3X315CxD+B3cX7RDaGocUnbcMNy/1
	VUqo9LwGIXjf10xlW60xzWZTFENgzygLap6W8Rdg6TqxlsC9TdaIk1sMUqqLHGZPhTGtV9XIB9M
	GKVtznMz2j7CQsQyTenucm84zl+TKpJ4n01anDfY3nto607fX0T7n/lpv6U+Hy4p+uQR+R1FALy
	fEP5h2S1x4N2ft/aCnDe6glDG075zr79o9ZvPsXCd82zs7JQglbMVwdtIpiAovv7ggfdjEd0rk3
	kZtrnY6WCyW9+ZiUnn8Nbmx0xvlrj74Wpt3a3Q/OkLjpTM24jkLdPCZOcynyynvpiEGfL002nQJ
	HOD2l/tlIZViofAY5qw+eUs9X3vXfD2/h/uUplJ6rXxhZ/N3yskLsvoCj63a7hLx2
X-Received: by 2002:a05:6a00:9493:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-84847542dbbmr4333053b3a.16.1783569692809;
        Wed, 08 Jul 2026 21:01:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm8064705b3a.7.2026.07.08.21.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:32 -0700 (PDT)
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
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Thu,  9 Jul 2026 12:00:25 +0800
Message-ID: <20260709040027.958400-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 50 ++++++++++++++++---
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..54817d6fd9af 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -14,26 +14,29 @@ description: >
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
   controller, and supports 256 MSIs.
 
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
-
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
@@ -66,6 +69,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +89,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +102,43 @@ patternProperties:
 
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
2.55.0

