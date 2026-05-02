Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0F2D839C
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 05:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699174; cv=none; b=eVUN4RHMmxIpSZGHe19aTweZCK8D3F1sAQ11nMc286lOp42S43pFJ1JM/4e1IzK/04Q+Lo+Wlox/lFoQpKNH2OmTQD9QGnemJqxaEp+CYLclyGv41zPFy2dOzulLbM1VmD7qkDrIY0go72FlaRuYVzQUVBeQAVxX6WaCCBLU+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699174; c=relaxed/simple;
	bh=W/6cljk+sGAFN3rf3xVcfXdvrFmF7fbNtqEJTfycZ7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVlioYxouG6y6vqTPvANQ0HFgfxH4nVrQNV4GYaFj9uEICX9burusT1Ntj7ew082f8Ky6McJc/9muKL7mIznxdVLshkEKwMdzrGQGGVs2p4awBMeGIgNX5PQJkl2ofXcIQdZFa4PRJvu5/j6lyIBkKW+sGSzP/NzWZKdUlnVIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OncERAAp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OncERAAp"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so2328484b3a.0
        for <spacemit@lists.linux.dev>; Fri, 01 May 2026 22:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699172; x=1778303972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjH11zgHDCyhbF50r0nTJm8SjfZvEtgEk3MpR/mQFEY=;
        b=OncERAApCUfP4YOVpqUkT8ktHsLckg727JJUH6FPAm/UpB1qOg2GNe+GSq5N4hYNHV
         VX1HnJBdnU8XB3BVV9r+qiBtRlb6/HG9PCYblGhK9H0Q1ijHK7mw0cl8NSn3doxPXPLA
         KloYL6OTs6CA3LWWAiHXeLQcNSCr20AHsoox7galno/HRXQtI8HH8OgFTC74uoRVPuyC
         NBNb8mD/sLtsr2ejJe/+PYPzjahCI1mc+4mksA2gIH/wae0SFafe0lr4FwYcTAtCuA02
         NxpX6y2UI7XL/J5Dv/AhV0pzGI+EtrOlfSptuAtL2eEQVBcgdpULqENCaE9euqFYxzeQ
         rsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699172; x=1778303972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjH11zgHDCyhbF50r0nTJm8SjfZvEtgEk3MpR/mQFEY=;
        b=E044sscmyl1qkVtzL35FGlfzsLD5AGaQNr1wmN6tieRvqWuaxcwErn4dsy2anIrQcG
         Ae8iUKRN1vsmK/4YYp4DME6SpLbbgtmrgwKYjnMLe2UFJ5jzt96WTMK3W8YVH3I/GpSj
         +rpesg3dE07udJJHgNHHwwvEbF13Lt8f7eUqjRkvxWXkHYC2sFbPqa1uoLd7sRzhxV1N
         nPxm3ELEpOhFyaHwGyKzZ3IyHKkLwOGDtgDe3TCYoeuWCCy4sFJEne1scfD1yFNEwcJ6
         noud+bPjjRNOhn0u68MjXbB5mh5KCX4DenWIXB5wml2eynFipsgzQfOD3D/LtUqL3oyY
         nMxw==
X-Forwarded-Encrypted: i=1; AFNElJ+OPX6ryb2XhF+NijXXcSfPpFD7IzLKfViPLk4Mw4ehTvSuqxheGyd7r9sRq0n091DVpqjy79m7Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqdoL384Z2I0y/17zzxiTp6NhsAZJsCpOP8cDnJXKiVhGI5C9p
	Ezv5BAS8LYuz+aiF/UNN7/DtP9V54vsGQP7cDHdgM0xsnM26+TOxiCxl
X-Gm-Gg: AeBDieuXWtt5NPacsDA7YRQVCNdT8ArPL1ETfQg6v8VuaK3tBKBeXpFfzEGVGZL0GpW
	218LBYfk8+M7ji1Cuh/luhZFtlvRNJ9dsh7sgmuGb8va/BV9b6kaww38+ib0N5a4k+UqYoqaWE9
	KEw5tbi7t43m7JNdicCDM9rd2YcDjxcisutZUZ0N2Y5qI2xFRRMmcLufxeKdduI/YnS+CBa5o8x
	zMW6hfzBN3Teee652YxPue4S0fDAz2DqYYk8B2Yaehr8MYduh0PWM09g7WY54ZUN1vtez+lH5Lm
	Cx63rBHa0yZywiqad4cNLQr7/CKPqIm+nqWdKgKeLZ0Trn4iTdOBavnyQZ+qk7PVkwAOFK47U6L
	50pjpR1MvGsthd/Lwj+/OIC0eOXLr/jZd9Z8JCcOtM5BiGP1ITq9WIvrJliL/AaFHsXGuJZ1C4V
	Fk+mUcADQBUUHCnSIepu2Ja9oMeOqmz3HZhYF/cd1X
X-Received: by 2002:a05:6a20:be07:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3a7f016aedbmr1363896637.12.1777699172056;
        Fri, 01 May 2026 22:19:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and label
Date: Sat,  2 May 2026 10:48:55 +0530
Message-ID: <20260502051906.8160-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the USB regulator labels to align with the board schematics and
power hierarchy. This change renames the regulator to reg_5v_vbus and
its name to 5V_VBUS. Additionally, it fixes the vdd-supply references
for both the USB 2.0 and 3.0 hub nodes to ensure they correctly point
to the 5V_VBUS input source as per the board schematics.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 9727ecdd9f6b..c35f4763c800 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,9 +70,9 @@ reg_vcc_4v: regulator-vcc-4v {
 		vin-supply = <&reg_dc_in>;
 	};
 
-	regulator-usb3-vbus-5v {
+	reg_5v_vbus: regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_VBUS";
+		regulator-name = "5V_VBUS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -366,7 +366,7 @@ &usb_dwc3 {
 	hub_2_0: hub@1 {
 		compatible = "usb2109,2817";
 		reg = <0x1>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
@@ -374,7 +374,7 @@ hub_2_0: hub@1 {
 	hub_3_0: hub@2 {
 		compatible = "usb2109,817";
 		reg = <0x2>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
-- 
2.50.1

