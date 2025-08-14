Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAAF2EB5A5
	for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161743; cv=none; b=ZA17Ps8FP5rna7j0MeQTr0KDb2ckfACfo3apV5zbs+VGzdeDV0Ky0g9h5rsrJSTVeBnAuEhMvCFa5sK7yE5C6Lf0LLlK9TXxwx0orvRTTYZHNaVuTzwlmDOVDpDoKCx0jR0oAPlo96ywRb7cfQKeqnd03wx57fhVljDhj362ZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161743; c=relaxed/simple;
	bh=4gB0KEfw0g+rxzPBSIwD5+Ui+R+cy3fzQ/z4eR/1RaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cALT4YAb0spYIi3d+Ih2KZV0zTR2FWtZDhFB0+CWRc6axdduhSV3/Jg4c6M/r4LvK0AwnkA0vKaB6SsRt+zNv0jpzf0CMa5RWnluUKhuTEsTj16wvs5hyre7CMqk4v5TnKhZrAfDnVGCnujbgMvCitIFxKi31kPyj1KDxcQYowU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=fheP8Bpv; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="fheP8Bpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755161678;
	bh=AchqVKRv3VvLwqCT88TPZ7GLSVaYSLxvru6E8YaYobA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=fheP8BpvZkJd2nKlkS1wJ594WxZkGe8ImU2Ew2qBtKntFM+OxOVveXw0Lfu+vc533
	 lBXBRfEZ1/6MsPjIVHNHinvWqWn5wK6HbsYHI8A4K2OeTKTOLasi1NO2/1qAXyCuP+
	 V/hsg1pvehTw65LvZ4GsKhbHpB00JtDewu2PfjGw=
X-QQ-mid: zesmtpsz6t1755161669td8ecbc2e
X-QQ-Originating-IP: nqY6BaQvSIAYv90RyEdlu/kBBPSt0HRQyaokU8zVgYI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Aug 2025 16:54:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6572590404047552844
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 14 Aug 2025 16:54:19 +0800
Subject: [PATCH 1/2] dt-bindings: i2s: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-k1-i2s-v1-1-c31149b29041@linux.spacemit.com>
References: <20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com>
In-Reply-To: <20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755161663; l=2560;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=4gB0KEfw0g+rxzPBSIwD5+Ui+R+cy3fzQ/z4eR/1RaQ=;
 b=xvssUWqqu9fg80WCBtkiGZP9cllnkzf7LFXQb35Da3wsm7eFSLKiFI10Q3XuPMA5JuMlMhYYK
 cAW4g6quRy6DOrCq4moFxVz+R9hWdi8os6gzlV0bvNkP1X2NTycJXy4
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MAZ8JyhHyFDiEtpR61Y9dey876XjLx+CM995VenXGug8CXeLMZJaSdnU
	0/AaVUX7v5GBjULVPeriah13Xt8AMwBFsINVs6UmB9nHoIjS8p45Ze7F0KiNpP09ImGWWc9
	Y0GNxYqic0WugIDPotHnZJE/wWPFPy4JXbixaaR8JYwEP5z4Tz+PY/IMneDE5jLbuVC7TrL
	eJsRLNdiBZjqni3ehV2tqSwgyf8NRQPSKyGjMQ+Mhf4s0iOoDkD24k9Lcj8jxTtzzZYP/x6
	fz4Du8Nnh9smVzuHgGiPMAN8Hk51HHbQnAc4W8CW5cxykwzPkF/nrUStfHnCN1AvXpQj8RC
	pT01j0rJunrtQn0W07D5p3dd4EAOQkgkPRuih+d+Aqm/tsX+AVF0WbAwg1y0/9LT7uga+G4
	/ZwZuTNlTqFqg6USzXA3LVGTBaYRVeftveuP/f1l80M7gJwj2ssgVMRqtzCl7r6L0mtN+Ec
	YWkAidGv4kirW6UedJmGkenaZ3iNv2FNSWAKv+5n+3mEWqlpMSuGzpJEI5YqXjZb3Wy4NvG
	/zNuvCOdCcKHMuh9Hw7jOoiybPHk5r5dedf/EbbMp0sQmROu9QaqsQlGIayGnOE8xd8YPVk
	ZA8ewTfZai06IF2oorJm8B42DF8txMTogqbkUs/0iMG5dPhuUSVVzFMMwZLucHVmBVe//mx
	um7JXqmK/xXURXeJwWEZYyweV0lCJLp9h9JMzQm3MykJ7v+092+te3w3AAaBhAIfotgdlsv
	cOAE5nbBYlmKmO7IbeMMGQWnezulvO5ayLQLN/zS08p4FkzfOOMZpIvXpWi8KkFzAD+rknL
	ub4IDSa4VXt6N2M5iM1AMPqHsaNi6G8DtvVosj142HywfjFREzuZx6DXA4flJi/Z83EHZ92
	RmYX8LV8qQrJEXJ3QvuYMVjTanlT9MA4mII34kodj89IZe8KXAZYgUxdATnDNZ27fWRKeZy
	8AzU9f4YAr8OAQR5wa+vvI30iquWGu1ChKyoAafIMPWzzVQd0nFzh0oyUgFCw7dHfUqKebL
	jgV8p59pXxmgAmHs2md7d0cHreMSyscY9bdXhNNz9plMjGbWcxvwZCd4aKk57r7yOm9X47C
	6LjTFCEoHsGSg11gNNnkBCB9NiGR6crxoUeQujceThKJh4X68pLKsrfiq4QpbPZ6YrTYWNu
	zZ5pVgAm8efzWLQhSYo3H+NprRohvygGW3x2
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Add dt-binding for the i2s driver of SpacemiT's K1 SoC.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7d9110638d71792db6e5bb72559f6abaf4cb59bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    oneOf:
+      - const: rx
+      - items:
+          - const: tx
+          - const: rx
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
+      dmas = <&pdma0 21 1>, <&pdma0 22 1>;
+      dma-names = "tx", "rx";
+      resets = <&syscon_apbc RESET_SSPA0>;
+      #sound-dai-cells = <0>;
+    };

-- 
2.50.1

