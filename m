Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2DC30E859
	for <spacemit@lists.linux.dev>; Sun, 14 Jun 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781440098; cv=none; b=i+XhntGxDFUt1rbpcsmY9Gb4DLbj8G7zpNdmNQ1OmhuGuPXDLtyvxItJryfmP7hySfSgKNhgVk9AT14gS9w/2Qg4LTb+Vhl9sS5poWxiqfDDKweT+kjlHcDp74O3w7HDfXfsKelP5XAkgJcuubs9sVOG303EyPX0NNnB7O5khTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781440098; c=relaxed/simple;
	bh=eGTslznVqbSVlni5BnPYmJs7RZwRp/MxKLSM0euwsC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXE/yOcH6bh0TekX1VeGzOEKBi4UlZdRT3WCBKoblN0gTlB72F+8twt6DFNt95/rdn/taNjjLNsTO5ip2tu+Qq7AMpHa+G3w7F9tdVTRcYbyXGm8YABVsycCkDRbhZP6w009VMBqG0IZFhVFzRhsTqI59tjNBMtcDISpcoKKkt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt5bg2gS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt5bg2gS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4619990ca5fso43205f8f.1
        for <spacemit@lists.linux.dev>; Sun, 14 Jun 2026 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781440095; x=1782044895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXbCcd0NTps7SDVoolImrKKnLGgAu77CT/EkLadupyI=;
        b=Bt5bg2gSjsR2GtXtwcPBd+qw75w0ukwQjt/4hQOTYNSIiM2+s7xrypM21xIGtW5MeM
         w8GIZwiVB5qZPjvEu5DfOa0nFUu2EJq+bH5SbCkEOFkjalUmcicruX6H4VU7XH1yslSH
         J5gW/1mqt/7KZ3DthquSDygOqRH/VwGgLCQUSuZw4t57dbS1hYNP+Dt3wlj3SOUjRWe7
         eoopXAc7vJQL/ghOK6YuiPNSgFv9aTltgyPZkikPQrxU/c5egNIGFLk+ZCYDnYnuryZf
         vGVbDCBF0SYyjhe2+5Ctc1V02+o/3kJdxumJbnxVnS9G4DRdqUR2BI2+cYI12gNUN2bH
         ARfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781440095; x=1782044895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UXbCcd0NTps7SDVoolImrKKnLGgAu77CT/EkLadupyI=;
        b=lNnwCEyXNIzADwrfLeAijQBYwQXQoy0lGOodE8YX43OHErKMzvHNQDstMdw1Vypzk4
         73Kns50vCc4i83CD9wucw6KmjaorlSsv5jboQJM5up9fxYj/TwM/awU1UXH8+QP2nJ/l
         nZYw4YrqGMsIVxu0bs5Im7YT2VF2kpycGg9D0BvzKmG9C5yXhmxSdvmm2+abwvLwXM6Y
         /9c4ImWarHSaSCIAZYaXGKtMYw+CnRx5wIfxsHkrz48ofzp54fxBSgEY3TStkARLzEs8
         WCGZ2yRBjKfgGidqbS0/Kvn38pubo/lkN6GTZml6uPmP1rYW6JRdkJl2ZsCMfE/hF2as
         cJEw==
X-Forwarded-Encrypted: i=1; AFNElJ+/UxFlmfSo5n+F6qnle5jVsNFcjcOkWbbdhGBLN04EUoCmLa44soFMOMLSM2lAPaICgMey4fs0Gg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/v27slp94qllTfOgB5gtgrVjAaksjHwNBJAI/0ayujCK+gMzb
	Iu4tYleLaTl1kezGHaXZSKXeLoAeGCmX0Nbkh+788RorWlqmcJX+tSXF
X-Gm-Gg: Acq92OGjdHj+W/bYSl4IANm4Xkp81hmfOG8OregJ4V5aCDCUB6VIEQDudSga6jOhJ8o
	Cvh5g3ic6im3347iQkheQhkXkzlOZvMT1EDcMOwCNJBmzKLdwPyfWQNbJ2MxwnBzzL2kmq2Wgez
	YBBF3PiXH4EP9MfKDVSJoSFm2vfosJON0BTH4I7fSttu7DTKWr/Xk/tc8BvrIvHXM3OVmggDUEX
	2UgiMfFtDfz6z79sl7xXd/E4SpP6wYriOTrV56Mq+zq9PLoR5MNXC9I2CPibbQRqbLy/XBMIdHq
	LOZkk0nYLsokJgHsRjMXE8x4WeLyCNf93qjKRl0c4PGlaXKllAMySb1BUKEQG9KaDqALqs9b5K5
	LCNV1g/fI+5226OiG0EVFxoPE0vgArPlC0ms2slWgWmk14iPhYwJpgTS3lMA2HjH6W9iNeXDEoZ
	2y7GiFRmIFANfgWamxkSLgmzPniMVJqDsEm/gKzZoR/cijzra+UcZJAa8Q9nQ0/TdxzIV0
X-Received: by 2002:a05:6000:4b04:b0:460:138d:c9b3 with SMTP id ffacd0b85a97d-46074a528b0mr7750359f8f.2.1781440095104;
        Sun, 14 Jun 2026 05:28:15 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-114.net-htp.de. [89.182.129.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263923sm24756097f8f.2.2026.06.14.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:28:14 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
Date: Sun, 14 Jun 2026 14:28:11 +0200
Message-ID: <20260614122812.2287506-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CPU DVFS by including the OPP table and wiring the CPU nodes to the
CPU regulator supply.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 0d809e4ad3b1..1b425011f123 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -9,6 +9,7 @@
 
 #include "k1.dtsi"
 #include "k1-pinctrl.dtsi"
+#include "k1-opp.dtsi"
 
 / {
 	model = "SpacemiT MusePi Pro";
@@ -99,6 +100,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -178,7 +211,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

