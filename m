Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEE5478851
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780412; cv=none; b=O/vb15jEPuDc7ryCG5eY4ZiiyF8JIWFxcBgiDSqaCU9nu/4G+eMuiPTszaCG/2/PmkvKj/ML67q1CxkHHcSZ2RMC57GE2KY7vm4dOY6wA73cNXSA6PLOtZ7yeoSQkJqtaBcxD6X99X4SiuUMGbF1ynLIzQJiII9moDtu7SOoaBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780412; c=relaxed/simple;
	bh=tT7VHBhWW/0ENtiLY3CsIjS6UXJSVBBo9toNQ+Sp3xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hiX3bFawiHRHEt2GXIoqfiN7R/Qb6bPRe1myMIY0KEom+glJv6bfr+chfjjTpFGTwDssIPjYEf5m5wbH6tDWGCMB1DFQ5om05Mrvntcbux7pjd0OEJLi0Ep3MVLQlrZO5ET92y1aEzm3GPCSMfEDcvfNbq5Kb3m5B5uZDEEEVKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCTrBgOZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCTrBgOZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d53197d8b5so29533535ad.3
        for <spacemit@lists.linux.dev>; Mon, 07 Sep 2026 04:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780410; x=1789385210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4ITEkWMTQ7J+Xoqp3nk8zHPj5XC/FSGr4Xf18I5rrE=;
        b=dCTrBgOZj/pZ1Mi3oXoPAVIY8TcY7xtM6EI/1E6AmwXvLRJTIcZ3WjA8kQlEJrY3hP
         fWZxSOiA6bR45eLnxdwzlCvepfeeLlAxWghrGKgetZJj5CYfW15+LG+nNs85sZ7LO0kg
         8yKCQuSJOOl/jJYI0+4jl627VLibqWv3Jh9lGUMXB7zLbdnOKybGLLDW1P+p58iZjasY
         E0x/+gA4kZnuLBvjqV3/acs9uhnBl/5uT+0j9xkwtC+hHuUrHGA5X24iAz0c2joV5LYx
         g1LQGr23ZHEam5+hbtyMUOhJ28z3PGySvZWihOozH+ijkv3dxZIe7UOKFHCpG6bnV0PY
         swmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780410; x=1789385210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4ITEkWMTQ7J+Xoqp3nk8zHPj5XC/FSGr4Xf18I5rrE=;
        b=iErEKyiBCTb55gls5CfD9EEIYZ2Do6DhGrBJoxTvNYzi97H5vnRcWNBY8tgGWjnbuq
         EQ7C7VBKsOrRVoiqrFJfwPUgf2W91erv1JCDMENpOAF9ACyDEx45hNfVBqinuLIl4idu
         wwytWSrzUW+TPulGQdNBUV05QEjCBodK2v8vwryLMJjK1+mUVcnEkSoZrCTZhgcnTvmO
         +MvZxFEWzbjdmWByPlbZY2ZBgC4zEZBFMYvax5aXja2f4DOsCt9oeX488u80Oc0stTbO
         Q63LSeURFKOTrqQacSHHJ5ikiCx+qVoPSH+tdlkwQsoHATxiX0rSWH2tP2stMdIJfSTf
         yG7A==
X-Forwarded-Encrypted: i=1; AKwUvBzqxVIcwYqEPegZ2hT5wFG9iBEodL/I9JoGAizoZOTe/SOQHu5t9tdtSyC21muBzMw0qM6r/LGh6A==@lists.linux.dev
X-Gm-Message-State: AFuF++kJZEIH75PJRBlOS1cu2DuTmyy9yCG2plHcKj0MPBG0NXj1LqBH
	HMOTFrcL9s50w5QyhIYDOOtB5b747buXSgKhBan5mpd+JIuWiHyxDp2h
X-Gm-Gg: AYBFou1Xd/+kX2k5dBBWPb47hPQ11LKFxeTCpr5NOI7HuuluoOV8lIIZe++2APhw20U
	gCm0XzCUcgKNhfU9UgRevZcFPV9SKKqFPs6qwsnfRPv0t2OjWaW4Ae9VdFkvGbqfJtgpFxm/ZXn
	fPeb7vJIBx05Dko4xNrt4mIp2/DT7wPM5Wh8KbSiZ1lGDY9cB4r0Quq7MqqW3vKb3MAyQ2ItUME
	jCnMlsSRBYo4OwY0D5CyY7cG853mjtSoNRWm2oQBi0mgvuSSza2MEHkQGbbgNuZ6S7QbG1bsMdn
	GB9Eo8HB3xwwacwZ2nNFRReqLpRy5ldxogwNfbjk1VFdD83YWSonQEezSip52ZRv/rqWs1niVvC
	flPxhdb0bhVXzRoNdUJRDdHrQ8u9Tb230Ftq/d2yKG66monaPB5DQTCswY1kIUWZfiAgSNkH7+b
	Bq83cyVIsUckd4t7rOtt0wJHYNDFBRpMRpyqRE
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr30388041a91.8.1788780409708;
        Mon, 07 Sep 2026 04:26:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm26270444a91.11.2026.09.07.04.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:49 -0700 (PDT)
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
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Mon,  7 Sep 2026 19:26:04 +0800
Message-ID: <20260907112606.465778-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
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

