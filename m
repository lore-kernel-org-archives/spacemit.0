Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048C42B748;
	Fri, 27 Feb 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204388; cv=none; b=FLIFd44YbJca8ZmFHITxLWFut+7FvsxRu5lyWt66CKq0G/zmBj/REi7b0iTAyw2qQwBxLjtGr+r5po42kgokDQ1jjxHLrmIJc5D3qPtcejfMnwVF/zh5mGO3WLkdC+jmexDqVlTm8/2O92Irx+SUzrtfWVctIrh96FkXTK6ofiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204388; c=relaxed/simple;
	bh=MZa9xWLiumaplzcIo8ZJptqQvtOjLhpO8tJPSbBzWug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKeTXbngvOr7CaYgfJ4GZapwot1MxfOhuOBJNH873M0exku9dHTkSCYRazHjr+VtxkVeKFxp8l1IuyNUP953P2arqFv7CG/doBdysaxH563mU1NgfIv/Zf6UAWsJbKPH5CGwpc66KnGJdlgzGvdxQub23dWAMaH3rRsDrfVAyBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QL1/ckIe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QL1/ckIe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AD5C116C6;
	Fri, 27 Feb 2026 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772204387;
	bh=MZa9xWLiumaplzcIo8ZJptqQvtOjLhpO8tJPSbBzWug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QL1/ckIeUXLAKmiHGzBfhKJwkndP36tCWXnb5pplxYMTpN1cZNCETQIVmfto9G2ii
	 +cRsc+StQjLulD2ifCd+gtZijsMCJOBvKPgZsul21LjvCWu3/Ab79RqLekJ22E65a6
	 B+hWEV6QhJ21xMZPjK3+MDj0TD/9Iy8sIYIFqsXBE7pZtRftya1ElAJngc4eQnLPuO
	 9kTl6um+I7uyuaAdYsd94t4Sbic62Uj87k7gl4+reuKTllvOMpLfYcRWL5JvqvDMUQ
	 XHVxOxA8iD/aoqagR5l8hwsvXiQMoVRcqo2m+kvlOa9A/yu0q+5BgSYLgXi0xB2yf9
	 ql7iuT4JvW4aw==
Date: Fri, 27 Feb 2026 20:29:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: k1-usb: k3: add USB2 PHY support
Message-ID: <aaGxX_3FXjM1LT6y@vaman>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
 <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>

On 14-02-26, 20:29, Yixun Lan wrote:
> Add USB2 PHY support for SpacemiT K3 SoC.
> 
> Register layout of handling USB disconnect operation has been changed,
> So introducing a platform data to distinguish the different SoCs.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/phy/spacemit/phy-k1-usb2.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 959bf79c7a72..b4ba97481ddd 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -51,6 +51,9 @@
>  #define PHY_K1_HS_HOST_DISC		0x40
>  #define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
>  
> +#define PHY_K3_HS_HOST_DISC		0x20
> +#define  PHY_K3_HS_HOST_DISC_CLR		BIT(8)
> +
>  #define PHY_PLL_DIV_CFG			0x98
>  #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
>  #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> @@ -145,7 +148,7 @@ static int spacemit_usb2phy_exit(struct phy *phy)
>  	return 0;
>  }
>  
> -static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +static int spacemit_k1_usb2phy_disconnect(struct phy *phy, int port)
>  {
>  	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
>  
> @@ -155,10 +158,27 @@ static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
>  	return 0;
>  }
>  
> -static const struct phy_ops spacemit_usb2phy_ops = {
> +static int spacemit_k3_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(sphy->regmap_base, PHY_K3_HS_HOST_DISC,
> +					   PHY_K3_HS_HOST_DISC_CLR, PHY_K3_HS_HOST_DISC_CLR);

Please match this with preceding open parenthesis

-- 
~Vinod
