Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949253;
	b=lojQBS/u/10ym/rZ3AY2iGq9KHHO+TJZimaXWrUXN1N516N4IdX8Pxh1+7HXpy3krj1e
	 xaGd2fE/M5SEZU/vsLT4PKUg2mL5y7+RLCBjQtRsWDFOpIkFWFjPbcHQ8fND9V+E4wyez
	 8eXCVPkyvPKr3maMevbZqNL5v+DMJ8m3WzS13lR7bfqspoOrGODFWKmoteFeACzwzC94g
	 NlW5ArqPSiDH3+M2VfooQ9dcQR2i6DPQrjbtdSBlVi7oBm+cvTSqCTAA1QExyOy7gox0j
	 5YlY0I1BOMr6LSCptEoFJ99V4+prsF6R+xTKDEBPNQ4xkMhaGHeQvagxWRk6zZyr8WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949253;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cBPXI6LEpLwntDX1+2Poix+I2lZgirJA88Apc29UVrM=;
	b=PiTRVu2KSiIuuZuo++9WzkMNcPgpK9pG753YtDhUFxeSN2IhPZ1FHBHsWn+z1/TXv4D7
	 WLMKCPGt7XzP66E/vNFWznCnlVzGcsmEsuUPldYe/Gd+zL09MmXfV3MQHcqtD5mPK/IHJ
	 Uk12XkQ/0I3bLHcP5+wI+c87kICzUPapSHHnwVsgOQAk4tjGX6KgHAl66uoGLl/w4LFBL
	 97SeFnEYWSAwmi3Mei6RJKNIXOVo2TXsmYbOxlOz/o9ElEcNiJt47lQMzRFRp6cfpztDD
	 fnNSnU7nkZOaJ80UaeW0zCmhSIVj278y80Ei2QmVGffeBqqZPDl9kIu/ckr1zVPuRRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=lT5yxuwr;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28A606A32F
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 21:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED28A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=lT5yxuwr
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 765FD20D78CF;
	Tue, 17 Nov 2026 22:00:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 4406020D556E;
	Tue, 17 Nov 2026 22:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 4406020D556E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949251;
	bh=cBPXI6LEpLwntDX1+2Poix+I2lZgirJA88Apc29UVrM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=lT5yxuwrxJSF+u0qlWNXw7HkIMVGehZzeU/Jk3cOgjdxghmXkuOTXmJHD3IZdcQcW
	 JctVOJ72lWTC99ZgGAwQ3MXz3GDK9H0Ez41d/SNfgmfaZAab7RunQZ+F1fffneuh/X
	 Fd4Y6vPGiGM++r4bOqkoTct8GTNW1nU6PBwfMpfaeEhjdn9KgKlCY9FJJH/x6Ndjnr
	 eQQgURlRdpsu6x2R57nRrokhG0tRXComZw/Fm2WfexFuIrHNuX8yjbsZIXP35Cipra
	 6edrQtRmcb1vYhrEupifRPaKitc/vuGR+/M/7JeD3pWI/V3OFicNKuClpciN5vl2cz
	 cgpV8KVFHJu6A==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id b--yicO4KfRK; Tue, 17 Nov 2026 22:00:51 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id D80D720D78CF;
	Tue, 17 Nov 2026 22:00:49 +0100 (CET)
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
Subject: [PATCH 1/6] dt-bindings: clock: spacemit: k1: Add RCPU2 PWM clocks
Date: Tue, 17 Nov 2026 21:59:46 +0100
Message-ID: <20261117205951.140146-2-frederic.mahe@cirad.fr>
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

Add IDs for the ten PWM clocks of the K1 RCPU2 system controller.

Written with help from Claude (Anthropic); reviewed and tested on hardwar=
e.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-=
bindings/clock/spacemit,k1-syscon.h
index 0f8b59d67..29d478774 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -370,6 +370,18 @@
 #define RESET_RCPU_UART0	5
 #define RESET_RCPU_HDMI_AUDIO	6
=20
+/*	RCPU2 clocks	*/
+#define CLK_RCPU2_PWM0		0
+#define CLK_RCPU2_PWM1		1
+#define CLK_RCPU2_PWM2		2
+#define CLK_RCPU2_PWM3		3
+#define CLK_RCPU2_PWM4		4
+#define CLK_RCPU2_PWM5		5
+#define CLK_RCPU2_PWM6		6
+#define CLK_RCPU2_PWM7		7
+#define CLK_RCPU2_PWM8		8
+#define CLK_RCPU2_PWM9		9
+
 /*	RCPU2 resets	*/
 #define RESET_RCPU2_PWM0	0
 #define RESET_RCPU2_PWM1	1
--=20
2.47.3

