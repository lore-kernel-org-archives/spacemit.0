Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A8346A04
	for <spacemit@lists.linux.dev>; Thu, 12 Feb 2026 11:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895860; cv=pass; b=l4eowsu5vTCiFQo25+o8zEtMrWRLRetIAQkHQpGrasi5axfzXS577muxNHOKO/kWrEyhcfcW0dsNxfp5JnOBUJ602oYULzxmc75n1PmB/2vytTZJj7BDTQ5G0Kr/NbE41JvTHG7TXIRqPfAznr+xqLfV8F2yBN+0kEfgiPaWuZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895860; c=relaxed/simple;
	bh=msX9oUvwHOoLQ9XyqhCQ4CktiNmgooHVtVAmoHkfRk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsrFtEJS3y7LQ4XxoOIYCjU/sNKXfYkw2PXaN3ftHe/nmamaIBmfZRIfxyZfEIqEqllCc0Y6NTkLKXfKeaiFwuYPPHReSm0q/EZ6YBl/nGJZom1CzkRmMDW6h8Dc6B9UjXqQ7FAHs8wZw8HNq5rGBTsBpBaz5dzfBol+yDuHBTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=a+67Y4XZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="a+67Y4XZ"
ARC-Seal: i=1; a=rsa-sha256; t=1770895849; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HVKbNxgsmBVFEAlsnx8KyqWs619i3Xdcq0ugbutcRJ/rreEGuQ0r2AaPUgIuyUwgPJoMqAVkBpzHTZlUw3pstFFZvzSiN1RsNIeJ2LYzF3/YhysoUBJcMZWc4ejLweR6TPqcx0U2+s6pSJvjLPFNqpTplyR+BCtPdQR7I/maH2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770895849; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G8IqrDcbAUJ2cX6HzRhCxQ7mt8YTvz969YgV8457uCI=; 
	b=Qa8iUZMdmMHy46JsRB7124zN9TKnyctzdMBy7mUZlAJaO9P2xs2f6maFmYvxGsg1j33LgdsGTdMk3aXNGlrFPbkrBiZyFjpoz3d2Xgl34vxa/E538obsZ8p6fVF/abvUEFYYa3l+CyNjTGrKoouqN2lXbG4PrElhsk5zJ1H8+xo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770895849;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=G8IqrDcbAUJ2cX6HzRhCxQ7mt8YTvz969YgV8457uCI=;
	b=a+67Y4XZFbkUF+RtSrlNZsmMfBVoxBthDopV9txjtnmrV/K+c7SkrdMZ/gfKaQAZ
	BGuCxAtVEsopD4cAuzC/q1GiY9gM7bJclaG6/u+whWubwDZT3OgqDUuFiAPCXJGowd3
	xq+XJnSY5e60aOuAa+ZkORVX6YR+aPWIycgNmKaU=
Received: by mx.zohomail.com with SMTPS id 1770895846550396.2075278392381;
	Thu, 12 Feb 2026 03:30:46 -0800 (PST)
Date: Thu, 12 Feb 2026 11:30:39 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: k1-usb: k3: add USB2 PHY support
Message-ID: <aY253_fOkoQKbi8g@pie>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
 <20260212-11-k3-usb2-phy-v1-3-43578592405d@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-11-k3-usb2-phy-v1-3-43578592405d@kernel.org>
X-ZohoMailClient: External

On Thu, Feb 12, 2026 at 09:38:56AM +0800, Yixun Lan wrote:
> Add USB2 PHY support for SpacemiT K3 SoC.
> 
> Register layout of handling USB disconnect operation has been changed,
> So introducing a platform data to distinguish the different SoCs.

Would it be clearer and simpler if you define separate phy_ops for
k1 and k3, and point of_device_id.data directly to the corresponding
phy_ops? Then there's no need to introduce either spacemit_usb2phy_data
structure, or spacemit_usb2phy_disconnect wrapper.

Best regards,
Yao Zi

> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/phy/spacemit/phy-k1-usb2.c | 40 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 959bf79c7a72..b0ce0a92861e 100644
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
> @@ -74,10 +77,15 @@
>  
>  #define K1_USB2PHY_RESET_TIME_MS	50
>  
> +struct spacemit_usb2phy_data {
> +	int (*disconnect)(struct phy *phy, int port);
> +};
> +
>  struct spacemit_usb2phy {
>  	struct phy *phy;
>  	struct clk *clk;
>  	struct regmap *regmap_base;
> +	const struct spacemit_usb2phy_data *data;
>  };
>  
>  static const struct regmap_config phy_regmap_config = {
> @@ -145,7 +153,7 @@ static int spacemit_usb2phy_exit(struct phy *phy)
>  	return 0;
>  }
>  
> -static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +static int spacemit_k1_usb2phy_disconnect(struct phy *phy, int port)
>  {
>  	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
>  
> @@ -155,6 +163,23 @@ static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
>  	return 0;
>  }
>  
> +static int spacemit_k3_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(sphy->regmap_base, PHY_K3_HS_HOST_DISC,
> +					   PHY_K3_HS_HOST_DISC_CLR, PHY_K3_HS_HOST_DISC_CLR);
> +
> +	return 0;
> +}
> +
> +static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	return sphy->data->disconnect(phy, port);
> +}
> +
>  static const struct phy_ops spacemit_usb2phy_ops = {
>  	.init = spacemit_usb2phy_init,
>  	.exit = spacemit_usb2phy_exit,
> @@ -173,6 +198,8 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>  	if (!sphy)
>  		return -ENOMEM;
>  
> +	sphy->data = device_get_match_data(dev);
> +
>  	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
>  	if (IS_ERR(sphy->clk))
>  		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> @@ -195,8 +222,17 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +static const struct spacemit_usb2phy_data k1_usb2phy_data = {
> +	.disconnect = spacemit_k1_usb2phy_disconnect,
> +};
> +
> +static const struct spacemit_usb2phy_data k3_usb2phy_data = {
> +	.disconnect = spacemit_k3_usb2phy_disconnect,
> +};
> +
>  static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> -	{ .compatible = "spacemit,k1-usb2-phy", },
> +	{ .compatible = "spacemit,k1-usb2-phy", .data = &k1_usb2phy_data },
> +	{ .compatible = "spacemit,k3-usb2-phy", .data = &k3_usb2phy_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> 
> -- 
> 2.52.0
> 
> 
