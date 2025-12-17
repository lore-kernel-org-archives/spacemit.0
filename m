Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3E340DA6
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765962386; cv=none; b=JKj+BD/qjE/C09bCfvGvBI2OdRR+jginHluypgiJc5GzU0gw4GhhmVSmH7rAXfwfR+V8ruPCJz3BwBQRtFn7V+I7xtOOhQh5/HbUpZHnKYWVQsBEHO5wtIUfOGOz8LW6zvJZrs5FVb3rMzQE+7KsVC8NyNpv/ydlJr7vxSODDwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765962386; c=relaxed/simple;
	bh=Z0lMYo5+NJ79AHAUbnTNntH5jebkTrZggk5FVdEzBq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUax3TJQGRlzS/bPlzQ1bB/kvAsCYx1mT5DlMLjoQ68XJLIkQp8Nm3zNCtJdg87Spk7mxtiLRE/HTB7/E/fegWVfwxiJQtn6YSVcy1+EaJMhWoajT9wMVGIsImEnaD9noxIXyCiMWbh+wSxxgFBQCtHBbulq74p+5WBD5gvNl7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DirvtGNU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DirvtGNU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so5134955a91.3
        for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 01:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765962383; x=1766567183; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1VRWjeuH/kViMmS59iXj3V5sEFdHUh9qPFuC/Iijp4=;
        b=DirvtGNUiCi7IeF+0CRSpdrLSsPmhN1pN748rrdO81cxAftShXAG257h8Gy8WqGc+3
         oH6evczSxAI+s43iK3UvwJwTnoZ5JgYLNQkSHEWeGqjQeU+8k0R/Qq4vrLjA86A5erOC
         EZIQjZoYk0T2HLgyxvl/OA5UQTs0jzTbeN9IpXv0XWvpEnaIcB0c3H2V+tGRXbz7icBb
         KII6S5O0iM6ugGrH2kqD6KdKWwRsRUG6G0s8R5okoGHKtyHv1DrKUnVzarLBzEhHDM1E
         EMZ0JqcI97aoQ1sRbnV0Y5C0/p4KIcyWc/R/DWiBFxK87fxg7OyNpdBwMTilmVZnkO5w
         s1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765962383; x=1766567183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1VRWjeuH/kViMmS59iXj3V5sEFdHUh9qPFuC/Iijp4=;
        b=nGTYyfwWgUbJ/vf5bIfXxp4UidEEv7xaK483v4BzOKsFk0IPAuqFu7AZufvz+Que1i
         EvNFo1lvS1WQBzYib5Wb1U4KxqbI9/0l1N2nKlYKfLS0ZnWDRRfIpuPgmIeO6/x6cudL
         7Olhi/HyJa9X4Q4IL4l7q+AiTKDsPgwxaKTr1CdLD3/J5IdhUrDv8zYe9hxfAlLLsp3z
         jSvl2JWgSyZVMxZ3Id+2CkCzqElGPufR6qFN9LHFMG3Ac/uHizmTStfBErcW7WdmqH83
         6yvYRhH2QgxbYUPwvjP1l767n+yCRBojmTS0ask5mFKEgpc6xB6h0zVE7rqCbSY9jNXJ
         6XsA==
X-Forwarded-Encrypted: i=1; AJvYcCXDL22J/WE7vNQ3vXb6lrTgwVlz1A3hapJXMc0iEE2/oXD3WYCt5DGm1+rMFbZUSZFylhVa7oWkSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxL5/KXD+F80dYBaEPOP28B6Eg5kgXfaD2/h6FpRj9U9aNsGSrG
	zKDVGp4yZUxLMdD1GJ7d17OjURb0nFvwjhx86qfobrVVTaYxXZtYj6D6
X-Gm-Gg: AY/fxX4RiOlLjF2xMQSLpPENsrSq2M8bt9UxndRpNK9Pfk1q+mp/V4EfdKTpSuzQpQx
	tg2W+NbXDzfqG5o3Hk4sJYZWHqb8t06A23BKIseF2Ku2eGWf1pTHUCNi8D6QBRMvImYt3qgfB2X
	JMJ36IfCm2LKajhePtI46GqaO6kbJCsaCxI8J9Agko2OhiFy/w2RyT1HTY+29nuMxPYTFPWT61I
	K4LDmtIyAZf65epJrlmVUU4DkcZkBd6DVgQABm2Mq7RRGXyiK0HecBdYu2RFUPOPiYEyZ3u5sHr
	D/qwtfdicMvyWC5L/JCtoEQwXXPagln/yuG1TtAXOsWly5XdqTkA9G/aoOl6lLVyK8FdbcSQgy5
	aLid2Q8qfueNTzOb7sr40XwK92+wHSSTLuwdoL1+Qk78kxIdIRhh2CSNXJ8c8wQtLuMfvVuBg6h
	MxC7sDZzBCh0lZ
