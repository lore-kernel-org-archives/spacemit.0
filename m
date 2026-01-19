Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7E41FC7
	for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 03:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791777; cv=none; b=agxhbaIj6Mn0ByULNVJN/13A0A5Z0Ku0QWzplkqC7CkawMPlQ05u777dA4uiAbX/hCVcx0nDKHPwV2Hd6oJLDAmjKPuqt/rC88Xuct5TiRsKXuBMpsa+jW+BwO1aDfIx7XNzqBJDDSTI5ME0DHorIWO3/W3EJRCR6qXwBZUw1Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791777; c=relaxed/simple;
	bh=iI1aIeduAmNsa/YHJf1fIzQY3U9gF7mFBl2eRFjafRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5NcgyoqtKljSpRbt3Ah5JIJ5NYnNOncMHhiOc6PioK6ckPSm4g4PoiTfLT94+v7fnXiy/K65+WlGgwf9BhEXYPgPjVNmHzwN2VRQEvZZHyubrc3Ia1kInCDctmex2uvMhxMWE7185sh2fo8f8AYOWUilMDXB+jwl2ZdokQjpB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7F6FD340E06;
	Mon, 19 Jan 2026 03:02:55 +0000 (UTC)
Date: Mon, 19 Jan 2026 11:02:51 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add fixed regulators for
 OrangePi
Message-ID: <20260119030251-GYD47382@gentoo.org>
References: <20260116100001.208334-1-amadeus@jmu.edu.cn>
 <20260116100001.208334-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116100001.208334-2-amadeus@jmu.edu.cn>

Hi Chukun, 

On 18:00 Fri 16 Jan     , Chukun Pan wrote:
> Define the power input and the 4V / 3.3V power as fixed regulator
> supplies for the PMIC, PCIe and Wi-Fi.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
> index b4808f258adf..c71c5bc1d341 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
> @@ -17,6 +17,34 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0";
>  	};
> +
> +	pcie_vcc3v3: regulator-pcie-vcc3v3 {
can you follow the same name scheme with k1-bananapi-f3.dts?

also please add this regulator with explict consumer - pcie,
otherwise I see the patch isn't really useful

> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie_vcc3v3";
> +		regulator-always-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
> +
> +	vcc_5v0: regulator-vcc-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	vcc4v0: regulator-vcc4v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc4v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
>  };
>  
>  &eth0 {
> -- 
> 2.25.1
> 

-- 
Yixun Lan (dlan)
