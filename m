Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08E20A5E5
	for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 04:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769228999; cv=none; b=JTlvF1NPHoxVzvrLqpoLHAYCQYcs5k6WHaP0PFs9/NFkGdL9Tae8tk1ko/c+2D6rgSAq6Tu6ZNfYLGP//zDm4QWh7Pnm+To7V+2DUI0koff2niGtM0e+IPNDM7tpuif20met++Fa0uFCEAU7NRyvHq+z2Ix+MWrV9Jcijo80PeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769228999; c=relaxed/simple;
	bh=TK5ifKaeJlK8Nj0+jenANH0Qw4esuw3msNPslmL5uvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnbiEWYSzYJINQCYtkag2kO+hfnYjFGAch+8mj6U5hojTFqNYsh1SLiFwvX8K/F7sfprDhfIpjn+NeFNSteUkG8dCgG2K0jaCW4kqmj8jjDd6aK/QB29wyibQUrr7DhNrf1JI0QMR22agfnFoJxHkfddpIl9XS0q+Ca89kaj9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Wu9FrSJ8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Wu9FrSJ8"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34abc7da414so1612295a91.0
        for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 20:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228997; x=1769833797; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kHUxJVDnOE3Q1iGBfN9Iw/8AeCEWqX6h3aa/GV7h/g=;
        b=Wu9FrSJ8LFaWTu2v64Y8v7SdRf7+N89VRHFpmdayXIl4WPjPFf4HK4peRM+4NzzAik
         9YlSAIdaE4uWwtqX8KjJ3k899IpRI1TbXO2/Pb0YHSz0B0celej+knzwB8yeDJIXzPs8
         ZiNGGpQ2QdU4Yg2tM3LJ3FgDKWq5lfdxJqGDuw04Y4uc5E/b8vfXMN1Fu7B009Xj1CKu
         t60TjkvH7DmbP5h5Wj/Ns5+5t1ZNMr9NzbWPccFcu1AiimqY5jt64TYyoHqUiKwip+dH
         N6v4RNvolkigALMDNhxvOnfuZi4QJ9A+seuIXtT3UePARx3qNLaL3MTY6wJAo7FsM8X3
         kGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228997; x=1769833797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9kHUxJVDnOE3Q1iGBfN9Iw/8AeCEWqX6h3aa/GV7h/g=;
        b=krx5owagc12IWdjhzR12jqLH3u4z/dDMitmC3jwt3lwaPs4s6pXSVIEhy6cIFGw2zS
         o8+Ewo47SqovgnuxJq4+JapVaD2JMdB74j4NCDJsXb45wFu6WW2QlAFCZ4vn/NOPYR1o
         qXWUhmGp6/cqiB9v/h3vL8A9ylKRvD3hUxJHjl6JbmRcGU70nErPGipWSoqY+FSZBlbw
         KC6DxKugY4z5TEzR+3I5TLyGKWe6bOsjdKISumfY12n7JJB/B/TeXVoxRJGpPuyugX1V
         097wU+lPXPzUH6jGJjvAe6gjZgCuRE+upTvWd66SMvLpEtGf3Xxv/mOoHTnSuTRogyDO
         plOw==
X-Forwarded-Encrypted: i=1; AJvYcCUcxB6jHnxQ+VKIYhBgPO2xQ3Ql/uNsbeAaTUSCSRB7+lC2m8iK8jxwp0xMEaDUEgolxKrFNb1iKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPYf9ofExkOKaco8Js2q7ZXZijxKiWxOell1yTdm34p1+rfUkF
	F3vpEAdgx93YZD8vvmoX8KZAwvHyRnNC5mvIIoU8iX2rR2kymaaigs8mkKPff7xGSGk=
X-Gm-Gg: AZuq6aIT5NkfNyYNSrPgkXaJs8xPwsmbL9P03HICX0qULxUSHvqhxJyL9IqlyagkffR
	H/qTk30pDbrglHq1K9geNa/NveZLX12TA6wE7ufcqG60kBHL/oW8B9ASXFfwnShg/9nbLJaLJqZ
	8fNqnuJmfjG1HwVpZSpMOEl2Sjw99KS3MaG/zGPHHAkUnajz2YukavpMvOSFotuDB2Nn7xlSnsM
	jhdXTJ3O5xLOibeUCkd9mxGzgf8wZRPgsJCZ21MdB4jEEwqK4xAGHVA03LGRso5RVGa04DKvRcY
	tY/9CG4KYTS1c7x+M+2wtR4nlZVrxMh6G+6DKv9gAM+5PgTZT4T8JMpggtWyBAsfFxqO0VBii5A
	tbsL0DuhcAJ5SvouhZKPqb5SEMrr/Kzd3ZPWcyReYvWm0q4bVhkJEe0FbIAIEt3pgq7zi+Ivd6T
	I1wg2br2d7Ckt9i4HGGhCAsmspsura8v8=
X-Received: by 2002:a17:90b:4c4b:b0:341:3ea2:b625 with SMTP id 98e67ed59e1d1-353670285a6mr4633408a91.12.1769228997559;
        Fri, 23 Jan 2026 20:29:57 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:57 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 24 Jan 2026 08:20:19 +0800
Subject: [PATCH v2 4/4] riscv: dts: spacemit: Update PMIC supply properties
 for BPI-F3 and Jupiter
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-spacemit-p1-v2-4-2c86b06694ba@riscstar.com>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Update individual supply properties in pmic "spacemit,p1" node to specify
the board's power tree topology for BananaPi F3 and Milk-V Jupiter.

Previously these relationships were hardcoded in the driver; now they
are explicitly defined in the devicetree per the updated binding
document spacemit,p1.yaml.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Added the pmic supply properties for K1 Milkv Jupiter.
    Updated the commit message accordingly.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 12 ++++++++++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b3..444c3b1e6f44 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -190,7 +190,15 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
-		vin-supply = <&reg_vcc_4v>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
 
 		regulators {
 			buck1 {
@@ -221,7 +229,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 800a112d5d70..e2702a781734 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -100,7 +100,15 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
-		vin-supply = <&reg_vcc_4v>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
 
 		regulators {
 			buck1 {
@@ -131,7 +139,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;

-- 
2.43.0

