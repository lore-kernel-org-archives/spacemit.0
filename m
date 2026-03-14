Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F471CEAA3
	for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497587; cv=none; b=CHqtyIOAh7EaPCDkcYjZBEAFnUUwtPFQgkImVTathRf37Z7wGbSixLvWtmhcxYqa5VrzSaY/TYp/89n9uBBBYxr0hjiRf4FvXkY/DCnbf1OakBamy7h5gKkxGAk8jmcoJ//wLtGAPzlZ3TtgHuFn7SHeEYLCNidbl4DIAEq/ZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497587; c=relaxed/simple;
	bh=dZfizOLvEhwTGQ+F1IZsC1RT3jKpyEuuiwgZF0wBGpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2AZoMa8XUIb2bURn5V7xWX3z6Wj0eQNemN+/UIbKQ82IWyDr1vtyuZYHx2V74acJnysOYKEo3KxpgHPERNsq1W1qxtReq3FCshT/VtOQiWW2UJaL6RNtbyJE4uZj9tgV/0++5kxFviLpPe64OH0EcoTAbrJ82xiAX53rU259Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GQar2P0R; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GQar2P0R"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ca09f2170so3298307d50.1
        for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773497585; x=1774102385; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kb1CjrStBIIzJ9sGHwsiJsF+p3lIqo/Alx3Y+vVcnNg=;
        b=GQar2P0RKNJQ7tbBWvFIcksNCuHFWEKbDp/NYgTkraETdRiWT+RkzrMSazKnrK5vaK
         hFTi3IFu2pNl7ajX66gsIH4N72Jk6ys7kV/8Gn1e11lNt9wI8X8CY/VR5Qe5UsJUVmU9
         kPkOwybrcc+Hcf4u7SfYrPhzWl2HCM3NGlgsL3AsajhuXBvtitIz+OktmrUokszLFD6J
         TOABWHm6pWLzgd7tv2nRQhSccE+kiIocB+AswdZHVDLGlC8OAKIjhemU50+hd3XifGf+
         l+/NUZylLSmPTOuJa3+u7yHIyZ/KVY2BwwfcxQdz94AiuhbqD5tcDuuQzld17j7D7Mca
         HrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773497585; x=1774102385;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1CjrStBIIzJ9sGHwsiJsF+p3lIqo/Alx3Y+vVcnNg=;
        b=jjC+KkcCtTKOkZzqmC9S0ddjXKn1hpVchfIB4YfD45rp7P+b5eOOnANDmZbAbnUd0h
         /+Xx8YEBdj/n9dTb+ZbQhTr2XnRhG2ssROv+ueCWD9PaYytg0IaTQ1juX0q/E3vwlSjJ
         xFF8EIfegtW8h6mN9824ZEIQFzTyq2CYghX47tAX4sJSygLrdAyicyjPGv6Y9MXG540r
         Lbsp1sEGIA0nk0vxSjnVqITWNVZ81ltj2LT/bRkIDkFd7m+kZr4sSUafk2U+vIIzDAGf
         Hl3VtKeQn5fGnfQPacCE8we5LBYNhQqcVObkXmduqMN/za+nTxOBhD+5Fg4GakjUi1Go
         mIaA==
X-Forwarded-Encrypted: i=1; AJvYcCUfwPrJ0siZ3QmrO+dWMjPhx26jcVguC0Py5mevBUWvIHP49bj5Q7u7wZdXO/FQMAdGrfIVQM+L9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYGcUz9G/FEE1ODcRIJavOWqHcSY3IMGWPZ3zE27hxTe514ma9
	4GosaDdmpxXn8YzcbU+VbtFjoiR6xEpLJiwwOadrUorAltPwYnOZ7iNeR8XFlErqEEY=
