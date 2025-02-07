Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF923C8D8
	for <spacemit@lists.linux.dev>; Fri,  7 Feb 2025 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951229; cv=none; b=TLsJ/3gp0o5P9SGFfkMt+84637sKj7yE6OIHSX71OBgNFSZDxZnx66qNEx+jm2PGap9HNDQ6S9IFs2E9T/Mt8smKl0f9w2VkPHG8l+OgKENGzuI5O3gqZXTNreVISSeX13+4tYkLogfHNrxVsZr4wl8cGIbE303ZxlmwFMCP3bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951229; c=relaxed/simple;
	bh=ebmbm1SA2evPzgRYp3musNvOVbJxxqYQ6sgiHGaC1e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdhbJWrfdqbICFiy3GzuLwo2fux6IbjO+VZ2LYHRwmTB85esKrc2WCNr+iejzz76mCsjHF33a0646AJ7f13B30bEg26cEHU3xrJimQ4PGOiJiq9OFoY4jgmNtp8eIQFh34/dLVszOjL2Fx2+30EaRptGjZNA74NXIoxflJwVpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=m8bPgmqb; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="m8bPgmqb"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3cfeff44d94so6351105ab.0
        for <spacemit@lists.linux.dev>; Fri, 07 Feb 2025 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1738951227; x=1739556027; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMNhNJkx3fFqX0U1Zs6VO58/T6R6XQxl18p8Q1ICoic=;
        b=m8bPgmqb9YrlHSFaqqivDh33mZ+mB1l1jgOe7nmkAnwf2tp5JyLAIM/iOsdu3Uc2wK
         5RyGmlqR/pcmP5lLRwnqMg+etu3uhoqZgE4yWCtV4GMlip5Cl8CpV6yDbY4L0KINMY+T
         FzBZ2bHMfNECr4UNzzUbMGHWkQCJMESMUCYPnNMGl3mJs3fkHUFFkGJCawlU5oj4tcv0
         +InI3Wd0CXs0Ys/NivX/3M4Qdj9MxOVj0oKnVUz1xue8JKQFlhs75BjSaHTQVFIZQvyl
         ajpfUh+yvriNzAEPHj+fGSU1JCsZUOMkpCKgHkhCERwIanSXCDPvPm3Jj/8Lx239wBhe
         A21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951227; x=1739556027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMNhNJkx3fFqX0U1Zs6VO58/T6R6XQxl18p8Q1ICoic=;
        b=ZMdiKa6rOhlLQ8iV/IBX7ynzwnXootfaAJjoX8sQgrDAdPuYs6EuvOx8KO2A/4CaVw
         ke3lp+KRTDw9rkDUmCwx6PUSvp7blkI0y9YtLurmBDA1YF7SAHYlr/2uQlBBhb53y6c0
         cQHt6G7l4Kc2YEYlJ07c70wrasfYCCh+YoJ0M/UkzeAwhYLMY1GadcA93TzYAjIwIh7k
         cDh8UoEluVWpUhKxyGkkExsv/3e/HlfypkfBQT+nhyqkza4MT/mK6rQXfF4pFE2ni92R
         HMvKBOrAHz9IRG0eAyrcrTWSNGHaxtryovsAJK94Dhajtu1lgt5kUJ+SpSA726AwhlrP
         6GzA==
X-Forwarded-Encrypted: i=1; AJvYcCUbY1Tjz7HcCrxAsNcH2mCPvmthkF3ql91bGxb4J1qPgy11OyNUxDVAGDxKH2oe4+f01YClQ0dzqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSAQaW7OCIofG3EhRfHLle3ChJlm6eMtP8cNSyf+neHNr94x/B
	h6X6jIpCtqLXZFn6+Pj3sMOSlQ8u98QDTknTpaGPzHlUsQfVPfuShCe6ZO2P1K9lCxkcj27S9JB
	Ryzg=
X-Gm-Gg: ASbGncv1Q+SKtNSS8BOZ140lLo13PwbT472ZcEsd+VFhpz+6ZAWZjSDJCGU898J3Cr2
	MOt+0OcYEU1Io0KnEmXiv8GodrPPKWsdjpUN213GwDQJJ6BK/Fq+A2ELyxFKUYcv3KuszIz5UkJ
	J40/RAHYRLbcO3NIu0RifEfDf83sK7gJuyXrNzaCj8O9No5uv+fFue4EWeTeeD2e7VHS6e2LSkv
	eqyhOuR059/m5JdNTDSR1LVTLMkGMl8+9r8rMi6wWQqbiPQIelkdrLfTw4bU0M2yfwd1bHVKDHK
	jdwk0rerWqhvxHlwRyQahZBjswvX5MzbjCFEJYYgOJLqiXSdChZqcfw=
X-Google-Smtp-Source: AGHT+IGt1SBRGKsD6WpAiEsXocNvoOHnb4Bn+U0x/Qz/EiAOgMhIEF8/efAO7K9USdddQwvdoBY1EA==
X-Received: by 2002:a05:6e02:20c9:b0:3ce:4b12:fa17 with SMTP id e9e14a558f8ab-3d13df1d891mr32114905ab.19.1738951226514;
        Fri, 07 Feb 2025 10:00:26 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d05e9a0e52sm8627095ab.61.2025.02.07.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 10:00:26 -0800 (PST)
Message-ID: <8c43a1ac-ae57-4e90-a791-3f1eb61b6c70@riscstar.com>
Date: Fri, 7 Feb 2025 12:00:24 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/25 6:11 AM, Yixun Lan wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> so let's enable it by default for this SoC.
> 
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
> 
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.

Thanks Yixun.

Tested-by: Alex Elder <elder@riscstar.com>

> ---
>   arch/riscv/Kconfig.socs          | 1 +
>   drivers/pinctrl/spacemit/Kconfig | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,7 @@ config ARCH_SOPHGO
>   
>   config ARCH_SPACEMIT
>   	bool "SpacemiT SoCs"
> +	select PINCTRL
>   	help
>   	  This enables support for SpacemiT SoC platform hardware.
>   
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
>   	tristate "SpacemiT K1 SoC Pinctrl driver"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on OF
> +	default ARCH_SPACEMIT
>   	select GENERIC_PINCTRL_GROUPS
>   	select GENERIC_PINMUX_FUNCTIONS
>   	select GENERIC_PINCONF
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> 
> Best regards,

