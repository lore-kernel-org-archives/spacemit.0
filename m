Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5290532ED58
	for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406829; cv=none; b=mPID70R8ey2gHvKm4yuYlfbSeVILpbUULZJYVPnL6sFKaQGiAu4h8yhlxCMBtOV903GgQnobTd3meUxgPgKyE1NDMwZyjN0267poNr4QP8KtR+NeVyqgmG5XgVvfGmUHsffLJM3JJfwr8POvgdQpKGVsYTZmJQmI4Vom6adin0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406829; c=relaxed/simple;
	bh=D0J62PG3/1U8EWcYQtqql/7bNjseH17cdrR/Xun3mfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjX/2ATEDKlNrFlEo4gxEQ5Aj+fg4GPwrezktM+1aeg5BKnHLn1HIZQk54LSCKLeRG0QF6fqpp87tBBWYpYnGYSjVWNgaHIuaXyeqTxEWp0ZfZEF3OzbvGIT09sCl0DD+vP8hWLXjZuArtU103XVdMcO3vpcRH58i8+tB67hgeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Y66gIiGG; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Y66gIiGG"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-948614ceac0so184788739f.0
        for <spacemit@lists.linux.dev>; Mon, 17 Nov 2025 11:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763406826; x=1764011626; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WbpLosukaGmb6Q4C8J4C0DP31/eNIGANA8ASBPiU4u4=;
        b=Y66gIiGGnSbQ94df75iqOrwnNSA4Vog0us3M2+85dg9F/VkW4Z+zR0w679mEkPtvVz
         XAACzJse9j6UCVlhVEP5GydHdJE0E43LjmF+0ieE7OKurcWOtqPlRS5FJbqNv89k6l24
         6HktcIR+Htb/Cz8e4L9h0iUGVYNitNoRB9GME1HkXW13H2/opKPg+rSAIUFvq7OY1HdV
         BnWOv81tzQMLCZtesQIypbr5NwW9g6PZdkEkTEtCvev8P6weNqV1QTMU69qsju1t4zD1
         9wCFt31gZvgKz5GBP61x2lDfB3QSyNg7Ex7udyde0cjgWFddlB4IRoQUyHEnxhDW5jGN
         ch6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406826; x=1764011626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbpLosukaGmb6Q4C8J4C0DP31/eNIGANA8ASBPiU4u4=;
        b=MN1jWRCKQwhl0IsizLySMzhC94ubxfgq9wA+9eXO/3ODy91P4ZzHIejfOO/5F0cEgq
         hnNVn30BfEUhyTSW9091pTX3YScmIk3VJCrhNw61Sb916BWEERFvlD7T0KcPrnb4GmfT
         UIYpBTCWDuzy2F6/KrvFLBeqaXJSIEo7awdUVHbVGLfn40ka4LEhJOppGPwh5F/2WLPa
         T8q/oirc0+GdV4xWSiwcfsf56v/rH6N4kvM73/LYUUNQ+OHnxjxJLik9yCipvmyecgQ9
         ErbSVSKx5g/4V7ishhp9GCqr3Zhw9PITVJDnmBifKkk2wlabKY7hiiCKLf6hNps89MTT
         66sw==
X-Gm-Message-State: AOJu0Ywx3katIqzAiJo9f/bNGnvHVAU4BxJGzE+27lswvbpa2uz3nJ2U
	qfEHcE9uWFyO2SVKrT9/JvjPyT5p3zA04r2jgtBKZ+dDucAMnhkTwmhmsOFIlMBC+ok=
X-Gm-Gg: ASbGnctvJUmFquzJurMk35nCKUsx7k+iCOihyc08GHzNVpVrz9l44f8B4cRrXs7l4VR
	FEBXx7Fek88UQR2VPR/DgBGZC0wc9c3wU0NqKq047L/AeDKxZydXcmVU8hLzi7GH1Wr6zK0mOjl
	vrz5nPb8puvMJKLz2EnWHftYomaqp9u21YV6lDKPD6FdwYj1VkFiQMzghcHSvSrV7hDV6DnXQlH
	z91PUlzTIyPBIpRYmzMebYSFPP4Q1gQjK1B5m6fjrgjVU4tz2+rS5R5GEJOo4/ejbLNgAcGo/Mj
	oJI+EbIVP66mzaNmEf/T2sR75AznmOk31e5Rl4X7tBiDpZq03WRed/dISw/lyumdrSzbERciPdZ
	kp1inJjlqhYqIlEpBMq6Cu2a3m+Bg/N+HaZ8jqWBAiEyfoo0iVlVpAj7I6mX+aqjT/s8KuLJ1uM
	dafFdHHIRhgJI66ubq0HZ7lMgfr2bV/nwh89g4pYUtAZeH0gWXM4sVhGNsicwE
