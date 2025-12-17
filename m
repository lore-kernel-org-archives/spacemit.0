Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B1933D6C0
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765958844; cv=none; b=E0vQon2ldWwdlQ25sTLRKoDzwfjwcRdH01F3BbQaWJAu+Tp4TK8l0U/mOFuN9HuFz7x3OQi5hwB0kpp091GthWEpUTDSYHGy3kqt7Fgtq2F+3jhsaijyOMYYyOA4NIiCYHEgYF5T5SEWb+aOxYAJNWGff1oadMoD7FKvdtM3V68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765958844; c=relaxed/simple;
	bh=xvMjaVuP31bHxThVqScT60XlmU9Cz2Clf/weItOYM9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBtOx8iZ7KT57FZEg2wW51R3bUXUrIB+fhGRyq/7i/DGRlFI2LuHgZKvJcXzOoMlFccbjATkManujXIBQv4GKv7miAu8z8m1CX72CVNIcd1I/XkqvIIp8jryDkWQhGogsXnhiyhLGGoRFyfjWfr+Dp61paJ851L/YydI8vqpYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=KYE9ADm1; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="KYE9ADm1"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 83A933FCA1
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765958837;
	bh=xg/D3+GtNZwzqAPEwq0TMwZyqoVeXCC40cLNYkdUJrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=KYE9ADm1/ht4OG503aMtEdWs4UdqV694Zbq0pLcwMKY802ASoNxuQMKNHanmBWLIR
	 QjLwK9yHjVfwcQ0vx1WEbpHSTmfa4hl2adVOITqglrmj2zd/rJXpL9IcLr9kCQqxwD
	 BKsske22MmDZzlrVtyKqlcPRGfpiv2G4RvpGXMCmy/uG94kw69t6/AM05D2ovO0cBJ
	 Kp5fl/djW7K6kQp+ZU0PhzBL67ph4Hr4VysKIQ2oC8EGKTGb2IMpFVfFPxuRAkDpVj
	 /nOq8lBDtoegTQ7b6Qv33UPbROD0r9T/g/Iu8EgiULiNi9rbAdaoAtW7uhLlZv+1Au
	 l7eOYa5KQaJSVCz3wKalVI7v768ZoNt9e6awbXw1RL4cbwYXEaWP9hCk43JodP0N8c
	 AN2bSP88rMG8XfFwb0loGqHV4pW3ni/LPM6vx3YhrEPtXEUH1eoYqYwOd7EIyoBBp+
	 TwP+YaxjHobOdJ+fRZvDplO3A/wJyBAdHXJPjbhLbc5CBDg4bGR7bFkkDpTZHfoS4B
	 6Wf24/1GkW7W4Ht3tDNCPiTNsG5ol+nH5+5ZksU1t76ImZJXILpo8gUdkKKql8O3Du
	 nxZzDTeqL7Z5e0qB4/vTfYcM/WNaHsaY1D9kp+HVv3xLa70hiNYsqEvnPL7x1AJqlq
	 EzFkQrwWNcTwxOttd8C1HL9g=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4779d8fd4ecso2108485e9.1
        for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 00:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765958837; x=1766563637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg/D3+GtNZwzqAPEwq0TMwZyqoVeXCC40cLNYkdUJrk=;
        b=ux7UOkC0fsTGRzS5Egsoppmh88SzkiUKAVKiXwwIUdtXGWLKtMa7yCNllvLP2xT4RZ
         cnLe1m2Qw3ntskKjHMN6Kqq+e/XYDanKs65sJT1PFyLhDRz/LZkE0wsV4hnPFvxyI6ae
         YmPM3CTVk93Eipt9FEwBh7/rB9yLvZF7SbDSiD49Vn0KNUpo2wcsjABdFw1bYHUC5i2M
         LYT/xpi6ojmPldWqNzavRlUlkCQau4oiNB0l8gTQO7iBVGEeBIu6HIWtsvTHg3t5a0sU
         P+m9Ex96YqTJOeORlGpbbxCoKxHwyUEJsM5LbLwry7QcEwvVanZZB+wDd1QSO1YA/OK2
         Tnlw==
