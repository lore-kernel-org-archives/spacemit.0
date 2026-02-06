Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6A26A0C7
	for <spacemit@lists.linux.dev>; Fri,  6 Feb 2026 02:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770345160; cv=none; b=XaSSdwgr/ooWt8udPQ7E+8OL38uBMXel2TCRQrzwjsXY3WwUJdyUeQtHxg5GRiH5z1ut4s3XuReT+cpTPX/zqsrz1FpxpPDL3/9zaGQVdBj+4NGg1WC2odildk/9VPnQT5aBBeGiOFLhAWubXqj/pfAU0VW9a+1Ok1UVsB/RTWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770345160; c=relaxed/simple;
	bh=rqn+CyC4DmyPqdwEhCuUQzXXWD6gdAtHB88oVgs4zr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+2Sa1sEXX979HZxRyxD2yka0bzfAwqozXUR9buc7yEa3TxM6uKt1OljsalQ2UhbXefYGo5jNnZjYD2B4HbK/1Xl+gp2gIwLdclFFrNCOKfZhumQYzO+IvarIr/dWRiw8wcYHXBBWL1iQfOp1AyAqAj60oqqFWdJWr0vVasTTms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mLKaQkB0; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mLKaQkB0"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so1334599a91.3
        for <spacemit@lists.linux.dev>; Thu, 05 Feb 2026 18:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770345159; x=1770949959; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/g6xXR3sCpk98fDtquSf1waAlnXZpFapLSMWL6yV+qI=;
        b=mLKaQkB0aHXSypHPn+FEEkQAxjjuPfYNqmhbXKawtYWEQS3j2u2NLltgpSa/ExA0jY
         zlObQPcxpUvlrkC3F0Nyq//WCp1b9s9LGPVdXggaCZc/UqXk8pzQB+Gs/3dl8ZJuFbqG
         /9Fo1NKS9P0dj7IqngC9f2m8pY7LHWL1McAFGOTm251X8ir42ZmkIDvG+eGYnt3rNSGU
         3XJiCTEKwW60jaHytLdKg2glzK/tggis1rBSML1MVDYFqNLfS7qyBlcuRFmLqwXvfwip
         Ds4BESPQM0lvw0bT0CUZz5rKO5Y7HXqNXlaDxlqanwWILT78nuvStEXov8EALiZ88Xla
         eyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345159; x=1770949959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/g6xXR3sCpk98fDtquSf1waAlnXZpFapLSMWL6yV+qI=;
        b=VmTwx29k3PuXM1OrLzxj9zPMkHLpKc8RI8pT6mte0aYHcVITHaSZxt5TdkZ2hPQgvJ
         4ynpadsUjSeRlFtL4ctSKzR7Qpx8n06DjL5xkVn9awYqDmyvOQkoE66qcGSXo1X7YmsO
         Hlb/MeamOmdFyIgacJWw94BOrHhamORQQDnQT9HSqyri/2S7lFdIgoLaK/BhNlGfj5Mt
         1pcNBqCM5G/0GNvTqMnuyJyBwAVZutK95RqO0r/QU4aNGKU9O+hJQomNXWALwDgRL3+h
         UfUNTzQZzUqaMFKCOtfTKiisAYZZU45+LB1lr5aEejRL0mkWHNJITS/QNONB6G8R7SwF
         CSBA==
X-Forwarded-Encrypted: i=1; AJvYcCXfDwSN284kqhOO3us5kODZpG4kePwZar+dp2yDd5me49YJKpMN8FnY/SBskMKVabnqtII6jKpwQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaHhz1pUGb8l6nRIt0sTMjdkc3arD/WcuhE5dZk7MxQedEWdfQ
	dHlLugEjSRKAwzfibTevbZxMzaECcTjFm2u2LuWYi2PA7cFHtQVmw4HeYgdB8IC8RrU=
X-Gm-Gg: AZuq6aLaMR6hWIP+D7WxRqgS7ZftMoHnvUkVaGpbAv3Bq2ryeTd1E9Yco0Yo9Mx+OKI
	AxkQ6FNwLZc2uEZ8S7CHZojs4SHz2nXmJuKh4/TuwlTi5UT7MTUloM0TwurOO/wvcNlQLfwN1UB
	+8ks7S6AkQB/XS/Sy2gCc2WFuKznWpNNAprFjEeLO6UOjwccnvIdoJT4i8C2o5LHp+MHdRxJNZP
	yO+9UAasUfW/8rVfqGHolsz1agGpYTV3F5gXQ3AO9djf+dx8Rg4IjY9Is8LFEnMwz1lzRYcHTNV
	7SNu9Kf3OPEqyZ4VkaQ3qepyWMDeQHsch+NVSgb58LC77NmnvoCDl7Yk8lJqOHY3pS1IFNZGYKN
	DS57FbXtblmyeFDj7Ucdu5ZBfemaxdZUd/TOo4S7yA7DwfPrSKLANp/YO4+4BBOOStSkkLLLvWK
	oRuiv2csSgYsbryf7RFqeNIUplsQLo3nJAmoU75ZzfpieBQsBucpTZ5vJETItIW/lJ3wpzTTat5
	fRXf8LyjXmbGOdaxU4IpqAhKuAAgw==
X-Received: by 2002:a17:90b:4d85:b0:343:5f43:933e with SMTP id 98e67ed59e1d1-354b3e267bfmr956262a91.19.1770345159460;
        Thu, 05 Feb 2026 18:32:39 -0800 (PST)
Received: from [127.0.1.1] (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b64a8a9esm158419a91.1.2026.02.05.18.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:32:39 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 06 Feb 2026 10:32:04 +0800
Subject: [PATCH v4 3/3] riscv: dts: spacemit: Update PMIC supply properties
 for BPI-F3 and Jupiter
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-spacemit-p1-v4-3-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
In-Reply-To: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
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
X-Mailer: b4 0.14.2

Use per-regulator supply names in pmic "spacemit,p1" node to specify
each board's power tree topology and match the updated dt-binding.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No code change. Updated commit message to be more precise.
v2: Added the pmic supply properties for K1 Milkv Jupiter.
    Updated the commit message accordingly.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 12 ++++++++++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b3533e1cf3713a27c48448aeb4d96f..444c3b1e6f44e98b8b2fd5e29820c5c75282abe1 100644
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
index 800a112d5d7054508f03089f0e2adb9965879ebe..e2702a781734beffb331982907a12b20009e37db 100644
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

