Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5486A77102
	for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 01:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247460; cv=none; b=TO736cyhnB31JpTyKGN8IxixQwl3MAUjRCbJHbks6PAS9xJxZS0xjnf7+jSkygd3Bm6UUoMSX2ntwZWerGw7Gsqoqpm71USP6ceyHR8XVyf19/RB2/IH0+Ks0NskKQpRdaJ0yVu1lfTObFo5k41rsjVO6V/dqRWFjTBI+S7q1js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247460; c=relaxed/simple;
	bh=4zZXmOT4G5ENrNqVshmx9q3+5vFS9ePvw6JwQw07jlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpvuEQb1blnGDH9MvSQ0HvrAz2Sl1oVaVKphxdtzqm8pMjkrgyWi0cIlsIjxnsenAVWStsJWo41kGG4uKNZaqI7HuYZqEdPHM29DGJeYoo9vLkG4FkT1TQdRzncva1bLCTRwBa9cr57280wHb4RdQ91tXInKGYA7svAMSeaxFsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=R7TRkFzV; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="R7TRkFzV"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72bbead793dso238907a34.1
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744247456; x=1744852256; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ufe1zC4mIZ9KkFKqcvzjMiU58CZ1PL6NJI/ZAbE/kqA=;
        b=R7TRkFzVXUc0ZsPLLpIfGh6ySayWzj+9RswhuvLljv5MyHy6Uok+b2EljY+S+1bdbs
         1DoUvhPGNUzb3ipPrQ/C640a8vH2S/JEkMBJUxeVMJcFRfinRKz4bm8Jcc5AELkWBas/
         rjX1a1jMw8ru096ECW7n1RqJZg1ukq1qhOHd4g5rgz70qIgJY+6rRClqVk3DQPAtBanz
         qdQF+7fJCuzu76uBw/rmMNE4ogf5YdkvBJbhGEWmXbJLCDmLN4avj7rJ1jbzcns2jRQY
         ayv62cWFgyEWNihin+cHV04mu/RoQ84v0Yeb3xQUpm4PP02Mg8oMm4bOg2VrGSJaGoVQ
         kM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744247456; x=1744852256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ufe1zC4mIZ9KkFKqcvzjMiU58CZ1PL6NJI/ZAbE/kqA=;
        b=SCIKmHrw88MBPwL38IJY0SWTBvEYSHKIMp3H+vvejEw7X0x4LsjqnILBlHg+0SpZLw
         UPW8088KiAmWpP95dJOFiYblCRgOF4tuPXLdRWC/IXgXK6zCmJnueXyhzauWBNT614nI
         xJ4Y0gbUCLlvd6kI/THytQ5BA0N5yag9GgFJbG3quGvYKph5NJ8v5Hs7GBGIxeYuzPcL
         iMjvQRZVoubI1jiqQ9ZlNP1CDGrpcQE8Nc++lavcVW1aMDDko4mtGdn8IUF5C9rc/Hts
         WvPHiAF64QRRKD0WAm3O+Sqnqp9TznzbDItdCMQICP28AVtUZFhOnKZfddXFWawmjCGH
         Kcag==
X-Forwarded-Encrypted: i=1; AJvYcCXbzwe/fuJWVOwChw0pKPs5Kd0AmTnlUF4k5/o9zjgWcjbGmIyZpxGLgig2rxligSwmkc80lHiHug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7bH7wgey2iTfHF459NdyZEnZdvwa79dvOjBzUVdjz9LuOqVrz
	DN/lv7jnz7NW1q/JvpacwRvYqwdBrugj3NghtHot1gh9t+dDe53WCp9VPfjSMSA=
X-Gm-Gg: ASbGncteenJluWVzY3sqmr6ocawe3nlIQxUdJVrNVLuit2Y7KHw5cikKGts36BQaWrd
	POzUT3wPW2tDPymzKeEAvuK+8IamD7uHEGGhUzIxW+hLTaZ7f+LLGtSZLFJYAtuWeNOu9TjCGT/
	AQsL65aRjjs7oERgbqGNvMJlFbO4ZVknMqk6qiMZ4S9uxTMNvwJLpKy2I4sHamYvQBArlz1UsME
	SHo66UH3RRmO7FVtTie3I4CWRPpXhW2UvN603XUYNF0BB80RCHkaM5z+vPMw5HD9nwK4Asi5+uy
	UWfk8aDzPoumABJC7rj5aqEXgkGWit9lsNQz0mrRCM/NbVLA2FPMJ07+LQLOg8EhbN5/13qHIup
	6/9Iw
X-Google-Smtp-Source: AGHT+IFevsC4sF9gcAaFeEjZSUjvU9SNPUbcIg3nnlkWLdpmBSAknJMYmP8QUt9yMWwVqLYOtLE6Ow==
X-Received: by 2002:a05:6830:2aa3:b0:72b:940a:a7c9 with SMTP id 46e09a7af769-72e7ce2a553mr338735a34.27.1744247456270;
        Wed, 09 Apr 2025 18:10:56 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e4d81dsm396029a34.54.2025.04.09.18.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 18:10:55 -0700 (PDT)
Message-ID: <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
Date: Wed, 9 Apr 2025 20:10:53 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 7:57 PM, Inochi Amaoto wrote:
>>>>> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
>>>>> new file mode 100644
>>>>> index 000000000000..4c4df845b3cb
>>>>> --- /dev/null
>>>>> +++ b/drivers/clk/spacemit/Kconfig
>>>>> @@ -0,0 +1,18 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>> +
>>>>> +config SPACEMIT_CCU
>>>>> +	tristate "Clock support for SpacemiT SoCs"
>>>> I don't know the answer to this, but...  Should this be a Boolean
>>>> rather than tristate?  Can a SpacemiT K1 SoC function without the
>>>> clock driver built in to the kernel?
>>>>
>>> I agree to make it a Boolean, we've already made pinctrl driver Boolean
>>> and pinctrl depend on clk, besides, the SoC is unlikely functional
>>> without clock built in as it's such critical..
>>>
>> I disagree. The kernel is only for spacemit only, and the pinctrl
> Sorry for a mistake, this first "only" should be "not".

This is a general problem.  You can't make a bootable
SpacemiT kernel unless you define this as built-in (at
least, that's what Yixun is saying).  But we'd really
rather *only* build it in to the kernel for SpacemiT
builds.  You clearly want to minimize what must be
built in, but what if this is indeed required?  What
goes in defconfig?

					-Alex

>> should also be a module. It is the builder's right to decide whether
>> the driver is builtin or a module. In this view, you should always
>> allow the driver to be built as a module if possible.
>>
>> Regards,
>> Inochi