X-Google-Smtp-Source: AGHT+IH8eFCp4A760FkF3tQiu/jqIcK+hIc5E/QznWtjRo4yEGgDGtrgNoK16294y1YPQeLGg93T3g==
X-Received: by 2002:a05:6638:6401:b0:5b7:d710:6626 with SMTP id 8926c6da1cb9f-5b7d7106756mr8951851173.21.1763406826144;
        Mon, 17 Nov 2025 11:13:46 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd26fdfdsm5209811173.18.2025.11.17.11.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 11:13:45 -0800 (PST)
Message-ID: <d74628b6-9441-4853-9c47-6fffe8d654e6@riscstar.com>
Date: Mon, 17 Nov 2025 13:13:44 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: fix UBSAN warning during probe
To: Charles Mirabile <cmirabil@redhat.com>, linux-kernel@vger.kernel.org
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dlan@gentoo.org, heylenay@4d2.org, troy.mitchell@linux.spacemit.com,
 inochiama@outlook.com, Yanko Kaneti <yaneti@declera.com>
References: <20251117190329.1337250-1-cmirabil@redhat.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251117190329.1337250-1-cmirabil@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/25 1:03 PM, Charles Mirabile wrote:
> When booting with KASAN enabled the following splat is encountered during
> probe of the k1 clock driver:
> 
> UBSAN: array-index-out-of-bounds in drivers/clk/spacemit/ccu-k1.c:1044:16
> index 0 is out of range for type 'clk_hw *[*]'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc5+ #1 PREEMPT(lazy)
> Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10spacemit 10/01/2022
> Call Trace:
> [<ffffffff8002b628>] dump_backtrace+0x28/0x38
> [<ffffffff800027d2>] show_stack+0x3a/0x50
> [<ffffffff800220c2>] dump_stack_lvl+0x5a/0x80
> [<ffffffff80022100>] dump_stack+0x18/0x20
> [<ffffffff800164b8>] ubsan_epilogue+0x10/0x48
> [<ffffffff8099034e>] __ubsan_handle_out_of_bounds+0xa6/0xa8
> [<ffffffff80acbfa6>] k1_ccu_probe+0x37e/0x420
> [<ffffffff80b79e6e>] platform_probe+0x56/0x98
> [<ffffffff80b76a7e>] really_probe+0x9e/0x350
> [<ffffffff80b76db0>] __driver_probe_device+0x80/0x138
> [<ffffffff80b76f52>] driver_probe_device+0x3a/0xd0
> [<ffffffff80b771c4>] __driver_attach+0xac/0x1b8
> [<ffffffff80b742fc>] bus_for_each_dev+0x6c/0xc8
> [<ffffffff80b76296>] driver_attach+0x26/0x38
> [<ffffffff80b759ae>] bus_add_driver+0x13e/0x268
> [<ffffffff80b7836a>] driver_register+0x52/0x100
> [<ffffffff80b79a78>] __platform_driver_register+0x28/0x38
> [<ffffffff814585da>] k1_ccu_driver_init+0x22/0x38
> [<ffffffff80023a8a>] do_one_initcall+0x62/0x2a0
> [<ffffffff81401c60>] do_initcalls+0x170/0x1a8
> [<ffffffff81401e7a>] kernel_init_freeable+0x16a/0x1e0
> [<ffffffff811f7534>] kernel_init+0x2c/0x180
> [<ffffffff80025f56>] ret_from_fork_kernel+0x16/0x1d8
> [<ffffffff81205336>] ret_from_fork_kernel_asm+0x16/0x18
> ---[ end trace ]---
> 
> This is bogus and is simply a result of KASAN consulting the `.num` member
> of the struct for bounds information (as it should due to `__counted_by`)
> and finding 0 set by kzalloc because it has not been initialized before
> the loop that fills in the array. The easy fix is to just move the line
> that sets `num` to before the loop that fills the array so that KASAN has
> the information it needs to accurately conclude that the access is valid.
> 
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Tested-by: Yanko Kaneti <yaneti@declera.com>
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>

Looks good to me.  I haven't used UBSAN but the report is clearly
complaining about exactly what you describe.  Your fix seems like
exactly the right thing to do.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index f5a9fe6ba1859..4761bc1e3b6e6 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -1018,6 +1018,8 @@ static int spacemit_ccu_register(struct device *dev,
>   	if (!clk_data)
>   		return -ENOMEM;
>   
> +	clk_data->num = data->num;
> +
>   	for (i = 0; i < data->num; i++) {
>   		struct clk_hw *hw = data->hws[i];
>   		struct ccu_common *common;
> @@ -1044,8 +1046,6 @@ static int spacemit_ccu_register(struct device *dev,
>   		clk_data->hws[i] = hw;
>   	}
>   
> -	clk_data->num = data->num;
> -
>   	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>   	if (ret)
>   		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> 
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c

