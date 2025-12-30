Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC531A55A
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107354; cv=none; b=W7flJHfAWhVLLiNT0T5W1giGbKknDho9AqeUnwc8y4jv3/igLWQCVUUoJNW3ZdHoAmxGU2p4GTdvZxMTrqLw7U0eRnv2LT7ZKBwxTTune2ncPN/lGluQ4VLmnB/BsOeiDllR/78zPuMlbhER+wVTu48mEG9kKgbKB6PPRqABR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107354; c=relaxed/simple;
	bh=Afh3am6siKW4cCqJDlIzBWE4lL+ZW45I5RRhdhsEDpo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gjgZBowReL6OJWm/P8F+lPP86uyqw8C3X3sjYp3ng2wtFzzRIZ1qHfKX78SFwyevi8OXTswobIn/eDChQXH14MY2bi4TF9JsUN/bZxxzKnfINkAIXH0nyrvT/pxAGNUdgLhBnTioxeZO5zhVYdCNkcoSJ/oTlV8ZYQ0KJGifsig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hleTwc3d; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hleTwc3d"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-803474aaa8bso3578339b3a.0
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 07:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107347; x=1767712147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQyulCdMEn71nJJi5suWbUyY4Ki6WEPbytXA1NTokyU=;
        b=hleTwc3drRGMq6s0fUPszkUAa9/8n70igXCnmnFAIEQPFJBscf9E5jTmzClwArkRRg
         XBGKM6aJSplW7Dc3Phb0fXHOoJFksc08UrDAzyT40Q5lpWHWxZ7lJ1UeFRvYaiq1LlR+
         2Yxlug4WPbLGNgvupU5WTainko4AudO23pFlEv18x3KknlBswI90p72BkrI+e/yhFBls
         gXoKlL5tffpsuX/W40/l5MPlQA+m9Af0DzUCWvYpozyuHqhioMVGYteI6FKjR7Xo4mkK
         ELMMhdRvsTR4evdjBTxT3SepLX1pnvXWHUtsGeys+rtv7VdchizC7Y2t2Ustgsx5rmGS
         qbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107347; x=1767712147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iQyulCdMEn71nJJi5suWbUyY4Ki6WEPbytXA1NTokyU=;
        b=g+WW4eKoivCZsjOpZlC1NiENBGBlXIXErEqtKSQ9crmqGa7jOVHVmdPWuMxw/simeT
         6t2j8FdBspovjSKHoKEGUao9Ce5E2dm4r3eAlrjPqVMb4eqFEphuo6COs1yTMyvHQy/G
         zRyq9y2mJQoQrOM3SQywqM9tNl1rFuV+sTiSrAKFsoSR0zfkvp4Zjq0NuG20yIZltjbt
         RZM3GbbrZ4lHXkvtoTwKuMcPRu+DKRn0P+76IMiWM6utDm0tYYqa4r6C094ggCSZoX5M
         gNyNKvS13FLMgRsIjn9u5GVz8hNDhZqS4MPgunYMs+fBQ/OpaZ6dmbmy4vgHFt/9tkob
         JI6g==
X-Forwarded-Encrypted: i=1; AJvYcCXdDzqF7F5yxCb8JsZnlnH1FTZySdEqKJ4bQtQ33gr2znxCBxC1C4ki2bLSSvO9xufa0aFixniAlw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0fsUNWZzpV48dAYIiFWgSGzSjDxnIxundV5pf5bScHGMdJfg2
	o4IIrgUKKxe6jA6eSe3AqzlFk+V99QSYnnUlJGwtiQqejfM7p010Zu8+WQk6NrlbevQ=
X-Gm-Gg: AY/fxX69LuKgRBRhuaY40SrWS26wDfIa1ai1lSsCqU5tOThsACEIv60K2PUBE67ViJ7
	zYhG/iIytjznkvhv2+9vkIuav+2m9GDZxn8iChx6tHvGG+sfJhGP7G+OWLzVuJpQwVV50cDiPvs
	3lZhyj48vIrt0gQm3HfZ2V9lwSf2Pg1jlS1bwsy90CA2oOT+ZN5DY60Me0u7isg9QPW/dq3gsml
	ALLT2FSHXfewTNjyyWm6EkNwt/QeZUu9zHPwCIfj9+MoKTkgqbbAHfKWFURopuuauVTrxPkl5Qz
	qWQ/b+15q22SixlGMnSNi0KPDCQp8baAtZ9a09Df8aEaVQvt01TjxMBciuioHeJJst/SLNt8jMA
	qhHRnIc1IOdxahGSJPVvvd8jTLkqwdLjhV41Ov5Jls0E+ggRFrFljS4fw9rkbGKqTcVeOtd5jVR
	O0oUXL
X-Google-Smtp-Source: AGHT+IF60EB1pg13UduiDmMbSYai3+Ff4fdDR7O5w/Nphtaxj7bPzVcEc8NOzQFNo0ngkbP5FlHkEw==
X-Received: by 2002:a05:6a00:3404:b0:7f6:faf4:d7e5 with SMTP id d2e1a72fcca58-7ff54beaa48mr30331057b3a.23.1767107346590;
        Tue, 30 Dec 2025 07:09:06 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f3d7sm32981085b3a.51.2025.12.30.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:09:06 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 3/3] riscv: dts: spacemit: add reset property
Date: Tue, 30 Dec 2025 23:06:53 +0800
Message-Id: <20251230150653.42097-3-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230150653.42097-1-jyc0019@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

