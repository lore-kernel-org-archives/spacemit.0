Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992283;
	b=UlKRyD37iViK/YuLaMJJzgAFFLfzknOWCx0/AxOdoolxgpTz8sqtojoUNnY/T+LIjfG1
	 skrayuluUrK3ev9Xs5QzFOZ8VDk2RX8cf4GdipRUnNEso5DumyWrL77jfRZgEriWd6rjM
	 VcNiEOV8+56B+vL2lCUwvmoLdCIhzqzbxmWbvb+vYwCeAJwMSXwwzDMl1spCeroKPOnx9
	 gmEZ6vMKai0yJ5+5lKyzWlG8c81cs2YNGR//QhhS6QbcfVSz16b6c9szAwlSSNWPiRupu
	 hjGPelvBDgYTWQji9zQDipRev7Gbm3RGiX/iMDgLGRN5edi0jVxP5uNJZJN5cce8flg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992283;
	h=DMARC-Filter:DKIM-Signature:Cc:From:Message-Id:X-Lms-Return-Path:
	 X-Mailer:Content-Type:To:Mime-Version:In-Reply-To:Subject:Date:
	 X-Original-From:Received:References:Content-Transfer-Encoding;
	bh=S4+nY5S4u49URlEXcMNdkTuO3X5mh5b+AFVZYGcYQ60=;
	b=E6+GIeKAbflFSVTeppLrnfnpKIgusjIqNstOsnZ1wL4sPg7ITBMiEM8XqKXox8kTEMO4
	 HJQkpu6MPfSpfHYpJxsAf9TGfEhrK7+2CudN+QSTMWiH5rGwnJ4El4eF/PpZAlBIWtVrJ
	 +2fl648V/jJQRxPN8JoW/0TZY0rVmOU7JGg/8nQ1h0RgyaRUwCDwblFRhD3vsK5sak04T
	 5nJrQ118aqpNkDdqlRA9bCLUH64f0KGXCHl+2HjWBxC+2wZE5JJHha5HQ4dSxLrcRANIo
	 awnXvKf2Jvv/bu6iAvzDGuH+0rWWgQw3D3W7xPD5YzknCsQ3hOnq747goDv3x9wS+Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=lNTTVwdl;
	arc=none smtp.remote-ip=209.127.231.54
Received: from va-2-54.ptr.blmpb.com (va-2-54.ptr.blmpb.com [209.127.231.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FE606A336
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 08:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764FE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=lNTTVwdl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992276;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=S4+nY5S4u49URlEXcMNdkTuO3X5mh5b+AFVZYGcYQ60=;
 b=lNTTVwdlBx8X0fhtS9f9tRj/W006HpT2WDGvrAE4IaSa9g1pEJWMTD50M+2rnaUFJcRY/+
 UkPZdZe0dCp7u6yFTqMN0FZ9nlCIseutsqC8lOQ8IovkssEZZU1fdUp/P3kBCLtmwaTB1G
 nhkZAqC9B9fD7mFt5Aw1gsaCyr6sst379q9frXHP/fUId9RyepZ0IlH8osRt1H9HOOwKPL
 a3AZ32LHNTxfid0tiQmrMS2uIwAcMze/0otcMUJ9kXThUn/dT+kTRdp+paqXgvqm7SdBuv
 3K4qkwReRhfbQ4ja5R2fuEA9gQjH2ZYDkAgq9bKjH+UU1fyxa15QcSqdR92wQg==
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Message-Id: <20261118085742.1817536-2-yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd6892+2f2157+lists.linux.dev+yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Subject: [PATCH 1/9] dt-bindings: bus: Add SpacemiT K3 eSPI controller
Date: Wed, 18 Nov 2026 16:57:34 +0800
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:57:53 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Content-Transfer-Encoding: 7bit

Describe the K3 eSPI controller and its peripheral memory translation
window, clocks, resets and link configuration. The EC uses this memory
window rather than the ordinary SPI transfer interface.

The controller implementation is carried as a separate prerequisite so
that the hardware vendor can review it independently.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 .../bindings/bus/spacemit,k3-espi.yaml        | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml

diff --git a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
new file mode 100644
index 000000000..30985ee0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/spacemit,k3-espi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 eSPI controller
+
+maintainers:
+  - Yixun Lan <dlan@kernel.org>
+
+description: |
+  The K3 eSPI controller connects the application processor to an embedded
+  controller. Child registers are accessed through a peripheral shared-memory
+  window, translated by ranges. The controller manages clocks, resets and
+  channel negotiation, including link recovery after an EC reboot.
+
+properties:
+  compatible:
+    const: spacemit,k3-espi
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Serial clock source
+      - description: Serial clock
+      - description: Bus clock
+
+  clock-names:
+    items:
+      - const: sclk_src
+      - const: sclk
+      - const: mclk
+
+  resets:
+    items:
+      - description: Bus reset
+      - description: Serial clock reset
+
+  pr-mem-base0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: First peripheral memory translation base.
+
+  pr-mem-base1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Second peripheral memory translation base.
+
+  operating-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Requested link clock frequency in MHz.
+    enum: [20, 25, 33, 50, 66]
+    default: 20
+
+  io-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Requested number of eSPI data lines.
+    enum: [single, dual, quad]
+    default: single
+
+  alert-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Use the shared IO1 line or the dedicated alert pin.
+    enum: [io1, pin]
+    default: io1
+
+  alert-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Electrical mode of the dedicated alert pin.
+    enum: [open-drain, push-pull]
+    default: open-drain
+
+  watchdog-timeout:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Controller watchdog counter value.
+    maximum: 65535
+    default: 65535
+
+  crc-enable:
+    type: boolean
+    description: Enable link CRC checking.
+
+  auto-gating-enable:
+    type: boolean
+    description: Enable automatic controller clock gating.
+
+  peripheral-channel-enable:
+    type: boolean
+    description: Enable the peripheral channel.
+
+  vwire-channel-enable:
+    type: boolean
+    description: Enable the virtual-wire channel.
+
+  oob-channel-enable:
+    type: boolean
+    description: Enable the out-of-band channel.
+
+  flash-channel-enable:
+    type: boolean
+    description: Enable the flash access channel.
+
+patternProperties:
+  '^ec@[0-9a-f]+$':
+    $ref: /schemas/embedded-controller/google,cros-ec.yaml#
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+
+    espi@cac8c000 {
+        compatible = "spacemit,k3-espi";
+        reg = <0xcac8c000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x84000000 0x1000>;
+        clocks = <&syscon_apmu CLK_APMU_ESPI_SCLK_SRC>,
+                 <&syscon_apmu CLK_APMU_ESPI_SCLK>,
+                 <&syscon_apmu CLK_APMU_ESPI_MCLK>;
+        clock-names = "sclk_src", "sclk", "mclk";
+        resets = <&syscon_apmu RESET_APMU_ESPI_MCLK>,
+                 <&syscon_apmu RESET_APMU_ESPI_SCLK>;
+    };

base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.43.0
