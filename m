Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695067;
	b=fjslrX+QfeOaXDmIRlhHKe8cOxwyvALFHtxZnFuCG5E9MCR+GqzseJ7bjOjddZAUKEg+
	 ugaQ0eLfs9QdomlH8XIWlRzShqcSpRNQr7OlDT9zvuNGlBFJ8gipeTIE/PA7UJCKsPWo/
	 dGxvYnllc2E4lPq8bxXd9WVvdXJjHHMw9CVw8KosE27vnuzYpHihZZfIz5lgLW11cVFcx
	 pwCTpJUA6o98mAiDgq24/Uxpii5XdmTsYyfjc891PZ/hQDfmMYWuvpFkAqGljIYjCpZEq
	 yub+5PV0dw4laWpKSk9Eob3dDIIwtYggl+qcSlkoMLBeDqJ5bOjJpQjFVReMRjioLaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695067;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=5FN8m7PE/nm8LadW/EpmCHNTSgvk1Y0b2hsF8AG+DuU=;
	b=bUCN0Fntr5uh9Sz9a39EhYZcAmGo5MgcGYSQlxV6BHuPCi2nGhwhgjemmTq1i+uIqLeF
	 bKLFxD8kOgijFyFFY1UVQcwAw0qdjQgatp8w8FMleqiGkRkcdhizGG6GFHcEVXk5JAZnT
	 5SN5Irmljc16b+Sq4PxhM5u5/tZ7lRRW96bmfjbBDWC30J+MeuZ54Y+EYR5xQ1dTwWqLH
	 ZGMEJc7oqX0yZGYfckHQSNmkszteWi7T+h3AppQQSd7y0dr4ZUhu3y/2xfj6cgIUa/BVR
	 h/UhyI2jY4msFLzewRc6FE4jcl4ea8ZLfjYmllGiWlKAt2G+Vxhk7gnt5M+wqegyC+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=S2X8k+eM;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB97606A947
	for <spacemit@lists.linux.dev>; Tue,  3 Nov 2026 08:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB97606A947
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=S2X8k+eM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793695025;
	bh=5FN8m7PE/nm8LadW/EpmCHNTSgvk1Y0b2hsF8AG+DuU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=S2X8k+eMvetVoh91gknxaeBnzSseEYb8/5qQlLoFs+YOx2VeUyTgEyTM4wcBg9UqU
	 SveMYyc3p0PGnt4++LLbqBkWHAAL3Yj3AzvXbTOtrTssUW13CtUIuMnKzx8r9F2TEn
	 LrlDcks8Kh0upp9xXd+gSEOrh4Xbs3viwFQvNXNI=
