Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA820D50B
	for <spacemit@lists.linux.dev>; Tue, 22 Jul 2025 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187584; cv=none; b=aKvej7MJaguZEgikgLlRwA1wk20UivFVe7Y/scUOg4dk1NfX5IYshtiwema9+/Gol0SSoNeqvS9msCC08rBE53PLN+yvGVBkM/pWCDrxK9I+8ukagm9Dv5Br4oJ8pWfngOzJ5uvSZXmBzIuMch6plHwi+q/99CRJK2TuTSYt1mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187584; c=relaxed/simple;
	bh=XhhXlVRw6F1HLo12SCcAfi2XIRnFu3XLfX0xBUiPuF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPSI9TSL9PjPwj+NP/JfCXqMZBFzEsF0PRbW5LVG3XmL6RNJ4rTGs853ls8XcqA+yjD5c8hdNAqJZD8OVP/ZP3u86y0s5uFjyReTmnjv52274+Xt6egTsIXsdV+2uHpany3UL8GbtBtFsUlRJk2Ng5irgrqgAr5HPKQ/g2hRk8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=12Pqudcu; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="12Pqudcu"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-701046cfeefso84033016d6.2
        for <spacemit@lists.linux.dev>; Tue, 22 Jul 2025 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753187580; x=1753792380; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIXKcH5BFLN2ZbzCLvQD1G6ItZu5liVuUr8w7IySvR4=;
        b=12PqudcuHDppBGf55mm58wH0lOglvd8xk5Ehn1AdjtdHG5sgW7GXQiDhZxMYHrM36X
         8lygUOuKsxkTUGM3lTOiKQAgpcUJyfzrjiITXKbV8HPr++uXZH1ucUn7aHy46MQZuLIL
         dCr7LB/6KLT/tDbhuGoXgfbYFqzWY9Bd8AOuFnTAvAio9aGsRACsn1qnvtoFqB/57csj
         YYPMefqGfRerCr8Vk+4cmqfXD/w5q/aqelCoAthCeSfES8TSji+qVQKltitkwh/g3wFn
         qzUPtXGIVjTj0aIHVWEdtobL5bDc29WzJjmzAxY44xanKj7O5XXvvBOMkVIZ3UyvvyfX
         4X0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187580; x=1753792380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIXKcH5BFLN2ZbzCLvQD1G6ItZu5liVuUr8w7IySvR4=;
        b=cBZTV/Qs7TizZSMu4o8xgwKj8/7hQ+Mvl8lipwoSusQDaeuMp/veDPjcg4TsqdmB7I
         GjMx2Ezo8NsCVqVWWGLo/LWLJl64ldu2qkj/NEruU+RK8OYQJEAOqvTCdeXCzYKiHT0J
         2jIlK5Bkbb8rV/Nxl5Uku0lYtR2Twfv+uGbNFaMhKsbU0ghF0ZflgI1EdnJjrH3ZkobI
         U/lF7CyFUdsWwn3a5qHE3kgLaU3rYHChY7xMB5m2PKDr79G0ERi+P9vLiPKvGqQ596EO
         KOZkUb0M/PzeZvtYLmvpOhMw9P6WoPl/oEcTIKcavLb8Y88eNj0xnIpJ9T6owF0OzVCL
         uCRA==
X-Forwarded-Encrypted: i=1; AJvYcCXnxleJ+OVvm2VWNfdRODafZMHVX8AcnILt+LedLZjEoJP/xDsh4eb2hb4RcAi1UzixlWKKBVzq/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKSCA3siALKy8ZkMS2fzsDINMMMWmVMX3vGzrO0pDz9fml9vuj
	CtCoVanyPwBK7qSl0TmsjlUsXjnEONK0LLYGBZJpQ3JJFfwGzz86dXqbIs+wibZUnkg=
X-Gm-Gg: ASbGnctFUZMLL0d8Sgx7dJnwG2L3iXHczR2OtfUNJKuIIYLYHFzWDT8ecxBcH3uFn/B
	HWFbnwRJ15oLmiDhFO1UJTW4b+X42EA9CVrILU1hOCUIKcghiUsj9+iMaM9aEuhnd5eP7qmNsSl
	Fap+bDdeaZm9wE0UgTHIQvGIaSYbFTwMkjc32DJpCvARRa5wDdNnFGOjPdI1ejUMn1CfX6L7vBJ
	c5uCIY0smO+3DetPRLdESlX6d36QcPtm76pzlBnUOsEaIAM3VXeS7ZYMJzj/GIVunG82n6vSMR0
	nQ/UQFSdIoidY63tgEfJ3BduJS0TeojHHT1yd1SWv53FSNlb1XKrEtP+eyPv4L0pz5yUSbci88Y
	HapvJawklA5ycpMb941V9lLuZJkteshpKV92TRTGQr+RYA4FQxrNAwzbqTmSI7UidLsJE6m8=
X-Google-Smtp-Source: AGHT+IG1XORWN4jprJEi5Zq8+C3EGaNg8eBzovmEwMCoERAkUr764LT8y1WytHb49WzOljrg37pQSg==
X-Received: by 2002:a05:6214:5886:b0:6fa:c2a4:f806 with SMTP id 6a1803df08f44-7051a11461dmr225240826d6.29.1753187578843;
        Tue, 22 Jul 2025 05:32:58 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051baa8760sm50251346d6.92.2025.07.22.05.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 05:32:58 -0700 (PDT)
Message-ID: <d6f147bf-2816-47d7-9a48-47562b8dde06@riscstar.com>
Date: Tue, 22 Jul 2025 07:32:56 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: ccu_pll: fix error return value in
 recalc_rate callback
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>, mturquette@baylibre.com,
 sboyd@kernel.org, dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heylenay@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 unicornxdotw@foxmail.com, jszhang@kernel.org,
 zhangmeng.kevin@linux.spacemit.com, akhileshpatilvnit@gmail.com,
 skhan@linuxfoundation.org
References: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/25 2:07 PM, Akhilesh Patil wrote:
> Return 0 instead of -EINVAL if function ccu_pll_recalc_rate() fails to
> get correct rate entry. Follow .recalc_rate callback documentation
> as mentioned in include/linux/clk-provider.h for error return value.

"If the driver cannot figure out a rate for this clock, it
must return 0."

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>   drivers/clk/spacemit/ccu_pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> index 4427dcfbbb97..45f540073a65 100644
> --- a/drivers/clk/spacemit/ccu_pll.c
> +++ b/drivers/clk/spacemit/ccu_pll.c
> @@ -122,7 +122,7 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
>   
>   	WARN_ON_ONCE(!entry);
>   
> -	return entry ? entry->rate : -EINVAL;
> +	return entry ? entry->rate : 0;
>   }
>   
>   static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,

