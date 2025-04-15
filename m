Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C19292915
	for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719070; cv=none; b=GXca+bkTybSe6w1hp9O6AwKR7psHBITKcg+J7d5r2zXJhl/7VXn5PfUc7vZKVSzl06jRBkeQobSIizBCdegfSImVuMRS0VPJXm0QRAmBfCuEV/Y3eARFiJgGRb4ds0qCkZh4TlZRCot3+eg+QS4VNop+s1tNymIbVMj48vZVPGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719070; c=relaxed/simple;
	bh=eIVl937PhzBBGlKlkh8kLTfnaLkiCL+to/VPTSqs/hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/5C/PVg/8Tdbh+XCbLUtcuNvND7uYuvfUWC3m6imgdVtJP+KEc4h/s+jNRcodEDEVbKg1zS67kTD7/cGPdnOYM+HpB+1r611avVD9qpqTgMExzou4bALQ+Vv37cMEqbKnQfazsTTguj1PUqLb6e25d20lJRj90PiQzJ/IohoVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=praiMyvV; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="praiMyvV"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so17766655ab.0
        for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744719068; x=1745323868; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmptmweS7lJ6GHE2wFUYE+JWDVLKYqz8ucpeUP/DcRA=;
        b=praiMyvVJ5w4jLTDA/tyrfYJm8KRssBU8nqXA/55On6nGITcNxp7No5kNYH47Nd7t7
         wdGPSa1laYxxJpAku4SIM7FMilQSH+jnBE8upi1LDATT7c3U8S4aUcfcFpnpsLb0NOUJ
         4W1RWQq15svktloidv2z3zdxKIBBrHKbXePfjhs1kIW99mx0fgVvd7GwF9WJ7Q23R2kT
         shhE2DJd8f2rd/X+gMVNcbfRE5KuF1rwL3AXZJsgJbR7NLJ/AqNp6/cbOfVtINnXfp7i
         ntMoLsf9gicdxp2i7cow0NLU3qhYojvc1tKeUlRQhPFibuUtwxMC0YOo/tcWa+XqjkFc
         EgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744719068; x=1745323868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmptmweS7lJ6GHE2wFUYE+JWDVLKYqz8ucpeUP/DcRA=;
        b=NDgv1but6/XOwj5A0ySz3vw4QjC8rNwnDjWwXWZ9l0Wx+m2/q5be9U1nGDDj9vAkfs
         Fs/DmTWjSSLAF7pfzBZmykb9HEWGRhrM/mEtJsEtycve71TI5gjGDwXk9zCbVXG4NxfL
         EOSCPKeGpOknJqmIG9VDjRnvS2pBAWIsYpFh1pWvIrkYbMga08R1QQQgzpu9qseNHEU4
         8DP8bJoJzN7LgA1qovCY/Oz+EehZ5e3wCLjsq6zR8YRnrh9+x2cXano7Y3ZlLeOMeUgx
         LOVDrB31Wza2IN5Q3EaSv7fMrRofpg29ZrSrDp97hqKpnxB7ivv/+u14HWMSNKHl+pug
         S9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU1+5ivFUGdSy8Wu6Qwhk6oxL6r6I83pAwumteAJu9Rptj1EXc8iiwrvLRUf+igSfqnZ/kJ7x5mJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx50LEIFfvsZKkiR0jO/rfFsoR4RA8iPz98a3B7jBjOEHlXFRKB
	9ywzrv3PvSpjL2VK5VdTxLs9jJf0dRVnYhsToJVZsJpMV2UtrUDq0XPS3UGvcag=
X-Gm-Gg: ASbGncubmz0H1jNzaaHJwUo9YUn3QcSOawdaXIDgvRoZGY9oJph9N5qD4FprUgRZKcf
	A4ehOlAc/SzQhV63cFJg469DFtoXTv0x/n+xJRHSNgNcgmHcsG8wbBvR1PW10tn/rKocdCxRR1Q
	bR6/lfJWJObLKVISc1Ka7fyprDDImSeUI0Ir7Ad6VKMUnnTQSoRrI6jN3BnGdhVgDBc8H2cNm4M
	auglKYAbsi024brvwgcnRqLb1QZpWIbCAlr48B3KA0Uf7eeJJ2G3mR7jgjcOwnAnnidLsz1aqms
	LDIwHWHVREz/xi2/x0R3I33/r3k9BaUICagP4qG6hgNHmeuZ5zqGO8PUw82RTC8fhHnuKhxMqE7
	jQxAq
X-Google-Smtp-Source: AGHT+IHJ1Ly5q6h/cItnEzYwsEqY15X2cujDF4x9G+IO1L2NReprTYetKPX12tqvaoe5ju58AuPTaw==
X-Received: by 2002:a05:6e02:441c:10b0:3d8:975:b808 with SMTP id e9e14a558f8ab-3d80975bb69mr22117655ab.5.1744719067875;
        Tue, 15 Apr 2025 05:11:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba66fcbsm33384565ab.9.2025.04.15.05.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:11:07 -0700 (PDT)
Message-ID: <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
Date: Tue, 15 Apr 2025 07:11:05 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, drew@pdp7.com, inochiama@gmail.com,
 geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de,
 hal.feng@starfivetech.com, unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
 <20250415101249-GYA30674@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250415101249-GYA30674@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/25 5:12 AM, Yixun Lan wrote:
> Hi Philipp,
> 
> On 17:54 Tue 15 Apr     , Guodong Xu wrote:
>> On Tue, Apr 15, 2025 at 4:53 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>>>
>>> On Fr, 2025-04-11 at 17:44 +0100, Conor Dooley wrote:
>>>> On Fri, Apr 11, 2025 at 09:14:15PM +0800, Guodong Xu wrote:
>>>>> Add an optional resets property for the Marvell PWM PXA binding.
>>>>>
>>>>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
>>>>>   1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
>>>>> index 9ee1946dc2e1..9640d4b627c2 100644
>>>>> --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
>>>>> +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
>>>>> @@ -31,6 +31,9 @@ properties:
>>>>>     clocks:
>>>>>       maxItems: 1
>>>>>
>>>>> +  resets:
>>>>> +    maxItems: 1
>>>>
>>>> Do any of the currently supported devices use a reset? If not, then add
>>>> this in tandem with the new compatible and only allow it there please.
>>>
>>> Also, if spacemit,k1-pwm can not work without the reset being
>>> deasserted, mark it as required.
> 
> If I inerpret correctly, only reset requires explicitly being de-asserted,
> need to mark as required? that's being said, if reset comes out as de-asserted
>   by default after power reset, then not necessary?
> (in other cases, some device block is in asserted state by default)

We can often benefit from the state that the boot loader has left
things in, but I think it's better not to assume it if possible.
I suppose it might not be required though.

Anyway, the reset line is available to use; why not require it?

					-Alex

> thanks
>>>
>>
>> Thank you Philipp. spacemit,k1-pwm can not work without the reset.
>> I will add that in the next version.
>>
>> -Guodong
>>
>>> The driver can still use reset_control_get_optional.
>>>
>>> regards
>>> Philipp
> 

