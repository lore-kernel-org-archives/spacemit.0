Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A862827056A;
	Wed,  3 Sep 2025 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894721; cv=none; b=Fg4eobBAFlZz6OVs0CtVbm53VclUFmNCGVf16NE0zj6mP/TFQGi/CGNBncjb9et19qdzQ7DpeHJdCjOoYS1tugm120bJoMcmCICsNudJQg8t/zbGYcT+P1SvKAQO93TX2mv0iwL6zT5tQnsKzijQHLPdM7QqUAqlGp1VCc22dW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894721; c=relaxed/simple;
	bh=3BDmuX/acgIvSNyMvwX54stjuKITG4fBqBmjib2m/E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyMvoky0CK3uz5PLQQiAlGMg946DXjfqPhnvxhGkX9wyyHZ3RSCca/YDvbwTKC9jE4mubd2Nzx7OB4+FrqwBtxIw8e2KUxIAkWa11LZAlqYPPCW74ppyadVjfiyYuh2wPLS+7KVRCUI846tnYzpa+cIYPGEjyA3IS3twLHC0Ql4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8860B340DCC;
	Wed, 03 Sep 2025 10:18:37 +0000 (UTC)
Date: Wed, 3 Sep 2025 18:18:33 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: linus.walleij@linaro.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
Message-ID: <20250903101833-GYB1155728@gentoo.org>
References: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>

Hi Hendrik,
On 12:01 Wed 03 Sep     , Hendrik Hamerlinck wrote:
> The datasheet lists this signal as PRI_TDI, not PRI_DTI.
> Fix the pin name to match the documentation and JTAG naming
> convention (TDI = Test Data In).
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 9996b1c4a07e..a3f433b611f7 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -847,7 +847,7 @@ static const struct pinctrl_pin_desc k1_pin_desc[] = {
>  	PINCTRL_PIN(67, "GPIO_67"),
>  	PINCTRL_PIN(68, "GPIO_68"),
>  	PINCTRL_PIN(69, "GPIO_69"),
> -	PINCTRL_PIN(70, "GPIO_70/PRI_DTI"),
> +	PINCTRL_PIN(70, "GPIO_70/PRI_TDI"),
>  	PINCTRL_PIN(71, "GPIO_71/PRI_TMS"),
>  	PINCTRL_PIN(72, "GPIO_72/PRI_TCK"),
>  	PINCTRL_PIN(73, "GPIO_73/PRI_TDO"),
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
