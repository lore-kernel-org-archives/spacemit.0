Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF83F6C28
	for <spacemit@lists.linux.dev>; Mon, 25 May 2026 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727513; cv=none; b=p2CJQ/8igO0/o/C0AwfREfrL9BvMtsPO6ixfQXAZPAGC+xqUaV+QDsYcWcL4U2uSZKrGkYJ8T+p2iicr76k6WRhhPFGa5htg+ciZg832+dI9LGFG866vUjdzvdSWaUc8hgsKL8hXGaVgI/laOYGlXjoKmPyhUc4E7TWGCw5cwuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727513; c=relaxed/simple;
	bh=EufRUTTTgzWj+WK9k6gGFUGuDih7TCDOpQBoQIPNfYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTzwbfCpdatSeyqaAQJppG54AGF39cDEhx4588OWIj8UhNWY9/UH+a9s3UBQJlvB0T/gNYEQOdbY8TUK9v2TMVpJKd2s1lx9za+nJNF0FOYWYznOT22l2mcqPxc6VoYxmTNES5LG2YVjd9QQAsDEPyAx0vyW3TOW8cfXgJ5zQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sb0otn9H; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sb0otn9H"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ea19f412aso2581760f8f.3
        for <spacemit@lists.linux.dev>; Mon, 25 May 2026 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779727510; x=1780332310; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67F6STg17M288NH/Kzfu1U3GX4bjSdjuVgcfWDSoVZo=;
        b=Sb0otn9HquX+88M4vwCxpYUZOYX5ypUFu16L1m8YZU6yhvpewm/WFtIHDAlnnYXKiX
         yFLCUngH4fwOkHUH8EAWK8CTGrGWDBk2hLTDjiceS6T41W1PM8JEzMEQwXRK3JSl+l0C
         C/ajqCrutCbKbMdgxWuFOn3Zr8YuiUCiSg1o/7LJ7BRaErPC9K45JUspzKU0z82R3KqW
         GlSb/wdYXgDRx2GkEPuuDIHUrfPCLbRADWzXj5fNTUenLWGVxln8v9zIXM22l0KXcs6f
         ktBHwWGykBMBZ6y8KQFilqw2cKo/yTsnkgP6Cye5me2QPjlpMykcp2/MwVoG63DJeDhV
         +99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779727510; x=1780332310;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67F6STg17M288NH/Kzfu1U3GX4bjSdjuVgcfWDSoVZo=;
        b=pkBtVH5KB7CL/vj81Vwi21C+kt1v42UM9M0i7+j0yfJo44e3MAeoNZgPOzoAOJqAtx
         fRpw1Q7YwuLmt5Yx9JrBRUoNUbNE1gKVTyD89dWTE5+ScMIUx+Ar8TkTCnmKSlR5WP90
         TbleOJLaaZpzkeRhm31wVw3GtqdJASyF8S8YBqaELGUJql9H4sfkj+BtWysbwOySLzcZ
         c5QDmp8qrGljZ2rBOQcVk824ru3IBdg9DKvc1OJNiIpjwjyEq0O0Ech8wtXp0xjTZ7Nj
         PGqI6OMR0BVKVmTOmYStOKhJZ/PG9mW1levHJy+5+WbSsNZ7Qos1yTd5S65fxDMP6zQy
         1kgA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ftp+WiTES9kfpsTiTl9+uRs2x8Inr9OToCfS/CQ8LChRjgxPHssswySeWRLgEicGaC0pPEede3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6nTjmg+pJJ5BTFyRoQ/83U+GBb8525U+22odJoql+uCi7Su6a
	8goIAfwyLWHHsYP6a1+dkZZRp7ZlW9u1odZ1PwhPSjFb28WIsQLTmR1Z
