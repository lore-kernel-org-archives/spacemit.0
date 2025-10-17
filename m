Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F26C212574
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760671076; cv=none; b=h79YIsf0beqOi9x5/8E249fvjJeWZGipFM9iqALILOI3ofkFFJxTBpKw9Hr5nK8B2ZIP93KhllOtPVES2ikfFVwMIVijxRBlqmqUBlfy7C9W4NTxMU/iLQdOQ/odlkHGuYY1+og+ou+PKRajJsnyuVxdVa2f8cXXRnyj6HloEOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760671076; c=relaxed/simple;
	bh=76HDuGO/++wYQY6OBZ6UZ1PVv6SNT6/hCuPuH7hW1LM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BENL7GC7GS7GBE19CyQVvErFC60dbdL79FQ5Y4+bKAWWs7wof8e2Zh82qgd4pH1c9YOiSbdxIMV7oNP4jY5AE8b+fFkHirjUWnUO9A9SE3q0y6edO+Xq5BZz8XQFtg+b/+1YLnEBWG9hZToYUix56z6d6PxItIuW9+z3jomzHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=q2HooZ0G; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="q2HooZ0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760670997;
	bh=2k5TB4fCGa99Tt+YiRV5hnuUcMUd7EkCwZPqTsiSIzg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=q2HooZ0GbF3nGIOSI/u7cKU0hqRjPlRV4wJ9AhepMSah6F8FY0tgobvhSudGKLQ2w
	 j1OrYod6VVKzlMJbm7awbR2yDT5aLN5w2YRbzKJs2t003+wrBpoWSdEPUlU57/Ox2S
	 NJdpp4OkeCPpGGqjPetCH1SwgNIMQer6fBNtTzCU=
X-QQ-mid: esmtpsz17t1760670989t67f1a881
X-QQ-Originating-IP: bNF06A/ELp2eIpzH8vwQ9twel8f+wOMr8u4xsk3Tm/0=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Oct 2025 11:16:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16559823875224781238
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 17 Oct 2025 11:16:17 +0800
Subject: [PATCH v5 1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-k1-i2s-v5-1-401ae3775fcd@linux.spacemit.com>
References: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
In-Reply-To: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760670980; l=2619;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=76HDuGO/++wYQY6OBZ6UZ1PVv6SNT6/hCuPuH7hW1LM=;
 b=v0rNyuCf2QOTXtFsX8Swg2RRC4XPK6XUoOaIx9wMTk/my8Yyth3WBX42qzb0jm0IB3sJI9Hll
 fsuGXSOlz9QCs77zZKuI4+e5dmhGH60vN2YraVUyRTSzzTfIQSiETwc
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NFN0Qhrj1+QE6/KqMi5E2+LGcrYWxUKz7H9r75ISVVBYbldtkiZ2+tsb
	G7fBij85LgyPgXQi67GHJ19eeLcoPH0eamwM3FnfQQEtmn2ReUd1K5O6+EwkTOkJfl5ZpH5
	OD8KIzhQ0JS98uOcviNr69YuiUIWK9trfXaj30spjF2kEVltQV7SrXMR2zph/cItpADFGpj
	MIfo78BDZWIOM1u6Snr/KKcJOtWRyYOf0LeIxoi0tITZ2pyME4N52EwNrN9IpIA9vyqKTX9
	Kqcgj3eCCzLN0qE+kF+As9pjIky16qDLN0/ElbSxanTjkcuOPrrZOkEsoTMT2DUsxjyM2zh
	WCYXANvXXjXXmPS50qRdKMHYWPxOcqv0zT4vNcZ6bBsMRO3qXZimY/3Nx/YBGw4Mt4qYCuA
	qssmvdXBzvCfhKIfO64WKX8nf1OcONVaccTp5v4Elz8qBmgROjDaBMJChE2vS0L4uyAp172
	lOHMEq7K2Kq/POqrh7Qlgu9wyMd1UXv1uODQWg6iNV7qQmrDoJGh8vdpyyELdqA3gUaXt7x
	wdzVOF+8+XgUffeqwjf04b1lHcpsj6x6IneYzw/lcPnxl418IRwVLouIVpfEJbS8FfcR+f4
	GQ3G31uOwKhERBfZjj37dauDffzbsDAZl3lYmr8YSYObqR/Y12HZddQDzpO1lFQPM3QGejw
	g82c/0KEKhQaOVcxeB6w2L6uPvKwd/VjMML6+BippBAerZ864zqd4f6wxMY9PZRdqhZ36uT
	9tySvi5sT9X77757vUlAP2NSBBxa6NTRtvngrIisvC0IKTOJ+OCGoIHmxAkQ+mu2PNA0U4e
	YCY7JiGoUNpb8jhsxD7tX7dK25U13PuMnhI+v8PfslNeEQQ4tq9/0zmuUOrmQoPRdAYGfXC
	MPsueZGdTfVA+KnY9pftsOLhxkhgYYYGdB52wOtFye/9cZdyW2PpBUPLcIY/h+LEnbrZV9/
	HvhyK0ZvVQS1lnRxb/y6JGFNRzwLWI7sxMF971oKgnI+6GfvSFC/bsaD/R+ZQHsDEHo730E
	LlQj0PF8aEwGx8MjrFWvI1xZVtKHKhojehQptwATP31LZc04vh68JDS0Ng+2MApluT5/Z2I
	0z40mUhy3lMzhRSUaXrvGJ65Qgcl1/B8I4e4Hy3HOvhwLNDaGYBLCSHMink1It3x6FrSQGU
	MegM
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

