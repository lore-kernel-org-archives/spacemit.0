Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985D299959
	for <spacemit@lists.linux.dev>; Mon,  7 Jul 2025 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890790; cv=none; b=ZxnneTEO+x1NndfLSyWQ7ldCRINmtJTFhjbblqYoz4h5jKQtqiGpXfn+Mw6pGTjF6MRMEb9e9GVuV2bS5cpv3+Rbx0Ifcsejf7BwdxCR8kW5A44aotJ+UWrjkGqG+opBZZGhTIsvAeRUPQX49M9MqOxkqN07TmOVL+OCFxht1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890790; c=relaxed/simple;
	bh=G2nuJk0ebAC3LWYePQqGnvMvK1ajrnj1SIODzaviyXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3zo1RHh/OcKuKG3kTZS5LJSlq0g6z2R339mA7BtVjE/40zgV7MyqUyRFynG6YGWIyEvTP+EplRqoxueHj3GybjB/JydEj5PZpdOfdG1htOCA0LCuRKErmxyvML4ljlET6e5gieQDCz//HJo9FLM1nmHkVzT/dhULklKd1vn8VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=c72hx8bb; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="c72hx8bb"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e0570a9b83so10166445ab.1
        for <spacemit@lists.linux.dev>; Mon, 07 Jul 2025 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751890786; x=1752495586; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxogMmaQmgY2q2qzD7nC3CsZ+3t0oYcFl9XYA4Lsn1M=;
        b=c72hx8bbHgWRSD+pq+eS/5lp+iqJztaLEvSYp54Wb+qryn/XJNv6Mop77WS5u3rmla
         tKhh8JBQUaPGGmhlpXFvvF30QL4KUf4WgAwKuYABGPJounqdgyD+xUaCiSwyKokysylv
         CjQw2LuUGfVILz8ss7HRXY0meeNN/7QsuFf6wS/vsGsmd5naQJFXD+yDvaKF4kSihkW4
         927qEVJtX0ArsE6E83l6ae5N/chIrB1zmpobuEU6+12CbaH2MXWCLeIBMVnlQdkixP5n
         xIdF0BoAdWYvNssgBDC7BmgM3ClSfV4WCl79tRdVEFA8tDHOYfRq2dxxPrF7ST+jrOhD
         o4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751890786; x=1752495586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxogMmaQmgY2q2qzD7nC3CsZ+3t0oYcFl9XYA4Lsn1M=;
        b=iXeM6ILOBEynLK78Mz+3d3ByQlXNNO1mzOLG9y/e2HFVHF/Qi8lDTkj15fe0A+rmTx
         3cXotsB0/cPrIoitBrihrwgX5qEYoB82aZxIQEQGGZjP5yx/sXPXemqiZ6Uh2dzuLcjH
         55JPKDIrLQdXiPxpq6l3eO+F031sZL/9ptEONZ85u7BppIcpNyx7pkuwLHo2BZM1f/dx
         dZKEOzo6KJcUzHSp8W/BTl9gJWH9JefvmKRIgg3zYFkGyZsIuKQOpnYXWqI/6znvf5GN
         VBzjFjG6OqKvQi5/VdMCzBoBJF2LgrijdXYZLT3i2E3UptrtPP58Up8qlKlrnZpV89Tg
         Jj5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyl3viU7ZXalku5sgy5ybKGEOd+3ZFLbqrmuUMRE2uob/dZpM4tEwdjYS5x9sN0W12WnIwwZNQHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5M9/SE5GoembhJtg6auDLZR2CYSjNZzEu+QDuvIo7G7WrGQbd
	aWKQLsYHoAfb+jpvSjO53nwi60cPQ5X/107Jzz61diRCP9zLwrXwiDqizDa0Go+BkBM=
X-Gm-Gg: ASbGnct5iL6Yue5m8Cz0dCHz7pKwhTXLa08aswl7lLJh+1CA77Y5Am/wtIQb1Ds91s3
	Mg3CORnZI2mRktWdKsooBvyUPEf+qNedkggS51z9ftlYbZzWiHcRE0BHl6hXVGSAuBE7j28O51N
	x2ocSlGN+XY0uOtgZQd0SXQrymEuyJvP5AFBOyyjagkI4SMqBMQUorNB49BF/wsn3u6ccaL/ANE
	vP23CIlXNaPkCMdnNvhK7jTmbcOPIfQDeEGB8xPLUDfinn10OQ/Zag1WyiWOLoLb+o77E8vJJSS
	gc6SUkuTfRr31HK1g0pB6gUDGEKRhEw9XGq0PL+ewofQUrvmf0Wv4QODcetLikhhg0WzzgyBqDp
	d7s+qdO7vLk+mzO480aXDm+PGSw==
X-Google-Smtp-Source: AGHT+IHhI0FQyOogd1s/uXHV7ed2uK3z0eA0h1VaUBWuw5Kj8IBh7AKQNpwKJDcN3xx1YzBfgWCFWA==
X-Received: by 2002:a05:6e02:1c0b:b0:3dd:d98c:cca9 with SMTP id e9e14a558f8ab-3e13ee8b5e8mr72520815ab.3.1751890786546;
        Mon, 07 Jul 2025 05:19:46 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b59c92ebsm1619337173.46.2025.07.07.05.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 05:19:46 -0700 (PDT)
Message-ID: <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
Date: Mon, 7 Jul 2025 07:19:45 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250612224856.1105924-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250612224856.1105924-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 5:48 PM, Alex Elder wrote:
> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> parent for numerous clocks, including those used by APB and AXI buses.
> Guodong Xu discovered that this clock got disabled while responding to
> getting -EPROBE_DEFER when requesting a reset controller.
> 
> The needed clock (CLK_DMA, along with its parents) had already been
> enabled.  To respond to the probe deferral return, the CLK_DMA clock
> was disabled, and this led to parent clocks also reducing their enable
> count.  When the enable count for pll1_d8 was decremented it became 0,
> which caused it to be disabled.  This led to a system hang.
> 
> Marking that clock critical resolves this by preventing it from being
> disabled.
> 
> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> be supplied for a CCU_FACTOR_GATE clock.

Is there any reason this bug fix cannot be merged?  It was
first posted a month ago, and although there was some initial
discussion that led to revisions, this version has been waiting
for over three weeks.

					-Alex

> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> ---
> v3: Define struct with static scope; added Haylen's Reviewed-by
> v2: Reworded the description to provide better detail
> 
>   drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>   drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>   2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a052353..df65009a07bb1 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>   CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
> +		CLK_IS_CRITICAL);
>   CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 51d19f5d6aacb..54d40cd39b275 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>   	}									\
>   }
>   
> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, _flags)					\
> +static struct ccu_mix _name = {							\
> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> +	.common = {								\
> +		.reg_ctrl	= _reg_ctrl,					\
> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
> +	}									\
> +}
> +
>   #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>   			       _mul)						\
> -static struct ccu_mix _name = {							\
> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> -	.common = {								\
> -		.reg_ctrl	= _reg_ctrl,					\
> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
> -	}									\
> -}
> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, 0)
>   
>   #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>   			    _mask_gate, _flags)					\
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

