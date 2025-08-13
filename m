Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504321638A
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053129; cv=none; b=KeJuHARccDz5JWEVP9ChW6gz/lxVinHSAhLisdDJroxpY/K+yNfOMOxzXrLlVxya+HLC7EudUi6L3wicXn652Kumr7GZodoNjLTGyKZnZpM/awb+9FQBLOn5aSglqUmcl5CETumeY+8VVqFXgFA83yYiLdrV3wooa4/AT3Ry/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053129; c=relaxed/simple;
	bh=D00Agu9o5lMwHglRF8JEmN9Mz2SwGM8gIpQ2brQAJHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYy6ts6pKMku0Uusvsb9Dwws+K+UyiuVbW3r+2eUI3pWgvEHYx/yZGUKbhjN/HRFP/7mkCxpCLxEKvbbHIGNX8Tn8EEDJrunBeaMuk7aaYoJUdjp/U2L+xFIjD64J4KgpQ7JYT6RTAgZuGTj2iM3f1RYgJoAhSoVAXRpIMG45GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=gHHB53g4; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="gHHB53g4"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso25688385ab.3
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 19:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053127; x=1755657927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=gHHB53g4sSF2Ebqkhs7/I+eb8FBEGRachxuxu2xP4g7au4zAHTWsiVDh31HVL0XIXe
         QrrNlGmr73C73Q/dE8vrAaOf86zadA1flF6OXBE5qn1/Sv3uem84neKmPC5WF85oo6v6
         wSMhws0rpX77KSZuSLfSJMMpq6zamkUfN+szLjObD9sLnhe9rUWfNdxFchTSZ9TW7B++
         LD1+NsTehx4Q6zBs/Uy8jA2u9D3Wy6WoUnWlUO4B71ov9HCBeiVVhP8I+t6HiUFM3YqB
         SdU5Jb8YCZykE6wpT00QoAGQsZCJMCc74GW97LuoiMjtSu50R+K1Dnx1dgn+lVB1Hj/S
         o/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053127; x=1755657927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=M3Ftb74la+97gD36GQqzSLYs8jwCRWbHoSc9wJVnzLVgqPVcSjYn4TSIEWgZEZvdO4
         8ckG23qTjQ/w9j9ADVZ8e61d/4arD0MHYuAsaj6c21SrM7Q1IU3cURd+Pz9q0Hk836k3
         0W2av8SRmEYDjPN8ko5bxpwgniEFeFQNZvoz/24l0KMBHwgn6clV4jMGXcqceJoyg8f0
         ox3V3+9yXVNg6GgEnuWTGYQV8PYErIh/GkN7QANAX6+k5Nii091izOnSdHVrnEKY8XrB
         IiSl2gWvzoTczYdTFZbY9CRzVs31bx0ap+EShNP/7OiHjDpL3aKRR+g47pRgX/GcQCvd
         0Kzw==
X-Forwarded-Encrypted: i=1; AJvYcCWez8y4KlPtWE54DmjEEA9cHYIw+DzUAOF3selwG686aOcYyxzJDAUJqzxN24xUElwmLFzM2R1fww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeeqcoqO4vr9mH0JBfyVGjafV55YPlT0ELutIFgMgAKqJFvx8N
	orNwLT0XSSF95zdU4bL4i9CTJ0NckOEveAdz7d1kYCWe1k8AizbrvIYOuptwZTZBRCM=
X-Gm-Gg: ASbGncsLsBDSF83oqnqeV/c+ajgewVSk3jq1eHPSnBGi5/Y+NHWwTML4olOJrFNab/6
	9TQ2f7JUSMvf1bstqKAq24KxgM0caeUYKd0V04P49YOMHGDSLDyVb0Wqa2u9QIMOhThkcY16p8Q
	Fd4n9mVTlggnfU7Id4sdzoghYz8MaI+4mUBqnwL5svAB0VgkNSrnPcPIy5u5XFY1gkVXzDAjGFf
	NA5H8DQ7+wMgBO22vHh2S4+K/1+MEtwOQ5GNQlkHXCMRSb1fwBhQrp+nPDz+y0fWQ6Jn/pZGRwk
	h1ughKLxxXBlmKKqyXDPuZrkppkhS+tV/kq+aOfoGGotch5DAiDN1+ghl6irCxLMDJiNkmpEc3t
	mxFm6qenL5R4y7fpzmFOgR7saYA4TyfOZrEf8/sjTdikNtXaRcxkovY3dzjyyrmNwwQ==
X-Google-Smtp-Source: AGHT+IFoJ7UdDYgWZatV5u4GKDu3Y3U3FYyZUg9TQH+UAQsNUabAIk5nOGAMecrX5f7XD0yGFSpmTg==
X-Received: by 2002:a05:6e02:170b:b0:3e5:504b:420c with SMTP id e9e14a558f8ab-3e5674a2d6amr25649635ab.18.1755053126723;
        Tue, 12 Aug 2025 19:45:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:26 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 7/7] riscv: dts: spacemit: define regulator constraints
Date: Tue, 12 Aug 2025 21:45:08 -0500
Message-ID: <20250813024509.2325988-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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
index a11a60b9f369b..a9a2596a94e89 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -68,6 +68,110 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
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
2.48.1

