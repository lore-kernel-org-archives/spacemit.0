Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB5273F9;
	Fri,  3 Apr 2026 00:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775174742; cv=none; b=ryoKoXMvLvfvCjrsCQq5MDMIl1Ujd3OrOfyz8b5UTefnJmGSFUxLeisxVrpI1Wv0Nx7sNoMwfL2Z0KmO4WBkoAFptBL2NrTjcBfR9ggZSHxJAC4wMpTYL3kYcEYPmD/KVh8LuuwdjPg7nfezcWy0MO3slhJPSueWOwkvDtUdtns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775174742; c=relaxed/simple;
	bh=DDsPrUWRkqkmQ41FPpxMfl/fi+0OAAZHRX0ngFqdtlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrARX3j1UehEU/jS7tK7yrEpiIZIoUhlD+t29wgM4vmwLRJ6z4aOi+DqFWLCG19qpTnaT0eHxb9V0KbmCpurKGqQ8TnVp02ca3DyJ+UNPAUCZqAhThgNO21D0pr4JXlaDIXdh7Pr9ppdhCfRjXaCrOcj45nb32shY2H98+dHlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbciE94M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbciE94M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9332C116C6;
	Fri,  3 Apr 2026 00:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775174742;
	bh=DDsPrUWRkqkmQ41FPpxMfl/fi+0OAAZHRX0ngFqdtlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbciE94MPpLqbarbdytrfVxhnGPoXIzDHr0xpgX6lWDZAc2KdPYoMU7KugmxL5qv2
	 WzP/gKxPz/skbJgSK2u6pbzCdnk9aSMfotyhzJ1D7/PDljRAWYeovHmreTE/9QTnYm
	 NS4ZIwBO8nwD8sD3QZ1Ywyrju9AOBYu8H2JU6RhUDZObKaEzZVF3wQM8B5rmQY6yv8
	 gBUCiJhyPntOiCUX93lc6p2Kc/vwMKgH84qf8Qe28jxUeRcMAO7wsZNizSuX8ltMFb
	 1yWxlPGxTXci/sunZ3jL6UuOMZkTU4JHl36A7q7ghsIAirUJFP//wXRkUXwAWl7YOT
	 ns8uNwXkdjR8g==
Date: Fri, 3 Apr 2026 08:05:39 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on
 OrangePi RV2
Message-ID: <20260403000539-GKB1016296@kernel.org>
References: <cover.1775148159.git.gaohan@iscas.ac.cn>
 <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>

Hi Han, 

On 00:54 Fri 03 Apr     , Han Gao wrote:
> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> OrangePi RV2 board.
> 
> The board utilizes a Genesys Logic GL3523 USB3.0 hub.
> 
> Define a 3.3v fixed voltage regulator for PCIe and enable PCIe and
> PHY-related Device Tree nodes for the OrangePi RV2.
> 
> Co-developed-by: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index a6de3753b876..c19952e70c31 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -23,6 +23,15 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie_vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	vcc_5v0: regulator-vcc-5v0 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc_5v0";
> @@ -42,6 +51,16 @@ vcc4v0: regulator-vcc4v0 {
>  		vin-supply = <&vcc_5v0>;
>  	};
>  
> +	vcc5v0_usb30: regulator-vcc5v0-usb30 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_usb30";
> +		enable-active-high;
> +		gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -54,6 +73,10 @@ led1 {
>  	};
>  };
>  
> +&combo_phy {
> +	status = "okay";
> +};
> +
>  &eth0 {
>  	phy-handle = <&rgmii0>;
>  	phy-mode = "rgmii-id";
> @@ -200,8 +223,65 @@ dldo6 {
>  	};
>  };
>  
> +&pcie1_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_3_cfg>;
> +	status = "okay";
> +};
> +
> +&pcie1_port {
> +	phys = <&pcie1_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +};
> +
> +&pcie1 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +	status = "okay";
> +};
> +
> +&pcie2_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2_4_cfg>;
> +	status = "okay";
> +};
> +
> +&pcie2_port {
> +	phys = <&pcie2_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +};
> +
> +&pcie2 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
>  	status = "okay";
>  };
> +
> +&usbphy2 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
Can you put vbus-supply here? see Chukun's patch
http://lore.kernel.org/r/20260402100007.110201-4-amadeus@jmu.edu.cn

> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <0x1>;
> +		peer-hub = <&hub_3_0>;
..
> +		vdd-supply = <&vcc5v0_usb30>;
I think the vdd is vcc_5v0, while vcc5v0_usb30 is the vbus, if we check
page 16 of RV2 schematics, GL3523-QFN75 (USB HUB)'s pin V5, VDDP directly
connect to VCC_5V0

> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb5e3,620";
> +		reg = <0x2>;
> +		peer-hub = <&hub_2_0>;
> +		vdd-supply = <&vcc5v0_usb30>;
> +	};
> +};
> -- 
> 2.47.3
> 
> 

-- 
Yixun Lan (dlan)
