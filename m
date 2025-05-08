Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC541FF1D1
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706639; cv=none; b=KhuEpg7jEszuC9MUDxL4KDJhecThxrUqAXMi3FIdHp5EMbZs3a8JxiRKzxqVoRc0qHWcoHhIVAAeSnpo6k2njQyy38jJHvQ6kKAUdkU3n+K+14OsDpT6Ir31xOMh7VZSTrcc4F6X0ma8sKTHMNT3eBaM+TNo3gChaK6dVTwCYpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706639; c=relaxed/simple;
	bh=gI9+15/uiqpn2T7b42r1EP83YhqQAQmZi3IavWEk6Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DISiw90Q+VW71ux6XSpXTJ+1KRjCSQrDiz/fEM7BID+yFhvpmYknEimgEgMUUvw+nsjgcQPO0zEIaPOLwFK2cWbahw4vA6f3SfHVVvuQG2fBVYyYKClKajxuhReWnuUOqLZDFmONlZ96UKFHjLFBzuGz4+rjUgAIm0VRIR7zQto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tJQDaH5/; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tJQDaH5/"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85dac9729c3so74278039f.2
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746706636; x=1747311436; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITsof7vKMaX3jP45vYP8VvBDvnD7ar/ly91W1po1fYs=;
        b=tJQDaH5/IlzqiENiHTQXmGr+DxNxg/EkzFOuX1AiFz6RSWBDLzVspM+0eit5k2eYAd
         e/cH9n25UbX3OUMkccuzyPm/XAeKVvceDk8qKpx/w8qsKOJh9PzPI1vCQypisJEKtkTP
         /u1B8K/ihSUvew2Z9mn5BublAxPE4KQNk/Ur2SL4piwcxGpw6paf6RmJ5maXKyUWqlRI
         t7NAxl3ILPli88Z04zRokK+JkLEZpnbJt+4tV0Knh+XYcAOGe8XeawBqHyLqF6uToR1l
         REJjnyjLu4X6goQeJe/JBJBbRz3lgYcUS+BVJ7TFuxaERZ7Ioi9wJ3R6hOPt8NcR+nz5
         36LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746706636; x=1747311436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITsof7vKMaX3jP45vYP8VvBDvnD7ar/ly91W1po1fYs=;
        b=pGW2kNbc61gJPUIw/UFUosW7iAQi4z5TySF47g67ZmkQJqthjrmBGcirkoChUblj7p
         EiuEh/LTEQVfCqgXphPgg1jJwIZnM1DeT73mUCmPPTavnQHF2lHh6hqvOchDmmXjFCxo
         6RCBX+/ouqesC6ynoPu9DG9oheD69IVJVhpjim+Pm7bpFfuyYh0vBXrFszWq0Ay8H9bU
         G3Syg+AMD6TJ5Y6jgcTYG31oaAI0UcEZlCKwCBn/pdmr8raKAmWP5QmOmcDy7XuiK9Yy
         rZDE9g9/4ke/La47/GjLkUD2rGsKhr/Kvqnqyz7JnKLb4Wa14qD+wprAF0MigaeuRBfw
         Pyiw==
X-Forwarded-Encrypted: i=1; AJvYcCWhSfbNW+YJNLIyXbA9ex5Wg+bSrigdHNteyTSi/46h0QsObbvuM/Fj/6RiGpGTf6WGeWiOPRDwrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0yn4L6obPrgklY71ZyFlS3O/tC6WN7WAwHB8g+pMUljOOuiTD
	ArTjy6W40QvOZiZkR/D+Fjm3Z6AU/NK3xLRAuFT2RpUltN8C7jhk520CfLJ+CnE=
X-Gm-Gg: ASbGnctV8AbbPa/SoZkDF9ymJz7yHXN4cyQdg3LoshFJYrQg1A5mOd5a6y9yT2qdxHy
	ao7qCaVj0rhyNoSjIaXavDwqrVyEWA8y8nmGThpq74Ukq5snRS4Jtto3JjNO+QomuZx6VL4LFUE
	UZXRjJ4w8kdTWLMViOzmf1eQpLtbbf6Vokbsj91VfOd0LGZ/kxIc9UJTRO7iOM/p9wpi46ZphsI
	VoEgix1HKfWfEcwQofdo/zpVrjkiR+3Eab9OKfbY3akynA0IQYXxsCQMGRJM3dhHiO61q4Gr3aQ
	iBD2xIH0Sj0hoy4xQnkUarbCd1a4kIdREI65cCPq85ZiSL5LhB7/HcD8iQf0KXdyVu6igaGuIQR
	9c5EV
X-Google-Smtp-Source: AGHT+IEpsfxrAkflVw0/hRABTEz4CwO/hvBuswU8lzk6t7nrXFnCj3fyA636Nq30np0oFo7xbeEBJA==
X-Received: by 2002:a05:6602:3f85:b0:867:3e9e:89db with SMTP id ca18e2360f4ac-867473170e3mr934513939f.8.1746706636487;
        Thu, 08 May 2025 05:17:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864aa2bb1bdsm294250539f.7.2025.05.08.05.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:17:15 -0700 (PDT)
Message-ID: <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>
Date: Thu, 8 May 2025 07:17:14 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu
 resets
To: Krzysztof Kozlowski <krzk@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
 <20250507223554-GYA505240@gentoo>
 <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 7:02 AM, Krzysztof Kozlowski wrote:
> On 08/05/2025 00:35, Yixun Lan wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - spacemit,k1-syscon-apbc
>>> +              - spacemit,k1-syscon-apmu
>>> +              - spacemit,k1-syscon-mpmu
>>> +    then:
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>>> +        - "#clock-cells"
>>>   
>>>   additionalProperties: false
>>>   
>>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
>>> index 35968ae982466..f5965dda3b905 100644
>>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
>>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
>> would it be better to move all reset definition to its dedicated dir?
>> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.
> 
> 
> I don't get why such comments are appearing so late - at v6. There was
> nothing from you about this in v1, v2 and v3, which finally got reviewed.

Stephen Boyd said "please rework this to use the auxiliary driver
framework" on version 5 of the series; it was otherwise "done" at
that point.

Doing this meant there was a much clearer separation of the clock
definitions from the reset definitions.  And Yixun's suggestion
came from viewing things in that context.

Given the rework, I considered sending this as v1 of a new series
but did not.

> I just feel people wait for maintainers to review and only after they
> will add their 2 cents of nitpicks or even some more important things
> potentially invalidating the review. Lesson for me: do not review
> people's work before it reaches v10, right?

That's not what happened here--or at least, it's not as simple
as that.  Your quick review was very much appreciated.

Yixun:  Krzysztof was satisfied with things the way they're
defined here.  Do you feel strongly I should make your suggested
change?  Or are you OK with me just keeping things defined this
way for the next version?  I'd like this question resolved before
I send the next version.

Thank you.

					-Alex

> Best regards,
> Krzysztof

