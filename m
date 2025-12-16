Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1483451D5
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895063; cv=none; b=El09uySFew7ASgbWUIc5dMQVsN4SnSQi5WKrEZQOrfAiI00rzdEM8MCJGME37MrAPoEjubLqqnfXCCJZTPIzMw18wS9hkCcA6pjNBlrRuak4daoJP1PYKEwnO8wOBzT4x9KsPnEFg4A8FMc69wZyAWToFaZBSml+7aSm/vl7tPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895063; c=relaxed/simple;
	bh=od17nMEvzsTFH2HeSiuStNC7NPy9wB5VOrBvuHbW75M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrGX33wpUi90KuhOpb0Lr1W5g5aS1puPCxM0tkFBntLXBzwv/0dbPQA2eejLDI9rONEzB6Fr9nJs7Y7Nx2Y/keiQW5fFr2cPJih3PZgy+JGs7S+xYyIPSNXFRai22rqb7R0vwMRoeo2pAU25dsOlTGmyE1fbql2PKMSsoKUKTB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ntzpmEsQ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ntzpmEsQ"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E5F9D3FB7A
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765895050;
	bh=DeBKVqet2G7JfUg3904XUfDizhOtR0zCo3pShlOQvu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=ntzpmEsQdTC3a0LHebLgHC2ZeQ0GowPZMgAB0r+mzJrE7w5xZASetKG2bnw7DI0zf
	 7dmcRB4nuw2cmVFhl8cmcjWgIhbYXY67VzlGq2ceXvh2I21omq7mqxGlsa9LhfZ4/S
	 g9QUv1Aj7lUlJL/zm/ENro9GaDNEC3xtQY0kdFbyXOi9aa3EgEwtCdvO1S1bjy8XqI
	 lo+ZUQ2GVRs16NnmYdKSvpiMb236aVY08k8Bar0ArjhFCFXdll7wClkh+DtW2UbqUH
	 /12F9fsadV4f1mikgcjL70pkAmF2zSRSFs8AhWrP1zzG7T97VYcFFBguHRo7XuZ/dT
	 FCZvd6AriscoQYU2M4ooB93aCByT+S7Sj2y0bTz2sqtPTv03hdIqAlToiLajYtcAM9
	 QT+XvGuL9dDBvUgFJ3QbJBsH4nq0XkZPbUFfCYJBEG7L1fawCf7YghebO1RI/ebjzG
	 ivL3FOdfiHDUccx88oSPaRl+2rcudrAltAPobCgjxA7URa9hMI6CmILQT6xVk7v//B
	 fbS9aCpJPsdgRCQCFmK1E6rfDs3xRyJOWc9OzNAt9yFHploZFavQrgzO7vNltCzI2i
	 AJt2dqJrUWGP8kyYz8VC4IVnHBPD6m644qSF0oZWbaLsTrdNiUjGlqjXQ0/P+O1eSj
	 yb2pBc0/hfvxpuResruk5Cww=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b79fd0cc12eso292951466b.3
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 06:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895049; x=1766499849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeBKVqet2G7JfUg3904XUfDizhOtR0zCo3pShlOQvu8=;
        b=hPob7Nqcvcx3MfjoLCPUUTJInA2OPJvRpyL61eh7f8zpNy/PjYB/m/Liv/LJAI5Qmj
         /1wQM904H+oPUxbHK5s+Hbl/RnEneYcBFqv8TAAs/hRuTVH7qTrIB6ozGGRhItOVxdnF
         4zJsymJUJJilSsn8U/BE1wJGUyEAFsCkNFb14ChEYuk29p5JmLv2boVU/qdE89rcd5Ur
         d1lCznzQ+ol7S7k9TmWCzF1KM4/f+9iiltK07+D2WvGTTdmPW+o1aInnAVjSqnOvnQxC
         hWY4U01JYzC4K+sT9CW6C8aCZzfV/GQX5MDhR4m2n2wZf0Z0R/1CvP0BERgW9+lr/EkD
         TrlA==
X-Forwarded-Encrypted: i=1; AJvYcCVD15n7UXT+rusp/FRi4UzYlHBH+BtPlgBjrCJ9N8OsmASVCYrnlZzrH0I8qKzpN+sE2FEmLlOLQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzF60/C6O7CjiR9QktYHbcga+FOnMwADogiOAtVUoKqc1nnRaZD
	UtDloK4WwlWjW6e4cOIPRuiAnYp/byfL1LlX7fhNnRTEgGSmk17UfvCWYadypjRdLRYUdP4UbuC
	EUhxZzG8fBCe1gN5NEsLnYD4r0Dif8apdowcHioXgvYcmSu7+bpahO9HSksXhJE+DmX2Y36grCk
	wr
