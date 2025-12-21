Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C52C3C0C
	for <spacemit@lists.linux.dev>; Sun, 21 Dec 2025 00:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766275829; cv=none; b=TVVr3AZTyqSUnZjFgSXEUJ3ka9ZF9lPKPGco5LhE/Y2fO/cUNx3gFlWOoKceZKw0MzkLcc0ys/q/1Lx0WTuH0vD+nNQcGDfVurun24F0g8u1GGG1apeNS/kvw1nRs7t40NWiot8nm7SWMkshwmZfJmci+uUh/zwuhpmwiCt5VHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766275829; c=relaxed/simple;
	bh=TzVjlRDTSZ/J5eOfKeVeOT1iSXWkpMVWS1/WX4Qttmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YA4gRJHU4xhouBSRlsSvwq3h7mCpNKEFKNG5FNW1ufi+MCveHRi3jffPuVXoc/kUzSh4FWzq+G1H1U74f1xK6To3Ikbgf602MAk4AmHq8oLvEnj0N1ZkhrnsOreMuinCHN2aXb/00X010ZoAMKnb3D81zTWnaViq0a2RWYNyqDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=IbYPLoRl; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="IbYPLoRl"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E7B354019B
	for <spacemit@lists.linux.dev>; Sun, 21 Dec 2025 00:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1766275819;
	bh=EQ5RLiXnHo1F0yqQLHlxodf/GRaWJlOplqUmCNv4d9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=IbYPLoRlao1vOAWV7vcl5QrTFAHk4wh7xZftuEeW9j+xS3mwR9BQCIsRKLPA0WqW2
	 c0lZkbxB1dwxUbisqtcTbwU1Y6G6UcQvb2NaJ5JYwSLIYQkQexWnjQWOMDzrlthnWl
	 tngNFVGTz0Wrc5rWHB3X5XRjREqJNuEa6p6BuGF+nCpIomPKT26LfCqotQ/Wea8dnt
	 QjmBGkq/+fmbIuWlE7NWcR7ehLjdOAtIiCNpCFlSnAS1KYHskxBKv2Qa2Mjdki70Wg
	 Iy2eJjYx9SgnJaTUa74H0Z7O3uXkkaJ5+HaDOKoQtCnM1alDOeHmCX73E54V7xhxIV
	 LXbxRjqIIp/yjRhkmAy1kUAP1ooxeKdGnT8AeodXtZzE+NXwXhqThVfjKnaQpB0zm6
	 7TgbzQsNapBe5tMU24C1vj0/9QMqXydT3pxDXsAO9QjVR9OE6p6nxiqHFUgdNAyXvn
	 mgewoo1hQbhFgrdwFhxH6Fuke9SnjtdKlUniatGRHR2n3qUJcLPVV42jQp46ybpHT7
	 yQhtqhVVw8Bg3TilJTk2u9QyzhMacdf6X7VnDYwphkH4kV7Dk9NAIPatOJ/hvAuskp
	 fW5nzOfYBqFQcBiDFAQCJP6JQAAPbp3RQ6KZHpboFnuBWcMC+Yr1irALonEmtQCJdx
	 RrIdUwOPFBRA6NchlzBdz2M4=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b79f6f91bcbso363607466b.0
        for <spacemit@lists.linux.dev>; Sat, 20 Dec 2025 16:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766275819; x=1766880619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ5RLiXnHo1F0yqQLHlxodf/GRaWJlOplqUmCNv4d9U=;
        b=qqqt1ozEFlVOlcL6EquCqrmTSiiA25YSILWKLMW/yXTV7bIFehf0doLWxxYvZ2Pk9I
         B/zqaj3am6YCNFs5zz0P6db8yuq00hF4oxmKGZRsA+uB/qtdgjygHFqkH2P21chFN2di
         FYjLsA9fvDd5y+IC0YXMDkWWo4IfDnZtVcyCJL1hRXGzBCnbHfytqOrWspw0bBs04Vmg
         kp+1KVkVBtpltWjrJekXk1haSNcFq3J8fKNByxSh8LHm8GbVSqVODXefZ7aA/RVNiFtK
         obGqEhLep2smIzrwqh8Wn7sxWG52NXrwj8HPUyV+dt7Xa4GRUSVuXvJPfTaZEyt80dN4
         8yGw==
