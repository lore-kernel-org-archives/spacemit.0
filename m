Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB54623CEE8
	for <spacemit@lists.linux.dev>; Thu, 27 Feb 2025 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672776; cv=none; b=U9Vrcs9zAe9qcdaVJCwKDyO08DwcqUxvUSHW2nQl8JxgqK3P76lHxY7sKxeVA2yOam2WMBY4N9sHeyrswR2x27CpFBbOz+LNikkmxyDchbhextxW4f1shEDgXLop8ipHUmJGGGx3cHV3QzSfcx2jEixz/nEvr5K1yG1wULbGl5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672776; c=relaxed/simple;
	bh=u/jEDuM2cZEF60dp/4fSw3VAkOYWYed4gReCbmcZt2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOHb3kLWqxLTuzoCmVx4P9k5CEjWjbPvminFKfm5vikqRyUc3akotmgmzakkF9lWo6yEUTu7DAcHs/U5sHEoAzzX5/e4ylhr7xam7WJ41WhJYjFamHq3JF1ly1kY5UrFwORrytlXE1nqoFG3zvvXEva9fer7vz7i00D+QxSJkE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vl04Napx; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vl04Napx"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d191bfeafbso4654245ab.0
        for <spacemit@lists.linux.dev>; Thu, 27 Feb 2025 08:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740672774; x=1741277574; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4a+PIYpn9cYVWDOKIU06eghAJvUip+lThQ1gAkAfoE=;
        b=vl04NapxE6u3oAO5SCQmc+mmTgEgNcNJEzYOIyzft/Z7E8qzmzn0B9PrUCNxsNPyP7
         Im+XXdsM10y7q2dzFm2j6U8AjGI38iw+hyNs3V00fNHbgfkb+EkOkbf0tCOAQt3GaEOk
         OFCsEUqwZgDgijcNJof3zw7Lewboo1D0rlt6F4kXotRnncjB1l6x9Kov1cWN/YmqaO5J
         ex4sahYInK0FEzMzO2PkeZjg/2r+TfurebKzh2aDs6sE1TC4IE34gaNx2Y8KtdZ+c6Mf
         PMbGWZPJ9DyDrMwUMiOhIXsQp1E//NBE+zgSf3I1bVFn0Rwk+Xyrsk0h4V5+2orNcIDW
         8pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672774; x=1741277574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4a+PIYpn9cYVWDOKIU06eghAJvUip+lThQ1gAkAfoE=;
        b=mF69jf5XeCO2TuEdyARJrnJtxaBNeQ5ALWS+HsRyI+KUKb4lO5x65o01P7/wL81bTJ
         xNaj/+lht2BISpwW4iGf4SDQxG+VVDU9lTd7guHaSOMMalG8ViysKIyPsJ9AYsnExFL+
         0Oe4pXNJEjkyDHUJ8mcbkxZTi0cmhoTA8L4or1Jq99vTyQtEsMsFH1WGkoNOKEzQ/r1R
         XrX1uB1zJF/9a5kGPsHWCskCzErmj0BAmcjAnL+6qnh8oPi29no1bKo6/jyl7+YWSRN9
         URUgMx6295IgQ4ZfZkEMSei+cE9q3YpXyNjYC6o68RRZbX1cJUGNYNGN3QaJQocBAVze
         PkHw==
X-Forwarded-Encrypted: i=1; AJvYcCUngfyUsxTkj0p5OPTjq9E2rzObqQ05x/3vBckV/yawkRlKtBE3YcY32Bj76l62cIPtsEkkVcg14g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyun2IwsfmMNQK7kTa+dbE3j34rTw/wi1r8vAfWVMyGYkUbXRWw
	ECBCSgqYcUHaaVH3ImYrIoFq9khm1QIOgBY16huMVyc2NtBpqQr1Ig/AvWrfNYI=
X-Gm-Gg: ASbGncuofk8SHHTSTo1fgfcnCc5lOQGAmcmRBdKPL29YGdKA+tlTf+YTlxK+wtTe4z6
	yDIueT83AVwD8iC6bUAC4HjivMy0agUXziacPhvbo6MqeJtJnXC6/97zcjuOB0LsU38T3wklxOx
	c9C18XF+z8/oORHTcXw+uIkBRIo2uI+EiM9bYSqj7QwfeIyfa0bGZ6BucZZNnh8qOt54hJeJNt1
	n6d9D5CxdWFfHtISP94LwCgN7qNmLB2jXrFb4G/YY1vMuXbn1h+VNXwb/g8SQuKxuYOZQwxWYLC
	bGxOeAFOlXFF+o42Z20VyzqTshzwnSzacZ0YfMLJMFKYEqAYraWCZINLoxIRFPT1cw==
X-Google-Smtp-Source: AGHT+IECEOEF/3IgUpjExo3hn+o7d72t1ArCxVXIIzsvV1Vpk9+T4m/ul07rs6wpKxf4ijf45waAXQ==
X-Received: by 2002:a92:c545:0:b0:3d1:79ec:bef2 with SMTP id e9e14a558f8ab-3d2fecce699mr113973395ab.6.1740672773762;
        Thu, 27 Feb 2025 08:12:53 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3deeca7ffsm3742305ab.53.2025.02.27.08.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 08:12:53 -0800 (PST)
Message-ID: <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
Date: Thu, 27 Feb 2025 10:12:51 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/25 5:24 AM, Yixun Lan wrote:
> The is a prerequisite patch to support parsing three-cell
> interrupts which encoded as <instance hwirq irqflag>,
> the translate function will always retrieve irq number and
> flag from last two cells.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   kernel/irq/irqdomain.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index ec6d8e72d980f604ded2bfa2143420e0e0095920..cb874ab5e54a4763d601122becd63b6d759e55d2 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1208,10 +1208,17 @@ int irq_domain_translate_twocell(struct irq_domain *d,
>   				 unsigned long *out_hwirq,
>   				 unsigned int *out_type)
>   {

This function is meant for "twocell".  There is also another function
irq_domain_translate_onecell().  Why don't you just create
irq_domain_translate_threecell" instead?

					-Alex


> +	u32 irq, type;
> +
>   	if (WARN_ON(fwspec->param_count < 2))
>   		return -EINVAL;
> -	*out_hwirq = fwspec->param[0];
> -	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> +
> +	irq = fwspec->param_count - 2;
> +	type = fwspec->param_count - 1;
> +
> +	*out_hwirq = fwspec->param[irq];
> +	*out_type = fwspec->param[type] & IRQ_TYPE_SENSE_MASK;
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
> 

