Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6BC155C82
	for <spacemit@lists.linux.dev>; Fri,  7 Mar 2025 01:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741312545; cv=none; b=W8D0erc/7bGwiH7mY5NoDgCsJc7/ssqe+079HxV/2CFCvqBGVJuUAXXlSUUyqAcAI/N1ZE61jmCuYMoy81sGayZG/ahGgeIulUwynZkexEeS17qVQHEvETRcMxa004gNPrqTgySE+bA80NC4/iCRYuOTv5wXfOMMvSFpyYYQj9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741312545; c=relaxed/simple;
	bh=RHtN3iGjMgWiluyrwelfjYAaPkmhPTQUo75CvgJ0QEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FC2rEccQu4bdMp5OyV6CNpds4IKoE389dbs53XLr5jSXYcrtpg7jrfdF2vl+m+MU19QeQHpf/XMVGvkRfHKmYT1cLAuwWs41IUE2jE+FAFlWLaib6k1+h4CB/r7525HCvNEsPfNOQlKlMULwVam/xCVRJ6wzAvB45B8X0+9mQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKnsN0RA; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKnsN0RA"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c08fc20194so239112185a.2
        for <spacemit@lists.linux.dev>; Thu, 06 Mar 2025 17:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741312542; x=1741917342; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CnB820XmRIOqOOR99gcezJiiPyY61vMTKT3r5Ay3K/8=;
        b=nKnsN0RAiinXxjfmCFXyfbzIBQhaFW+2dpWjf/hyV8wMdpzrb1J94ZioLal+XMt3J8
         FAwwwLc4Q4UjjB9CpwlWI0CY67lYG/5/gOvnEfLkuR7t92AW2/HEGKjA7qCdMfC0d4jo
         Lb9faqC7YfQTsgtLUOR6sRIsA5q2Z/hNCRYNwLDo4M4ViRGv1sXOjtD/mtmc7gc79uIs
         OKVx8CgFcvEfAWmBze/SBL+IlsjpFFdrBdGN6JqDcBw9qBf+1UD0gkcX4NqcKlkSbf8d
         tBGNUWuaDieX6uaurOO+splLi05IPc1xzyXQpMm4cPVi4fbLDOq4U0ay2Cff8LSLXR1s
         O8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741312542; x=1741917342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnB820XmRIOqOOR99gcezJiiPyY61vMTKT3r5Ay3K/8=;
        b=hSTlpziHvq2+f8FTiyVpNRnGfhP5kH238l7GT/tWtUNerH6jUEazj0hg565IzweWVp
         YJ3Gve7BaI6wbtP50k0uU5IGRfFD6Tv1IH1+HK2iq6dFkdQidLu0yoocDdZjnXfh918T
         mhFIXJ9drbPSi3sXsvHGXVoip2yDxOXZCY98e7jYYkXP9LsUVUseHrPH5W40GPKmqDju
         oOiR+WO4uerhgJsz7ztsWt+U1fWY4GAyKGqo9CdlfKrNeOquRHxcFyuDHmVjENhUW7Ab
         W51TIiAlQWX/2qLkasNZtD02AIXblHYfN+BTBcQbh6rEnyJnpGdyzevx4rTg8zBOk0sT
         ++mA==
X-Forwarded-Encrypted: i=1; AJvYcCUSvKnqF17IhjCecEYRAW3ouE8uXiYMu62LPUv4G0HQmiyIhIqKLnbCq6Aqgtx9aXy6MTaNyr5Z2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxK0cZTZ9maryHRYkkbN/QcmEbYMODGKK8YCyRnLVUS43iM6XLA
	lEhFHWzXQzGXM6Q0nGvO5+V6gdHi1Y6otVpCjk9b5o9wajFzYtbd
X-Gm-Gg: ASbGncvhiGWw5Xnfo/nExM8e0RIc9n1zcptXekWAL/LzPA2iq52aS9ubCeM3n1FTmjo
	iQAknorS3DEhzIXLsFomrLoB0myXvPH2cIN8Ug1SulaVfMhNKk4fjtVINvSnefA/G6r4FJ8jElc
	Kf1+bUERWuf/WyWvNVAc9mKDYKWg4lVehCIQCRk3r9R5+/KXle9EL4wHvrJ0hE1QfRemCF/BnvS
	w8Ok4w3szQt91A5ZFo7aWOL0X5CeIF9l8vN6nDulXoffCJQc19frLO2hT0GBX8nYV4gx9P1HV4/
	NAP2MjjjP98ZxSzVqVEw
X-Google-Smtp-Source: AGHT+IEhk9cw6y94YXFfzejXMM/qsbiaq30VZ1R51o4YMU4MUQ3DOSzkmoemtDhtTBQwJetuR8isjg==
X-Received: by 2002:a05:620a:8719:b0:7c3:d6a7:6eea with SMTP id af79cd13be357-7c4e168b8b7mr226719685a.21.1741312542344;
        Thu, 06 Mar 2025 17:55:42 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3e551102csm168635885a.101.2025.03.06.17.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:55:41 -0800 (PST)
Date: Fri, 7 Mar 2025 09:55:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 5/5] riscv: dts: spacemit: Add clock tree for Spacemit
 K1
Message-ID: <2isaev6ys2fn2u6lnyudvnjam34fggr5tqh7afajwdjbdp5rvr@ajokoevhqq4p>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-7-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306175750.22480-7-heylenay@4d2.org>

On Thu, Mar 06, 2025 at 05:57:51PM +0000, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 79 ++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..09a9100986b1 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>   */
>  
> +#include <dt-bindings/clock/spacemit,k1-ccu.h>
> +
>  /dts-v1/;
>  / {
>  	#address-cells = <2>;
> @@ -306,6 +308,40 @@ cluster1_l2_cache: l2-cache1 {
>  		};
>  	};
>  
> +	clocks {

> +		#address-cells = <0x2>;
> +		#size-cells = <0x2>;
> +		ranges;

why setting this?

> +
> +		vctcxo_1m: clock-1m {
> +			compatible = "fixed-clock";

> +			clock-frequency = <1000000>;

Should the frequency this move to the board file?
I do not think these clock are in the soc.
This applys to all clock below.

> +			clock-output-names = "vctcxo_1m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_24m: clock-24m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "vctcxo_24m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_3m: clock-3m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <3000000>;
> +			clock-output-names = "vctcxo_3m";
> +			#clock-cells = <0>;
> +		};
> +
> +		osc_32k: clock-32k {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			clock-output-names = "osc_32k";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -314,6 +350,17 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		syscon_apbc: system-control@d4015000 {
> +			compatible = "spacemit,k1-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		uart0: serial@d4017000 {
>  			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>  			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +456,38 @@ pinctrl: pinctrl@d401e000 {
>  			reg = <0x0 0xd401e000 0x0 0x400>;
>  		};
>  
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k1-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: system-control@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-control@d4282800 {
> +			compatible = "spacemit,k1-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		plic: interrupt-controller@e0000000 {
>  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>  			reg = <0x0 0xe0000000 0x0 0x4000000>;
> -- 
> 2.48.1
> 