X-Forwarded-Encrypted: i=1; AJvYcCVS3w9R6oNtUAt7Wty/NKzaLSFOGIWyUK2veEOXRpzE+FEqsX+ygt4jNbaiQJ011Fl6EI0t4rAv8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL0qj1kjzftb3sf/cKQGyfQtSplYy4Z/QXS7v6T9cwoYEClt1X
	ZlQyFCr+fhGBUoGC5lya3V06iKoSEgpy3FMKyJJrFb/u7B/QrSvqzHylme1ixND75sXXOLtzTSt
	Jd+Opo1TF5yrTF0eHL4PN7MzmHnCRuNv1YlVYmRhXOCf3aRohOIfX3OsNPc6Da4JHRqU2yZghiW
	oE
X-Gm-Gg: AY/fxX6+pK1SJGXnZaCU2ZNhKFQafKUuk61XLCNXAeOpbsyrPUNGB4pmhFj8coWVKIE
	XUrf9HivUnzx3WtY5FT61a9NyEQPJWhYdGAUwc6EP+yRHfkcVbG41EDXZbq/lU4ccEBi9FC87lz
	o862LQzQ61tKs2GZbz7hlsuZizDfG5z4Fua9A+8HebMQqKkcHFnzdX2vZ62G0h7IEkbVg+8POcK
	T2LSMg4fn4PC0dHX1TR/ioy9o+LTwzhWh2iKqIXqQ5RHEyIX96s/+F4TLaVbOVwSiVmfG9jdhNc
	EuxZVnhNVD49OviH4zeDgKfdAu5GJkLiL+KWQtG2lCdWhWTSJKtRnoTCK0JGT8pRLpvVTiYKFTB
	76AO+RjwbLql9uPnsOSqLyWMnH0VhsJaPSoqSJ4TvQ9z/l6PjzOuEqMhy47CtgITHEK+GKN8DfE
	9f4Q==
X-Received: by 2002:a17:907:1b0f:b0:b72:6ace:e5b6 with SMTP id a640c23a62f3a-b8036eba993mr656862466b.10.1766275819269;
        Sat, 20 Dec 2025 16:10:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjDNV981RWKgeVrEVOLEEbudUqo1wYPVxXW39PfSBF57U8UaF/sswqkvNfymrxCDZi7QfOUw==
X-Received: by 2002:a17:907:1b0f:b0:b72:6ace:e5b6 with SMTP id a640c23a62f3a-b8036eba993mr656860466b.10.1766275818725;
        Sat, 20 Dec 2025 16:10:18 -0800 (PST)
Received: from ?IPV6:2a02:3037:6e1:c5c5:8b4c:2e28:afe4:1483? ([2a02:3037:6e1:c5c5:8b4c:2e28:afe4:1483])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8044f4acdbsm455456466b.22.2025.12.20.16.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Dec 2025 16:10:18 -0800 (PST)
Message-ID: <4e4c9e7b-d95c-4157-94c3-b06002f94a48@canonical.com>
Date: Sun, 21 Dec 2025 01:10:15 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Conor Dooley <conor@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>,
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
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
 <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
 <20251220-repacking-football-c79e660e788a@spud>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251220-repacking-football-c79e660e788a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/21/25 00:23, Conor Dooley wrote:
> On Fri, Dec 19, 2025 at 10:03:24AM +0800, Guodong Xu wrote:
>> Hi, Conor and Heinrich
>>
>> On Thu, Dec 18, 2025 at 8:56 AM Conor Dooley <conor@kernel.org> wrote:
>>>
>>> On Wed, Dec 17, 2025 at 09:07:14AM +0100, Heinrich Schuchardt wrote:
>>>> On 12/17/25 08:11, Guodong Xu wrote:
>>>
>>>>> Specifically, I must adhere to
>>>>> Documentation/devicetree/bindings/riscv/extensions.yaml (and cpus.yaml for
>>>>> properties like 'riscv,sv39' which stands for the extension Sv39). If I
>>>>> add extension strings that are not yet defined in these schemas, such as
>>>>> supm, running 'make dtbs_check W=3' fails with: 'supm' is not one of
>>>>> ['i', 'm', 'a', ...], followed by "Unevaluated properties are not allowed."
>>>>
>>>> If Documentation/devicetree/bindings/riscv/extensions.yaml is incomplete
>>>> with respect to ratified extensions, I guess the right approach is to amend
>>>> it and not to curtail the CPU description.
>>>
>>> Absolutely. If the cpu supports something that is not documented, then
>>> please document it rather than omit from the devicetree.
>>
>> Thanks for the review. May I clarify one thing? Both of you mentioned
>> document them, given the amount of missing extensions, is it acceptable if
>> I submit a prerequisite patch that only documents these strings in
>> riscv/extensions.yaml plus the necessary hwprobe export? Leaving the actual
>> usage of these extensions (named features) to the future patches.
>>
>> To provide some context on why I ask: I've investigated the commits & lkml
>> history of RISC-V extensions since v6.5, and I summarized the current status
>> regarding the RVA23 profile here:
>> [1] status in v6.18 (inc. v6.19-rc1):
>> https://docularxu.github.io/rva23/linux-kernel-coverage.html
>> [2] support evolution since v6.5:
>> https://docularxu.github.io/rva23/rva23-kernel-support-evolution.html
>>
>> Strictly describing the SpacemiT X100/K3 (or any core) as RVA23-compliant
>> requires adding these extensions that are currently missing from
>> the kernel bindings:
>> RVA23U64: Ziccif, Ziccamoa, Zicclsm, Za64rs
>> RVA23S64: Ss1p13, Ssccptr, Sstvecd, Sstvala, Sscounterenw, Ssu64xl,
>>            Sha, Shcounterenw, Shvstvala, Shtvala, Shvstvecd, Shvsatpa, Shgatpa
> 
> 
>> Plus 'Supm', 'Zic64b', 'Ssstateen', 'B' where the kernel supports them but
>> they are not literally documented in yaml.
> 
> I don't think Supm is suitable for devicetree, doesn't it describe
> what the kernel/userspace are capable of rather than hardware?
> Zic64b doesn't sound like hardware description (so not really suitable
> for devicetree either) but block size information is already represented
> by some existing properties (see riscv,cbo*-block-size in riscv/cpus.yaml)
> and duplicating that information is not really a great idea.
> 
> I'll admit that I do not really understand Sxstateen and how they work,
> but my understanding was that knowing about Smstateen is sufficient and
> implied Sstateen, but having Ssstateen defined seems harmless and
> possible. I think kvm is the only user of this at the moment, so
> probably worth CCing Anup and maybe Drew Jones on the patch adding
> Ssstateen to make sure it makes sense.

Supm is described in

RISC-V Pointer Masking
Version 1.0, 10/2024: Ratified
https://raw.githubusercontent.com/riscv/riscv-j-extension/master/zjpm-spec.pdf

The interpretation taken by QEMU has been:

* Supm implies Ssnpm and Smnpm
* RVA23 capable machine models display it in the device-tree

If Supm is not shown in the device-tree, software might assume that the 
system does not support pointer masking in user mode and is not RVA23 
compliant.

Hence I would suggest:

If the X100 cores have Ssnpm and Smnpm, add Supm to the device-tree.

If the kernel does not support user space pointer masking, the kernel 
should filter out Supm and not announce it, neither in /proc/cpuinfo nor 
via hwprobe.

Best regards

Heinrich