X-Gm-Gg: AY/fxX6CHRp4KD1xnlKEIIJMB+VxGgfvV30xFagGaWKijQO8DUYWMu8ITlwOUou11GL
	Q9KQqDa3mcesewC37NtwiAi/LTCgKGmxAXhHg+5Y6ABwG+1Hf2Xys6kCCiXYIBnn9KR+X7sjlsK
	TOKarXQu6dptDgaJ6q+OKKFy8NSTQQDdq55KZavlrWnwQEJ1I+Lr4KfvZSj6WadAbHdHRuOnfqq
	rCYbRbTdbo1b84nOEIoWZV1IlDtJNqrNQY+6pdVlx3rGbgKALp/kLx0XcFbGid3412efgQYQm1v
	jVhTvo5GKoB0CtAq0PDA72jlgVa6fMit8MGcmVsZx0vQYLil9KkULvDkBe3GdxZmk8r8yv/8XFt
	1eaG7Oe+bQ8Aw/Y9IvyTUCsVwbx9MC3VmNAI/8XyPykFB187qMDY+7tJ/Qp+rW876nrBgDeYeFF
	Fj8EIbipc=
X-Received: by 2002:a17:907:cd07:b0:b7a:1b9c:ba5a with SMTP id a640c23a62f3a-b7d238ba8cdmr1366980666b.32.1765895049371;
        Tue, 16 Dec 2025 06:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHi8U3ire58qlr5lfvSspx1MheSPYOV5do1qJVrNR5GUwWevCdrfEa6hTxlrpOZ1LReoGe3w==
X-Received: by 2002:a17:907:cd07:b0:b7a:1b9c:ba5a with SMTP id a640c23a62f3a-b7d238ba8cdmr1366978166b.32.1765895048802;
        Tue, 16 Dec 2025 06:24:08 -0800 (PST)
Received: from [192.168.103.125] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa570167sm1661625066b.57.2025.12.16.06.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:24:08 -0800 (PST)
Message-ID: <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
Date: Tue, 16 Dec 2025 15:24:05 +0100
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
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 14:32, Guodong Xu wrote:
> SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
> Add nodes of uarts, timer and interrupt-controllers.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>   arch/riscv/boot/dts/spacemit/k3.dtsi | 529 +++++++++++++++++++++++++++++++++++
>   1 file changed, 529 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..cb27b790716fdd6dc2bc89c28dd2588a596a5af9
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -0,0 +1,529 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/dts-v1/;
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	model = "SpacemiT K3";
> +	compatible = "spacemit,k3";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +		serial5 = &uart5;
> +		serial6 = &uart6;
> +		serial7 = &uart7;
> +		serial8 = &uart8;
> +		serial9 = &uart9;
> +		serial10 = &uart10;
> +	};
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <24000000>;
> +
> +		cpu_0: cpu@0 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
> +					       "smaia", "smstateen", "ssaia", "sscofpmf",
> +					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
> +					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
> +					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "zicntr", "zicond", "zicsr", "zifencei",
> +					       "zihintntl", "zihintpause", "zihpm", "zimop",
> +					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
> +					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
> +					       "zvknc", "zvkned", "zvkng", "zvknha",
> +					       "zvknhb", "zvks", "zvksc", "zvksed",
> +					       "zvksg", "zvksh", "zvkt";

This not the description of an RVA23S64 cpu. It is not even RVA23U64, 
e.g. `supm` is missing.

Is the description incomplete or is the CPU not compliant?

Best regards

Heinrich

> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache0>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_1: cpu@1 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <1>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
> +					       "smaia", "smstateen", "ssaia", "sscofpmf",
> +					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
> +					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
> +					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "zicntr", "zicond", "zicsr", "zifencei",
> +					       "zihintntl", "zihintpause", "zihpm", "zimop",
> +					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
> +					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
> +					       "zvknc", "zvkned", "zvkng", "zvknha",
> +					       "zvknhb", "zvks", "zvksc", "zvksed",
> +					       "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache0>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu1_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_2: cpu@2 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <2>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
> +					       "smaia", "smstateen", "ssaia", "sscofpmf",
> +					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
> +					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
> +					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "zicntr", "zicond", "zicsr", "zifencei",
> +					       "zihintntl", "zihintpause", "zihpm", "zimop",
> +					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
> +					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
> +					       "zvknc", "zvkned", "zvkng", "zvknha",
> +					       "zvknhb", "zvks", "zvksc", "zvksed",
> +					       "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache0>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu2_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_3: cpu@3 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <3>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
> +					       "smaia", "smstateen", "ssaia", "sscofpmf",
> +					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
> +					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
> +					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "zicntr", "zicond", "zicsr", "zifencei",
> +					       "zihintntl", "zihintpause", "zihpm", "zimop",
> +					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
> +					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
> +					       "zvknc", "zvkned", "zvkng", "zvknha",
> +					       "zvknhb", "zvks", "zvksc", "zvksed",
> +					       "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache0>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu3_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_4: cpu@4 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <4>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
> +					       "smaia", "smstateen", "ssaia", "sscofpmf",
> +					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
> +					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
> +					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "zicntr", "zicond", "zicsr", "zifencei",
> +					       "zihintntl", "zihintpause", "zihpm", "zimop",
> +					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
> +					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
> +					       "zvknc", "zvkned", "zvkng", "zvknha",
> +					       "zvknhb", "zvks", "zvksc", "zvksed",
> +					       "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache1>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu4_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_5: cpu@5 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <5>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
> +					       "smaia", "smstateen", "ssaia", "sscofpmf",
> +					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
> +					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
> +					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "zicntr", "zicond", "zicsr", "zifencei",
> +					       "zihintntl", "zihintpause", "zihpm", "zimop",
> +					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
> +					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
> +					       "zvknc", "zvkned", "zvkng", "zvknha",
> +					       "zvknhb", "zvks", "zvksc", "zvksed",
> +					       "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache1>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu5_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_6: cpu@6 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <6>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
> +					       "smaia", "smstateen", "ssaia", "sscofpmf",
> +					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
> +					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
> +					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "zicntr", "zicond", "zicsr", "zifencei",
> +					       "zihintntl", "zihintpause", "zihpm", "zimop",
> +					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
> +					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
> +					       "zvknc", "zvkned", "zvkng", "zvknha",
> +					       "zvknhb", "zvks", "zvksc", "zvksed",
> +					       "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache1>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu6_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_7: cpu@7 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <7>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
> +					       "smaia", "smstateen", "ssaia", "sscofpmf",
> +					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
> +					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
> +					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "zicntr", "zicond", "zicsr", "zifencei",
> +					       "zihintntl", "zihintpause", "zihpm", "zimop",
> +					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
> +					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
> +					       "zvknc", "zvkned", "zvkng", "zvknha",
> +					       "zvknhb", "zvks", "zvksc", "zvksed",
> +					       "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache1>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu7_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		l2_cache0: cache-controller-0 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-size = <4194304>;
> +			cache-sets = <4096>;
> +			cache-unified;
> +		};
> +
> +		l2_cache1: cache-controller-1 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-size = <4194304>;
> +			cache-sets = <4096>;
> +			cache-unified;
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu_0>;
> +				};
> +				core1 {
> +					cpu = <&cpu_1>;
> +				};
> +				core2 {
> +					cpu = <&cpu_2>;
> +				};
> +				core3 {
> +					cpu = <&cpu_3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu_4>;
> +				};
> +				core1 {
> +					cpu = <&cpu_5>;
> +				};
> +				core2 {
> +					cpu = <&cpu_6>;
> +				};
> +				core3 {
> +					cpu = <&cpu_7>;
> +				};
> +			};
> +		};
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&saplic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		dma-noncoherent;
> +		ranges;
> +
> +		uart0: serial@d4017000 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017000 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@d4017100 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017100 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@d4017200 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017200 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@d4017300 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017300 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@d4017400 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017400 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart6: serial@d4017500 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017500 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart7: serial@d4017600 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017600 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart8: serial@d4017700 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017700 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart9: serial@d4017800 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017800 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart10: serial@d401f000 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd401f000 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <281 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		simsic: interrupt-controller@e0400000 {
> +			compatible = "spacemit,k3-imsics","riscv,imsics";
> +			reg = <0x0 0xe0400000 0x0 0x00200000>;
> +			interrupt-controller;
> +			#interrupt-cells = <0>;
> +			msi-controller;
> +			#msi-cells = <0>;
> +			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 9>, <&cpu3_intc 9>,
> +					      <&cpu4_intc 9>, <&cpu5_intc 9>,
> +					      <&cpu6_intc 9>, <&cpu7_intc 9>;
> +			riscv,num-ids = <511>;
> +			riscv,num-guest-ids = <511>;
> +			riscv,hart-index-bits = <4>;
> +			riscv,guest-index-bits = <6>;
> +		};
> +
> +		saplic: interrupt-controller@e0804000 {
> +			compatible = "spacemit,k3-aplic", "riscv,aplic";
> +			reg = <0x0 0xe0804000 0x0 0x4000>;
> +			msi-parent = <&simsic>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			riscv,num-sources = <512>;
> +		};
> +
> +		clint: timer@e081c000 {
> +			compatible = "spacemit,k3-clint", "sifive,clint0";
> +			reg = <0x0 0xe081c000 0x0 0x0004000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> +		};
> +	};
> +};
> 

