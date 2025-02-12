Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02889282ED
	for <spacemit@lists.linux.dev>; Wed, 12 Feb 2025 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368222; cv=none; b=bH6NSO1goGKb3W0Cj/t+uyeOKIAIhF9mHO37S9pNaJddmXP6t/wK7S3pz2yEc39gCEymcp00y2xLYUD/wkEmxVXNDH1cOQH7PKRJ4bAavr90+1EVpq1NsyjYNEzJQNpNe5cHlNiTRQKknou67XL70a2XkjOzKVOqjHDRLh722Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368222; c=relaxed/simple;
	bh=b578F3G4ksg9uYuuIbDmEdH1PzTG2rkqiAEAgGBywv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Noz55Kh437JubTdlKvg1r8ByX43TIBpjKUvTzjEz3Qn2wQsAJMiSpKKuhct3bSLwLfmm04Igy8pNQs/8dyz5QZkrT8pOX0SBwo78mOtUnDh5syQCJq9R50wIrG1jprvz3brAU7UdD1A4OZY7nLu3W72DbE/vZE6d/E7TO+2SZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TMXX447L; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TMXX447L"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-8553c938af2so94408739f.2
        for <spacemit@lists.linux.dev>; Wed, 12 Feb 2025 05:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1739368219; x=1739973019; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L++QIvyizjU09jC6Ra79XUphzeMezUQZEHB1o4PFgv4=;
        b=TMXX447LTI/WbN6+4/S9NrYGmDrXrV3YmmR30PdikE26jagLCzMbrE7HyxF/pbZfjo
         nW2/CwD7Ouwp4Dlov/JaahtPOjpRBpuMNTQ6ksTS1+pt+SFRv2m8oO1Q8i4UStpd1NTK
         fNJfiXgsW/Yw/9KiWPlzbZab2/5lkdv0/vgYkikXWZtQ5DwyrxAorXsv96Rk2ZV6Ch48
         WBdYY1sB+y3X4xgssjebmG2/dIaYzfoLypNXaosoAMwgpFsxxWyXpSX3mmLacDHDVZRc
         MgDfvyZ7SXO6ytim2OvPdIvKQViiVz/KxWnlS4tvifxTxwYKDEnf0BK9enbBv/vxJtb0
         5vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739368219; x=1739973019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L++QIvyizjU09jC6Ra79XUphzeMezUQZEHB1o4PFgv4=;
        b=w53rZJKYpXPgGSwulD4KNbE2Y8i51JxgkFIS5ybN8YT0z1+o8GcabMlvPRnKSKQyuu
         ZPxdCxacTsqAelOOgnzDT3U8sGOAVWTSBQcOK0F+axMAD4kjwGh2vswQ0ZtOmP1Wwup5
         5RI6hl/vb/ytdfiukyYLOm7VgxyCVKigWREci6MOME6UUpeV3TJuYn5xuFpBVaaPslrP
         u7Ex7hZoj61QHQQJWQ8DMW3o9NZfK6Ota3/Kag+6qRA1eQR/aamDWO2jpnKDEMnGeR0Z
         29e7jcRUwt8DPw1j1gtCR8re3t7rLoL0sMkbJOnbCCMhz4NeFyvKfsoRlgjBkNpgnKF6
         wxiA==
X-Forwarded-Encrypted: i=1; AJvYcCWN6uSQd6W0MPT4XXqbDEOB9ryrc9Eoqod2rgOpf3xUyIQYAUWAY6rfehux/L6Z2RngLlrye72ebQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YybBo6i1qvIDGqWyogEpyzQ0J6WJmyM1pDxdiu/DIzgADqIoMPI
	c9W4krLWtjmh7eszwtT1WFeSTLQTLIXn3Xn3hfHNZO/J+CMYOOlyxeoeP1lix9o=
X-Gm-Gg: ASbGncuAJcOrtzMmSznZ41A2sQZ6GMFPSmJeSeEhM27Fvl+CTP/MsIbExjKqHxYyY+i
	kJq+764NKu8aGKJYj8dycvEwtTkDrLnVPX2IvJuCtOgws+QhobMcQfYK2C+uF20zG3BqmMf+Gxp
	YeTonFgobpND1nRrtV7mp1u3S5kk3CNZ+tn/fQnDnVmWLPu7iqfalrBdt5qUKA2x1jsiYQudbX5
	8KtrY4UnotxZAekAuSlOn54zDcNJVq7gNM1o3tnT24MvcbBapbqX5Nbmkqe14DGHh7ekuayxtXS
	A/Lb8HCr0BYySnVY+nEmnjkrHQkuFa068Z8j/h23kq/XRJCRlDHdL1M=
X-Google-Smtp-Source: AGHT+IGZhne98LVx62ktvxV2QQrzKBPSzDo+6zahs2aSXaoHvmnrhXadwbf8Kww9ZmRSX7qfmJgLgQ==
X-Received: by 2002:a92:c56d:0:b0:3d0:4700:db18 with SMTP id e9e14a558f8ab-3d17c1090damr31382265ab.20.1739368219019;
        Wed, 12 Feb 2025 05:50:19 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d05e96f2cdsm32337095ab.50.2025.02.12.05.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 05:50:18 -0800 (PST)
Message-ID: <b67abe31-5647-4450-b025-2bbacee5fa72@riscstar.com>
Date: Wed, 12 Feb 2025 07:50:17 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
References: <20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/25 2:27 AM, Yixun Lan wrote:
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
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I just tested this version of the patch.  By default
PINCTRL_SPACEMIT_K1 is "y".  But since it's tristate,
perhaps it should be default=m so it's not built in
for everyone.  Yixun I assume the K1 pinctrl driver
actually *works* as a kernel module.

Anyway, I suggest this change to be a module; Conor
should weigh in.  Either way is good for me, and I
have tested both.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.
> ---
> Changes in v2:
> - set default as y
> - Link to v1: https://lore.kernel.org/r/20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org
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
> index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..c18d879274e72df251e0bc82a308603ce23738bd 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
>   	tristate "SpacemiT K1 SoC Pinctrl driver"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on OF
> +	default y
>   	select GENERIC_PINCTRL_GROUPS
>   	select GENERIC_PINMUX_FUNCTIONS
>   	select GENERIC_PINCONF
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> 
> Best regards,

