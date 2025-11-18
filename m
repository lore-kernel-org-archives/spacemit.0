Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26731ED6E
	for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487176; cv=none; b=ezhLvMraSQiONyg3OZKds3RSWQo6h14qOGhfdOVyeo9IDOdGIvCFiCcNArlDN3Km9m//qonXuws81xWfUZDS9YlRWtxOnIMc4pD8Rxbm/TZDWOxt/Fg7Ztun53Swh9hkbQAHDCzRNtOIsnsXmW81UIv2Qq/6XGcez+y8knwfuEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487176; c=relaxed/simple;
	bh=qD0IQfQMQSr3tUmULm2hGqSPctE9/lbgVV0xWzp1kmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4tRQoaoEle163VCYFJQqXhbY7w6ZUABaMgj2T5IjvKUuaAnckiyQI7dtpReyw8QOnnuEdcYcOOQbLNwCkfovff7MWCzttygXAY2FNs2Z89XxoTE7lQSTHWR1eR9+/Q+EkDoJWb6kXC6bT1VZc2+vJ0fQjHjsnu5i92q+Sjp5go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=oCzAPB+c; arc=none smtp.client-ip=209.85.166.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="oCzAPB+c"
Received: by mail-il1-f196.google.com with SMTP id e9e14a558f8ab-433791d45f5so46900705ab.0
        for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 09:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487173; x=1764091973; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1oOiqDzzj9jTgkI2h8Dnql40uqXQIp1HBHBf0WuCieM=;
        b=oCzAPB+ce1scjvKLYX8i0wefUhtbW9CnUIIYO+ztcF8DQOTnYMMN7OLtPTif4wUtF0
         Vurnfyz64FdrSvLMVmRZERreX6LNMztgn7l3vnX4AyuDBuEfr3yU1B7dHgIHYX1j5P3W
         wvvsj49inAF38X8PvQ5cKcPvYs9wFMMA0Eax3Tn4MOqY6O1dJO3H8eRZ17RgBPUEMnDO
         7yT96dgJ5k9jv2/X2MTryoY1iAnjoiSe/OiLYSAm3PQm5OPvzC4FBrVVexEvT/PvmkNb
         kSTqBOm618mjTYihcUs5bEGwubb3HBTEocig+5GhDkFDMhMglwH4xoUwyRck/6b5PQYv
         6DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487173; x=1764091973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oOiqDzzj9jTgkI2h8Dnql40uqXQIp1HBHBf0WuCieM=;
        b=N53841b2IOuSN40x9/5JI4M1qpTgocPX78BmVBCc3mmjOaBINOoozKf51tbYFtLQUc
         VvzhoYmKnnth+k4IxKW2ERuesvVTCuZWfR1P3NcIzEpe5gczRbYbs13ZvHwTsPVzkLcG
         XNDvt684WA+kkAreC4TCIQ/gNRyuuVl7CX6H3gQQNVghXJSmBrcOHoo3KlXLy74fg/zw
         748AmjREoCb2MfgDjsVrYlT1YrumrVliMax55DFEiAW/d6ZCrE0zjJhqAJwyx3NHWXHp
         XSxhhIB9G2QL4rsQPgUQ8bOhQ8I4rtN6xSQ8anyS9Y5lgHvwVFlYLxjdd7hhCiJrzSVy
         Bdpw==
X-Forwarded-Encrypted: i=1; AJvYcCXg48PMoU83TC5CQdMym4c6Xe83Kz+8tqTeRNmuyCJAwHKeYfTNk8GiswcD02oOUmA21ptqsP24Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa7IiWWbjQJsL/vUhXrtcJARmbpFdPjki3BL8qN3/mIE/Ylncl
	uLEwm5JE961gK9wOf4uvE21jLd+4rA6OZwIOsjbyt7njO48q//JbLS0++nGQCp7bHJY=
X-Gm-Gg: ASbGncvl/Vp80iJW0bpZPMcVYEkqeOryCvN3pkCNN0LFrK7NpXKLWhhgYO4PZH2AnDx
	rUAyU1xJHn4plpu4m//K10rfM8lhhcOk4JaITeMRD/rCBAY4E5c509fd6tojjP4UjkTYLzVhvAN
	Y15I1MN9UG/oUv7PETbA7w3xNdYFohqvju3OD3slRpHp0t21T/pE+b5lcWAO71mxkBJ6RtG5JVp
	nVZbFLQc/ggu5y5wVOJ9aIam6LuEqRbnwo8d60RStiSVFEX4QQ0Ss2VA7rqLyqnm5NEB20kHmcw
	PPGtlhZtpNrKqeHrJwQuQjaNT7PS5L526YHER3Hti5vpiVNmW8NzBcKq5GHt/rGUNCHPScIRSY2
	bjeYojFrSt403HbpOytN1uXZ9CBEF9J65WRARgpvVUpTWGgStO+BK0RU340Nm6uPeapyn6hR7PY
	BPUSDLJT9wjlRwlQo/+XAonWAn6G/eWTu4AONgDqw4CE3giPSEpwip77C65uvV
X-Google-Smtp-Source: AGHT+IGahI9DGjaU2urpjYEZBPmSTbQQTgXyf3rdyDOFBmX83/b65vQYd/eGVMJz3IuDl90Wqglj7A==
X-Received: by 2002:a92:c262:0:b0:433:7a5f:9439 with SMTP id e9e14a558f8ab-4348c91de6fmr183399575ab.24.1763487173123;
        Tue, 18 Nov 2025 09:32:53 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:52 -0800 (PST)
Message-ID: <d33f6f1d-ce1d-4670-b7a2-1d086a16945c@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:51 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.
> 
> Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
> in REGULATOR_SPACEMIT_P1 is now redundant.
> 
> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
> ---
>   drivers/regulator/Kconfig | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d84f3d054c59d86d91d859808aa73a3b609d16d0..e2cbbb90500189a1c4282511b8d7141301cae1f0 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1455,9 +1455,8 @@ config REGULATOR_SLG51000
>   config REGULATOR_SPACEMIT_P1
>   	tristate "SpacemiT P1 regulators"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on I2C
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default MFD_SPACEMIT_P1

If possible:

	default m if MFD_SPACEMIT_P1

Acked-by: Alex Elder <elder@riscstar.com>

>   	help
>   	  Enable support for regulators implemented by the SpacemiT P1
>   	  power controller.  The P1 implements 6 high-efficiency buck
> 

