Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E93221F06
	for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773452659; cv=none; b=i7wkLQZ/vmxrkujRfr4KdNwb+T3kOW7ZwWfxKtYf9CQ+wCk1GwQ0cOkaOKrFWg2ma+VABopO48i9un6cDbbPIfqTbm5FykXWDeKZjlRbMHxkfaRhrDyu3GIZntBAGxPbq69KU2gWkaq+KMlWV1oO/9mVu+cIaEk/loSEYRGJ19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773452659; c=relaxed/simple;
	bh=+4Bmuqw/MokEQOXuptaA1vona06ynLnmmnKJfdgDAqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tc6RAwf3koY2NuTornAxi4w4iaI8PCAZZrdX/olhVKO0VZSwI2bN7g34WIXFpMDPbhrXll1K6uyhMhBThDToJZ1BgQ69UaXJmvOwkH0pWu/mKTqxj8SHqWLEpuwpd4R5iA9G0oB4sZzNOs6qA22DJIp7jymWtIhw35fHq1RfDrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=J+xtzv1Y; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="J+xtzv1Y"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79901821bb0so30828817b3.2
        for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 18:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773452657; x=1774057457; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+0PW7TLqltEBmQy5cqK8weQnye0SYryGMpoq56/3fY=;
        b=J+xtzv1YalSmZwclM+y8DJwqe07HB3iJSwtNK93W6e8A6r0yfCN+ehOCZ/CcDI4P7a
         mwNP936qXaXbwaJUVW8suxSYQ/xx9ml1357IpNCMrSH/Fp6QrsskCddsB7giiGfx/fwd
         L8AsN9+M+kpQIfgNMtAmNV3Xna5pV+iUJmNCH9WgS6tKqn9/ikNYkd93t1NcMb7HIBYu
         xWh+lghD+Jw3C4TPwsPUirC9nJfOHz/4ejr9lD199Sz8nNaYfz8QMFVVtNny1Zk40Jl5
         SamRsKX6sYlvaqAKovDiCuT0trpm9NE81d1n2KrNkUKHfuF9/47THJUzE6rdavJ/eDOv
         O6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773452657; x=1774057457;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+0PW7TLqltEBmQy5cqK8weQnye0SYryGMpoq56/3fY=;
        b=HIZ1IdFE/MVJo6Z9A4OjYxKdEahAfKafMNrVN6nS8t5Mb4oTVJsppnAxWDLIfqVJDn
         3te36T5W2XSrROYmD0Qr4P9LC2P05OeGI7u9aurfpEv8jTORyfWCZ/Aetr2yV+bn5O0J
         ackVWswD4NtteH65M4DB8SoYiUYUGavFwmHqqOknlKJENfrNU0K2QxODufA+gxvhH1mS
         Zmvyp/NNs2LJD/PfvXUXHjMOSaiUwMyv7s0Zy5Mj2avmHhcBA1JUYlG01NVs4mSKwToj
         7mTSxcE5zmKzWulhd9qYtBBopAcIoP7Tqk0v5iDhVvD2BZ2sq9RVaHgZ8TVyGfDJWIbs
         velA==
X-Forwarded-Encrypted: i=1; AJvYcCVvFnY0TykxNYz+6wvMpe5VsXy4FVu+nNCcIvOo9LQmLvWg6r93dv9UHLqocKJizYQi50ccr0/CKg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyptog+cqegnJsvEyMhtT4UhSVw63kLXTVNT9IyNhybPjpXD45w
	kC5mEBNPjodeptUH8kHeZLrs7ojy7pvqCfIE9T91UFHwVg7EbrSik2CT5IDjTV1JJoU=
X-Gm-Gg: ATEYQzzzeANwt6l5G3oD6fqK5h3B5H2vdjhkMQ14v/anXL1ij3PkC/gmNQ+vTXRTmgN
	wiFY4IPHPOBBTvLlTMepVWqK877prDJANpa2u1bcttxsYvRNDFGpgv7TEXuiUltG5s3X26dDZ48
	OoZtydYdbIwsMO3ui/N+JtGVIWIK67lyoamN/Ir+6nN80B1RWc/O8Apjogw7T43FhsmfoypoXA0
	xmolUw5V3xaivjMosjlydwIu8HNjbwzleCdgUdLa7hfnFRyBp+2+KeDGVdbH+kkZdqg7tZAK0WF
	NBpACmHReWfom4H0+dU6HPphrgmyxdBhZa3SDEUQGAZrR6/2FGqTs6AdOhIygbHnGsNiBHNKb8t
	CbG5k9DrwIVg1aLo+ye8mN2kqKHkeeu8vM6W1zaH+yo5Zww+MuXDI8CI4fB8smp44OH0unLpiKp
	nZqjADvwFPuJvX6WLU6k60i+uwlRVl76czFZQHI9bU
X-Received: by 2002:a05:690c:112:b0:798:67be:f903 with SMTP id 00721157ae682-79a1c17ba6emr59139737b3.39.1773452657155;
        Fri, 13 Mar 2026 18:44:17 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7991ad51ee0sm50488877b3.8.2026.03.13.18.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 18:44:16 -0700 (PDT)
Message-ID: <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>
Date: Fri, 13 Mar 2026 20:44:15 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: k3: add clock tree
To: Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
 <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yixun,

On 2026-03-04 1:36 AM, Yixun Lan wrote:
> Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> blocks which are APBC, APMU, DCIU, MPUM.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 75 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index b69cf81b5d55..e3d7f3102fd5 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
>   */
>  
> +#include <dt-bindings/clock/spacemit,k3-clocks.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
>  /dts-v1/;
> @@ -398,6 +399,36 @@ core3 {
>  		};
>  	};
>  
> +	clocks {
> +		vctcxo_1m: clock-1m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <1000000>;
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

Are these clocks provided by SoC or by the board? Usually there's a crystal
external to the SoC that provides the root of the clock tree. If these clocks
are provided by the board, they (or at least the clock-frequency property)
should be in the board DT, not the SoC dtsi.

Also, the /clocks node is out of order.

Regards,
Samuel

> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&saplic>;
> @@ -406,6 +437,15 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		syscon_apbc: system-controller@d4015000 {
> +			compatible = "spacemit,k3-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		uart0: serial@d4017000 {
>  			compatible = "spacemit,k3-uart", "intel,xscale-uart";
>  			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -506,6 +546,41 @@ uart10: serial@d401f000 {
>  			status = "disabled";
>  		};
>  
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k3-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x10000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: clock-controller@d4090000 {
> +			compatible = "spacemit,k3-pll";
> +			reg = <0x0 0xd4090000 0x0 0x10000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-controller@d4282800 {
> +			compatible = "spacemit,k3-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		syscon_dciu: system-controller@d8440000 {
> +			compatible = "spacemit,k3-syscon-dciu";
> +			reg = <0x0 0xd8440000 0x0 0xc000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		simsic: interrupt-controller@e0400000 {
>  			compatible = "spacemit,k3-imsics", "riscv,imsics";
>  			reg = <0x0 0xe0400000 0x0 0x200000>;
> 

