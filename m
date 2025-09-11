Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519E242938
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757569718; cv=none; b=mE5QQnqMViibTgVg0bcggcc8nPiBuBXCDMMiLjEFjIYvFUSw2+82otepOI8D+71TSFllZ1zN39b/dQVS29ODLTeynrL58o8W+GT3BjSsfie/eoscuUZzZXPJe65tsHypAiBuFKBxkVViOcc8P8qIm5xvUfP1mnELHBkw7AyFae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757569718; c=relaxed/simple;
	bh=MZyNehkEDO+xrWPj2ZXjZEeu4YgI8vPyjedZrtrtDWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMTHOuuxuHgF3uFzH+ir2PKDTq2ZqIPdKQ1DIaysbza4cYFJhuNVv32d8INHezbkDZkoPKv2Uwc7TBwrV3RGzQQqNJYqsOkH1gijk0acQ31cswr9Xz0S4sNaruGzcgdkGMkuWiRV2gsfD1b7BmiicbwEqnNyyn0dHW+nK6XWtes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=qOe+YCjW; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="qOe+YCjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1757569653;
	bh=Pd8E5nwso3tDIIp7ab7uxQOFaM7OtDLMcKjQtOfLAWA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=qOe+YCjW6Gu/yYmh6Xtw0GSxis5uAGhyY8NL2ObRXHd0v9ez48DTYfxUor9AsppIC
	 U8xh50qb4YawIjen/VJHH05bxM3mtQkFYNdKoWHfCqjWD4FZDNv02sNzpQrFyBr9iB
	 Igl9uf+tuusGssiASAWAoeoBAfPSnK4snuqW4E8I=
X-QQ-mid: esmtpsz18t1757569645tbae29400
X-QQ-Originating-IP: sDZRU4N6vZL21xBIP2dp/dXDI3uIkBybEVLTmW+dvvg=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Sep 2025 13:47:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16154328192209350849
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 11 Sep 2025 13:47:10 +0800
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-k1-i2s-v3-1-57f173732f9c@linux.spacemit.com>
References: <20250911-k1-i2s-v3-0-57f173732f9c@linux.spacemit.com>
In-Reply-To: <20250911-k1-i2s-v3-0-57f173732f9c@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757569637; l=2552;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=MZyNehkEDO+xrWPj2ZXjZEeu4YgI8vPyjedZrtrtDWs=;
 b=mGBVFiExQ0QO9T+P2Au+nmTf7TOKFhgkQB2q33d8wdm16gjBqxAViQU8m01yMF5WAg6AZEqQc
 303tdXTjQNQAxEPHGlPxDVxIdss5utvuKzTiMVT/N24cLnQ0LhOoc8z
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NejIAae1JCGv2Uw2qKkNK4F1vgULFf30skGjvAjnhy/frbtfYaA8usbr
	9gXWW4OTcclYeZ+p9ZqLt8NQaP8S6uQw+j4+p1ibT1ufExQ9Ll/vEly3e9THXaLZf6vBKu2
	qRYNCoQv5AP50aceOA3IR1xp2h09WYWJW+oSchVw8l/wic7ITengDtQQ3OanVAYGEvel97v
	GO+zx5rxiPcFJhN9YBYWXEdHRzlhAgQ/y6mBe2B2uQFioowYuFThn71PSvEEdrxkhF0zsfq
	lmuN5iZK8bIEX42y/6DTvDiv68lfdhWJiuunjDmry0JX6U1mnUviU2nqiRNByL8rPuBmzk9
	XDbrnRcfeqNDpPTaCLZVxK2TPsBfo3x42ghZkrKA76Vwetq/zT09s1BDyllMEUJ3mWctfCQ
	B9V4kTJFDRXt1rJfs5FK6yNTcFpGkxylgtNC5g8htGFiWus1QsbOlAnaa348lXccuLjRGNN
	OG1o40b1LCCd5ChYwNwIRxH6dEyAZOyfieAp0UOop+9rUETYh8AK96HiyfXhxku59HxNL2H
	LJMQ3HykuNJvnrUZTYiEYto3anOQve5uSc/L0H/ohk5fLfEl4DVZlRlXs7IGq1gDW2SrVv+
	zgmhMA4bazNjSQDK6EJcjFeNHJ80ps+Fv8HjHxV71HdxtSS6Bv7dkRKgcW77ZLstNz6IZy7
	rXPOqX/lFyL9C4kjRAyc56qyB6ZDOEBLGa0axqOFw4kuCU+Ajo1TkeBXJ15blqMVSclCj1r
	XBI8+ZrS/4G5+T/78vh1RU30zSBFozCBEvxux9AkrUaVoHdnIEAp1p7AciIVH3S9oRKEAi0
	BpfRuFXId2jD/2OspoJLW+MLwafNwXuALXd0P8qOpQJ8YmFtf4TLGTiGUPK6nPjLX7w4GV8
	wDdoKmCKXv4RrkmZfbU8I4qAbODAL4Z+6MKXmexCNtDHW1OTcHP9Wz//mHR8K+pUefyfyok
	yLM0t+zKRrK8yOxXutBM9w3WMWTpd2Y4jltGsIYW/GBkYuJOmQo3eSHAx3jte/XhzE8S14y
	VMSfkDp4TXX8msiXW5FLWDkXdqMl3Eu+zcjrAbuZNIH+rI1FcLvRBOwpXBtq083Vxy1cBAG
	ASQx5tAMI3iYhaPo1wD8pI=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Add dt-binding for the i2s driver of SpacemiT's K1 SoC.

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

