Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F62FFFBE
	for <spacemit@lists.linux.dev>; Tue,  6 Jan 2026 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767742954; cv=none; b=ouzaZLFwgaCtAKvthZJ/KpuJenxE3PJYOukg6S+vwr81PpeavMSEEaHnciTi/5SZJZrbipSOG27gZbwjVymCwP7kWetSesg+SqLw5xa5dciYXN1ullRA6ZQm0GxrtiNjPafjBkxI8M+7rZvYH8vve9couBJ9cBBS4TACKbGllbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767742954; c=relaxed/simple;
	bh=R6rj8LEgrtzYQ38K9/1rCGRowH0wALW9nTTNR9nIww8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQeTQhl8LiyUOVmH1B//EazSJSLhUzg5Jp3RbVatHCxUNvTZ11FfxiEfijvDwkrzXK6ok2NuGYCX6YD/uxRS1GCETo8CXnyQrYZWXPpY+t/UwICeYw4cnx/5PZt+bPWhlNxF5A4FSKZFz99HTofynUrYB/0mp+Eyzc+z+n3Sdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=S2l2R/aL; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="S2l2R/aL"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a34450f19so15051766d6.1
        for <spacemit@lists.linux.dev>; Tue, 06 Jan 2026 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767742951; x=1768347751; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfChIqKNcwmrZLIiAT7R5xSM6Gp2o3yGw0q++DE8G1k=;
        b=S2l2R/aLTm6SOpfx+Vxvter/i9v7kEPyuIl+Q+fSc7fq3XLJpr6NoakmlH7woq0Sn9
         uIMzdg6C/4DhFY1J4buVqz24WkiCjn9sCGQUg6YHOxenUOmJQLnHjBjKd7HHIbVKts/C
         OGsRe4Su+FrLaecRcxuJmhaG/uGyPR51nfDGMsCUyM4/FyKdDNRgbidlbhEgXXowcuUe
         7Jm6omB2L/1+xOJ8fvfg1T+3fINfP4Dv/a17wY9DpqNhLact+bPq+bN9sjwYSsImSfDl
         J/5DZt3ChBtUSFVdu9xSNR9GeSa9S5+wq5QrSYmNpOF55/vwRNLpL8WEdDqUiApB0znH
         iLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767742951; x=1768347751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfChIqKNcwmrZLIiAT7R5xSM6Gp2o3yGw0q++DE8G1k=;
        b=cy2ZjoKeeRqLJCLAlzo2qooLzBKdsReiXnBjent2h00XHGm/HE9ST5rD9+DZl4Rnei
         wiqta/lzLzv58526hUxTRiQlRrNCaDRCUNegpZJ22fB5bXjfUx38li2yb4Cquz+gNaP5
         hWDregak9VWyGV3xSdjSYyK/HR9Ecz3ITM1rR3NwYDn5JtldQLQspJlkOB/zc/zg/1g0
         nBQWO29bJJSgW3eAOEU1g+xkOXig8uVkpbE8KJVtDWQJmrI/6T3GdpQ6Q4Cg5DhDnAyZ
         SElkPHMh/9ZZgrZg/t8aiqMPGBfEwhwMPDBZih+EWv75mKGSBqYApCOEkEV7F8rU+GQD
         8qWg==
X-Forwarded-Encrypted: i=1; AJvYcCVXLxD8dnLS/Jdi5BYYrdhpWaX1nq/QId+HjI5YepJ3N6wNCys7nrilV7dJgyP9nCXU7gJ0gP1OLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGlHenzEPVMIOlOQohSb4+EbH/q6qLuSzIhQJFUXceDIiC5zv3
	cFVSvmZCVwZBYSRm8jvg/jFK17X8A2nRWVxVERvduajpd1/lPhlqXWxyAp8XRK1/2J4=
