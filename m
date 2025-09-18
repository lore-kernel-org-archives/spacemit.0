Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F272264D6
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 02:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758164380; cv=none; b=lvVWsuBbfD2pe7V77/pqY1QKXKGgSHzHeVtcrkhINr2ezw2BgGRwFCan+5Z087O4nhW8Pyskg6tFiXh0r/OEqTX5guVQrAsrprmvb2Y50SMtsyHG722PFu8aq3fh2RYXWIMEgAlbu8JERanFIZcJqLd6Fe/PjV9+t0aRtT1dVqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758164380; c=relaxed/simple;
	bh=hWH39yoGDCQ7N2R4TtE9DDb6608lJvIpDKnTkeelSlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdwAEvt8Mlgj4g2BCkQlB7Lp6C6npf/5TLgxloMe67nsOeEigVP+E4fmV5E1KhgU98RcdPcfUeVAvYjelyeR7gUdARiX/PVmy9RidUOL/xiA2HJnI1a2SgqjNYKip+zQZTb9x8GhovhPe+vLt+OwmJGWbBG2HT4AdcCjQWCOdnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sOaVRdZc; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sOaVRdZc"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-887745ee814so19312739f.3
        for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 19:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758164377; x=1758769177; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5szgNDrrDfA9r/y/UulQg5Y7n0+PRvqIyjOb+dac47k=;
        b=sOaVRdZc7pVN905ofs+bmvAKHoT4cd4Vh1fBlCu7yJL9XyRx8p3ce3LGYJDvF9TQwS
         U5tS0rhZFKBspHfm0HISVUEAKCODFoyL3fvix7zpgXUMvC1AYe67T+RcEZ2vWXorVC+F
         98TK1uWZ/u7HRaE9dBc/KXULtlQqblOyPwcBrBCU9g+FWsbOrKhE5cC1kWYl0aUnZEsI
         /ojygGAoeUSuSP4Z0LPmEsZRahY+4Y9m5UlM2L3FOkPzTxcqSgsJrcfZKHYD6YeMvt8K
         gGy6R8DC3gCVY938BM3/FC9lE7z3CzbX7fe4KQ6bN33xQ2J3hYhWHTK48JQs8qLI1p9G
         Yc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164377; x=1758769177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5szgNDrrDfA9r/y/UulQg5Y7n0+PRvqIyjOb+dac47k=;
        b=Dd2KF7sPgBG/LTXrBPdZQcwg1qVpMfZr9wSBiymVpMHvG9cdcwb7MsbKQAQFfZIpO4
         rYPifoOWi/ROioQj6DdA7UmK4bDCMXj3t0Zzz4RLq8bXi+XOMxpC0Uu6z6ZcA02YvBjw
         mev/5B9CIZMqGvY9nx3dUhNuCdw04BkIzBJstcY36Gxy35sdwEdmtEgeF4PD4rZ3i1RM
         eo3fwuxva1efLA3N1AGrvJ9MYe5IWrbqRBuG5JcKdYjFMajwLZA08e0tmCgdjIVOCdmP
         q9nyp0BTLYNqpZMQKkpb7rYNzCQKgi87caaXYDg2wJD2B//1zRL8dWBTjQKBbiyL2Sqn
         uJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCU7iu0803pA2P0osKr4XQAcocwEwfrnp1DPamaaN923HKudZO+1HtEIP30wasYBAL3FnRnv6Oc6fQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNtelGUdoNX43zqX+LlF1+YNrjZBWCBPpdQYa9bEFSi4zpYivz
	RoNCKt0CA6SWa2l9t91TWMxwoJ5T5YaJ+R6cm/XDZmOf44wiyOd6zXAgI+v+m6vtNZs=
X-Gm-Gg: ASbGnctTKGw3CB6r1NAPyVHSuKt3DcMcpxOaOem7zULnl+C4gVahLe41CtWxmLpUKaC
	hp1O7KQMh8ZWAW51D/XayL7p3pWfrPEuXp4/rtQoqk3hI/FGovsNyxRswwmTynrncq2LimWwRhA
	bfTb34KIn/wbs8VH4le8M7tmWHtsGUgiG/pWrpm0phJ1YKjkp2gGixbSYm0NtreCGluFE8lk75B
	Fi9LFUhUhjHf8722rPnuqRedCwDXdEJRDAWO/3pybsBt3zmbIzj5QhnlD1tx2ilktHsAxv/8sRi
	KBDeGkZveaI5Al23lzkOLxC+ZfT+bocSMRgrM0dNImsg2X8AMkov38anyIvz4bJ+tcE0FYdnOVM
	kZkiWiw8ICkXnhX/3PTFjDWedYnkLGTFXiEe7v0zWk/AnK6oWMskNdlkqyfkDVgvQ2lWTK+AWYn
	xtjwwf
X-Google-Smtp-Source: AGHT+IEQLSK+9pHMwlUU8ixZlncSUSA8tIOFByfMAjDBZy5wDSD6GkAsXBMax/RAtzqwjY2ctqPlRA==
X-Received: by 2002:a05:6e02:380e:b0:423:fdc4:4e39 with SMTP id e9e14a558f8ab-4241a5784damr64016625ab.27.1758164377462;
        Wed, 17 Sep 2025 19:59:37 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3b017664sm448915173.17.2025.09.17.19.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 19:59:36 -0700 (PDT)
Message-ID: <f7e12797-ea17-4e92-bd25-cc562c66d2a7@riscstar.com>
Date: Wed, 17 Sep 2025 21:59:35 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
 <20250918001632-GYA1270371@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918001632-GYA1270371@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/25 7:16 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 18:40 Wed 17 Sep     , Alex Elder wrote:
>> On 9/17/25 6:15 PM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 17:07 Wed 17 Sep     , Alex Elder wrote:
>>>> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>>    .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
>>>>    1 file changed, 94 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>> new file mode 100644
>>>> index 0000000000000..5abd4fe268da9
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> ..
>>>> +
>>>> +  spacemit,k1-ssp-id:
>>>> +    description: SPI controller number
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> could you explain a little bit why this vendor specific property should
>>> be introduced? I took a look at the code, and didn't get the reason
>>> behind.. or what's the problem of simply using "pdev->id"?
>>
>> This property was carried over from the vendor code.  It is
> inherit from vendor code isn't a valid reason
> 
>> optional, and if it isn't specified, the platform device ID (-1)
>> will be used.  It's just intended to provide a well-defined ID
>> for a particular SPI controller.
>>
> while looking at the code, it seems you can use alias to map specific id
> to the spi controller, it even can do non-linear map, something like
> 	spi0 = &spi3;
I've never used this before, but yes, it looks like it's exactly
what I want.  I'll just get rid of the "spacemit,k1-ssp-id" DT
property entirely.  Easy.

> plese check of_alias_get_id()
> 
> note, I haven't actually verified on board, just look through the code
> 
>>> we should really be careful to introduce vendor specific property..
>>
>> If there were a standard way of doing this I'd love to use it.

Looks like you have told me the standard way of doing this.

Thank you.

					-Alex

>>
>> And if it isn't necessary, please just explain to me why.  I
>> have no problem removing it.
>>
> on the opposite, please have explicit good reason to introduce vendor
> speifici property, and if there is generic way, then we shouldn't do it
> 

