Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1078E2EB847
	for <spacemit@lists.linux.dev>; Sat,  7 Feb 2026 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770465365; cv=none; b=qn8OyYx9B3qKP0nklBYqvl+YXbMdyAc8cC6Dt2VYsWHeadlcqNYt0W+tleuOJQrTvvfwg9TMAz1pXTQo+of5OaQA4kqkwF0tteFhJrFdNuSqjOFkRRjmhQ9qbBlTvTuV3+2g3IMIpRueCMKmGxl7Fi6JsZ4MD05v7l2gh60kg5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770465365; c=relaxed/simple;
	bh=dEZEZp9vse8p3Du+zcqRhHV6G00HQOUO06/CVBI95I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd44jrHNy7zb0T96wHE6s+hHWEAZ7UWGv4d2SrMERQqUoDUS1N1LuFf3qCDxyZfJJtMp8EFbpEUgPugtvPyanlIvWMJ7PKyVQvlvtZWrHPPVlKKKev6mx8GhGrtAOJILwvtjMFgtCKVv3np1LYk+oZZA9ZY5QP1OnWYWnUbXKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D436D341F0D;
	Sat, 07 Feb 2026 11:56:03 +0000 (UTC)
Date: Sat, 7 Feb 2026 19:55:51 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Ze Huang <huang.ze@linux.dev>, Rob Herring <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support to
 K1 USB2 PHY
Message-ID: <20260207115551-GYA130548@gentoo.org>
References: <20260206100009.873182-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206100009.873182-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 18:00 Fri 06 Feb     , Chukun Pan wrote:
> Add an optional phy-supply property to describe the regulator
> supplying for USB VBUS.
> 
No, the phy itself doesn't require regulator supply

We previously had a discussion about this, and I personally agree it 
should be handled at USB port level, see Ze's comment

https://lore.kernel.org/all/aWJAT3n_KcND8bOz@monica.localdomain/

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
> index 43eaca90d88c..74a1cd5bcdbe 100644
> --- a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
> @@ -19,6 +19,10 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  phy-supply:
> +    description:
> +      Phandle to a regulator that provides power to VBUS.
> +
>    "#phy-cells":
>      const: 0
>  
> -- 
> 2.34.1
> 

-- 
Yixun Lan (dlan)
