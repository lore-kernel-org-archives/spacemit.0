Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796951519BC
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753534676; cv=none; b=a8Y6sQG3IKJWjIr/rIxlmJQheUfqA51kWZ9yBqrsr4G1P/15O4MEM4ysYQ78qemkl0rV4M1end+WGhJLRE137w9a6CpEk8nH+0nMb8rTkCCWcIv3UGo70OG2fhdJh49VCs1/LvRqEoeIA7rQCgPNZ11JAiSTHLEkXwJu6Iraw7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753534676; c=relaxed/simple;
	bh=2lFsjqaXkY+9lybBw6P/Zhy/kr8mE8D11FVC2cE4RlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3hq3DeFGVEaGn+8zSRbeF2X4va2QzzaiflI3e5WQ8X2dHKFuNixus+fis9p2dzEgdyPgrhdMXLxFFpyW47rf22jLF2noN+UrdO8cincuBtH3xByGrcUK6XZWF9P1G4Odzn45HsC1V6wUxgKiw8jNJt5iXfFVGo0fDdSwuSBQQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=MVPUX8TD; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="MVPUX8TD"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fd1b2a57a0so31109676d6.1
        for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1753534672; x=1754139472; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33vHvGUYy2jUaJ1MFRxvGoPpdjPDXIobpjBWzBoYSe0=;
        b=MVPUX8TDf3DAkz92RFbqCOedsu7PkrPx1AmCQ/IJRzftJaraGp92rxN5NE3C0d/Gpe
         Ajz7NKJilxoAlXOkJUyuvvQVVzA9Ljy6/hueDYY3CmRVGXwIYk/1rlod/fUurDmS/l1j
         2FvsZF4zPqzCtOv5O0xqGyOeWK1rHBPMK+C0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753534672; x=1754139472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33vHvGUYy2jUaJ1MFRxvGoPpdjPDXIobpjBWzBoYSe0=;
        b=gn11hmhJrHFt+xqeUS8e0kM4GEnhdhiwhb8J+gIT6wWeitSjcIEGmbeXAXHbaCZSTA
         uMwbTruPMXpIB2ZcnIzkkSoSRk4gldpWVl01XfMmlNdsD47bAHGayPA2VvCvcCg/zjO7
         I5zgcVTcCtihSn1ZW+eXAOMNThfiDJWtNVIuaCg14sV/iloaxbk61f1Yc3oFfzU6Q2B0
         433j+B7V2R+OGbSbh/PtJ0E+k2yUPuNit1CCFqlo0YZzpWBQ/RN8fsA3JgYwmD/U+T7i
         3uruKkvPUnHsV7y+BpH5fTDJGl2WP3ZvfqZr8B/xylwr/lHK2XDckYcIOgUPj+fAR4um
         i8oA==
X-Forwarded-Encrypted: i=1; AJvYcCUbbqnNlv+RKXrFD2ZGeSCcWy69adYBNeAF9MpEZ4k/2ui55aIghvAEK+uvlz+CnzNm9OZ71Z6yCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTxxj+5MvleazhQUsLoxrg1qQq27X0PlbRauMfQzoEmlioNu2e
	JjR0VJiRdllbZcaVWnONmVJUjk31RykaEe2CHm9HMHe8pNl9cBU3LFR86DaQmKx57A==
X-Gm-Gg: ASbGncv93ohy2tqDRg5RCAa7HxNl521+o4DPM+lFr/ZXgcFlgEh578FBE3fZ11TrRUO
	a3jhs+hXuS3jEF6hF7sTaOrEVHUf9mHc6yHH5npPpxEPFSm2i2n6AioaIswoJ//Jy7Z6QGmmqRb
	jQdwyhp/Psb0rMOpMwttUDSpf/cGRemi8pCaDvnNrF75jR1fU4MWfwvLmuYwZj6uoVqJoXGyV8l
	qUmFj9gtMhFk2b2SaQ8O8o1rTzzgehEM/fwoqI9Ejx9ygUuIRy3JKbKqD5S/OWe7DcB76j3zYYF
	GBxvQu+d602xNeoUpf3zZL3mJkPQEJnGsWR0oKhYN8JKtDSSvUm6PKnZmw7RNpKHSm/6LOOrPs7
	Dg13qY0l87Pcdvgz14lQzjiDCRKUE6mXOX1UbKZEP5/PQPffHqxnN53IxYcUYCDrfmQ==
X-Google-Smtp-Source: AGHT+IGb5AjxoFosxgBP3Pc/RtOYVIrHr0x3CfJjhlmHSPGuq16MvnncfHDH4Nbi3Zz1t72hhHOhFA==
X-Received: by 2002:a05:6214:268a:b0:704:8db8:d3cd with SMTP id 6a1803df08f44-707204e8855mr68135236d6.8.1753534672381;
        Sat, 26 Jul 2025 05:57:52 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-70729ad99d0sm10716946d6.46.2025.07.26.05.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 05:57:51 -0700 (PDT)
Message-ID: <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
Date: Sat, 26 Jul 2025 07:57:50 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, sboyd@kernel.org,
 dlan@gentoo.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
 <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/26/25 4:16 AM, Christophe JAILLET wrote:
> Le 23/07/2025 à 15:25, Hendrik Hamerlinck a écrit :
>> The function spacemit_ccu_reset_register() allocates memory for an
>> auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
>> these resources, resulting in leaks.
>>
>> Fix this by using the appropriate error handling path.
>>
>> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>> ---
>> Changes in v2:
>> - Properly place the Fixes tip.
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu- 
>> k1.c
>> index 65e6de030717..5bb85e32c6cf 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct 
>> device *dev,
>>       ret = auxiliary_device_add(adev);
>>       if (ret) {
>>           auxiliary_device_uninit(adev);
>> -        return ret;
>> +        goto err_free_aux_id;
>>       }
>>       return devm_add_action_or_reset(dev, spacemit_adev_unregister, 
>> adev);
> 
> 
> Hi,
> 
> I'm not sure this is correct.

I'm sure this patch is incorrect, and the original code did
not have the stated problem.  Thank you for calling attention
to this Christophe.

Stephen, could you please revert your commit of this patch?

Thank you.

					-Alex

> auxiliary_device_uninit() which is called if auxiliary_device_add() 
> fails should already do the clean-up.
> 
> So I would say that this patch adds a double-free issue and should not 
> be applied.
> 
> If I'm right, note that Stephen has already added a "Applied to clk-next"
> 
> CJ
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

