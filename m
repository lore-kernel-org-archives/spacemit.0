Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CDB27E077
	for <spacemit@lists.linux.dev>; Fri,  2 Jan 2026 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767368556; cv=none; b=G4vIhWiFOVHXGoDh1xM6kPyD/26/cdpEBWP0LyW3BcUpKjHZd+ISnmv/Bsm983LTg6ml/fUW0RSWLry22pkcwPCvtQ+CNj3kyo4wUDpPpvL3WkcZjnyu9y3oEBJVHOO3wFhqtOrM+cueqvga97F8Like3R6fiGuc+f7nIg65rpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767368556; c=relaxed/simple;
	bh=BmM5e78HhKYOvlDIYE4RRFqZBVOR4W9ZbNBx6py87uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkZq9l1fQQ0HdOEWK38QJN+7NjDiU/lWrY794YmP4YKiQzqZo7L/ca6z33gPwkrWXAvGWnpa2YhXKh5N4snO9fk+zK1+BIkPNdiFt4gkbWrydj8UOK+2mhO7lJzz/HTGHdC0+2HysrWqSLlZAMLBJtZ6bCuzM8qQRRVWwm9Ml0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rnxgMAwb; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rnxgMAwb"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88a367a1db0so209059606d6.3
        for <spacemit@lists.linux.dev>; Fri, 02 Jan 2026 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767368553; x=1767973353; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kRQ6lI0yURL+aAlnleRfH8zPOO8HWmEFC9LuCb81Lw=;
        b=rnxgMAwb04W6e2ooa9nD7L/ely0cc0pvc9xWRSU3989bi+zbdz3OIserX0wdW6sb9t
         rJOL721FC50JtRfYzPCsfo0ds/JKF/n94PE29wugcxS+KSWv9IprqmUXH5b3ootv3+cd
         ZkxdkCn+8AagqUn9Jf5mI0bhWUd5GbWPU8EHVsPFxQs3R2MRXN2zzdAF1m5DCAiYpRyx
         IXxDUh9a19vyq7Iu9cu/j0psd06KAeZ/FlDEcVeXXkcmSnqBIW8pLwhxJY3xIoIrRRO+
         wYDFs86jKEhK+jpe8ows0D7UEd56Q3hP83TVoEbVOqstxqoul+/mEb0gzSWuggabTU5S
         coJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767368553; x=1767973353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kRQ6lI0yURL+aAlnleRfH8zPOO8HWmEFC9LuCb81Lw=;
        b=mI2tA5jMknOWtpM1VKKKULKeHFKKUy0gatfVhHPFJpbTLVGTVEmBw4C5Jusp/Rjja6
         0O09zmLPz2O2qiMNHLB3DiTijUuaAuA9A5TakW4ymx250qaNTtwPSTc1lttFynURPRif
         dT9pY80VgCEeURq2Z1FTTVg3gWEFdC88sBbyaWFT8SUKFKC48XqSflm3WD6RVW2Q52iQ
         JADGFyqdoRiEH9cMUQlyMzp5ZY6zfkMZiThg0LpLVY0MfhmDVuSYCwbBzcGY/KF3FMFG
         MKuXokiu/I4brvaBz6KhKUEj1Dc5GAN7Eid3iO7TFPG5Tb01SUca+vCqXlIFVnljsfN2
         fVNA==
X-Forwarded-Encrypted: i=1; AJvYcCWtO+wQU5vHD8z5DOqnLoZe6FNV2G11xoJgAu1dL8uECzNYdoNmXOPjqx81X0qQocjfOlS+mGRE3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3NKixU/1/ViH5NhUygK1wrYso9R7IH3gWpjcHV/gVjhNEef9V
	VaR0E+zgFgONhVxAKinUa7RMzrSU530clVv1hiRpKUElTSPUDu8H7vqzU8injdyWxC8=
