Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB562F5C35
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169885; cv=none; b=Oz07UioQLqhaWMj1AP41MXP1MgEASWsovTcLm5M+FK8WUwFfkLocdflF6lAUXFeCUlIW4SzThjtn9FTaO21/DfAT7I8j/yE4iLOe8ii9nxgUHw7uOdOII9bg5CirH3LQM/Pq9QAXIKcsYAvNlDEmWNttwkkgeGMrbs+JfGPTXo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169885; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOlaa1aHTpqDKCjI+6Bc9t2oGxD68P7bC7Uyx0M0iiZ6dgWxjqaHGNwdxaAoxi7ryAolfLHRau9+jTFE1L0dbQNLjyfLZ5R+K1u5QCdX5z43stNxPZJwcTbkRdM1bZT7UC//mtoNdSAvA7b+QoOTbJI4piLAf6QUt3u82fKZbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wy8HZX3s; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wy8HZX3s"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d9f5bf544cso137743285a.0
        for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169883; x=1752774683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=wy8HZX3sPE2XLYu1fD5L6SmIqusJJMgVqSPMtm1/V2loLcT+7a5KK6eiT4FFvL5/pw
         ujAEU+Q3MRBr/CwPykJqfoCiQy7kQEmtH5W7D89pROOson+lfmaqbQmH0AUVc2ias1vN
         HpTx+F574QKV97D/R9J5jFV9CoNZKLeu1GdhN/bfcjIOwRDYiPaeuNq3AndCvPM3NrtG
         k+eC9CbqGOnHQyJNE9xB5pB1EYP8AO0YcT+DJcTc3MyJqSblQZIfjXmxw2Mg6KFy7iLn
         iAUw7nIY6lqN/qf/oSJhcu6KtGHIdy67g9D74LUVwCaOQpmsIKx36uoCDQ28E4kIpdIG
         j6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169883; x=1752774683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=Wz31gCvNRQxupLDMv712Shn2cjNNFsrfCuKGVRGZJrGZCTW/asy4XBdVYkDs1KqHUg
         UObchZcRcwe07kIGw4Q/ilcgyGLn+cP5R33hc6Hm5ET567FwqZYdsV8Id1gl6YYTDDoG
         AWxDyhBeLH1F0rWEOeIAk0qRZd0A3h/UeCq4oN7oDImKMSlmK9XCIc56HJmCYVcjEP5j
         OlmXc7NsRJ1Thu0q+cKG3fJxxCEKNPuVo9UxM7CtQs5QjWvfP9XQXScn/jDSH37fI0gO
         XXU3gABQk9a5okg3tKrIWXt6JxCSyGUnDw6wfIwvvFOQ4jEimTGMp7lGQfvil7nyZojm
         8bDg==
X-Forwarded-Encrypted: i=1; AJvYcCXaYKSQJz0OpUY7h199HBYEWBka9TsReTN+8G3XD1fZ19ksdl5LSqoY26MQP7f4AJ+dPD1CHavQqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLKEzYVsnYW+Acaxq2A0lRl5dpTdFMW8/c7TIVu2zoISerP33d
	CYuE3AED6BFhNSyeTW3H8c8rjR8yLChXJbNfYhdMbu0ozW94F88xuMGdbg0+4y+uj1o=
X-Gm-Gg: ASbGnctvjXcHn9jbLz0X3XUYsF8xj7XHTRMo902pE1uHBrHAF+dJirGea1XuhYKeCfN
	k99TUA/q+GxPhi6e7+Bdeb8eLCIkcKqHVO/RIs3Pf44Vthex2KGrcseeTqBlxDbir+xK64pbarf
	hHlb014dEOTPsloYic1PVsT0WcdadnZ0Csyv8zWiSjKRH/Cr8hLxNcDoYYNANc3b4UMBEj0lPh0
	SWi15lOh+AFL/L8Cbizo/EM2qfRPEI2yff5AuV7eTrJFvgH8RvuRE28643WSiwdEavuH2ZxZYmf
	zXye/CHhg5xMYO5LyCvRKWD4jlJ7P5ncU7LigegbvdbbtzC2W8AJhjDC/Xq+YDMLJMOUySHruRK
	x6c0CS7VuBeyxujlzuassZAc3Tx6lom05Ss1J1jTRE6jGtQ==
X-Google-Smtp-Source: AGHT+IEoaJ/MKPD+CK7o2MydxVCmaO05jGvY7/XoDfctFPCiw8+3wLCGeJ2afHZxnC3BYh2lChbupQ==
X-Received: by 2002:a05:620a:4450:b0:7d6:f801:ed52 with SMTP id af79cd13be357-7dde9b5ef8amr61941285a.2.1752169882818;
        Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
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
Subject: [PATCH v8 8/8] riscv: dts: spacemit: define regulator constraints
Date: Thu, 10 Jul 2025 12:51:06 -0500
Message-ID: <20250710175107.1280221-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
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

