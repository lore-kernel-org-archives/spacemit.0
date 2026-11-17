Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949260;
	b=3NclumxwHAFLY7E7lDADCFIGugTUjXeHOOQjkjUUT6enHTYORw8TR9HPVwE6AIznB0ig
	 7Pp2lPFPz9BMGwLepRIMZ6AYgX7moJzwetZvkNbD3oacXwh9ERvcxzCY1I/2Sl3zhE+1k
	 TnbPeW+e+ZKGXG/nmVr1nC7ojScXRopPmG1lWJ07AhoaTLgplP59/rTZcfXD2OkZFBggD
	 ICDSm5YcYpdFqGZzXB/qvBzwQNbIlWp8zHP/4ChcDWJ0O/EjYeDma+W3KBuLMrlcY1Bkk
	 Ccv6BOJDIqclanB25+/b3VZCS1GtwzAXeLa5NOsPWot7CrcF4P1mQngcKuTrqFlNeew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949260;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mS8VJ60KbJ7B3GE2mbAaQevEqhL/UeJY3gNnsa1WmB8=;
	b=ByPVvyjF7Z0FRnE8YYDjkPLI5IGDweW7q3iev7JPqRJ03WIIMjxb8DwzZCEiIwF0AhL8
	 eq0+AJmYHp0LRpzrkHrjINASFPGduakXwLXqArzrSn0gVcC2Aw8piIZ1ZqmFHUxM7Ph5p
	 rButjzDXUYnZEt3+Y4sFtSDNqgf0wV2h9nIbkMhv/W8qjMt3amTW1uixjMVL+wBKwXDY3
	 BpC3axBZOixamOZ9g3M0D/bB5Zp0Zne2q2T4qAJSZ8kNljLLAdg63ixDxpESMrbxOiLNr
	 Rr2QI4SsjrFlYr9vqTQjlQRNm9AH89ZjPza/Yd7ku94axpX0Rb48RNoLYTywwKyNtbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Xycq8THx;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324E606A33F
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 21:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9324E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Xycq8THx
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 3F0B120D557C;
	Tue, 17 Nov 2026 22:00:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 1E66520D4EBD;
	Tue, 17 Nov 2026 22:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 1E66520D4EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949258;
	bh=mS8VJ60KbJ7B3GE2mbAaQevEqhL/UeJY3gNnsa1WmB8=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Xycq8THxrxJ+E8r+YRoMrPY1u1DelbY1f+i0cHx5gHBoLTtBaNwD0vx4jXhugdW9m
	 gOqtmI2netarfeK7iyJvs2paMu0iW9228VN/u+bJWXrF5aH2XAXEySJcB5yZDk+1Dh
	 okVc4KpetSCj9o1CkryDDkr7wol9/pd5H6QQ8Nrj+n89PpFRAN94mUjnTG1DkwKeUJ
	 oqAR/1YoI581ye+CwJg1745MSvG5zYeF0jWKhG+RNLQlQ+nSXNCF8hKFtrXquU9Ntz
	 QxiO7qD6cGLggkxHBHq2upfV1VjSotKPM7R070aBhAinqs5jouApjB/VWE7bhKGeiu
	 H1fiy1hxzjb5g==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 7dw6BMPIIR3a; Tue, 17 Nov 2026 22:00:58 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id D75C120D557C;
	Tue, 17 Nov 2026 22:00:56 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 4/6] riscv: dts: spacemit: k1: Add RCPU2 PWM nodes
Date: Tue, 17 Nov 2026 21:59:49 +0100
Message-ID: <20261117205951.140146-5-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add the ten PWM controllers of the RCPU2 block, and make the RCPU2
system controller a clock provider for them.

Written with help from Claude (Anthropic); reviewed and tested on hardwar=
e.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 91 ++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
index 542bfc0d1..3339ff56c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -456,9 +456,100 @@ syscon_rcpu: system-controller@c0880000 {
 		syscon_rcpu2: system-controller@c0888000 {
 			compatible =3D "spacemit,k1-syscon-rcpu2";
 			reg =3D <0x0 0xc0888000 0x0 0x28>;
+			#clock-cells =3D <1>;
 			#reset-cells =3D <1>;
 		};
=20
+		rpwm0: pwm@c0888100 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888100 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM0>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM0>;
+			status =3D "disabled";
+		};
+
+		rpwm1: pwm@c0888200 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888200 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM1>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM1>;
+			status =3D "disabled";
+		};
+
+		rpwm2: pwm@c0888300 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888300 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM2>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM2>;
+			status =3D "disabled";
+		};
+
+		rpwm3: pwm@c0888400 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888400 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM3>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM3>;
+			status =3D "disabled";
+		};
+
+		rpwm4: pwm@c0888500 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888500 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM4>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM4>;
+			status =3D "disabled";
+		};
+
+		rpwm5: pwm@c0888600 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888600 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM5>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM5>;
+			status =3D "disabled";
+		};
+
+		rpwm6: pwm@c0888700 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888700 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM6>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM6>;
+			status =3D "disabled";
+		};
+
+		rpwm7: pwm@c0888800 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888800 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM7>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM7>;
+			status =3D "disabled";
+		};
+
+		rpwm8: pwm@c0888900 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888900 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM8>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM8>;
+			status =3D "disabled";
+		};
+
+		rpwm9: pwm@c0888a00 {
+			compatible =3D "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg =3D <0x0 0xc0888a00 0x0 0x10>;
+			#pwm-cells =3D <3>;
+			clocks =3D <&syscon_rcpu2 CLK_RCPU2_PWM9>;
+			resets =3D <&syscon_rcpu2 RESET_RCPU2_PWM9>;
+			status =3D "disabled";
+		};
+
 		usbphy2: phy@c0a30000 {
 			compatible =3D "spacemit,k1-usb2-phy";
 			reg =3D <0x0 0xc0a30000 0x0 0x200>;
--=20
2.47.3

