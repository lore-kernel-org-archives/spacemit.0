Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A691DDC1D
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 00:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766969802; cv=none; b=hwOII4QxhAZ2jQEe6bqdOjSPzm9mIDZFV9dtg2DLHS6NrSV9xPo3dYHeNaH5plQ1hGmGr9rReVpOfHTm4/poCMv1gCLRDy3omE+hDCY8HYL6siX8O3YZh6vhF747H/zKI2OWT5HRFVwLX10768dYeq3psSOvqRm8YtUo1g+Ga9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766969802; c=relaxed/simple;
	bh=v9oOvjyAlBRUlSFD3Ik/hUyGuidHyTn+MG0ZyLe29Xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnriSEt3+CE5D//nNaZpgR+ndyaNBRof1AtOTMF+bTekMhEnZ4MRgf/aLqa7qOvbdPOTuXNyA/u/DJFZzHJkO0lWwWjY6PEykvr5+DLB0n+Pc/7lee7PD3mFtRGUqL//+GWEl6/apCSrEwoZwgszaGLCEYwS+6M+qcE946O4ioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3Y0+AhNp; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3Y0+AhNp"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c15e8b2f1aso499973285a.0
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 16:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969799; x=1767574599; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5YcKwFkMbcJ8/aWNC56rcK6ZT2Jj+wm+CfNyGhVwCA=;
        b=3Y0+AhNpZZFqt8L3Gs1Hlf6tsZNGRyun5L+ebAWDaFQqXxAYD6OABHQAtc8l7jopah
         MQpt0Nbu9fxR2aEiBwheFQfL024FLpepyVsrX5BE0nv7vMiOxTAY60GscwlxGDhw2IY2
         L7CXHlZue/uGO51QsV+E9gAirDiAr9ROXf1yTmiE8vobOfuS88OsnY3bDJozZMNWlLsM
         1nKWpkpuGgFP846J6537Roo9xUlR5JEBY/YtfeEdwJtiRmOihvXKoKp7uh9HtUA4JFKy
         aeVe9HefC3JIj5QxWvpJmShx+2QAmg10rPBmZwLBVxjssOKAtfATki1jC6Lp90xJZA2S
         SbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969799; x=1767574599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5YcKwFkMbcJ8/aWNC56rcK6ZT2Jj+wm+CfNyGhVwCA=;
        b=Aju+YR1CA39uDjma+RoRuzKGa+NxVL/W2DqmU/i7QWZ/uhaggi1QCq4BIw1Se00lqy
         PEBiYf7RoeYz2jl3MSRrLuuy1+t2XWHNleHZa2nobCqqebBG4bB0D5/7ejdDblOLkMq2
         gUBm4lhoL0UBfB9q59V0I5aB+ia2cRNWL+oTdyEC+Yfid1hsTh+7rEbKDxm4LQueXnVD
         xs52/mZmZhXNwppfgRrmeoZkFBYKyIPYYOaz6AGm/X3hUxA5eIT1bZFfQFoQGee821+9
         X/Lcy0V1wOYxK6Y+MSXks8hgpdV/3Mp5S1WIdN9GQC61lnTtG81gxXza+s543W53+q3H
         1R8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcuRwysMkusyUmTbmYM3KIvjt4cKuVBfInxRFb88V1hEB4mmW9Vc+IhHbqwFHvoOtsh3nljq92jA==@lists.linux.dev
X-Gm-Message-State: AOJu0YypHq1L6MUZI/s5MeoX2kv4t1bVOhBWSDo48r7bjbsTtcmxbQ30
	H+/XH4GjvW9jS8+RMHyDS6ooFnZ/yCddpHR/VIAOIZqQ/wMotTc03KMy7adxfpijQpM=
X-Gm-Gg: AY/fxX7LKXeun0Uj+SQVHEGuSSZgpvmrCenv5gB89jCR/q9ykJeJ0oJDLAdzSRn1sak
	cUER7MvaLhCbWxelLBT/HdZG/6udSgCGQVmFa62t6Ls0R7yafcJKaJfTI3tArfZPNK3GEdwmUXn
	Mz5zqmOar+8MOF5Obo3uCtYXbEt67efsKam6SCMEz+ZL2zA4cuvqpjfMC/us+X4oHcnmqqwg5NM
	OKvenc2uvwIp2fJlDM0Y/t3g2QZXriA9jd5HAnL4Ho9/jdDWcGdke0aUq3iLhplPcW1pi6j86LI
	ThqyaNSoFeet994Dg3M0k7mzJnwo/o04v7H2u71TT04e6fR9HOIjerpLJltXwhDgEEwbmwwJ33B
	JH4YtrAqyrTQcfalqf03g2cXK8GGE3Wxtp+Rj3pk3vzlnQuBFAhp96DCTAn253gjIUrhYu9yuvt
	NnyV4+AUaZs9eb2Ri8mWu8smkDsNNf7+6e+hjnAd2sloNBSquIEng=
X-Google-Smtp-Source: AGHT+IEX3O6y7wxbcIj6mJ9uEHV/yCicWvg4d6PHddWSgifd55NeGPWTFcT2cuAr4CpJraSKfFGlGA==
X-Received: by 2002:a05:620a:4489:b0:8b2:f1f3:900e with SMTP id af79cd13be357-8c08fac0b38mr4258385485a.62.1766969799303;
        Sun, 28 Dec 2025 16:56:39 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f08fcsm2275235285a.40.2025.12.28.16.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:56:38 -0800 (PST)
Message-ID: <b09d6add-40d8-4deb-b63e-31adc9f327b1@riscstar.com>
Date: Sun, 28 Dec 2025 18:56:38 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] i2c: spacemit: drop warning when clock-frequency
 property is absent
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 2:32 AM, Troy Mitchell wrote:
> The clock-frequency property is optional according to the DT binding.
> Do not emit a warning when the property is missing and fall back to the
> default frequency instead.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Any error reading the "clock-frequency" property will simply leave
i2c->clock_freq alone.  This is good.

But the lines that follow this issue a warning if i2c->clock_freq
is 0.  If it's optional, you should simply use a default value,
and although you could state that rate with dev_info(), you should
not warn about it.

					-Alex
> ---
>   drivers/i2c/busses/i2c-k1.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index f0c35e23f4f2e139da0d09f314f3eb0e0462a382..c829618a66a214a12b46d63bf06ba7947b9dbbb8 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -651,9 +651,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   	if (!i2c)
>   		return -ENOMEM;
>   
> -	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
> -	if (ret && ret != -EINVAL)
> -		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
> +	of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
>   
>   	/* For now, this driver doesn't support high-speed. */
>   	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> 

