Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB09A368277
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 01:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128287; cv=none; b=bZv2Xdh9v5xGhtkDyMzaUAAv6CEGh/1hISaScyNa0Sw30xKLxotBFepZQ63vwfg3scs2IaFJr2ZvTEJMa9YbuMYyjfLIHvYDPSmC/T4rgp7klIk2DnaYBNcxQD961hE7kgqxR2gEPsFalcfgJZ8bmNDjPNOxY9zwl4fBhwd/1Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128287; c=relaxed/simple;
	bh=K3MvCrFWzEsIrhBWqxeXc3gdx6o84wogtYscdysHXgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FseqwALLtRVuWs1HS9nsWfwJKKxbCPhPdA4oRq3RVceDvbdp0CCFfhfcAl7m8SEvXyuQ9DYgrxhoiz+GXDt5s20G+0zZILM5h3muVKHJL+ZccnzoYVtgj3rFIL18iYwPero/53fQ1Lo+vqUwa+btoAVsp3OWpEIz4F2+UaeM/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9uWbtl5; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9uWbtl5"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so318709a91.2
        for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 18:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128285; x=1790733085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=m9uWbtl5IuzvVV2gG0yi73P3593Tyrp9OWNBl3JPnTNWwsnMJAprq/W+Hm5uSjyvQv
         NB7Uw+1Dh/W9QrJKGCWgxqtw4tGJEpA0YYw6hX3+k4umEUwIGIRlY9NALd0nT27JkuoG
         yDgsy2ymVVmIE7XIX7CCeAum4GH5F15ixLkiAh5nRQtMY5SeB3JMjCZZUa7fo7Lx4A9o
         6/op8OHsOTdOYeV4/miBozd0nrod77mfzTJWVnswOo/RBK+FEjZc4cZf8KAQdAJYHaOU
         Qwb5+ulQyiv2X7pzHMJeM/1Olv0nWWVRjxxa7zX3lnxrfSpGJZ6FcXm+frhVGQNSAwva
         j9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128285; x=1790733085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=TOl+U/Y1emwzsPZPVug9Fe3XvGKCIjvQja+HuX2NQOrQje/uXkWJIrYsf/Rtx5CBci
         vmy+NH+ugDdTwSnhhplqw6b5G/WCr0S3f5bKkybUeK0pCB1454xRXQHmv4C7jeQx9cNk
         uz+ghgjRcdGtJ2bMUAA//0QcGkiY6+85TR2L5oT1YcUY7VAh115wyMWgO4xxdBgiHDFc
         turecNrSMWeWkdPVMEKf2nmrDTlemZ+tbVCwrB9GsNU7MqL/iSo22iepvj0QcmnlIX7T
         bdY8Wx2+HwKPgZS79q+04jhzSRmxh//jsF/CO/j69f+7peLDZVVDrApYRtIG0z5Z2esV
         Mrrw==
X-Forwarded-Encrypted: i=1; AKwUvBxj49u5QaHj6mK+fMC6tlCOoJHVcsQKWX14phFXBhukZX1mKm7DDZlj2pVEEvjpSuj0VUS8Wvi0Lw==@lists.linux.dev
X-Gm-Message-State: AFuF++mpggaU0f3AChP8fB1eXiS+08qyO7HSq54HsSmz7dE2TbO/Wmlp
	DysP2bhOeqUB7klQ05eumBuYSBpfr8yWBb6zqVzT37MVa+YAiwudaQl1
X-Gm-Gg: AYBFou3ShSuf0QCYwBIpujy9OKn3kbUmzs4sBPrRnWPd6/bGvXUBe1yyVtPMDrVveZ6
	R1iTlOSCtRHThJ8eanOir49jd7MLkombcc/HbTlezD8icm7ah2i6qSXqd4eeTc0dVnicOnYnwso
	YXFDhImvu7WNHC3KyVua7UIr1r7CGv4hLOygSCvueEealrrOPtixyRgKiVXKfv1ohpzBD5MZm3o
	msiKoLx6m9xP91fLrr2ZutzKcPUwvp1gudirp9mK8h+TUtXdkMUHtjm8x3gzciaa45QK1ysvqby
	vZmTu31O72eTvb4mOAbaDrsNyxOpP5LW0swoyLreJHxqGiMApT1rz+TXN73ncKhKLbL8kjB3yJW
	9QCWe8vzL2uhM52SiplO1SOhuGMMemJQzA7Y3TBibvAfi+W2AgBdWPuuVyR5lj12S7s5DMLen8J
	hsN7E80kmPHdnBhpn69PtDS+KAZ01CAWn5Pfm5DpJcMldkaiDq6aZwqNKeOQ==
X-Received: by 2002:a17:90b:5646:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-3a07e54a847mr1105625a91.11.1790128285046;
        Tue, 22 Sep 2026 18:51:25 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc01df8sm1881084a91.10.2026.09.22.18.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Wed, 23 Sep 2026 09:50:14 +0800
Message-ID: <20260923015016.64069-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
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
2.55.0

