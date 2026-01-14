Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32F31063B
	for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 23:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768435029; cv=none; b=Z/sFCiU2nZ/uIOOdIrenv8wf/W7E4MVfMp7gh2YAYhsuxCHaRRodaMP7Hl6qb+GsZcDB745oCZ5l01Jw2J/oCVVHrL2DSHpFl2KyFrh/KGerWjHDvFR9B4HCC4tPuSrv4GHcIPvcCDdwqmcgVGefYyfsz9yybY6Q42aLa0JAtVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768435029; c=relaxed/simple;
	bh=HDziqQp0ZHq73qfDA8T8c1LSXjVu6KKuZcSbqhyXZsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7z+YqTah0pB24rt6IwdL6p4zT/8h8eMuxk09C5RL3Blaxybns0iNvRibgu1FrAIdFad/PLFsjs/fXZoniZPzSK4ccQqFnRSMaUy3em3fXNZSSyaFekJHNN62xeTAH65Jv5L5pnQ5SM+oHISA7WAGHvBtil2GxBFNKttqVEtqww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=JU659kyN; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JU659kyN"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3f551ad50d1so131430fac.0
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 15:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1768435026; x=1769039826; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrZ0xz6rtJrpX2gJTATZXWCSjCkVy/ptUp7g0PyWV/k=;
        b=JU659kyN4PcLjZyQZr0F0xrWaO3yZ/XG1sLnqeV3VbqBp4TjuEeFtVYOo8952y1rBu
         f2R1V1ZlD6LBQXUNK8hqvQbsr3yS2Y5/Q05Ty/pJ0FBe3cj5eTn8Tg7s66FkkSTeOrxI
         fw+jq6FPaoKRBTtsS3MLxCV/qcVWXPwZba2l8ZyjLVxjA4mAlyTVh94fe1o2K6IaLUkq
         WIoPNLwRNVRYZDmZwZfXEgjWNGUcYTxy/Z1qhYVtpNrlZHsM3xpKMoKYNuH8iMX5GnPj
         vcAIvp1D45MheHrcoH+suDyJP56dwQpeKiyILWVGigEpSfiSQx8R5scxstIbeOd+vvNr
         joxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768435026; x=1769039826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrZ0xz6rtJrpX2gJTATZXWCSjCkVy/ptUp7g0PyWV/k=;
        b=NObP4NhYo0ZzdNL2zTYm3USuDGW8p1of8QhIXL7NJCzqEf+gic6pYqbm9BpjvvtHd2
         GqBZfPX40FHkHY5bl8Vd19UmLYYjkx5oE4zxdHZZqq4Dsamw8s1sZOlIle7nmLgh5eWC
         5jSBHDDAubNwRK4FABj296TNLhi88l1JZ+nzIB6u1TUCa2vXmWDqiOh6S3MFCwFPselc
         ZvwpLBpHJ0B4Vpa07YRVrk19UGhgaQDWCCXslz9ajCBsO2Ap9V0+oaEH+rWEgTFyqs8C
         qRj33zPyu/StSsEikCF5gq9p8pyAiKApFviuXVXG8KKQwo9fgQvuIn1X4yFNwBVfP7Dm
         j6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCW0qH5Wl+MUB3Kd27E/LgVWgSZyX9xzhXDejeHgM3qneJZBEgr8/2Pcs5L6WbGgkkxYsTeJ+n8ELg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsbOiJFiXfEcObfDcANqOcHLo0hz9kGng7suKHf6VT9BYZmmcm
	fJ6tmt+OBBTZk1ORfHx2oO1ylrCCsm3211SkMLarTrT8kakpcwD1khHTcmmYkzRdDEw=
X-Gm-Gg: AY/fxX7ho8CRr3ODLuEBvpuLUje8dleo3AdRHRKM9xrImn+Ei9Hcj0X4DwJMy+lXvFg
	dfDg9F4IJVw28cXCoTYakrqqvHPBS/JH5CppHUA8LYcPxf9sDpp7N++GollTT15IKvZFSLhORbU
	WtcSFHSic17m3f00KEfkyOVSoDGfe0FM4PmZAiQkXoi1frCy5iG+4Fdrw/ml1QXXEKniwrJmBoj
	OPhyHNcVNZ0u+qe829poxJyzcv9wGPa3m7wvGX6PhPbkFJWQhQEqZwfFsZ/3iaPeDGxWxk3fsEt
	ZTo7uYj0wATayTaU+0xeF3mCzZmq+9YKZ+jbi8aJbUVWVVFe7CeV4elVFDbOOEnM90UvZBtshtf
	idN6tQX8d01+mmu72dyWWawULQuXKOnCNbquGXyDYOF6bu4jAY/LA8a6tOPBfAfejoCgHkBMg7F
	/ohkbzZARDDoCYhfIjuSJdeMiSKAht
