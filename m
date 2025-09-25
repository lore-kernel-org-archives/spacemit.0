Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B9307492
	for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802629; cv=none; b=LSZkdlbQtw8yncPDWCsv7FyDYtVp4zkI8KzmZ3WjCpgWd/I8dAtJmKD7+7w11V337OblUe1p6RMss8Y0jU81FDL8F5oRmXw7FAWMlo0JpqrHqr5RJjXIYHd2Vj8k4D2vHcp2vtMybXHLauoHMcVGRoMjbNHNmxMLeXNW4S165Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802629; c=relaxed/simple;
	bh=vgomaG/u0thPIen/u5fEAsol9ifdvARTkvcWUS9qze0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GHavQo3JU+jnHqfA97xCHpimvuNGaINPq1NNjZsrLpF96BG4qoh61TOl54OD0f6+MFXkoAhV6t72wmUyRp1jlgMKUXJmnlR9w5Q63kDuUwdZCcFBIx5vQ4hqG9VNoDIHEoYSpbWAua7GZS7zuq4eGLZqlIOoHDF613XVtNuueiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=gF47iwRS; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="gF47iwRS"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-90a0b3ddebeso8402039f.0
        for <spacemit@lists.linux.dev>; Thu, 25 Sep 2025 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802627; x=1759407427; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiMnnhjmKlHUptnM90BucFSlyBtvswCn8MfVq9OViiA=;
        b=gF47iwRS/MbesKKYdEaUCnGKJEpK5zGMnHIf8ahjfHg5Gvhon+wAu1zyaTgm4EYRQl
         CwOD2L1JfsB/vovpPrL/UHm7ectYhnVe5gX1AW0t19/p83Z+Ppeo3aC8ecO4TWgFn4nZ
         +IFReVpF9RUowZQxVkJx8Gx6sbDDPVJDJHEZ2EoFEfADPw7k4jFg8JyDfVIO87pnYWX6
         5b3ZnMiCYXegtFBAOFAuj3Hz9bNYGoOq5volrqtswtQvIVvK/xsj6yOVUkykGsUEXJth
         JbgEibQkoJzateWlkd+FGIoBK6OKu8f6AeCW7LvgtHIgngJ5H9aXnYgwWmvgxkqDwxY5
         sMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802627; x=1759407427;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiMnnhjmKlHUptnM90BucFSlyBtvswCn8MfVq9OViiA=;
        b=XCJ2fjebstVqFgQ503IaIlO+3SBMkM83uLvQcprIHv6zeAfeGiRKol8+PQzo+YxJc0
         2rWW6b9M0h1dPjayE/qDoWRs5js2X9swL3nN1U0rH9Z3zeaMTdTHq+TCBrQDFHFdeX22
         GAjrVTcxfmcGlbLogvqOOqojy+ESLGwCU6pFKVN27zTVeK2r5dTHzokxgq2qNAwsvdXX
         k2GPwYqqZ451oJNBJJYtHm/jgclN7JvcVuwBFT0Na5XEpFcSbtkO9XlpP4gAl/tkQ3o9
         IWu9Lt+H7WBb3NwNxy6fuzMb+GKXD1MzalC1yE2i9F1c+hVlhhHueQsO8uLlTnPtDcnO
         mUuA==
X-Forwarded-Encrypted: i=1; AJvYcCVS9U73K7aAlvoncyLhksWNQEQP1LqYHGjmrUD8qN3WqJbMHUhPUom4dtdhVFy5wiKWdszgtN/e9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgllUrHCQHB/aLWCqpU7aoQviF1OpEwm77utAu1SBHv66jmruT
	xSS8ue8UAu8RwLPqmlsPksZmA578DXPRXX1FCfyuwKqJUo1q78dpS3k1N3Cd14ogvaw=
X-Gm-Gg: ASbGnctT3DVZzwGrPyxxkU/KXPjxZShpYmP3BvKtz2PHJyyHwZHjNU75rqJtyDDT6sW
	et0f+wI05xWdphHieB83LENZ39nqL16ZjFNwfky7A/YwrYZK7xRHJkOmwKqozT+p/1kY655qG7q
	xGauX3GEQVbzhlnnrgzoKYeJqMOykBr05SN6Gx/RUCJBZZ7zqWGey+vX4YRuG3yZgNjv1Or2lEq
	5iJHvmen5SVq1Ndj4b11wCWUbvHnwJsaVEfuQp4dA28r0A0lkJEIHdCQE0+mobzG79snaj0/IVQ
	Fol1Lm4mMU10t/eEHQbKHOZkvlbcez/ZZxicckcESnGyhrNpS6WVlVbpn3wSJ8rr+ZQd/AJHMks
	Ri6U/zxHLAJIMym7zJAH0dRRlS8ol1/CwqbNZpMqrcJ7EPUq6Gly6769NK3XlTQ==
