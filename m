Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F658214812
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759084211; cv=none; b=eLSs0kfd0AN1lJQafONeVRqZwPzDlpE75x/Sj4Dq/kEwLGKUzblcIavR1OfmEVYM/ztCrP/oEpRd/0hJiiHgRMcwJe+dQ+nLcgDIf7nZFuD1QblwJVG+DFa6ew6y04aj35NTMfSZMrYQt+jrVvIe3edJGce4kptnRY/MGld3f/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759084211; c=relaxed/simple;
	bh=3eo5q8uPvqSYZZQrCPEdKEjFUsm9Zse5NJZnpZyLVxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6eASo6pIxxKJUlSYX1l97yHgqQhjlFZuTvqeJCzkGkQ7ofgKDhlWH/7OblXXyI3FqqiD65j9SXOgxR06qyA8U8XIXv76uJuATTe+mWAhCaLXmcpjXABRIlQHPyrTeyTrXh1g/o7+uK2m9eGOFPKocjH2qT4ZpL9OYwJDd4vdg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1+yQP/Ux; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1+yQP/Ux"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-429a0630be3so9385555ab.1
        for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1759084207; x=1759689007; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OpapXATxcXIHML9Ao38TzaKDugnEtxPRqg0bV0GVyLQ=;
        b=1+yQP/UxW8dfu99HyFrL0WNp8Aiiprpq087E5F8fgmjhFazQfBEVVGxBJ2Zus2zvTj
         jzUTnJu03cWglGyLca3r6uS0jhaEPwrH5IkNd3WuUG1BL89EPyf1iL34tSWijHHBCIs4
         WCS6Npy4c1hL2POOLve6VUbn1FOc3mnhIppM0jlG9lmb2xN7lG+a6snCn3qAkLFJV1Fv
         OFwlfUjOIoQpxUKMfB9/lO8K5zBEKyj8cXB6qw8p+9Lw5fLhyOURPqBsjuAKab35smBB
         Edig0eaCKif10r7ix0i1uQZXYgv1WgD+lD19UKnzGuykOhdRIy6JTGfHm+YXcvD2YFaR
         OS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759084207; x=1759689007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OpapXATxcXIHML9Ao38TzaKDugnEtxPRqg0bV0GVyLQ=;
        b=qEdDajTObSp1ZXiS6WLRkPtq2gnUu1ajSCdDxs/IkC/E7iU3kspSc/IU8MsdmqbsyG
         xZRmEmXeOFgMKmDEuhV6QO7F/t7dQdFt2N4+486PPjBq6240hqzBV8QPGXvvsJrWTDTj
         cYT/XfIs3oO3ZBsK9b1yxSoDe365OuYO+lFbMI2MhhnKzXjalmDMrM22YLBz+n5oIISg
         Yu8INNirM1G/0WIQLqZhZe7BV7mO/3I33rfclKB7T8qV7Hw+9AyOmknJGn3m5CloIfDr
         slIqXbqr+1lbHGEcTkIImVjmdi/Zsy7UuBr0N6KLauLfqkqhWR704EmYjHQVKNsSSmZM
         kekA==
X-Forwarded-Encrypted: i=1; AJvYcCX4ZwMWMlzP8BXyDWKS4jvydpAAbtPpxFkOfK2Luny6R/7xt7LYMZc83Osum6EEVWhuqInahN11yA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzghciLoOn3om0TLRiFS+so17ByhUF2/INj4wuj8eF75Tz52sFO
	y9IpSVHCsBsOQ5ZmSWXw8S0v1XKDuA/qMIxFPTcdZSYS0WWGTv0KnhmNEDGifDLbsgY=
X-Gm-Gg: ASbGncv6exkup3KK1rp1VVH9iMLclhfuB+CVvfuYJBYlm9RPqzmBODxHLvb7bzxUG+K
	GmHLRf9W5Ey+o9TFv2XRYuYxO70KgQt70oXgr/zk2+VUPVIVTtNlW3I8tBbzH0AOOIo7CoAbhNt
	V7Sa3DPQJGcvjr9ScCJP5dUew+pAORb9ilNVmwIcXsfIppe5dkKoq7hjOmogMsElv32IKsodzgn
	0xsCE3zM8sw1nk0fynCP9KMTvgfOh/NPIt36SYdTBX27UcJzaXmQ1Tn317/RPtGfEjgMlsESeyN
	ctlkyb1lV4ZQtKA6Efk/z5pKWF1YXoVDH+orQZEFIVsqtsPeINKEZVeKPkbckOwmQ6Gj29qq1uP
	HbiuFPDIyLGwpmHybC6ToStYQ+UvKU8wywM75I7FxEEB/1v5IQ+l9qSGOUKzmvyQ8NlLwkK6M7P
	HHeIaut48=
