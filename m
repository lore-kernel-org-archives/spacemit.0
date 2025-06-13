Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339C2F430F
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 02:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780971; cv=none; b=crIb5P04sKVfatbPkwBhD8HKKsZvV/3CAdgN3JbvlmUurGK2AYykMceuwnYB1Ilv2P3MxjzDJ47x1AJgJNQ2gzECNTXlPPysFii0PiyTjw5ql18EBXNIG7LV5xeDFGuQ2Hdi29STb6I393i3t1rcUaf4JRHySlSLQ25ij2Ddww8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780971; c=relaxed/simple;
	bh=bq8ZvLLY3sBFobFVReFNoN1iLHim74L7lvCBMNa9U60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkgWpeAgssMo0VjtxrPOwq3xaBJsvqRrS62LfW2b1dWdGfcU5poZl16Mph4f+60m7QJ1RQdyQokQtHWOn9oFl5z63t5lOnt6w1lCSLYDiKu+ijPYRCutYIU00txhi++OcMUrf3p0iMWYI3ViRdsDa3EAD3yqS83d00ByT2zw2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iQUHwdZV; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iQUHwdZV"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6faff792f9bso15782956d6.1
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 19:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749780967; x=1750385767; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2SwT2RePaCxrYCauyGX41s3IGrIg/X27XfJMOji4=;
        b=iQUHwdZVwsEgiRwcu+F5xU0HLFJgaGWmjUIVolLXFhAB55bnZFlWeWY/OY8ob+93HW
         73doQ5qUa7LHNqEqCzwYa0NiLTMcBIxbPXX5JUoffkxwEL0ZQcQ8KLnPbTCju3yVvwGj
         /VNaeRfxw+eYKpx1xPfA0JuOxmEiFNc06TKzMbrERBVnCpqCL+cUFGrhlevpzrT7wwXg
         pH6h185lJVrCP+widSKnqVX0568gJhtnCRo0UDS9e6svIrx4t6QP3T3pEp7Vblr1pEwq
         lpCDd4glnSoSZvMc22c39OYfZAhAWBKw65ODcd8or+XVyhrgrJpj0zkfopBkhNq1LhTE
         kDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749780967; x=1750385767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2SwT2RePaCxrYCauyGX41s3IGrIg/X27XfJMOji4=;
        b=uG78gCYCWHrpCAo1lv30z+t/4NiU8O1X9rMjyX8zLyLAliwH2ASXNsDue8aOwkUXsW
         hdR0xOLeD2RBqdNZk1i3i2aY8Ru4hFIop1MugAYEQt3jJBzkRENnPpQPp1C/SO3Ak/S+
         EYy8TQ75QIEjN2kX3PwRL3lY1mFRAc+wmyP/5gvd65tcTV7cAWNHi8A+ODvkX4H7eOyu
         IrPaLYCCB+aRAHH6SGGOCRQKKQ4SphkR/0nvQJQJPsLkJJUlu3onwRJkdj1abgVCauJZ
         qa2GMwB+AQX9Fy+VX8JTvRI4GOMlZjcyQZ1coM7WGvn8gQxaDmGpllOHOABKm8n/KYtF
         QP9g==
X-Forwarded-Encrypted: i=1; AJvYcCXnKl9QXPeqfFBaLoYe7f5DuGxkWMmS8raNPLXZzJ+H72GQHX5hjYiYaFP31nrHe93QF6Uciaw85w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOvSBBf7ChYL0XbeCYouDQQB1Ffl75hYBhpAEQ8+1W3Y2on24i
	cauzPLQYvu5QIxljfFtzVi+aG9+Nhpn8Oxebqp0cNlZu2DB5+xY9h8RgV/RiNSF1eLU=
X-Gm-Gg: ASbGncv9nMBLClgOhamqkHqnLx173FUjcK3VWWMg3DECSZbSuhcHTD181D3bZs0mFUC
	psDNL8aVJn1s19wnMezmdr0I7gBxA//nDrKp1gCdDd8+o7Wa/38LuRX0e1JaGpWyDbxONSxgWK8
	b38mke8ZOVd1Jj4eNWQqljoMZ0bonvpqh5RYUBwD4oG6eJpOnp4qr0+JGX8upYRhK5fgNqVvAZh
	/cMRyoQYpvMK8YhLMOs+beipd9XXYCFy7HRwyqUXL+U1hZzlIbmU5VJgl7jGPekrsSORB2BWGs2
	5b3PbNjdH3FACT0mUQq2qwGN7I6gBXnQqOTPVLWbse8fxygl9Cu7UaHzbXC+JSN5U+NsLXxeUbr
	2Ts2GykGb/VFCg9AX5Zmlr/g9qQ==
X-Google-Smtp-Source: AGHT+IEPrCYVuYaf2snbGSL6nYTSnkJ5v4bgC7WUqyASAClJfsf2Fn+WgQFF908p7KrLOpj+L5tcig==
X-Received: by 2002:a05:6214:230a:b0:6e8:fbb7:6764 with SMTP id 6a1803df08f44-6fb3e629659mr19306186d6.45.1749780967455;
        Thu, 12 Jun 2025 19:16:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c895f2sm16333826d6.116.2025.06.12.19.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 19:16:07 -0700 (PDT)
Message-ID: <d7f7dc4c-5d2a-4f63-9451-5e4d2e53cf1b@riscstar.com>
Date: Thu, 12 Jun 2025 21:16:05 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: k1: check for transfer error
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 dlan@gentoo.org
Cc: linux-i2c@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.dev>
References: <20250612225627.1106735-1-elder@riscstar.com>
 <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 9:12 PM, Troy Mitchell wrote:
> On Thu, Jun 12, 2025 at 05:56:25PM -0500, Alex Elder wrote:
>> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
>> complete, or if the hardware reports an error, it returns a negative
>> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
>>
>> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
>> which is the i2c_algorithm->xfer callback function.  It currently
>> does not save the value returned by spacemit_i2c_xfer_msg().
>>
>> The result is that transfer errors go unreported, and a caller
>> has no indication anything is wrong.
>>
>> When this code was out for review, the return value *was* checked
>> in early versions.  But for some reason, that assignment got dropped
>> between versions 5 and 6 of the series, perhaps related to reworking
>> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
>>
>> Simply assigning the value returned to "ret" fixes the problem.
>>
>> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>> v2: Added Troy's Reviewed-by
> Hi Alex, you added the changelog, but the subject line
> doesn't have the "V2" suffix. Is this a mistake?

Yes it's a mistake.  I contemplated sending an immediate
"oops, this was v2!!!" but opted to wait until someone
like you asked about it.

This *is* version 2, and I made the updates I describe.

					-Alex
> 
>              - Troy
> 
>>
>>   drivers/i2c/busses/i2c-k1.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
>> index 5965b4cf6220e..b68a21fff0b56 100644
>> --- a/drivers/i2c/busses/i2c-k1.c
>> +++ b/drivers/i2c/busses/i2c-k1.c
>> @@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>>   
>>   	ret = spacemit_i2c_wait_bus_idle(i2c);
>>   	if (!ret)
>> -		spacemit_i2c_xfer_msg(i2c);
>> +		ret = spacemit_i2c_xfer_msg(i2c);
>>   	else if (ret < 0)
>>   		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>>   	else
>>
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> -- 
>> 2.45.2
>>

