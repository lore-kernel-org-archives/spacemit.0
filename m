Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ADC13A258;
	Sat,  2 May 2026 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777723265; cv=none; b=RbdCZLPsaKERklN6aXYr5nWK9u3aLemA+mYeQv9uG+LChbTi55z7xQZJlWJIvtgP7PygPoPZ6AGjfGADyKLFTP9duVH38PEnnAC/DQVqs7FXykgjir5b9ItWTNGCvGVLlTIEFffalY7BtWr+iCo2oCxUY6cnEu5qYuN5ALK5A9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777723265; c=relaxed/simple;
	bh=cYlEA7J2N+YnE4244ODfbSDfbaz+mByM60A7ApfHpIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igTXlFjWgxtAPLEWsoyGK5w0KL+qiSn7rUMVnTYWVDb/hGGbzNht3sZVZsswIexTK0iAyXctN44o9mubVO5rAZUYB3so4mRptY30Y3swuIycUgXbhi6oGMD2GxJPR1Za0T1DsQ0+WFDOP231BT8hQ8UB1UhRLOmg5ZC3sOebn58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADpu4nPM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADpu4nPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF21DC19425;
	Sat,  2 May 2026 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777723264;
	bh=cYlEA7J2N+YnE4244ODfbSDfbaz+mByM60A7ApfHpIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADpu4nPMCwKotBgOh9ShhpN69OY0fmaT5OWxlb/QysGsFrMl0tM6PJiBgpgQnel7O
	 3dFhDG5c+mbc9GuxK76cx1a+n9jPZpK7bkPLRfXSAe75g1uxWlZpiMCR3/70BbxMkJ
	 ZSdpgYAR/TTpeRtO4mRZz9WlNJNM8Smdsz+TVPw7uumxDtkz7aeEyEIGatnzdXIr7o
	 X3ymaszfjAaIwXCloJilEIgl0zZMmJ2fBa7FJQT208mztCGiFpjtplJlTQvTNYB0nV
	 0Exqtvu9wQTvJ6UJV/ujYTni9aCzDENeKZ67vVRMY0f56N0bAk8HfUq6A9bklBeiUF
	 o8NNjUaKfuGsQ==
Date: Sat, 2 May 2026 12:01:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Message-ID: <20260502120102-GKC3266396@kernel.org>
References: <20260430-reword-overstep-3be08b7eab25@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-reword-overstep-3be08b7eab25@spud>

Hi Conor,

On 19:52 Thu 30 Apr     , Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Because the default console's baud rate is not set, defconfig kernels do
> not have any serial output on this platform. Set the baud rate to
> 115200, matching what is used by U-Boot etc on this platform.
> 
> Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Fixes: d60d57ab6b2a8 ("riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Yixun Lan <dlan@kernel.org>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: spacemit@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 +-

Looks good to me, but I think the fix should also apply to other boards,
so do you want to fix other dts? I'd be fine if you keep it to BPI-F3 only


>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5790d927b93db..333ac8ebf3f51 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -19,7 +19,7 @@ aliases {
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
