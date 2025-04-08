Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B1253344
	for <spacemit@lists.linux.dev>; Tue,  8 Apr 2025 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141053; cv=none; b=qYql/xrUKKbHgygrY6mQCWNJ9aYqqBNhFYXONgtnxWVPqgbuobK3ZU9wG/1OmZxxEyifJa4fWkhAFsPymCSHES7YUdpusj2F3Wf/um78N5qhUGqv8cvri+dSF8zg1RQve3k6RL6O74fVlnzZvM3Q/GsnlaUchnbRlZWf+YD04pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141053; c=relaxed/simple;
	bh=3UEGQybMIzCIb/fK6BHx3wjM28c2EMUIg2D2eyuMdKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRZfIrZhC6l8HD0C0i0SorkdQYJGa0cVlS11+NLmQQsyzfyl1Vqc3QwtcdDf/FZPiCBQHmGNPfWuV1YTySTFLx/OBGthKH+Aeb+SU8LVaO4EvPzdiU10KyO9VJYmK+EhmqdNCtzdOvV6vWBG9zfb+b8N1KLMLVvMpcbnwi90z1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MBeIAqNu; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MBeIAqNu"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85d9a87660fso491500839f.1
        for <spacemit@lists.linux.dev>; Tue, 08 Apr 2025 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141050; x=1744745850; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmV03+3+73PF3Wnm576GGuQSs6MRwFfeF314mocZSr4=;
        b=MBeIAqNu3kOol4wcwROtlUnsRYpjTx0hjAmwJVTTb5x+3CSZpouLfHEp/HSs3xjYGH
         F09wOz0WpxYXr/eXwfwwWWuC1dBXmvWZgoloPracLUwVn+ArPGMMeA+g89zySifpjVhj
         ECs8OzVGw3WMLg/Jp0XrL4Ti0cEDkfXb2xE+sypfkEpWcUTGHM5oakzTkY/5BH3Wjo8F
         DKq0GsaFU6b7H3c0hPgcG3poq+0UaFnLsbYDSJZWemklOYX4SMXqHdMT75HiUoKgruzk
         hypxyO54JjZhYSZSvuqbeinVJ0bIcv+nK7MbRTd4riIWaRJk/wVSuUR8wjgcv3Abhkvw
         nWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141050; x=1744745850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmV03+3+73PF3Wnm576GGuQSs6MRwFfeF314mocZSr4=;
        b=hxLtyxExcxicp8VsjaVGGtZNKxJ6lzgfkHbfBopIW9dF5tZdnLXvdZrcf7pxzy4gBL
         QysCuHThUxLbePLeQbGWDFSrBdNYlAcn4fbAA0U8pQde7tUjYkoo1LWCkG4lLqc+i9oR
         tsH6MMHCP8arteaw+2BFhghBxf9SmhjzcPTfri6M+XZVjSl/OUc54Nej1XourzzO4pE4
         69+ddAlPgO16yVS+QItGQjDwbMe6F9cFN1oABiYdsd9EHaiYyQhY3xLv6NkjuX9o17u6
         nmMUEvQOqDYGL2EKVl0lwDM97d2h7rNaUVCPmuZxOBba0tdIb1o/9k+uZkb05i4w3+kt
         wAgA==
X-Forwarded-Encrypted: i=1; AJvYcCVcPnB1HiIPLJkPm+eFt1K/m9B+G6pWgvkOZA/ecHT9su3ZlsuFDvj+vhDgo04v8ZJbYsQpdIsgVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8UqCTQsZDtzGknwyOVFWy7NctUyYwkpV4b4oDS/J466ApuP+z
	UVwXgHSdCtFqo4wwz5ihEkIoJyc6gLYYKxToQlbehVWSRaLPDJNPqfTkWxwYieo=
X-Gm-Gg: ASbGnctIY00voiK4g77LpF1TzEUTjgmEQ0bu1Wa3EN4GW7wUsjgDx2f6QxSp0C/ZqFa
	dtbtPhbuHpx93NGseHap7KBRybg3hkgVP/06FT7RCHSKn+ZBRqzo8jKv4XkUA3Nbfd16qlz7WTl
	iKwaPljnbI291LOKYyKbCEr37rSOkHz9uiNyfCEERTDrd6pNLQgqwm9iiKcktcTp+wg34ZoBir+
	Q7iFua2irnsj1Y+y4vgr4F8xPs30I1rq2TWCg3qIjNxpjwSlKE8oUYeYwWYIkjZ02F6Qc9mpbTy
	Fw1zgw4GU01FfpeejjNR+sNfuX8j6tT1TrBQIC1DLGRhPuqdLAUmWXyzRQaSrNY58DqA0tMiLkl
	2Ktqt2Q1Y
X-Google-Smtp-Source: AGHT+IH0TSMJF+g/Z6xVX1/aYkm6TagQPlKzWAceXhcuRviJQOI+i72GhBsaY2XFvoCOzOyuaI7f0A==
X-Received: by 2002:a05:6602:4008:b0:85d:115b:bb3f with SMTP id ca18e2360f4ac-86161198b56mr61824839f.6.1744141050583;
        Tue, 08 Apr 2025 12:37:30 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e3aa0sm653506173.126.2025.04.08.12.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:30 -0700 (PDT)
Message-ID: <89385654-11bc-4cf0-b94e-15bf841ac215@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:29 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: spacemit: k1: Add TWSI8 bus and function
 clocks
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-5-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-5-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
> selection bits, reset assertion bit and enable bits for function and bus
> clocks. It has a quirk that reading always results in zero.
> 
> As a workaround, let's hardcode the mux value as zero to select
> pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
> is combined from the real bus and function clocks to avoid the
> write-only register being shared between two clk_hws, in which case
> updates of one clk_hw zero the other's bits.
> 
> With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
> controller could be brought up, which is essential for boards attaching
> power-management chips to it.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

Now that I understand why, I'm glad you put this into a separate
patch.  However I think you should make a note in the code to
indicate there's something different about this one clock.
People can then go back (with "git blame") to see the explanation
above.

Please consider adding such a comment in your next version.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cd95c4f9c127..5804c2f85407 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -397,6 +397,8 @@ CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1),
>   		    0);
>   CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1),
>   		    0);
> +CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5), APBC_TWSI8_CLK_RST,
> +		BIT(1) | BIT(0), 0);
>   
>   static const struct clk_parent_data timer_parents[] = {
>   	CCU_PARENT_HW(pll1_d192_12p8),
> @@ -528,6 +530,7 @@ CCU_GATE_DEFINE(twsi6_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI6_CLK_RST,
>   		BIT(0), 0);
>   CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI7_CLK_RST,
>   		BIT(0), 0);
> +CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk), 1, 1);
>   
>   CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS1_CLK_RST,
>   		BIT(0), 0);
> @@ -1059,6 +1062,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   	[CLK_TWSI5]		= &twsi5_clk.common.hw,
>   	[CLK_TWSI6]		= &twsi6_clk.common.hw,
>   	[CLK_TWSI7]		= &twsi7_clk.common.hw,
> +	[CLK_TWSI8]		= &twsi8_clk.common.hw,
>   	[CLK_TIMERS1]		= &timers1_clk.common.hw,
>   	[CLK_TIMERS2]		= &timers2_clk.common.hw,
>   	[CLK_AIB]		= &aib_clk.common.hw,
> @@ -1110,6 +1114,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   	[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
>   	[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
>   	[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
> +	[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
>   	[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
>   	[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
>   	[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,

