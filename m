Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8639B978
	for <spacemit@lists.linux.dev>; Wed,  3 Jun 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498818; cv=none; b=QdpHF1uAuh7m8kJJdGv+xC4t2j+IVdlK+avHH1CBYQUmDJ5aL6rRtsQBPFRhUQd8GptQwwk+EA/RxoHstgVwp+HHOpI9+j1tE1xAsh2ax4+ReS2HfYgriQIcJZ2O4u+z8z3nsaWTs0+R9vZErpV7nqF1UFWL4GfpF6wpb0p6Yz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498818; c=relaxed/simple;
	bh=GmMfpPD+F/j8AdmLcTVikc8rJ+b68xlTEOWdEKRGgM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5+4qnVLfU9qfJqQubd5s1cwyZbyONbWERc9REroy5M/vd5nIYm1490c2FypTXUw3HdTW3VjnRt6D1YEkyDvcPY4bbkWbyZAD0kyOql9b7jW3WJwLwAOsZE7qMT1WMaEvo/YRbaatxqGSIEoKnArvsiU4cAZ0GLGOxHFb0Hco/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RX7Z4jbh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RX7Z4jbh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB801F00899;
	Wed,  3 Jun 2026 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780498816;
	bh=5esXABQ9v1IkhyhfkHBvjiSAaiXKlrhHmgVnAOcCx0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RX7Z4jbhEtr+yf27l5vG/SqQtPyvoP9k25J9wYtm+iiuZ5bqp/0iPm+Un9lDIREfr
	 3lDCiEcw/8mGGaRlfbaTVj1W9STT3Nga1OTxwfj+lEuhThSZ7i4RZBaPnXjZ9gtm1G
	 GqD+Uio0JHZnqHOgVuAxyYr82Ke0gV3p/cQvhhYlr80jaaJ+a3OqKfy3ZWuIGrGzqQ
	 Dwhxd2ZRo7BTJj0PMTARF6RhMU1HD5AyiImlyJDp48ZhtSpBRwrfY8ZR9e4ACYJ7jQ
	 fRWKFTxMroM9wVLYk14y1NwrCFJo2iH0A7ATJtjY5If4WgvwUjmDjyVMfxXhea1eEV
	 kROk5hy+FRtwQ==
Date: Wed, 3 Jun 2026 15:00:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: defconfig: spacemit: enable i2c driver for K1 SoC
Message-ID: <20260603150013-GKC3727415@kernel.org>
References: <CGME20260603082338eucas1p2ec88154477479bf0547e5221e0919b07@eucas1p2.samsung.com>
 <20260603082332.3200814-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603082332.3200814-1-m.szyprowski@samsung.com>

Hi Marek,

On 10:23 Wed 03 Jun     , Marek Szyprowski wrote:
> Enable K1 SoC I2C driver to properly probe PMIC chip on BananaPiF3 board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index c2c37327b987..08445df56006 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -157,6 +157,7 @@ CONFIG_HW_RANDOM_JH7110=m
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=m
>  CONFIG_I2C_DESIGNWARE_CORE=y
> +CONFIG_I2C_K1=y
We've got one patch already which try to solve it in another way..
https://lore.kernel.org/all/20260526-orangepi-sd-card-i2c-v1-1-b92268bfd467@gmail.com/

-- 
Yixun Lan (dlan)
