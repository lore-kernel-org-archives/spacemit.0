Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CC93D5C1E
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656807; cv=none; b=bHMedmMSEPvP8rF6U8WlmDzegiSWTGiwt5Wx4gNPEAazHG1DCfuh9sWGGjcO4E45U4iFWUchD+3K/KPaXm7yAcKE/GrIpC2CGBeRP+eBCI5s1Vfc42yHA79ln1SjM2l8E3COzzq6htrDVapOqWkZmaI3OpGrIQQQwUAPS39m+O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656807; c=relaxed/simple;
	bh=iklbridFsEqlzLRtIsCn1I8N4zndIhcF2VeZfwqJ6WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLKpeHWH3fO0sT9K8Xg+gMjJ0rcnzsey8Gie6CU8fQwHBZNoriq1BVnbWFUZ635nBNag2trLDeARi+s6GSBSFNC2hEyuxwQzVPgkOqFOvKne0TJYILvfYbQsce+UZxitRArjK9nuFvJRqb8YWT4Ez7GnesO53TmCoxLzqAWNc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5HNmbvG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5HNmbvG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so26797275e9.1
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656804; x=1779261604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8ZnL1WlOqvrL+zZckD/oAptqRT3baQKqP00mGe80OY=;
        b=h5HNmbvGXjdVaW2ZHt30fLbwIPck1eztbOcd2CMbIRU3vF6oWGjh5iGsEcaETNaW1j
         88vmexkqC2dokE5RGyhA73ARkmRtOAoSwgAr7nm8oNtjABen8KePKG9y8epb922vun/b
         uBdD8qIX8vHPAYU1RnwlWqzQoZaioc8b3lQFiY0LAwDVh1VA8+d1G8QMfhBjcHWf2Alh
         UbM13URBKUAizYDJDDB/hD587Otn0wOER4bJja+CkMZ2zgIbANayZ8VaB8K1r9yx2gEP
         /0mN0q9Z1EH1KYeYZZi4mmryZFwS3alsKDigKjaINvYLCwZ52E1DCDjx7ZDyQhvChDtb
         8oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656804; x=1779261604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8ZnL1WlOqvrL+zZckD/oAptqRT3baQKqP00mGe80OY=;
        b=budbM08kVWbh2FStO6cDvF9huhZfAuQCRMytEEg+giGgivWq7k1H9YsatScI5lKx6k
         KMYyryMne94CG4awMqsv+k3795gkTbRS4gOMgc82S618IqagpCuDPDhNHfSLGXoLuOBU
         rATv6MTQEdOQ6ckn/rJJ0HHTty0+aCHl+WYSxnmPVIkMJWV8thAQ8vXxevcjbrTK46+U
         IpdY3pInK0stjAXLP4UWdAbUAtaw/PhD+/9msVXbR4XIkF17ITzN0nqUk/A3A4K9wrzO
         mEH97VALBmdvCiVLIppB5ir0lxXc3hVfzit8eqXI0v6bFR7uIAhuZKIQjhiZoBP59QcQ
         CXsw==
X-Forwarded-Encrypted: i=1; AFNElJ93U2co2QtsLo0RsICbcYtQZ3ncbJvoyS0XMQ3l53/6SwC/lV7ir7W7qQC2/TRkbv50q7bEqkupZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuTtASXVVSljb2K0vEEf00pfl9axnPC9irv1m1b76pEEH4Tp6l
	cg4bgHMlMpkjNFDYVY3HBC8X4fpoos51WPZzAlXpyie9BI20MDMXV832
X-Gm-Gg: Acq92OG4p8H4PeHl+rD6u/yQxV1yMxSwadaIbxXVnkpdcmNyYgPTGo+O0E71/7RyyCr
	e7B7fCtsMtj0Zy/o2yL6TPIMlw/nnq+vpsFqV0nyVmXQgJjDMsEElx+t95C+hbm/hzmEiCSWF9Y
	6lshAfB4B0VFK9GN7d1WouF4bj4SGZawZ0OoArVA0M02TzZjeMfzH9zOBWcU1fNtkUtjOKsfMOx
	d47zcZ5abXVifDNOjQN8fjQmZezD4bksC6FE0JRSfrZYkdrqbmWNASGgbfk7GTYDRkwVKfupmR5
	gG7751hhBq4OJwKCDImcB111Zr25IvVzIGR4OFLfIuX0abuXHLokywaN6zcGiMxxKki7qGnzZYE
	VRhnQ2YiNSnG5WmqIJhG7SY69McxUnqVzuWpos1o2coc0VrtpLtxp1KLvKsZqe3rdREHqoC3OL+
	BLd6TIk1lFrp4ilWnzl2mqTvOduVkKuDLJYzZgRqhQUYsBtKipeCQdDSjiCF8yzZb6zw==
X-Received: by 2002:a05:600c:a11b:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48fce9eacb7mr12437505e9.16.1778656803757;
        Wed, 13 May 2026 00:20:03 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:03 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
Date: Wed, 13 May 2026 09:19:50 +0200
Message-ID: <20260513071958.29574-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable i2c2 and add the connected GT24C02B EEPROM.

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
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index e0b585c50014b..41d7d6d20a797 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
 
@@ -82,6 +83,38 @@ &pdma {
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
-- 
2.53.0

