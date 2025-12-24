Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871B3502BC
	for <spacemit@lists.linux.dev>; Wed, 24 Dec 2025 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584830; cv=none; b=jHcxDqhiO1aBiDFiYnCPnL1Nikrx/ihxoElq0JnJHcZ6rspNfRGLl4xNFz0svwQGCSlg3DLFVZF/lTSSqGHaOjCnOzgGl6i6U2LEt2/oSsLChq45PN23uL9s5NXM8jSMM+EuZndIcftx5fw8JMMMQd16imG6MVHzoCY/TcIHNUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584830; c=relaxed/simple;
	bh=kZ/3wTkbgSCBHJx/+2AgUvvFlYn/kdsAQoGli42UC9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gj6Us9q3ybBusSzJN7xJdIuFAtNwzNwcY0vVEB/WDv7S7oKMCpqBJLwkzYOJ/XuRUkUzmnQ2GOND8UbiqHhd3tmR9fIqXReMbcU/KR8ENqtyiPCsN1Bs5rkqW0aZMBOx4ZRATAaRejYQaEJBiyz52JhmCDJENlKvcaZE+bpepy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.210])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2e6fc526a;
	Wed, 24 Dec 2025 22:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: michael.opdenacker@rootcommit.com
Cc: dan.carpenter@linaro.org,
	dlan@gentoo.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Date: Wed, 24 Dec 2025 22:00:09 +0800
Message-Id: <20251224140009.684392-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
References: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b50a913cc03a2kunm6c6d6a6128a5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkIeVhpLTkNITk8fHkgfTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUpLWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++

Hi,

> +	reg_dc_in: dc-in-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

This does not match the schematic. (vcc_5v0 instead of dc-in-12v)
https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR

> +
> +	reg_vcc_4v: vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};

It is also missing the regulator prefix.
So it should look like this:

```
	vcc_5v0: regulator-vcc-5v0 {
		compatible = "regulator-fixed";
		regulator-name = "vcc_5v0";
		regulator-always-on;
		regulator-boot-on;
		regulator-min-microvolt = <5000000>;
		regulator-max-microvolt = <5000000>;
	};

	vcc4v0: regulator-vcc4v0 {
		compatible = "regulator-fixed";
		regulator-name = "vcc4v0";
		regulator-always-on;
		regulator-boot-on;
		regulator-min-microvolt = <4000000>;
		regulator-max-microvolt = <4000000>;
		vin-supply = <&vcc_5v0>;
	};
```

> +&i2c2 {
> +	pinctrl-0 = <&i2c2_0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */

vcc-supply should be placed after size.

> +		pagesize = <16>;
> +		read-only;
> +		size = <256>;
> +
> +		nvmem-layout {
> +			compatible = "onie,tlv-layout";
> +
> +			mac-address {
> +				#nvmem-cell-cells = <1>;
> +			};
> +
> +			num-macs {
> +			};
> +
> +			serial-number {
> +			};

From vendor uboot:

=> tlv_eeprom 
TLV: 0
[   6.991] TlvInfo Header:
[   6.992]    Id String:    TlvInfo
[   6.995]    Version:      1
[   6.997]    Total Length: 38
[   7.000] TLV Name             Code Len Value
[   7.004] -------------------- ---- --- -----
[   7.009] Base MAC Address     0x24   6 xxxxx
[   7.014] MAC Addresses        0x2A   2 2
[   7.018] Unknown              0x41   1  0x01
[   7.022] Product Name         0x21  15 x1_orangepi-rv2
[   7.027] CRC-32               0xFE   4 0x...
[   7.031] Checksum is valid.

There is no serial-number (0x23) in the EEPROM.
Does "product-name" need to be described here?

> +		};
> +	};

Thanks,
Chukun