X-Google-Smtp-Source: AGHT+IE6PfmxAkj5HlkxzkJmnrwLpLmQDasxQXTlueI2ut1ZFaSRcM/T3o7RF88n/l5r5DOiJzvQyA==
X-Received: by 2002:a17:90b:3f85:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34abd751aa3mr16360133a91.20.1765962382751;
        Wed, 17 Dec 2025 01:06:22 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc0be691sm2048570b3a.58.2025.12.17.01.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 01:06:22 -0800 (PST)
Message-ID: <e5d92ecd-6bc1-438d-87ec-96f60d1b8a24@gmail.com>
Date: Wed, 17 Dec 2025 01:04:27 -0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
To: Guodong Xu <guodong@riscstar.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com>
 <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
 <CAH1PCMbzv_uggyZ3JLPyWXSwbe2dJAh7jVT64xpM6SLG77VZqQ@mail.gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <CAH1PCMbzv_uggyZ3JLPyWXSwbe2dJAh7jVT64xpM6SLG77VZqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Guodong,

On 12/16/25 23:13, Guodong Xu wrote:
> On Tue, Dec 16, 2025 at 10:33 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> On 12/16/25 14:32, Guodong Xu wrote:
>>> K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
>>> K3 SoC.
>>>
>>> This minimal device tree enables booting into a serial console with UART
>>> output.
>>>
>>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>>> ---
>>>    arch/riscv/boot/dts/spacemit/Makefile        |  1 +
>>>    arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 25 +++++++++++++++++++++++++
>>>    2 files changed, 26 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
>>> index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e31917eadf7562f488d825 100644
>>> --- a/arch/riscv/boot/dts/spacemit/Makefile
>>> +++ b/arch/riscv/boot/dts/spacemit/Makefile
>>> @@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>>>    dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>>>    dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
>>>    dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
>>> +dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
>>> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..0f9d04dd352f5331e82599285113b86af5b09ebe
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>>> @@ -0,0 +1,25 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
>>> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
>>> + */
>>> +
>>> +#include "k3.dtsi"
>>> +
>>> +/ {
>>> +     model = "SpacemiT K3 Pico-ITX";
>>> +     compatible = "spacemit,k3-pico-itx", "spacemit,k3";
>>> +
>>> +     chosen {
>>> +             stdout-path = "serial0";
>>> +     };
>>> +
>>> +     memory@100200000 {
>>> +             device_type = "memory";
>>> +             reg = <0x1 0x00200000 0x3 0xffe00000>;
>>
>> Shouldn't the reserved memory be described as no-map /reserved-memory
>> nodes instead?
> 
> Hi Heinrich,
> 
> Yes, you are right. Using a reserved-memory node with the no-map property is
> the correct approach. I will update this in the next version to explicitly
> reserve the first 2MB.
> 
>>
>> I would assume that 0x1,0000,0000 is the location of OpenSBI.
>> What is at 0x3,ffe0,0000?
> 
> Yes, confirmed, 0x100000000 is the start of OpenSBI. The size 0x3ffe00000 in
> my original patch was the result of manually subtracting the 2MB OpenSBI
> offset from the total 16GB memory.
> 
> I will correct this in v2 to show the actual memory and put the first 2MB in
> reserved-memory {} for opensbi.

I don't think this is the right approach. The Linux kernel shouldn't care
about the size of the underlying SBI implementation. The size of OpenSBI
also depends on the version and features enabled. Thus, you should just
let the OpenSBI or whatever SBI fix up the device-tree for you. OpenSBI
already does that today. It inserts one or more reserved-memory node and
carves out the memory region of its own. If there's some bootloader in
between SBI <-> Linux, such as U-boot, then it's responsible for copying
over those reserved regions from OpenSBI into the device-tree Linux uses
(U-boot already does). Thus, there's no need to manually specify it.

Bo

> 
> Thanks for the review.
> 
> BR,
> Guodong Xu
> 
> 
>>
>> Best regards
>>
>> Heinrich
>>
>>> +     };
>>> +};
>>> +
>>> +&uart0 {
>>> +     status = "okay";
>>> +};
>>>
>>
>
