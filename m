Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2911E7C08
	for <spacemit@lists.linux.dev>; Mon, 21 Apr 2025 17:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745257222; cv=none; b=cuzDj/B1FKViXrE49woB3nEvrENke4hD/1k0tDf39ckUzOlMbzMAyQwlaAamI9zdlk3Zwj6szTJb94uNIxwNfo0IU+xGITCmFjj27JIMw8fRK+7ytpJ04uT+5v/Z7br2UTHsFqvY43oioW6ThCoifmU5RKeCwi+ZsGuKFgEFDwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745257222; c=relaxed/simple;
	bh=PDMX/gz7bhm8/YvqOGZSqtmA9Ej+TwrV8JeRfvfYLxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiPlr7CoDjkDOFySpGHx3cFO+P4wuZT1XP0SW+ZO/kjSYrTqyZaRvlmULavZ0KG1awbIC8Dc3pWcUmmszbFb6DksjzdKovCXzHNpWYdZ6kTlwHhs04HEn0Iw64Vax5k6OxX74ogIVbGsKWkrLfSfGX81pM9AJ1fIgOr6sndRpjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xmfEW2hI; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xmfEW2hI"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c55500cf80so335905585a.1
        for <spacemit@lists.linux.dev>; Mon, 21 Apr 2025 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745257219; x=1745862019; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kIVu58H//mZx9i9dCRDIy5r3dYFEIXqq3Oo6gJVw3Q=;
        b=xmfEW2hIehn33uPrC/R7bAlWAzvbOsgPLL4j7YHEHowGrbU4nNYTjdIXTmGFt6/LF2
         9E2CLEFsgdf0XtaXN3zGYoyam+ZIilBUifPn5i5rTzl7hj/W6GjPl8VuCfgbP87mcd+u
         v0AAzbtxyWF/jpRl0OhIuoy5IbrTs8v/7rdc0gAbPh6o+FSq+3GohzM2w73XE7uuVPun
         yQ+B8rdXQpAikMJtsCVHy1I7gpVZiuSynvwidk2NAZ1D2QLSaBojoYUjKA3PgXlAfnA5
         PSjYAkvHQ6Xft6/0GLaXb4iKqVyLS3S6rq1vBxEylvomkiSbBcXx8AsTMZIcBo2gBWTV
         8ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745257219; x=1745862019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kIVu58H//mZx9i9dCRDIy5r3dYFEIXqq3Oo6gJVw3Q=;
        b=vpjtGCKfW8K8y1XSqTsJQfw3rlxX9YRpiXefFvzXfyXqwxt2uTp2fff06lReqnkyQt
         HMk9EdEIe/xsJLzBmE97b7yFs5xpPMKHE73xpUVcLb5iIliu7XgaTSSn1AajnltzrWmW
         zT+PoH70h+krbs6uQ5huCpJ0oKRiCZl7EE64wqx4K4NKnS2xQKFgyvzYWtB8DfLippQb
         WurIcjTt6kFT8c4CnI840jakPlT9YGAlBrHKhI4bGaG251VGUbvZTMloqve4UHA+69CQ
         NYzN5k+bqDlDuHj1eNaeHTa9lMdge4nopzsWn9nKWy4Q/io1XwwXu/H+5kVe2ELBOB3S
         B1zw==
X-Forwarded-Encrypted: i=1; AJvYcCUTsl65GPg+ZYR924NKcwQYS+OUfuwM0yoeaEddIm1gndeHj5zhOB/cwX3GhK2VN3fTIMS90UavPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5rosIKC5Pxuvbz7OTDcchZgd/oEZaw5LPTK9DJ8QbhFAim/fZ
	66LEEdPExvMKDeIRmphUfbXqZdcmKTt7v7YAFot3NUipUqFeHt7XJjcL1UOIVEw=
X-Gm-Gg: ASbGncv9zAtk3ILVWLts3sq/2qfU9vRz21FjWh/bEWA2HJSHOkZpgrvLuA2BpXwuCqm
	Noo5sSK9032Ji//eCQ3qVZ+x22c9rWcfWZWVSBKzxCvVCCEekv98ZftAKd9LVvmI3qGbgl2pVOK
	IYJy/UYSrtxWi9t6uqGNgov64kTdAnbhJ1pjiw2gACg4lCx8HmrFi+uFIk8eWwWym1uiHMYbYfq
	gVZXMvG9Vss0X9xZXXwLtoOwejzdp7SSD883EnlUUlKjyxEemCOXaTSZUhoxdW0sGwE6DQbsfZl
	ehX6vvW8wf0jI6flD0DuXYgk1nNt/ZrZoBEZAyGX9sZ0Xsv2hP7YGfx210H0k9RWB3wN9cI8p3G
	wslLCdY0HSjNVTWc=
