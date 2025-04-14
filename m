Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41F28B4FA
	for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654356; cv=none; b=ZjNDDr5iaQ4VU2UiY2n5vevgHaumlxxg0zsJC7Sc/+ANqci6K53DbYcSkBNNgAPymTpHBqh+MWJxr3RJOJzNvqhi1X7QceJEifu1h67tZ5CClIY6LqBxuYDoOzjBZG2LqLIZRDfS5RCuf8tEfc/uO6Ew/okvo6AyPcxlikORyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654356; c=relaxed/simple;
	bh=M88zxHxMuT5Hi+r12Pej1eNGbm2XjVO4O0bNQWtajxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJfcl+ELLm2TgxQ2UI9e4zhO1N0zHWVAmwXKb9kiREra9E/BF895Zmjnr9Z1A+C/HobNMa9gYcvgy+AIJp2hbX4hbLDvBsgqn2ZskNo1TkIJNH/4TbLEDiCMi4GkS1cn9ve7AF0XFnEwJOQr5HBGQVrPuG4DB66YybmIFJS26UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hMWhH0bx; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hMWhH0bx"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b3f92c866so89598439f.3
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744654354; x=1745259154; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uo0iy7MAQ4hbf5+c4Te/phX/shJ7ZZ2Na/tgJWtoOGQ=;
        b=hMWhH0bxBuU/6qJIZZjRpqzUl9p+8dsI/OXybx+R4saMzniZbxMPTOz99RD+aW1lqt
         BX6O1ZHM5Z+6Ud3sQ81npAlDGgwZ3B6eiP0wsrEyHS+dvjpD8OnMYsaii/Oji9CgdI7i
         H/6r40Q3mhbEGinNWZUhyULGTLpFAANhalOaWoic7VAZr/nr9N7HEKn92rqtK+B1d0OA
         RJZ2P8IU4BeJxlgbRJJ3JypSbuPOTQONlWqw1DklLK+IlpK2h4VPuCUup1K9sYY0X59d
         CVVhMCTFuKVJ0elsTg9Dx4INcsa7Dcb9RGpoJL4bZIiaJuIJfhsWNwgHYNJBS9cWfQzs
         g0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654354; x=1745259154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uo0iy7MAQ4hbf5+c4Te/phX/shJ7ZZ2Na/tgJWtoOGQ=;
        b=kSEcmIkVC8ZflbMu8cfQGrgRIZvJM1Hd/xsWPEWiOwAyWLsSrMYs13e9cQaKaCbDlY
         zT3j7HZm+aTnoCwRkvHoZz+o+LGNYNKv7/g/n/LoarOMv8dVMwZTDNvaegOK0uRHt8e8
         acWTMxgqkph5+j7BiHLjDrcGoxnkHh+DLzbstm6WMUxIOhNPPjVjSftq3KH97GTBBjTb
         MbJhXFYS2LnLvl9zVhVf/olwgUHEHjiITizBzLLLagmwSIcmrW0WUifXBj45dfprlNkV
         aNd9CJ1s7lBUG/t6Gb5hjiC+Ul7AYl24ILjRQwndu8hye9EkRsWoetY56YJckGs9K8kP
         t/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU8wyIZJvcBV/K+ia1z7onFkSodH5tn/Udh8XwV36ltdcRkq9kjiiQCr5qKZsS8Yoqj6qo/xAmv8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb3oceNcgz0Ttshl+sFk5IjH6K2iGgO22ciSznuRCA+xhEdCAn
	cBD6GdxL9FSzBQ0lFL7Lczl0o0eVKNbvwvloR+HUnY6AD+N0LAeTlxlcfb4MjRg=
X-Gm-Gg: ASbGncvxLWVcznqZyChScD8aNJJuoIVQN5JP1tH7jIcR1elryTzRlPdV7yOa2xbq/KO
	5em6OJlK+ysjhw9I7nopYqswvj0nfr14KBZX6Nj2l/x/oNyjMt+hoU9u+RjTKcAVBf6IX9pUUGr
	ExF/5HsjNsd8qaGblSRdAudna33nibOFO37fewh1hFl0KtX/PxNJo/16QYKP5DtAnSkoo7w/k4L
	zZcRmkIEWiYbIaMwp1Kz/PDb0rEyYaN5LzYtHmJMAQtdheWTBdSflRafMEI8irS32ahfboKgHVN
	KMfjbDKDkSYF/7hfbqdxpt1K0zf+r3TRZqyORuigxPJdN4vWjrOrDncAb9y2LJKLjNENKGH7gp+
	HpMoM
X-Google-Smtp-Source: AGHT+IEPulg8UQUye+ERWDwcR54kMX3JF3oXHebpwxdb/gMTX99uIyKUf+GhSeeH3MJ9K8PzDd2i+A==
X-Received: by 2002:a05:6602:3890:b0:85b:3e32:9afb with SMTP id ca18e2360f4ac-8617cc00bbamr1642828239f.14.1744654353950;
        Mon, 14 Apr 2025 11:12:33 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165428af3sm219588339f.15.2025.04.14.11.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:12:33 -0700 (PDT)
Message-ID: <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>
Date: Mon, 14 Apr 2025 13:12:32 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] riscv: defconfig: spacemit: enable clock
 controller driver for SpacemiT K1
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
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-8-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250412074423.38517-8-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/25 2:44 AM, Haylen Chu wrote:
> Clock controller unit, or CCU, generates various clocks frequency for
> peripherals integrated in SpacemiT K1 SoC and is essential for normal
> operation. Let's enable it as built-in driver in defconfig.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

I know Inochi wanted this to be "m", but you can see that
SOPHGO sets it to "y".  Meanwhile SIFIVE uses a default
value for its CLK_SIFIVE and CLK_SIFIVE_PRCI config options.

I'm not going to solve this, so I'll just say this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
>   arch/riscv/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3c8e16d71e17..4888529df1d8 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -250,6 +250,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
>   CONFIG_CLK_SOPHGO_SG2042_PLL=y
>   CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>   CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
> +CONFIG_SPACEMIT_CCU=y
> +CONFIG_SPACEMIT_K1_CCU=y
>   CONFIG_SUN8I_DE2_CCU=m
>   CONFIG_SUN50I_IOMMU=y
>   CONFIG_RPMSG_CHAR=y

