Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB591C32FF
	for <spacemit@lists.linux.dev>; Fri, 30 Jan 2026 04:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769746142; cv=none; b=qJQRBUL71W5qkJetZNYIhC9y+QHnl8gjYJYBq5vjIESqieMDAYx0avm1UZDi+KQy5KuW9c05NXD4zyCHWU6jP5syTLWWGX+KMdCURc4UR3QKkWnXbYJMQ2Ufl+dGvRuFOeyKnU5XLJxt7IW08+VSR9VAwAIw6EKjBXViZdhyvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769746142; c=relaxed/simple;
	bh=XG8z2auvVLPIEbb53B7ae1t5gK554gf/2iUDA2auxCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbkxRXwKqVsH/QTOfPGWHfLuN9daxKcr0i23gPAKqvk0QUKSxXwNfAnOBroze2aOsOTZFOGBGagsRjKbOPUpw2sOCtq20A8cuf6sxI42tDBM7qgpY3TphK4gl7gYayZBWlycqHfvyFq0RGKFQCS9j/SVPZ0KFDRO7l5dx9EpTF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmE+3Gni; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmE+3Gni"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5028fb9d03bso14327131cf.3
        for <spacemit@lists.linux.dev>; Thu, 29 Jan 2026 20:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769746140; x=1770350940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+T2Zlo06xiXQn/gacLojfwLwZ7jz+x2wxOefgL6ljo=;
        b=nmE+3Gni83+/C6CA5oeanjF8R3sBcRrVg5Yq0pwbYXLyexjntjeDdkPsJJ5Nw97NVU
         0iptgUwc5i97WOkpiZOe72Zz26Fpiog5zWIzVdU+B5eRIIBVDPSLtbA7D6egCDkRflEf
         HvNmSAUqhyqXu0DVovSdxrnIS2n+k4aIvwBN2CZnNhL3+kxKoEJShe57BgUlGBsP6GBW
         tGc8AIIGRCKPUUzA+7HxPlCzam6VkihnJi+z2noBBTYOeEk8t9VfbPvpy4eWpujnyi40
         8eJ2BmcfdfoDQ5izMk9FL9no1g1RNAMIo16NCuvhvMcp7QElQ1leAI4LNYmxJdGM2XXu
         hFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769746140; x=1770350940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H+T2Zlo06xiXQn/gacLojfwLwZ7jz+x2wxOefgL6ljo=;
        b=vltmFFWX7VQP12tKfVdww/TOr0ErU55/P05Egwq8EUO8vdVk68YLbWv/w6N+8F3pud
         RuRrOOyaF2pVU7nUIqdxl+j0ImxGWd5VL+XKyKl4Xv+AfvVWoQMqXuV0KwsIuC4IbdSd
         Wd0ALDHgujygpfm9ZEp5HsgqfBzmdgnQ6LZilfyUSoiLXOT782gtlh8C1h4GTOH93SHz
         Q6Q8/0t7JaQ6zkOg+4zFDTu9haUHvubd71Ym8SisDWGSsVzETDLdlT4+SH9YC7tjW3lZ
         fEzHF/sdIYrOAQpLsPuO3f9ZOuwY1tI7NF1sM+JtYM2Cx2IWfrztfNL8s2M5YJax//UH
         YNHg==
X-Forwarded-Encrypted: i=1; AJvYcCWryw4hgoKBsdqzM09MPhAGc7xaiLqVytFzqO16Iajh4u3XaY7J6M0ORLJBKUQpuwjfaOOkJvwLbw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd56094tyH/+DFiX39qXg9AnnsNaWFtZ8TOzsbMhN7W6QVI+ia
	RbLj+szuGIRB/d6G6Gw3hHIE89gzZj8FnjcThSt+Lya7lf/kc/mMqQ1k37A4OK+B
X-Gm-Gg: AZuq6aK6PuhDskEaNzciJZzGnHisEo26v/kQEM+5LPQTLGgMKtYqPkmhaurKLtFjafy
	XgIpRz11sB7VGA78t5rLkN4VTsVtvq6GlcXS1C5VMfkoDRqAGDBVKVis7iJp4VahoV/qF+Ha8fd
	TsWJxTI+mZIeYJ7UsNpewGew93wMGrbVrGYql/DtpWrUkgtbpK56dkQrJmRufprwgov2YWJhtHP
	tF6hpaVxIx/UrHPVUyBO9RDEEBJUPMBsPsXuj1EjUuJR4nPg/K4yHSFYW8xvXTFrn+/qJgzuebx
	LRsX6cAMKWOADOoQG+FBszWygtvZWqnWv8CFlgf+YXqKHWpY7NhKGa2VtzBh7qR+ftYRdJRQhr+
	jfqaACK49BcesHcrvyUn580c8/EJcQL3aEQrrBPf5eF5F0djL4gmlIEXaeJRMfDeiAtXukSasPI
	H0y5km1BPC5w==
X-Received: by 2002:a05:693c:2b08:b0:2b0:5834:44d2 with SMTP id 5a478bee46e88-2b7c894932cmr655603eec.39.1769740049721;
        Thu, 29 Jan 2026 18:27:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7bb9ca10csm4119874eec.30.2026.01.29.18.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:29 -0800 (PST)
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
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
Subject: [PATCH net-next v4 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Fri, 30 Jan 2026 10:27:02 +0800
Message-ID: <20260130022705.1059214-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
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
index dd3c72e8363e..faa598c19bf7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -108,6 +108,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
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