X-Gm-Gg: ATEYQzwusCcaFJLyJE9CF025Oc12yUsJFDqCeR7P+sJsp/u9jCacNjRsUmj46ByvaTo
	BxCYnGHdr+gjvYvj5m7aDkXBXSmBjv1QVoGDut4eQSR4pc+Y8Zlb0D43fbtu4TVdRn0qSHoTosP
	QmGTJDAYa9udWXAtcLIqZWpEOmnXHZGoSufAjFssfDCfqttMvDd/HTz4wBvI+tF5qQ8kUEK+zrg
	KMKqLh7M/LPcnyeRvzQdpR1YZa/y19ZPsxYAO+gBG8MaZ0OKm6fLpP/jmgu4x/v/ovlY606MjGx
	nnrhQQ4P0NaB7pYcFwd9ptLJhhnKbLWev4VvYVi8hA6T6YD6RAYccIzXlRQVc6/i+3RDsMG7jBZ
	W+l+Ym3cglAmdiuOIxpUQhoL3N+m8GtupfmSzJwFxstdoveh4lOcuDAl9V6/GrEaGJxjfZ2p7hm
	bGRLnAP+FPejOpohyrwT81vDAn7YTJ6Yhlrl2tLcabEOJ4Ei2brxg=
X-Received: by 2002:a53:ee65:0:b0:64d:6193:a752 with SMTP id 956f58d0204a3-64e62fc1f7amr5251930d50.28.1773497584611;
        Sat, 14 Mar 2026 07:13:04 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b39f56sm2709456d50.15.2026.03.14.07.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 07:13:04 -0700 (PDT)
Message-ID: <b885158f-3859-4bfa-96b0-39c274a856cf@sifive.com>
Date: Sat, 14 Mar 2026 09:13:03 -0500
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
 <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>
 <20260314085252-GKB415778@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260314085252-GKB415778@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yixun,

On 2026-03-14 3:52 AM, Yixun Lan wrote:
> On 20:44 Fri 13 Mar     , Samuel Holland wrote:
>> On 2026-03-04 1:36 AM, Yixun Lan wrote:
>>> Add clock support to SpacemiT K3 SoC, the clock tree consist of several
>>> blocks which are APBC, APMU, DCIU, MPUM.
>>>
>>> Signed-off-by: Yixun Lan <dlan@kernel.org>
>>> ---
>>>  arch/riscv/boot/dts/spacemit/k3.dtsi | 75 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 75 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> index b69cf81b5d55..e3d7f3102fd5 100644
>>> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> @@ -4,6 +4,7 @@
>>>   * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
>>>   */
>>>  
>>> +#include <dt-bindings/clock/spacemit,k3-clocks.h>
>>>  #include <dt-bindings/interrupt-controller/irq.h>
>>>  
>>>  /dts-v1/;
>>> @@ -398,6 +399,36 @@ core3 {
>>>  		};
>>>  	};
>>>  
>>> +	clocks {
>>> +		vctcxo_1m: clock-1m {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <1000000>;
>>> +			clock-output-names = "vctcxo_1m";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		vctcxo_24m: clock-24m {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <24000000>;
>>> +			clock-output-names = "vctcxo_24m";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		vctcxo_3m: clock-3m {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <3000000>;
>>> +			clock-output-names = "vctcxo_3m";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		osc_32k: clock-32k {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <32000>;
>>> +			clock-output-names = "osc_32k";
>>> +			#clock-cells = <0>;
>>> +		};
>>
>> Are these clocks provided by SoC or by the board? Usually there's a crystal
>> external to the SoC that provides the root of the clock tree. If these clocks
>> are provided by the board, they (or at least the clock-frequency property)
>> should be in the board DT, not the SoC dtsi.
>>
> It's true, as a quick check, osc_32k provided by P1 PMU, while vctcxo_24m is
> a crystal, vctcxo_1m and vctcxo_3m are also marked as external in the clock
> tree, but I would confirm them later..

In that case, osc_32k should ideally be a reference to the P1 PMU clock
provider, not a fixed-clock. But this may be infeasible if it creates dependency
loops (PMU depends on I2C, I2C depends on clocks, clocks depend on PMU).

> I agree to move them out of SoC dtsi file - k3.dtsi, while due to all boards share
> the same clock topology, what if I creating a k3-clock.dtsi and making it shared 
> between all board dts file? to avoid massive DTS duplication

Yes, it is common practice to create a .dtsi file for things shared among
several boards for a SoC (for example if they are all based on a reference
platform). You may want to name it something more generic if more than just
clocks can be shared (like k3-common.dtsi, compare jh7110-common.dtsi).

>> Also, the /clocks node is out of order.
>>
> I will move osc_32k before vtccxo_1m, assuming it's the problem you
> refered to?

I mean that /clocks sorts alphabetically before /cpus. Your ordering of the
fixed-clocks nodes themselves is fine.

Regards,
Samuel

