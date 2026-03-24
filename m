Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DC21DC985;
	Tue, 24 Mar 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342945; cv=none; b=SDsnoqvS+FxrMRFq1o5EF/h5kQEadeNfNIDPXWEQ3nX4eSZQDgcnBLmclUeFahmwasnx++p6b+cmLjmSg3M/ueQ8sqIMrZ8sW8PqfRFF/3YXvX2Y1So3tYc+EoGwEpcgZwl3I7P+QvwJf7UxjZ2ycRYy6/bXzNb6SbOsxU9Lfj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342945; c=relaxed/simple;
	bh=gfQBMPeoX7S6iuyUT/yJJOwsqJIPItQmTlz9liVZE/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIwQguufaS2ordMWPGQadVLvkCeAEeBjIHEcbWtKcUfT1Hbtptveso1anb/vNHCEMD0ZSN2W9heq7HXATkOhGd6BqFa3vSR5aFYoF9HVNEM/jAJ7PjckDNwHuip2lyiVTRG3hH/qAr+GiUZlh4PVOY3kZ1fa2wAineIEh8gnjH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkmhxkT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkmhxkT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5EFC2BC9E;
	Tue, 24 Mar 2026 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774342944;
	bh=gfQBMPeoX7S6iuyUT/yJJOwsqJIPItQmTlz9liVZE/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkmhxkT/AUfREdS7sbFT32yhFqr8AFFHJiPDTHp1nZBM4Sx/rdHPk1xbfJbUJ7BQz
	 Ng0C+2y6SyZc/a3/lX67/gM746c0qDqGeyJldtmowAda7W8UKb0YDIyNMqDF8LLOZ4
	 8Fss1p0RNHn3+yHAUZo64y0x8AOLAliPMf9TMOmZx1NuCYET5VcCyXnwiOz1vRFGHK
	 l0m3AzY0hzzgeDeGZ2L76D12ZUkdgxbC+vmumK3OdR39z3NZd1/GihSLAnricOf9Ja
	 jWv9T2YjXuYYUhWBqfNgBe+b794PTFDXS1vZQ9ulD9Uv1XYWnCe958IszTpCJcPnrC
	 9IZXtS1nXXhDA==
Date: Tue, 24 Mar 2026 17:02:20 +0800
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on
 Milk-V Jupiter
Message-ID: <20260324090220-GKA739629@kernel.org>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322203356.2206927-5-aurelien@aurel32.net>

Hi Aurelien,

On 21:28 Sun 22 Mar     , Aurelien Jarno wrote:
> Add the QSPI controller node for the Milk-V Jupiter board and describe
> the attached SPI NOR flash (GD25Q64E).
> 
> The flash supports a frequency up to 133MHz (80 MHz for reads), and the
> SoC supports a frequency up to 104 MHz. However tests have shown that
> the flash is not reliably detected above 26.5 MHz, consistent with
> frequency used in the vendor kernel. Therefore, use this frequency.
> 
..
> The m25p,fast-read properties is taken from the vendor kernel.
> 
So long as this is verified and works fine on board?

> Add a corresponding flash partition layout, matching the layout and the
> names used in the vendor U-Boot.
> 
..
> Also add the bootph-pre-ram property to make the device tree usable by
> early firmware/bootloaders without modification, as U-Boot is stored on
> this NOR flash.
Is the dtb file actually used by U-Boot? I'd highly doubt about this,
if not the case or has not been tested, I'd suggest then not to add
this property..

> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 44 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 836311c3f035c..05ab5df50be51 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -173,7 +173,7 @@ buck3_1v8: buck3 {
>  				regulator-always-on;
>  			};
>  
> -			buck4 {
> +			buck4_3v3: buck4 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-ramp-delay = <5000>;
> @@ -256,6 +256,48 @@ dldo7 {
>  	};
>  };
>  
> +&qspi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qspi_cfg>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <26500000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
> +		m25p,fast-read;
> +		bootph-pre-ram;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			bootinfo@0 {
> +				reg = <0x0 0x10000>;
> +			};
> +			private@10000 {
> +				reg = <0x10000 0x10000>;
> +			};
> +			fsbl@20000 {
> +				reg = <0x20000 0x40000>;
> +			};
> +			env@60000 {
> +				reg = <0x60000 0x10000>;
> +			};
> +			opensbi@70000 {
> +				reg = <0x70000 0x30000>;
> +			};
> +			uboot@a00000 {
> +				reg = <0xa0000 0x760000>;
> +			};
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)
