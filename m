Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C53B3895
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209852; cv=none; b=tNQ276tOeNf39gXnqhufvEoJKF0XzGPdh+2VDydcHePQhyyDEUDJeXomjLNL2vr6yrta989KzvHBqqUCeJWe2z+FLcd6b/GY3iyJM5B25AM8wSTSBSgu/mji+xbxC9lEIBsM/pPzvRe3PjLPXz1yhGDscYt7ecNohucymgrHGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209852; c=relaxed/simple;
	bh=Zb0I7AvVVAEHHiSh+U6Dsfia8MsvMGXoqWVAcp7btw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rHy/N9Df3LedeTTuXUhKStEj+XJ0SXpDnVCIanmFXu3wMG4dPanq9HRPT1lvt1Tnt9Axd1yMGl7vDwFO8sVFDDgriid/KOOgxO6IPHKyXncSPjbD83P2UrqzOCo6U1xCNke6YOIeegknbUVY+OXadC6u60HSAZSZiWmC42UbLdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3973ed8f2;
	Fri, 3 Apr 2026 17:50:42 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Fri,  3 Apr 2026 17:50:36 +0800
Message-Id: <20260403095036.231761-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
References: <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d52c0860803a2kunmb70347af59b92c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSk5CVksfSEpJGkkeTEhLSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> +	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie_vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};

I would like to maintain the same property order as the
regulator below, and add vin-supply:

```
	pcie_vcc3v3: pcie-vcc3v3 {
		compatible = "regulator-fixed";
		enable-active-high;
		gpios = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
		regulator-name = "pcie_vcc3v3";
		regulator-min-microvolt = <3300000>;
		regulator-max-microvolt = <3300000>;
		vin-supply = <&vcc_5v0>;
	};
```

> +&pcie1 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;

> +&pcie2 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;

I think vpcie3v3-supply is not needed here. [1]

> +	hub_2_0: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <0x1>;
> +		peer-hub = <&hub_3_0>;
> +		vdd-supply = <&vcc5v0_usb30>;

vdd-supply = <&vcc_5v0>;

Please refer to the schematic. [2]

[1] https://lore.kernel.org/linux-pci/u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe/
[2] https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR

Thanks,
Chukun
