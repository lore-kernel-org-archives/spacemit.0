Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC12D7D30
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611986; cv=none; b=uIW3UZ42MUkjIYCJLsI8F7l0CpNuzp8BXVzi50EElOt8FUzU4y5jv9KvNysPP18cxY5K4ft1DbMb1fBZuKTa4jmnJ8drCYyukpvfhjxPD6Dk/EQyv4aTXZ0V6XF0hG5N3ioi7WocVhivuPBUrrNismJb9Ppz/VSmWTYpBXQ9HJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611986; c=relaxed/simple;
	bh=xv9s+K7w28yZvwvYmPs6K9uJJvb4PymXWZDgqXpzD5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkDJ8rnZIS/vaUitCU3dOvoVu72YFxcCoFQXKe0G7mJSq8ofOySgSfuW6jZqovbscuh0+Tj2mTTTrKxNSYr0JX8QVRpeuJAxtlC5fph6za56oeduntt329aeOw3Gi5kdbrmgJl7V1THkUOnNHEkb3nbETfvAvA78gT+0xT8QPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RWMW0Sgf; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RWMW0Sgf"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45effa36208so722960b6e.1
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 06:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769611983; x=1770216783; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qmii9fWK0qOIPGEwrFV10/Zom1WAYNaPXJlgvztgTOE=;
        b=RWMW0SgfyiNQhFKTkKdQIPRMcz+PpyJEzO8IWSkVLbkmCy5EzPIwOfJ/5cTRIy0Joy
         Lg8yWDpDhPTpLWRJob57UoIv3KmlSorONuID43eYzCqufRFb/5KskD22y4UmBhaVVUFo
         EtQm1UIKCO3HlzmcJN6QF6tHZPgl2nCKQHmcpvAO06QPnrNpupo3WDZtLFn0T8tiNqFn
         r2jUTUHjGtbe/6CaOFHWHha9QtEDDn2xIsCjtzWArlj2aNK2DfDPMUPQ/0hhMToD0ngw
         xs3vR2XqmX2MbVcDK5QSkzLUZosUV4DoK9sySStOwRRtLgYGf9hNp5gnz+UKmD1O4ySF
         GGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611983; x=1770216783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qmii9fWK0qOIPGEwrFV10/Zom1WAYNaPXJlgvztgTOE=;
        b=DCp3PxVWIwWxlkJQupKKnyRjGSkPK2byUVTFbHNkHjHu4dNUGY6idXgncFfblUp2QI
         RNRUncT21PhTCNb/MPinIwCMv5TMxb6+0GP7tk6AYuCAQyFiI9wSy46BOJwXwfF/LE+d
         DC6/o1JxyY6Q5nn2sODAKHKg/WVuUvNarYS3LgGdAzXvPhvMzrWoFYTRJb5E+KPuXG4E
         LCKlX5SOS2asNhS86F1SsDXYQF7wZIISDHvNKGawCfsGMAZS6N+WypS/dJDI0042tpkX
         1fO7E8VvtpG2ruS0wktFFblhWwuCzeBvzIHAkNTCtvNNw2lQn3cnG/5R+CwbZigkQLCm
         D5yg==
X-Forwarded-Encrypted: i=1; AJvYcCVTto7QgZC8d9N5pHscYQVkorqEZX5t30RSBCwGYA+g0+Uo3Jr0dhGxlwsOdp2+aF2lCw5QPpmTLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGp63395P/cu993xDzjdxhD1SguF0Aqo4HumyuMcf9H7qqNCIF
	PT5T5Uh0reiUUz81eR40KYI6AoTNdLdRKvAjQafJ0cBP5YtfgeWObPZTSncWPoUuMOs=
X-Gm-Gg: AZuq6aLqpvcNdSYPWEihOlCDQb8XH9Q8g1KDHGsqqIQq144v1uEBrC7ouCnMKhGnX+r
	7Ha/vwT6yyonc70yh8gMG8vuvdzpPxhOVpjW3Hgq/otD2pYbiRqA38qZbsd+uST/2LQRMwhjGbK
	tC4sZQ6LNO8clBbOosILeSicInZtw89C1YcGtdSvtSrjLgxi8OF3Y0zIKzDSU72oBOLJe3M/4Da
	mXp80tzjx0RTeZWI9b0cSIWD4R041ORp10NI7epyxHDgl5GA9xRfvnYtBqPQ4/IwX25fDwybjma
	zQrz2whw5o0/JtVRQ4IR1zbivCqUYrYCruN5Ru7gZkI+IsjVH6BWzFruLczJfu+NcLH4xUh4BVi
	ye2tglbxwHU6Bc157BGXg3BV+mnD4yCm/Q0FD7FxKZzRrbH9kcZwvonzVIEUVce4sV9Fz3jhTlO
	1sPqX8zTHn5JhKzbQ3KX96ixB14omCCu5LNdx+JEttY/xCGEZYmDP68RacyRz+lQ==
X-Received: by 2002:a05:6808:23cd:b0:45c:a28e:63a5 with SMTP id 5614622812f47-45efc49c5b9mr2979856b6e.9.1769611982108;
        Wed, 28 Jan 2026 06:53:02 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45f08fb3887sm1365549b6e.20.2026.01.28.06.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 06:53:01 -0800 (PST)
