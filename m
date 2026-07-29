Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979225D215;
	Wed, 29 Jul 2026 01:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289010; cv=none; b=ltHTATJCYwNIvtgMPWxWXX6jCA7qKOIp4bqjRmhA1+lDC2Ad3pNG+zyPuPqkOXD94/CGZpIedZjac0Xmg9udIDR8sqWXISOhjzDmjViN4Z8IjKpMeORvTd+r8EWItkwkFDYi7m5LBmCdA3YbFFut7CuwJf9nMfdCuyAWoubaOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289010; c=relaxed/simple;
	bh=k7h5mLc5JslXE42ePXmuJJNhh072N2nkOSS+OfUx9Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7rScOD2/Q3n/NsNgfZah3o+B/HbubM1YooNiF3Q6A+NRWKKb8tKfPA0cxrL72GnihXTG595PY+oX4nu9DtuXdZQSrWQHYRKN35NBfWgrvb+EncZO++OxzurAxkts7cpUcztqJD9NDjay5BvE5wcFMDu/BA13vHRNvjFTh+uGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlUi7un3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlUi7un3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105161F00A3A;
	Wed, 29 Jul 2026 01:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785289009;
	bh=qaJm4qDKQQDU8NT8cvf7AVcZ8BzpBKeOCQbL6WvFTuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JlUi7un3Wcd0nOutnCztacnQ1Da4uRwhr7ftz8m/FwFcNH1Fs7/93Ug6/et8Hd2RU
	 AZQfVSW23xOc1ge9TfnR0+fxO/Qx7L5IEyX470Pn7Roz5DoKu7Csa6nWbbJZT3mfnx
	 ExV71b/EesWJflEuWciybqAioD6SECZMgk6+TPMDDxDaydDnyGzVv+Nypc/kpLnGx4
	 PL4qMu5oGN9mFYVHwRdcyoD1IYwoeIIGIttyRsTF07ryAL3N7u5uBPFWZYN1zh7fUT
	 NR4B2RRCfFTExr+Up+g46GMYWGnYRdpvQGSW8LBtYsH4FIo23aqvXmV6uYXowTZr74
	 Sm7fu+5frEtlw==
Date: Wed, 29 Jul 2026 01:36:45 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Make dtschema recognize the
 etherent PHY correctly on K3 pico-itx board
Message-ID: <20260729013645-GKD77474@kernel.org>
References: <20260729012418.154652-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729012418.154652-1-inochiama@gmail.com>

Hi Inochi,
 lacking cover letter, although it's not a really big problem..

On 09:24 Wed 29 Jul     , Inochi Amaoto wrote:
> Since the previous commit does not change the phy node name,
> the dtschema can not recognize the type of the ethernet phy,
> so the following error is produced:
> 
> /arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> /arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 're
> set-deassert-us', 'reset-gpios' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> 
> Change the nodename to make the dtschema can recognize the right
> PHY type.
> 
> Fixes: 6d6536c880fe ("riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Looks good, thanks for the fix

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index d78416f3118e..e91a4712f2db 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -195,7 +195,7 @@ &eth0 {
>  	status = "okay";
>  
>  	mdio {
> -		phy0: phy@1 {
> +		phy0: ethernet-phy@1 {
>  			compatible = "ethernet-phy-id001c.c916";
>  			reg = <1>;
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)
