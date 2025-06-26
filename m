Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54EB2EA16C
	for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947525; cv=none; b=hTvOMHyDFVidb5SWhvbfoG0ZHAabpRFx437zne+dKCDgI98WaBJgDS/Q/I9Lip+aottMWxLLXph7ixqPapkRuyqcB70eH0Xc2g9F15SKPeBagRTOoE0hkBBfeP9YUJ10el+hdQdFUvWzAlnpNNUNaKAlg4E6yLnymD55mQG75VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947525; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kszUhYqw+SVLrQRPvwvaaYH5QEkl9Ucq9c6w4M89YvdGjm1lD0v671gPR8D6XkKFHaf7F36UvbFiOfFC4Z5OKPbEnFqVA6FTgVoW2Rb/rYr9eNN9dGpyQpd9KPEa2kP7f5dRKVM2uhs7LVYcKtcNqtKoOEqaqK+WQgudx4EaVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=L1H1AbAU; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="L1H1AbAU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a3db0666f2so23589781cf.1
        for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947522; x=1751552322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=L1H1AbAUHS4L4QU255Pbe4uzGrUjscmFBHcZy1vIQ+DnpvI9a9jbssHPu5XyWM8P0H
         lbmpPPYfSXOrLJlL1cmZwx8NdspJM7UCmFL8Iw+voSi95E6nAE/ulmfHVdolhcQUYyzc
         iCyv5PBs7HYIc7/nifb9JQ6LmC4dxaxw5NtU5lfQ7B7xMPT/2CBIRzEAVEwA/J+1MDs/
         FlDeI94PpnGMQbpuCwM1bfkuWLvzElVHXmbFrFRzoYm40onlEfhMvcUFMEGaJuhdpZUR
         4oeAo6ri8OwIMORNvFyu9QetTifzj7JZY99az09nVsBb0qNBz2HYPr/T50999a1GP6Oh
         AbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947522; x=1751552322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=IiBfUu0Q5EIb4fdLxzZEfqoCJgmJqfx1SnJWmaansA/JHTxuQFRlTn7WB7zCBayH5c
         p/eyXjjFT/riVaT61CuJZiiJE8i1glo+PB3YoMXtxi3PNDs04NOLtLPlgqoUamDT95Lf
         bc63iCbHk0fycO1MJZkLcRUZfbc+ooB1Hk6Iq3wHgXM4pwK3bixBBxSkzCQiBcaUkROh
         ozWX+2whKUT6UfeYBAARHnxQfTLtvCWmAQOM33Q7p3ELY4BSR5txhwTWZ0WTvB8C+IYc
         NoexYOGdPehbf3GaURUf5SrG8sEr0VFwer/ao4AQOje5k3GXiPL8EHmhDy+Jv7JG1bnm
         mXMA==
X-Forwarded-Encrypted: i=1; AJvYcCXv8mqYjZx3lXgtXi5YbHSOtyphBTVO0eSWgLi3VesIZ8nLozwdakrNKMs4ETNu0lnm8lPb0BwfAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2wuErdjdYUQZl7CJ7yVnmP6fBusScDEl16PfVrW1J+GKKCEa+
	TCpnwf6Y59WEgplYk3610IdKLyLu6WR75QB7/btaTzhXU9SQCak53R+GNDwa/Kthy14=
X-Gm-Gg: ASbGncuRtu3dYvXriMAETLmQiunEB/vBxymkW2PQzqrIz6vDJdie4tIwAzfB6Gh/biZ
	XjGN1Q33gCyJwctAghE9yQGfEXImdOpTW1m0YBWIDg8xDofxGDBY68eHUN4EtmI7r6OXlChW8ce
	Kp4SIwlzuuOV3QuUs9aZ0ZYSrljV7oM1u/kJ+lb3S2B4Kyo75qIpRULlphge+0spczWI+kny7XK
	+HVp/8Oyfp0Zl2Af/3QjnlrfvoijVNRuR9J32U2iweyYpX96ffwEst8tBZbuin+cdmbM0DBn15S
	1qIWCokcg572VWkiDUzqI9+p9MtmIxuOFbVVttmMV9Dc/pYZC4nlJdRJpvLmAjiZhv7tWaf6SSX
	P0SRUchs3ivnJ1ntKI8eqXDLy2X5lETAMx5Y=
X-Google-Smtp-Source: AGHT+IG0Rk7kT5PaDL3EOhOatM4r51p1IXWy9NzWq0w2KHZQHF1mWKjHXAOtLVKooNvRWcbRmq/RBg==
X-Received: by 2002:a05:622a:4015:b0:476:8cad:72e0 with SMTP id d75a77b69052e-4a7c067c552mr130102131cf.15.1750947522631;
        Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/7] riscv: dts: spacemit: define regulator constraints
Date: Thu, 26 Jun 2025 09:18:26 -0500
Message-ID: <20250626141827.1140403-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.45.2

