Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B732C936
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895618; cv=none; b=kE5hc4JhVMCZiuWbJUuA69HxpsCE6jlXQs6aWnX74q4rZLAEspvTZxaTpPHOg43FkeedhNYA7jEiwax0n5c13AALLCm06nfcsN2GBYb/PFq3uX+n5SUrwHP9mUM8vFA2eIcBN6detDo/wKwEU/Kpqc+fsG791motNQbYqIBfdeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895618; c=relaxed/simple;
	bh=QvQ962qcK05T0lZnvQI2FDYuFJBixe8oMpEBfbroE10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNQLGgEVvjz5W/YyHeUgHfLVZjLi+6wd6VyyT/mxh2INKQpEZ1G2RjWQyciqYMX0rww8e1aGR0QjfljmkujE0/mntRApGHHuc9rW2odLKUNhiwBt+1VZIlAl0mqiU6Bu/jaQYRC2BJV4Npooyo1I/L33E6JKFS0ECoTVpgATl+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=RAc83iWJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="RAc83iWJ"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1DDCE3F873
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 14:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765895615;
	bh=9ouNQ2G+BbmqznnUeDUFFC3dk1Z2drfKLGm7ohEM5u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=RAc83iWJi4VwwDpXdJRskmPAAHkXhpzNbWvkOr6kaGDlUPAvWX6FjEOWKMWfq2vfu
	 lWVfAKzsbRd53U8h9IgVFvHqmXPrbnkfCkPMQ+Lr8Ew5oI6dcsWYRmtWgobNz/uI0k
	 mvCFuqu7oPtfH5PbDqmfmRyvFzIENXDh8J05FF/WGOHdF35nSKoDk9H5l76DhYF1hM
	 XgPoeSAMclDKgbIabld3Klx2j3ZSKyGBns9TBDFFfaPin5E47WU9Voh0aEeI8/Mm9r
	 l2qhPpauOfgAplC4QpoIbjWHaSVRPkygGftiMTKxIO9WOh2dZseOrAnM85nlKmgLZZ
	 QK8R5ySNS4LmgBB5NJjfB6z/XvamzCxaDmFxr3CNGXx0CyzUJvUKbvwhUeKemvaU6/
	 BJW2t/7AGmTk4ke6MQV7ezGQKTi6hv+iU0WirscBlhZdZnMQmKGUEcahlYnus66oPr
	 CEzyJD6jI14oiQskQqtFlK4v4M2r2OtRUx09m7x+5SH2nhKNgwfQdGrN2QFFgKvtLq
	 ATkeoIRrocuzm1z/UCg7aSFM2xSTZEdvNpuJ1JiiGfUNuL38QXvpzmIw+9gBNZ9PrA
	 Yf3chhToAXU5vtZvRFE8Wwd8Gj0mKhX2ISCosPH7E8Y8k4KtDtRq7UK+WFiRRabkUR
	 j/AKwH9P9286+t9LwOHshvYE=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b79e98a23c5so511409866b.3
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 06:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895613; x=1766500413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ouNQ2G+BbmqznnUeDUFFC3dk1Z2drfKLGm7ohEM5u0=;
        b=e9ulgU0NRIbJNGs4IIBa0pnWO+7QDC8Z1HOOorEu4/iga7zHTfrg0CUahGk5km48b/
         BwPoRR1sWukKgqoysYd3G2qtjZYFYJaaBlgWKaHk515sFC09lMEpBb1UhkaDAWmnXyxU
         apdlCt8eHBCkB3z/jZ0+XI0FD/8cvrxmjfKBmMWBAWGguT6gFWBN3SlagbrZsuxtaT8d
         IGUxh9u+1YczxDYSAKgJ0e6xmX2vMJc5xeOKlJQ7p0IXpKgB0PvJxGU6VYcvnQdCWtI5
         lZYEm6L96gMNMePf7YngfZypUJGuRZoCa108/bA5TzeYaEuPiyON1XMVrLYK5vjQ8Gzt
         J4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjgJSZlUH5C3fAqXnWwlpBZC2s5iMWrkwy8+U/QlMFLPsL4RurXsaehQ9DbD1dQgffB1bBKpYB4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTBBmGP4YtkZIurW216ztzrVH5uEngAztR3mhdpQyZRSUJ0I6t
	jMvpKjZfFd8XmW0cauexgY1a4MlyEVfFqLTF7JcgrlZasUO4AURLkmpOYTQpc1OX3H2WFlySNKd
	Fce8yQP3Cvbd1Eu+DRKRhjMKHG+LxPHTg6ioDGG5XepS2CAyi/flmde369zxIUkY+I2zVgC/PcM
	vO
X-Gm-Gg: AY/fxX6PcABXJQD6mQZ5+bxQ39O6Hyt2mZa2UKnK6y1gksknctW4zYyBHoayjlVYon8
	IXTXsHH5SOqdXXMn6L+wo+JdQMouYtHeRmKxgPL+iAxf7LJnQWWwntmGWLa2yivzqD53NUrQbz7
	vgTTCjNtlUrn07J7L7co1WsWvDhKaV5rSqMuD0XiX+xPR29fiVIHMtpTfhL57GiiUQLPcz0B/wa
	XPisuPAMCBa5BOURbHWtBjLLS6ufENKIB/HTf9s4voS0HO+ll/LhxYNh0AYFjJ9MCgv0tRjLkKD
	603ajoP2dPN2tcyShS6xbUByRTP5BZrIxvzJlqtJRmdyE9JcABWGPBcNEPmdoO3B9nJNPEYLPDE
	+NfhgK4cAIRTfVU77CCmL2zZWH/GuDwtA2X5c5QT31xlwH8QDmoOsPUXE/e2paPi2mkNc+y205X
	wZ7uepF0Y=
X-Received: by 2002:a17:907:96a6:b0:b7c:fe7c:e380 with SMTP id a640c23a62f3a-b7d236f7860mr1528080566b.13.1765895613030;
        Tue, 16 Dec 2025 06:33:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHFzNsGwKARkXS4ZtDItuBhnrQn1fUzZeAB6AToGes9YgJGJs29bqvEiQXmenKj6k0dHe4vw==
X-Received: by 2002:a17:907:96a6:b0:b7c:fe7c:e380 with SMTP id a640c23a62f3a-b7d236f7860mr1528076966b.13.1765895612514;
        Tue, 16 Dec 2025 06:33:32 -0800 (PST)
Received: from [192.168.103.125] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ff725efd8sm171981166b.27.2025.12.16.06.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:33:32 -0800 (PST)
Message-ID: <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
Date: Tue, 16 Dec 2025 15:33:30 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
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
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 14:32, Guodong Xu wrote:
> K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
> K3 SoC.
> 
> This minimal device tree enables booting into a serial console with UART
> output.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>   arch/riscv/boot/dts/spacemit/Makefile        |  1 +
>   arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 25 +++++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e31917eadf7562f488d825 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>   dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>   dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
>   dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..0f9d04dd352f5331e82599285113b86af5b09ebe
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> + */
> +
> +#include "k3.dtsi"
> +
> +/ {
> +	model = "SpacemiT K3 Pico-ITX";
> +	compatible = "spacemit,k3-pico-itx", "spacemit,k3";
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	memory@100200000 {
> +		device_type = "memory";
> +		reg = <0x1 0x00200000 0x3 0xffe00000>;

Shouldn't the reserved memory be described as no-map /reserved-memory 
nodes instead?

I would assume that 0x1,0000,0000 is the location of OpenSBI.
What is at 0x3,ffe0,0000?

Best regards

Heinrich

> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> 

