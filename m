Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1482AE6A
	for <spacemit@lists.linux.dev>; Thu, 20 Mar 2025 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742510360; cv=none; b=hAVl2ckGpJfUCGVHsxPaD3Wr5gn/UtUNPBpOe5QnKaIZwsB8jR3i8KHwLWXzE28dJx9bGAHPCJ3BnfEx6NWb+TBO7QAn6RTxoYn/r4a/RFLfl4ocWmcWOrXFu2ciqV+A1NyAlp4Rl4NCeAgCiCAfSnaT0XbibKz8Q+bzRCkTDsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742510360; c=relaxed/simple;
	bh=j8hDLkAQI9+JmAMX0TJqZyvjUEbu1kKiPGbRw7hGyE8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TM2d4NCGPV8nwbo3J9aFPrFtQXJp1R6Sn+35baV4Lkc3D/prS+TYr09tbVNZrqX5scUR3IB5BlpwEXZNf9Y3dcvWJNgHHHjcsXyLmWjtyGVJR72bmgThyi2o+AEEUInCtbJO2e1omXXsNe6iLCDS+A3CT2jqooDrlXh2oQnYw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=IuiaG8j5; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="IuiaG8j5"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7273f35b201so804492a34.1
        for <spacemit@lists.linux.dev>; Thu, 20 Mar 2025 15:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742510356; x=1743115156; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0fpBn8OJHb2DipzRLEI+UAj/Fv1bNkdtkXE17lBcc20=;
        b=IuiaG8j56teUuasumFqNMwo/RoJnhUYx++FP8o/D973LwB1Fml/LWIwXFJNkt+M2dI
         9CaKlMPzqb1o3ZNzdzXw0ruY0yNe6UzWTaJH4RpoItikJwT5Uqtz2LX87nQT1fvp4mFf
         pn3D3Xkd4FJ8nwL5kN9lAulyaMriNr4SKAxWuN+rXdtdsNbIKPadeUEkgg2UVkAMNUGR
         hSUcobrDJVNX3T4vTiJ8IiV3oHTh6nesfR8Dm6u7nNt17Fgnye7CjczR+AaUjyJVVJG8
         dseTcrcK3FWobbXQy6rzMlJpI6nFURSITIfPrri1tQAtI8whvGTBidx8gIdOxvpHXf+2
         WrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510356; x=1743115156;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fpBn8OJHb2DipzRLEI+UAj/Fv1bNkdtkXE17lBcc20=;
        b=dhm185gg9mHQxHo7uONONsIFZQKYvoA80uFuRUonypc2cBa4wwXnymq6Y4tePD/i6r
         0l5e2FIoZbfOpRwOMRzJx+QzL31AIgP12DoQTnto7z+mpJAUxMUyeBUik3w5HCPireGW
         0rOG216IqgLrqhyJXs+kMK5RY99PebzYinL1VxrQa+Nk0DZ/K5Yzp0xWrDlcWOPCqrSZ
         8fuFe3uol2ubGBgqnju0dVvwWQ2vDG9imPMfC6vxyJAXtLSU4IMIBfw7wBGgL3ieY0Qc
         LhxOYGyK/8mKYCyQuE21IqC/T2Re/ptOzBOhfcUABkn2nhpFG8l0hpCWW1jrAH8W7vvV
         w8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnkA8veCdcm4QZp29zpdeHpLebGysAsJNVMg036q480DoNWNMuZsQkxSfYCh1VQHTWpaBxflG/eg==@lists.linux.dev
X-Gm-Message-State: AOJu0YywKYzMk4tE6rBcMOsKHIX9EDNwz1rO0eYfD3LRtaN/SVVcZy1c
	drsUhEDTBQ9FD9DOjHu5CluLyGXBctOqkQQTb+23+KFZnpp1ZBmp+iCHoH8VH7w=
X-Gm-Gg: ASbGncsBpSxdlFbcqJRlZ1dFLXB1lYwdEHQZdGIwX+Dlr2KPYp7Wbn26W9SpJ8z7TeT
	aC/HTKNzJEN9PWlDL+AYc+3xWy9iPJY0f5brQrMXsmVZcUc5n9pPFSGMoSrrpbA7w+DOwKJ88Dk
	XH6RbMmcOXZHIxqWionVo6eKRR49BJ1I19Ve4XMegTyCBmiMD0hpqEcfkAXF/6TJX+Sn2uFFvhG
	hznDomUxh4wJOdFXmkD21sq9IBt4JsX0d3MmtF8SJynD9CwH4Vuk9NzegqJVUn67u6apAoo7P6e
	LApuS9JedV0FyHD8Yzm/NrmWUAsWoYzULsFj6GBNXC5IN2rUStZHmLHiQbHvjVNKXy0x2fZlJjb
	SLVeTvlghhpKk3w7krg==