X-Gm-Gg: AY/fxX58Gxh8jXwDXnspZkjlCHx9yHXlNpcxkgYQN2WUB+fHzAwezOryYMtynT3k84f
	wSqWzaIol6XDPwSdBnQg3QP95MFUF5XBRZhzKBHV9dRelR8Jt7RoxNRQlmmPOd98cjIQbSWSUT8
	iUGVDXZ2jF9YS1Z4ivr2QFN1IwiUA4h4iPZOtb61UQkAaaB06VOzQRe3IuKe/6CZA7TvK9WH0ca
	7Go27PooJdzI8rn07JMsZIdOc2DePSV1n0/ew1Hgue2s3buflhxkT1G37qvV5PR9EQ4DyYL4djd
	zRNQ0HsPYGMBUBY0kaKWdyIRyrn/0900E7Jaf6JWKqvy2BPSCi3TRI9KU26UD2TGS3+k7LqD72Y
	v8oDVx23AVYx8WmgFgXNe6vXIOpkbTqZNKolp1h7x2GBdaZ0qqftPD3+uIQxu+6VwIQ2tBKxjAj
	ra+ydImtOPkzW6N1fehtfE9ePcnzJ1fTOZczxUYXA9jOff02+FwkQ=
X-Google-Smtp-Source: AGHT+IHarPGP+a/gi2jHTk/zZ1FUDX+GiXA1A9njg4s5U5Nap7W/VCsy/W+a7XWuBcfyTfBnYizIrQ==
X-Received: by 2002:a05:6214:246f:b0:88f:e332:c009 with SMTP id 6a1803df08f44-88fe332c1f5mr429892206d6.12.1767368553381;
        Fri, 02 Jan 2026 07:42:33 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeff4sm326161116d6.29.2026.01.02.07.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 07:42:33 -0800 (PST)
Message-ID: <cc1cb833-2c4a-4e20-a50d-109a4919e274@riscstar.com>
Date: Fri, 2 Jan 2026 09:42:32 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
 <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
 <20260101143810-GYC2019108@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260101143810-GYC2019108@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/1/26 8:38 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 18:50 Mon 29 Dec     , Alex Elder wrote:
>> On 12/26/25 12:55 AM, Yixun Lan wrote:
>>> In order to prepare adding clock driver for new SoC, extract common
>>> ccu header file, so it can be shared by all drivers.
>>
>> You are moving the definition of the SpacemiT CCU auxiliary
>> device structure, plus the to_spacemit_ccu_adev() function,
>> into a new header file.
> yes, and this is explaining the code which I consider not necessary,
> it's more obvious to read the code..
> 
>> The reason you're doing this is
>> because these two things are generic, but they're defined
>> in the K1 SoC-specific header file "k1-syscon.h".  So you
>> are creating a new header file for this purpose.
>>
> right
>> These are things you should explain here, to help orient
>> reviewers and will inform anyone in the future looking at
>> commit history.
> I thought I've explained the goal/motivation already with above
> commit message, maybe I can improve it, so how about:
> 
> In order to prepare adding clock driver for new K3 SoC, extract generic
> code to a separate common ccu header file, so they are not defined
> in K1 SoC-specific file, and then can be shared by all drivers.

This would be much better.  You don't need to explain every detail
of the code, but providing the motivation this way and explaining
it at a high level helps the reader a lot.

>>> Also introduce a reset name macro, so it can be both used in clock
>>> and reset subsystem, explicitly to make them match each other.
>>
>> This should go in a separate patch, and should change the
>> code to use the macro so it builds and continues to function
>> with the new change place.
>>
> yes, I could do this in a separate patch
> 
>> However I don't understand why you think it's necessary to
>> introduce the reset name macro.  Is it because you want to
>> incorporate an SoC identifier in the name?
>>
> I've explained here:
> https://lore.kernel.org/r/20251231020951-GYA2019108@gentoo.org
> 
> It's necessary to incorporate the SoC identifier which will help
> to differentiate K1 and K3 reset driver, otherwise there will be
> driver name collision, lead to reset driver probe failure while
> adding K3 SoC ..

I just had a talk with Guodong and he helped clear up a
misunderstanding I had about this.  I was thinking about
what happens at probe time, and that only the K1 or the
K3 CCU will get registered.

