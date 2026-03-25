Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572363246F0
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216246; cv=none; b=g8/Vd9q5jLJ75O4nN528eTdl1cNFCwh4p8fNfHcGJY1edBHgROIf2dKtWXKs/WM40JM8eRiRlZTDmQfGCQAow02q9//pe8XVrG0wdoZygaZ4APOCCNvbhT/YqW2vysN8TOZc3whsCT82sSVJDxjjMCybGctDYyK1TbxDUqFr+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216246; c=relaxed/simple;
	bh=BLgHUstfAcn8HjPI3+LMBZ08W2YcL4fGUT7KyF/jEKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/getTT1U0lPxQl9A0YBTli7r2sYD7an8ij19IjUgrc+WHAaUf7c2XdymVnBf40vTMu4uGT2Se+lj+lWfYwNbitAFVE+rSl21sEapyMDMlQLl/7uyGaYYa15R4eselE4KeyMloyJOq0V/9Lv+gZr9au6ZEIZzOVHJsksDyIQRyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieOro9GH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieOro9GH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so1866535a91.1
        for <spacemit@lists.linux.dev>; Fri, 03 Apr 2026 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216245; x=1775821045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuMPAUkAJvfBgKNEN+2BubKNuxBNh0SHWbF0CWlzYqI=;
        b=ieOro9GH/IwbUNttcI2IcyzK8j3MTY17Up4fAczZQueBTAsmqDEmUODXki0DRa3Z6e
         ijIzQpP/WdjH/j/79L8LTiw5Y7MuJKqf+X3w98wY93TiRYpT8G7XQBYPpMNrHn2H1MM2
         oV9zyyhYCK0P4JAdb6nk2RAuV+M4DrCfo50BQqkr6OIxJodNlW2fVP4DVAPxlZE7BPM+
         KIEwofQVrvCZkeNHLHSEAjWBb2uC3AOt+PtiE3uvglt8Td6cDIv8jX9JKYNgcMGZzAoz
         ltAtsD0Y9zX4ilX5Y7a/f/UKjQerdybm3n1jqI27kEs37ma6meRo2Um9OSm8S3lP+gaM
         89yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216245; x=1775821045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CuMPAUkAJvfBgKNEN+2BubKNuxBNh0SHWbF0CWlzYqI=;
        b=MgheuMYv+k0nCMYmjvgVXXycit5mipFMnHIaxOLY0d7BcztR33bPJUb/UdNYd1ofod
         FVIFfYrwkm71/HZUqOCu5/yMjuwG4pwV5oqRoRTxiOsx0HG/biZiIzTHBJZQxJWvy9AM
         lMa4jP8Zz9uB0sDjZBKQXxLzC7wILWZDCnk9Mi1zBbmejT3285Ufn5zFuyBN1d5DfeEu
         Ci/75mVn13p5kySA2ygVOqC/zazxW4qTb4Ro+s3BB+sv4AgYoEtX7SxuW6F4+qYwrmj7
         YFRTY5ahVYTfpv1aVnWNjM1yWEdEMTv0ySz6uh67oqd1Xn0AeK20DLbzOTkxHBjtdWOP
         0VaA==
X-Forwarded-Encrypted: i=1; AJvYcCUhk9GwPgx1C8QhOBPNhoJrChli4JQ3dsIxa7NTx8nW70+6Qn1/Fr64vo1eP27CVpxgNJX92+B8Pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTP6zTNr3e4F2EJPy87c9NDqAAIxxRTk+8wcR8KkvUBGGwnzLk
	DXmFszawwNEASI5nB7AZKq+GF/mHtGilq4dvt4ssNzwAMJ3YDmpX7pVc
X-Gm-Gg: AeBDies7auPg34m4Krl640BRwCNxzltD7t/ktaagtUYXy9aK+D2GEc31evxFG+YEjaF
	1KDXBKei8trnZfzXIfluqWLwrsoqHznILxKyLrob4SlYiI6XDPRYpiXzfycrGQ451oOmSc2lBy7
	kTwtoP4mME4lvsLY0bOoUIzeEyZrvPA5nCycdrPzYDezNDZd2parsudoAW9Bc+W3RdGniDnO82L
	sl9tMj9u9TQJwySKHMyVCYbFlD5gU4O6XPbmWbAA+RLUWjp9ew5Bea/yu6bzPoeSdm1pLrWlVFw
	mCbgCIlWU3R3c3+c8xmYo+iDXddjxkV5jEFMYXQxn1JqneV+cg7RhDy0ricEu3OPplPR+XlD285
	V3ZDR5u/pvHbew8mO+sLTxAI4hPru4HpaFkiOfH7TFiwPWtIgO8EYlPX+gX0CpS+dLP0mGvMVSX
	kBbhbFcGBniwJp9p5EBfM=
X-Received: by 2002:a17:90b:350e:b0:35b:9682:51e6 with SMTP id 98e67ed59e1d1-35de691ac13mr2549960a91.16.1775216244668;
        Fri, 03 Apr 2026 04:37:24 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:37:24 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH linux-next v1 3/3] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Wed, 25 Mar 2026 13:46:10 +0530
Message-ID: <20260325081700.1502-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325081700.1502-1-linux.amoon@gmail.com>
References: <20260325081700.1502-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Link the usb3_hub_5v regulator to the USB controller’s vbus-supply to
ensure the USB 3.0 stack is properly powered as per the schematics.
In addition, align the USB hub regulator with the board schematics
by renaming it to VCC5V0_HUB and marking it as regulator-always-on
to maintain power stability.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index c35f4763c800..3dbdf53b6d8e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -83,9 +83,10 @@ reg_5v_vbus: regulator-usb3-vbus-5v {
 
 	usb3_hub_5v: regulator-usb3-hub-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_HUB";
+		regulator-name = "VCC5V0_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
@@ -361,6 +362,7 @@ &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
+	vbus-supply = <&usb3_hub_5v>;
 	status = "okay";
 
 	hub_2_0: hub@1 {
-- 
2.53.0

