Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757294;
	b=azkLnBOmJDeqezjHNfTVkEzS8X77r++UAaZ/2zBB0Gv/WeJc9K/fx0OAWGMRWu3vswSJ
	 rqvS+wRJgb1xxPsHBqT8phLpwuZYtq1VA9+mlcJgg1+tnesow8QZ2fvSL8WFA3RqQ/lwa
	 uORLbFkzQTEKpaoWgN/2joMP1AVNRA59MOU0StASAyAtsFxPa9IOMZUyo3O3oMeanRx+8
	 4oCRIo99IR72LMPAZVFDNziiWIqizIpdeGXwe5sPJ2gtscT+SwwYB54q5CN4v7wQSiAxc
	 O7+esJnRr8jaQqerpsCT1d3s0eE55RBzdkuRpdWRtYGAtb7hQLViRObYC9LRToDQ9Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9jH/OKgM1gQSDKQc5kAy7iczSgneLDrLRkuuGZg3T08=;
	b=TgfoI8sCzK4p9Zx87230dH5V3i5HCCw7QV+c3KBvpb873BV9EwKVxzAcTbfKr51UNnX0
	 6klAZKsLssO1nNCzN/lSZetx8hgdWAr/1RINXd75f72Mw6Hv4Yf9ZBuR6gDTCb6FXvlhB
	 Cocimer+Hx7Xm5CUy24ElZui/MaDTaCkI75t4DenjrB2dwF5BVdIltL9C5VAnNYsZhTDA
	 RB75uDZMhCVSbTDleN0QYAP0EN/MRsw5wjadCwBZqZfMJ0gaA3lfZJQaMsTatl6TkUWZK
	 jLp3elSnekAIb49/ZgOLM529YqdW7X0Gr2oGmBlNYcGCYBXjzDkMWI1kRWuciMCytHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=YBamr02D;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB124606A321
	for <spacemit@lists.linux.dev>; Fri, 27 Nov 2026 05:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB124606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=YBamr02D
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-677d35fd1d2so7762719d50.1
        for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 21:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795757293; x=1796362093; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9jH/OKgM1gQSDKQc5kAy7iczSgneLDrLRkuuGZg3T08=;
        b=YBamr02DHIxG7iS4d2mzhKadc8S7Vik/Cmtjs3dvXgGVgtEP6l9K/GRKGpDipLGsY5
         8kvMizVTAKlWTle1QsZWrabrI8zrCZh9FfkcePxnfX2SuVRS+yLUEZqqfVZ4vSiy6Ibz
         guszyR0WxTbHc7V9vUVj63UXz+Jzpo0AXJMcjZ0QKw2OsuCcFMgiaeN2DKjJkNXwf5q+
         W9pMaGGzQAICF4DA+D06P1BTM8ZNHCugmCmyJCAUNnpua4JSRz3Qe22sxAYUSnDKqrrb
         rhpMH/TNGf3thuM5f6nKpvnJsm6RmKNmnPclcJSktRgO8+HGMTdCLB7s2/ElhaLjlbHS
         FZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757293; x=1796362093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jH/OKgM1gQSDKQc5kAy7iczSgneLDrLRkuuGZg3T08=;
        b=xUAYo05DtvKaGFlJK2zJgIneNH32tRhPSvgk/dI6uzTU+IMpvt5PwQqF/eCOjbYKcs
         yVMVvvzokJGfFl2v/JsruVDoCPxaapngCfcdNYYtBxgVcVUPjIxrA+MJZm/++92mX77U
         QjiskCO+Cvj8UT+mP42e0jBRYEa8uo2S4hYciPqw6SglTxJSClkFoNW/aNQdQSXXFCXO
         D/vztqKqzw84P4rO2TLA6XxYCmW6BbHpXkb+pdNj8Ui20MGRowiHne+KKG5o5uFn2weG
         SHOSH923ERUAMEy/XYKrg73/d+HWWkKXpXOLkQ67UgY3kotmzPUMVun5nbQ5lE+jXh5F
         SZmw==
X-Forwarded-Encrypted: i=1; AL+hErEfUEDFx10bgdhS/UKK3zSYDoI2tZeGONL7Q2Rf3JQxpHKzPdpnzGgkW6YNwSQM7d1NK8TFmgo/yA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+hRMHLqzv+qBUxTGWETPDTXW8+4CbYR4Nv18Wjlh88NEXTZBRi
	6vzrBe1haRmoHyz/n3kASOCJUn2WLcSnA1Xz5Iv6tRspC1hz3atDCc9qZ4PnekA/Nw8=