Message-ID: <4817d35e-cbca-4b59-ac4b-5f47bde86077@riscstar.com>
Date: Wed, 28 Jan 2026 08:53:00 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] regulator: spacemit-p1: Update supply names
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
 <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com>
 <4395bea9-44d7-4f0f-81d6-c1e05976a308@riscstar.com>
 <CAH1PCMa_wxX_0YX0=3uMpKpE2FQ=COPafAL-tyJv3Y9kjdAujQ@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMa_wxX_0YX0=3uMpKpE2FQ=COPafAL-tyJv3Y9kjdAujQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/28/26 8:47 AM, Guodong Xu wrote:
> Hi, Alex
> 
> On Wed, Jan 28, 2026 at 9:29 PM Alex Elder <elder@riscstar.com> wrote:
>>
>> On 1/23/26 6:20 PM, Guodong Xu wrote:
>>> Update supply names to match the P1 PMIC's actual hardware pinout where
>>> each buck has an individual VIN pin (vin1-vin6) and LDO groups have
>>> dedicated input pins (aldoin, dldoin1, dldoin2).
>>>
>>> The supply is a board design decision and should not be hardcoded to any
>>> existing power source. This allows boards to specify their actual power
>>> tree topology in devicetree.
>>>
>>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>>
>> These are good changes but I have a suggestion on the way
>> you define the DLDO descriptors.  I might be mistaken but
>> I think you should make this change.
>>
>> Aside from that:
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>>
>>> ---
>>> v2: No change.
>>> ---
>>>    drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
>>>    1 file changed, 14 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
>>> index 2b585ba01a93..57e6e00a73fa 100644
>>> --- a/drivers/regulator/spacemit-p1.c
>>> +++ b/drivers/regulator/spacemit-p1.c
>>> @@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] = {
>>>        }
>>>
>>>    #define P1_BUCK_DESC(_n) \
>>> -     P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
>>> +     P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_buck_ranges)
>>
>> That was a simple change...
>>
>>>    #define P1_ALDO_DESC(_n) \
>>> -     P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
>>> +     P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
>>
>> As stated before, I believe the 128 should be 117 here.  (If
> 
> I will explain this in another email.
> 
>> you change the earlier patch, make sure the change to 128
>> doesn't persist here.)  Same comment for the DLDO regulators.
>>
>>> -#define P1_DLDO_DESC(_n) \
>>> -     P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
>>> +#define P1_DLDO1_DESC(_n) \
>>> +     P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ldo_ranges)
>>
>> Why can't you use _n here like you did for P1_BUCK_DESC() above?
> 
> The naming follows the P1 pinout definitions in the datasheet [1].
> 
> Unlike the BUCK regulators, which have individual input pins (e.g.,
> VIN3 for BUCK3), the DLDOs share power inputs. For example, DLDOIN1 (pin 17)
> powers DLDO1 through DLDO4. DLDOIN2 provides power to DLDO5, 6 and 7.

Ahh.  I didn't notice that.  There are two *groups* of DLDO
regulators, and each group is fed by one or the other poer
input.

Now I get it.

Thanks for the explanation.

					-Alex

> Since there are no physical pins named dldoin3, etc., I can't use the _n index
> for the supply name argument like I did for the BUCKs.
> 
> Datasheet pin examples:
> 8 VIN3 PWR Buck3 power input (1:1 mapping)
> 17 DLDOIN1 PWR DLDO1~4 power input (1:Many mapping)
> 
> Link: https://developer.spacemit.com/documentation?token=T1Btw2BdiiSlSXkAdibcoMetnag
> [1]
> 
> Best regards,
> Guodong Xu
> 
>>
>>> +
>>> +#define P1_DLDO2_DESC(_n) \
>>> +     P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ldo_ranges)
>>
>> So this is generalizing the input, which is good.  The use
>> of "buck5" here was a Banana Pi BPI-F3 design and but it
>> doesn't have to be that way.
>>
>>>    static const struct regulator_desc p1_regulator_desc[] = {
>>>        P1_BUCK_DESC(1),
>>> @@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_desc[] = {
>>>        P1_ALDO_DESC(3),
>>>        P1_ALDO_DESC(4),
>>>
>>> -     P1_DLDO_DESC(1),
>>> -     P1_DLDO_DESC(2),
>>> -     P1_DLDO_DESC(3),
>>> -     P1_DLDO_DESC(4),
>>> -     P1_DLDO_DESC(5),
>>> -     P1_DLDO_DESC(6),
>>> -     P1_DLDO_DESC(7),
>>> +     P1_DLDO1_DESC(1),
>>> +     P1_DLDO1_DESC(2),
>>> +     P1_DLDO1_DESC(3),
>>> +     P1_DLDO1_DESC(4),
>>> +     P1_DLDO2_DESC(5),
>>> +     P1_DLDO2_DESC(6),
>>> +     P1_DLDO2_DESC(7),
>>>    };
>>>
>>>    static int p1_regulator_probe(struct platform_device *pdev)
>>>
>>

