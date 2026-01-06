Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875A29D260
	for <spacemit@lists.linux.dev>; Tue,  6 Jan 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710639; cv=none; b=AtVwA6MI86jDW9h8M22ty8x01pfkyMmH3qwIMuHL25AqfgOumYiYgcUGd6fAb/kgOYBwwXY8xrI6PVWU4lf7rI7+yuSy4XnoKM/uCwT4XtTF9gNwg6d/Q0ofB7RENFZi7ufDrOC2sHho6sdOe99nq1mu34jzTzErtfqMjzMyRRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710639; c=relaxed/simple;
	bh=lgMKRFdh5v9iRb/pm3a055Mp9ATD38LF+MvykHbBixc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxVit4HweMYIuyG+89B4lETyzltQcVSvhgnkcjKY0vzbIYwQy4yfgYruwsdagPcXXpGspkVrS1CUkSYyF6Nbxtf58JXPRVXd8TrJlPBnt0pizb70qZkcoeXZ4RDGu47PQYFgTull2aKDOD0qEYCpJAsDrAret6zgXvux6B+JGSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0DLSoM28; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0DLSoM28"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2d32b9777so129696685a.2
        for <spacemit@lists.linux.dev>; Tue, 06 Jan 2026 06:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710635; x=1768315435; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjnd3cJi73pItwYWnZ/AGVro8SITV6ewWmgFqzGpdOc=;
        b=0DLSoM28gaS37KI5FCFlWtofk1Z9ycj/hd0vwH5QYX/Jz9imuxvnoJYhHOIbwN/QXl
         ATjPTWha3PaF++AHZQSyOPU+QzAq9SPKkJNgEdsWEGoTccGyTwxZUupfWAtbfoCJY3F+
         WKvf9nS4XaEa9LRJrN1Q86ur9KBklL3vntwB9GFKNE9Oa9C3AHP/iTBvZYNe8e82wBJY
         3V1K6FzWtFKO/6cY7dmnwhWetEih2EfXdKpz1Qm795vDJr18bo9H97aZuNnMh8aWJX1x
         E0SvHqOSX27A421qJUEm95UthI15vTp1N3BH6+NixfNqOXXb3k4oJ43Mqoc1E3Tp+NZH
         bfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710635; x=1768315435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjnd3cJi73pItwYWnZ/AGVro8SITV6ewWmgFqzGpdOc=;
        b=pi7wbyddw6yBct8w8sW3roRwYeABogj+E7CZ0/Hst02xDpNWdbmGS3eJAI8OO6S2gU
         0z+aJMi/lse1LgGpg+FJTEla/AXe0MIyxwLImvozPG5MjT6VsBRYrfP4jR0ZC0vHpM20
         eo0yR4GKmi4MDFxw3+l19ucEo2nodr/Rpush7d5MxdyrNLwHxIdkN1MZ2tuVhoTuH63e
         7Q5aTAuLKXceXK7yUhfb8GP2O3qUAd1QkPhOBmrniZ/gw3IExmqBh1+3A91ay9aH7Jnr
         FCmF7fcvus6LqLTLJ/4/Qh21pyzZBGM8Uxd6rPHM2h2SWvz6M6jaxNkG9LUTU9lnjmzw
         X/3g==
X-Forwarded-Encrypted: i=1; AJvYcCWSR5YgDSyioyMpFcy6JPoxmsFbGsfR24Spbn/ON9YIuzj959vhknkeoparHb53Ch2uzK/fqfPRNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+OfORjne7jHO/gEV2EQXSIaYTeaIv2CGrDTVQ3vlk+13tfOC3
	Ng5bNKTaJ1VR5c3xrcH7VndxsPNFv6RFyb9IuhuqTYtn/s/+03nshdl9Tl+hgZD/5s4=
X-Gm-Gg: AY/fxX6++iC7R2BvjFbmikv09QuIg/YC217eXi1wVWDlUqFdzYTsuE/taM3814DPpi/
	unURlGZBdlFvhVgrS0XkmugI2RnDyQmHjzRr4QwOi7qzFgVjb2Cjw7E8SQ656cty1FNxF4I/kWI
	eyFAmLSe89JHson6/DnURvVk8bRrz1CMgTjG4aCK9dnTR+KWUHTzkK4mSb0WF/3TSUt7O3odRts
	RjWVltsLGf6Qwcv1aQtt+Y1KWGnlS8Dv+4LhJaM6D4m1TX7iP0HX5cu6k69DNEW67ntLwBWbZwZ
	9TaO7aROMNIsaafe+467xrsfd3XSLj9+jxk3ctbvUg4zH3TX3DCQnaMPq31GOOpRIyBcIzFBNRM
	/ywcdmgdzWDfPttHl2YZ3yYy1DrfYeJ3UBbcXYUTsaiovUlckwPmwrCDecUao8W010g9lzwM156
	GxOfHJmlfJiPekk5fJO5AExwbO130VVgNkyHa18JrdtPragGlVLdA=
X-Google-Smtp-Source: AGHT+IEt3VwJP5rxykKJZ4q+39Q3RxlylF53FJBHrqUXpOK98r/RkrMmPUkkduDxAmcDVa9qHWO1bA==
X-Received: by 2002:a05:620a:254a:b0:8b2:1f8d:f115 with SMTP id af79cd13be357-8c37ebcb5b5mr442348785a.65.1767710634577;
        Tue, 06 Jan 2026 06:43:54 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:43:54 -0800 (PST)
Message-ID: <9ceca23a-8709-43b4-b266-38cc0d924aac@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:52 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-1-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-1-6061d9f69eef@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 1:26 AM, Yixun Lan wrote:
> In order to prepare adding clock driver for new K3 SoC, extract generic
> code to a separate common ccu header file, so they are not defined
> in K1 SoC-specific file, and then can be shared by all clock drivers.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>   include/soc/spacemit/k1-syscon.h | 12 +-----------
>   2 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
> new file mode 100644
> index 000000000000..84dcdecccc05
> --- /dev/null
> +++ b/include/soc/spacemit/ccu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_SPACEMIT_CCU_H__
> +#define __SOC_SPACEMIT_CCU_H__
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/regmap.h>
> +
> +/* Auxiliary device used to represent a CCU reset controller */
> +struct spacemit_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct spacemit_ccu_adev *
> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> +{
> +	return container_of(adev, struct spacemit_ccu_adev, adev);
> +}
> +
> +#endif /* __SOC_SPACEMIT_CCU_H__ */
> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> index 354751562c55..0be7a2e8d445 100644
> --- a/include/soc/spacemit/k1-syscon.h
> +++ b/include/soc/spacemit/k1-syscon.h
> @@ -5,17 +5,7 @@
>   #ifndef __SOC_K1_SYSCON_H__
>   #define __SOC_K1_SYSCON_H__
>   
> -/* Auxiliary device used to represent a CCU reset controller */
> -struct spacemit_ccu_adev {
> -	struct auxiliary_device adev;
> -	struct regmap *regmap;
> -};
> -
> -static inline struct spacemit_ccu_adev *
> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> -{
> -	return container_of(adev, struct spacemit_ccu_adev, adev);
> -}
> +#include "ccu.h"
>   
>   /* APBS register offset */
>   #define APBS_PLL1_SWCR1			0x100
> 

