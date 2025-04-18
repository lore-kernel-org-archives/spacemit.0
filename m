Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA211E0DD1
	for <spacemit@lists.linux.dev>; Fri, 18 Apr 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988060; cv=none; b=JtegimoXjrA1zyf+2N4rQ4RUseESGIIf7EAoHsBsN/0nVN2WHPDMsdSIA1WnVZ1+DP13RSM1Q2WMBDT9+l5vlMXLoYvJeheC2D/LlAw37SHrnCmnh/NDASbiUE8bJx80WSNloReOrocPpLTE89oylSfYvy7C0KZCuKEHnDBtUfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988060; c=relaxed/simple;
	bh=2wkF3pIspsBICKC2HLHsuT/AUDwllqmRkvg4pojS36g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNGL+VHlCcEbZl7Em6Pyp96wjZxdtylFjGTpuD0io+Zn01dbcSv3OwbGHJuCgeJcpMNiRN5quvtF+AdqUWZFMtuATjH73tZ7+8az412/11wo2aYFWxvER38FNV5326HK2KxkIZ5BeXEhWonTvNETINqn8Ztm17LD9F4qyPZuEbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SPOAwMTW; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SPOAwMTW"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476a720e806so16511541cf.0
        for <spacemit@lists.linux.dev>; Fri, 18 Apr 2025 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988056; x=1745592856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=SPOAwMTWTNIxyUT1sGv98jN8CdxdFxPeFHtrR5we5R3Jdc2qsfKIHHRX1f60NsHPzI
         Gb/4t1qenQvg/kRN8zQE0MJNoLUywH65St1Z8+WwETgZtYPv3jlT7Cno1N0/kt3UcH3Y
         LoJSghcqkgUEi2v2J/dPwJibYOOOST9gPJslowjaP59mpvpWSitdOBKG9V8/6R6DTalJ
         A/lvHhY7rhZixN4ViZ5wFBVHTSLHEo+et3odjoqikksYd3njvLB7/Zb9RCV9BAhomi9h
         lOaEVns1JdVuKmLvt6SxhOinzBF2IVRmM8PeSpZFduyWo4gj+kTp0eqkQIKFFr6DhINA
         uosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988056; x=1745592856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=UWSBtyvCXjyAoxAVqKvgo3w1rNYHkJu592DQEKatGTq6jUxn1KIFxlZd3DTHbwHwRy
         K4vyL8Onjq1K9T7+kIWYtWrMGezfGVgLh06HqSbDxcFozg7odrsS24JYPDlviJmIXiob
         vjaG6I/9zWqm+1e3izPMIt+Auu/6xjLrMsgq9IGqM1GBbrHWlT01zLUVC/2vKV5WmPXx
         hujsWsYyxJwt1QK/IqNegu5rjniIdis8zi18imeE5fyjna+cV093D7fUa2d2PoDQk+CJ
         zrWiGVv3KtU7o1AnY6kVNXMd1UeoNxn/wOyui7jAaEQDTI9vD5zTzllw8L7QKukDkTjA
         Vvjg==
X-Forwarded-Encrypted: i=1; AJvYcCU4SRuJzusaYLA7PB2oaVhYwZFKljSoUvD24ZXlf2bXswxsMIwYyk6CVtaJOWikIlfXNeEg8So2BQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAdEbMxuuifLTzMrZ+19DBrHiFXt0rC5/sBYHllooYlf0nJ+lJ
	vZXxzkRl9oXg+WgU7DpbwnrEkQm1f4GRYTe3Ot37C+HIaY7LTSbRdjInANNB7Cg=
X-Gm-Gg: ASbGnctlCM2AUDwMVf7vdgjX+16B4U74wb2OXRfSnSNGnFx+k082vCj6uJGV5b5CQWc
	1YghR8zWwIJmoC9j1ZC68nswYSeyh5b1FIiKIwFzcg7LRZsX6ZA+/SZHjLj1i9AIbidW6S35Slg
	Canag+BWTw/FuIsdsTY81av8e2KxWTxomPzBpIkX/ht4uRxP51R5U0W2qb3O+Okfpw+LeE/XTku
	hgucHYTEeIMKXKpeKdMjyzwQysYpEG1V02VIdAiA+obvM0o7U7RPgYKAXAoKIcF/iqXyu2NTurO
	233HdOJl3Gu0Nu84SlPtbQrOf+Hy8pGUcW5qVo8Kjijn19dkibYjmkdAO0UQ6Me+rBlcVa5rFyn
	mAczGpD4JNZ1KPQ==
X-Google-Smtp-Source: AGHT+IHNVbMfjIlfo9PHEWLdLnnlwobHS10wrAnQS7/2BfmnC2z46vdeRRFOkin5pnaA1y6blfUwPA==
X-Received: by 2002:ac8:5fc6:0:b0:479:be67:3bd2 with SMTP id d75a77b69052e-47aec3cb8f4mr50692481cf.23.1744988055824;
        Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 18 Apr 2025 09:53:59 -0500
Message-ID: <20250418145401.2603648-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b..491ab891788b8 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -514,6 +526,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