X-Gm-Gg: Acq92OGmDDCIp6o26CFNt9WuPYfFe1thFKi6n35Exp+X23G8Oy2KKLif7umKeFzwA9i
	bIommCnYSqyyMYl3eSuERtBldy5AykD1zY1xwFcvjV+ZeeVPN20nea1tewkZKSte9tYCnUZqfy/
	gBXfG7s5cJ3oBm1VFF9IwymrEmEKO16gRMREQTuvqq3WYchuPIA2uB0w3ljVfaGzMl6Uke3BIZ/
	jq7XjH1zNpMoNikOG1bQm+wA/uzOoPAyaxEjkxZlmuYInyHU6zsdCYKNtU5/BbyMvdMQUSTsrxs
	0MZu6aJUzZyc7cdAO7vDAv3IajwyXWVyaGuP19NR0diL7BUySo/u4ECzGjsCXwtQumMJqxmLP+J
	D0wQ405R7eF9+m+A0CzyYh0fNBK98qnrfWeiR/YyNewXqLEnlx7+KeyTkprxF41BtMIQJv0J3nH
	ZTHKWMVSzvOvyn686lvfNYGRAwsmMn39cQGlyG0GGvgeqIwrcfHujtt1x058b65HY=
X-Received: by 2002:a05:6000:2c10:b0:43d:7a97:78b5 with SMTP id ffacd0b85a97d-45eb38d63a7mr25843635f8f.33.1779727509412;
        Mon, 25 May 2026 09:45:09 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-131-96.net-htp.de. [89.182.131.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e363sm29230186f8f.28.2026.05.25.09.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 09:45:08 -0700 (PDT)
Message-ID: <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
Date: Mon, 25 May 2026 18:45:07 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulfh@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>, Vincent Legoll <legoll@online.fr>,
 Margherita Milani <margherita.milani@amarulasolutions.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
 <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
 <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
 <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Iker,

On 25.05.26 11:36 AM, Iker Pedrosa wrote:
> Hi,
> 
> Sorry, I've been on vacation and I haven't checked my emails.
> 
> El mié, 20 may 2026 a las 13:11, Trevor Gamblin
> (<tgamblin@baylibre.com>) escribió:
>>
>>
>> On 2026-05-20 03:53, Andre Heider wrote:
>>> Hi Trevor,
>>>
>>> On 16.05.26 2:35 PM, Trevor Gamblin wrote:
>>>>
>>>> On 2026-05-15 22:57, Yixun Lan wrote:
>>>>> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
>>>>>> This series enables complete SD card support for the Spacemit K1-based
>>>>>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>>>>>> high-performance SD card operation.
>>>>>>
>>>>>> Background
>>>>>>
>>>>>> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>>>>>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>>>>>> currently lacks basic SD controller configuration, SDHCI driver
>>>>>> enhancements for voltage switching and tuning, and power management
>>>>>> infrastructure.
>>>>>>
>>>>>> [...]
>>>>> Hi Iker,
>>>>> I've picked patch 1-3, for [4/4] I think it should be merged after
>>>>> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/
>>>>
>>>> Hi Yixun,
>>>>
>>>> That makes sense. In response to your earlier feedback I had drafted
>>>> a more
>>>> complete dts after another schematic comparison, but Iker and I
>>>> discussed it
>>>> and opted to avoid changing scope too much. Andre's series includes
>>>> the bits I
>>>> wanted to add and more, so that works out.
>>>
>>> I have 4/4 rebased on my series anyway, do you want me to send it?
>>
>> If you have an update to make, please do!
> 
> So, how has this turned out in the end? Andre, will you take care of
> sending the latest version for the MUSE Pi Pro?

Yes, in fact I already sent it last week:
https://lore.kernel.org/spacemit/20260520130624.1763487-1-a.heider@gmail.com/T/#u

You should have received that (unless I messed something up) ;)

Thanks!
Andre

> 
>>
>> Trevor
>>
>>>
>>> Thanks,
>>> Andre
>>>
>>>>
>>>> Thanks!
>>>>
>>>> Trevor
>>>>
>>>>>
>>>>> Applied, thanks!
>>>>>
>>>>> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl
>>>>> support
>>>>> https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
>>>>> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support
>>>>> with UHS modes
>>>>> https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
>>>>> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with
>>>>> UHS modes
>>>>> https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042
>>>>>
>>>>> Best regards,
>>>

