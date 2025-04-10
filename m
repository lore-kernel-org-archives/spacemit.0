Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF862046AE
	for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288243; cv=none; b=Cfnfbl3Ln4nKBsz19+3ZHdNK9E5lXY6jtrWaZNlmwY0YRRIQG/I9gLA+vxF9HucONfaHtckOTaGeu4YTUT8cQOFxi6lPuno+8OfiCMJBZoS+/w2PfpZJn1EjeVS9VGixVoepvssG/zZub3ROwvhrVz876ijdzZannYuOSBb550o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288243; c=relaxed/simple;
	bh=Ar3ZBvZN6mZyMVGZXLTT80lyCZ3F7mSknQ9gkm0hGxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLYnpFnxY+33G2I1zB4dTC36go6otLn3ma8GSYM6ErKmV5oFx4JYs7zfBdplr+RhMjB77NPNFKSPSJ8MTl/xJ3KRG+d5k2QTo3ZEtacKUnuD5ZYVBziCKgVifcGK1TbDAyr6exJXKmdYwylQaAWU2GcNEK3ZM/n8YnF2yRuHq6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bflrraPK; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bflrraPK"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2c12b7af278so563643fac.0
        for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744288240; x=1744893040; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/G4fjR0f0RuM2AdZptF0W+MlLl3MtRw3oBT35Ehy4g=;
        b=bflrraPKH+suWfjbxtcysxELyJx6w+KQkLuDFLOp+Y12WwY9UVWxHD0U6SwEQIodH3
         wMBik8c27/uNiJxy3aI7fYN0Ym+SxjZrT5m0RZ6VmSgRG/FcIWc6O2BN+LBx93YVaXi6
         FNsStF9ATK6FkT3V6lyiiNMz1eraqQipOKk5iNm23XTSnLXIDKY9ucBzF+O9PwAx/zWF
         jvi/jvCExz9p+tzD/FzBucz6tae83jkglWbx3aIq2j56o/fv7Opvz4gtnDXu75My+s8b
         QXt8zoKM69bhBcFmwLck22A+NXJ6fnUAdMXOzd7IQKtXBkOOHZl3y96sDexKb3waDOsL
         pJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288240; x=1744893040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/G4fjR0f0RuM2AdZptF0W+MlLl3MtRw3oBT35Ehy4g=;
        b=DlH4Yl3Ide4OSeKMBgFSKopQ5idHnO7b9M/X3QIBeCDu09koc9/8i3KCCOhIZbD4m2
         AFC33hn2jXnqi5XdNIuKriCWmkqrc+/q6yRqeJQz973UaWG8JyIlqBlTJX0wCZgPxev9
         nT1j3VeukKXBM1MJ13W1EH7te1+6cAzEIcjGKYNcRJFlaC2PPaBCJCq2B8/DlGvLMhN7
         ExJ0K9n81tawtMQJiCxQGKuk0kuSOKB7AHq0fsZ0rSPqc2dOdpYa6AVpCQPR7ZZ+a9G2
         3RBQPj08WXVkAlxM8lyNbx/fcUDcof/KZMYA8LFO8aETUpncHUKCs0y+1/IVy1/2a+aU
         475w==
X-Forwarded-Encrypted: i=1; AJvYcCVli7SFBajr3xZFbq1ZrbAEGUyTC88RSghIjSxDagf59HOn+qn5YKcV8eznDQv8zTXdqaUJwQb37Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJNQny23K958sVsDpcuCepMQenYZIlMJPWND+DtAXUu/kneifF
	f6fVFMdBAmyNbpc6mX/fQzxyEBixzvHSPDOSbq8Ohls9CrTBwYSVAq0+UkWxCog=
X-Gm-Gg: ASbGncsPDk1EXFgIYGCYvb5o6h/8q+sDElzSY+B+z90j9OxkcJwUkvhrZXoMdUd8dlV
	oPMKh4U8H4JsNyuEtshhfv3+EJzPCbpIftRLZe0hq8cQvN/8bG3qtzLGwcY6/OHkhwBMZMy20qG
	uTjOPT/QHFgQrVYdT37rYu//jOIXk4gFYVKJSyD3eQGar+Z1LOkZF6VhxoJkSpjWUQuynW/IQ0h
	nnGINU7aQiSSHfsirtAIL/Xb65bM9QwmKAxY0HQU6VkHaTVGFT+vsk5i+2W1uHGmxmAEXLjjmcr
	jKlY3y0cNwADtMfvFNYANE3H2TlmRFL0ymSNotMOT6GeLpOhHWO4hkZTMh0lhM2ZxxhYGFqVY71
	m3YnJ
