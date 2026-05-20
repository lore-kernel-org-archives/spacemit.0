Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BDA374E4E
	for <spacemit@lists.linux.dev>; Wed, 20 May 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263635; cv=none; b=AyuqaDnxzClRRzYloUGprawtQXyODe3KfoN8tONkRyKjWD1koL6Br/rZ9EGCU/ava1bJIyxoQg8pkJW55RNciLLygYu9OI9EP77co3dvjfZ7U2JRWTzRQGMtnDJtCM/pdvpq/xobSRY2tnFqQG8ByDzQprGb2hkj878wXacI9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263635; c=relaxed/simple;
	bh=hWRBU29dNFkhPABz8wMZX5qI45LPRwRDkloljDEwgiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sc++gXTTanzqN/wrTaukm7VVtlqq+pybVvjwe0PnDkfZYpgJOVxjpkjXXMCx+Gf7y/CLxO26E5ahDPDITYxLOodkjjE4ZZ21qPx40mvMhQoJODodueEhWbWvbhD50qX5koh7M4M04k2Pp+VV8/umD55nUYpPVqY1e2xl5d1k/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5B2JfEu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5B2JfEu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso54537945e9.0
        for <spacemit@lists.linux.dev>; Wed, 20 May 2026 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779263631; x=1779868431; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLZA4hvW9xs9FgysnR1c1k6UhOsTdTrM6VQ3/eZLexk=;
        b=f5B2JfEuWvGtaeh+rO4BZttPLmv0LbdZX3ndiwGsHlNCPg3w7n9G0avZl9oWHX4OgE
         anxf7Qi7THaYhVV+X7K1ULtZetkDGOu7zpXYbMj3RmaMUwcR4PnxN41BWm7ftARLgRBm
         jVVJuFjNBkHbJZcLScHhlw+rQNFcCFB6kVNrweTJJEztiSQqGq2Ew4QtpyGs4sidLkXc
         SyQwofa6H8ZxXO7xiP2DAtc5ijJPdyrKuaS+A+1D4pUqYvyTxPQTo7YAikTFTgSZLnND
         7AAf2NYUqP/O68383trMfmxiyJZUG+MDZIri2jo2D921pOs6keGpwWOVv7eusL6gFFAv
         OF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263631; x=1779868431;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLZA4hvW9xs9FgysnR1c1k6UhOsTdTrM6VQ3/eZLexk=;
        b=T+DXiZge8ehBNSCNY7VehfflnuWpzamT+T0PfLYNXzOuzas8/y3Qn8FycVxW3dy68E
         XXR/izdaBXBCHlXSkbgLY55CxcZkqbCaxcYtIkBG+Txx9S38dHviNSEkTwLPtq6j/JnJ
         WXdEeDARQTQnp3Pbhj1Qxxx3Ki6avcrHIb/V61P0SEl3wiZ/lFaxPJoOHQRs6a63Xxqo
         gqp/IM/vGPM8fSCE15FajU+H1LF2YWtHOeuU6eaxvRRjkBhfE4rX+7Sm8djdxlNw+cX1
         yr7ElY5zxCbk5GOUr52Qg1T3emz3nbVSWdQi1GsSURMxl83ceS4D5ng1/11U6SLHbF/h
         juYw==
X-Forwarded-Encrypted: i=1; AFNElJ+eMUEH7NcESvGobGmLjdbjWvKL51IEdQhedt7Ipdhii/mcBA9Tynz5/urcQFhQX6H5wRDFucdWZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCl/3LgdJZMBkvSa+jvyDdMFW9TEH0exUKuth8+LxhDpmAMg09
	IDSMySywJ7Qb7LwuDcMmX+SnSsxlZCdYhSbhJJvNgbHl5WUP3RLQJ4Pl
X-Gm-Gg: Acq92OEltHqEZ2X2uWO2mBpebE+dnGHXWUl6pQzh5ADxeyootkgz62c/uqtBMHQckFx
	TJJxO4QlmQolSUv/cMkDu4HSZFBr6BsCPJtz1MRFp/d6ZTZmSRzqq3DKJaMKRvgpoXFn4U4xhF+
	/IRiIst5qwjAx4IiVOtre9Pelv3P5qEyBYYyvwUdW7d1Fc711UE7L8F0fC1+ePdGhkgKWmm4+Sm
	hla0/GtY1L6NS7W2c1X3u7mDGxsppUYSQLI/Vgiva4JkYW/Bju+QA1h0FfefeGPU4PzbNwYyaQL
	24mO/RedNBuOT8wTKaecUkHSA0pmAvXm2/rITjjmIEJwPnHMmxzphENkHQ1erDJ6HI1NO8eUWcP
	La6CiLJAyJv72De/HMR7nB+XW0//HhJ+0eJtmO/ARenRQt9RLT2JVDYTwmKuil7OTIADZ+S/Fjz
	j2jrfMtKQqU3uh07W0GjyhF/Ngaum9V5+wM0VfWH4z0fVnwZgUcdu7nVKOeLhPVZRyWEki8SI7B
	BWg
X-Received: by 2002:a05:600c:a309:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fe61f20a7mr291977335e9.15.1779263630727;
        Wed, 20 May 2026 00:53:50 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-137-241.net-htp.de. [89.182.137.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ffed60c8esm91723435e9.10.2026.05.20.00.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:53:50 -0700 (PDT)
Message-ID: <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
Date: Wed, 20 May 2026 09:53:48 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Trevor Gamblin <tgamblin@baylibre.com>, Yixun Lan <dlan@kernel.org>,
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
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Trevor,

On 16.05.26 2:35 PM, Trevor Gamblin wrote:
> 
> On 2026-05-15 22:57, Yixun Lan wrote:
>> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
>>> This series enables complete SD card support for the Spacemit K1-based
>>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>>> high-performance SD card operation.
>>>
>>> Background
>>>
>>> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>>> currently lacks basic SD controller configuration, SDHCI driver
>>> enhancements for voltage switching and tuning, and power management
>>> infrastructure.
>>>
>>> [...]
>> Hi Iker,
>> I've picked patch 1-3, for [4/4] I think it should be merged after
>> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/
> 
> Hi Yixun,
> 
> That makes sense. In response to your earlier feedback I had drafted a more
> complete dts after another schematic comparison, but Iker and I discussed it
> and opted to avoid changing scope too much. Andre's series includes the bits I
> wanted to add and more, so that works out.

I have 4/4 rebased on my series anyway, do you want me to send it?

Thanks,
Andre

> 
> Thanks!
> 
> Trevor
> 
>>
>> Applied, thanks!
>>
>> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>>        https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
>> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>>        https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
>> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>>        https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042
>>
>> Best regards,

