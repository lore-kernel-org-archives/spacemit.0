Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C032F7CE1
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492239; cv=none; b=OKotn3MzZV2JSBA/08gt1y0TSadc1ZXQr5GckQN4u89caUolQ3n/t2r7tpXmRGGjGi77LR/kBow65ZE5Tkw9+lr0TuwHj93feFTPEwWfZj3o8G0Zmkd23Nevd+VZiJ+BC9zZD3huDQER4fR/SWM7gnuuJQWToxTxJY00q8TC6yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492239; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emCLfl29XFr5D/58mz3JZWwymZTqD4qGC3tUR2Y1iusscRsNLvcPhYKCHWxKmDejarup7tpWSv8R08arNDB7NQntE+VHRVRu8G3QS2XM53akF2JN3soW9w47clFW6ETT3K/borqMRcYjgvE9e2iS9hGvxuLlZeLCkvEMBEuKBPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BqbE9mFq; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BqbE9mFq"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fad3400ea3so68096856d6.0
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492236; x=1752097036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=BqbE9mFqaIhjqwjhPNrvNAvpILFNlxS27By+GAsCGUvvO+QUr2kigApOie+7mFYoZJ
         VcW4fRV4eL97GvcLUP6fPqLh+fYxU0aCBXZ/eYStKiNQFMzfGV+4wSZSNxRHz9sHubBt
         QeqhxiBveHVIShIs/w4Z64LzTY5sva/bv8JqDMPlu8pJYlX1xWdwGsVEiCZNkqpkNM20
         wBYCOmb16+wGuKFS1I8H+jkGBrkeC/9CNENIXZJnGO/eRRhRBKoiCUCXquZcqnPCX5PT
         7x15N+c3EZ11U0LDjk72zlPmNDpWDMY3b21yJK8YnM7c4cLCxr6dPQScRBpoFl/uAySf
         apBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492236; x=1752097036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=DyNY+vK1lPRv+CL4C8hGAlruxTmK/aSLsqIjUBR3VrxNMP9LozJkm90VeakMVyaKTV
         zKpy+7K4p3RjQu3VgIzoJ5VfEXRbYfuIkivj4fa54w+abWM/Lc4ldHXYJmQ58gKp2TOt
         GfrkjESZ/rfYCDNX+3pkVulgi9A2k9JbFRPrJlMK5detIvKXm6N7GafEGCfWoqwODyaV
         CMOX39HwhZI2Mi1cQWUs1uiFLaQ5uPnAK9gfjZDZ+T3arvqwZKBVjLl9mEp9Bs1aez3h
         nEXUWVcMWoAx87SfLcyilCUHAvsFXOAymI/d2eRcPX2odOLdrpR4IAxtQRvI1OzEDtST
         Go6g==
X-Forwarded-Encrypted: i=1; AJvYcCWPmbk/AB0SJmVal7ipvvdIqwqFerrsdD1S9oMln+S8jNFc7nMSXlw25hKmBqYuHrgFMkVj5dZPNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8l/ui0x8JDn7ldrM6oxtW3CaUZ8X79w51JLN0tdqz8ONdsBuA
	v4ERs6KYemOaQLlTMYgUOcgC+T2ASQKy6n45mDptNVaODD9Ja4FySywlcP+Zjl7wiUw=
X-Gm-Gg: ASbGncum4a4ooLZKbLK/5B/PF+dvo0dwQx+Zsfw/ZrEjSXGdK6lFjSEaTKIIu1014k1
	Xc0+dWZEedIOPvH1HLI3ZQPJCzHmC0Uu1C6/govF1iSnS3mhJEr0YOuIthLmOeDDE7AxziK/rEy
	H0ghMgJqw7g1MZu5KKvUgY9BvnSwRB6fJqBWVxd2fRyCy9PGGERsh7Yb/dnUbXdhGRI1cAHXcyD
	14ITnwpEfodqhwltea40NUxu3/YJwOVYEAq5rd57TzEmIY+ONxZVyQiSaFY8rn1OARrV1qliPDN
	/1BZEy4JXskFwLjBqj1WewMzOsrFuy2Ydx0laqilXp8z0HS/XFNamQeNWvjcOBM2tBUYDx2qxBL
	2AUXN176/9RbrhkdVGY+ZpnqVoHrcEk+T1ck=
X-Google-Smtp-Source: AGHT+IFxV9+ZN7uJ4WMWxTezGcNNpASYTQcL8SVuNk4Fu4L3dpgWRu5GuHXUlmrOxNtWzLXL7lsjgg==
X-Received: by 2002:a05:6214:3da1:b0:6fa:c31a:af20 with SMTP id 6a1803df08f44-702b1a53271mr61275056d6.5.1751492236287;
        Wed, 02 Jul 2025 14:37:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:16 -0700 (PDT)
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
Subject: [PATCH v7 8/8] riscv: dts: spacemit: define regulator constraints
Date: Wed,  2 Jul 2025 16:36:57 -0500
Message-ID: <20250702213658.545163-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
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

