Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A0264A9D
	for <spacemit@lists.linux.dev>; Wed,  2 Jul 2025 10:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453775; cv=none; b=cX2Vlpfc+GuU6sy/LObTE9w+PyokPWSaaqKavWMhnXvHriEXRrWBJBz+At7zkWQhxrgEoea7GaZEmT8KEfvB2M+aiZzcQpfhQTx9XdjLbe48P5L1voojYH2a07JGV0RjId73ghyTIJzfHtEDtthQ8VKvU040M0p611DpDQQCv+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453775; c=relaxed/simple;
	bh=yz5YFA4oK6aUwp5EM6RoGwk2x3CcGuJZ9jnhzV4Yj8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFWfhbTWw+mJbDch+9hnNvs4DEn9rrbJuH8eaWPHZFUSNpIGVD7fCG54HYRsSxtwUVyWIXpXRc3VIb0TdbpZKBfytk/oS+lKbxppeb3dObNzYCKWFx1RhoW9ndFn0voka4bAIOKAUzc7ss3Q448E4IvN8x2+f6gLp8NKGlq1BRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rv2zhRs2; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rv2zhRs2"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86efcef9194so240593939f.0
        for <spacemit@lists.linux.dev>; Wed, 02 Jul 2025 03:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751453773; x=1752058573; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVakVqHDVi/nEEBTUBbK2KldnbMSaWZ1ZSLAJh1Ij5o=;
        b=rv2zhRs2bM3VcZAtwlPwq7WCsAWcbg6iIRVWs6tacUTrLPPx+iMeYAH/hhuXGGRHDd
         PkoxKkn02tfkcFHMz3La6QBfAlRSCEodcGyrREJ8TcKTC9y4CcnAKjBD8ReqMSjuFUwM
         11jiR0wTxdnXdluJoOmCGLf1PhF7v4WL+gAUQ85K6Dyi7A0tTWVAemBAXADzxgxUicjE
         gIYpI6fx8HmrUtqyQYsv+a/ihFtVom56pBeNMyE+HNUXfWuAyfJ+44QNvxZFBg4eStgi
         y8xvvJUuFnYNTOjA8/y7+tgTczouQ+RDoPVhNo0ZCa25fMSu6lvO2/VLyjtzmOatVch+
         ALxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453773; x=1752058573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eVakVqHDVi/nEEBTUBbK2KldnbMSaWZ1ZSLAJh1Ij5o=;
        b=WAm3UM3mcxTRqcoM+oUIXgt+P5lpjhlk4EsGV+K5zXDcI0ux/HhobgtaSqOchda+pt
         mDEeE/OB8p8lO+NPF29RAWXzjAOG4Veauu/+gLOZWBljWRADnYReLJUesL7mhWwwJGYp
         +xsnWtE6wtswUCS5TgrV8JsdLKGmCmUJ9UsP4qUen1DrMemY1U/BWwU+fSjyHRMk4G/R
         l1A9lwNwra79XNV5DdNHLoyH1sLF10e25q/S6bq3gsVGTzwD6DEdgwBETzGilwBOo1vC
         /6UBZb2EozZGFHpSoWYS4WXGvgadNEUPMKyC6WJNFY5EiOviL+RrG3hWdqZUgPiK3gb1
         RqDw==
X-Forwarded-Encrypted: i=1; AJvYcCWzUrMEQGZqt1iPdolckKnOBn86sgIm6U43GyM397U0Yfo/stE/nUU1cyG/gfuRbz4rY89DuxfNaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt4lvCavJt1WSlW2533DCgRUyUnpST1hwPbFVZXc7zlc/W5JXX
	ifL3FS9EFIi0jPQ0nxnU5vtKog58g4jbc1EaH2VdprmhNoeH2wKJuO7GBh1HASihpms=
X-Gm-Gg: ASbGncux1JKCDR4qiS/fis7MG40yRd3WNqRdLp+q4QYNu+HQMgjlldtdrJdqdh8FQcB
	SWlVwyLJDSiOoUmKxNeyg+ushdtrTsYQi0wLSI+4zmP3H83wPPgspYO2ZITMOOjuWhix8kDPBxd
	CHDBhb7jBHB/0YVrZEVmaCafF557uHo6T3hCkuhm1kndpfg/UZSZeL57OHiG6sP+59YOK6/s9sO
	PJhgHAqvOHzwTwqxxllchIQQ0XoTWAMXsQ7s1wXVMErtBDGbNYz5/8nOvTp9EcUZBGpFYT26gdd
	0E//AlTnvBwiUJCBtjC+vGdc3NwwCSmJegWDEaUkRWHpIzWa9qonmXn4opZp0zRr9XMv9Q+qUv+
	UzWJvIITltEY+IclXF5cr3TYmyQ==
X-Google-Smtp-Source: AGHT+IH8nNKJXNfh+T2vOZJlqIemJT4UY7Zp92Fh4jhfNOQw5R6U/NR89uGXnsLbbnrSsXhZHL8VPA==
X-Received: by 2002:a5e:c641:0:b0:86c:f0d9:553 with SMTP id ca18e2360f4ac-876c6a0c90cmr288271039f.5.1751453772830;
        Wed, 02 Jul 2025 03:56:12 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204aa8a44sm2926145173.108.2025.07.02.03.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:56:12 -0700 (PDT)
Message-ID: <1a88fde8-7fc6-4f55-b25b-cd67b72b73d5@riscstar.com>
Date: Wed, 2 Jul 2025 05:56:10 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] reset: spacemit: add K1 reset support
To: Philipp Zabel <p.zabel@pengutronix.de>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250618111737-GYA157089@gentoo> <20250702061717-GYA304216@gentoo>
 <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/2/25 5:14 AM, Philipp Zabel wrote:
> On Mi, 2025-07-02 at 06:17 +0000, Yixun Lan wrote:
>> Hi Philipp,
>>
>> On 11:17 Wed 18 Jun     , Yixun Lan wrote:
>>> Hi ALL,
>>>    As the reset driver going through several review cycles,
>>> it becomes quite calm down now, I'd like to request to merge
>>> it into v6.17, because various drivers (pwm, emac..) will depend
>>> on it, even in the worst case if there is problem, I believe Alex
>>> will help to address..
>>>
>>> Hi Philipp,
>>>    I'd like to query if you willing to take the reset driver -
>>> patch [5/6] through the reset tree? It sounds more intuitive,
>>> which also will avoid potential conflicts with Kconfig/Makefile..
>>>    I've created a prerequisite immutable tag which could be
>>> shared between clock and reset subsytem. It's tag -
>>> spacemit-reset-deps-for-6.17 at SpacemiT's SoC tree [1], which
>>> effectively are patches [1-4] of this series.
>>> But, to make your life easy, I've also applied patch [5/6] at tag
>>> spacemit-reset-drv-for-6.17 [2] which has a small macro adjustment
>>> requested by Alex at [3]
>>>    Let me know what you think of this, thanks
>>>
>> Just want to ping this, what do you want from my side to proceed?
>>
>> or do you want me to send a more formal Pull-Request for [1],
>> then you can apply patch [5/6] (still need to fix the macro of [3])
> 
> Please send a v12, so that the latest modifications are on the list.
> 
> I'd prefer to either pick patches 1 and 5 from the list, or, if you
> provide a tag with only patch 1 to be pulled into both clk and reset
> trees, to merge that and then pick patch 5.

I will send v12 this morning.	-Alex


> regards
> Philipp

