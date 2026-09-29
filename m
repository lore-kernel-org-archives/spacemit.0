Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8AA483815
	for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671104; cv=none; b=D1Dap1YTO5MSGM1IyVD0R3MLKDboeSQOGH9qxjO16YgMIK4qavMDZcsvtgF34udkmPIKDA/UM6Q+0WGf4ioYHdUDmbgXmeENBNLFZXvpQE71D1CY9Zc1bk3R1ZXwq8+ciGADkJmU01AjwpyL2STzs8aTj8J6pU6t/mKPDWBYFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671104; c=relaxed/simple;
	bh=K3MvCrFWzEsIrhBWqxeXc3gdx6o84wogtYscdysHXgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJ4gjzyZP1f1UJrce6jQmEqnr+tRc2bj36hRlgfvAQyaaaUPU/RofcyxyqXuttMPzzTsOlNTTF+LrFooJ/3VtmGALQ17zqF2iBYHefINXcwX1+FQXtzNt+ZFQgLbvtcOF98EXd/zurMv6+SE/tXhyL8hB9Sf6bFnc55PvVKyD1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgmDK/Lv; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgmDK/Lv"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e22e123350so10625285ad.1
        for <spacemit@lists.linux.dev>; Tue, 29 Sep 2026 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671101; x=1791275901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=qgmDK/LvZ5qGxw0t9foCHYppz65iHVj5XzFUY21i8jxLjA3TWH6Te3PmZaCHxxh/I0
         SIZ5OnZZ84G7g3PvbEyfFdqA3o49c5viKax4G0wPe3rpFJTrkvz9NgJzNrQmTAfyI1j7
         FakDzLhpCnwB401kLuCjBd3NC3Dhev0Qy6DGNGK3vTQDvMG63mksGLvTbR944V49b7om
         d6lUlBoV8tQ775sT+ovnZup+bU7L1Q1JkYHEJbYT7o2DPXTEsUe5/7GPPi849l1Ye77T
         EvaHzjbqwjqc2hLfEPGS6pv6engYUvpUYEaqkGW2pVD0512kMNUDHpz4d6q4obpsmH1H
         W9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671101; x=1791275901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=pDn9zJ4XgdC7Bw9gT8eGVxnZAEveMULhWLXHijn2pwYLyqt7EvIfeM4YuWOdeXrWGu
         fTmAT7+fgiRaSZKg/qpZHQJCFKjasfbyZe3mAw5sy4ySru9+eePrVtTy7+RmZpnuZvnK
         qKn0G7zx8hwGbVvxwNw6pV3SLV1ubHIWIpA9fco7LIKqr4zuwzgXeQRpRKSJdZDznHsx
         PQpsgPqJcMIvv1ISD2/zBMIPP6+SVJqIlTu8AVccUfDnNMOd6f4NPfJ9eCzq0OM1YkoT
         5LQsihy9YTgIYKw4UPw2EEp1wBKb9SRItPcrizmcF9DUxfUdTUNs2oOvLdtyMMeqHAMp
         dc2A==
X-Forwarded-Encrypted: i=1; AKwUvBzA9Y2nB32/1cgb4FMpTiqfnNxxtlcskln1n7aHUaGgmnn5POnYI8xcbmesRR2aPjWzLDVdchynxg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIHUJXr3IbDaZjVUcmyMuTdrQPTY8l0Vp+BEgCmazhOErku95Yb
	qXbFLh17g1ncw0nanjsOlAqg8FsGuVCvGy91sbouBVnTvSaEw3jyKRF0
X-Gm-Gg: AYBFou1DaDT0+QkGysWGWfoaHGpu7cxLAgCMwqa3a/1gxblxPrko13p698mIS0pbUPB
	Ce+cwnRpdV8jemQ/mpf0f8Y80fBqN1+IBhD4IUWhISi9NqpnWjE+HJo4rPDSFl8tFacJFZ034mz
	KVOywfc8DdtO6r4lTdtDjvf5FpqUKvjCfgwYnqZR5UeAP2NbvEDDeiOAJAbGaafVp7coN6/Nen8
	8ivpI8bM+ZlXQrwfF7nHx8iFQwKF74CA5UuNq0kWbOeT2UqQ6+Tayy7JcoFFNRjK4WuCVsmUWUv
	RJ8y/ygKufTR5E1ljC2qFyHZK0/DBy89+tALOsnQJ7gHJ+rvEczc45E/AVAsNS3ObMTv8k3MGzJ
	m/uYR2o7mfvRehzRSvlA+F0cd+Ed1DBsGLLzxpgH6s+6ougx6rY/Y/VGsxRwuwn3vDWJ95m9UGq
	C4JQAj8d65JyQw+HpbjnD/KRTaoHPINYzktXUyJpjZXLRYABC99dII9dTIj0S8Si32uN/y
X-Received: by 2002:a17:902:d4c8:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2df7e669010mr123382255ad.53.1790671100775;
        Tue, 29 Sep 2026 01:38:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142b002sm51326225ad.50.2026.09.29.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:20 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
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
Subject: [PATCH v7 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Tue, 29 Sep 2026 16:37:51 +0800
Message-ID: <20260929083755.458238-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
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

