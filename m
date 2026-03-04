Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C6C38C413
	for <spacemit@lists.linux.dev>; Wed,  4 Mar 2026 08:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611679; cv=none; b=ZotnDnCrxLUSoQaxJw9oaCsSot+/eaZeCRmedWXgMX+dF7g0SHUfihWrGVzOos7FxQss68zwBTwTLIzvcxCCLsSgNGZaVcuyvmktKOfm6f/KkZFX7L7VIzR80UgEobeIfIian3Zp+WmwEvHOk9BkJgHcup0GHvgKOnu3iRvntvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611679; c=relaxed/simple;
	bh=hnJ30MhACPLAzazphFsNEYJjgsYJCLO8n/Kdkd54fAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7NnI0bUvAdFZUnjri82LxqYRkSUaQ41QZV14//HCWMs9Z0+HS8fu+4p+hvZCjXq7IVsbpT60NNfhs0RdBGEU5v8+liTAS9bzOuRFOePEoTXZsvmRBVNvzAeh7kEzzmXYZA8waoa2HVgSxKG/suhyNldRh57LmFIx5nQcxoxksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IY9e8itd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IY9e8itd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3597fea200dso2617304a91.3
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611676; x=1773216476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=IY9e8itdMoc1hlKHQ0q4cHRUIREiuu388mj9vXVBw9YbrDUamdtUj7Q4MAe9gBFYb1
         1HWX+bWo1yBjBdIASudC77ocMjGlcA0tEQbf9O3CiTYKYKgDmb//SC0008bGK5Qlxo28
         6mXTgwuS7Aqjq0RPPXCJQeifWY1sZSyku5ThbdxCMFW9iQlqIw/PBNwH+t/cnJmzrbcm
         ndznswquYXv33kiLII7mqGCv9hhHBFLict3vH7Iuey0rhw39MA0PACkSag13M1jXHSqH
         +aOmzzHuzF/eaycEzPd6ZOig4fQPNTh34i/kvpcfxhMyfnbZlezpCq7HehCdfoHGuuAD
         0BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611676; x=1773216476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=ZsxzqOVTVa9Qf0BfmvYLyZxLb9wTOi7XpmVexUwt2wm0uQn4B/1gcVpkOHHzQBGXRX
         OsO96aKjFqajAqFrptcZmBacZzZe88CLRDljbyco/9fLDLpfDQxCctW/m7NezCHlIllk
         TarMFuads+lePp7BRKvJexfzOe7DBuH0MF6/xH2iUzm+B72eWDNL49EznEJPDj4nMMXn
         pmhIT/QYZOpbT2+yfX7mDkodxbEdeWxw3VeAtWmPzNATloXc0fq7HxC1m79S79WvGg4v
         AgWMOGfCCAtFi0whROgLXibKA5R80sJFpXvzJLNSJwVT9Z7p1R/KbA9xrpe39D8dpOny
         Oa7A==
X-Forwarded-Encrypted: i=1; AJvYcCWdh+XA8m8H5KXRYbO5CxYSNQ90rDvcoofifvj3SkKzVrEG8Nbhu2lrL3XU8+FVeTzm+y56thSA6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxO4CM8Mla/qlAKbOlGImfr05lpI2aYmBk+qwY2D10b2nnPw0sa
	zamYMERUhTE+Rwk/LbfDQff6dQThOFZ5kEMulvxyz4mPN8xpmrRCeCd2
X-Gm-Gg: ATEYQzyXVMzFMlS+86LA81b9zE4yGyPqBa+TP5S6npfXCf3cuKOYCMjVT8QVrBUaWNE
	sY84iRV3/YQRtlbtFsRK25LqcLEreq9+b2OtU8Qc/+dNYLp2rzSx5Uz32qBwVKQmtjhf3IOgl9V
	x3wzRWrFDfjrOeFkR/GyDZu0tdieCCzT+2GJgr23kS0cxH8VeXZso4/kjTbHaa5JmgsbhOx9lEz
	RW/AvVCzSzB6l1uU7zifCECLmrbV/9JvFsOBHY4EvrvXfrf+T+VmxfdpEDm49cmfP1HCvpEPmxY
	qaZEVZlWV/rVQeqAsmmLF+C4TEEi6O3+2iza6bliflLPLq3sByg8I6z5aTtez5u7lQrOxMZlAOK
	Z2SczSNu6r7YDs7xurFjjDwMXBbjTpabQkLqwnv4rrHQWzIPEkm4GqemPZKRIQFFqfTxPT9PbMa
	xDCSYMCL4tOd9mItchqhz2hnY=
X-Received: by 2002:a17:90a:e70e:b0:359:8ed3:8a65 with SMTP id 98e67ed59e1d1-359a6a7e138mr1340347a91.34.1772611676045;
        Wed, 04 Mar 2026 00:07:56 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa84855esm16728289a12.34.2026.03.04.00.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:55 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v7 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Wed,  4 Mar 2026 16:07:18 +0800
Message-ID: <20260304080721.1658224-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304080721.1658224-1-inochiama@gmail.com>
References: <20260304080721.1658224-1-inochiama@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 38bc34dc4f09..98ebb6276bc6 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -109,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -656,6 +657,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..678eccf044f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,102 @@
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
+      - description: GMAC application clock
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
-- 
2.53.0

