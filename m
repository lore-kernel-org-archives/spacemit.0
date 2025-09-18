Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B401531065D
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758211123; cv=none; b=XntJYFzw14689sjt7y1VunUCC+xAOBRZXdxpZMp2KIBHwFTgBqJEJ1nWnxBOKpfePIWcCUVZS8wS7XZ5sjr3XKBSKXdDxhwwDPXFCWqGrMA/JlfTsV+Xr+ve+iQLKPPoEuWVveLiiTMlWy78S0is+/wBLdMUnGSK/tLB3EWNTzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758211123; c=relaxed/simple;
	bh=mBOMOV2UEaBJS1bN98PWLw1Tk1D7AqCi+UV4js6u0C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsNQu0GQLTvS8KD92YJF0+Hed2APoTr0tMP3a9IUmZcVI69zvCuMKv76R89NhIKv6Tvgv1M2HFBD2gdQuoo2UODfkWJ0BV8w61GdgTw1/iRiZpnJXS0oBsFNZz+iY4rj1KWq+5/jsN9qzDCq7lGYxpXcSuVPQ0Q2f9s8kNhjNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Npeq+Hug; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Npeq+Hug"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-892db7eb552so147899439f.1
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758211121; x=1758815921; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RWwPXk3+CMDIY3Ii9TMDH0aQbdb6ssOVOtszqmINL5E=;
        b=Npeq+Hugg9bON2Gfl8/qO72J1yG8rWEcewXH9pg1J7zHqbkVzdNZJEY7fD722pqLM2
         6IFIdxBrYF/j7A7w/JBSktI2KJhRn3myYLN5hwBx2e5PtKxv0QKZtL+IEPI6gDEqK3p7
         RN7i3jhiUDIOg8CmqHjyv+vqzgOGRF+xJU6FDZ0G10sr6GA6jfFpKRY31TzJEZt9W0R1
         YD1PrRWzYu1ARFW5tEJlmyew9QugBmOLvWUe0NZ2WQlAMal5Nc05/Amnai+lYVREXdZe
         1sD7mZWY/JweVz9Aon08oCPqYobQ1BAHXyi4t+cPDYiLa3O0oqNhYTQyFS6/5X6otEE8
         q26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758211121; x=1758815921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWwPXk3+CMDIY3Ii9TMDH0aQbdb6ssOVOtszqmINL5E=;
        b=usP+zFNuNku0EW643b1QbKkKm4tC8gM6cG+CsNWGZPke44mKhvwFsX0EsmknoD5yMi
         jgpKj07ykMnDoxYWpoBzak72yRBlhAbZgccR0MERSx45a9d6z/givcBlrwhRboRY8U7F
         926hG5HQ+E/jqcSXSM0/u8lrHI0sEpp4TQJ6UGZgxVlU87BoeD6uDTiWDZYhQTgpM2pp
         r1MsqnbrRk+Fs49MqpNkVP2MvD26ReaTLzYEC3vHNEmG1UuEjVkhAAGIgWXVnRA8f+Oa
         tp+YAzVPEalWxu//HEhSA0WDtte0pTA30bpbu2BmQVSLdPL1+YmAs8iQMKxi+3Qdeay0
         ikGg==
X-Forwarded-Encrypted: i=1; AJvYcCVjn4UMIbe8o6pjheGZiF+k4Js2P/Rn6rp82l0P4314SCJz7/9vVgKGiR4bt2KwjmJ20qoS74/LUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0cR0FV8sEWZ8I+w2+vbm4ChpAPYk/S70hzh3+Fz2Dtjqd6DS/
	RoVZOxgm+pXChCH8PHvFQzaQjyo8yFFLIQaVyzjnb2gkgzpyZ7dB7APm9cdylcQeYL4=
X-Gm-Gg: ASbGncum685tm19YwfwrjlvNqy26Gp5xSGturOQqogi5xUZ+01QjubJEpTdoOcGIZaD
	DgsIxpxRAwLJRKgEOEtd4Hi5paIlDbYyQDIdc7lUN0uoRpwotcGJKgrCD501OW8xPL7vSH9fo/z
	1+s2QIswNQGw7Az2Wava/J5nV9dXtmjxHm1Nt5Gdo794KemNyouC6j+gnBVRwrZLXzzon830OUE
	W4nUNUJbVN4koJIeAQHDMQa1LhncRnhoNMTica8M6xVpotBAETrcnIqWy7b2SEVjD9D4AtobkNP
	AodKkM1mcrVu+TG0vWdwbwsO99lEdTvfVSa63dQqo/vTiDBCCXtrBWTL5UNxEV/wMBPNsjzVl8+
	OS0NysfPxwtYA+/R2hDINS0/b5j+QnYILKHO8deQfPh+DpYMmqpW/NNGACokNFvly4IC2uUHNVC
	bMomIoBRbJHBVcRO+p
X-Google-Smtp-Source: AGHT+IF7L6Nzhpq00zRjUOtUlsvmOyj8YvPWYBfqvWW1/q2pHZGHXZWCIyaJ4bn8yb0d408EYIgLfQ==
X-Received: by 2002:a05:6e02:b48:b0:41f:8265:4100 with SMTP id e9e14a558f8ab-4248199c677mr962075ab.18.1758211113083;
        Thu, 18 Sep 2025 08:58:33 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3a591637sm1058871173.15.2025.09.18.08.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:58:32 -0700 (PDT)
Message-ID: <000a41ee-a099-4944-8ef5-eed768f905cb@riscstar.com>
Date: Thu, 18 Sep 2025 10:58:30 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918143928-GYB1274501@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 9:39 AM, Yixun Lan wrote:
>>>> +	virt = drv_data->ioaddr + SSP_TOP_CTRL;
>>>> +	val = readl(virt);
>>>> +	val |= TOP_TRAIL;	/* Trailing bytes handled by DMA */
>>>> +	writel(val, virt);
>>> I'd prefer to do like this, it's more easy for people to grep..
>>> 	val = readl(drv_data->ioaddr + SSP_TOP_CTRL) | TOP_TRAIL;
>>> 	writel(val, drv_data->ioaddr + SSP_TOP_CTRL);
>> This is an idiom I use to make it very clear that:
>> - The address being read is exactly the same as what's being
>>     written
>> - The value read is being updated with bits/values
>>
>> I find that putting the "| TOP_TRAIL" on the same line as the
>> readl() call obscures things a bit.  Like my eye doesn't notice
>> it as readiliy somehow...
> fair, let's put it into another line
> 
>> Yours is a pure coding style comment.  There are two pieces, and
>> I'd like you to tell me how strongly you feel about them:
>> - Using virt to grab the address being written and read (versus
>>     just using drv_data->ioaddr + SSP_TOP_CTRL twice)
>> - Put the "| TOP_TRAIL" on the same line as the readl() (versus
>>     having that be assigned on a separate line).
>> To me, the second one is more important than the first.
>>
>> Let me know how strongly you feel about these and I'll update
>> my convention througout.
>>
> I'd strongly prefer not to introduce 'virt', so be something like this:
>   	val = readl(drv_data->ioaddr + SSP_TOP_CTRL);
>   	val |= TOP_TRAIL;
>   	writel(val, drv_data->ioaddr + SSP_TOP_CTRL);
> 

OK.  I'll do it this way throughout the driver in the
next version.

					-Alex
