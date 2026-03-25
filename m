Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EBF3A9DAF
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216232; cv=none; b=D6mW9LmytIcW+kuIg5ShFwxmZ/ZUjv/QTO63PJ9odQt9PubbhSSo6v6PhJ1hjDZj4jxTkZePFiSSjSkNMXGJFyHRYWAS5QFQjNb+n+RoJ31KnR7DmFMnPiVUHqBo2OU3VR+EHDVsPt7eic/ijxpOQHW/xDLFOyOi3ulCoAQ1XWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216232; c=relaxed/simple;
	bh=BMGCx5ILZcTjxAUcT3t7B0xVT8LVp+LvmlCkODVsCjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAnwEBKMMCgYm20yrgI355W3faQqSDYS84i5/82tpKf0ARaav5wMHVbw+vE8grMG+LtLF8xS5rEo1x99ds003mBiX1Xwe7RIlP5PdPh1y3MfEvpEeGnw5jyS2JdUaqfU1hr4APdzxFapp4Mx1EHLWln0NOTiSZd8ZCEVpDRcwp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekXOK4OW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekXOK4OW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so1157586a91.1
        for <spacemit@lists.linux.dev>; Fri, 03 Apr 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216230; x=1775821030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up0rOTXqSkB7yplKxiVR+mHCT5zajSVPdbYhj+cSxrI=;
        b=ekXOK4OWrxPrEL4MWVR2G3HRIz0PBKVakmOlwSLklILTsPakcv1pTG9kVIH3cSDvPT
         fHhz/cN5bwRSNxa2fsnuUgptCpvTRLqKfONlpFybqeA624bohIfzpzeS6Doh97rQZp2l
         T86WDJ+vAjzZVRmzvYENXqjiwZpXMUxe+1Ds31r3bwinvkmkp+0V1Q47PBSdj70dcz22
         L7eXw6XMO1aZBdW6Eme7dpNmufUqK9nRb8AnUVycTeUmVieOPGpLUWtSRHWGDzPPQIC2
         adAQGvEwytfm6YXz+Lr1vSaqnx2AJ49e4MCuGCs+iJ0aCOx5btQeWafexxP5j+VrbKf3
         plaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216230; x=1775821030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Up0rOTXqSkB7yplKxiVR+mHCT5zajSVPdbYhj+cSxrI=;
        b=Av+JddudsEXF/3HDsuCE/eqANGjRpUl5jSk8eagTQFD3Qf2jDWbFnW+yYVqx6wDGGi
         aTf1QIALJ5083jjzKLXBTZgiG45m/9U/Xe3iXtfOsCRqcoUt+gSCe1kalvLGi0skeF6b
         WeVUr6E++3uf4gtaAsGXLkfhev3dkhpSbE8h1aMrn2Z+lAQ55gVo8Ev1ino6oFwcfZJz
         zRgb1jGwvx+pT38EdUKt1wfo24oHkPn/oFyjftNRDLlwayKnwTanCuumfDqlOA1/4/xB
         wKPVXc/2DQmeXIJOLH+XwZ8K1JL9ZzpaZsU2YftIQkuEvZbSLV+iT9d3QjYAsJz4zthm
         zS6A==
X-Forwarded-Encrypted: i=1; AJvYcCUlNvJu7lsIXtIiAwirAkHoit/pzek/kITNrmyue2LVzDqCckkwvwYq1/LgW1KBrYDTZAWRegVuPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHWlmQW49Ji5/1RkGxbPuu595YCm5RCpzt4Qp+U9Ty/kiZvUvm
	KuP4z90n0SMxWgY2WDFJx/084+/3uEXIwnAygvTWYsTFQPdbve5vZoxg
X-Gm-Gg: AeBDieuVNuvsTaotvhhkZVNX+9YjhA50/vsg2z5vwniVHvIkZplhJGqJSCzOEjCwMdl
	buV+hIqDB3XtDv9m29UW0R2WWw2EZKZiX1JXYPpexISsyYjsVzedc7Y7KE2et4w1zvVGEWuKVvI
	kXf+7iRPq1xcFkN+RZlzAjb8F0AI07DL+zkUuYQejjNEBfx2BPlkX3oxgYINXzVopA6uu/pkktM
	8SbqdiXWKDGvu+ukWgFTycCSeZIHsuEbW+y+IL6/rHw3MS/ZsIEnU1RwZC1JaIktMcw/mzoQR2C
	IVws5hJfsdrBU/Vgha057NkxWWcbqVwnfRz3Leym9YlHpZdNaaU90c1PtkgIuH2XQ7RUlOg6iSh
	/5NdvElEDYkF107sy9tvJs61/07WKkyL/eMjYcWiCN9Orxb2o1lkOODQwr1Yc+hwPtilso830dz
	OcC9o8kA+rlDWWRy0Bpk4=
X-Received: by 2002:a17:90b:2251:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35de69acf35mr2108980a91.22.1775216229584;
        Fri, 03 Apr 2026 04:37:09 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:37:08 -0700 (PDT)
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
Subject: [PATCH linux-next v1 2/3] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and lable
Date: Wed, 25 Mar 2026 13:46:09 +0530
Message-ID: <20260325081700.1502-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325081700.1502-1-linux.amoon@gmail.com>
References: <20260325081700.1502-1-linux.amoon@gmail.com>
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
2.53.0

