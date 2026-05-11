Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD635364046
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497885; cv=none; b=cBQB1zjKa6f6FobIqvopZe+B/YwkHaaBEyZc+KQYL3/AlvNRjEi/yA06Jth8dFAYaLrGIG13Tja4L++qu+3jfZV9lNz4ZaWaWStzvsw/bSDZrbjO2QwfBKbj+EKYhSVUcLjHBzsiUK/a9virNnnN0nLoZR7H/s2dcjvmBye0qh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497885; c=relaxed/simple;
	bh=ACfYTENujjxxbI6dHCTiFazUiQcwMopzM5/RtPNXh4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOwjbLpfp4ktgn6IDkod32e4k4tu625sw0ZGll3EAprqB1jQ7ZJIa+2rBARGIMIBJEUek5GteVgv5o2tnAdR/mzlQfEgcq2zCIR5/ZmbY1tbSXifyajnYxWkuKJRtOvxlJjygX7Bruz23+9i4oNmvHHuyWDLWf03cXcgrPec2lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUxJTuT2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUxJTuT2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48d146705b4so52112365e9.3
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497882; x=1779102682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+BDkQR0yOyma2a6dWvMQJlddEtkYzccD9yu5cOlZj8=;
        b=GUxJTuT2DvP+0xdcWoiddob+tYv+ATJuFVKwR5XHGS6S5468si37wIDCdJNjsXb+jy
         u5aAQ8Ys15DpO6hoPMIUmajuALz27x6sZW8W0TeJ+0hulEIjycgaU9dfBuCRVzpNTqHE
         sV13qzo7PzcxEHY6ux1Nv2clU1TyCplkvXr/8NJQJpV9SKYSjorEkI9W79n34CqpASDm
         gsrzMdZ95SKEOz9a55mo1h9IuPGFweIGvmtdOdUJstCzz85anNzu3fj3Ind/Hv8rmQYE
         32DSAeLG/Lx4gAypJMa3rLeG54+ge/EqjfvdZ2DKoo9rBevUlO0+5mFIiIo3DOZ0XL2x
         dmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497882; x=1779102682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V+BDkQR0yOyma2a6dWvMQJlddEtkYzccD9yu5cOlZj8=;
        b=ZDrO+InyIcBX+RI0mpHENiHVCEYUHvjFRXVPCgg989NujioLF2aCCtkGbHsY6EuKQ0
         ctYHWVrhpIggv2M4+kBxh4STcTFKUQq5woj+/WemeyuJy8WMp34n5YyJWF/EGdcfiPWJ
         auHrND8sdf85iWz76ORbCUnkS3pf3tDbAbhZle3lXQfm798a4W71IhD++Ef/m2YBczK5
         RoL4haj9GFdTkjUUOoiiA73058z0vdwPkuRmIHdtGyN4mwE/Dg2VSZGZGBQ7W5cdU0Br
         tsTNuk0Y6h5Fjl2cKEA6RsNuFaMvkGfDuiLHsCpLEeFS8GQHpovCAEzYc9wOoOiVsMvX
         bifw==
X-Forwarded-Encrypted: i=1; AFNElJ+yay7V/uQy+kU+u09rGqLi2fOFU9SqkyPpXRw20PuTpx8llaW35jgpFi9Fgs6pImgMR8LaJ8DnzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YycbmzqJx/A4eGw1DrZK96D4ZMQFRE5i3c1Qc8VZkROxdxussed
	LvuM4dWhhMLFyc91ggar3jMbFh/rBe0KHdtx1rBFp3rEI14MA4W8+sMJ
X-Gm-Gg: Acq92OGjj58O5WdnRy8kt7Tz028mK4uhgVwIRwtMo3pMPCR7kDaHeg3zXqAD6/mwgqo
	OyXCspcCmxDFb44SL56CeNYudJ1UhbumIz644exn50qnVw+UFEEdGX1Hj1JaXbQmK5AZjY8MRZh
	kM4YP7uoRqV5bc2PC+RjRnAHSkLD3I9EQK5MeEJnIXmf+oXm2s+2aHn4Pa6S//UlTiWH5rNUAEZ
	rxAYW2FL9djfoBo/7lXm62l8bB8xs6bn1H9Uyel8IU9C385h7G4CuSXz2FI39zmAWv/FgPOtuWc
	9guN75EPtPNmXmai9MMkkm37B7uKBgOZxDJZokX1D1ybJC1lxO9pAogqStmBF3sjCN9LgrbaClu
	q/7wvUsmYgGGrH7i/yINiQb2P3+hLNCrc7f8JhpbBmoNwYm0ufUKFs74lHlkLx0qZHwtE29phQ7
	6Go5NUfzQCiyTcdiIcH/nggtZl3e3hGGgiHWiX4u8jAfjS/tVZKjBlchR68/yhgmeRJg==
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr407079165e9.10.1778497881912;
        Mon, 11 May 2026 04:11:21 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:21 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom
Date: Mon, 11 May 2026 13:11:09 +0200
Message-ID: <20260511111116.1109643-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable i2c2 and add the connected 24c04 EEPROM.

It contains an ONIE TLV table:
=> tlv_eeprom
TLV: 0
[  12.162] TlvInfo Header:
[  12.162]    Id String:    TlvInfo
[  12.165]    Version:      1
[  12.168]    Total Length: 58
[  12.171] TLV Name             Code Len Value
[  12.175] -------------------- ---- --- -----
[  12.179] Product Name         0x21  16 k1-x_MUSE-Pi-Pro
[  12.184] Serial Number        0x23  17 BPMIMXXXXXXXXXXXX
[  12.189] Unknown              0x41   1  0x02
[  12.194] Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
[  12.199] MAC Addresses        0x2A   2 2
[  12.203] CRC-32               0xFE   4 0x395ECD34
[  12.207] Checksum is valid.

(With 0x41 as TLV_CODE_DDR_CSNUM)

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 88c35ad1ef2ae..79415d760f162 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
 
@@ -92,6 +93,38 @@ &pdma {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			product-name {
+			};
+
+			serial-number {
+			};
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
@@ -126,7 +159,7 @@ buck2 {
 				regulator-always-on;
 			};
 
-			buck3 {
+			buck3_1v8: buck3 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