X-Google-Smtp-Source: AGHT+IF+vsdmKg2vXpeajIoJuLo47wQiw/dv7wnI49ZF4AY0SLVO/f7XcVPIz2huHaNJ7F/AqME9ng==
X-Received: by 2002:a05:6214:500f:b0:6eb:2f7a:45b0 with SMTP id 6a1803df08f44-6f2c46baaaamr274256056d6.38.1745257218647;
        Mon, 21 Apr 2025 10:40:18 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af120esm46284596d6.1.2025.04.21.10.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 10:40:18 -0700 (PDT)
Message-ID: <2d086fee-47d5-4be2-8b86-bf1cac6af803@riscstar.com>
Date: Mon, 21 Apr 2025 12:40:17 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Acquire clocks for UART
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Haylen Chu <heylenay@4d2.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
 <20250419-05-dts-clock-v1-2-1cce5d59aba2@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250419-05-dts-clock-v1-2-1cce5d59aba2@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/25 10:32 PM, Yixun Lan wrote:
> The K1 SoC features two clocks for UART controller,
> Acquire them explicitly in the driver.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I had an almost identical patch queued up to do this.

I think I'd mention explicitly in this description that you
are removing the clock-frequency property from all these nodes
(it is required to do this, otherwise the clock properties are
ignored by of_platform_serial_setup() in "8250_of.c").

Two more requests below.  Otherwise this looks good.

If you address all three of my comments, feel free to add:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 36 +++++++++++++++++++++++++++---------
>   1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 153fd1160182b42fe1a2f7f042c9c1da90f63b0c..415e1c3e1c78db987cbb65759adc26e98aaa24d3 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -360,8 +360,10 @@ syscon_apbc: system-control@d4015000 {
>   		uart0: serial@d4017000 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017000 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART0>,
> +				 <&syscon_apbc CLK_UART0_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <42>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -370,8 +372,10 @@ uart0: serial@d4017000 {
>   		uart2: serial@d4017100 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017100 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART2>,
> +				 <&syscon_apbc CLK_UART2_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <44>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -380,8 +384,10 @@ uart2: serial@d4017100 {
>   		uart3: serial@d4017200 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017200 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART3>,
> +				 <&syscon_apbc CLK_UART3_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <45>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -390,8 +396,10 @@ uart3: serial@d4017200 {
>   		uart4: serial@d4017300 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017300 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART4>,
> +				 <&syscon_apbc CLK_UART4_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <46>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -400,8 +408,10 @@ uart4: serial@d4017300 {
>   		uart5: serial@d4017400 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017400 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART5>,
> +				 <&syscon_apbc CLK_UART5_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <47>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -410,8 +420,10 @@ uart5: serial@d4017400 {
>   		uart6: serial@d4017500 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017500 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART6>,
> +				 <&syscon_apbc CLK_UART6_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <48>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -420,8 +432,10 @@ uart6: serial@d4017500 {
>   		uart7: serial@d4017600 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017600 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART7>,
> +				 <&syscon_apbc CLK_UART7_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <49>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -431,7 +445,9 @@ uart8: serial@d4017700 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017700 0x0 0x100>;
>   			interrupts = <50>;
> -			clock-frequency = <14857000>;
> +			clocks = <&syscon_apbc CLK_UART8>,
> +				 <&syscon_apbc CLK_UART8_BUS>;
> +			clock-names = "core", "bus";

Please insert the clocks and clock-names properties *above* the
interrupts property, as you did for all of the above.

>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -441,7 +457,9 @@ uart9: serial@d4017800 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017800 0x0 0x100>;
>   			interrupts = <51>;
> -			clock-frequency = <14857000>;
> +			clocks = <&syscon_apbc CLK_UART9>,
> +				 <&syscon_apbc CLK_UART9_BUS>;
> +			clock-names = "core", "bus";

Same comment here.

					-Alex

>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> 

