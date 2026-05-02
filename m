Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21B323BCE3
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699167; cv=none; b=d09kAc99RVwciahpuQ8czbN2+jSj/g6T7ahV4/qUomR7PNG11GRwcVa1fMjp2Ghv3eSBf/ixjvobmPd1NhCPKlcqwD6BFmDxWuYF9f7nSIGZ1WE0UG1bvDx+R8PNdlUBIL8i8cJrvasLnTeT25kmxHJOwB/PMq+wE97YNuQYUtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699167; c=relaxed/simple;
	bh=Cr0Mx1E/3Apsa6hk7IxjHbM3hxEvqBbDpRTia+baFIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Va7zoD6xUQoEox/NJ6CRX2Mluepcs5CASWyvTbCDNCnJXskIJ2maRfrHbM7aOCS/cXk6q4eKfvDWhxxUVnczwfHWBYxUcyhrB+twt+71qp/4GGRQaOscDlnBzoTWySYkFQL7i9JeeTyOTi536u6DJYUCKrlYbsvbDoFgZsiU1no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaYr4zCv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaYr4zCv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso1106486b3a.1
        for <spacemit@lists.linux.dev>; Fri, 01 May 2026 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699165; x=1778303965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yn4Ikrliqtn1tmBnkwrqopx2vI+LbVSo/RlQYheF60=;
        b=QaYr4zCvp5R6cBzakQNjvgAL2XOmsi7u2aq6SguMZ235dsEoU4qU4PBfWSS2ev2INg
         7NxqJu3X3l6GDhHNXEavrY0mr82jmjIBZMExH4koHfY+bF0KpxGG07kgcaLe/oluQy72
         wJGHoxUcPBkU2rFNfEpuMkzJFIsDi+tfNtdpQk1bOEkPElVJX+5/laE9b54Tk5qwpb3Y
         DBhV74vvJBmaKK6YYyEXtq9i3XEdTCsY1/AockzPjwL5hiuXo39XJV5Fd6skvNu91Zaq
         pf+wlu+QrNNaunGEYqZbN7OWXsBQ75Oh6Rls1aiKI7u7yZqFpnN7Qu/9DX950F1UeiLy
         IqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699165; x=1778303965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2yn4Ikrliqtn1tmBnkwrqopx2vI+LbVSo/RlQYheF60=;
        b=oUT9EjaOHEkZANupZ865GtLHnfJXgD8eS74LS7zb0PGiKb9+/uA6I74DscC7OmJA92
         noJRa0AIvA62IyzQ21hrj0e3gD6xMFGwKeQSCiWc4igdL59QkbZmjqMqJZ3hnb1F2YpW
         dDMupjx8XjXV2PbxcsbaAJwEhKCFMal6xHOAiVr0EypbZlTsNsqGLo1YPE6X2MSzU9JK
         +Vsnk+1QIQdkNCzMF+LR5qe+2sKysrjI3He/QcM2MqTASAXqT0VjrNm4KsxJfIgfUew3
         IOWaefx16wsMTnHHA5G9lNMo/uHjDrjkr/9BNVM6cIRLkbhxWhePpQwLyKl9+iJHWwTf
         CkjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wG5O1a7HoLPduD9uQY0s6X8XVAaPE23CVOgH8GuT1lhHfm3LZ7ZOoWX13eivV8lvwOfn4Cz2iog==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWisaKumYIY4GmPjmPYxKlQMyUSb0ihPcjikAz5jELkWd1CwhS
	L6nPBg1aGCrdBNqRiFGAw8of4e346sDwALzyRXnMIcOIdrTWr54NK+MY
X-Gm-Gg: AeBDieuZ7ENeGIt++PYx5YwSSHqUeJxbWL0kUWKAbAa10EzGojtvbGVMSLYDwZ/eksZ
	r2u+9kxUYRkl0uMaenZl5FWhQuugU5R+Wz2UhBA9CwbMOEH6yKtVOpPYDsfP6LHLNurBO6QSgKF
	7NUndnt8vuKUysDVDGZiKeYhm2de+w+TyYiKORPRNB5cQ2SQGWF1LwfRU27L+PYPIbzYhOg2Owp
	TdFGRa4HpUtCH5m7EZcg6m+jcq+QiBl8J+bn60dScxS1RQjy/nfFUxV3oBEMuK5Vroq0WRVAFKQ
	HMWmwYAxwAbE8SIvCXpqK1Gq7INUU9a0Vry8glbBUPM63jw4KnBy1SnenNXWRRj4YqMdrXUqdTP
	cjNkBT76xaBy7VyfaUNCwn3GtxX2d/4niSzuAmsdAVMoXrayuhTtthaFPRUQXS8nwtFGQ79LXf/
	uppCk4HrqOlSG40qiwZoGDzl5wpF2B+w==
X-Received: by 2002:a05:6a00:b610:b0:82a:ea3:c172 with SMTP id d2e1a72fcca58-8352d3283d7mr1705636b3a.46.1777699165158;
        Fri, 01 May 2026 22:19:25 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:24 -0700 (PDT)
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
Subject: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for Banana Pi F3
Date: Sat,  2 May 2026 10:48:54 +0530
Message-ID: <20260502051906.8160-2-linux.amoon@gmail.com>
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
2.50.1