X-Google-Smtp-Source: AGHT+IH3iL915yIdq/TZ3SghSzjHBrA67YTlPNlTvW0UwQg5lhydaAftA1GOGK6dP0WnlAE0+IgdvA==
X-Received: by 2002:a05:6871:d109:b0:29e:5152:dab1 with SMTP id 586e51a60fabf-2d0b3ab64d2mr1280859fac.13.1744288240021;
        Thu, 10 Apr 2025 05:30:40 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d717c1sm548726a34.25.2025.04.10.05.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:30:39 -0700 (PDT)
Message-ID: <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Date: Thu, 10 Apr 2025 07:30:37 -0500
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
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
 <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 10:47 PM, Inochi Amaoto wrote:
> On Thu, Apr 10, 2025 at 01:55:49AM +0000, Yixun Lan wrote:
>> Hi Inochi,
>>
>> On 09:20 Thu 10 Apr     , Inochi Amaoto wrote:
>>> On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
>>>> On 4/9/25 7:57 PM, Inochi Amaoto wrote:
>>>>>>>>> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..4c4df845b3cb
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/drivers/clk/spacemit/Kconfig
>>>>>>>>> @@ -0,0 +1,18 @@
>>>>>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>>>>>> +
>>>>>>>>> +config SPACEMIT_CCU
>>>>>>>>> +	tristate "Clock support for SpacemiT SoCs"
>>>>>>>> I don't know the answer to this, but...  Should this be a Boolean
>>>>>>>> rather than tristate?  Can a SpacemiT K1 SoC function without the
>>>>>>>> clock driver built in to the kernel?
>>>>>>>>
>>>>>>> I agree to make it a Boolean, we've already made pinctrl driver Boolean
>>>>>>> and pinctrl depend on clk, besides, the SoC is unlikely functional
>>>>>>> without clock built in as it's such critical..
>>>>>>>
>>>>>> I disagree. The kernel is only for spacemit only, and the pinctrl
>>>>> Sorry for a mistake, this first "only" should be "not".
>>>>
>>>> This is a general problem.  You can't make a bootable
>>>> SpacemiT kernel unless you define this as built-in (at
>>>> least, that's what Yixun is saying).
>>>
>>> Why not putting the module in the initramfs? I have tested
>>> this in quite a lot of boards (Allwinner, rockchip, sophgo,
>>> starfive and etc.), all of them work well.
>>>
>> it works, but not optimal, why delay clk initialzation at modules load stage?
>> IMO, it brings more overhead for using initramfs..
>>
>> but there is always tradeoff and bikeshedding..
>>
>>>> But we'd really rather *only* build it in to the kernel
>>>> for SpacemiT builds. You clearly want to minimize what
>>>> must be built in, but what if this is indeed required?
>>>> What goes in defconfig?
>>>>
>>>
>>> As defconfig is more like for a minimum example system. It
>>> is OK to put a y in the defconfig. But for a custom system,
>>> you do give a choice for the builder to remove your module
>>> in non spacemit system.
>>
>> I get your meaning here to remove/disable at run time stage, while
>> we do provide compile time option, if don't want spacemit system
>> just disable CONFIG_ARCH_SPACEMIT I mentioned, clk/pinctrl will be gone
>>
> 
> I think this is not suitable for the most generic case, Especially
> for distribution kernel. They prefer to set almost everything as
> module, and load necessary module in initramfs, but the thing is as
> you said, it is a tradeoff. So I will wait and see whether there
> is any new voice for it.

I was the one who suggested it might be made Boolean, *if*
this code was actually required for a defconfig kernel on
a SpacemiT K1 platform.  Yes I know needed modules can be
placed in the initramfs image, but I guess it's almost a
philosophical question of what exactly a defconfig kernel
is supposed to do:  boot successfully on all supported
platforms without an initramdisk; or with one that includes
required modules.

I don't honestly care that much, so leaving it as a
tristate is fine.

That begs the question of what goes into the defconfig
file, which currently includes CONFIG_ARCH_SPACEMIT=y.

I'd like to see that be the only thing there, and have
various SpacemiT modules define default values that
depend on ARCH_SPACEMIT (or _K1) in their Kconfig
file.  Like:

     config SPACEMIT_K1_CCU
         tristate "Support for SpacemiT K1 SoC"
         depends on ARCH_SPACEMIT || COMPILE_TEST
         default m if ARCH_SPACEMIT

I *think* Haylen said that's what he's going to do.  You
could make it "default ARCH_SPACEMIT" too, though that
builds it in to the kernel.

					-Alex

> Regards,
> Inochi