X-Google-Smtp-Source: AGHT+IHI+KjtauowHD4Mkl39PSsrUmu2ZtoNYzP3z5aJ+BMT14naCxidriH/P9dmj7elKaDQ4sRm1g==
X-Received: by 2002:a05:6e02:1708:b0:429:a1b7:ee3d with SMTP id e9e14a558f8ab-429a1b7f05dmr57105705ab.2.1759084207162;
        Sun, 28 Sep 2025 11:30:07 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm238767173.2.2025.09.28.11.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 11:30:06 -0700 (PDT)
Message-ID: <127352a1-adc2-4bce-a8ad-ee3eaa111280@riscstar.com>
Date: Sun, 28 Sep 2025 13:30:05 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-3-elder@riscstar.com>
 <20250922230639-GYA1303776@gentoo.org>
 <786f4a5e-f62e-4cd0-a017-7b61408f34aa@riscstar.com>
 <20250928123622-GYA1347020@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250928123622-GYA1347020@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/25 7:36 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 07:49 Tue 23 Sep     , Alex Elder wrote:
>> On 9/22/25 6:06 PM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 11:17 Mon 22 Sep     , Alex Elder wrote:
>>>> This patch introduces the driver for the SPI controller found in the
>>>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>>>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>>>> supports both PIO and DMA mode transfers.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
> ..
>>
>>>> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
>>>> new file mode 100644
>>>> index 0000000000000..2b932d80cc510
>>>> --- /dev/null
>>>> +++ b/drivers/spi/spi-spacemit-k1.c
>>>> @@ -0,0 +1,965 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Support for SpacemiT K1 SPI controller
>>>> + *
>>>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>>>> + * Copyright (c) 2023, spacemit Corporation.
>>>> + */
>>
>> . . .
>>
>>>> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
>>>> +{
>>>> +	struct k1_spi_driver_data *drv_data = dev_id;
>>>> +	bool rx_done;
>>>> +	bool tx_done;
>>>> +	u32 val;
>>>> +
>>>> +	/* Get status and clear pending interrupts */
>>>> +	val = readl(drv_data->base + SSP_STATUS);
>>>> +	writel(val, drv_data->base + SSP_STATUS);
>>>> +
>>>> +	if (!drv_data->message)
>>>> +		return IRQ_NONE;
>>>> +
>>>> +	/* Check for a TX underrun or RX underrun first */
>>> s/RX underrun/RX overrun/
>>
>> OK.
>>
>>>> +	if (val & (SSP_STATUS_TUR | SSP_STATUS_ROR)) {
>>>> +		/* Disable all interrupts on error */
>>>> +		writel(0, drv_data->base + SSP_INT_EN);
>>> should clear status of SSP_STATUS instead of disabling ISR, see commet below
>>
>> The status is cleared immediately after reading, above.  We hold
>> the status value so we can act on the current state of the FIFOs.
>>
> I'm surprised by this, do you mean the status will be cleared by reading?
> can you double checck and prove it? by reading twice and compare?
> 
> while according to the docs - 18.2.4.6 SSSR REGISTERS, the status bits has
> two types:
>    R - Read only
>    R/W1C - Read only, write 1 to clear
> 
> if you're right, then the docs should be fixed.

The code is earlier in that function.  I'll repeat it here.

static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
{
         struct k1_spi_driver_data *drv_data = dev_id;
         bool rx_done;
         bool tx_done;
         u32 val;

         /* Get status and clear pending interrupts */
         val = readl(drv_data->base + SSP_STATUS);

=== Line above reads the status register
=== Next line clears all status bits, acknowledging interrupts

         writel(val, drv_data->base + SSP_STATUS);

         if (!drv_data->message)
                 return IRQ_NONE;

         /* Check for a TX underrun or RX underrun first */
         if (val & (SSP_STATUS_TUR | SSP_STATUS_ROR)) {
                 /* Disable all interrupts on error */
                 writel(0, drv_data->base + SSP_INT_EN);

=== And then the above line disables all interrupts if one of the
     error conditions was shown in the status.

I hope I'm not missing something.  I think you might have
misunderstood what I was referring to by "above" when I said
"The status is cleared immediately after reading, above."

					-Alex
