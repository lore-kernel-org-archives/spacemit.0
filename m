Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25533D3331;
	Wed, 20 May 2026 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276230; cv=none; b=gnD7sujNcZoIpIiP1oRLIGvUoKaQGHx6Z+H5TC8Zcu1QNV9o2lJglHX+n8VVQId7yrWdzGcvrKBHa9/dHfk+DkpKEWNMUxn651RpaAWsL54NfqMywmvX0ScpqRyUjsgW5I3koI+Coi3GMastMJ0O7j2A4SWxIob7t8tWreKQfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276230; c=relaxed/simple;
	bh=FcLr23Bm1rLToAMfIGImG9PYCVguO6puYUqErf4qtPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1WEP3HdseY8aXzweQN5qILAyAT4l30wIqEJV3UFhPdmIhjwIQy7bTEWb28qDs8QGlqqalhWXhiPZ3K34OKp9Cm+vLj2aaoCcQLPOgmg3ETcpp5hH5Ke78O/MmQ3aLYKr1M6PZ8iYB/uAeDVrW1JhBLxttryQlslxjc62oiwMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVXipd3/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVXipd3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D444D1F000E9;
	Wed, 20 May 2026 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779276229;
	bh=wkNSjwILngGg4QbYdkWTNQlfqCaMiO9D/Tb+mr1JSl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVXipd3/q47+BWEW/jiq8yk1n4185mBOpzY+ug8klxJIPAjyIvy5idFrzdwCgCxOg
	 yju1rF64XfEatyF4kXI7rTGFEvkdymIkfXqxGhzAgjlngSRkeyWZBErEyzQxaRXv2n
	 Ppy0iWt97GgUCke2xGULSD1MegkoyWAeJafR1/jFAqUBE6Di0VduEfox41l9PIOwhm
	 gcUoJLmfCDXU0OOkt3uooesmxsJIgKCmmyOQ51le63+zefm+togA4mylBvXZBu3EX5
	 UvVCSEWGTDadJN/JERcT6K6DUECERHowWLni+v29kEw724Ek9M91YWCPkg6JrbpTDV
	 fGvIxAlMf3bLg==
Date: Wed, 20 May 2026 11:23:46 +0000
From: Yixun Lan <dlan@kernel.org>
To: Jennifer Berringer <jberring@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: set console baud rate on OrangePi
 RV2
Message-ID: <20260520112346-GKB3717228@kernel.org>
References: <20260520111150.3300707-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520111150.3300707-1-jberring@redhat.com>

Hi Jennifer, 

On 07:11 Wed 20 May     , Jennifer Berringer wrote:
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
> 
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7c49bce427f30..07dbd292eee33 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -22,7 +22,7 @@ aliases {
>  	};
>  
>  	chosen {
> -		stdout-path = "serial0";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	pcie_vcc3v3: regulator-pcie-vcc3v3 {
> 
> base-commit: e2518e8cb1dde64af2d1bb246639bb7ef7523f7a
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)
