Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B919EED3;
	Fri, 13 Mar 2026 00:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773361843; cv=none; b=EmAafrr/0hRyhEagZILHb1YdWR0LAUz/p1eLNnQCg4N9hZ2uBUPN9hzqsxwjBw7ecffFhcrgmIFWT8CU6ADim+S3nRaGr00vKph2vrrZvwGDBY9pNHPHdOIkWIzTQCgPvis3OjDjXtvvePSOln4r3THS5uEXG1XJD4Gp9wqFPFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773361843; c=relaxed/simple;
	bh=yufSPKe+3LIlfMb2dw1jvZN41wg6MKFMPyYCOzToFtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+uStb+BAj0+1V9c9rhAQad1g8s6WHUDOv0czXoi4zAtBK/bA/r/TIYPtXSPVDX7vuvvy63bKP9D1pDYGUVacdVJCO1lOY/Twcet6JtNQW6fTdwfpkTWZDyQpuv8TNykBqPuCvvCKCG0dqexLi21QmdXF32JNDybi7A3vrhSf2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKgBE4nE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKgBE4nE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869AFC19424;
	Fri, 13 Mar 2026 00:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773361842;
	bh=yufSPKe+3LIlfMb2dw1jvZN41wg6MKFMPyYCOzToFtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKgBE4nEadicyq9IVOKkobZgY4RSEMNfkKt88A9EjtxBOG+K2zZ5IbpwNVo6dXDTJ
	 cOtQIxWCEkrK3MWFxcZAfaqg6riJQLmri9Ytl/OvOCtS78WrfsyPAg4BS1bHtyOAHU
	 5qWH1rC3ni5MPniGi5thcPqIbcU8aTog1DR8GZ1AQ9m4nGsqugUkLduneH0Z+SxG0k
	 W8cPoB6LFnBtfjCiNm/cNflA2Jfh8AapdeHRH5vqE2IN/RcNLoh8vHSwcSEwM+DxLp
	 9mXggc9sIeB834d1gDduhK/EcSCbjmKxSLAQ8v/OOeL0Rr8P3T3LMc61NzLGMRp/gR
	 IUTlvjlt/Dc4w==
Date: Fri, 13 Mar 2026 08:30:40 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: Define fixed regulators for
 OrangePi RV2
Message-ID: <20260313003040-GKK302167@kernel.org>
References: <20260310161853.3900605-1-gaohan@iscas.ac.cn>
 <20260310161853.3900605-3-gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310161853.3900605-3-gaohan@iscas.ac.cn>

Hi Han,

I'd suggest to squash this one with patch 3 which it isn't necessary to
split the series into too fine pieces..

On 00:18 Wed 11 Mar     , Han Gao wrote:
> Define the DC power input and the 4v power as fixed regulator supplies.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 93880ba7bdfe..55b3d8d7f7f1 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -23,6 +23,25 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	reg_dc_in: regulator-dc-in-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_vcc_4v: regulator-vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)
