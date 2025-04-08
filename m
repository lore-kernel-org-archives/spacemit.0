Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820F4253F25
	for <spacemit@lists.linux.dev>; Tue,  8 Apr 2025 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141060; cv=none; b=sO/T9Xgq0jmPSCZGTAJ7aJzM8b4GwepJlkxRMgsLmb8741m8ype0qS2ejMJC5zAAgOHkP2PMZMTRqhz8/LrcQqwf0xE/trkrXuh73QWiDW1ou17xACqmF5AQ14cQb5XGC6ARSzMnToC0sJTaeIZD9RNPxzpdgHvxiadzo0X0Rgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141060; c=relaxed/simple;
	bh=rVKeUcWubqSu6ZsfxRbi7N7hyuMsaoaOHtTFm6Zrf7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7Ts6iy0MzDUGkYBNTamqgN/I/g6+ai8ytoYXL321Fe4W4trE03VUoTbugZ/41EBakvyyy72vnuzHg39uTXGF46tEqM7C6HGfOYVTNER9FAc0fsEYKj2Pkkljr0SWnveQ84ly/IGYLLCsSeOuuuBgnKIrh4A8xV/cu3FfuJ3Mvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BJJGH6Oa; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BJJGH6Oa"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3cfc8772469so28351935ab.3
        for <spacemit@lists.linux.dev>; Tue, 08 Apr 2025 12:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141057; x=1744745857; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RqTCyVarb3HOJMAA+PoO2FMbP6+BrxJ4VIEUqNGh+4=;
        b=BJJGH6Oatzxdy2wCiacYwdbyo1LfFCeWJgN4GJaKOZQDJszMFyVveO5uY15x8DB53g
         UB49XzN4d0DaPHU0Oztum1EPRoxKuDw1goZnb4jZ6/oAUaV4k0ILluPJ84DIsqZFec7S
         K4200AiC5DFk9pSohdfBg/6TWwly+aLhqaJE+/RegNi3BGglaXQjKi1U/sa9PAfivGFx
         dmeG3zDqIM481Vl4CME7girh6/xoosUjnSI0HrxSu/d+gSaySjcYQTXoIQZFF8NzNUwl
         l4+aKhQpaDjLTjV1fTEfqZkepZAUc76k1xRWLZmAI6asRxh0b2toobSnOj8x92tJtj+Z
         wytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141057; x=1744745857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RqTCyVarb3HOJMAA+PoO2FMbP6+BrxJ4VIEUqNGh+4=;
        b=C3+IkwEbnTwIyg5VcVks1mRsFd/EQuIetyms7xak3iZtbab+N9jWE1YUJWltdOJkhl
         abnlmcJfVtJr51X0tc8Qf1n52h/N9Y+IwOWbqCViuCM6DizcX+f0UzjIspM89lqYWRZE
         kHkJtGmOpTlkdF4akxZqU2YoHhETIZjkws50SEgWdKDEqbxSAaSqg36oxuEqGepDySMU
         oRSVC+/0M1Xp2+A2G3qGhN3MKxoa+dPj1/a8KGFRYioVbCLFCRIdsd82X2+f7S3ERj8t
         nJNHYBM8vnJen1pJuVp10gwvo4b0bMBjV8Xo2y0Tlt2fKiBmv/F//bVp9F7njGfTG3Vh
         XUrw==
X-Forwarded-Encrypted: i=1; AJvYcCVqdUxL5QlOUzXqndUIre937cC3SRHgULwqYGAHo4sqkw3gjvp4a5IxxkEbrTnxZBz449aiH7X8Bg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEHoCIjzWxdHdqxw0tylyHgCiQKQZuXvnOSF1x7uwehjz6sUv1
	K6KR83OzvG73UGUfelEd3sjNkHP7skCZIcjuitqCaY1Q8F8esvHqEjOXV0oBOlw=
X-Gm-Gg: ASbGnctfR1OAcBrfi7TgKNfGK/whkDP/hftGFEpdLYHdkw4/dfgRcnRE3QPimLA2IED
	xzw7eyECaGrgs7Gh6to9v0M4TORq/NhiLJNDARq5zY1O6RGRcTXEc2EQZkEX6ZsyUwpzsEKa8fq
	p0ExY+4dEAqZnUq5XUPrjnuwBlCZjD56FWWtwtINtQfwRFY5fHmK4FKJLvC1xtr+yHW6PE71Sbc
	dwB2L8OBTAklqjwAZYD+xUCUHxegJCjB6TuzPKyMM07NWaWb0B4rK+EOI/R+GeKPl57J2hoqdvU
	hi8MmQvW/BfZabYxoEuIh7xAvMrEKhz2OVJA2sk6USr5xuRpczCExcGbpqV4H9CIDaw5CgkyUMI
	vFZh7IBh/
X-Google-Smtp-Source: AGHT+IG7rW/jA34zO9YwR/Uhv4tZyavVt40Io0eZXrFxdcpUtJcFv8zQCXnlCLGlof0n9kin5siP+g==
X-Received: by 2002:a05:6e02:2587:b0:3d5:be65:34ac with SMTP id e9e14a558f8ab-3d776c807acmr2719605ab.2.1744141057452;
        Tue, 08 Apr 2025 12:37:37 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703c0665esm5904485ab.50.2025.04.08.12.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:36 -0700 (PDT)
Message-ID: <e2c5c2c2-61a8-458d-8e95-521c5ea752f9@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:35 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] riscv: defconfig: enable clock controller unit
 support for SpacemiT K1
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
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-7-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-7-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> Clock controller unit, or CCU, generates various clocks frequency for
> peripherals integrated in SpacemiT K1 SoC and is essential for normal
> operation. Let's enable it in defconfig.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>   arch/riscv/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0f7dcbe3c45b..011788d16d93 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -252,6 +252,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
>   CONFIG_CLK_SOPHGO_SG2042_PLL=y
>   CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>   CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
> +CONFIG_SPACEMIT_CCU=y
> +CONFIG_SPACEMIT_K1_CCU=y

Maybe these could be specified with default values that
are based on the value of CONFIG_ARCH_SPACEMIT instead of
forcing them to be defined here?

					-Alex

>   CONFIG_SUN8I_DE2_CCU=m
>   CONFIG_SUN50I_IOMMU=y
>   CONFIG_RPMSG_CHAR=y

