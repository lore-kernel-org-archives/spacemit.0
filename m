Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB561A3165;
	Sat,  9 May 2026 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328449; cv=none; b=r4smNHstf4HAdp4phddOdCfE36kdzLDWX1X1ple9XsrT6e3GGhN6vzD/it/zBXHfgMXgD/5/w5Db33MGF+xUio88mFGx4pKwcBf2aqSfHu7MKOKfqARdSpaiQPLJNc8P7dlmBCzSUce5RmCO0g65fmK3Gj+TyJ99PhyilfgnjX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328449; c=relaxed/simple;
	bh=+OOyDX3IQBKlPPnum+OZiZP/b9YGU/MTfJLeZadekkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiVDbjHzAWhA8HkgONOkTJRowCadIdVO3hqwARAndz+ADFuMH/FOMz4rIlmJjVGhQh36W5komkagVOvOkcx5B/4BVfCnjhQwhkAIl06+MV3aLIql1QxlsyM8OKP1ShYKxyL/Zz70e4dx4YlslwahNJpyv5GR7iWhS/Gnfwvno+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJULz4BD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJULz4BD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FB6C2BCB2;
	Sat,  9 May 2026 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778328448;
	bh=+OOyDX3IQBKlPPnum+OZiZP/b9YGU/MTfJLeZadekkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJULz4BDAIAcuxRXUQ84SFU7F4fQNpTThsNVgLwNgZckeaod6u9/Ng6JiBb80VNLr
	 y9vbMuBv2C1wTXozl0UHEx+TZVG/Dm4i1wxQlLXXhiFRwz95XRUaFIShavsqvirD4H
	 PmsOmXyo3gGTv24sLHUOpsIuqou85IzYSSM84ps7Tr5MumkIVrY6RCbBReznpsrtTM
	 2lvaF8s0bVYrdAqpYrhrtD6D0x96Q/hYBDoK2ozNfI77xTINXD8h2sw13ANVTWXnug
	 xQZ1GBVjWMjr0TTSUyZcmaN+Kv5+1387YuEeNjmsQQ/QQuwqYEOAXR/poCE1x0kYi6
	 nnm0C7HxCdmOA==
Date: Sat, 9 May 2026 12:07:26 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable eMMC for OrangePi RV2
Message-ID: <20260509120726-GKA3601591@kernel.org>
References: <20260509100000.3315109-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509100000.3315109-1-amadeus@jmu.edu.cn>

Hi Chukun, 

On 18:00 Sat 09 May     , Chukun Pan wrote:
> The OrangePi RV2 board has one eMMC slot, so enable eMMC.
> Tested using a 16 GiB AJTD4R eMMC module.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 3a829e3c9cbc..c95ca38e3d4a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -78,6 +78,16 @@ &combo_phy {
>  	status = "okay";
>  };
>  
> +&emmc {
> +	bus-width = <8>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
>  &eth0 {
>  	phy-handle = <&rgmii0>;
>  	phy-mode = "rgmii-id";
> -- 
> 2.34.1
> 
> 

-- 
Yixun Lan (dlan)
