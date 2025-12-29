Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C910B21CC60;
	Mon, 29 Dec 2025 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767027447; cv=none; b=QBAATUmdSKQDv1CGh3nfSuUA/Sr5stnLyzo/4d5fQWV9byVbROii5UIoWSnHoSSgwM8nWjLFiownNGHOzKqYShOn6zVyHGppXc8vDNw1Ft1U+6BfLMIWsNf3N436IhEY4ncDV6hNPJUPoTdyj2Mw+y7gYb0Yegr9XmDlmybE+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767027447; c=relaxed/simple;
	bh=E31HvJ363TN6uC42P4kucOdswqsyvsSaSZ0lYlrqR60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3duYkQFsrulUMjkyBmQ0/vTyl8CB+vh8shpiAevGjPKwiiUvTR1k2PFvtPjh3pOHJfAK1gvudKzaU6ScbDDXAIMDs7Ue64xIvkEbFhIigD+63kiP/UYrfWTSgyv0Gysdh9zQLiJRPIF78L8nLnHIguindjUP63nUa/2eYI6sKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYkjZnyj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYkjZnyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2FDC4CEF7;
	Mon, 29 Dec 2025 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767027447;
	bh=E31HvJ363TN6uC42P4kucOdswqsyvsSaSZ0lYlrqR60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYkjZnyjbUNU1ZuEUrB60QMEk/agiFMuDq/kzH5DjVqjUAUsDJplkWocvO52YflxZ
	 M17XK4wGeuX5IYgtfzwT35ybC1J35161gZv7W0MY2tHkiFGuuNRmoUugugVRUxQ+5F
	 10ZIgnWf4SkjOJyW70R0SOliR8kDiic4Q/eJ2hapMEJT7ACQtteXKTWQtvowPRn4Fm
	 GYfUV/UWQxeqhq6i7S3cOqzSwviVDoXrc3Bm9C069aHdb9bMxzXdyR/vZcblwzw7d9
	 +waVlMkS8OEuspbLuEJ4s4mDZ4ZjjhXZihHqtxj00AfovJM9WC6AxCx+JTwFYL7MQP
	 XgaE3NOkt7WKw==
Date: Mon, 29 Dec 2025 22:27:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: neil.armstrong@linaro.org, dlan@gentoo.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	guodong@riscstar.com, linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
Message-ID: <aVKy87c7afpWIx33@vaman>
References: <20251226173228.2020411-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226173228.2020411-1-elder@riscstar.com>

On 26-12-25, 11:32, Alex Elder wrote:
> The SpacemiT PCIe PHY driver depends on the common clock framework.
> Not specifying that led to a failure when doing a COMPILE_TEST build
> for the SPARC architecture.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> Note:  This is based on phy/next, which I find doesn't currently build
>        cleanly using "arch/riscv/configs/defconfig".

I dont build rsicv, I should add that. What is the failure you see,
looking at changes I dont see anything that might break this

> 
>  drivers/phy/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index aa2d30e0e3261..3bc7378ea8658 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -104,6 +104,7 @@ config PHY_NXP_PTN3222
>  config PHY_SPACEMIT_K1_PCIE
>  	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on COMMON_CLK
>  	depends on HAS_IOMEM
>  	depends on OF
>  	select GENERIC_PHY
> 
> base-commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074
> -- 
> 2.48.1

-- 
~Vinod
