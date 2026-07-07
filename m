Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702653911B8;
	Tue,  7 Jul 2026 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408513; cv=none; b=oNzl5KkANQ/uONIEqe2dqcl5WV355FpaxI6chrlI8t7Rt2iqYCdz1hWCu677LpZaeicd6CO+CdWoPDE04NKdwJk/tZz/cJvVedYdCJ7OaDWTBEie8euGY5dqxI3Hz5lZJt8rXUmRtfDKS1opw0RFYhctJIMeW2iChsntDO8dfy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408513; c=relaxed/simple;
	bh=lQlgbFQyD1TSYMke/jn5RX/4ww8ApKcJVyO6TEz4mZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsI6NR1qeM7Jyul5QPiudCZ1wUlMfDRwnMfQOu/Fh8255N30wRpheS2kn70Z9i/ZFEjP4I4/mIRQiVVAM8fuhgkyHePCVKhr0Eugzh8YLWf3f0v/h1sae9eNg74X1ZXnFmLivHNcxPb617PqADTWf0u8XpTGvE/qHIpTUf8hWMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSRfRR2K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSRfRR2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8631F000E9;
	Tue,  7 Jul 2026 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783408509;
	bh=nZOzo3G/dKhWUbfChSNS2hwZEX3JQBfP49agVDDkuv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dSRfRR2KD8lVWnWgidUwz4ESfAiEu9b+uSXhzCyG4JdmkhRdwWEhzdYF08HFRuNsI
	 c57S53rizD4+fT4xZNqgTlMaiSkVaRrzy3CEpKJJSgOswy0GIZ5DfW1dCjNJQa4TEH
	 kWODUtjSvc5TJaJIHsgUGyB5bgCtOtdZ25BPd0KCwjV8+cRuhAjmyrdAWw9aCO2Oyb
	 5nNu4NxJyqs3Z1ZTMrNAwFas36nWB2zbX6TWCoJmYm//JITeyI1wcrM/b+TTR/BnaL
	 LP8yXYVBr0W/Y9I0FXPFWVTyo69Vg9nv5p+gpij1iBKVlCHNHX9/NDmWqAXNbJd9EY
	 iHC5NlA237VSA==
Date: Tue, 7 Jul 2026 07:15:07 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <20260707071507-GKF35811@kernel.org>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608182358.170489-1-kernel@rembrandt.dev>

Hi Andrew,

On 20:23 Mon 08 Jun     , Andrew Rembrandt wrote:
> The "rgmii-id" PHY mode applies a symmetric 2ns internal delay in the
> PHY. On the Pico-ITX board this leaves insufficient TX timing margin and
> no ethernet traffic passes.
> 
So I think you are the only one who reporting this issue? My board works
fine with or without this patch, or is there any particular case that can
expose this? otherwise I'd say it's an individual board issue.

> Add a 400ps MAC-side TX internal delay on top of the PHY's delay to
> correct the TX clock/data skew. The value follows the vendor fork's
> asymmetric tuning (tx-phase 73 x 33.3ps - 2000ps ID ~= 400ps); the
> driver rounds tx-internal-delay-ps to the nearest supported step.
> 
But since the property copied from vendor, so I believe problem also
noticed in vendor's kernell which imply it do exist

> This builds on commit 3ea695eb111f ("dts: riscv: spacemit: k3: Fix I/O
> power settings"), which fixed the GMAC0 1.8V/3.3V I/O switch
> 
> Tested on Pico-ITX hardware with iperf3: 60s TCP each direction and 60s
> UDP, all at 1Gbps with no TX/RX errors on the interface.
> 
> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>

I'd plan to apply it for next tree (target v7.3), leave more time for people
to test, let me know if you're not OK with this? and for this patch

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..59aecaa2d32a 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -186,6 +186,7 @@ &eth0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
>  	phy-mode = "rgmii-id";
> +	tx-internal-delay-ps = <400>;
>  	phy-handle = <&phy0>;
>  	status = "okay";
>  
> -- 
> 2.54.0
> 

-- 
Yixun Lan (dlan)
