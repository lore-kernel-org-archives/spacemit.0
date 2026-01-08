Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18130F957
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 18:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896401; cv=none; b=pCq2Cd5jWx0yLEn7llPq31gWqrHPIJEw4ivCItkqpVwa9v7NKIGKpMdNsFer+e6jxC9Z4Zt3w+qSa4QF5ImPebBZXlIF1niTFOUExM8nSZcZez7r4T3C6KmdInZin0+tjW1E31oTjsRIb+D69JA4gCKN4/JD7lPtqoJowFhz3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896401; c=relaxed/simple;
	bh=kENMl9cHYpFg5tlCTn7MwoBrfZVZFFqg7J7R9sd/27o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddvVqCYFqQUf6JTdSW0DloSFF3oxibPoGf8/IRbEpqia7E8IhBRmP+ki8bccEqQDL+ML48GTVyT0vrDl4x0iAoOugbX2nAHlp9d1D5x64GzNnrx6/y/A+l3Kzaoj6RbRg62OJ//5CnqNCnIDJ3IYuLOkocO6HQUYmUiEv9YKJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=m0IcvyYX; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="m0IcvyYX"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45391956bfcso2529714b6e.3
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767896399; x=1768501199; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ohc2giVuVn3JULq4s35HjI1BOKvAGS8MZPmPZF1eTvM=;
        b=m0IcvyYXIPvPMg1E1RMY50Bw9q05BkG7paYNz+1tYuyyfp/kqF6idRTD40vAmeHMSA
         J3BC+f0xiEl2COsJmbowYrLFLxIqF+vKb1gdzA3/RVMgVKBE6JERuzJgEtngswdU+emt
         vEb8XuPCySiPAQJk+I8RWUAJ5nYcRmIT9n0C46Plz5yRishKm5HcMUytKz3eUQPf7uNz
         0aTqudllPEqXTdt/epC0ZiagcRDwjcvQ0tsvA3r7cScajtIGxb0HSFGssHZ+UWQkU6Y+
         coVn+Heq7kHVUSph/9YUE4UQw0s+iUjQJvicP14Tw4ZiuVrmxi70lU3y4jqcYskO1wpV
         SSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767896399; x=1768501199;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ohc2giVuVn3JULq4s35HjI1BOKvAGS8MZPmPZF1eTvM=;
        b=tmadlFcQjygv2AtAaPpvB/gb5DtQ7N/VaPxdiGB2PhBJMSXov4oMEdbf6VZs7PWmC5
         3o6jkKfdV7HXsfBeQ8NM9r2YO8D5/pQ9P2aIzcE1XdBf8xkRgi5oMTFOXsr0Ot5Zlhno
         z7vKVnsyD5VJh6uRhwg9GOG0s96k3irawH2k6UIVGg9wIYeSaMBchJKDgjIHHctOt4fU
         VtrOFbFh9AFT9FrP285oJU17zKg/VhG0aVfncwk/d7xk9gLiownWhRWPWFFEbXz766HJ
         DXB/53QK9Q1Zl42qMVsiZgoVrkf2R2Z0j3VZGPBpF8DXkWt6HDXdLEOTW1gtNAmRUf2U
         9oyw==
X-Forwarded-Encrypted: i=1; AJvYcCUiX5ixcjb1JojC6v93i4iuZIAQ3sdcpUAsYjKCVHgAMx4xOam9GTqXorpX5v7Ppt3rmCGogKYWAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhHW5IZxw3wfhct1uIF44IE1mNKZkm7GVGQvf33sxXZ4ctps7I
	fLH8EXdXwtkzrl/AdWpdOhC3aao1t7M0dNeeUtF7PVAKO1EkHmfUUIvwZV8ldpGNj2w=
X-Gm-Gg: AY/fxX6CMnd84qrBnyth81jh9d9n6YKSmjI7WhVe7c5lRYrInCp1VvBjgZLS5aGs+IN
	BoOENGflFpWjq6wR7LqJiEgqLkDhuy0F/OSTIK28HlAoHwrQ1Jxst93Xp2ptaByqZ7z+I2kmylY
	0aV3VryVo/OZEtbbvySKGPvsamNDRS10LIDmpL8X7/VbSv4AIYrnHVZRphLGn3SI/6q0xXSpo64
	+LM4ocgqoIfisumYK0mw0xuV3cWEcsG9wGpsx/CU3w+Ne5uQ8DFIMmGMzFIC5ycSWdZRhpvW9HD
	dvaNTIe2Mmpl4s3h6w85TYzz6wMw71PFx1W54g/2c7u481n9UNMzXxU4hI8M5Crum2Yw1dcgl2d
	lDMKZnxE0Mutj4mZOVSfKcEyh9f3HKeWAagGxSYFhuquBwVl8te4iTLKImudjBPnnvMqASJwjsW
	PhAa589hBK+htVD/eC420deQR/POs=
X-Google-Smtp-Source: AGHT+IG+bYw5aa5qXAocgfxdFotOTyw3i8NWk0A08WmZ4RTMKQzSHU4xstgqw3nYJD/MtZ0mMoVZ9w==
X-Received: by 2002:a05:6808:6508:b0:453:746a:c61c with SMTP id 5614622812f47-45a6bf00314mr3342680b6e.66.1767896399198;
        Thu, 08 Jan 2026 10:19:59 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.86])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2e8fb1sm3613666b6e.21.2026.01.08.10.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:19:58 -0800 (PST)
Message-ID: <77f9a001-7f0a-4c29-abcb-501e875da117@sifive.com>
Date: Thu, 8 Jan 2026 12:19:56 -0600
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
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260108-k3-basic-dt-v3-10-ed99eb4c3ad3@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-01-08 6:26 AM, Guodong Xu wrote:
> SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
> Add nodes of uarts, timer and interrupt-controllers.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: Remove "supm" from the riscv,isa-extensions list.
> v2: Remove aliases from k3.dtsi, they should be in board DTS.
>     Updated riscv,isa-extensions with new extensions from the extensions.yaml
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 548 +++++++++++++++++++++++++++++++++++
>  1 file changed, 548 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..be9335fba32cb9e81915b2b91cf08c55a5e96809
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> [...]
> +
> +		simsic: interrupt-controller@e0400000 {
> +			compatible = "spacemit,k3-imsics","riscv,imsics";

style: missing space after comma

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

Does the chip also have M-mode IMSIC and APLIC instances? Those need to be
represented in the devicetree as well, for M-mode firmware to access them, just
like the CLINT below.

Regards,
Samuel

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

