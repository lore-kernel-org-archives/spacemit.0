Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52C1D88AC
	for <spacemit@lists.linux.dev>; Thu, 29 Jan 2026 00:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647705; cv=none; b=poAYAjsUjA5/BYvmzDzcCNyl1hldnOedhGf1tVeyl9p1E/R/B4rqNT5Kr7GMSYvFvFMnusjBwyysrWvyFUToDHZYgByCuheo3iN+CBxjUzn759f0BcZoLJtMyjbrho+AF3MwugC9gb5sl7LQe4LFG2IAKLCPYlo753+2Kq6Kv7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647705; c=relaxed/simple;
	bh=s6acg1YZfXk+qj172JzqyxisT0tzm2xM0+qf5t4a0b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ0YUGa5b/SskV8KXL+jHL4XK0PSzLUDsdkFpJqwTftS+Ngq8BU4WHRVNQ3RNPJGJKcR0EFBhD4bacqiK9si6n4xwU4lJXd+4jR8SuweVFf9IWOlZj5xDkTN2mpCMyy0k+tpnNq4kdL8tHpomIHKjkpH4eTYFMJPeHtEuA7qxRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0HvW0IUP; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0HvW0IUP"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-662f9b82a36so186797eaf.2
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769647702; x=1770252502; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbKwb212VLN49qYjAz8qGGRthTaVQz4Y5dXEvDAnI6I=;
        b=0HvW0IUPLtmdlopKliYuLj8PQ2fOi+tJ9ZKjtzLE0w28aZ4oFmcr7vjR/KmEgPNbuy
         4d/mjHsNjjn1oyLQXlGZjVO+8G6TdPrnkhtHejiOeIqR/3GWCgTa5PXFBw6x5AI9B/Ph
         PMv58H3SbYReYykXhg+0aOd3ObVeZAIRR17I17oHrf4pjpg2kBvNywMy5PAUw8ICNI/g
         K+03zvV6ZKn58xcKkUG3bE9B2ZMGqY5KKyPPbit5iDXfFL0vmx0NZdM+/hq6Csxo1OOd
         hne9X1JXGRSHPZNajqOPU4oJ/bnGydCS4vuUqV2crSjbxkGfCyK2hwlZiJyZdoksj2Bi
         D80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647702; x=1770252502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbKwb212VLN49qYjAz8qGGRthTaVQz4Y5dXEvDAnI6I=;
        b=pku2SnIeKagLAWEHnRcM47mT3ILu6L4HUQP942pbkPGt6XTLZbcjwIyxEtxzd7K9J+
         VSJAhG/jMNockbjNcLuFqSuN3LmcOhsaxtO0TiPakwOkYH7mLJ58G/gJVnx0hv9yoMry
         CjFsSXFtvLLn9arX0j6R6LuSwAQnbnmhfGnqp8ZBdIHlbMMjW9tThgrpHNlRbpRkxeSG
         AVWcg0kTaBAxuKUsNTiQ8D8ZAAPn3DnvmS5/195rtTUJZMJMuXk6ovu9rrXMKqF+sl3l
         iWuYHT6SyG1yTkrX/snpt1IWFqddMgVVNShBLvX9sTatvGM2i0cQt7zL1YU5GeFn3PeU
         3Cqw==
X-Forwarded-Encrypted: i=1; AJvYcCW60v9iEcMIfzYsH21RPrc1n7wLBZheeF8QDr9W9X/uKcley/GGJXYCYAgmGiOCG+UOR7DKSq/AlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvVT8Wzp/lTSD/eUZhnzg9YHlJ7pMva0qgGM0FVaXIgV6xjLdq
	NVxuurqysSxTIlVskhTKmxGJedKoX2dJIH5YwWJOiU/VTqhbCgcPzSkD2wC8mRJAP7c=
X-Gm-Gg: AZuq6aLzBsH2e2e2Z4g5OlzyzzI2QCwr9yMhtnCOuD+/fXbAx6+sCPXbbm56hdbLmhU
	w9zCty8FMWf0Rs0yYEpworobIE2nz5K14aYqZbptduuIRY4rmCCU4IGr/G4sUKpktDiFAdhtTPa
	bgyXVCYM+v2JhpgDozEuh79EejnNgmNPbpceSPULUoiYzlt0WColXuah/czXyfzx3tbfGvuk5My
	ZxntZDD3CrBdenna7wZgbqNSmid9Tka3ehuTwR7nLGIiGPXJUUlGHqIl3uK9ktLmsg1AweRPURA
	ksgyjoDklf1Sin7o6ChqLXp05BNwD5OrF2fLFQk+pwXEW571WrOLq86CvWaYFR8uW6zoJdksu8l
	BYFzVV4rL8PJfpD7xK1YETwVaruM9ylwanJOovovNQJ0AbHcoE9G9et3Gq7AR/d64HG8cxWLudi
	5XN4D/S1a9vJQhqT+nkEk2abGjQcmUpkntCEYfwYFfHhXiAPPJQbc=
X-Received: by 2002:a05:6820:4a0c:b0:660:e444:1098 with SMTP id 006d021491bc7-662f2174a23mr3237977eaf.80.1769647701832;
        Wed, 28 Jan 2026 16:48:21 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f9a18776sm2344023eaf.12.2026.01.28.16.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 16:48:21 -0800 (PST)
Message-ID: <3184a357-9f32-4023-9c15-d0b2fd502f4b@riscstar.com>
Date: Wed, 28 Jan 2026 18:48:19 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK
 and LDO regulators
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Yixun Lan <dlan@gentoo.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com>
 <501849d1-2158-471a-af25-da3dbb070422@riscstar.com>
 <CAH1PCMYWFhR-Np0-yq40eWqJbTmFub4qop6Wq2gA2mUqbJrtdA@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMYWFhR-Np0-yq40eWqJbTmFub4qop6Wq2gA2mUqbJrtdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/28/26 9:26 AM, Guodong Xu wrote:
