Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774851DF73C;
	Wed,  1 Apr 2026 04:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775016262; cv=none; b=X49E6VyP72qWR08JpZ2gEo15nqEXX76erFJvDG0oP/uPU3F6RWcjvC4beUlArMPvSYAUkAWdKNq4Dn+XHdvu87rmayvxcbbPtxeV7Ds7+nXi51AE8Owlq2+IxlTlO37n2RUm8S+hI1quQwHHjQEy9DFuFQ93hB49oYYcoxdpai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775016262; c=relaxed/simple;
	bh=ScayOH1vtYXF2K7sunI/tM6mb4FVHyGKqqVATORwRxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj2VM2zTydxtk3hCmqn1OKrJ5Z1b8E02KW2O/hcFhN3P2Je24R3p/112TZAVQ+Ztm2EZoOO5VH69PCUyZiXUWuMRL3kh3PM6rSwOers/glcaKZDR3C2F7ysY2vyzYQbBkTHvp+xNKyERJ+gYpkQdUtSI4dUa+vhzndPpFDQbLUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCeq2Mai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCeq2Mai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25A4C4CEF7;
	Wed,  1 Apr 2026 04:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775016262;
	bh=ScayOH1vtYXF2K7sunI/tM6mb4FVHyGKqqVATORwRxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCeq2Mai12RS1qTR9GvoeNmKuwmzoWUAPCrGXdkVBqc4lIsSDEZMczQyFQpPHSP7y
	 FlMIcvuNkrRphHe4Rt4cEZY/xlHLTa7OSfQFDhBgQ3aRbickkqOk19dpXVwqDmf5MM
	 6u2K2CDWSa+f6quD3wbRDm1JqmGRC+LlOSvS+gckSe+xMkRBQ/XWNzntlii90YUmj+
	 HEdJOy95SMpksOuKLVq1LisKAZ2ByjVZlSPbLpQ3vuxDLhddKI2BDUQI8OsNLPQ8Oi
	 IppT7OyI/TYBDiz5l73wssioFc/UwFpkXWeLhifsQ/0k/CmfAZJVuWAvWiPevd9ESy
	 yFe3pQyZCjItQ==
Date: Wed, 1 Apr 2026 12:04:19 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on
 OrangePi RV2
Message-ID: <20260401040419-GKC976850@kernel.org>
References: <cover.1774974017.git.gaohan@iscas.ac.cn>
 <0ec229e2fb138092672773f134d0739e70740ce0.1774974017.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec229e2fb138092672773f134d0739e70740ce0.1774974017.git.gaohan@iscas.ac.cn>

Hi Han,

On 00:27 Wed 01 Apr     , Han Gao wrote:
> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> OrangePi RV2 board.
> 
> The board utilizes a Genesys Logic GL3523 USB3.0 hub.
> 
> Define a 3.3v fixed voltage regulator for PCIe and enable PCIe and
> PHY-related Device Tree nodes for the OrangePi RV2.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index e5e358d49c09..e93e7f660820 100644
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

I've noticed you dropped usb3_hub_5v which actually provide vbus supply..
so in current version, it will leave vbus as undetermined state - whether
vbus is on or not will depend on bootloader to enable it or not?

The best choice would be waiting for Marco's onboard-dev vbus patch[1],
while in K1 platform, we workaround it by force enabling vbus after power on
(set regulator as always-on)..

Link: https://lore.kernel.org/all/20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de/ [1]

>  	reg_vcc_4v: regulator-vcc-4v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc4v0";
> @@ -44,6 +53,10 @@ led1 {
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
> @@ -190,8 +203,63 @@ dldo6 {
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
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <0x1>;
> +		peer-hub = <&hub_3_0>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb5e3,620";
> +		reg = <0x2>;
> +		peer-hub = <&hub_2_0>;
Can you confirm all usb ports work fine with this?

> +	};
> +};
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)
