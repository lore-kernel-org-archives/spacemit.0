Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CF3DA7F7
	for <spacemit@lists.linux.dev>; Wed, 20 May 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275499; cv=none; b=nrUj+vZEWnBad7xCt/KAh4dy6iE7fpooNopGFRDbFqTCiMgQuTq0W7bqoCnWnHAnoDCl1MCszdpyM38G92Cx6qwU2d9V91/oeI0RmfIOjuuSi3FY+UJv0L657m/IZR1NTbX7ZwY5TIRW4X/SImt3cMVYd4GBYgkTIDQiksdDd8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275499; c=relaxed/simple;
	bh=cfAIhH8OlC/rUFBfMHcfbIEw1X3DBJ4OiDfy5zoYzMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGZ2GMEsaNA4Qv950tCezLLNSAnU3nx/slbF56qh7y0QFMiTt3k2WCx2f/FF7qsVBubZx0YOa8NkVw2ahfrs4WKlTU1XOyaSYsNIrRfVkJ/gPyxgpObabZ7qQdcn8FJ72/L47yzNmPC37Mo1ldlmZKTmrKHcKeYPZCBMi0OVHUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d0pVainO; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d0pVainO"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-90fa736d46fso301716785a.0
        for <spacemit@lists.linux.dev>; Wed, 20 May 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779275496; x=1779880296; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIkzPbGJvuJiBs7z1ji9U2DALkh6krIE8tTV4POiT4k=;
        b=d0pVainO1lHysBT0t0F8COMigAJgeEVOHYvk4aYcIItqDp1eogtiLvT9nhVNVksNNz
         bC68ma1M48q98wX7jWA5qfDeKP07bPC0BVngA7pMHMiT6LnHPHFKoADyccf3ZROMbgN3
         iJEBnkd0j60dj/9DxeCLUVSC+1/IuQQP6khwsSnCMYbwcDKk3X2qIwbG+yUQ3uD9YPVu
         Wwc226c+lkPswGTC72s+ID9ZlagoRltMvyhgWF3a6+t9Mx6yI61ZdbK8EOqmHnvpJZym
         X6egkzyIhdYNlWDm1gukh3eD69L52jG4e6mEGanKfr8J5mOG+KW22N7pDrVMEQdUURh1
         nJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275496; x=1779880296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIkzPbGJvuJiBs7z1ji9U2DALkh6krIE8tTV4POiT4k=;
        b=dokHhhfsATCcMMHaY0eylanwDHcS6qYTjH2qnXyvWl5s6NeZWX0TnzVM40NfDOmZXp
         L+XptN+A2A5SBcCEaUKrPKcX2Z1DSWPA9seS8c5+Fc4STveHLpzPCyGbVzVcAcGiLi5C
         WehharWvNq4YCR//wIwWLBu2OWogKhlRPWQgbaZFVZK2w8Qsv3u5BLMfGrxwCgWHJKM8
         go55xQonaSvK+2loQeX/Q/JqxL+U3yO51bWZagD/Id7BogkSYjaanXmyATzA3bLGZIhK
         Y3eQ3ViCnOnLPjA7ICoerCQzZCHY+rIx7Gtvb90HcUkPqd9AWzwx9DyPnTbbQSjhVNGZ
         TTLw==
X-Forwarded-Encrypted: i=1; AFNElJ+i2NmXWTxuZ8ujmjFQq/EyP3tDvKxB4xOv6+j3HOnyUiXThKvMYaTzyncDt0mQCkqYPlwuArfAng==@lists.linux.dev
X-Gm-Message-State: AOJu0YwStwIuo8ZNWtIYj9+YrM3mRQlWaDksVticNzoDYyQRIk7kkgac
	qTuYR9XdNuFHFK5doI4Yf0N9iIMjgfm93vRvEi0IzcORWKy5EsMsUXWZcCCo5PGch+Q=
X-Gm-Gg: Acq92OFtC+mChvz+PVd8K9b4LvTDnt34ZTRngUqrCdwg3MRYCBhWqaUemQJh2617Ayf
	ZBBuvkia+KYHxphFhGxhTOhC7GEslQWImCp6L2GkH9eln+f/wQn2BrE47P8IMuzpaUN6y7IkvP+
	mXQ3pm50kgoXxbpa1M8Rr1tU10RObigYOx/S8HZb7o8SA9+As5KeQ5Zlq6YOb6F8Hf4ca6NlXKe
	x28kJiyMKDKUj4/MkxxyWJ18MEvVb3d1VaDg1UV4J4aECaWAjYBVDn+3AZTmkKk1zv58FuCh341
	IqYk18cyFQv3EKFtlS7hUFsP+nfEj9xyTbbWbqP9ziJnDammOE/vCYuz3nd34XodYN+/V1cJYLm
	uU3c9TOxU60wAkdml9tv7xgKdUgUCBGgh1tesMSzcBrKJk+LEbwvXJ/dVBoA7wVJAExWe2K7bTi
	+S6D3rHGo1KpQnxj7oMkQVEeGoHO6QsFssQ/rgjwpZMwzYglxZ9RecWFgiYvGCXVRZFtkBlNWb9
	N6H
X-Received: by 2002:a05:620a:1a0a:b0:90f:6d8b:2654 with SMTP id af79cd13be357-911ce332987mr3395608885a.22.1779275496216;
        Wed, 20 May 2026 04:11:36 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:9cf2:2d6b:fbf2:991c? ([2001:1970:3847:e000:9cf2:2d6b:fbf2:991c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9138a830c89sm1320813985a.6.2026.05.20.04.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 04:11:35 -0700 (PDT)
Message-ID: <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
Date: Wed, 20 May 2026 07:11:32 -0400
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Andre Heider <a.heider@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulfh@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.dev>,
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
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-05-20 03:53, Andre Heider wrote:
> Hi Trevor,
>
> On 16.05.26 2:35 PM, Trevor Gamblin wrote:
>>
>> On 2026-05-15 22:57, Yixun Lan wrote:
>>> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
>>>> This series enables complete SD card support for the Spacemit K1-based
>>>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>>>> high-performance SD card operation.
>>>>
>>>> Background
>>>>
>>>> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>>>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>>>> currently lacks basic SD controller configuration, SDHCI driver
>>>> enhancements for voltage switching and tuning, and power management
>>>> infrastructure.
>>>>
>>>> [...]
>>> Hi Iker,
>>> I've picked patch 1-3, for [4/4] I think it should be merged after
>>> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/
>>
>> Hi Yixun,
>>
>> That makes sense. In response to your earlier feedback I had drafted 
>> a more
>> complete dts after another schematic comparison, but Iker and I 
>> discussed it
>> and opted to avoid changing scope too much. Andre's series includes 
>> the bits I
>> wanted to add and more, so that works out.
>
> I have 4/4 rebased on my series anyway, do you want me to send it?

If you have an update to make, please do!

Trevor

>
> Thanks,
> Andre
>
>>
>> Thanks!
>>
>> Trevor
>>
>>>
>>> Applied, thanks!
>>>
>>> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl 
>>> support
>>> https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
>>> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support 
>>> with UHS modes
>>> https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
>>> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with 
>>> UHS modes
>>> https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042
>>>
>>> Best regards,
>
