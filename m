Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABF58C1F;
	Fri, 13 Mar 2026 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773360388; cv=none; b=FBZ0WThOORsQEpU6ftmskebI0MWyQlVTzkNvpKrtbxoxvrG8MVOFqKBEQ5LRt1yydcCS7lkSCfdMxpFwyvSadGaOieUp3fPcBSJ0fXYQiwongEtvAVxf/reyONPAipaIM8oUu1Mg1vv3lQQ5eOhIhceeq+WFW40RzqkbKgjClHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773360388; c=relaxed/simple;
	bh=ADruU6Qu0lyTOOBhcf4gScXwICP2AoS82nL0uCZVEiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlK6fRvIJPKeLSS1pr/CWN1lQh+FEbAfmXuXsNU8hQHsCtQ3viGK8NAg7QVRwthOt8sh0pPCy9eem1A3iz5XtlhwxgOS9kx8d7reQYHwPtAyzMJzG+elIHHxEepRTc32+149KDFOP/feSjI4Gs9h9BJXEPpOkX2JxkiGKbhS5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLiCTbuI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLiCTbuI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59ABC19424;
	Fri, 13 Mar 2026 00:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773360388;
	bh=ADruU6Qu0lyTOOBhcf4gScXwICP2AoS82nL0uCZVEiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLiCTbuIcfSCLyQtk52o9rUKoG3xJXGHmOUwJGzEmgjajwdkwVlhH22xbMzFnxQ9z
	 xbECItjLHUzqR8lNGCrxgrZxVnGDoX/1whKg2+Cb9axF5pnMLuPJ5Fs54jyE4pImMD
	 KMBEhLtnuDWVDboXE0S1BjXcAF8WtThK39ASceE6ZEtBFIfss6wuCf7d+yoeGL9D/m
	 fJBkAiHiylPIfDyRpJ2NUxTyJPzYnBGBMDyq9nCZ/fk2mN1PovkYCuoJVEyl0H2imz
	 lGO1NbmkuVhQubvKM1wg4iR7MAtdHfd4SBKCn6pj2C1tv4L5t3ZJTy2OMb7iTDw6/W
	 9tG/xaAuAECjQ==
Date: Fri, 13 Mar 2026 08:06:25 +0800
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
Message-ID: <20260313000625-GKI302167@kernel.org>
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
As Trevor pointed out in another thread[1], rv2 use 5v type-c in,
and I bet this is a copy-and-paste error..

And for name I'd suggest to simply use: regulator-vcc-in-5v

Link: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com [1]

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
> 

-- 
Yixun Lan (dlan)