X-Gm-Gg: AY/fxX6sHEbFgJoRbseDBpaQUELgCPN0iSXwOQ34S7CEAzvSzY2Ha7e7x8Bk2WUAC6g
	3HFz99AU8Aie3wsE9ZKX0M2A1OqzcVAVDHgXzZpZ9f3+LEAC+fHSrfXaAudjevisk8YqDFnj7In
	QXOg47kapBBm/LLOd8Ucm7W+KlCl2QpBrwMF04HdfOqGdNNx0Tk/PSsjatxjsDYdo4SSSmeu+1x
	eZmNfTlZNma4vWEjDDqTzdMRFyk7Ld3ycEjSQ5knIVqPsMk9hdY+rXvrDJtx9KHHeuYDFUpW2Lr
	kKuE+p3+kWMqLFVgTrJHebVricps0+Um1lfO5cVdnXJamJ5kuRtH5gzzvfOvcn+9VfoFx4V7rQb
	nYEwzKslNiSUEBkiX9JUpLAKmHQci3SY4e6lmEYgraxkYpce0MUCZaQHWXaiOj8zm3lITUY1qtP
	O0cximzBe+Qfy+9X7YKCU1X2syMAjS7hGJWkWzrdI7mulWa0EBuMw=
X-Google-Smtp-Source: AGHT+IH1hw6SHnlsa+o57uQvBqGquCSnLrP81cZqJwz2JA/4lI4rccbRN4fom/VIn/Px/30MwTS1Zw==
X-Received: by 2002:a05:6214:d49:b0:888:710a:1750 with SMTP id 6a1803df08f44-890841ae7eemr10031776d6.31.1767742950921;
        Tue, 06 Jan 2026 15:42:30 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253305sm24209026d6.41.2026.01.06.15.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 15:42:30 -0800 (PST)
Message-ID: <255ff9c5-7662-47a4-b2b9-1fd740fc526d@riscstar.com>
Date: Tue, 6 Jan 2026 17:42:28 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: spacemit: extract common ccu functions
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yao Zi <me@ziyao.cc>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
 <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>
 <20260106222753-GYA2092678@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260106222753-GYA2092678@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 4:27 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 08:43 Tue 06 Jan     , Alex Elder wrote:
>> On 1/3/26 1:26 AM, Yixun Lan wrote:
>>> Refactor the probe function of SpacemiT's clock, and extract a common ccu
>>> file, so new clock driver added in the future can share the same code,
>>> which would lower the burden of maintenance. Since this commit changes the
>>> module name where the auxiliary device registered, the auxiliary device id
>>> need to be adjusted. Idea of the patch comes from the review of K3 clock
>>> driver, please refer to this disucssion[1] for more detail.
>>
>> Are all of the hunks of moved code moved without change (I
>> think so)?  If so I think it's worth mentioning that.  If
>> not, you should explain whatever differs, and why.  (I would
> yes, no literal changes with this patch except probe() refactored,
> and the real effective change is the module name changed which
> I mentioned already

Thanks for confirming.  No need to change your description,
just consider this for future patches.

>> expect the only thing that would have to change is making
>> spacemit_ccu_probe() public.)
> to make spacemit_ccu_probe() public, we move SoC specific code
> out of this function which should have no functionality change..
> 
> (I think the above commit message is ok, and would not plan to send
> out another version if no serious comment incoming, unless you insist)
> 
>>
>> I made one minor comment below.  I didn't verify, but I
>> assume this is all just moving the code around, and based
>> on that:
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>>
> [snip]...
>>> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
>>> index 4412c4104dab..5f05b17f8452 100644
>>> --- a/drivers/clk/spacemit/ccu_common.c
>>> +++ b/drivers/clk/spacemit/ccu_common.c
>>> @@ -1,6 +1,177 @@
>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>    
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/device/devres.h>
>>> +#include <linux/mfd/syscon.h>
>>>    #include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/slab.h>
>>> +#include <soc/spacemit/ccu.h>
>>> +
>>> +#include "ccu_common.h"
>>> +
>>> +static DEFINE_IDA(auxiliary_ids);
>>
>> I'd insert a space here to make the definition above stand out a
>> bit more.
>>
> do you mean a blank line?
> (I could do this while applying this patch since it's quite trivial..)

Yes that's what I mean, and yes, fine to add that when applying.

					-Alex
