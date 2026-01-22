Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9184D48034C
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067053; cv=none; b=n6O8RuChRZ/Sz6cgk5VICa7tePUhfe7WpLX5VG99GupgCb0+EwdzK+HiXdSQVLnaeB1CNqk6yvtWf4wEIY9rse9cqxm0vRXxmOTUJX0ULYT7GaKHp34cwoHy+/cVOaa9UuRqZSoYgspy9I+5rWAd5n2Fwh75Ywe0yLfthYZI4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067053; c=relaxed/simple;
	bh=55Er+0qEI0xEXO6z26TVSp4tDOzpRg7OsSMHH3Yxn6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CoO5JdlsZom+HHUgdBea6qLd77TfLuWvPx6NvYIW7zBMiMYXHLxzThBsz/c9XYBjq8COfwipaAUMAC8t7aME66YD59UxsREHENsTX5mVNqD7coxEVY1mnVZch6q7iA1hfh+M5gbwZxAH08h3u2D9MbYN5AyK+bopD0Z/bABQ8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uQKo29Qq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uQKo29Qq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7bceb6cd0so4907295ad.1
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 23:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067040; x=1769671840; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/f7NGLJwOVQXgq1cgcrLkHsXysP/8ctDFHDwjeS7Sis=;
        b=uQKo29Qq11/Ax08bkVBsNxtneh+GCCHOvGgPGmKIZlag4NM6COuipVE0wgh/D9SEGc
         hAVyhqEH+FHTKOG4cJzDVjmFWHCoosrn7zrnJvv0rE9id36Ae9VnrUVl/ZpWI0Uyqt2y
         eEd8gtjsGY0ATgkZ46JFBcjdkG1h7Y3St3oPG8HSfXowjkAb9vOSH1EYkamYvYTMEDn6
         tJk3Rbeh9HGhHorHZQK/OFcAnPbT6+yOu+Tw5xvtYToTwyZf3iCA6w/d7ewrPwh7IpiK
         Lks9blOyLCGwuDtdp9Tg6gc8x0JoIKuNyKqfPHFRshdG/sjMjN4Hc5I1RRO8iNagK0sn
         Q/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067040; x=1769671840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/f7NGLJwOVQXgq1cgcrLkHsXysP/8ctDFHDwjeS7Sis=;
        b=ElFqFGWycU5lR4bsxMTHhShNNIf3NRJGnB8mjFib6z2X6Ox3InR80ij7DvBtgTVas1
         W490hRkz0VQiiFZU3g9WDGdwAlQPq2YxDjHpT0riC/i8ObvKtDgvM3Mtp4VOfFHAvrLK
         9zqKcU6OnU8NN52EZftb0zupwY6y2EiNZXvwSLeVGKRZDArJ6+weIi06LMbD91ssIU96
         E3G0CMUiOeQjfoguYeh8B08Yanak/mpeuuSMzhOqX1UPPkWugtQz4hFYEDuD1pwAotC6
         cegolefQD9iihrdbVl9my7LyaiN1uyifmVALnXoWaf40iFkwMKLzWH3sgiGDXFR+iqn7
         VwHg==
X-Forwarded-Encrypted: i=1; AJvYcCVmDKr+myG9R/QDIpn1gt9IiVI9GJBfuhhM//qaNqlDA58qdnUEBsyO+BTFTjrvgeUlWjoFOFK9eA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuTIO/v+s34E66dL3B1IaOaQjMHZOc7g0I+ZZW0kQMweEaCcHl
	5ogTZC21PN1AKzUZJsgt9jmrNE/0vY7oaERHnvjqlDKBEJXLVCVQ3vtaPDWO9tyTQw4=
X-Gm-Gg: AZuq6aL8X22nuVe7CbPxd+oRn0VU/BkUY78Wo+q8tFLrg4qNvbhGaS8CRZhBNXxtk15
	mqraNTMIqD7sYNOuVp1b7ENn/gcP/uQeTe3bdRmuKQPa8b24LWABJruAcxpXqUPkc41NeL2BKhJ
	KjQNd7LaYo1Qs3R577ezFwfbQpHoOyHMzy0zN+OMVHdUzh6PGivAr3w292zrRmjKVVP39ldRSr0
	3nEKAipeGrcA3r7C2KumwOJAxt2FD8GaZl4cKoR17DHKJMGEDNoUksJPSm7D1Gqcm1hmpEU6RAa
	wHZgAH0sIbSbK8ywCQVT6ZXXs/8tT+A1cLiaum68ASICoxExDM5m6ciMrO5Awa+OZygSCKYQiCx
	OMcJ0rjx+jJIG+TZrve/vAWegVYybCf56KDhOo/DGjUvCX1wDg78OOtFugbMzrLuRuxTOlzfzlH
	0J/NlsYUBVQI5hvfKFKX3jyB27e8OnM7w=
X-Received: by 2002:a17:903:11c5:b0:2a1:deb:c460 with SMTP id d9443c01a7336-2a7175a279bmr175677135ad.33.1769067040167;
        Wed, 21 Jan 2026 23:30:40 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:39 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 17:43:45 +0800
Subject: [PATCH 4/4] riscv: dts: spacemit: k1-bananapi-f3: Update PMIC
 supply properties
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-spacemit-p1-v1-4-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
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

Update individual supply properties in pmic node to accurately specify
the board's power tree topology.

Previously these relationships were hardcoded in the driver; now they
are explicitly defined in the devicetree per the updated binding
document spacemit,p1.yaml.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 02f218a16318e5b6f512bcc37035fac37c25ee84..c30697732b627d764bdae9bc8ba44d7b503f0897 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -157,7 +157,15 @@ pmic@41 {
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
@@ -188,7 +196,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;

-- 
2.43.0

