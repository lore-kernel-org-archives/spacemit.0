Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C17280A39
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744401371; cv=none; b=RnpdbjSideDgcaI7wWcpRuLKrOW3nuRBUUAgIFgzB7yAppoq84EUMYtAY86IJRH5ROBXAxbpXFPrS6NJgbZVBTDNy1q4l11xinzxQYNuoNDR9nmH4OhvPSgEfumql2JX/zsxtXst7K3wNA+tvmpvt8SOKpLzwklMlloZRhmXUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744401371; c=relaxed/simple;
	bh=j9Tizz+SRhxb0fTkfoOzWc/NBGesQAebEneLXbxTKRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyuztt+qXYhrw7l/vjiwA3zzEbHbt7rmx7nSXA5BQ6TBGOIyAtwdRmFLjZdEtUH3ZkGzPr5s9pwqU7GzeOmCB4coYo0aN44M9YoVWY8Qe2BZPvi9asGpHQn7crIKo9zpFuphd8Wq+L3lvJlf+ArHDSx4R2y2cYD1F0kbSMArhLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KLJ2k3vv; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KLJ2k3vv"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86135ae2a29so199113939f.2
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744401368; x=1745006168; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pERBQu6v36RmU72wS1eWJUx4EztB8M6FCvDbPo24Sik=;
        b=KLJ2k3vv9C3YUhJ93cntg1+pAh8MnASQnDB4avuBgWg/0OWWjGQu/1xQbK8kuncLrq
         TEIWdmV48it9iLvSJxhv8B8motkzagJaEj16XxD7m8x7TGibRDKnwbU2yxt+SHuLsj32
         ZTfkVTH2QpKz/Xb7OCwAY99Jonl/BFGf37cYzY517a2YmUCcYtYbG9n2KUkWX8LGIyMY
         7rT2Sx1+wYP/sxeyodiNTAU3fHF9op8CtsznP1sc3RjWR44cCQGVwdHpKpGR341vlwZp
         degfTKV+yU0xWh40KEtrWHYU0NVlq5mxzNNsayjPdJ0u7pqHQ5L8Klff2QDtNXBTCGGx
         eoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744401368; x=1745006168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pERBQu6v36RmU72wS1eWJUx4EztB8M6FCvDbPo24Sik=;
        b=B3bAo5CiF38ESapnB0JFQp6+xCHDea/pvkdnwBdeE00nW5uq0lfhf+aoYGViHbbMrs
         g0ENgGLUPUWcjefqNHAIE6XGWJ+JrfmKZSZ+PWrDGUSSZt5Wk8pCpfeivtkOFYuCrvBy
         3FwLpVnELDRUg2nLrryym4atgrcywe0mteeKlwDQOcjg8K8Ui5mU3I1C40b40TF97dcI
         rwHY5sqFAGETsnha9ijXqEC/BJl4sUmbWR1Y2hgEv4S1Gbd56dM5ONCo7fOPThzA31k2
         AtXPOE0z2eyAXm2SEal9iSYXEmbKJnTd8QahLkDzF8o9hmTKjWc5oUPgA9WMHOTRA1Vd
         veJw==
X-Forwarded-Encrypted: i=1; AJvYcCVgLUUMr05kYV1cVvVYTG0Kf1jiCV4YIQh0fJFFhRdTzFYwRWIBJmQqU69Hgoi6YzieVdgUKqUu9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yypv2aOjCOiMmLZS9t9+ftoVjmTfkSDdHs8lE5hguY7PUIM/JPw
	jMGfW+YzWT8OXjiLmoCFWga1Vyrtu7FN+oTJra9kkCmStNuK4HcCu/15y8JDji8=
X-Gm-Gg: ASbGnctUMF9TZQtelCBdq2yoqE9sSS2fYqUNQgZoUjsAJjOXI1PKCT3LlX+UddCw1+k
	3JOsrNio2+MWx5ajMXfOd5JLzUUYK7NdvpjOfQrgwCdJwinGNl4P+Czxqam+iPg2pK893oopRCD
	3eg1cBsI5Yo3qCA0gjSA5K0QnB8jylD3MQmVnEUWOBzhbbDmsfadAeU4DNUlWaYOZpSLxYV0SFy
	5YkU9eLf2hmevqw9tn0p1XJ8g5jdZIR8dvcwU02uPJwsEVhlilBCfS80ReN4oDdXdDJWRBx3BGL
	fxfr4Q3BQCiD9okYyIsiCJtBqSbTDS1H/rhKmVgH6I58ZumUh6TtrlSx3wF3ByuqCt5rIKfYxyE
	Eu1gt
