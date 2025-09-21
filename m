Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0120422A808
	for <spacemit@lists.linux.dev>; Sun, 21 Sep 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758444830; cv=none; b=lphk0gQLoKjI3qkbSwaSZvBXwGPyalp59hLBhZCkGiR89hpzcFLB4ws5IXuOxAQC9dRfxFAAWV60zM8XQoIY+f1ouyPGeW1FFBf/jN4G7rN2GHlg7wRa5rvwAI84EFhjQtx5zWOJRujNXr4sGHMEm7ttppCAov7QEeVO1ROEftY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758444830; c=relaxed/simple;
	bh=76HDuGO/++wYQY6OBZ6UZ1PVv6SNT6/hCuPuH7hW1LM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+sxGeO3iN8dqLnxaMaxr9e9Sw2G2+CnsmpYueX4oxEy0rV2I981s2NI3+Qpa7jnfKve3kbUKaZrHc3wiBtTjXh4LF+o0eDu+kZ3XjcHF31EEycX9Mz2aE1rwxN4Au60Ym0AC81inzj9rWYm9vej7jZNn9TznAfImlbaifvePkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=u7+tXu4c; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="u7+tXu4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758444754;
	bh=2k5TB4fCGa99Tt+YiRV5hnuUcMUd7EkCwZPqTsiSIzg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=u7+tXu4cPqkBD3cSFb583le+m8GbTwndZqvucwWO/k+rlIiDrazeBizaIWge4QSmr
	 9bOuftdfE2i2b4LuCMCMo+74ugwkq0H0pLcNdBxbPcJLdt+LHwOcaZi4CyTZaeo03/
	 4u1fD00oRHz8sl78u72mLPThtOsd4MmxoWRgGvp4=
X-QQ-mid: zesmtpip2t1758444746t50d5cce6
X-QQ-Originating-IP: YTbr4bF4fXXgOVGW6cQbxzmvzTq87tzsqIC72RSrILU=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 21 Sep 2025 16:52:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11772700704362527638
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Sun, 21 Sep 2025 16:52:16 +0800
Subject: [PATCH v4 1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-k1-i2s-v4-1-4f819f50e468@linux.spacemit.com>
References: <20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com>
In-Reply-To: <20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758444738; l=2619;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=76HDuGO/++wYQY6OBZ6UZ1PVv6SNT6/hCuPuH7hW1LM=;
 b=QxEY1Pde0pS2iIBEaP61bZHv3W2NEtVTUquVa3ksdKOW3j7eXHewA82pyuP7xgj1vZmzOpUmO
 bmyd/x0pM0rC3VDgV1/aVc5LPmHJVNNOwTloG99/krigYRJqYqaXp+q
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M7sIwA0XfUNnLHXCeJgcYuL7FscV+HWro1cAEceeJbiMZjmpR/cOHlg/
	m045CJ2YMyRuv0qllbtP8frj0GsDHtXIICDkRgtZ6iiertLXWPQkkahaumdTkh9IgxfYzFO
	AHxCMQrM/Wr4BkaiRPyMx4zo2zvkgOfL1tKs6+7NqcSatZK1neun/CKEdDH4ZDtCZYrBPoC
	+QgcYLdtn22WP2nzuIcaPahGA3HhWExFULu7wiPOOTIVdhon/OxeF27e0zkjFG2JIERIrMs
	SZbTlsoNDZVuDXPdVutCHJsHodKPBnBwiKDV9MnEiXRy1BPJCK0f4epbIq48DAW2kmz/NVt
	2T4/RDkJmPLDGa2F/7qirzC5HXMcCnBbdmfcgsD7tJa2o8vsOr/bfsOCHHn1WFifQOj0lw+
	9WA8LmwzyopuouLv45AqSpcq9fgaoajAbOm2K6wx9JQPlfC6s/EHL20T5emxMjl1InmThH5
	cDx6WXIv3hqWHd/DfKmAyuTrl99bxLayAoKyLsv/BiBkpgC2x5U4VWHyuL2mdDqCSMORlvv
	VihMCaiPKUvOHheE0F+WlXdHCei7S9Av/sZb3KkfYdhDr7lX7PSfICgwlJdy8rz3wHeBde/
	QLzstgjungZLFPD3y/QNwEkxHGkPz8bPIG/MiFURdgSlFgN3U0So8afSuk+fsNFWYyM1W4b
	36rekb6WFC+GN1P0hcivSsWLPDkBvk7QgWuzuqR4XsmKMIaCPlw6UCVyPW0UlF8JF/gd0n0
	QPqRYiF7OEyG7LYfEOtDaKO8nIuFlEkcc2zsC8CwNi8tnJLAiM+vriApJlT5SZY4TmFv9te
	bwY3tITMi8rXg87F43/3hQ3jZtM7Y+eQoMvrpqAly7Inn5r08ZE3dhyjR6hq0mha5IShTvj
	xgl4iamTb7YQ2CdFZS6MkZjf0JOyknPmBiyenu2G7geyAqKDynd0C6egiuUVUti0kd5jcN9
	JUNkAVeybcUzBF37oQek4lelZhCWgpQOROzkT5sMX6Gt9olGTN+r2Nv6MZVasFtRoolixtR
	zysioHIoabakKmBzRZmacmoHsQa0uXqThwVZ6weduTm7MZZkO4kxZxyWrlBkiWVHVaf2JC4
	oAaf6cC/16ArozeHmESuwKcCbawQNcki1eyDN4SSeReWokM9a1tMJk=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Add dt-binding for the i2s driver of SpacemiT's K1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..55bd0b307d22b3611d0fefb1e925e56812848dd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/spacemit,k1-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: K1 I2S controller
+
+description:
+  The I2S bus (Inter-IC sound bus) is a serial link for digital
+  audio data transfer between devices in the system.
+
+maintainers:
+  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-i2s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for I2S sysclk
+      - description: clock for I2S bclk
+      - description: clock for I2S bus
+      - description: clock for I2S controller
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: bclk
+      - const: bus
+      - const: func
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    items:
+      - const: tx
+      - const: rx
+
+  resets:
+    maxItems: 1
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - resets
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    i2s@d4026000 {
+      compatible = "spacemit,k1-i2s";
+      reg = <0xd4026000 0x30>;
+      clocks = <&syscon_mpmu CLK_I2S_SYSCLK>,
+               <&syscon_mpmu CLK_I2S_BCLK>,
+               <&syscon_apbc CLK_SSPA0_BUS>,
+               <&syscon_apbc CLK_SSPA0>;
+      clock-names = "sysclk", "bclk", "bus", "func";
+      dmas = <&pdma0 21>, <&pdma0 22>;
+      dma-names = "tx", "rx";
+      resets = <&syscon_apbc RESET_SSPA0>;
+      #sound-dai-cells = <0>;
+    };

-- 
2.51.0

