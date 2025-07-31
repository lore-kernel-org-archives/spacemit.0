Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62B32C08C1
	for <spacemit@lists.linux.dev>; Thu, 31 Jul 2025 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753968507; cv=none; b=A3t9H/pem7IGdzjxCIS2vJFGuBsvDhQ2Z7Eyy6roEWzx86e0xjjrwncKY1G+4RhcMcWAVLM4QJC6b7XFzLZEeABkSGZ4TzQXBbFMTs5uRulleBugckgfeR1bTfG35+d02cj6eAmDnzWiYgnlMh5haUnr87ZexbPPcZjAGSu0QF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753968507; c=relaxed/simple;
	bh=i9Ok6TMVJzIWF/A/OfsfP1hoZ9qTWvQyujzq0OMG6yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDvzLKxVLv5pQWrbw9dltVBwB9BAXVJ3OLnGCF07055+fSh1DYOTBVAnS+QopQ2FGNThl7s0cvyWxVV3Y1nOgfWzlgLpQZn3V3/0c+ypKGwoBw1QChoLs8HjzVq4TEMvQccvaIX/hbK80T1Yh7hzVn+JPoa1aBguN+5PO+vRafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=imG5cwQO; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="imG5cwQO"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-87c070b2dfbso11108039f.3
        for <spacemit@lists.linux.dev>; Thu, 31 Jul 2025 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753968504; x=1754573304; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZXm9ki9DqMqybY0nwzk30YMFU8vNsqP6e+BF0/SCW8=;
        b=imG5cwQO0QPjsu+ZWVjAtlrT8ccLzaTqiKfeKc5zSb3Iq2zB+EwSu9P3JZA6QW+HD+
         XjVWDLXKYLURzqbTrLAWTl9mpiJ9AxGZndVBCLQbhmf6cHAJt4kZjj85ScofZKhhjtex
         gymu9WrgxyVm5tMeLPZsaEe7ObgMTN30NO7QmGxrW4U9ec1dnzoXtvecmSu179KhMzj9
         S3Mkox9t9qS99pzm5GEXmWqp79UjTFbAHEGt2ZWJGu6NRrtgwaPQoAJw8nerwh5fP3Rl
         qDI2ZVxuTc+OPt+L0h7vu5sYyKhtejVysryg7+PmUhcyhghLCFxZfqCjxtQNfxAvhndO
         Ujrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753968504; x=1754573304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZXm9ki9DqMqybY0nwzk30YMFU8vNsqP6e+BF0/SCW8=;
        b=a0p1j6pSHvneDxd2Fg+rjYCX3qBHCNttRQqy++EWWYVhG45MannsB61SAGLxxz4Gok
         0Z1+Rs8JxLS+RZ/Sa0N/NWyRqtkgN3xt3SsV2qISowbFzm3SdSncnXYG7ZoY7KB/uGlU
         RkL77FtephEHJw0mftgyVSgsyoeaITL/eBQ20CSu8vCpuC3KcpYUper6IHko2O9BRFNA
         nY0f6TtBQtKLsx4ObdHzJW7NCaUos6INbFuq5grddCwR/Uug2aAJfaT7ZpOCHGohg/Qs
         nzVWNIVCsb1Izdv3qRkQNkf7BR/n+wzGRHo4kry4zxiYgPukbco3Am9PkCNb1YmU1gBV
         uO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIu6+Q6m31cagaSF9MOqss6200bDDtErjErDTnJHtAOsGlVvgOrn1ABT8LXVbPom2rhNie4vIbZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWPYp/l1oN0FkPeAtUAWgbLhKWi7LIN6ayGEtQ3/8ox44BgrEe
	uh2n4V9JWmT9wPX/ouMI/lQyqVcR5ywzEfb5du+qMRA0XhMZVo6/zrUakB4rpx2cxpw=
X-Gm-Gg: ASbGncvZQUjNdPH8Wda7XJdl+ZlUCm8HozUT6KgJJCdIio2TwD++4MJcDgmn92cNJPg
	wBtPR+4YpD5ge+W8decXeF97/acG6tVQDt+p8n9ynMNTqUVTmK3RFgVYGtp+M7jKP5p7nx4TaUM
	Y3HrK4CthF2L1B7tFQY4N6P07l4hP1rcUD/Ql2KTzdEsqGHGwYHPnKYwMfFhd1i7CLrOGcWs0QW
	bODU/MXMxlUutMmZecsUAO9JFT1wesfJ03r6qDBKbpBzbxPPcpZG9UPaUjtL68FBgqvClOgNyws
	EiGHcCykCxciwZ6QJzJEoDepH7+q0UVYV3lh/7HSR96/xvZoSVhuGqRcozObeuL9EpmEEgJ7fxv
	ry1xtQ7AVRWX6mFIT4e9vedHF4xmtD7FBwanbIDJrFEH+3i8cXErdRts50K3SyQTV94iUDC05
X-Google-Smtp-Source: AGHT+IHVd8Qk8sqX9PKUb1Vz0+PsKeeTL23Bh9mFH1nZ3uKrxB6affe8zrVEVY8SyiLFctiuAowOkQ==
X-Received: by 2002:a05:6e02:16cc:b0:3e3:fc32:3178 with SMTP id e9e14a558f8ab-3e3fc323db0mr107094465ab.8.1753968503711;
        Thu, 31 Jul 2025 06:28:23 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e402b34285sm6538805ab.57.2025.07.31.06.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 06:28:23 -0700 (PDT)
Message-ID: <e3cd0e11-e516-4cf6-b8f8-5cf2b5a236a4@riscstar.com>
Date: Thu, 31 Jul 2025 08:28:21 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux.amoon@gmail.com,
 troymitchell988@gmail.com, guodong@riscstar.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250726131003.3137282-1-elder@riscstar.com>
 <20250726131003.3137282-3-elder@riscstar.com>
 <20250731131827.GG1049189@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250731131827.GG1049189@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/25 8:18 AM, Lee Jones wrote:
> On Sat, 26 Jul 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register 8-bit
>> value regmap configuration.  There is an option available for a device
>> to specify a custom configuration, but no existing device uses it.
>>
>> Rather than requiring a "full" regmap configuration to be provided to
>> change only the max_register value, Lee Jones suggested allowing
>> max_register to be specified in the simple_mfd_data structure.  The
>> 8-bit register 8-bit configuration is still used by default, but
>> max_register is also applied if it is non-zero.
>>
>> If both regmap_config and max_register are provided, the max_register
>> field in the regmap_config structure is ignored.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v10: - Rename simple_regmap_config() -> simple_regmap_config_get()
>>       - Introduce simple_regmap_config_put() to free regmap_config
>>
>>   drivers/mfd/simple-mfd-i2c.c | 45 ++++++++++++++++++++++++++++++++----
>>   drivers/mfd/simple-mfd-i2c.h |  5 +---
>>   2 files changed, 41 insertions(+), 9 deletions(-)
> 
> This has gone from an in-function 11 line change to 50 lines and the
> inclusion of 2 new functions.  As much as I _really_ appreciate the time
> and effort you have put into this [0], the added complexity being added
> here doesn't sit right with me.  How would you like to go back to your
> v4 idea of providing a bespoke regmap_config for for device?

I LOVE this suggestion.  I will send v11 shortly and it will
be very much like v6 (or something like that).

> [0] Beers on me for sending you down this path!

I'm looking forward to seeing you again, beer or not.

Thanks Lee.

					-Alex
