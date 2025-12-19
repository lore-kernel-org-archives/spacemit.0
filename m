Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14D2DBF47
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130175; cv=none; b=hQsHQV8iyo4NxZcJfAA6XY5XPBYdDYeXKGHF/PJWLztAp5DUBKKAu7IS0nRjuaLiZTZYkoBo6GLMuyQqv6mp9oOlTE2p4Z7VwHtgf29u1ItV/NdXXcGktEPNRbm0dlGMraSe9VBSpk7YDtwExwOPzYIws+LLz/36S4OMWY9PdwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130175; c=relaxed/simple;
	bh=G72T+WZDY27E2UhxRAm4MPRhTxWqCOs6OHY4x2Qdsqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mho6TOSxShTppb37l6bLlUg9SsebpCCZsPbjNtdEv7bwZo2oH1X8xjly/h9TwpmsDlaICcTKfzzGRtVjDpxQUYUCumrNasAZiSpZrKvCeQ5yrHC8+rl4QVOuY16g0QvOtgtpoYKhX2Ho/LX0crrOpqZB9uo2L69D7X4YoIf1dDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+4xtkjP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+4xtkjP"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1244569b3a.0
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 23:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130173; x=1766734973; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGEKEdhZlzAvNRxCMFTpppZuD5Cxzoe0sAFMX5gPBGU=;
        b=M+4xtkjPH/tY+wvfEsRyhNAR8sChpWTuksB320MZkEV9MCZzwddfkLiugoA+7X/bH9
         p3FzzLAy1ixfWm2WCHKc5hsefWlnL4rUdeQyC3/vB9GbBThS0DFXj+l+px7G0j+TkCiQ
         ZPjP1/yO6TE87POAncE9JP4YTvXWmbZllcva1KpMPTBkCu4oAL3XhOGWLZsEoTYnBs+t
         tZ/68rs9Ek0++Zo/90tz8XH6BTD3sBMpB5FcAY/9Yv3AQfiUtuIGuc6E8Fr5N6xp3M1v
         T9GBsgIS6eaWveNq6w77qtRal8Dw1gIu02QBDIUbeh+RJgJiUkoHqvWtxV5Q6fc5mtZV
         hPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130173; x=1766734973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGEKEdhZlzAvNRxCMFTpppZuD5Cxzoe0sAFMX5gPBGU=;
        b=QEGWRKaPV8FEDttcG1DlXG7fyFfdHV+/oKLcj/wZnWKpTfKHsPvZHT6eei46WUkxRC
         V4UxviXFe6RoFDbqQpQkRnXis9dElvRvhQ1nGwBCscxHBHjCjXRfXC4PY6Fok2Ermmvn
         eXvGPOY4rGURHyyxHu/mQ+lh5Vcxu4MDIJqztXvTrH/AEJOZx8SM2sj6EEoQvrB0hsV9
         hrNSMoFxqwciKnJJULiM03WK4PAGlwy76GURMgDYwT/sZ0dtCkqhL7LRXcyEoyFXs1lY
         xcF0PmX1uIsm6QjMBasw+qrw+6Lv9vGpKTNqW+yCLHnTIs9LQu1Pf7fgkkneVmNI9ovi
         93qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLm0ANPODI+aowTFQpiMTre/kpA7t+0KrV5FrDYqK1qRHwONk/g8Kb+rV5OR7QHZ7pvPyxuAxNiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrWbOebEMIuwn31ywOmOJoDr9BpJeFYzUnTNCD47ZOfFcbmz5e
	F+FnMYL5UAJM67Vmpe6fHIkkMqTxjzByhLunJl01ORMsGE3fkTIckg8C
X-Gm-Gg: AY/fxX7LnoD4OFCsbDw6AmJ1PJQ9Ilu02K9sjg7ejvo5I+YEMNI46eWYYo8yMdAi20V
	6C4lkgHsLVPN2QlTPdUFtu2h00zJ1B5Hb9h90JkKDISffXyDUt4JfKuHRCFI3el/PpgL3ThRN9B
	QLOfdXfkXHCTLrNZbmk0hPT6+xnU261GWBDpV4En6GI1AfAYHb2BwSliNXBgwAcaEKsnsiKuubM
	RdkhIOece8hmUkXsuoWRGf7vYB+FGF4/YtHvAtp+Mhhym07+RNeeEz+k1VkyQ7H41fvpRBd1ab3
	0FBSbGLVm7Tjhf0WuBAfyAl5Vf/iT09SyxeuxVRPB3AqWLNW+eR/qPVa1idPClGrhgHY9KLO5Gn
	VHBGvS1EwMRz58lLTHUrsTLMW1ghBl7mRKHclfb2MlpgqHva8FmIi
X-Google-Smtp-Source: AGHT+IEOHBbwLfzOsV5D+3VGSzAKq+pDw6xwaXIZis6jWHwmpPR8IDpm4tyhNORstF0bxJlGHlff0w==
X-Received: by 2002:a05:6a00:600e:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-7ff66d5fca3mr1889071b3a.37.1766130172539;
        Thu, 18 Dec 2025 23:42:52 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm1490499b3a.50.2025.12.18.23.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:52 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:22 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: add reset property
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-i2c-reset-v2-3-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=2324;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=G72T+WZDY27E2UhxRAm4MPRhTxWqCOs6OHY4x2Qdsqw=;
 b=HD0df5Haj/AFbxGbKco41n1PvKa6CLMqswLAGzmIzGdRjAEs0GfnJLJj92IFCCKm3Vernga+E
 iBGpVisLTtKBV2nM7Bgx3FZe9xadiIx0GzOForjakC0eN69GVHirVw5
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add resets property to K1 I2C node.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6..085987643638 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -367,6 +367,7 @@ i2c0: i2c@d4010800 {
 				 <&syscon_apbc CLK_TWSI0_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI0>;
 			interrupts = <36>;
 			status = "disabled";
 		};
@@ -380,6 +381,7 @@ i2c1: i2c@d4011000 {
 				 <&syscon_apbc CLK_TWSI1_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI1>;
 			interrupts = <37>;
 			status = "disabled";
 		};
@@ -393,6 +395,7 @@ i2c2: i2c@d4012000 {
 				 <&syscon_apbc CLK_TWSI2_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI2>;
 			interrupts = <38>;
 			status = "disabled";
 		};
@@ -406,6 +409,7 @@ i2c4: i2c@d4012800 {
 				 <&syscon_apbc CLK_TWSI4_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI4>;
 			interrupts = <40>;
 			status = "disabled";
 		};
@@ -419,6 +423,7 @@ i2c5: i2c@d4013800 {
 				 <&syscon_apbc CLK_TWSI5_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI5>;
 			interrupts = <41>;
 			status = "disabled";
 		};
@@ -443,6 +448,7 @@ i2c6: i2c@d4018800 {
 				 <&syscon_apbc CLK_TWSI6_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI6>;
 			interrupts = <70>;
 			status = "disabled";
 		};
@@ -546,6 +552,7 @@ i2c7: i2c@d401d000 {
 				 <&syscon_apbc CLK_TWSI7_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI7>;
 			interrupts = <18>;
 			status = "disabled";
 		};
@@ -559,6 +566,7 @@ i2c8: i2c@d401d800 {
 				 <&syscon_apbc CLK_TWSI8_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI8>;
 			interrupts = <19>;
 			status = "disabled";
 		};

-- 
2.25.1

