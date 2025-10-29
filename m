Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313AD5478D
	for <spacemit@lists.linux.dev>; Wed, 29 Oct 2025 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761777229; cv=none; b=ajWfUoTS+fgmxmNqs5lcpZt1EibJH6NKIpdtNYSIjlIGo/kNuGg0leUfGQlJQAF481MLCOOmJ2NNns0LFZNcO+5ylxcdlUBkHpW3iCBSK5+gzCf894IzQicPD3GE1nTxOZf7l5ErG+bGebUea55jjidxT/PxxfIVc9sXTpv8+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761777229; c=relaxed/simple;
	bh=2PljQxny0Ku9KPKpvWh3zcEiGaj/B9UoFx5o36flDNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qgl1v3JUGCNPqhAvwS8T+ViHfpw8XDdhScSFHp5DmHtSjddBTsQcuaRUjU6vEvq64jStEE4UseYd5Vp6/XZqtWYArntH7lcd+B62hM7BYkPvS6A6RQj+p6wH+6I2JW7be8/avr/G+px3YcDsG/DrlmUJv4Xp7r2vvDIRfO7o0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 42DF2340EFA;
	Wed, 29 Oct 2025 22:33:47 +0000 (UTC)
Date: Thu, 30 Oct 2025 06:33:37 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: fix comment typo
Message-ID: <20251029223337-GYA1549833@gentoo.org>
References: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>

Hi Encrow,

On 00:05 Wed 29 Oct     , Encrow Thorne wrote:
> ccumix.h was copied from ccudiv.h and the comment after #endif was not
> updated.
> 
> This patch fixes the incorrect comment to match the filename.

Just describe in imperative mode, see
(since this is trivial, I could amend it before apply the patch,
so no need to resend)
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  drivers/clk/spacemit/ccu_mix.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 54d40cd39b27..c406508e3504 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
>  extern const struct clk_ops spacemit_ccu_mux_gate_ops;
>  extern const struct clk_ops spacemit_ccu_mux_div_ops;
>  extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
> -#endif /* _CCU_DIV_H_ */
> +#endif /* _CCU_MIX_H_ */
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
> 
> Best regards,
> -- 
> Encrow Thorne <jyc0019@gmail.com>
> 

-- 
Yixun Lan (dlan)
