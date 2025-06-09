Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2070220F23
	for <spacemit@lists.linux.dev>; Mon,  9 Jun 2025 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500070; cv=none; b=KbIN4r3B6SS6wWcTkoDCNCT6jw96ZbW1uwFtDrwJZSbuM0O2klxyDi9Oi7ee1LRrq2Tpz1SLdJl78GyCLgZYRpj+drbccYi1j8Mju6WUgo8ecRVUWdOpYtgGeiVzxs8JvslgjLN52sd4dalIAk4aRCMQop8LFxZ+yCP3Dvl448Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500070; c=relaxed/simple;
	bh=cc13l7pbpIRdIEC25QVqWj0lamcvY3YyLME1tijvOPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMdMSewq9/6F55Oar7nmYR7vN0Oe6uIOhFzQry3XYgAibcSkEsWi7MtJJGvM9Ympbg5+DAGdC0i19R69URYQJEvSzZKdSDgIf9vO7xPaUqjlo+PUDYC/bMJZoI8dZf0rGHN+/KZ/r99/P15b0u4WoK5euUbB7lOxJrYEyxGLccA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0rTsKOdg; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0rTsKOdg"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fabb948e5aso50880026d6.1
        for <spacemit@lists.linux.dev>; Mon, 09 Jun 2025 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749500067; x=1750104867; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFj+rnVnwrli61+RW3pW0hp2hmvQPvdmAdNSR40r1ZE=;
        b=0rTsKOdgzfFUBx3SuRBR0M5njiH7NeZhU6+1p28JmXtlgmkkMKr5xKYOqgizFTIGMs
         qM8iUljLKeQU72mo1sawux61ySBAAMWMaZMOqvXsF6Kt9CotC0O0nGEI/O/F2Fq5Mksr
         W2VovaHn79aIoFHpBf1XcSCjXOXiRGhsq617m8qow0vaHWIH4615iHpV+hzxyTrIAaxy
         d/3bUGyoXaW4gTW7DDO8ALjO+fXaf5CJf0GIA2s8EdWSOu6uaTOGT0Urz6uaGeEBxdlZ
         gGBXINp/lVVxTcbPix90ogF/NfsubM+yg//QhElDv9lFFI8p0MhJ4gd3lZI4rcEUD/H9
         jZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749500067; x=1750104867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFj+rnVnwrli61+RW3pW0hp2hmvQPvdmAdNSR40r1ZE=;
        b=r5KvU5S2X3exWmwblZNyMtYuu4Omqd0+X8K9+VThc+jANelgsEZZQzGAulwDLMLAeF
         +VnQFBgs3Y7+fecYzXI0pKv/f9FM9N2K6sCAefQlwKTe7mGhFNqouESLX8xSxlqUoh1a
         9f/Bibr9rEHegJnMGQDC2Y6DnHAFSE7Q8S2HkSW9b/S9jEsRxgGNjqbGSlT3QI2TRCmX
         Z+3JsTFiKShxZxqDW2QfThzHRtmq7hUlwhXBbStPwlCyZsI0BVnmyxlZImaJI8Lg2EOZ
         NEJMRU8aKmFR/H/RCLO82PMp6DFGGnibhmNlUd37yFSak5PXhNGoe9NOCcFmLFpcOQ3M
         X7PA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Yp9Id/tX1NNyZF5BAeAUmJvtEyA1dphFCGWHjEqsQijeTtl1ARZIyGWuamJLER4r1xSI7bRUDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwK8WXga73IN7qL1gJkrrVA1nAoHM1GsBwTkpxH3PzYQBBjj5ZJ
	bmz8IclIfByG6KSI22wCcd1FrTak6OX8EmyA/rSKgtPu7i5p6iq7TtfEy0q+hNlSXcE=
X-Gm-Gg: ASbGncvEDQ3jTSYVxT9SQIRXpjzk0UuZh/3LtmYdCkr5l8aux1oMYiDaxyU4I6+tNI/
	ZrNCw1mGqZzoHzQh2vVmiONA9zN0/fzGLaQJInnjOVws3F9apTq/SYspnH09jB8ilQF0sX3RT/v
	ApsmEU3Q7Ml3kUEfqSfKzkE+d1brCa5BX2vVus3ks6uwv7bJMu6xvSOqyAkqrO88WgwMclBYTlv
	q+nilD2sYS6Ct3k+xJzZPE1vDPRCvZt7lx0jAjkRMVSQQriB9nQ/7T/zvtdCq4pWToFXfgjYCx0
	UYQjf8fC0Me4CPyMCCpeRMr1g05RbVvv+Ky7eMmrx5Vi08kfpTPtB6Ln78dL52eZvQi9iiJ8VSs
	Ds5Bv2lPzY4Jbu1AAYFA4XqUZO6KHE6ZisWdJ
X-Google-Smtp-Source: AGHT+IEoxsMyfv1zl4Eq2z6OuyNYN5zJiRV3axkBglw2RaCBqnFhaHAJb4H6tYu0A3sn+TFxdgVaMQ==
X-Received: by 2002:a05:6214:1256:b0:6fb:14:5e89 with SMTP id 6a1803df08f44-6fb08fe7f6fmr255840366d6.19.1749500067642;
        Mon, 09 Jun 2025 13:14:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ac8415sm56510096d6.27.2025.06.09.13.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 13:14:27 -0700 (PDT)
Message-ID: <17a7ab55-aa1a-4d1d-b8f6-27bbe51fe761@riscstar.com>
Date: Mon, 9 Jun 2025 15:14:26 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guodong Xu <guodong@riscstar.com>
References: <20250609200822.468482-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250609200822.468482-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/25 3:08 PM, Alex Elder wrote:
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
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>

I'm very sorry, this path is v2 and I neglected to indicate that
in the subject line.  Here is v1:
   https://lore.kernel.org/lkml/20250607202759.4180579-1-elder@riscstar.com/

					-Alex
> ---
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
> index 51d19f5d6aacb..668c8139339e1 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>   	}									\
>   }
>   
> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, _flags)					\
> +struct ccu_mix _name = {							\
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

