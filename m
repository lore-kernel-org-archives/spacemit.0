Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E67347BC6
	for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 20:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763152634; cv=none; b=cV1pKv13OwukB9VXEyHLuIv5YPSfAgABScQpXko+nzzUK7E5M7YlShHex5D3dq2Ksa0gX23Gy3HOuep2LX1egr1wCHaOOiUMqrY8091eN3Ya1KdH9LQRmAjvq5FGjmCYMwGIzeH4NFhBB0QVObIiZJQYfGm6wkKl8+BBOkqaNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763152634; c=relaxed/simple;
	bh=GGyKMqTOrRRlYEJYyUkHW1qKj7v6NPI6LFAqWJU/hiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9Yf4Nwwu+3EMNojmefMrd3HZ89185wsuGIQnhi6JmZLaPWvChfuT0vbNuNsdQUoyFma7+zSspJMFpDchWzomI/Pq/O2hSYXY78fJFtv+QvKYjyIo78t6LmeRz99cJBf0WNJHpHKsl4EN4eHJSp/5mQ45vMdRRGA101NpwgT8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JjjAqoVh; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JjjAqoVh"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-43323851d03so9020505ab.0
        for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 12:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763152631; x=1763757431; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2N7A4sphnOSNn2VwNdf5jHhtrwzomqOxdOIMs+gXosY=;
        b=JjjAqoVhZUDaHSOjWCu2+oSSMMmeE1H7A9OM/ivWa49Uzv8w3Q/GYpIUHO4fL0Ed0y
         Hrp6aXCLb7WmrR5Fxdgc9GAIC9SKMu4ln7CtyRYuOvxKwKCSDGZYPR65dso3dsQAn9wF
         73eqts5HYbsPJZQ/Cr0JVyXCk8FBGm5xMDmfZCnNvysgPNtuKB5I1MtcYYJCnVhgi58t
         ONWW9/bstLWPlSVgf2bzKel3WTTvoNAOxETRKK3poZvIiAPa8ywJ5SPopTf0JZiyVzRH
         DlXrquhOsmjzeBunCschhtN1Hx6eicFVfexspyF5xHqrHtHrN0ap/ZNPlxG9zV/zrruy
         Ds5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763152631; x=1763757431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N7A4sphnOSNn2VwNdf5jHhtrwzomqOxdOIMs+gXosY=;
        b=ouEeewKoGX2h6rqDzkG67y5fM0fWkO0BLpNUHk1bJ2CpfP226xlE9/CmxKNOzar73a
         G0isVakYCuP7v7ltrQE9dygr/CVeyVCITHJs71N0q1W48nduXXsJs63VukioGQFIhhdH
         KcDTktj1n4SIyuvuPIfds0snZYIpbTA9J3XVZQOIX9KFHhQsysDT4cgJZ5spHdVaEvf9
         a40uD9MHagNMAn42ia565kHlTPS6EWYjdmTR7A7ejagw3NMn51QtWJl2X9NAjNSgRuJI
         BuXxFZgP4gvaakX0PRaxL0XI91xQKrypy3wGbV1qJu57PWvPhdL/vN5QiiafbxXO1XZq
         w1Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWWu+dkYTN6owggDskVGuNzna02lg8YCdMz9vlurliUFCSJVCMFDbYpjllbTrVWgpfS2IpOKeK/zA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfTVxjsnoP/lxkj3Ybnoa8eObGEfu+BlatIQNn9ffU8q6M3clv
	8VIa67tCso0rsHlfumHfLaxFk6FUR76sC4WRsxZaU4BFEhJePxzaI7ze54Njt4nkGlE=
X-Gm-Gg: ASbGnctWYhRBGvbcFkcDSUGGRPTKIDfh9Ykft4S6rL40kULA2OuaYX1X3XoLK8ILbpD
	uSJq92SkPTyL+KzPb37HUuidCRqOwrcFq2W6MUkKaYnvlXWUnaMySylKw2hBQ768+519JIB3OQX
	/ENOXw7YDOZnktk8Y86CxGND+ZAejvO3/HM2+4q5TPP8RwRE9Hmu6/Tb09tunVB9Vpr9rKKsUIz
	lbnfa5sQ7pN2RYPvZdMuSxTAWcD56egWZ0MUK1OFktT1CVFfdBQW2PmFvwYhF9qpCSJLEGfy7/Z
	mSzNjFuiAgM9WXSkRHO5BcbWHIA/o+2Y79N67ostfLh6TYUcrq7Ic/4DQDdsVj7L5ZuMcgV6GIC
	H0TvifTntNKsM2DWL9uihDDv/azPYwMvzeK+3Bs6/sqyL8Vl8e1SiLRVIO6wmJlfut1ZyRbGm/A
	zu+T1src+RpoNkmCngJR53UGt0us/GpVxWF2xlG66ko5id5+ocDRgpLP1I1TFI
X-Google-Smtp-Source: AGHT+IEsFHp9+KTrH36IfqMNkMBqKDdgRHUJrYhyOx128Vw+1DZKY9oKj4WLZvRXlvy/+FFiqg/IEg==
X-Received: by 2002:a05:6e02:3c88:b0:433:767e:8f47 with SMTP id e9e14a558f8ab-4348c954ba8mr72409145ab.29.1763152631499;
        Fri, 14 Nov 2025 12:37:11 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434833c5eeasm33471855ab.5.2025.11.14.12.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 12:37:11 -0800 (PST)
Message-ID: <939d76d0-a535-4d7d-bc3b-9d92be9b782a@riscstar.com>
Date: Fri, 14 Nov 2025 14:37:09 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, broonie@kernel.org,
 dlan@gentoo.org
Cc: p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251027125504.297033-1-elder@riscstar.com>
 <20251027125504.297033-3-elder@riscstar.com>
 <FFC4D2691116C9D4+aQAgeeG28SpSI7YR@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <FFC4D2691116C9D4+aQAgeeG28SpSI7YR@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/25 8:46 PM, Troy Mitchell wrote:
> On Mon, Oct 27, 2025 at 07:55:02AM -0500, Alex Elder wrote:
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/Kconfig           |   9 +
>>   drivers/spi/Makefile          |   1 +
>>   drivers/spi/spi-spacemit-k1.c | 965 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 975 insertions(+)
>>   create mode 100644 drivers/spi/spi-spacemit-k1.c
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 4d8f00c850c14..2e933edab1718 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -1071,6 +1071,15 @@ config SPI_SG2044_NOR
>>   	  also supporting 3Byte address devices and 4Byte address
>>   	  devices.
>>   
>> +config SPI_SPACEMIT_K1
>> +	tristate "K1 SPI Controller"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on OF
>> +	imply MMP_PDMA if ARCH_SPACEMIT
>> +	default ARCH_SPACEMIT
> SPI needs to be a built-in feature?
> if not, how about:
> default m if ARCH_SPACEMIT

I finally implemented this today and while testing I found a
bug in the module removal code.  It's been more than two weeks
since I got any feedback on this series, and although I've been
holding back on posting I think it's time to send a new version.

In addition to this suggestion, I have two bug fixes plus your
Ack on patch 1, so I just posted v7.

					-Alex
