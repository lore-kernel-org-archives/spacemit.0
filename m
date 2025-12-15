Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA1432AADC
	for <spacemit@lists.linux.dev>; Mon, 15 Dec 2025 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765793426; cv=pass; b=ELdh9qOdIW2IBbrvkKpMCaOV0sGHMfNUokuBFM1zGIs6AmWGHt7+PRW9JpNUYKVoRPTap/fyT2adn2p6P1l9OHOhTkazu04Go2r4xCODrAtRC4ZfI3T1NyFZZDW4AuCS0ZWlLBCdaA/wCl/Rda688hdJ9auHarbUl0qu+7TZANo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765793426; c=relaxed/simple;
	bh=E496Aag0B6I+CJtDcV64B5tFp11Y8ATwoiZVs6YC+AA=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=s/Pp4ib5vj9lzbPX4bBm+HWZY9hGW53Mvt0fUNvuCdUKrlOZGUXl5A8ZmCPlh96ssxABDkMp0upZXRyMJiZ141WPs4BMTidd3QHV3va0tQyJhAQ8SK/fT4cdXEkI0et8DHFoNft63YJEoDXDDvEsvZWv2t06nllc/BOKg655a14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=KvMf/yXB; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="KvMf/yXB"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 444CC5814F5;
	Mon, 15 Dec 2025 10:10:17 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.102.46.124])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E3CAD5821E9;
	Mon, 15 Dec 2025 10:10:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765793416;
	b=vCoiiQWfrfmSAw5Kbyq7NtL++P9mCF8s/wDKFjYBC3yqPCzBOPQjb2f8dz3/dIXYF3QTZo
	4qC0n9lfGdAqiW783KsBgYAMyYQ6LmMFDUdKQPRrzEXbanfBEFH9TEUl/arcmt15fXAA9H
	WtPHAnqT4YQRN+xrKAWpy4fvINMyLyZnCmHt+T7xlvtpc3hCecE/P/jycnxlUnBxAmL7kE
	fehU+BMJB+FZWfmhNaXtk1mlyzvDTb2HCcEvZvi+XdcnXpW0qAQ/4sPzPg/u+CJhtqaRLI
	ogt8+SjaW2jcnNWxxxSKcRTIY9JKKFdSTz1444GHSOF9vf+Manpj5Fg6b0MMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765793416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=VMIbn/FU3oQZsgd+4oIuI055Pl8F5Y64ypVTigSYHrg=;
	b=5Zu47cCdDptYEFu93meRPCI/C9oCDxsvH40zVkJw0o3ROdeGGBFTLsqNm7iBnBLfe6+eca
	Y9ukzlja5xfZw/ec67HY4dLbcfyqIDUMKSSeis0TD9DNCiLusXrTli6kTe5RYLYqxEzGcj
	Ah+JQQhfSKQahC0kSvMIz0tVPYjTKV/ugwxJexu8Ve+54meq9y4vM0BWduDd/KWTOuBscs
	oKBJx9Imh5KfMQmL/bUmYNX1bqD6YweVqawJw9Zhl5+IUgQGSnIhvJymLueXx12eEeLqYU
	AQtmmu3g7BGmW6lHu6MGi0/swahOrJpSMYtc5+EhsPY4M9/Drl/3ob1y7mcsqA==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-j78qb;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Squirrel-Average: 6876e82847daf2fe_1765793417155_1225003095
X-MC-Loop-Signature: 1765793417155:1821563061
X-MC-Ingress-Time: 1765793417154
Received: from fr-int-smtpout21.hostinger.io (fr-int-smtpout21.hostinger.io
 [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.46.124 (trex/7.1.3);
	Mon, 15 Dec 2025 10:10:17 +0000
Received: from [127.0.1.1] (unknown [IPv6:2001:861:4450:d360:b35b:2e1:df94:f057])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dVG5f0Cn3z1y5P;
	Mon, 15 Dec 2025 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765793414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMIbn/FU3oQZsgd+4oIuI055Pl8F5Y64ypVTigSYHrg=;
	b=KvMf/yXBaZU16+Q1Wf64dLnQ7pvnKdoX0n7qgUA/hVrfmuz/P2rpkJhKAX302UGM/yfmCd
	W3P3n/pCLW3zKdR9bT3WlXOYl/mjpfQ+01a3j9OQt9e3eyo52QMfEUwiUqBbi2x+r4Rerk
	rJ/T24N7LMDhNhS+3U0y0bgEIrwV6Om3b3HEn9leakW0pqmEcNwyKK0A1sRjM9mwn9SCAv
	6lzpKHb9ECJAWPr2FtS8F690qlEra/3/AtEp5S+n4C9I9CmxiCOBns8YcOGDLbenIx8FU/
	GXBnw861IOk9s8d+xTtHggnT/ZXXFjRsUl450ZaD9FWNtMKL80bOfoYhH7MyoA==
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
In-Reply-To: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.13.0
Date: Mon, 15 Dec 2025 10:10:14 +0000 (UTC)
X-CM-Envelope: MS4xfCgOq+potrQ8fxVNIoSj4GYYrhM5BiuzgnDmBeKJAPHOLwl/3ml0oNQuqTCKO/P/y5lkItcXnkUtxTzJMHQZOmGkRPukeB02D3ygoGFSNM8vEBjCJqgP 6PF2TYFBLECaITUgSOByvscOJ13tQFStqF9DX+v2IeduqRWGb0cEwQUedytnv6ptdfOMWWyP7PwdJUmkctrqWjNFFXXSGp/fdRbPv9gZu8TXJ05a3EWdANiO +h9jIw6a6nWVRtNnSyNSmkfa75nzClx30OmTBOgMcTjURKQxhietzUMrKrV+W7BF2edb2ncAMBcrxJ/2v7fK8Sl6c65XJwBXqCB7Y9CuaTH5NYzh2B7GfkuS khrJjDRgrc0Pmci651V6auEIhhhHJ/Mez6K9YttjzWQZUAStiN2W6CYffbK6VaRFZPwheIvaByZ9p2m7sudi+8g6SX1OEXgONfzRprzzU2SuAxZZ8oE=
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=693fde86 a=1de+KQ0ukeRx8XkBeA/5cw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=zuwN4CuKjCjMoOjqGcsA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

The OrangePi RV2 board exposes i2c2 and i2c8 buses
from the Spacemit K1 SoC.

This declares devices present on such buses, in particular
the at24 eeprom to store MAC addresses and the regulators
attached to the PMIC on i2c8.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 166 +++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 41dc8e35e6eb..b9b760d7c398 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -17,6 +17,8 @@ aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -33,6 +35,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &eth0 {
@@ -81,6 +102,151 @@ rgmii1: phy@1 {
 	};
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
+		pagesize = <16>;
+		read-only;
+		size = <256>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			serial-number {
+			};
+		};
+	};
+};
+
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
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
+			buck3_1v8: buck3 {
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
+	};
+};
+
 &pdma {
 	status = "okay";
 };

-- 
2.43.0

