Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D36C2D375D
	for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768221; cv=none; b=uoXhqf1g3ffwNh4Rf7fJop6kJ6qsd6jNUKmUhWlfQEalli+DPkCiLR6z4cvT3HmXkqclD+ZyKIAZ2xLilWg4KStowbzbnMUqKaUep1O+W6ErchKE8H5dhJ/8nsEKhSshy+CKlPu6uKUPf9x/R9J8h2JRg4IbabgzYHPLKsRFOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768221; c=relaxed/simple;
	bh=ZFzgJhx4hn1G8tRLV0NFu2vvp6dXVo4Mk/gknDvLzS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qS775vCxaXhIgSa4qAphVJacN/1woSc2RSdVM2DHzYFBAduVFWyesfVUQbpF+p3sSKwI3u5Z/nggjv42OPHPhy3X87penMzlSongGJkU8mcecxH1qDf3DkiDpxsYQj2HaHY4wZagoTc5ZxPsm3vd/yieKEXGYVQMH2KrUyiQ7yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0CD3A340DED;
	Thu, 21 Aug 2025 09:23:28 +0000 (UTC)
Date: Thu, 21 Aug 2025 17:23:23 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Message-ID: <20250821092323-GYC1065530@gentoo>
References: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof, 

On 10:32 Thu 21 Aug     , Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/maxim,max31910.yaml  | 6 +++---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml          | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
..
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> index ec0232e72c71..83e0b2d14c9f 100644
> --- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -80,7 +80,7 @@ examples:
>      gpio@d4019000 {
>        compatible = "spacemit,k1-gpio";
>        reg = <0xd4019000 0x800>;
> -      clocks =<&ccu 9>, <&ccu 61>;
> +      clocks = <&ccu 9>, <&ccu 61>;
>        clock-names = "core", "bus";
>        gpio-controller;
>        #gpio-cells = <3>;
> -- 
> 2.48.1
> 

thanks, for spacemit,k1-gpio

Acked-by: Yixun Lan <dlan@gentoo.org>
-- 
Yixun Lan (dlan)
