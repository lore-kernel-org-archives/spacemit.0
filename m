Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663327EC7C
	for <spacemit@lists.linux.dev>; Sat, 16 May 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934908; cv=none; b=lMleyVJ4kBQZqa2GKcbcJYeQZA6T6mOLAfhGg5WLCblII8lmZcjsPG9bxxyKntFqe8LZf4BnY1JLFE7Oh9o1RlNpd7/gri/WLMF3O7lPtLZq9YwVpXc4ivmZ/60vfxzpR2FqBWkS57zClJSxKMZzFF7dplVf/ZfUkPtcUYQeaVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934908; c=relaxed/simple;
	bh=/0+rB3LCDje5H1GWAPmFkRfOosbuwDC1QTWFKmh24Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9mgPWgyfVHxB+h7ovjCOWBgS/A+f2XciUk7iiXpCP0OEldszSDtVQR641wagMrJg0PkWLtd9h3VRKfTecSUoBwJA0s8f6KPQRNtpIEIRappfE1WVobXtH8QQXUh+rAIFlt0JWul6xzEjwqk+mDXGYxnwl0bmruSdpjrdlTL9eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=ae825kOm; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="ae825kOm"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-910f734b477so119198585a.0
        for <spacemit@lists.linux.dev>; Sat, 16 May 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778934904; x=1779539704; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlYX20Tz7KrUA9/+ib940qbKVKDUFNbiWx/P6UgmXqc=;
        b=ae825kOmFyfqOo7c1ZA3lkis01yTF3661+ZExvG8V1NqZFJQ25U68p7iuyP97G8j0c
         XSgFiMKS8a7j0iSp6zxki5ZgV9JgEjaOa2as2YoIj1/HNfkW09L/X2cF5UZcGP7ON8zK
         AeEth1arBwxICAVrpk478Xp4Cs2Ju7NfjDsuOCWLeVzxg1ql0taG24Kz9zR65bLO6Z7E
         U1+1J5DhKhPHJ0qEOuR4wbG1bWcmbWG5Dtc6R8V3LoU4gz49o7CqDWrnagEQbPi9tl7t
         l5W+lwLu6Rs5i2aaQ4CV+ofXRMd1kjEjYUX0Fz4oVANXr8TljZG6iZft4KFB5+u0f8qz
         XH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934904; x=1779539704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlYX20Tz7KrUA9/+ib940qbKVKDUFNbiWx/P6UgmXqc=;
        b=qAj+aWTgvfkPOiITs7GZY5xmBtKD77MLZlgt/i9InfQbd+s/yq15eRUKkgeYMpu4zl
         f/1wEJEAZA2pOUVnLL2n0mTGMG7y7TBafCtexDqjhJQxX80yPJcrofD01Fw8Y014zTiS
         /Nx4s+ksfrpkI6IBwVg4f4eoaHN7PSZTdAYfyVxZ5YVxqkfc3sl7BLbJ11xdvxlELBWr
         ph9925maEST9yVJC2dDsPfN4WCQmoJa2Ps5pdMWvMRIX3HYdvACkUOA7PRytrp7Q1TtY
         eBZy2BgY6Zw44affNDokYFaQyIYmzf/cL10DMOoIuIQPOjrR0nCVb6QZJ4Q9iHrvABZn
         6QrQ==
X-Forwarded-Encrypted: i=1; AFNElJ923gThwnJ15Y5OEZd1otTtS1YSXBKrXQRUhD2+sqXfR5s5Iz5dZScci9eLOVuCalO/hjnJYcn6NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdN/3u2r91XL25s7FmL/xHXUdOlkwbbj9nbrzpantyXVBUslIx
	NLvs2srwmYJXNjYG70POG0LFTI+ts60fiRPZJWLZlSDMPlU868JMJL4acrcd/AlM/Mc=
X-Gm-Gg: Acq92OHs+6exrEEMWO56MzEJM75Wl4E8ibVWcSRQzhngsmRMKGc9funBxPVm5FAJsUm
	NPiC2reDud5ZwqrS6Zjal9+dO6rFb8272jSVem8yzUwSaStHydBjt86nOv669AeRwUi5HZdMR9Z
	9rxUDgdB4/mL5Z+tuFRTObW7cieylUCuSWBzWe9m0sCUozMX8QNzqh0OqTaLt4yCg0F7XPIBO5G
	7ITUXMo9mERpI3oI1QWQHcqP7WVhtPFWP5zFGk52ULAF5uLiNR9Z/cc9Si4731kcvdyVUe8ot26
	F2Eb4/w0oZCw55XstTv37TNf72bRminpJQAVdgumi+b7ReAoZssYdohpGedrgicT0PmVE7fj3J7
	4ht0edUPKop+LLDBC9n2w4bSF/Vcqb2NqFAE9vd/b0CX5dtUGd7eQM06w8+arzn7Mp2PLfOx8Bp
	623xcd1VYozgcnlBYXnpESCpa6XxcQDblG+rCI7VUFjpx2nFlPUpvl3Y+z7uOuueDruoIMZS1x4
	B8rWR3vTOnVulc=
X-Received: by 2002:a05:620a:7087:b0:8ed:d906:a8ff with SMTP id af79cd13be357-911ce04464cmr1176183685a.14.1778934904152;
        Sat, 16 May 2026 05:35:04 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:9cf2:2d6b:fbf2:991c? ([2001:1970:3847:e000:9cf2:2d6b:fbf2:991c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3776dsm895724585a.39.2026.05.16.05.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 05:35:03 -0700 (PDT)
Message-ID: <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
Date: Sat, 16 May 2026 08:35:01 -0400
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
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
 Aurelien Jarno <aurelien@aurel32.net>, Andre Heider <a.heider@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <177889984452.2298656.1074391459031404894.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-05-15 22:57, Yixun Lan wrote:
> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
>> This series enables complete SD card support for the Spacemit K1-based
>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>> high-performance SD card operation.
>>
>> Background
>>
>> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>> currently lacks basic SD controller configuration, SDHCI driver
>> enhancements for voltage switching and tuning, and power management
>> infrastructure.
>>
>> [...]
> Hi Iker,
> I've picked patch 1-3, for [4/4] I think it should be merged after
> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/

Hi Yixun,

That makes sense. In response to your earlier feedback I had drafted a more
complete dts after another schematic comparison, but Iker and I discussed it
and opted to avoid changing scope too much. Andre's series includes the 
bits I
wanted to add and more, so that works out.

Thanks!

Trevor

>
> Applied, thanks!
>
> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>        https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>        https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>        https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042
>
> Best regards,