X-Forwarded-Encrypted: i=1; AJvYcCVv7qteBTI/04PKV+Od4Pqvmu/udFr9gYyiYZ9OKRouINZOrd/Cibl5i+zPWEwWhK/hYfWZwXG+oA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKx8bsk7mMAidkvv1egVvWPh4xjkroEiMeavyi2ywefvk8Ve4Q
	4stJUPUXmRGRaZ0wOthtVCsjOlZHljm8HiUhzBZhtx+LQqQ1pd18mmUwX16h7ACFwu2mDxNNkEl
	6DC2YDUQzvkjVlCpY5qmlHlzF5aSB+aPhh0RM4SLLPZxLcil2oHCdavRhq0IGGZOtDonDNIphpY
	k8
X-Gm-Gg: AY/fxX7vBP0ECQKtyIvMPkjDA86XzkXOCUe1dBE7NWd13cTMp4EHwSm6S9eFaJ/awsI
	P2KlkjMYl89tSo5EDQz+LDWM3FdQrQsi9FRE7dXLjpd2z9mcjttYz7eMJR6PGLjPmCT6G6dSEGm
	0dXOZ3E1SHpf/DkG+tgSLSvacfuoRElzHclt2Uag4V6ESe+5fMRREvSPwhhuXc5M50RmUb+KciC
	DNjqBqt6G+6tMEOljaY/E0YC5jJ4TUh8W2b3Kdtinel7Aw4l4OzAm2RF6j2Tn1/rX0LX/VnsiwQ
	87ydIO27S+F46xAxgtP9MSXFkIiTGkvT2YJhRzf1smzg7MVWCH+cntaaQvlfvroaOyfkOBypsQD
	tjhdKXmWTgySdE//yXoeSCZeAG0j/6u5DS9FMdBZVaxIUegyVP/pkZAOUecPDKLxfRyFgHfW9nf
	cDdpm3n48=
X-Received: by 2002:a05:600c:1c89:b0:479:3a8e:e490 with SMTP id 5b1f17b1804b1-47a8f2cb09dmr191147505e9.18.1765958837031;
        Wed, 17 Dec 2025 00:07:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7lkgkkTPibPOHbDFxaP2ZN+RqjAz8H8zIVMsrRtI5v9GDMT5pL8zNOJZxvsyHlbuiIA43Hg==
X-Received: by 2002:a05:600c:1c89:b0:479:3a8e:e490 with SMTP id 5b1f17b1804b1-47a8f2cb09dmr191147195e9.18.1765958836564;
        Wed, 17 Dec 2025 00:07:16 -0800 (PST)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc2221c4sm25403885e9.11.2025.12.17.00.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 00:07:16 -0800 (PST)
Message-ID: <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
Date: Wed, 17 Dec 2025 09:07:14 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
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
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
 <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/17/25 08:11, Guodong Xu wrote:
