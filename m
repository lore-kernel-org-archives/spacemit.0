Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908759;
	b=F1Rg6uhSJ9PGxc3DiJwhTQKKP4njD97fORDHYeq0s98KkW0WulU12niJnDz/dbUSWnYf
	 Mb3a7qXZdfOLPrBRrac6FOqD4kuR3S1nkuOxDvcBBqu3fbPWk2Gmphpf/DqQnnFpK1JV0
	 0jtS7+HoDu/L8+GFCVlOuJfgasvyMUs8e0mYLZygEVE6Wjvs38Md+kv2Bv/kHE7en6zjA
	 8H7yk4HZ9Z/1R226gYd4xYPcTwL73zTy18P1qu6PcHVNlWjilZK07k8BDJTEOJsoAafQQ
	 mnZ6pUro7+OYl7mWKk7s7NmbqQe+OPyA7Lps/b8Y7GnbZV3T1xtt9NlLUnxl6Clyhhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908759;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=TtZ7L+0FStK3cBA/dvaUkjGUZLnkhoPuIPbQ7OTOy9M=;
	b=M4h7unIK1rsG8nUKS6qNwlnC+GQ3SNu6XCawnktbaBePsct5hXXCTxuIxf3I1PcUvCK/
	 CtOBSwCiPWCJpLu4oOyqlPyYidqMDDQU1c83NGLQ0a4em55AKg7GMI1hpj4eNtWD9wmIp
	 Wh0FdXfVQ4MpcHQ/Z3aj84JTL4bj4yi9xSVP+KG86FuoFc3Qp55eDWhXKO48NVMaFmX2M
	 mvHI5YwHEbYnDsNlyKjyK8tlcqZ6wimfQvthCF6pK7SQPIbV7x9wgBEXBBeH7IuSOFACK
	 eKi1ueChzvZi9yfbvYQSUO6Oa4BvFkwG4uldM/6f85w0jQy7zJPe2KTw5/mYb/Dh62Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="k1Bn/xaR";
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58063606A32C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 09:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58063606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=k1Bn/xaR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908734;
	bh=TtZ7L+0FStK3cBA/dvaUkjGUZLnkhoPuIPbQ7OTOy9M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=k1Bn/xaRTFJ2+zDx7EPE0HSWCE/dPNP+Ics5HuSozZa88qavYCkwUJZZvHLf6x2v8
	 WAH2pC65QDVZxs+sTv6CtD/tGW9PT8NZhR5wPwpTJoRLiPjiz8IJSe9zi+vHE62lZ0
	 sMjZU6sdjb8cxFx9E9gXlme0M19V3EjQCtEjTaf8=
X-QQ-mid: esmtpgz13t1794908732ta39893dd
X-QQ-Originating-IP: vEm5orcdwrO02LSErlK8QvDEW+GeaBV8cJ7W7cvFR4o=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7927286612555164191
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:12 +0000
Subject: [PATCH v2 4/5] riscv: dts: spacemit: Add the K3 APB timer
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
Message-Id: <20261117-spacemit-soc-timer-v2-4-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Lakketge+7u3TGaLDJYVC3ImXbq0o9pWuFTAwlnXYmc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNR2zLG5n7p+95lLBeasi16qySo2MRsc3/nj9olfh
 00Dr1883VHKwiDGxSArpsjS/YBnW4FPlG2BQKEvzBxWJpAhDFycAjARodcM/4xmhV445D3BfWrY
 i9R9DJcC022SJFbbPQlZa7HvH2f3fxVGhqMzZTn6GY1+iiUfWpPixynwKfrO0+IQMaEsV2Y16fP
 CnAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Noy+ibaQGaj1sDIZS4pi9+QgWapHO5yHae4EOegMDT1NWGl8BhUd+oII
	t1MlzjgL8j6nhCFUQ0qFE+KYCooZQuZFvp4ybfbUUu2v7KK+83Rpie7ZvtiIGOf7RIEH/t7
	/o8Gc/lxcHF9uAbRm1pg4Da7R0dHYQHrex15u/ZPBQwegKp91ac5A40YzJL21qleY74Rwq4
	d/IZifkTIiZ2Y1xiQtV+5Ff7XyLFO4h8FTjyGTxBTVaprbIrgJb6/Jz55lQv0mRYaCICfOr
	wDEZBVfOIjzNmjq58+SvzGJ+R+dWtRspG4H4QVt/r5O5tem2S+e4njR76tw/hmH3ATbQ6p/
	gxGiUNXgDjh3PQeWTmHdkKpAudbrYwsrRbQ9LuLMR0pjUZcExIkuzoaJCvxydeUaVjbEH4a
	aoW8Hbw+esPb23bSWG0JiBubwwDESSG4DPbxu4hjvlQLsPCtOSwHpplMPmR2UE/lnIw/o1a
	3yQsTTd/G13VB1/GAHAOnjqrSp8OURhP2wme7Ua6/qphyp31WFb/yJa0clOTzAemEmj/5Za
	Vp9ruMvVSUze5ibRprbtYwP1HeNrBrPL7lVqcUyLrKJSZGW65tsixV7pR9GmVkQ1T9j0yoX
	hI2zjxcVJ55mjptD5CA9rwhWFMay1qx3wmm/iW7DsgeAkbrRhw8gXYAex8l63WOxeVLxdFC
	99wqecsYN+sIb6gQ+DbKxymi5fmrQxMFXRGz8E8QWPIUllboTCFlZaC+bo4dn29d29ICS+G
	U8HLoReY94Gj/rul/4+oUGlQUaFey7DSzJl50ISemECiESem6mZ7iKzqTDpKGXbE8rxH3jY
	j0mVK932XG/8JU/pY2OBk2dY63YARWaEeYBVz+GksBKPKWzPUpGxmi8+lUfGx/v01ntoV2F
	LQ/omcZ5KsMSWmcZMulnClie8IXdhOgb7EfvDbFOxEwKctVrOPM4jPK29U1AHq1Lj0/IuwL
	ugy1EeL677GJKeWdkhFlN5yDvMvK5JCXoiwuE4a543ZCIOdEtv7PRoRKOx0FAzh9Z7n7SFB
	7X5aM/CxOxcSOBZ0fIEIsYDCe/e8gEhHhZLrT96kMJ4V+z2SLgzjP8HrSCtNpsK0j47sc5R
	Vy8oTVMbwFJue+PufZbIM/jdky6MRP2XgkQLO8k4wsPG2qAjX6Kpy0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Describe the APB timer at 0xd4016000 and its counter 0 interrupt so it can
provide a shared clockevent. Select the oscillator-derived 1 MHz input
and connect the functional clock, bus clock and reset.

The register interface is compatible with K1, so use the K1 fallback
following the K3 compatible.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..cee313232c11 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -777,6 +777,18 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
+		timer1: timer@d4016000 {
+			compatible = "spacemit,k3-timer", "spacemit,k1-timer";
+			reg = <0x0 0xd4016000 0x0 0x100>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TIMERS1>,
+				 <&syscon_apbc CLK_APBC_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_APBC_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_APBC_TIMERS1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k3-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;

-- 
2.56.0

