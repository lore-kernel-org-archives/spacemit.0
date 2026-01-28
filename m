Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C8313959D
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592071; cv=none; b=qNODQTB9I3zLz9qsOAnshQH5v1LZPWztv/fFkAa31R+BefCQl7EFoIzotKX5ABVgZUckCr8heEQc0hvfycYyeFvV/XbjDCR04vbMgQvKV3SRfz6D8wkPrWpzYGD9vDQrpvhPC48jjDprU1lrnLuDs/+Fqn/29DF2jAFSHIYY0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592071; c=relaxed/simple;
	bh=5xIKoh/TwhS0XTiSYjF8TimZ4Mgh0qKu32LLs95xkk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bb2Pe2OMKl3nNoX2Gv3O/h+IfDi4HbREVMzctOQ9MohXsK5N6xwrHpZerryXrAbbGNAp1KmiaB1VM3Y9cwqWgOZrK7g90KARSrBPH/Rt0G3ildD6LusSsBAhBrIhit0ZdaNoOoyxKScFZjFDSgiFPZlI6yIFA1OcStazI8UxN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW36KPwD; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW36KPwD"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b785801c93so5839638eec.0
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 01:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769592069; x=1770196869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEOFkSi2N0vtkbtCff5kn8mqsv72spWR8lTmAsEOTX4=;
        b=LW36KPwD/Uw0kyot17dyDiK6ExBerk3cHUBYZot7ickTteqECtBIMNnswAZLaAd26f
         BYW6Uc3HZ4sZHJS8G4VEmw0RujYQ0rWXPI03wFDrr0ru8P0RgNihamuf45Ja78AKwJtp
         LqR9E+dyfGUVRHE73gEgAIUeYqCzZU25z/1gA5DLJxeiyI5y9I741+Y+HGYIr9HsrAmF
         85yfLwYoZZt8wRdjeAp06cA6dSQ6a/6bggiUm5s8f3DNVVswW9IMntKFy43U7dBDTXg0
         uHlIpPVVWinEi1jpKxOuaMfD/qpKl7cyqoclxS1+Xxd859ANiYhrjfHEBi1eIxePdhIj
         EiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592069; x=1770196869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yEOFkSi2N0vtkbtCff5kn8mqsv72spWR8lTmAsEOTX4=;
        b=il/EHZ6D+tdztnp5pqQUhezsuGMh40kks2X1XJQYxDXJ4/fv8lSN8hAmhfExv15322
         8exAYhLyntJG0KLbl0LNuCLtF+3FeUd5kZoFjbHHHDWIA+jnk7BFb2+/ygp9h5H0BqI9
         zr0VMteOKZS0qP4h2dErZqgIM38WJ5DvJmN9GOVlMHHU3iOVXZy4hIAb2s5YE7/zi9IN
         7+h/QHqctBoVRBuNN0YiGzdLfOdxmaPAXDVWJWPQ/2V4UV3Exi38yoakT0WuYHOm6v0N
         EbAEbTgXZc0pMjOxuoS/mclm/MfYxVr1uvPMG2OoTTKDzEHNoRTCcyrMh1l9Foc0B1ui
         Qn/g==
X-Forwarded-Encrypted: i=1; AJvYcCUnbNT9xSI9mGSajOamPikWD0rm0WuIEQADf9txqvENVhkk0zJ1tJXPRRDTA7mmd878GsMaRURTng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/urlnNY4OA4bRclEj6CbTP55sECHqguw5NANe0W07wceJFpQ5
	5ZPF/7XaPPNzCdWwmBnEz+NdbyexXpcBNinW0OVJu49hBDILvQCNVhPt
X-Gm-Gg: AZuq6aI2ugwtwSCOYy0mxd+grrKeg3xy2jg4gvRwxaRng+yHvQf9bItxot9ESN1Lie/
	PAkPif648F8gBDYbUqoulQkIVDV4WBJhVrmLfj8WhqoRLY5t6WM4A4kRQonlCTlKKzz6howWs1m
	i4RNJW3ZQp1dSF2mP1zXHiFV3XAWpCeVK/F3d415R7rXdup0bkOL2N1JnJLzRMZR0Aad0ZqSGek
	lPRYnNld92r4VBzLiz8lVg+nPeNyUDzl1T9FZtQe3gayBsxiAXE7RJaN7U/YtuolU3IEMZbdbj7
	yunb3v+mWePtYcCtI9sK3qcMXB51HROOXNAtmrhqfZJKcSTHN03B9uzGYFEoRdMeznyzrSufxPF
	IAI8ibZLCgTidDzNZHXR9Wba6eGc5lB9U/ZFOdSpuhPibf+tWzdxPpcugWsaYfgnfFCtKeZ8kW8
	xq8vgQIK4z8g==
X-Received: by 2002:a05:7300:a188:b0:2a4:3594:d540 with SMTP id 5a478bee46e88-2b78d90178cmr2919827eec.13.1769585396662;
        Tue, 27 Jan 2026 23:29:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm1515483eec.13.2026.01.27.23.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:29:56 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Wed, 28 Jan 2026 15:29:27 +0800
Message-ID: <20260128072931.875041-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128072931.875041-1-inochiama@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
MAC (version 5.40a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..a3fcb9a251fa 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -34,6 +34,7 @@ select:
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
+          - snps,dwmac-5.40a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -653,6 +654,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..fc024a927fcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: spacemit,k3-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: spacemit,k3-dwmac
+      - const: snps,dwmac-5.40a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: MAC interrupt
+      - description: MAC wake interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node which control the glue register
+          - description: offset of the control register
+          - description: offset of the dline register
+    description:
+      A phandle to syscon with offset to control registers for this MAC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+  - spacemit,apmu
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@cac80000 {
+      compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+      reg = <0xcac80000 0x2000>;
+      clocks = <&syscon_apmu 66>, <&syscon_apmu 68>,
+               <&syscon_apmu 69>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupts = <131 IRQ_TYPE_LEVEL_HIGH>, <276 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq", "eth_wake_irq";
+      phy-mode = "rgmii-id";
+      phy-handle = <&phy0>;
+      resets = <&syscon_apmu 67>;
+      reset-names = "stmmaceth";
+      spacemit,apmu = <&syscon_apmu 0x384 0x38c>;
+    };
+
-- 
2.52.0