> On Tue, Dec 16, 2025 at 10:24 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> On 12/16/25 14:32, Guodong Xu wrote:
>>> SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
>>> Add nodes of uarts, timer and interrupt-controllers.
>>>
>>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>>> ---
>>>    arch/riscv/boot/dts/spacemit/k3.dtsi | 529 +++++++++++++++++++++++++++++++++++
>>>    1 file changed, 529 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..cb27b790716fdd6dc2bc89c28dd2588a596a5af9
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> @@ -0,0 +1,529 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
>>> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +/dts-v1/;
>>> +
>>> +/ {
>>> +     #address-cells = <2>;
>>> +     #size-cells = <2>;
>>> +     model = "SpacemiT K3";
>>> +     compatible = "spacemit,k3";
>>> +
>>> +     aliases {
>>> +             serial0 = &uart0;
>>> +             serial2 = &uart2;
>>> +             serial3 = &uart3;
>>> +             serial4 = &uart4;
>>> +             serial5 = &uart5;
>>> +             serial6 = &uart6;
>>> +             serial7 = &uart7;
>>> +             serial8 = &uart8;
>>> +             serial9 = &uart9;
>>> +             serial10 = &uart10;
>>> +     };
>>> +
>>> +     cpus: cpus {
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +             timebase-frequency = <24000000>;
>>> +
>>> +             cpu_0: cpu@0 {
>>> +                     compatible = "spacemit,x100", "riscv";
>>> +                     device_type = "cpu";
>>> +                     reg = <0>;
>>> +                     riscv,isa-base = "rv64i";
>>> +                     riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
>>> +                                            "smaia", "smstateen", "ssaia", "sscofpmf",
>>> +                                            "ssnpm", "sstc", "svade", "svinval", "svnapot",
>>> +                                            "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
>>> +                                            "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
>>> +                                            "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
>>> +                                            "zicntr", "zicond", "zicsr", "zifencei",
>>> +                                            "zihintntl", "zihintpause", "zihpm", "zimop",
>>> +                                            "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
>>> +                                            "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
>>> +                                            "zvknc", "zvkned", "zvkng", "zvknha",
>>> +                                            "zvknhb", "zvks", "zvksc", "zvksed",
>>> +                                            "zvksg", "zvksh", "zvkt";
>>
>> This not the description of an RVA23S64 cpu. It is not even RVA23U64,
>> e.g. `supm` is missing.
>>
>> Is the description incomplete or is the CPU not compliant?
> 
> Hi Heinrich,
> 
> The SpacemiT K3 supports the mandatory extensions defined in the RVA23
> Profile (ratified Oct 2024). The list appears incomplete here only because
> I am restricting the entries to those currently supported by the Linux
> kernel Device Tree bindings.
> 
> Specifically, I must adhere to
> Documentation/devicetree/bindings/riscv/extensions.yaml (and cpus.yaml for
> properties like 'riscv,sv39' which stands for the extension Sv39). If I
> add extension strings that are not yet defined in these schemas, such as
> supm, running 'make dtbs_check W=3' fails with: 'supm' is not one of
> ['i', 'm', 'a', ...], followed by "Unevaluated properties are not allowed."

If Documentation/devicetree/bindings/riscv/extensions.yaml is incomplete 
with respect to ratified extensions, I guess the right approach is to 
amend it and not to curtail the CPU description.

Best regards

Heinrich

> 
> Another angle, I found there are other reasons why Linux kernel chose to
> 'omit' some specific extension strings. For example, here are what I noticed
> so far, including the 'supm' you mentioned:
> 
> supm: There is no binding string for this yet. However, in the kernel config
> (refer to arch/riscv/Kconfig), RISCV_ISA_SUPM depends on the detection of the
> underlying 'smnpm' or 'ssnpm' hardware extensions. Since 'ssnpm' is
> present in my list, it can be considered as supported and the kernel
> will enable pointer masking support automatically.
> 
> Other examples:
> ssstateen: The kernel schema currently uses the smstateen string to
> cover CSR access control in all modes (H/S/VS/U/VU). I have included
> 'smstateen' to satisfy this, as there is no separate 'ssstateen' binding
> in the extensions.yaml.
> 
> ziccif: This extension is also absent from the bindings, despite being
> implied by ftrace dynamic code work. Reference:
> https://lore.kernel.org/all/20250407180838.42877-12-andybnac@gmail.com/
> I intend to submit a separate patch series to formally add ziccif to
> extensions.yaml.
> 
> Anyway, I have limited the x100 riscv,isa-extensions list to strictly
> validate against the current kernel schema while exposing all features
> the kernel is currently capable of parsing.
> 
> I hope this explanation clarifies the situation. Please let me know if you
> agree with this approach.
> 
> Best Regards,
> Guodong Xu
> 
>>
>> Best regards
>>
>> Heinrich
>>

