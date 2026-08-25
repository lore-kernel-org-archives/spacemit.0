Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8075817BCA;
	Tue, 25 Aug 2026 22:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787698148; cv=none; b=NXpKtYZdmXo6LNgU4F6h5+kOI4HoFYsAMmyWbUhBTkDbrhujACuJOZs37sHeA581hJI9+Tjbzy9U3I4Aeyfm7IL5Fl3PKkYWQaStzGj52sVIPS5nh8koCCy7xmDdMp0blRceR+gHiI5mW8sLDeQOYsf11+npaRmKEgMqkrdzvGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787698148; c=relaxed/simple;
	bh=vuyJ/wahkP+QW6mJoYaEQWf71o4zfdVdHuJexISTfVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeGI3HxLogDKWXu3IxHbclnDbQWJQ+lyVkPNgCDBpM/OKNR77xJWDhIu3xb4wdBBObGLNnKiW7mD6SkVdYWpJoRBbC9E7LwfiiM5RjnN5mZw2kQv6K4HzFsnv6ue723X/6/wHlWA+Zwy57t19sS3SPtnLE2FBDmAOH7EhyRqhTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P84R/7/Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P84R/7/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF801F000E9;
	Tue, 25 Aug 2026 22:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787698147;
	bh=CzUHjTtV9HFnqkDD5ZY7/R1QxL3nnbBXEJln8CdDQHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P84R/7/Zls1qOfDS4je1zyj9Q/90iuLhMrjK48eMbHzufiyIt+FJV1XrlcdCUzPt/
	 M1ly0jEgma7al/m7RHoOQF8ugeC1/uFtm0gHCjToSwJTyjVPjeG8zsHLeGAoW2pH8U
	 tRspCrc0ID7qzRgsr1Nt3LhOvK++CvROTHKDPVuyx/WxWTFJGodK8atzmupMBf5v4Y
	 XnD/WVc1TMXXPRXw5TqX/+rbFW7V1B/9GKF/t37DjCvc2YC9axTmxd0PZ7yrh8rpkL
	 yqHI4JXavUBupfz/waDBYdR8N0nmOzsyluzIhtFP3Zj3O1LpXxj+3Za721xhq1Qtjm
	 E8mxDLrJIvj7A==
Date: Tue, 25 Aug 2026 22:49:05 +0000
From: Yixun Lan <dlan@kernel.org>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1
 thermal sensor
Message-ID: <20260825224905-GKD631715@kernel.org>
References: <20260825052233.66850-1-bbanelli@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825052233.66850-1-bbanelli@gmail.com>

Hi Bruno,

On 07:22 Tue 25 Aug     , Bruno Banelli wrote:
> Two blocks on SpacemiT K1 boards are unreachable from a stock defconfig
> build:
> 
>  - USB_DWC3 is not enabled, so the dwc3 controller that drives all of
>    the USB 3.0 ports on boards like the Milk-V Jupiter never probes.
> 
>  - SPACEMIT_K1_TSENSOR has no default in its Kconfig and is not listed
>    here, so a K1 board comes up with no temperature readings at all,
>    even though k1.dtsi describes five thermal zones.
> 
> Enable both.
> 
The patch itself looks good to me, but since it deal with two diferent drivers
So, can you split it into two patches? which easy to review and manage

> Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
> ---
>  arch/riscv/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 04ae305d5..03d9ac2f7 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -209,6 +209,8 @@ CONFIG_USB=y
>  CONFIG_USB_OTG=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_PLATFORM=y
> +CONFIG_USB_DWC3=y
> +CONFIG_USB_DWC3_GENERIC_PLAT=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_HCD_PLATFORM=y
>  CONFIG_USB_OHCI_HCD=y
> @@ -260,6 +262,7 @@ CONFIG_CLK_SOPHGO_SG2042_PLL=y
>  CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>  CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
>  CONFIG_SPACEMIT_K1_CCU=y
> +CONFIG_SPACEMIT_K1_TSENSOR=y
>  CONFIG_SPACEMIT_K3_CCU=y
>  CONFIG_SUN8I_DE2_CCU=m
>  CONFIG_SUN50I_IOMMU=y
> 
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