X-Received: by 2002:a05:6871:3393:b0:404:2fe7:e184 with SMTP id 586e51a60fabf-4042fe7e4b3mr317528fac.43.1768435026295;
        Wed, 14 Jan 2026 15:57:06 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm17826541fac.21.2026.01.14.15.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 15:57:05 -0800 (PST)
Message-ID: <fd95c2f2-9292-483c-9613-4adf3c65c500@sifive.com>
Date: Wed, 14 Jan 2026 17:57:04 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
 <20260108-k3-basic-dt-v3-10-ed99eb4c3ad3@riscstar.com>
 <77f9a001-7f0a-4c29-abcb-501e875da117@sifive.com>
 <CAH1PCMZ5rKbG8xEbB9jt6TqyB28T5aLgRtf3iJ8Gt6Fk+3XFhQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAH1PCMZ5rKbG8xEbB9jt6TqyB28T5aLgRtf3iJ8Gt6Fk+3XFhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Guodong,

On 2026-01-09 3:58 AM, Guodong Xu wrote:
> Hi, Samuel
> 
> On Fri, Jan 9, 2026 at 2:19 AM Samuel Holland <samuel.holland@sifive.com> wrote:
>>
>> On 2026-01-08 6:26 AM, Guodong Xu wrote:
>>> SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
>>> Add nodes of uarts, timer and interrupt-controllers.
>>>
>>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>>> ---
>>> v3: Remove "supm" from the riscv,isa-extensions list.
>>> v2: Remove aliases from k3.dtsi, they should be in board DTS.
>>>     Updated riscv,isa-extensions with new extensions from the extensions.yaml
>>> ---
>>>  arch/riscv/boot/dts/spacemit/k3.dtsi | 548 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 548 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..be9335fba32cb9e81915b2b91cf08c55a5e96809
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> [...]
>>> +                     reg = <0x0 0xe0400000 0x0 0x00200000>;
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <0>;
>>> +                     msi-controller;
>>> +                     #msi-cells = <0>;
>>> +                     interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
>>> +                                           <&cpu2_intc 9>, <&cpu3_intc 9>,
>>> +                                           <&cpu4_intc 9>, <&cpu5_intc 9>,
>>> +                                           <&cpu6_intc 9>, <&cpu7_intc 9>;
>>> +                     riscv,num-ids = <511>;
>>> +                     riscv,num-guest-ids = <511>;
>>> +                     riscv,hart-index-bits = <4>;
>>> +                     riscv,guest-index-bits = <6>;
>>> +             };
>>> +
>>> +             saplic: interrupt-controller@e0804000 {
>>> +                     compatible = "spacemit,k3-aplic", "riscv,aplic";
>>> +                     reg = <0x0 0xe0804000 0x0 0x4000>;
>>> +                     msi-parent = <&simsic>;
>>> +                     #interrupt-cells = <2>;
>>> +                     interrupt-controller;
>>> +                     riscv,num-sources = <512>;
>>> +             };
>>
>> Does the chip also have M-mode IMSIC and APLIC instances? Those need to be
>> represented in the devicetree as well, for M-mode firmware to access them, just
>> like the CLINT below.
> 
> Yes, the K3 chip does have M-mode IMSIC and APLIC instances. Currently, the
> boot firmware (U-Boot) transfers information about these nodes to OpenSBI.
> However, you are correct that they should be properly described in the DT.
> 
> In the next version, I will add the M-mode APLIC (maplic) and IMSIC (mimsic)
> nodes to k3.dtsi, for topology representation and potential firmware usage.
> I will set their status to "disabled" because exposing them as "okay" to Linux
> causes access faults during driver probing.
> 
> Please let me know if this approach (adding them but keeping them disabled)
> looks okay to you.

I think this is a reasonable compromise.

Personally, I think of the DTS files in the Linux repository as the "static"
devicetree, which should describe a "complete" view of the hardware--that is, as
seen from the highest privilege level. Then it is the responsibility of that
highly-privileged software to modify the FDT as needed to provide a limited view
of the hardware to lower-privileged software. And this modification is exactly
what OpenSBI does before it passes the FDT to U-Boot. So the "static" devicetree
would not disable these M-mode-only devices.

However, I recognize that people want to use the DTB files generated by the
Linux build process with Linux directly, ignoring the firmware-provided FDT. In
that cases the M-mode-only devices need to be disabled. And then you need a
-u-boot.dtsi file to set `status = "okay"` for the firmware build. I think
that's a reasonable compromise to make the "static" devicetree as complete as
possible while still being usable directly in S-mode in some cases. (It still
breaks if some peripheral is assigned to a different supervisor domain, or some
DRAM is reserved by M-mode, etc., which is why I really recommend using the
firmware FDT and not a file.)

Regards,
Samuel

