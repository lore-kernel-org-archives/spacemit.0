Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB34480350
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997191; cv=none; b=N+MDINNr8k97LXAXmAV6dJm44JytssItvnNrdvULHiN6LWi0l2/mm17hucro486MI5M19KJJWi2IJNi96QV/oW1X3hOUrFz/ec+CjgKoLPspbT3GrQCV5RtdehCaht9otkMPYndveehSr1gp5EkSGeI+qInqR3L+MNcEAT7PjFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997191; c=relaxed/simple;
	bh=s0a1FjNhS9AzlMuS0v730wkh8+Mf9/cJKGztcs8gosw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8I1BNySFki1CoKsXEJ4SmrUlV4W7iDgwgVi6yZIlO4TD8h/4nUlNLEf35ywcCXD61wQ7qAYd5L2dUjxAd7YeKN43oK46vsLJJL+Rfyj3ttZ2EvOG9SBAynVMlnlnujxVI8+2P66aS9kZAXXVFHnen/hVG8OT6FgnxuHep1JaT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajmCBsb1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajmCBsb1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2518340f8f.1
        for <spacemit@lists.linux.dev>; Tue, 05 May 2026 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997188; x=1778601988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bw/a4OrYGymLdr8R52mjU12m0LbF359cidTN+DYJNE=;
        b=ajmCBsb1c7bOvc09rkVCmOJMj01/3u7H1fvHjbiSwSi/0I3YHtCewwPM056mzBzY9d
         fknwNtDBkX3w79GSalEU1qwrNKjblux7aHk8wylDwA6+t3r65Y2FHgxDKNqsxd+GgVaj
         OoDale1zMxIayCyRdfzmXjN+TyO3ikwWDAGjtEoVU6i1MzD29+vFonNfg2yTp6x7ewyJ
         LIxhv406betgujhFF8XucqmuoKtetV+Zj7ioVBxPKAO+83xokLXxgi4y++pqsp8dQxFH
         5bK3WjfywCw1KxlijcMGKUSbLIBTlURSQLPPUCGiFR2T6mdpC28cyQpL456evHS31gG+
         z9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997188; x=1778601988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bw/a4OrYGymLdr8R52mjU12m0LbF359cidTN+DYJNE=;
        b=tZt/4pXeItDOJqGLtFtfXUWZ9cSWQI4d7KcOMlynlSnZCsT+KI3qqvu6Ml5KAD76Un
         eBksBSwoxk+XqSDIqdHL/gUHXLKNO98C/jBsmdZ+YEXmb8qp2oEeeWJ4nBgK9HBPag3q
         /TAahRbngsekyFwQ2a8kJeVLMzEdNK8VilqZ3e2yG9po10ca4J5sjO4p+NrrIBEp+5TM
         sK1E/pcHmU5ck4Ej3B3nnEF2bIJUWLb8kxxmQajvdUy8fg0qbxVZ2VgxZHS4zZwjOR/9
         5Nwji+pYyxTq1uT+A1qg3+8qVRaleycq2WM2cPQLYg0AWsbOrevj199AyslI2e6XGow6
         YE5g==
X-Forwarded-Encrypted: i=1; AFNElJ8wf5/llGo6r4xKFj6Sea7nPotHIyevJ5HwnD6qKhe0gkWEyC8mDAQc4sBEjiJjfJAFKiWjdRFJ8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyT0BtC88/DOl/WAQzXkJYDhRFf63tNaN9OYV55c0jZaVj0CpNv
	U/ES86S1Ag/pFpLkUuwF/h2mzO5dga7CYYDO4xyobF4ffu4QA9SbDzwfeWdSOZic
X-Gm-Gg: AeBDieuARJ3gX6i2kfZrXIk9ayuKFF2V4z2tIqOs9ImyVLv1wKxyTiCu0HxficxQiU6
	KFUuRUfXREoENA9qlzrCf2F9ANoKxpBMbJxEzIoYjJvQeXWHP68MaJHC9uQVIxZy0uJ9tabX2vT
	N2myx3lrw9OdEWGfdUU7eLOPGp27ca+GaaVVdAaXvcL7i61v9eBjjXVdHsdDm2bc11GZLfREPgG
	PMCW5QOvswRDp8A1pfURCZWtrWNCaGoh9D3knDqZppwoEIIQZj76ed+bekfMJBIgGsbRBdackwp
	bXVMiNL8Rag3d6CBANcMvI2W4vZ7YGs0U8oSznV4PiivH2VYJpjSbX2sCVCDusH/AdZFRktdkkO
	upgItyZCOzF56bdQ2gCQmn0iQoEBRuOXBp1IgQ5M0mP1C6A4pdtXtzTy3IxrztoCL6DNZ6qaQOX
	t8tusB7KXFKcJ3UIkFerX8mBy1AzYa3Y6rJO5ZRmYrYHMn+B090ejrBB2CMwx9vF8YRDu6BDM9s
	cr/C3c=
X-Received: by 2002:a05:6000:1acf:b0:43f:ea25:c965 with SMTP id ffacd0b85a97d-44bb6205eb6mr24336002f8f.32.1777997188159;
        Tue, 05 May 2026 09:06:28 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:27 -0700 (PDT)
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
Subject: [PATCH 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom
Date: Tue,  5 May 2026 18:06:16 +0200
Message-ID: <20260505160623.1369347-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
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
index 07eef3274192c..8bb85b5ba1943 100644
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

