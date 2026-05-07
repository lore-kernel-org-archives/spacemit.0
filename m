Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFD440DFB9;
	Thu,  7 May 2026 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778121927; cv=none; b=jL5GIhMDC+vTcWIi//WcHNsMPWS1j7pGHDqiviojoqB7vjlcvNye04UtNP6ROYfYxaugzG0cz0VddoBXpI6JhIbTmDYxPS8l+o+g39P84/DSGEaZgHD2mP31rD+HShcejioajdug2UC++9wnJdxcy+Nb4QRHl/ap8Jne5Ijtoo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778121927; c=relaxed/simple;
	bh=GVDgyNBjLVJtO0PjEWdPQZ+br1pnpWOGwCkKrGbMVKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0Aa9qvveFs0V9y3Wa/IEBCI9CnwXVAmKqIWe9kBMr4FhqVFgwF/K6pMfo6vi8jGMjbjUFWmqHonbBwlPW3Vd9mIkhL+NTaCFRMPA+ciuSB8StrZAPCVckszqnp6Ctz4MU2L4e8XsQ6I2y0sxm1BSEHm4HzqHqaqzYJnaKEFrbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qpj1qYcr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qpj1qYcr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E609CC2BCB0;
	Thu,  7 May 2026 02:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778121927;
	bh=GVDgyNBjLVJtO0PjEWdPQZ+br1pnpWOGwCkKrGbMVKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qpj1qYcrB2K6aLv1IaeZuNOwPCUdI+3QGKr40V78B/F3Nl90L20lL3c3Aa6ViiCxm
	 zpSZl9i4y5RsNk2dnVmrzlb0+2o2rQgyr58CEYhwizs5YUL15KfkQCEUyGVScjLrdy
	 naDPsrm67kPdWXE0BrEvbefGTDoQaQdhD1tnMBHk4XRV4unHxDD3ALSbb7G+VT4wtd
	 WkNwusG5+NN+trr0hYEH1g9URbJb1iGbc4E21AbRrBF4Eu2oUEXpKhPszLF8tT3ilz
	 oUhcjLj9pzn9fP3aGM30K5QG8RwC7iLAtbYPKr8/hxv6BO6aaBSEnLofKASeIRpy+3
	 TO36e5KAClafw==
Date: Thu, 7 May 2026 02:45:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
Message-ID: <20260507024524-GKA3579608@kernel.org>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
 <20260502051906.8160-2-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502051906.8160-2-linux.amoon@gmail.com>

Hi Anand,

On 10:48 Sat 02 May     , Anand Moon wrote:
> Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> DC input. As per the schematics, vcc5v0_sys is the input power source
> for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> to correctly reference vcc5v0_sys as their parent (vin-supply).
> 
> Cc: Han Gao <gaohan@iscas.ac.cn>
> Cc: Ze Huang <huang.ze@linux.dev>
> Cc: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5790d927b93d..9727ecdd9f6b 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
>  		regulator-always-on;
>  	};
>  
> +	reg_vcc5v0_sys: regulator-vcc5v0-sys {
This will fall into the catogery of "non-controllable & serve no devices"
see similar comment for 'reg_dc_in' which raised by Krzysztof

https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/

or should I ask, what's the real problem if regulator has no vin-supply?
Any probe failure or something bad happen? (besides /sys/../regulator_summay)

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};
> +
>  	reg_vcc_4v: regulator-vcc-4v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc_4v";
> @@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
>  		regulator-always-on;
> +		vin-supply = <&reg_vcc5v0_sys>;
>  		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> @@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
>  		regulator-name = "USB30_HUB";
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&reg_vcc5v0_sys>;
>  		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> -- 
> 2.50.1
> 

-- 
Yixun Lan (dlan)
