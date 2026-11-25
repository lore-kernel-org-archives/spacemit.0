Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570738;
	b=S2RSfJBgWzobLPsFmip5ijAV+1ZhV0opHrvEA/3m/rBcD3ZGkXTZVR61oOoQeyrzxEtY
	 lDc3KBmAL1PLLPVFe//ZJg9epPDK4LFdtEjYTo8fnuzbnjvlRjnozSGO4/3wH8wlayAtF
	 xkztWplKuP7qgIycnxkjz3T/xaGz0LyriOKeLW532RrLd5mWhU2/f8bygOUhKkn76HMve
	 hnApT53QUs0+EKHSaUds8wlSpv5VwtxrHW8PgwU1yO+G+Ea2gJvkFQNp5kNaTObMQP0e9
	 wMINCllV2ZiRP9++M02LycDBoMRzajcL935nU83kNAZ7zO3VMWZVJFF8AzoqM30SF0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570738;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=5FN8m7PE/nm8LadW/EpmCHNTSgvk1Y0b2hsF8AG+DuU=;
	b=4EzjKll1XcwO0ee4UJKVBJKF1Chb1gJK67filD9FmUER7WJ36bqjjrxJlbqApYMZFoUP
	 yRwt2iNaqbyhoh2Knd5fR8U/7qyI0UX/do7iOJbdFxfqKENW7uJ7sn4Kf5Vg/0u9BGdCo
	 0x8P+ZIYuqJr7+APyreUrKt3ZjFMrv5Z4YG+FbQQ8IKJvvg3ydTmco4d4xU0E7L+H4M7c
	 NG9EjyBUdciOVnLuu9ZDWCp3Rs6gFYT3U3bm6Y+xW67k3tfwbwHWaraGOLrKJfQI000WR
	 zOwXA/3yn4b2GL4rdML8CLqIZ6/NEJ9G2G0FkuIkvk+TA9XRpiDc2wGzH7rW6z586zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="HO/nv7kU";
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F556606A335
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 01:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F556606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=HO/nv7kU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570719;
	bh=5FN8m7PE/nm8LadW/EpmCHNTSgvk1Y0b2hsF8AG+DuU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=HO/nv7kUcuOj7xtV3DkQyU0zVwublzXg/qXr4Gi3ousfRddqwJn5QS9G/myX517P2
	 dhfXZW4658GvuBqh1lB2GLRwgrYdY7x2hfo3wtqHoXVFY0zVk8cel1QZSlMjHKMw/5
	 t0l0/6Cxr2WuSewVX4vRvx8dQJLOlAbzKU5jZY/8=
X-QQ-mid: esmtpsz19t1795570717t0832536d
X-QQ-Originating-IP: G2lbJzosbw7PNVaRZUJ76xE9em2WMqpBtM/JQ8J8JzE=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13276682170173551916
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 25 Nov 2026 01:38:20 +0000
Subject: [PATCH v3 1/5] dt-bindings: timer: Add SpacemiT K1 timer
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
Message-Id: <20261125-spacemit-soc-timer-v3-1-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
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
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqIy38Q6o97PaXhybLdUQtbLdq8ZPekumt+00iLOO
 DEH2ql0lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATKTrJiPDweVX0yc/CXiesW/a
 W/apW63VDr9p4mRuDm65LNDA8PGZHCPDtUWXN8yyDf23fPme6z5TDXfofbqSyTbpVd7vE626X5n
 P8gMA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OG3x6VvIxJM5LdQGB9pjaKV99f1J9HauilPBEbbS0YZIoHM8NCJpJrDu
	+O91+TY6l/UBZ5RdnQp1pmQMwR30qniwYZ3AuHCQEGJCfA1Lk55rkk5Ow3wwYHwVM4QZ13s
	ZIhNihUu6cw+yfDunrlh3HKhOd2ZkFR481GUGYq1RcIjuuuXWA15Ev9tjRpfFISruf4zBqG
	RHuKbV+fReHietGkKT4d6fAfQSMu3D4IWPhZi9MQFR0UKKcrxkTpSBrn1NnM0miSF8BtQz3
	VmXNC1AgYSuH76+dBdRWnmvNCtU0KTEkvHqvr0YiM6SFrLormo0v3JjULxgfuM0bb8ysBEW
	wxrU/jLTTGnPMaD1UsOgMFZJyvzjaPTFbphcOzWn/JBzvXOUB77lEhJNUfffvp6uKBJ/W03
	kS4UZ8XXzuD6Sjrih4bSzbSbz3njoimeF/hi+WlajFdaVPAG02RJmr8l2NimPCc0QvJUyhi
	oUfwQWTMv9U4V4xkPb7DpA2FJrK+6ENFj7eZcbfmy/G0ZnxYtSN4R6m4mNorCfQ/PlvxB/9
	+ToLqjRcH1Y/JXdwDBxqChNUX/lkoa7xvtUZBYyff489AHY2rbBWFSZvSlJclnfeSnnSEN1
	1GjwcTzsnTJoo6M4JItbnaoZE073H0sHNJel2VYrivdy0RR7HB+MzX7aVATQglJjSkc1Xp6
	bCqMBWU34j1zY/FWzXLIqYE9IRS78FC+igUUIL+s4IZIjyIprrKbikAWt/HspT1h7OKvJmv
	ZU62pvn+nh5Fk8jEdCifMVolM6kcL0OCq5XDdN8PX9B9wBal/sHwJ2cyLgyh3g5MlzzzKNu
	9aDQ89uMBkkBiWzXpmREuFIPuhQEMo0B9I/398iAUzjm740OqoKHMGtYamTyV9bIztCMdn6
	JOUWD+KmST9MK3e6IQlMGrbQYez8fIF+yK5a1UV5h7dwI4QlDA05oNNv2WL0KsToThtIFld
	TlKelprn3X5H+p2IR0LwSLXT9+wUfQWHFe5gC5aAUwhLt+yi+m5JrlVd+GuhJ6GJT5TdiKS
	4kIEYufIiivJTEgytQM0SedG+rkP362altA2HZIA/GAiXyC1YB6PxB1Oc/ARyBvA0SU6Caz
	pXPB8f3riSKaZc31tAY7o6Q7s9NHakJ+g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
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

