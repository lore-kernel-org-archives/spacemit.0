Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3782FDC27
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216216; cv=none; b=H376c26oxx7HoHJSr9XTW16HmBnKCyIXxDA+Xx42SGPFRQaL8hQWVhLXHnkLhR2TR92qMhzxVZZfef60/Zjam1pUiy8QAa95pxIalJDu9GQRiBFGR+Jdt6ZrN/qhFtr7oAfLTHjzXYqk54eWgpn7RUAIoWMPoHLHZEW6Lq5D4pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216216; c=relaxed/simple;
	bh=VbEcjens4Q0c1VlnAoEQ4VJqjoYem7jVG3Exo3UuO84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0NcaxSqgitUugMZ+qJsPPtFWgR4BsQ55nlLuO1+ORlU8M0dVCCQlXdfZze5ClJjNMAx46qERSzR43nZkuwMV/5f8JUcU04mlMSzDK0W3sOl9A5z2zKN7jqboQJbYhZqd4rWSRDDux43xEslCZGpsHRA711AsCbNRMDbWgueURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyYb7dzl; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyYb7dzl"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso1070479a91.1
        for <spacemit@lists.linux.dev>; Fri, 03 Apr 2026 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216215; x=1775821015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSgprDobMmJNRlvBzxseyBmhNbTM0nryCqDbJlCu82A=;
        b=EyYb7dzlZMFMoY1fCXEC+UNr6U5TvBjBODiEaKfvlHEao+N2RZAvdiiwdxv+MEfNJw
         xNboXyN83jOh3DoajtE0iA5qBwNPGYAXyP27iL4gYaejMA8rX6Y6Xd5+7R/3sDvDbzMQ
         SVV7UG+QvqzavKlH/32KZuv7O81bFEEuToqo20Yo9HkkyFaqearTTvkk3n7FtgJ7JuJq
         fLvG2ekbjdK51mJtzD5wN7CuibR56iYp21Ihu+caojROaFoY33lEkaaC4iFyQY9O+sBl
         fi7B3RDjtL0e4g4IiEo85TcVxikoFgYkghjxzEp2fUsXJJa5QhIKr+1xn0XeRqWcIDLM
         /NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216215; x=1775821015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSgprDobMmJNRlvBzxseyBmhNbTM0nryCqDbJlCu82A=;
        b=h7Vv64SIZ/2M6J/6QGxME1yAn0rxQXF+sb2dxKmGVzKb8hRahu3AlTMs4bz3g+DNqb
         gEUmpWXCdF4WQHNDmWTUNQ7yzTO6jShfxM4UWwUQovKphP7JHALXy7bjfY0wIThZaCby
         A4e4UVakxIxHwYG6i8ypdXcqvY2PAAx9bli7JHi8lo8BHMexRhfhyIYJIwt/fZ8jWoc6
         fR3t8foCbYE8/Fi4803jgPUnULkOKvcZOjiGBKRnuK/CNJYJJpbEPlkYGEPjOk7HxWWv
         N/ycTQRT375kXhXkDT7uwXMqfmoK7gWVbBTc/WeJpt7YNuGZJ9lc0h+xpHX3kPWIoa+s
         NFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw0v6IvzhtJkDDV7JYrNBmBtBEecACSTCGMwMnVFKYrK1VUWLyKxfhqhAKgON9WdKggmNL3u+wVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOzNhLMDYRopPMHEUK1tligLYXc7p0uxjgu2uduoj5n9DzmPpC
	RFlmW1eBCUC6Kh7g2rL6+vL890Yi7287mP9dsSLLfNDerb5/JEme3qxw
X-Gm-Gg: AeBDiesRtgIYK6WbL9j5Z9/TlAQkAMW7Jzo9Lx/Eep1XFVSQ1gE5LeeOpc5w7oc+10B
	HrrkIwT+d8aqRDQq18qrMTgTL98UXWLB7mGmYrkpGy3ZHfRVCwMUVjWw6KkKeJzp+6oYTQkYeLJ
	qq0NhvqLfMlRFiaMEVViDKNHzKB4lhxHfxIviwCPCAOOljL/MFkY7GqvbxkDN/OibijIOB4O6Hu
	qMBE7U7AfPZSgEh8m/rlwn0Fg4ADmGUMjWemtR8QS2/3IktF7PQJyNxaQrkG9dOFT0ySpmV4F2R
	Zl5MIfcwQF+Cy1yz860k/kk+MwoNlVDccKHNcCYXIUdAW2KWCd5Xkhda8+lpBdH4KZNETJ2MMNH
	WDGOPi6wKgDqLBKTjzDFf0Su0nuDnM6XU4gFmqSWiJIU/2F7KpupmtFmWFnHlHB/AqVDPG1jB5G
	20HC6ygHTEZTOlkPHKUDk=
X-Received: by 2002:a17:90b:3b8a:b0:35d:8e4d:23a8 with SMTP id 98e67ed59e1d1-35de68f8b42mr2363418a91.15.1775216214567;
        Fri, 03 Apr 2026 04:36:54 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:36:53 -0700 (PDT)
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
Subject: [PATCH linux-next v1 1/3] riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for Banana Pi F3
Date: Wed, 25 Mar 2026 13:46:08 +0530
Message-ID: <20260325081700.1502-2-linux.amoon@gmail.com>
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

Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
DC input. As per the schematics, vcc5v0_sys is the input power source
for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
to correctly reference vcc5v0_sys as their parent (vin-supply).

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..9727ecdd9f6b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
 		regulator-always-on;
 	};
 
+	reg_vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	reg_vcc_4v: regulator-vcc-4v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_4v";
@@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
@@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
 		regulator-name = "USB30_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
-- 
2.53.0

