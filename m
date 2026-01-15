Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4FD37C117
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 17:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496543; cv=none; b=BgN6vufdah5GRwdaH6posPkBkrFv39eSdVAqKrUb581qGEeF7OvwIkFKIKxHONaYdWaPHMWsmWyk/Z8DzynwVJhlSqOXHHbQsU/T0XAPqke7DN2bJe7zBOOWjxlG7uE5EuQPbeBTjyqBWM+lET73JfFykOGBukj9umumVkutgoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496543; c=relaxed/simple;
	bh=IpwDIvhr5VuqgX4fdAxB6xXe39k/dnAVORQtSR3VM7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKGYAjQFZhQG+qSoDybiXI+g4xVeGcjLqmpfmx89fNCTcA8LvDgwndYPPbNBHdctc1mGt72CVVBbr/OT0F6leLUilAOfDXBTDqeotRHN4tHey43PpED0KhUc099x5F/0UIMOUzk8VT7vwiUuc4RiAa28M6YQwmbJq/vEyl88Xic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FSOhZsUF; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FSOhZsUF"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c5320536bfso132736085a.1
        for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 09:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768496541; x=1769101341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lmL4wVgyCel4RaZm/YDnYaY71CyzahaKuw46/jDcwA=;
        b=FSOhZsUFac6ZyNOA+CGcnCdAaJOQtbd4oEcBiYsudy90DZRjQHgJpwmTIqxsHRyDr8
         L8DAcpSvSFm756Q8tR0uR3ERjnzAlZlJd+1bCcl43uLXqwCiEvqsuFwQ/NJ9nAnghmg1
         HmQXNuvs2QEHjS82rVvTGcln81auCyhDSE+uaekr0Y6rhAMxZtnbr0D5Jwspoqeqv1my
         vyHhiHdoXLUDMpiFPtoz8MHRYyEEbEV+of221OTtk21ZQ5127imZ98y3sauKKgvJwVXx
         ad48JxRA5vpJrwqbScskDiiurf0gg3LpmlvA7m78+Evz4emG2Tv3OJObw7taz6GKJtM2
         +C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496541; x=1769101341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lmL4wVgyCel4RaZm/YDnYaY71CyzahaKuw46/jDcwA=;
        b=tVYi7MFbghjyISHSMtE/BJjaN05PG4nqmTRK8m7zjJFIjaEFnsaWsTVlLFiX4Ozlsw
         l8QzYYf8GCApo+LidXQexaImrS3KrHCb5h4Ud+qWCdaBt93uSMGqXha0caY6qe/dQrkR
         hQiUaZ2TDpC2VOJbnSJ4CasCPzTHfBlOONsI+kduEsVGAAz3Mn16a35M4sTK4FoWpbw+
         mhj+iYRoiOb81smyl1AZk+im+nkPW7FNX3kus6PXbUWSwisptOMf5oN6x4z7KPpvYoMv
         GXPtrCI86yduVoaxNMnV9VFVSm6h2MNlneSPGrRWXELRITKqmBzbGFaOHsBNMchSBvKR
         /pmw==
X-Forwarded-Encrypted: i=1; AJvYcCWsDdrvul8Zw9PvYomubBTdWwDptfNbt/nu+TjTM0YT/fohwb44UHsKLNKt9lx0BcLN1cewnv5M0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw22XH6sOFg7lAMD7R4YSQG2/Sniw2GPw7G77AuLcakmBTHGYIC
	lFXoOaAoDAb7No4quFXkgHoIYPVrGCj2PS0JVyMB7V2ScVsHTVeZAswBcYNR8w3/FRg=
X-Gm-Gg: AY/fxX5q1pdwUrBRXmiFrEHmSyx6nrY5AdaeX8pD5EQw9zxJgFAAuR/JHNhKdknY0Z+
	El6PjPtZV9XpBtVADjgtWtGdFUsbtQdClo65S5F54iGiceSaKcnKWoan6dV53X3RlJd5djalPh1
	vGIs1iB8NbQf2TQmVeNXTi37Xp2wLyW/JyA1S72nE3fhvxo/acMUyQq5EYg8aieBz1OBqsJ3Dk4
	pBYVR789KGjqES8KiSuf2lZFtiPKcw675Aza4HPXXfPajx0wZJKrGgaxxeDRgvjISBR2lDMAEju
	QS75NS9HtE3E6A/Fp1bSNY86So2yPs+Wx5Hxb0B5g+X0EwY9NlrWt02YykYANb+vlFoSqJ94kSY
	0nbId5/JHki8jitrBlKZkBWVpFIGzHz1Q46zuffxhwBP2GrrrEZ/wwNk5Uot00FywXG2y8PjBWd
	SCxxx41ix56PMDMQvA7ByW06XQ5Qrj72Q3mTqeWycwszA/Xbc/bIcw
X-Received: by 2002:a05:620a:700b:b0:8c5:3376:3326 with SMTP id af79cd13be357-8c6a67c857amr5981285a.80.1768496540568;
        Thu, 15 Jan 2026 09:02:20 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b74bc4sm455422485a.32.2026.01.15.09.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:02:20 -0800 (PST)
Message-ID: <00f42b6c-857b-4eef-a0da-83053998135a@riscstar.com>
Date: Thu, 15 Jan 2026 11:02:17 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: spacemit: introduce pio for k1
To: Andi Shyti <andi.shyti@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
 <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/26 9:47 AM, Andi Shyti wrote:
> Hi Troy,
> 
> ...
> 
>> @@ -171,6 +176,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>>   	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>>   }
>>   
>> +static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
>> +				      unsigned int min_us,
>> +				      unsigned int max_us)
>> +{
>> +	if (i2c->use_pio)
>> +		udelay(max_us);
> 
> We need some control on how much we want to sleep in atomic. This
> can have effects on the whole system.
> 
>> +	else
>> +		usleep_range(min_us, max_us);
> 
> If we assume that max_us = min_us * 2 we don't need to pass it as
> a parameter. Even better you can use fsleep here which does it
> for you.

I agree with both of these comments/suggestions.

And if fsleep() were used, spacemit_i2c_delay() might be able
to just go away.  (The range used in fsleep() isn't quite the
same as what you're using, but this is heuristic anyway.)

However the delay used in spacemit_i2c_check_bus_release() is
90-150 microseconds, which would lead to sleeping in fsleep().
Is there any chance 10 microseconds (or less) could be used
for all delays?  Even if not, fsleep() might help here.

>> +}
> 
> ...

. . .

>> -	if (i2c->state != SPACEMIT_STATE_IDLE) {
>> -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
>> -
>> -		if (spacemit_i2c_is_last_msg(i2c)) {
>> -			/* trigger next byte with stop */
>> -			val |= SPACEMIT_CR_STOP;
>> -
>> -			if (i2c->read)
>> -				val |= SPACEMIT_CR_ACKNAK;
>> -		}
>> -		writel(val, i2c->base + SPACEMIT_ICR);
>> -	}
>> +	spacemit_i2c_handle_state(i2c);
> 
> Next time this can be on a separate patch as a preparatory patch
> to make the review of this one a bit easier.

Yes!  It's a next-level skill:  beyond just changing the
code, breaking the change into good, independent pieces
that build on each other, to facilitate review.

Thanks!
					-Alex

> 
>>   
>> -err_out:
>> -	spacemit_i2c_err_check(i2c);
>>   	return IRQ_HANDLED;
>>   }
> 
> Thanks,
> Andi

