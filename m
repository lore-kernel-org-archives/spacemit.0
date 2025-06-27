Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E322E5417
	for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034207; cv=none; b=ERgtX2qgY0eJ1LZ5EUn15dBbKFU/Amq2Uh8KU1xTg1pg7iSvu9BHkP6ce84cde0PuCu0zu71I9JCsOolxtoJ4XblLXfQ5xI43phKaZSBwzqQmY4X/7BEHKBLNgjYvHsn5gXM6/HKygW4I/Uo/NiplrtH9gPAmkWMEE1G2qKnrYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034207; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoZLogxGJxwvar8AAW7ethsV3wm32QxlVvt/nBykRJFeVhGclfbHLaWa8nQOosg7sjCcCP1Q6YuX9+V/66BZoVCjQQTOGycEVgvhpnQ+VIRavcFQgTiBMz21D+cBJVsKehXVlZEtwYeHVORYUU42e3eIouz2sq7+t+g84S++ZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1JW0m4sN; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1JW0m4sN"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3cc0017fdso226869685a.3
        for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034204; x=1751639004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=1JW0m4sNHk+g++x096cLZPnIxDWMrtO2UPB1R4Id/PJji5hrp82CYNPKkzMg1opbdk
         6DVYCWrmRCFcmsg9+JV7B32grxkQCuj5hNLzCb66nW+bsBBZ8NcSKocaJcAMauT4nI7/
         1ksvT+1njgVGgA8C9A0M3J0Ig7k099imJISqUEKXJFtyTQ/8+jB/z/vNspZj8TdhQd50
         43womqK3nyTB4jTKn3bpMy3gTZW37loXUZ1FuHNAYchzB+bVMAp+yY3ObNWpwxIYLqWp
         UCNYk4ky15lT6Y9bHYNCqJp4P/c0RCPrLrMYsd6Sr12T2MeqRxNyPqAMmGs2emLep5fO
         FXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034204; x=1751639004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=Ah0Fq5LUDoaJZv3vLaJHIMf6OG8sLFboZNeQEMaOPOt9Q+R9ie4D/YSNS6lq+zlLh0
         ++M2lOPoMhx8c+bPwDHiLks3pA114WQ8q/Ylw9JW2A21HaqNOcC+tGYgy95vAAyjAfh9
         3ikXkgT8ZR+rD6x6/FU/AJOTGjzFkHnTxVIrM2DFFNiHRGLHNNQLdquYZNGA5dKUSscV
         BXv6xcVb8NxPZ3QgGf7cacVzGBhP6eKkT960WlSTsp5gB83OHRs6bvSm6NH9JjpMapXO
         +mKWohUy+jJclTF7lLvNTQQiQ8UjQ5BnYCsnTvgZ/Oh5Se2s/TklMmxxyzB+et6bIAPL
         gSyg==
X-Forwarded-Encrypted: i=1; AJvYcCVM2ncht9MGLutFmvcfymSGGAokmjZ3rsKvZecZPtlEls8Mp5+KnVxM2BTtXgR5MwcTrku0kOZoCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw11iBpTdppZisJwupruelu6dp/1KwnT9rtjZqFAF91AF3Qukef
	hHn4YoTaHOutLYb0wsqnaRqjtQtd3iVrswG0FfiZrRzQNgqeGRjpVrNGS83BolImf8I=
X-Gm-Gg: ASbGncuuc44C814CFRhbue0y//AbenpNvu0RLUthNkQlfAvV870gAFJVzMRCaPU86+x
	hyu9ygEKqaVNumcHuHtQuEpSVo87rTzYARXeiJZDZymQiGqfkNF41AhUfC4bi3CAjTvrzglLoHu
	v4nf/VWSyUB0Rg0qLI53E9CKEaa4kdpbNNLJt19oFnp2lDOF9CpAhJRhNtW2IlY2c1YxmHPDXdK
	J0shKIk/xrQgGFaUz/gWyME8jCEHPc/rLwkBIjb3/6u9eLC6GBtzfGcMRIH0lD2F4mAIR1kPPUJ
	T/kHoT5owGH8BJW6PvFlCt6olKO1vqOxkkKAHaZ9lbU8hbzq4HDDE46/CokPm3zyZ8kCEcR83Ay
	Mu5jxCrHAJuCvZ6QGYZrCLfIoKaDpTsqrlYz8XrbG1RJPOA==
X-Google-Smtp-Source: AGHT+IEOMLIfoVtqd+xrDcmHNR6PL3WFi16wi4PjfJ1dVACxbcBTOICTcDqGxxibtiWpz5q9BS7ImA==
X-Received: by 2002:a05:620a:288c:b0:7d4:3d40:4a with SMTP id af79cd13be357-7d4439b8e6fmr452165885a.51.1751034204384;
        Fri, 27 Jun 2025 07:23:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:24 -0700 (PDT)
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
Subject: [PATCH v6 8/8] riscv: dts: spacemit: define regulator constraints
Date: Fri, 27 Jun 2025 09:23:07 -0500
Message-ID: <20250627142309.1444135-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
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