X-Google-Smtp-Source: AGHT+IGazuW7zMOIIFe93a/pSjwb+ABWXp4kDIdJjL+/LiLiDiWbJ1EYQxh1QRi47IqHdMLVTvHmPg==
X-Received: by 2002:a05:6830:7302:b0:72a:1626:21e9 with SMTP id 46e09a7af769-72c0ae6a1f9mr908678a34.10.1742510355967;
        Thu, 20 Mar 2025 15:39:15 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c0abac23esm140838a34.7.2025.03.20.15.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 15:39:15 -0700 (PDT)
Message-ID: <84232793-9cba-4148-9875-d996e85b81be@riscstar.com>
Date: Thu, 20 Mar 2025 17:39:13 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
From: Alex Elder <elder@riscstar.com>
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Guodong Xu <guodong@riscstar.com>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <d625c473-789c-42f9-918c-8a649d058513@riscstar.com>
Content-Language: en-US
In-Reply-To: <d625c473-789c-42f9-918c-8a649d058513@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/11/25 6:19 PM, Alex Elder wrote:
> On 3/6/25 11:57 AM, Haylen Chu wrote:
>> The clock tree of K1 SoC contains three main types of clock hardware
>> (PLL/DDN/MIX) and has control registers split into several multifunction
>> devices: APBS (PLLs), MPMU, APBC and APMU.
>>
>> All register operations are done through regmap to ensure atomiciy
>> between concurrent operations of clock driver and reset,
>> power-domain driver that will be introduced in the future.
>>
>> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 
> I'm very glad you have the DT issues resolved now.
> 
> I again have lots of comments on the code, and I think I've
> identified a few bugs.  Most of my comments, however, are
> suggesting minor changes for consistency and readability.
> 
> I'm going to skip over a lot of "ccu-k1.c" because most of what I
> say applies to the definitions in the header files.

FYI I encountered a problem I mentioned below.

. . .

>> +/* frequency unit Mhz, return pll vco freq */
>> +static unsigned long ccu_pll_get_vco_freq(struct clk_hw *hw)
>> +{
>> +    const struct ccu_pll_rate_tbl *pll_rate_table;
>> +    struct ccu_pll *p = hw_to_ccu_pll(hw);
>> +    struct ccu_common *common = &p->common;
>> +    u32 swcr1, swcr3, size;
>> +    int i;
>> +
>> +    ccu_read(swcr1, common, &swcr1);
>> +    ccu_read(swcr3, common, &swcr3);
> 
> You are masking off the EN bit, but you should really be
> using a mask defining which bits are valid instead.  As
> I said earlier:
> 
> #define SPACEMIT_PLL_SWCR3_MASK    ~(SPACEMIT_PLL_SWCR3_EN)
> 
>> +    swcr3 &= ~PLL_SWCR3_EN;
> 
>      swcr3 &= SPACEMIT_PLL_SWCR3_MASK;
>> +
>> +    pll_rate_table = p->pll.rate_tbl;
>> +    size = p->pll.tbl_size;
>> +
>> +    for (i = 0; i < size; i++) {
>> +        if (pll_rate_table[i].swcr1 == swcr1 &&
>> +            pll_rate_table[i].swcr3 == swcr3)
>> +            return pll_rate_table[i].rate;
>> +    }
>> +
> 
> I have a general question here.  Once you set one of these
> clock rates, it will always use one of the rates defined
> in the table.
> 
> But what about initially?  Could the hardware start in a
> state that is not defined by this code?  Do you *set* the
> rate initially?  Should you (at least the first time the
> clock is prepared/enabled)?

When doing some testing today I found that the WARN_ON_ONCE()
got called.  I added some information and learned that the
values in hardware of the swcr1 and swcr3 registers were:
   swcr1:  0x0050cd61
   swcr3:  0x3fe00000
I'm not sure which PLL was being used.

So clearly this can happen.  Somehow you need to find a way
to ensure that these registers are initialized to a sane
state (meaning one defined within pll_rate_table[]).

					-Alex

>> +    WARN_ON_ONCE(1);
> 
> Maybe WARN_ONCE(true, "msg");. . .