But he explained that the issue is that two *drivers* claim
to support the same "compatible" auxiliary device name, and
even if only the K1 CCU got registered, both reset drivers
are available in the kernel and you still need to specify
which reset driver you want use.

You are implementing both the K1 and K3 reset code in the
same module, which I think is why this is necessary.

>> Even if this is your reason, I still don't think you need
>> the macro.  I'll try to explain what I mean in the
>> next patch.
>>
> If you still have concerns, and we can't reach certain agreement,
> then I could drop this macro in next version, leave this optimization
> to future patches, I don't want main clock driver delayed by it.

No I no longer have concerns and I accept that you need to
encode the platform/SoC in the reset auxiliary device name.

> I personally tend to keep the macro, but probably the naming need some
> improvement..

What I'd prefer is to just name the resets directly, to encode the
platform ("k1" or "k3") where defined.  I.e.,

  static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.reset_name	= "mpmu-reset",
+	.reset_name	= "k1-mpmu-reset",
  	.hws		= k1_ccu_mpmu_hws,
  	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
  };

Does this lead to a problem somewhere else?  What does hiding
this convention behind the _K_RST() macro do that's better
than this?  Is it because you want the separate clock and
reset drivers to use the same convention?

I think it's a little more difficult to talk about this because
we're talking about changes that are implemented by two separate
patch series.

>> One more comment, below.
>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>>    include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>>>    include/soc/spacemit/k1-syscon.h | 13 +++----------
>>>    2 files changed, 24 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
>>> new file mode 100644
>>> index 000000000000..84dcdecccc05
>>> --- /dev/null
>>> +++ b/include/soc/spacemit/ccu.h
>>> @@ -0,0 +1,21 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __SOC_SPACEMIT_CCU_H__
>>> +#define __SOC_SPACEMIT_CCU_H__
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +/* Auxiliary device used to represent a CCU reset controller */
>>> +struct spacemit_ccu_adev {
>>> +	struct auxiliary_device adev;
>>> +	struct regmap *regmap;
>>> +};
>>> +
>>> +static inline struct spacemit_ccu_adev *
>>> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
>>> +{
>>> +	return container_of(adev, struct spacemit_ccu_adev, adev);
>>> +}
>>> +
>>> +#endif /* __SOC_SPACEMIT_CCU_H__ */
>>> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
>>> index 354751562c55..13efa7a30853 100644
>>> --- a/include/soc/spacemit/k1-syscon.h
>>> +++ b/include/soc/spacemit/k1-syscon.h
>>> @@ -5,17 +5,10 @@
>>>    #ifndef __SOC_K1_SYSCON_H__
>>>    #define __SOC_K1_SYSCON_H__
>>>    
>>> -/* Auxiliary device used to represent a CCU reset controller */
>>> -struct spacemit_ccu_adev {
>>> -	struct auxiliary_device adev;
>>> -	struct regmap *regmap;
>>> -};
>>> +#include "ccu.h"
>>>    
>>> -static inline struct spacemit_ccu_adev *
>>> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
>>> -{
>>> -	return container_of(adev, struct spacemit_ccu_adev, adev);
>>> -}
>>> +/* Reset name macro, should match in clock and reset */
>>> +#define _K_RST(_unit)			"k1-" #_unit "-reset"
>>
>> The generic-sounding _K_RST() encodes "k1" in the name,
>> and it shouldn't.  Also, why do you use the underscore
>> prefix?
>>
> want to make it slightly generic/short but still keep it local for K1 driver,
> and also avoid potential collision with other drivers in kernel code..
> 
> or do you have any sugestion for better naming?

First, I suggest you avoid even using such a macro.  But I
could be wrong about that too...

I would name it RESET_NAME(_unit) or something similar.  It's
only used by code and DTS files that are related to SpacemiT
platforms.

					-Alex

>> Anyway, I'll keep reading.
>>
>> 					-Alex
>>
>>>    
>>>    /* APBS register offset */
>>>    #define APBS_PLL1_SWCR1			0x100
>>>
>>
>>
> 

