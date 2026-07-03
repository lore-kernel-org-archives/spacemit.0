Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C012566F7
	for <spacemit@lists.linux.dev>; Fri,  3 Jul 2026 02:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044057; cv=none; b=tLyzfUt6s2mgEM47gpdPZu5W9VMZvGLG+CErNuEMDGE9gJyBpx4Aqfm/sp4Oz2cs81Ub5v/9pZT2l8xsLw7ZaCPuRNdWFfkRKfPeCzQnlD3fykfkLpeO29CoUTHAoreNVsBCV+mJf0oy84OvSD2UqxG8rmJNrQktFCrYchtMfkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044057; c=relaxed/simple;
	bh=jxRLXze+30Bd3HWJshR/WJ/vpy4kHy3z4wUO/puyrSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTIbvCALiIpx9FvsFYkyAdrDtY3WXGS+RsVNwGIzelBxAoyKM+0UbSaT14aiglBmVh793rlbkLQyzFJbLYAghxnusHlm0Ma4ErPdKkmVOF9l93svnCEFi1oowj3nqXq/SJi8JlQVr5BusNGOHXjhTZHLZ+67eS2RJBUsALHtbSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS8sXxnq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS8sXxnq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381216921aaso64446a91.1
        for <spacemit@lists.linux.dev>; Thu, 02 Jul 2026 19:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044053; x=1783648853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSnOb5hOxX9yUplIfdpmrusjS/RN2Btqas6tLO5wHZk=;
        b=XS8sXxnqKI1ZVEj3HIg49XWveQqNG1/UoRfWfJuaM7fujs8JIG+HPzmWadQC6Qma/c
         ngayJ8Y2moLst7lQjosaswt/oBVjw2vAPGMLl22J9xSr1kAWFF8EC9LNzYd0tQ/pbsCi
         1fhXyXP80+Ht7rKzbwhq3nW60KtOLlbZqOMTBFT2DbZAtDJlLX3blMYuujiTazFDXRx+
         d1G0dw1hTdo/1XCAj0UUt0hNTYPa6dj9aAa6XT5Wy/ow/3nHpOReWLu+dPo1X4taTNIE
         wad42XKOd8A+AwiJjRlBuu9Xg072r+cmi5fmoLxUivczh7rQguXmXnw+BF7QYA4BT+2k
         SpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044053; x=1783648853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sSnOb5hOxX9yUplIfdpmrusjS/RN2Btqas6tLO5wHZk=;
        b=SA+CDlBsa0tbtYZWOCbPqR49T79ZZn6iumExImMATjmgVveXDC4tcrrjhgwc45xNhd
         z+uA4wbJ+R97iSPs8UJhRxGBAIiPtwP3Zq7lj2fDl0S6FpuAkiQqhwEY3CXMcVobB9DT
         4icV5hKkX4wMc2m3nFL6FZekj9xdESt9cDaKs1LznvdD3WNWcQGxpy97O4ArsGpf9Bp4
         P5q0ZZMzVAWkBVMLmrT3P3SWlwGftFQ/0PS47cJaho9PvRApLhxIVZFPNF2W40mTn6Pb
         kG0HgLBNHQrPEhzYSTHk45WulPzuvwJOx9N08MdK3zNqscb2YRA+BFRtz4CIS+ru+N2H
         a1OQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpV5ADFpCoFUCbu8Add75f6jCSRG65p/B2myLr6gevWPZF/ecHceLD1FrAhmsgyT+phVlVSldEkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJvqc6Cg26qUpsSboYcT46gzruB8/3d5VKbr3Zk2+aSeSEiqaa
	2cWzNa8+Lwr2lVc2oJ2F0w5B8AtZ/sLwZsMDt7y4iALGejguLGnFJuBv
X-Gm-Gg: AfdE7clG5/tS7NOPVLrxQvlBkbdTXZHRe2iARkH3vg/BhzzUBEGm3kQxB44ILxnUhtN
	j2wxep+APRAY2ImVXRCgcOnn+DfQxpoFcl6jcSvearWVb5iiLzAmXH4tTYDs9x8SHFedfjWaq9S
	f9QEKysMzWyl9xMbfowpVq5Tk7WqiD/qTC0hGGVub3Wu+340CE94B5DONef95/WjN043TJwQtUD
	Ecqdy+aVwP3aYKrnb0HaSmyWxCP4q8Z5IZyjwxqGpI1DRm8KSXdIYoBJ536Cc+/5KDcClPOV3SS
	Jzclsn5YXoG9QXm/wnQB7zU2TQb4hO7bQjiBTmU35LP0TUznjgejqMSUBgBMMlFNYNqlAGWyxhq
	91tw6Va7xrOCt+x8Lua25X5yGSlNes6LOIsy7f6Furkw8s8r1yXe+glHVHiLxQ0oRmWbiNoLKJu
	8NEdz5P9ZUfhQ=
X-Received: by 2002:a17:90b:4f4b:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-380aa184432mr8707455a91.18.1783044052854;
        Thu, 02 Jul 2026 19:00:52 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127adeb21sm189517a91.1.2026.07.02.19.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:52 -0700 (PDT)
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Fri,  3 Jul 2026 10:00:01 +0800
Message-ID: <20260703020003.485436-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 46 ++++++++++++++++---
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..720951b4ba77 100644
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
@@ -96,13 +102,39 @@ patternProperties:
 
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