X-Google-Smtp-Source: AGHT+IGGVgYOqXyinnwT6qaZuwXYKc6jVRRPKYnkZ8fNRAGpPWFR1hWfOKnlDOwqftP7FLSw5NTERg==
X-Received: by 2002:a05:6e02:184d:b0:3d3:e3fc:d5e1 with SMTP id e9e14a558f8ab-3d7ec1cb49bmr44622035ab.1.1744401368624;
        Fri, 11 Apr 2025 12:56:08 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba6704esm14337435ab.12.2025.04.11.12.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:56:08 -0700 (PDT)
Message-ID: <925ea396-fd60-460e-a3c2-968d0d837a61@riscstar.com>
Date: Fri, 11 Apr 2025 14:56:06 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] serial: 8250_of: manage bus clock in
 suspend/resume
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 benjamin.larsson@genexis.eu, bastien.curutchet@bootlin.com,
 andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com,
 lkundrak@v3.sk, devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250411154419.1379529-1-elder@riscstar.com>
 <20250411154419.1379529-4-elder@riscstar.com>
 <Z_ltyAO-OBzl0adV@surfacebook.localdomain>
 <a3b2d0cc-c055-4cf0-9e03-3ea73041642a@riscstar.com>
 <CAHp75VchEcpP67oPC8xD+tYrY_A0BGSJqK=1au939-W60_qQoQ@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAHp75VchEcpP67oPC8xD+tYrY_A0BGSJqK=1au939-W60_qQoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/11/25 2:44 PM, Andy Shevchenko wrote:
> On Fri, Apr 11, 2025 at 10:36 PM Alex Elder <elder@riscstar.com> wrote:
>> On 4/11/25 2:30 PM, Andy Shevchenko wrote:
>>> Fri, Apr 11, 2025 at 10:44:18AM -0500, Alex Elder kirjoitti:
>>>> Save the bus clock pointer in the of_serial_info structure, and use
>>>> that to disable the bus clock on suspend and re-enable it on resume.
> 
> ...
> 
>>>>       if (!port->uartclk) {
>>>> -            struct clk *bus_clk;
>>>> -
>>>> -            bus_clk = devm_clk_get_optional_enabled(dev, "bus");
>>>> -            if (IS_ERR(bus_clk)) {
>>>> -                    ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
>>>> +            info->bus_clk = devm_clk_get_optional_enabled(dev, "bus");
>>>> +            if (IS_ERR(info->bus_clk)) {
>>>> +                    ret = dev_err_probe(dev, PTR_ERR(info->bus_clk),
>>>> +                                        "failed to get bus clock\n");
>>>>                       goto err_pmruntime;
>>>>               }
>>>>
>>>>               /* If the bus clock is required, core clock must be named */
>>>> -            info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
>>>> +            info->clk = devm_clk_get_enabled(dev, info->bus_clk ? "core" : NULL);
>>>>               if (IS_ERR(info->clk)) {
>>>>                       ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
>>>
>>> While the first patch against this file looks okay now, this one inherits the
>>> same problem (seems like not enought thinking about the code representation).
>>>
>>> Instead of rewritting half of the lines you just introduced (which is also a
>>> bad practice), add a one-liner that assigns a field to the local variable.
>>
>> So you want me to re-spin this again so that I use the local variable?
> 
> Yes.
> 
>> I understand what you're saying based on ease of review,
> 
> No, not only review. Here the main issue is ping-pong between patches.
> If you know ahead that these lines should be changed, do it from the
> start. But I understand the need to have separate changes for
> logically different pieces. That's why

I did do it from the start (v1 of the series).  Then I reworked
it based on your feedback and concluded there was no need for
keeping a copy of the bus clock in the of_serial_info structure.
In the interest of keeping the code simple I dropped it.

Yixun asked me to disable/enable the bus clock in suspend/resume,
so I was preparing the patches for that, when Greg informed me
he had already accepted the first two patches.  So I added this
new feature on the end.  This is the reason for this "ping pong."
I would have done it from the start in this series otherwise in v3.

Anyway, I'm sending v4 shortly.  I just have to run it through
another test.  It is indeed a much simpler change.

					-Alex

>> but this
>> is a simple patch
> 
> It doesn't matter how simple it is.
> 
>> and the change is very understandable, and the
>> code is no more or less clear when using the local variable.
> 
> See above.
> 
>>>>                       goto err_pmruntime;
> 
> 