X-Google-Smtp-Source: AGHT+IGchv2CNYxx9JQbC4IeYd/wa2PLkKLFA1ut7JvKUIyUBucm43vFik72ll2XyHQiSOK+veiTDg==
X-Received: by 2002:a05:6e02:1709:b0:424:881b:ca76 with SMTP id e9e14a558f8ab-42595653b06mr40363335ab.22.1758802626788;
        Thu, 25 Sep 2025 05:17:06 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5adfa6sm750664173.58.2025.09.25.05.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:17:06 -0700 (PDT)
Message-ID: <ed0e5d82-040b-4642-8a82-611f6b0a401f@riscstar.com>
Date: Thu, 25 Sep 2025 07:17:04 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] spi: support the SpacemiT K1 SPI controller
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, junhui.liu@pigmoral.tech,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250925120909.2514847-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20250925120909.2514847-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 7:09 AM, Alex Elder wrote:
> This series adds support for the SPI controller found in the SpacemiT
> K1 SoC.  The driver currently supports only master mode.  The controller
> has two 32-entry FIFOs and supports PIO and DMA for transfers.
> 
> Version 4 incorporates changes suggested during review of v3.
> 
>                                          -Alex

Please disregard this message and the one or two
others that got sent with it.  Something went
wrong with my git send-email command and I'm
going to try again.  Sorry.

					-Alex

> 
> This series is available here:
>    https://github.com/riscstar/linux/tree/outgoing/spi-v4
> 
> Between version 3 and version 4 (all suggested by Yixun):
>    - Fixed an underrun/overrun comment error
>    - Renamed a pinctrl node
>    - Formatted dmas and dma-names properties on one line
> 
> Here is version 3 of this series:
>    https://lore.kernel.org/lkml/20250922161717.1590690-1-elder@riscstar.com/
> 
> Between version 2 and version 3:
>    - Add Conor's Acked-by to patch 1
>    - Add Rob's Reviewed-by to patch 1
>    - Added imply_PDMA to the SPI_SPACEMIT_K1 Kconfig option
>    - Fixed a bug pointed out by Vivian (and Troy) in word-sized reads
>    - Added a comment stating we use 1, 2, or 4 bytes per word
>    - Cleaned up DMA channels properly in case of failure setting up
>    - No longer use devm_*() for allocating DMA channels or buffer
>    - Moved the SPI controller into the dma-bus memory region
> 
> Here is version 2 of this series:
>    https://lore.kernel.org/lkml/20250919155914.935608-1-elder@riscstar.com/
> 
> Between version 1 and version 2:
>    - Use enum rather than const for the binding compatible string
>    - Omit the label and status property in the binding example
>    - The spi-spacemit-k1.o make target is now added in sorted order
>    - The SPI_SPACEMIT_K1 config option is added in sorted order
>    - The SPI_SPACEMIT_K1 config does *not* depend on MMP_PDMA,
>      however MMP_PDMA is checked at runtime, and if not enabled,
>      DMA will not be used
>    - Read/modify/writes of registers no longer use an additional
>      "virt" variable to hold the address accessed
>    - The k1_spi_driver_data->ioaddr field has been renamed base
>    - The DMA address for the base address is maintained, rather than
>      saving the DMA address of the data register
>    - The spi-max-frequency property value is now bounds checked
>    - A local variable is now initialized to 0 in k1_spi_write_word()
>    - The driver name is now "k1-spi"
>    - DT aliases are used rather than spacemit,k1-ssp-id for bus number
>    - The order of two pin control properties was changed as requested
>    - Clock names and DMA names are now on one line in the "k1.dtsi"
>    - The interrupts property is used rather than interrupts-extended
>    - The order of two pin control properties was changed as requested
>    - Clock names and DMA names are now on one line in the "k1.dtsi"
>    - The interrupts property is used rather than interrupts-extended
> 
> Here is version 1 of this series:
>    https://lore.kernel.org/lkml/20250917220724.288127-1-elder@riscstar.com/
> 
> Alex Elder (3):
>    dt-bindings: spi: add SpacemiT K1 SPI support
>    spi: spacemit: introduce SpacemiT K1 SPI controller driver
>    riscv: dts: spacemit: define a SPI controller node
> 
>   .../bindings/spi/spacemit,k1-spi.yaml         |  84 ++
>   .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
>   arch/riscv/boot/dts/spacemit/k1.dtsi          |  15 +
>   drivers/spi/Kconfig                           |   9 +
>   drivers/spi/Makefile                          |   1 +
>   drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
>   7 files changed, 1101 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>   create mode 100644 drivers/spi/spi-spacemit-k1.c
> 
> 
> base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781

