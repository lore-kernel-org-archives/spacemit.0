Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641222301;
	Sat,  7 Feb 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770461293; cv=none; b=J8/vtgDHuJoZlm/4bh6pAv6Cp3tQb71jkBVB4Fpaxb6+LQHYiIFf6+42kc6EtVlBQIL2bcSYmvBa5wuYWj6DyS75Hkh/u0VYkjX/sU8h9AmXBK+Rpsn5Mc1ZSmYwmbNAxbd+9SOR1uM1AVrXawx/zxexPec5XRm90fHzY91ZW+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770461293; c=relaxed/simple;
	bh=xeIkHvV7X3pvMez0kiFePRC11Tm26GnXlWP39PuhWhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wcsw2msolz1RkBAz7EnYFC2sUBckb323cS9J3WeqasQ1CF3GY53VQgL+tRuCb8At/irUjaucAxzpK+2LYtAPiWhVLJ+1AUtPDkt5v0G5ZJD9GEp3pcyzSndu6z69MBeepLNfFrWwz77dHe5w+ae5VZavwUgWxAQAq7i9NttM4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksVO1Ftu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksVO1Ftu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC80BC116D0;
	Sat,  7 Feb 2026 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770461293;
	bh=xeIkHvV7X3pvMez0kiFePRC11Tm26GnXlWP39PuhWhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksVO1FtuUTzaYWMGPzjhuSXulWE/KIuHT5l//UyeYCcEqsbaOcoXazouqbnND68zk
	 j9U+sFfkbvvZN+eZlB6DNu0JrC5vKVK37hlGPW14EZEKjmwdpkk2seElekYswT6ZbI
	 JGbmoxU1vNU0xscvmrIDGby7LIN7yQjwUz0LwMxV6YdLUlCReQU9nmAWuSSxmXDXOH
	 3Iq7dQBz+FlWE9yBO6WsUT4PyE4OzBFXLBOMpKJMFbIhJmjHg1ypYpvmdjfU7AuKU/
	 lt5CFqR+ho3L1sZ4yzABCumZkEGbbjS2bYbEPyG7DCwfv7870p16qBfL30HtMS00qe
	 w9udnIWkQDllA==
Date: Sat, 7 Feb 2026 11:48:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Ze Huang <huang.ze@linux.dev>, Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support to
 K1 USB2 PHY
Message-ID: <20260207-dancing-finch-of-chemistry-f98cf2@quoll>
References: <20260206100009.873182-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206100009.873182-1-amadeus@jmu.edu.cn>

On Fri, Feb 06, 2026 at 06:00:08PM +0800, Chukun Pan wrote:
> Add an optional phy-supply property to describe the regulator
> supplying for USB VBUS.

Why wasn't it there before? USB did not have VBUS?

Explanation is so incomplete I suspect you are patching broken things,
so as well this could be completely different hardware (e.g. there is no
regulator for this block but e.g. connector).


> 
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

Drop redundant part. This cannot be anything else than phandle and
regulator.

"VBUS power supply" for example. But anyway, I don't have certainty that
this is correct hardware representation. It's your task to provide that.

Best regards,
Krzysztof

