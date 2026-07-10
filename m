Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C15423A80
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687344; cv=none; b=sAlYgHzzk2+mZ6nUQ5cWW9Zj1gSbzkadKIrJkYMAP85Q8iNBdP8M2cpUEwAwle+dXFGSSE26xfTmTCd0hjCVYf41A66HCKN2pOvkQHz7CL/EgXg9yiaGpQ+aq2HpSdlCeJzLJphI7mDS9FKvDHVSD8Lxh+I9dRyeKNWuPpZ8Gbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687344; c=relaxed/simple;
	bh=DWmNJ5lwsL10oKYuxQDPlcDGajEHoML1G3ab68pBqgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UK+AAwqjgejRG/O+ZlCihNPAEKeK/PzwVGc++OdkqKuyGDkvFC3ai/TQaluce87YE+obao20dTIdk4X3t++FFvTeNzUWe4tff/fpAbBxidYNAZukapwi+Eg/tS4LvHhHUAnbZ9h3x7qY4fG88oPePq8yc+z2u8ZwAC1AbPiJu4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=zwQZrD81; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="zwQZrD81"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so5713036d6.3
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783687342; x=1784292142; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJBwqL8OFuvpdmiP4qvFBor8YyEfp6aV/aiB/sY0dm4=;
        b=zwQZrD81iDHw6aIiWkNIbDcJMYmgc8uRRpjihyxQ09VBclVmRLXpcRzklqBO/7siGX
         +22Mjlj9R8l96zhg7W6CMruzcckDYGt6L+MpdBKmIs7TkVW0sRx/eLt6Wa9ddEXbwJtD
         jimxdmdz/HyLJ1tryrDnf4liYOeN968RZTpDaLNnUyPpsfdWY87qcoYvkm/PIY+SYmR4
         pnI+GmhLFjBZT5+LQL4K/96lR3FGHDB46M6UWygGsUM9n1zAzAK0K5qUaGu01ZZXiLgP
         cju91OSyyTums14i5qWJZzu/r8R/d4s6iBDOB2i+EIkKOD2MJ9EUZjalzl0Wk1OGDFjS
         tjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687342; x=1784292142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJBwqL8OFuvpdmiP4qvFBor8YyEfp6aV/aiB/sY0dm4=;
        b=pLnPj+zJglhCURVd5fm05IoktMEcQiAlXTCLaoTTH3a6D2nx/QBtuWzfabVeZUiFNK
         CT2K7uSTDZXBwJO5kVaeJkisORlp+6JAd56VtcJoPAywg0T/6KFVtc16M5PRrFzAQ6iC
         mjewoRhnyFE1HhdWBjScRysToPI7IpnXOsn8g0wh4aBJgrFzd/55j0mcmT9pLofr7X0h
         4WpJROI6hQysGTZIPLX5C0mDsEjAIHHkAQQa3YvMca0U+hQoNHjQCq1f0wTRp5N3Rk86
         P0EAAuzF1FUIAa5Opi0S7kY5c0YKwzbV1qiyfmB8es75mK9U4a80w7MXNiuyS7fWcrkD
         jyQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ve3rrUSVjcLHQwHw4iG9+SPs7pgIkn8z7JYgvokGhlKfB2wxDJ84v0zfP0kqf4Kk5HLUvUvYPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTSuDDNTRmN04QaSjzwrvAfACY7X0kdJpSMDFQgJ7LB+WSD3N6
	nJeFJ8IVOG8RmTKA3v8B0M5mZm16ojdA9zfe2S6uY4zLzUNkV0HELKvVuw7gfGKrk2k=
X-Gm-Gg: AfdE7ckXZJSX0IZudFA1EaOgX8w83822aDC4ePaiTAwWL3keNW1ypumY6XYRmuX7Atg
	HuEkJaRonVD6SyjKEUiaE8AqSObTQ+XJKak2DU/M6MOU2IQ0P7AWJqxOj4D01ixb33Uq0/VXMNp
	wxVYofVF1/25+qKRwzBMdUMnMVeAa5J0Ff33bsp89JS/4HNkA6hlPl/2I61GdvTnYO/xOBmxjeN
	lIJcEGG3766ONUrtvFn4yCKvA9vdEJC2Lsef75IGAozxMWX83aD7TRCrmxWNHKRhp+rT1GxbYZm
	5PREB5rmYGugNSDy0LDpKRolAJHdY667mdjTSB0UaVqmTM60X43XX88eyrVyTZL7v7kBKTL6/HF
	UE4k0Ceo1MmyECVieZ3/AgTiY2q/BGhVe2S9ougH/dZqMaXFyvCoxKjbg3kH62ASzYZSs9CoFMu
	AyHWJBDHJ9zI0T
X-Received: by 2002:a05:6214:5704:b0:8e9:f5de:d5b5 with SMTP id 6a1803df08f44-8fec3a038a2mr127470696d6.44.1783687341764;
        Fri, 10 Jul 2026 05:42:21 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d22bsm40069556d6.32.2026.07.10.05.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:42:21 -0700 (PDT)
Message-ID: <3cece33f-375f-4cb2-b07d-e75f065fe5ea@riscstar.com>
Date: Fri, 10 Jul 2026 07:42:18 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
To: Inochi Amaoto <inochiama@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local> <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local> <alDNlfb0_T9g-ATO@inochi.infowork>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <alDNlfb0_T9g-ATO@inochi.infowork>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 5:55 AM, Inochi Amaoto wrote:
>>>>> +	k1->phy_count = i;
>>>>> +	if (k1->phy_count == 0)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	return 0;
>>>> This doesn't seem correct to me, I would expect phy_count to be assigned only
>>>> when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
>>>> different 0 in this case.)
>>> I guess you think 0 is a valid number? I can not understand what you thing
>>> Assign this to 0 if there is no phy is fine to me, which shows there is 0
>>> vaild phy found.
>> Isn't it already 0? Semantically code is wrong in a flow (not in the result).
>>
> In fact it is already 0 here. But I am not understand why you thing is wrong.
> Could you explain it in detail? (Maybe you think it is not good to return
> -EINVAL?)

What Andy is saying is that assigning the value of phy_count
before checking that it is valid is not the expected order of
things.

The point is about best practice, not about the end result.

Best practice would be "don't touch anything if the return
value will indicate an error."

And therefore, better coding practice would be to check for
a bad value, and only after that has been done should you
assign the k1->phy_count value.

					-Alex
