Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD16B38B14C;
	Fri, 10 Jul 2026 22:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723087; cv=none; b=HaAbEZqkVzgTRLV2isFZfq+F09u7VOt0lUP/MNWGcCeHR5SfnHxzduuySPO8RDD2q4nLnT60wEAwdRJmpoabXassaWOaMhWY4Y2AZSyfhW0mFqJHOMySethjpNBKoIzi67QDD8zQfky++YRLjbE1mmiT5RW1V+phHQ5MpF7ruks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723087; c=relaxed/simple;
	bh=7b0NIkg4OihOje4ZoDPCnvCV2al+ViV5aAMGOUa7964=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKhsHgLz6RF5qJKQkf/zhf1QyPNtqCPLG0R5gt5wJLChgtzNVYwp3JVy4zle6Ky7SA4O5us4zWXvWCU2LuOcy+ncDDyknjdHytowVRxU8WAZWTFZK46DeYrBiCN/rMoS/lebMRzt4VTm54u6oZcLlNTBciny+AGSCroM7/0irYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tnws5BCV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tnws5BCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE27C1F000E9;
	Fri, 10 Jul 2026 22:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783723086;
	bh=bT+lBDZmy3qgOlVkIU92FEFu8S6OCaCVxq9KDzjctNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tnws5BCVipZU6j4wfdKOwN1lJ2RzRfJatEeoUES8MFfCI12PozQCI7bF6Crly5qLw
	 0tUGqWfTbOIzA638RAq8Qb7UcUZWQ+g0W3j4uUo91ObrhoPcK4i/vb7fRqcVkseCm1
	 Dx5tKdSe/YeJlAYfTt2vgSvZJ73Qa158aWWwgAAFzZsp9R7W+NRvQ4OjMIAVsWP0xh
	 jdXPIxBFDcfyDi9gZ4F7C4Q8i1OGwF3+GIX2N5+ghGxnglmPljWqNGLCMin7jTi5bx
	 69FTM9oScvgEdqQGgvbI4iA14V/1L+InmA+LXvBCmA/Rl7Nd1/YS1wQLQeCN8LFEhi
	 eSW0guh4SZU/Q==
Date: Fri, 10 Jul 2026 22:38:04 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
Message-ID: <20260710223804-GKB106000@kernel.org>
References: <20260710063314.1030249-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>

Hi Inochi,

On 14:33 Fri 10 Jul     , Inochi Amaoto wrote:
> RTL8211F require at least 50ms deassert to guarantee the register
> access, 10ms is only enough for the PHY reset.
> 
IMO, it's kind of too trivial to split into two separate patches,
while duplicating the commit message

> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
If you agree to squash the patches, then should be fine to put both Fixes here
also suggest to adjust title to be more simple and explict
riscv: dts: spacemit: Increase deassert time for PHY RTL8211F

> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
the fix looks good to me, so
Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index 1eb5abbc61f9..b2a7d2d0d3a8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -200,7 +200,7 @@ phy0: phy@1 {
>  			reg = <1>;
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <10000>;
> -			reset-deassert-us = <10000>;
> +			reset-deassert-us = <50000>;
>  		};
>  	};
>  };
> -- 
> 2.55.0
> 
> 

-- 
Yixun Lan (dlan)
