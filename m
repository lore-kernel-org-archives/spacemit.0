Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522707;
	b=yWtAtP8q19MtiCSFCkn9L9QXZbe621s7tjxinJntLnzssidYBTWJniLbZzLx1KRVVg1/
	 EZDK+99wLJCvDRckWyK29gay/3VGdSIRKSUNPLjobsHKa/iWf+NHQBtDcr6wn1C8SyaJQ
	 qOwBKYNwM5yo9zcVyofCw0ukOm/87xojEH0lo8+T9ggsv/ui5wV2+BJDfQmCjrQNnNyWP
	 ruXfz80/yqBh41qwt0G2aGoAxGp/XIYJRVj+xJYPL8eV/Y14J1X+UluJUn+Sqm5gv24dt
	 SH+TnFXlp0AMP6uzW6CaQASRQfWrinqRA5/kDnQxiYlE5zjdFsEoL1y8pf8ShIuYNqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522707;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9DJ6K8UlN2WFYWzRF3rnpLOfRL53TWJIyKZUaCCPjo8=;
	b=MALyTlDSEwuNH1zrT7hhaFkZskLabLLqWy4WOJPommIySahHF6rpC9B8EnXYKFLvZcNZ
	 UnQoWXG+HCX68faOqeDzdYKIrrv9ghBu6SCtU7zaEcLl9hgOPfeu2u/Ii8EgPxskyg7vU
	 SllnwRIbUsQ+0DUQdwe8mygBjXUn0bGHkmHoMZ1fSrr8Kpy4o0+kVIvyIJMmuRFpTdh9j
	 EEc3siXF1UgyBkQTA4k6mxxWJel3ZiOziZaMX38hrEi5WY6FeJzxEufq0eayrXiGUEbej
	 +CSwIfo/0LN235Gkvlpf5HY2A3W/ImDPs5IzMC2oD5KBuJK9SpWwhwSas2rmh3PDv/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Nut/R6kb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4EB606A31E;
	Tue, 24 Nov 2026 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nut/R6kb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0D01F000C4;
	Tue, 24 Nov 2026 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522707;
	bh=9DJ6K8UlN2WFYWzRF3rnpLOfRL53TWJIyKZUaCCPjo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nut/R6kb4s+vaddUvD5f2DQzubzUDpMkWRsKtji7g+7nZ0SwtmxuNZtu7KK5qTmGI
	 xKnbmer6NDKDoA93/o/+hfpMveoJjLLtn7aIxQEKRIBYIpv9AnCTKjAotP2Ps1iAlH
	 JiZQZwOy9T6fiYQjUZF5CCnAfQnE5N8YOsMYVFgMjS1sLMqSUg/ykruN4ahNoIrI9F
	 84U1rhZnEyud7WtgGo3SVuvdwf4Cl6b5Zm6xI1reFsKzOKZpKi4WIznAetF3tAz5gw
	 4Fk3/62T+l7m+VTx5Ps0Tbk/CuPOs6jVPVEje5UmKUWxxpEPKprp/NA4TFeoJ/bnq5
	 YdK35nA/68hEA==
Date: Tue, 24 Nov 2026 12:18:23 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] riscv: dts: spacemit: k3-com260: Move SD card to the
 module
Message-ID: <20261124121823-GKL100890@kernel.org>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-2-138b39d74602@linux.spacemit.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-2-138b39d74602@linux.spacemit.com>

Hi Troy,

On 08:23 Thu 05 Nov     , Troy Mitchell wrote:
> The SD card slot, its power supply and the signal-voltage switching
> circuitry reside on the K3 CoM260 module. Describing the slot only in
> the IFX carrier board leaves other CoM260 carriers without this shared
> hardware description.
> 
> Move the SD controller configuration into the module include without
> changing its properties, so every carrier using the module inherits it.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 17 -----------------
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index 6e295bc6f196..38809d01df82 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -111,20 +111,3 @@ hub_3_0: hub@2 {
>  &usb3b_u2phy {
>  	status = "okay";
>  };
> -
> -&sdhci0 {
> -	pinctrl-names = "default","uhs";
> -	pinctrl-0 = <&mmc1_cfg>;
> -	pinctrl-1 = <&mmc1_uhs_cfg>;
> -	bus-width = <4>;
> -	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
> -	no-mmc;
> -	no-sdio;
> -	disable-wp;
> -	cap-sd-highspeed;
> -	vqmmc-supply = <&aldo1>;
> -	sd-uhs-sdr25;
> -	sd-uhs-sdr50;
> -	sd-uhs-sdr104;
> -	status = "okay";
> -};
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index 054bfff7413a..f2df797a2c80 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -233,6 +233,23 @@ phy1: ethernet-phy@1 {
>  	};
>  };
>  
> +&sdhci0 {
> +	pinctrl-names = "default","uhs";
> +	pinctrl-0 = <&mmc1_cfg>;
> +	pinctrl-1 = <&mmc1_uhs_cfg>;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vqmmc-supply = <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_0_cfg>;
> 
> -- 
> 2.56.0
> 

-- 
Yixun Lan (dlan)
