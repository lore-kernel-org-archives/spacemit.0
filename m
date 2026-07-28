Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC2C3C4163
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276955; cv=none; b=XXNo9zZlsjFUfBk6NGTL7oJfLtUjPFTIxl/DQbb/vkK2JMsd+s95091sibtgmuCwk8k1h7bg+MqP6w3DmT2Otx5qHaPOtLgllspR9r1Qo5nVPUYTHZCGpJWRYBz23fFWl6JzqOqBCmIxJEYSypDL7BoovtnoEvTzf1H1GFaOxRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276955; c=relaxed/simple;
	bh=iz5eEsTOMdWHCyx2WpA/dZYo9o9pe5LN+o8YsCcB1vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bmx7G3lfzRM7fa8P+yf9nEAGb3Qu4Hpjz3a+dnBvW9ubM6DPAkKKktnPoxX9ArCu0YV5Yga0TGILjqZCcS9J++gNY5OBDwju44uQUDLXhc38Kmgas92jyxmo53MdS4MQgAne6iYJGFLtMGWqGQZ3GigJptyUykGN9ezzzcLNJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoSxUNKw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoSxUNKw"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423f236418so258019b3a.1
        for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 15:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276954; x=1785881754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rje7HhQ48HT1sXup0TRphJEI0h4NvdmNL/JFa+vFWNM=;
        b=QoSxUNKwmbLnDjnTxX5z32tzcNd89+PGoaiqhHXdjip4v+a3zZMMqk96kudcUpAE+i
         39panm/fx1gwsHrw60/qg5r6LqqIUIbljWEy4wQlKRlZWy3RcXiELwzWNiP441jQfPQ7
         IgCyDni0bbntqVDBpP38Jp5kaJsNVfdqLDKHUHIn6dIV/BxDyI5NW4YJb8LFot9HiUis
         R8dQqPOifdbQxI01MwPILYgB3P3euDBuqbGSNw5ZGkNr87scKJrRn1/ndry3ofMM6ris
         sw4TeqqlHnSxq15l6xnC5DJcmOCPP/NS30oBek0VdsCFYYDKuMPU+BCOmGRBUg2WonuK
         xfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276954; x=1785881754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rje7HhQ48HT1sXup0TRphJEI0h4NvdmNL/JFa+vFWNM=;
        b=AEgh5csqgRBd9lN3tKkrmv24dhP13xcEwMM7KdaxEUskq+1P3YIE18XKmn8jg6BLiU
         9vU6uog3WQ7VovmiG27m0JiLRqSazXhtLmWgD684pkmDK8gzjCUXl6hmfu7iJXqn0ijq
         fefvs3HZaeuCGD/y10h6l/Wwq2RosrQmmenHdG/iQjLozzv24bGKbcqhyZpD5yIdgkIp
         to8ChIDxzbKvQg7LXg28DuaBE0yA0a1PetYaJV4S2UwYAuYUCnFlpTTNtWeU8gd0RxAN
         SSitEAxWOt0AG24mPPrQDsugTeWtYMGR/t44KmZLgOFjMeZXl5Dp5tVLndpU9XUslYNY
         BSPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpznnMUlmjga3r1xrfPd+buaSvk/LI1VA+UtProur+A+jlmChMAaGZs/IHGQCYjyIyViT3j48kSCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTpbCQMGey3wJGHlktyjbcaY0qtcalS8lvnzujtsCFKGeVSHxz
	ZpZrd3FA1AuslTLuO934U1975ncMzTpW5Yf0U+B70rWmz2sYbm1pZ4Qk
X-Gm-Gg: AR+sD13gmNK98lRnfRJBWMNrmu76hiDvFq/EW+fy6bSa9pyRT34bU+R6tQvuT1dYvux
	GukE8BV0VWJyNmeb2C+L9qvs27FItt9gEZmDg/AbuLySNnv0WP3iwQzJ/6qulcPLLQohWpqGy6l
	IciYF5uE8lynsHustzbE0HZPJ/N3+T4orpiCtMEat+q5H+jGKxiBourkFkdejDWvqZ3v9kt5qIF
	JsLNJ+UAUaaI0D4lINLhNyerE6hv+D0WcQj+pqTbp8qgcs4EId7Ro+tUUKLkmAdfi5cMB0dW/5c
	ptiTjAav7U/T2wZTSOl8DOCQSkM+nJV9J0FfPfnqCb52YKhoPlCG24WQv8YRPVuJHErBM8zQFIa
	e6dXBzE7CDaUIQrZON69MrNmy1yLBHyTYg7jx2SnysNkW4QOa0Ha/AyGPZ7ezgnhY2ygzGKmarx
	gCAbi5YfxhPOf6MG8NUItcCS2pjQOW5amu0DAAd3LmgIIrdO17khPNJqPVLuI=
X-Received: by 2002:a05:6a00:3992:b0:848:7f8a:8d0e with SMTP id d2e1a72fcca58-84e932c5f3emr4027335b3a.55.1785276953823;
        Tue, 28 Jul 2026 15:15:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea005287csm484155b3a.16.2026.07.28.15.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:15:53 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:15:43 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH RFC 7/7] riscv: dts: spacemit: k3: Add ACLINT MSWI and
 MTIMER nodes
Message-ID: <amkp9dLCVKTilhO-@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-7-aef88614d3a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-7-aef88614d3a5@pigmoral.tech>

On Wed, Jul 29, 2026 at 12:36:33AM +0800, Junhui Liu wrote:
> The SpacemiT K3 SoC provides ACLINT MSWI and MTIMER controllers. Add
> these nodes to complete the ACLINT description in the Device Tree for
> M-mode firmware such as OpenSBI.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 5fb719f79467..ecb5f4fcd8fd 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1303,5 +1303,24 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		aclint_mswi: interrupt-controller@f1810000 {
> +			compatible = "spacemit,k3-aclint-mswi", "riscv,aclint-mswi";
> +			reg = <0x0 0xf1810000 0x0 0x4000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
> +					      <&cpu2_intc 3>, <&cpu3_intc 3>,
> +					      <&cpu4_intc 3>, <&cpu5_intc 3>,
> +					      <&cpu6_intc 3>, <&cpu7_intc 3>;
> +		};
> +
> +		aclint_mtimer: timer@f1814000 {
> +			compatible = "spacemit,k3-aclint-mtimer", "riscv,aclint-mtimer";
> +			reg = <0x0 0xf1814000 0x0 0x8000>;
> +			reg-names = "mtimecmp";
> +			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 7>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 7>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 7>, <&cpu7_intc 7>;
> +		};
>  	};
>  };
> 
> -- 
> 2.55.0
> 

Squash this patch into the previous one, it is the same device.

Regards,
Inochi