X-QQ-mid: esmtpgz15t1793695023tc41014d1
X-QQ-Originating-IP: jI9c/45z34vZJ/XfyY1oeHzOv3EIn1UV4330Y0mJHdU=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 16:37:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6635203195531731142
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 03 Nov 2026 08:36:46 +0000
Subject: [PATCH 1/5] dt-bindings: timer: Add SpacemiT K1 timer
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-spacemit-soc-timer-v1-1-36722421db6e@linux.spacemit.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=YTzIYqz5yG8XkouJ9NazRxZn63OsQlQGGOsumRdwLmQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkv5ypxzD163Ou2RS3TDdUZFbERR3fef+I2eeY8pqM7H
 xxwXpz2sKOUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAivZ0Mf+XP9ATs+SOUkmOw
 e9XH/f01SlUtK+z2KcssUP+yrjFzphxQhXoCv3KHwiW50Az7HcsF1Dc+4zZhX8d3/BjX5DdBZ1U
 5AA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mt8u4lqhpR4HFl4RM5aoYYUnpttwMECiFCyfKBAivRjKDXEO4X4R4qjj
	I9OHihMfknnYVjC2BMRuomptEyq+uE3zB1+Kk/9mdAv6KlREwGu26Q1FNDVedUz8bZynu7O
	/nnNIA9wE7xNjQ+O8uaNmQ/YmDSl54N+UythOcnhW04cz3884cx/uIpWW9RE/ZhiGgBnnQp
	vd4TPqby4DOiQ1RG9TTse8PWbNGGgO2//V2p6gAxdxoh5BmY6+IqddK3rAsWSEHJIZdfqrd
	s/uikyJgz1B64aUGZwJrDnXg9LyKduN3OaXGWk6X5wn1vurx2cvQH64OaxN8yETRnc4Hi04
	1bkzAmDdUOeyVHVa6YLxUw8t6t1PjldIDQUZGmwquy7t9wPmu3/MFDWTeegjnB7Tr2x4w7O
	gwS7gURxXU1d1kXhORBVJd8TTuVBcZejkTLDeZrH2yUaPkdCJRBMtsvVhQO+9C5gN4Vjq5J
	9qW+jF6X+vXVVNzmxGKp19NWOn+xw5d/ZSbpG69vMlwx4j7LQpCtVD1itoQxfnH4rkHc2ei
	ZR/DY7p8TB14AqsxOnra0f/nXavfaA6RKTgMBrbK2t77kEguXbGI4OfDn9LX05cpnDV+DgE
	dw0mQICUcMNF1W1mMB73dyH+KwXt465haGRd2h95v7cNj0JPBAwxrKfj1pFPFviMFnn4mQJ
	aVL8a/vKk9bZzXpclatwIuS77y+1929XolS3FrUuRK3ZCgrO4FsZlz58lKZ3FpiCouUuGbk
	6pTuir+FwcWafz9wQwsqW8CCIEqTCRC0PppM+Xpih6XxPLtI44WykvqBqcnJtyd3/2YWIKl
	og/Pidq+tIXz87Z3cWo7OFtqAajAB9ebeaIwW0w1DpDeFjPNprrluKuWeih9bzxfhpgRSoX
	6YhL8GXK2WHxld40wtcuA1FE++9a4W+9R2Tz89qsa+DAHEQ0deirJ6l38hKbNUZ4P4MMC81
	I6CXyntjMrkNmkvBV/d9sKjixRun1k7UUijF4Uug4iCe5erpB7LiUq4ZFQ8d7jQnWwMGK7r
	cfZFVAMy/ecRynoiYfQ4J8TkFVYXNjdThmQddMTJxqC2X7d4RZH/zKxJ24PiEeL+RpzdBHe
	+t2NnDC4G+/TgSOHSP9VK4asNFrcKm0BO7n6Y/0VTG7V6RrGNPugi7falIx81W2kbjV1v4v
	P3F/wfTAPPdV/S+g8t+9GPjbNQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

The SpacemiT timer block provides three 32-bit counters, each with three
match comparators and an interrupt output. Describe its register range,
interrupts, functional and bus clocks, and reset.

K3 uses the same register interface, so describe its timer with a
SoC-specific compatible followed by the K1 fallback.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../bindings/timer/spacemit,k1-timer.yaml          | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml b/Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
new file mode 100644
index 000000000000..b71785b8aa94
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/spacemit,k1-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 timer
+
+maintainers:
+  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
+
+description:
+  The timer block contains three 32-bit up counters, each with three match
+  comparators and an interrupt output. Each counter can use the functional
+  clock or the internal 32.768 kHz clock and supports free-running and
+  periodic operation.
+
+properties:
+  compatible:
+    oneOf:
+      - const: spacemit,k1-timer
+      - items:
+          - const: spacemit,k3-timer
+          - const: spacemit,k1-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Counter 0 interrupt
+      - description: Counter 1 interrupt
+      - description: Counter 2 interrupt
+
+  clocks:
+    items:
+      - description: Functional clock
+      - description: APB bus clock
+
+  clock-names:
+    items:
+      - const: func
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+    timer@d4014000 {
+        compatible = "spacemit,k1-timer";
+        reg = <0xd4014000 0x100>;
+        interrupts = <23>;
+        clocks = <&syscon_apbc CLK_TIMERS1>,
+                 <&syscon_apbc CLK_TIMERS1_BUS>;
+        clock-names = "func", "bus";
+        resets = <&syscon_apbc RESET_TIMERS1>;
+    };

-- 
2.56.0

