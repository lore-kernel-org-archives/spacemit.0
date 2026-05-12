Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49F360EC1;
	Tue, 12 May 2026 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585957; cv=none; b=kk6KAe8r1JhYFJBcL1Y+sqrcU6F+ezhdWIAa3RgXi2LVqcOu4c9lrVmKmp44Uj/zbHuSoHL9bXpUG99S9nMbpPIti0KuQqd0qimCMK3Ieh21oCDimxU1pTSlDAZJXaDfyHWbnfmM2d/tQMHVIT8gHnN3SimjqiuVWJ//M2BVM0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585957; c=relaxed/simple;
	bh=kJdd4/vQ20oHpvv/vZ2fhCfv1fSDoI+846b9C3EMHBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxtPb6hpW+a0XyfF/LmMYh2xf2mIWDPPdruYHvjtCozJw3T+4XQxIy8jR1NC+5am1LrRx4PnB9K0BPTCgw8B5rULqp8DnjhmxUvrkaRa0XM7ffumZP4+coVbdBOQJJ/VMcFp+Zstp5FY559r6Jd7INzmS1tFh5KbWmbYQoAdDFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zz3HGQNK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zz3HGQNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533A2C2BCB0;
	Tue, 12 May 2026 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585956;
	bh=kJdd4/vQ20oHpvv/vZ2fhCfv1fSDoI+846b9C3EMHBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zz3HGQNKpHi5hjprhdZ5YJIEE9wOrIENApMoeCfoDzR++zXfvq9NDQyqrOTn2AEna
	 B0+JtISL9KM8B9CQjWTFxlmZeSYxIIHnrZ8ysFafhJCn8CUpRCjXD1ALc/W8fuLJKv
	 l/e9sKDXnJT0rlCGUM+dniBlgLzpQQ3WxQh9OLIOP8h/OOGKHGmKMFL4vVezEhWyNx
	 cHDp919m9a9zk7tcSaPZJ77YClrweEachGOl6rUxJR4biQmwYETheFLCDqj0NwgClU
	 Xsx0scIvB5CJUSR7RnSk4ljIZCT/dvG12ShQcBXqlXawuMTMJA+ac1nKNzMVLidTop
	 EOlvDRmopr5yg==
Date: Tue, 12 May 2026 11:39:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
Message-ID: <20260512113913-GKH3624147@kernel.org>
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-2-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511111116.1109643-2-a.heider@gmail.com>

Hi Andre,

On 13:11 Mon 11 May     , Andre Heider wrote:
> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
> for the board's power infrastructure and voltage regulation support.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>
> ---
>  .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 29e333b670cf0..88c35ad1ef2ae 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -17,6 +17,7 @@ / {
>  	aliases {
>  		ethernet0 = &eth0;
>  		serial0 = &uart0;
> +		i2c8 = &i2c8;
>  	};
>  
>  	chosen {
> @@ -33,6 +34,25 @@ led1 {
>  			default-state = "on";
>  		};
>  	};
> +
..
> +	reg_usb_vbus: regulator-usb-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USBVBUS";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
I think you can further drop above regulator, which merely serve as vin-supply 
and not used by devices, plus it's a non-controllable fixed regulator

> +
> +	reg_vcc_4v0: regulator-vcc-40v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC4V0";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_usb_vbus>;
> +	};
>  };
>  
>  &emmc {
> @@ -72,6 +92,130 @@ &pdma {
>  	status = "okay";
>  };
>  
> +&i2c8 {
> +	pinctrl-0 = <&i2c8_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
> +		vin1-supply = <&reg_vcc_4v0>;
> +		vin2-supply = <&reg_vcc_4v0>;
> +		vin3-supply = <&reg_vcc_4v0>;
> +		vin4-supply = <&reg_vcc_4v0>;
> +		vin5-supply = <&reg_vcc_4v0>;
> +		vin6-supply = <&reg_vcc_4v0>;
> +		aldoin-supply = <&reg_vcc_4v0>;
> +		dldoin1-supply = <&buck5>;
> +		dldoin2-supply = <&buck5>;
> +
> +		regulators {
> +			buck1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3450000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck2 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3450000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck3 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck5: buck5 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3450000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck6 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3450000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			aldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +			};
> +
> +			aldo2 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			aldo3 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			aldo4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			dldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +			};
> +
> +			dldo2 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			dldo3 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			dldo4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-always-on;
> +			};
> +
> +			dldo5 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			dldo6 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-always-on;
> +			};
> +
> +			dldo7 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-0 = <&uart0_2_cfg>;
>  	pinctrl-names = "default";
> -- 
> 2.53.0
> 
> 

-- 
Yixun Lan (dlan)