X-Gm-Gg: AZFdTZcvarAFy8e/uLZ2SDvEIAZFR9Zk+T4ETiU179PeCIdnV7aMa4LqL2orImXHT+F
	UTYxLzNMXHGfdAeRvTJRvjeEyOOo8Buew4BtYPKnR/N4uqJyB7wZ24f+0Twt38TtFKq6iSFEkcY
	AeBiZQaovAoHJ83ylswyYQSKelSqUL+bsi4JWODsSykiygKT1IvUTKXYwrir1LvXx5GPJdaELtO
	yvmGO8Gz9Rlenv960xGiz7C07BoptE4K9fJNwmnPns4qCYOo342q5OjTNFWO+aWismBPxt/B31i
	gAinsblBmIJOzo4guA2Jdxmkjtd6ZGe0kpXenvOpAwNwwctNQxjYnTN+cF5+3eP5zYXV5qVY0bn
	wEWsWG5v1OGvv+wOhFJarA9Q9Nof59J6vzWw6A+bKDhMLcAGsZ66hBOOiSqAUxyiMsdiZq/4k6g
	7v8cCAekPVUcHgyEQJ1KLjylQCOrM06h6pd0Gd7o8LrAROB7Ti3GXJ8otIYiSpqYOscpzodUDnP
	EHWTw8S2HK4jbMalx8ewuCWRpsjNf+NI2drNCk3gor5FMeLDPt3AsRj/xMC2yZLhVRkES5urTG9
	Ooln7uEObKwMr6NaHRwlmnp/5f8Xtylz0CRS8PzOGdqtRQuNIT3gOPXvB1gGtaovbMLkAsZt1a6
	ipz8a4Dmi6we+8ic668sI
X-Received: by 2002:a05:690e:4594:20b0:67c:6ce7:c513 with SMTP id 956f58d0204a3-67df44da548mr5273707d50.82.1795757292881;
        Thu, 26 Nov 2026 21:28:12 -0800 (PST)
Received: from toolbox ([2600:1700:220:59e0:e3a5:f585:4070:c566])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm11238363d50.22.2026.11.26.21.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:28:12 -0800 (PST)
Date: Thu, 26 Nov 2026 23:27:47 -0600
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
Message-ID: <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>

Hi Junhui,

On Fri, Sep 18, 2026 at 12:29:38AM +0800, Junhui Liu wrote:
> The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
> existing CLINT node at 0xe081c000 incorrectly describes the SSWI
> register space in the non-secure window as a legacy CLINT.
> 
> The ACLINT register space is mapped at two base addresses: a secure
> window at 0xf1810000 and a non-secure window at 0xe0810000. The
> secure window exposes all three components, while the non-secure
> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
> there. Moreover, depending on the eFuse configuration, the non-secure
> window may be entirely inaccessible, whereas the secure window is
> always available.
> 
> Replace the CLINT node with the three ACLINT devices, all using
> secure-window addresses: MSWI and MTIMER for machine-level firmware
> such as OpenSBI, and SSWI for supervisor software interrupts.
> 
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index c3f2dce0969c..74831974435e 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
>  			riscv,num-sources = <512>;
>  		};
>  
> -		clint: timer@e081c000 {
> -			compatible = "spacemit,k3-clint", "sifive,clint0";
> -			reg = <0x0 0xe081c000 0x0 0x4000>;
> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> -					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> -					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> -					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> -					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> -					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> -					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> -					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> -		};
> -
>  		/* sec_i2c3: 0xf0614000, not available from Linux */
>  
>  		mimsic: interrupt-controller@f1000000 {
> @@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		aclint_mswi: interrupt-controller@f1810000 {
> +			compatible = "spacemit,k3-aclint-mswi";
> +			reg = <0x0 0xf1810000 0x0 0x4000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
> +					      <&cpu2_intc 3>, <&cpu3_intc 3>,
> +					      <&cpu4_intc 3>, <&cpu5_intc 3>,
> +					      <&cpu6_intc 3>, <&cpu7_intc 3>;
> +		};
> +
> +		aclint_mtimer: timer@f1814000 {
> +			compatible = "spacemit,k3-aclint-mtimer";

I think you'll need to also include the "riscv,aclint-mtimer" compatible
here so that this DT can be used with upstream OpenSBI. OpenSBI doesn't
include the spacemit specific compatible. OpenSBI boot prints this
currently.

Platform Timer Device       : --- @ 0Hz

> +			reg = <0x0 0xf1814000 0x0 0x8000>;
> +			reg-names = "mtimecmp";
> +			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 7>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 7>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 7>, <&cpu7_intc 7>;
> +		};


Regards
Anirudh Srinivasan
