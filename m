Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600873839AE;
	Tue, 12 May 2026 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585727; cv=none; b=jEo65CX2fIzzCT4SuAbbC5fIEIxyO9ypGxznyeg3IfvhfUSKHflBlzQ5SNJYvpaL7N0fcH7agObLxi6bDtRD1PLYU/HCH4mN5Tp4AliesNzafnu2CJG0UE/UA8c4zlWG7uqYRkK5A+yLjpB9nP1E8lbfgHE8gvhZImEg7gd6L6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585727; c=relaxed/simple;
	bh=O+s/qJ2aS0wV7WhC+jnpUOVvpf2JriqhRZ0N9HYUX5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSvC3W2vmqWFEX1ULy8COEHWZRqONnZMaPAeu9wBA8qnA6YLS8EX8V7EnsOQ2J5Jm2fqh81+VXpXJFofTPnnK2HlCqDYiD9Nt6+fojhNyenskh7FMLAcrBGqxjW4lgV4gi4XiiibKK7Ka4WPtNmlGMNFsjtzs8SK1J+MP3lJ/NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ix+qxIhJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ix+qxIhJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D54AC2BCB0;
	Tue, 12 May 2026 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585727;
	bh=O+s/qJ2aS0wV7WhC+jnpUOVvpf2JriqhRZ0N9HYUX5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ix+qxIhJdVyCjq8HoFIelgKUJ4U8HtdeEDYQCIxJAEUdWDp7yMTtcVHwJj0AtAG7k
	 k+X+0G5Aus19rHsGv/ZQpSlQ3iU+X7NIZxsoMVhxgAEgSTwYRk0OLU+Qa1gEdEQNIB
	 3QqZMzgZJQHewQ9TfBNuljK2yff9Xg7+51wTl5i4YXlJSMkpLinSr9QeLK10ayZdYs
	 Vzwyyo/FKn7GFO4F4wueiw1hbe/qMAkvEnmYMTlJTuquTa8lQlJQbdhGrdoytQ6fCe
	 gJkZAOsB51OcouNOzu8gDSRsPcxCsAJweyfP0PIewlsikQe3BXj1/yLlcQgPshPaJo
	 0VcLyYvPrp8dA==
Date: Tue, 12 May 2026 11:35:22 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] riscv: dts: spacemit: k1-musepi-pro: set default
 console baud rate
Message-ID: <20260512113522-GKG3624147@kernel.org>
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-7-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511111116.1109643-7-a.heider@gmail.com>


On 13:11 Mon 11 May     , Andre Heider wrote:
> Allow serial output with the same uboot/opensbi settings so the
> console works without providing a cmdline.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 2d3e30f0bd806..c8bf776511c94 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -22,7 +22,7 @@ aliases {
>  	};
>  
>  	chosen {
> -		stdout-path = "serial0";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	leds {
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)
