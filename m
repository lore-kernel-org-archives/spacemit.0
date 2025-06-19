Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926D259CA0
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339436; cv=none; b=hdWHQd9RQZWYH6K3NBzMq6CkfhtkDUx9SZ4VyDP7PoNHjONX89ZTBquMbZdQ7rcgCICihNlQ+smre5F4e5WPBPFv/ryyT3hXyJWyViB4pBNKODi1gsUKyKTd9EpfGTU4S9+eck1oc37pPRuS0LuWvbG8nG87U9doCk+ItnIV9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339436; c=relaxed/simple;
	bh=yRrInhMCgBKy4u70p2vAMUnikJnhAHKwHd4sMoJNiLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ey8g9KBc9kneCN2GXLyXSTdronICcMnEIL1krAQ0lpHh2OXzoNpfM4kwyJ/GGwoRHsNGf1fRPG2OaGxZt9MyghjFR6NEk22NiTdNU5Yx2KQugqIGzDMh0PiTYQM2rE77Wp8YfDyzvfb7EXdVXEWwnL9GAE7WvZwEc2VNhbW/GEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Tu0oTktV; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Tu0oTktV"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-735a6faec9eso564240a34.3
        for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339433; x=1750944233; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMgLZ/LtsoXII7nkbaS4tPTkpnKfRrfyc3zePK7XFH4=;
        b=Tu0oTktVzOBvmHI76vr/+83cPhvmqrqh6Krs2wUDlspYhoa6w6KOr4tYEeLzpHtebK
         mQvNfGZYX2iNDH/Of6VG5wzg65szvFGovqsBviLnWbob/RodOv4Tzi/W9B+94rnaU5ky
         2znSGpePXp0kwvbfc94p6k1w2pdFiHHGuP1cI+JxyxQ6xwyuFqCaxNtAogDm6giwI7Cm
         LEOD72NVuEkbaHiaF46rEjY1F/UuNKl0a7s3wGKS66/h2TbfBEyTPXLh8bOax+NE4dHZ
         CmFRXuOtK+MhDTv8CsAxsmUx0EZU42QKZAMZE766AZpkDOyQpuFdKlslaUwoR42AOF5j
         Q8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339433; x=1750944233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMgLZ/LtsoXII7nkbaS4tPTkpnKfRrfyc3zePK7XFH4=;
        b=LOCniR/FTAyObRXYdMFmfMot4DjNkcv1b+7o/GL9YHjU/olcilaMs6JJ3W4aTQH18w
         Zt2346WmpDRBs3NhFetUCWFMd3/GUw/DozYnSwSuQ7H8eH5hAxoV4+j3u+rPtZwgH/bg
         U7U5Z6X5HLxi6BZvB6qnRr2dmk8t4GaPN+Ax8RvHyeeGRNNSBdTJCvqeAbOPwi8xHZXk
         R2V1YFcm3Ox4L3igFwxWBpUs7szX75nKkDsxykJEN4854P8FiMsFK0uraPHxAakGpLQ2
         0JeVkxlfe/2AGdLYKq0wf+tMHxTHWgS53ZfQYpZAGeOtsXd0qqdA66liPyJNl96PARgu
         oImg==
X-Forwarded-Encrypted: i=1; AJvYcCXTTgMraVMVT5P5VO5N0BRaVC3jVMzBQ5cxAzR78UWjYF+xLkFDdW83llErQa3xX5fxurCj2gUPMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxA1LXxCrfOBCQDHzgRy+h6J8/vVeaHhHrQQrh1NpoL5W+u1JrU
	fZ709fAMqTKY1c0aKstHCcXSxdmDYY2yyC0j9Ei/Yo9afjmBypi2sd1hlsPhzNIgeNc=
X-Gm-Gg: ASbGnct1uHPZyD+iL90hvADSw0fwv8YZR8AvnyxSWMRDA38hw3TGkDv/ECXAe2lkPJj
	9zTBwinJIo9YoBEtoA5kLv9NMSV4yPwWwDQ3tghcbk7v/YG37cu/N1+/dYp4yREru9W6yQPGl1j
	VjElexjYMpTWGyh7AOKhWCDdYRdxtjqXMKuHqnNUr+r/1bpvk22VpIgxASzf6ItTBIs2OcDQWSz
	gIGU8Mcu9Bv1X+sYkkA54TyI7nGqqrr8OwH15+9Ghjt6dwPJnPVPwJg8MTXXoB60O0NAQWt7NWs
	RRMDTC6rHbasHy1sJLl82+54z4svnI57TJS6642IwLjWM/Uy2WMsDmk3L5Wmcm8QzHZufI3qPuo
	R55NqGhhyM4IwioQgozViHx2mJg==
X-Google-Smtp-Source: AGHT+IFv7xGd3UTr9p6P6RvePe4D/mQncFt71O03oqdU9wFu4hav14OEVRV5ZjR0JYA/8QQYzl/Uag==
X-Received: by 2002:a05:6830:8207:b0:736:8a4:6835 with SMTP id 46e09a7af769-73a36297f86mr11682241a34.2.1750339433423;
        Thu, 19 Jun 2025 06:23:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a6e73284fsm645977a34.64.2025.06.19.06.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:53 -0700 (PDT)
Message-ID: <6504c609-f8b5-42e3-88ad-5cbee30a52ed@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:51 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
 <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 1:15 AM, Vivian Wang wrote:
> On 6/14/25 05:01, Alex Elder wrote:
>> <snip>
>>
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index 6d8988387da45..7bb7b8fad24f2 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -1384,6 +1384,15 @@ config REGULATOR_SLG51000
>>   	  The SLG51000 is seven compact and customizable low dropout
>>   	  regulators.
>>   
>> +config REGULATOR_SPACEMIT_P1
>> +	tristate "SpacemiT P1 regulators"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enable support for regulators implemented by the SpacemiT P1
>> +	  power controller.  The P1 implements 6 high-efficiency buck
>> +	  converters and 12 programmable LDO regulators.
> Needs module name in help text, as is the case with spacemit-pmic.

I will add this text.

>> +
>>   config REGULATOR_STM32_BOOSTER
>>   	tristate "STMicroelectronics STM32 BOOSTER"
>>   	depends on ARCH_STM32 || COMPILE_TEST
>>
>> <snip>
>>
>> +static struct platform_driver p1_regulator_driver = {
>> +	.probe = p1_regulator_probe,
>> +	.driver = {
>> +		.name = "spacemit-p1-regulator",
>> +	},
>> +};
>> +
>> +module_platform_driver(p1_regulator_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
>> +MODULE_LICENSE("GPL");
> 
> If this driver is compiled as a module, it needs to be found by modalias
> so the driver auto-loads after spacemit-pmic registers the regulator
> device, so you need:
> 
> +MODULE_ALIAS("platform:spacemit-p1-regulator");
> 
> Also, consider extracting the name to a macro:
> 
> #define DRV_NAME "spacemit-p1-regulator"

I will implement both of these suggestions (and will do so in
the PMIC driver as well).

> Also, consider naming this consistently: "spacemit-p1", or
> "spacemit-p1-regulator"?

Let me see if I understand your comment, by explaining the
naming I used.

The PMIC driver could support a different PMIC.  Its OF
match table specifies a compatible string with matching
data, and the data describes attributes of the P1 PMIC.
So that driver uses MOD_NAME "spacemit-pmic".

This driver describes specifically the regulators found
in the P1 PMIC, so it uses "spacemit-p1-regulator" as
its MOD_NAME.

You might still be right; but does this change what you
are suggesting?

Thanks.

					-Alex

> 
> Regards,
> Vivian "dramforever" Wang
> 