> Hi, Alex

I'm going to keep all this context, but I have a few comments below.

> On Wed, Jan 28, 2026 at 9:28 PM Alex Elder <elder@riscstar.com> wrote:
>>
>> On 1/23/26 6:20 PM, Guodong Xu wrote:
>>> Higher voltage settings were unusable due to incorrect n_voltages values
>>> causing registration failures. For example, setting aldo4 to 3.3V failed
>>> with -EINVAL because the required selector (123) exceeded the allowed
>>> range (n_voltages=117).
>>>
>>> Fix by aligning n_voltages with the hardware register widths per the P1
>>> datasheet [1]:
>>> - BUCK: 255 (was 254), allows selectors 0-254, selector 255 is reserved
>>> - LDO: 128 (was 117), allows selectors 0-127, selectors 0-10 are for
>>>     suspend mode, valid operational range is 11-127
>>>
>>> This enables the full voltage range supported by the hardware.
>>>
>>> Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
>>> Link: https://developer.spacemit.com/documentation [1]
>>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>>> ---
>>> v2: No change.
>>> ---
>>>    drivers/regulator/spacemit-p1.c | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
>>> index 2bf9137e12b1..2b585ba01a93 100644
>>> --- a/drivers/regulator/spacemit-p1.c
>>> +++ b/drivers/regulator/spacemit-p1.c
>>> @@ -87,13 +87,13 @@ static const struct linear_range p1_ldo_ranges[] = {
>>>        }
>>>
>>>    #define P1_BUCK_DESC(_n) \
>>> -     P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
>>> +     P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
>>
>> This is correct.  There are 255 possible ranges, 0..254, and
>> 255 is an illegal value.
>>
>> I think this bug is an artifact of a change I made while
>> chasing an issue during development, and I neglected to
>> change it back.
>>
>> Technically this is a bug fix but it doesn't matter because
>> this voltage value (255 represents 3.450 volts) was not
>> required.
>>
>>>    #define P1_ALDO_DESC(_n) \
>>> -     P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
>>> +     P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
>>
>> I would say this is not correct.
>>
>> The valid range of values in this register is 0xd-0x1f (11-127),
>> which is 117 values; 0xd represents 0.500V and 0x1f represents
>> 3.400V.
>>
>> Technically, all other values represent 0.5v (and could therefore
>> be considered valid), but I believe those should never be used
>> and intentionally considered them invalid.  If 0.5V is desired,
>> 0xd should be used.
>>
>> Do you disagree with this?
> 
> I understand your concern about selectors 0-10. However, maybe you missed
> this part:
> 
> Code snippet from the c file, Line 53:
> (The p1_buck_ranges and p1_ldo_ranges are defined correctly.)
> 
> /* Selector value 255 can be used to disable the buck converter on sleep */
> static const struct linear_range p1_buck_ranges[] = {
> REGULATOR_LINEAR_RANGE(500000, 0, 170, 5000),
> REGULATOR_LINEAR_RANGE(1375000, 171, 254, 25000),
> };
> 
> /* Selector value 0 can be used for suspend */
> static const struct linear_range p1_ldo_ranges[] = {
> REGULATOR_LINEAR_RANGE(500000, 11, 127, 25000),
> };
> 
> .linear_range, the number of valid voltage steps (selectors 11-127)
> .n_voltages field, which defines the selector namespace (0 to 170, then to 254)

I think you mean 117, not 170.  I don't understand what you mean
with "then to 254."

In any case...  you and I talked offline and I now accept that,
in order to allow selector values up through 127, the value of
regulator_desc->n_voltages needs to be 128 (or conceivably,
256).

This is shown in numerous places, with things like:

         if (selector >= desc->n_voltages)
                 return -EINVAL;

         if (selector < desc->linear_min_sel)
                 return 0;

In <linux/regulator/driver.h> it states "Selectors range from
zero to one less than regulator_desc.n_voltages" but it also
says n_voltages is the "Number of selectors available for
ops.list_voltage()."

The former meaning is really about all possible values that
can be stored in a selector register (field)--whether those
values are valid selectors or not.  While the latter description
sounds to me like the size of an array.  We have a case where
some values (0..10 and 128..255) don't really fit (they all
represent value 0.5 volts, while 11..127 represent a linear
range).  And I was thinking n_voltages was 117 (the size of
the array), rather than 128 (one more than the maximum
valid selector value).

In any case, some of this seems less clear than it could be.

But I'm not going to get in the way of your patch being
accepted.

Reviewed-by: Alex Elder <elder@riscstar.com>




> With n_voltages = 117, the maximum accessible selector is 116. This makes
> selectors 117-127 unreachable, even though they're defined in the linear_range.
> 
> n_voltages = 128 doesn't enable those for operational use, it just allows
> the full valid range (11-127) to be accessible.
> 
> This is why in my test for the K3 pico board, setting ALDO to 3.3V
> (selector 123) or 3.4V (selector 127) fails with the current code.
> I mean that leads me to this bug fix.
> 
> Best regards,
> Guodong Xu
> 
> 
>>>    #define P1_DLDO_DESC(_n) \
>>> -     P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
>>> +     P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
>>>
>>>    static const struct regulator_desc p1_regulator_desc[] = {
>>>        P1_BUCK_DESC(1),
>>>
>>
>> I have exactly the same comment about this change to the
>> number of supported values.
>>
>>                                          -Alex

