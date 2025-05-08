Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C0211484
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704256; cv=none; b=T9e5GgC0pgTSLV1bWYs7HwZNih9eF4W6UytYPWu1Mb12X+gcheEyp1pmx5AGoqK5UW4fT2ksTzb8FyHjFgKVmuBwJegPI3njNDUabEWXXfc5BPMvC72DUFd/qCH0vEaZa5Tt/ZodqSHh1slpY+8v+s3Ie8fkJAljafydJVCnxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704256; c=relaxed/simple;
	bh=Gld9bO5UZHsxrcS7dtAgIiV7rnHI7vEtpstol+3c7Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOuw6PTIIQ8in1c1FyfkT1N/3oH0PqL694xfgTq0Ga1B60Fm3isl5cUcqyDVlMe/KeaXb36T/TK5N2V3dadk3mU/RFOsvmIjNtfqB8Bo6FooP010gsm1qYbq45C1rG7ZzjrX7ywYbTkGxYnfYJC+VrQfMmuRuFx+RWWSDZaMtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Hu43go5O; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Hu43go5O"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2cc57330163so747883fac.2
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746704254; x=1747309054; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cg8NwDyNFyKWIP/c9rQXDiR1cnoY6h6ESpb3NTgHnZE=;
        b=Hu43go5OgfGWj/jNMWa7e0cr8m5Rqlf+c8ZoMFn0BTsyz83eehvo4KlSAgnzljygIZ
         35HlncY07GLndL7on7I1wtzPaKK3c7axs4HweJVYtYWljdc5Ca8T1zvGW6eIgPjvkS5U
         URknulh5wFWpF0FARj4o2MXOMh7KMtYKUNYimft3nrNr9h0ACv6OguP7C4G9/ATeP4MC
         dRmfoIaZLxKZEJl53AOyNLS9fAfaPv5rUdvAX8A2kJ9MAA2o5/AN409441d+SQD7FE9+
         PoXNyE35Dwytj7MqSrEDCyI0bsL84lIB+QDlmTJHzJrxKkYnGj9I68tPFy321Bw3HQ1X
         2BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704254; x=1747309054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg8NwDyNFyKWIP/c9rQXDiR1cnoY6h6ESpb3NTgHnZE=;
        b=WtnfmgwAK3ALG4aUPHCnXrXspau50c5PbgFxN3NNGv3ND2XdVlm1FlrhmuBJCYZiBS
         AYJRl+r4nulAR34jFeSSQCU8/LEm/Is1xsfmriFzZxI1BvKrvzYMeiWkPRMTkRc38lr+
         nUYIVU4K1jYORlXGx8GbIhX9gVcqQnYk76wofDkvaww7IbJIMF3BjBHyiL0q41ArnfVd
         eky5vvFp17HEzoqE+1LxhEB/SH7S9/oy1L1ucxLDuVRgrujPGsV3DXKA6gAY1i1IPrZe
         p1TUrQ5sX9+E0kjVN07ua1OhdFN/A9uA8c4gaPmZBSFPCj+t4sUvmOcQnlpRsnCKjF/6
         S7YA==
X-Forwarded-Encrypted: i=1; AJvYcCUOEY8tzx/TZZ7K2CKZNNMMt8kW31sjWjyc+Og7ChWMX7AU68Mh/wef2uuA/AfABWw+DSNrKvl1IA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrbG9JsnHNfeJlHI2z2WdXTWNSpPMtpY1C8srw9bvGt8clzjDH
	Zp8Au0HYY/UeTUzhGhwRk8/0mmBRDPV4WQgGSICkL3Nvr3aIp4z3c74Zk9kWeyc=
X-Gm-Gg: ASbGncvt3hoc2abIkCJNOn3NmMgzy0u6dQQrw1zo2ZZQtV1W5Nchq6JvzaexuYAFLMt
	Qunaqxk2IY6OcxYiNIzaKC+TbgL0DleOr3f0LizreP360gCeYbZLeVlGvNaLKmLOe+Hsq9M61X5
	Bn2fSLry5KPb/LsWoj7RBh7Kfcr1xDpKiwbeOo2/TTCXfMVW2qNEVNi5Fe4ruF2K5iDN/9JKAkz
	MriVvD2qlG/HeY9UY2zmcWTPqucsTk8t+hIkkw1uO0rkX7esRJn2D4acFPGrvrmhTBvANN2EKCv
	VQKHq6iDqi9Nn/VG/RWJCpZ0KB+qdGYvqDnWuEpOEAq1dAK7eBaifewJmAW+cWAg7ebH5PKU9Ms
	HUMwg
X-Google-Smtp-Source: AGHT+IGJREoSnG46P/t20ngqdhpSB9tC4Fc2vmNOvK3IyD1PhX98abqWUE9cRzQMmElSLNeoAKXG8Q==
X-Received: by 2002:a05:6870:e24e:b0:2b7:f58d:6dcf with SMTP id 586e51a60fabf-2db5bee487fmr3754145fac.18.1746704253907;
        Thu, 08 May 2025 04:37:33 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5d0e551asm1394614fac.42.2025.05.08.04.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:37:33 -0700 (PDT)
Message-ID: <63f0d0c0-94cc-4397-9c8a-b8d117514fd9@riscstar.com>
Date: Thu, 8 May 2025 06:37:31 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] riscv: dts: spacemit: Add clock tree for SpacemiT K1
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250508111528.10508-2-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250508111528.10508-2-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 6:15 AM, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
> 
> This originates the 5th patch from previous "Add clock controller
> support for SpacemiT K1" series[1] with node names of system
> controllers and PLL reworked[2].
> 
> The patch is based on linux-spacemit/k1/clk-for-6.16. Yixun, please drop
> the previous version and pick this patch instead. Thanks for your work!
> 
> [1]: https://lore.kernel.org/spacemit/20250416135406.16284-1-heylenay@4d2.org/
> [2]: https://lore.kernel.org/spacemit/aBxF81yqPgHP5oA_@ketchup/

What you changed was that previously you used "system-control" for
syscon_apbc, pll, and syscon_apmu.  In this version, you name them
all "system-controller", consistently.  Meanwhile syscon_mpmu had
"system-controller" already.

For example:
     syscon_apbc: system-control@d4015000 {
is now:
     syscon_apbc: system-controller@d4015000 {

This looks good to me.  Thanks for updating it.

Reviewed-by: Alex Elder <elder@riscstar.com>

>   arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..85c9730dd082 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -3,6 +3,8 @@
>    * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>    */
>   
> +#include <dt-bindings/clock/spacemit,k1-syscon.h>
> +
>   /dts-v1/;
>   / {
>   	#address-cells = <2>;
> @@ -306,6 +308,36 @@ cluster1_l2_cache: l2-cache1 {
>   		};
>   	};
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
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		interrupt-parent = <&plic>;
> @@ -314,6 +346,17 @@ soc {
>   		dma-noncoherent;
>   		ranges;
>   
> +		syscon_apbc: system-controller@d4015000 {
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
>   		uart0: serial@d4017000 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
>   			reg = <0x0 0xd401e000 0x0 0x400>;
>   		};
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
> +		pll: clock-controller@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-controller@d4282800 {
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
>   		plic: interrupt-controller@e0000000 {
>   			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>   			reg = <0x0 0xe0000000 0x0 0x4000000>;

