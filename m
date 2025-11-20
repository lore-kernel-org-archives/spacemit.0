Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF7376BDD
	for <spacemit@lists.linux.dev>; Thu, 20 Nov 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653865; cv=none; b=GxMHhGucti9thRbfB1jA+pJFNcKOO/OdbQt4PIlzERfEVz4keDrOfbm/e3kQSgka61sM6VSI78CAEIxLD/wtNvNsqZGJ2f+7kq16DEYyP0sawobtbK6ePAmuFP1SdGmGEksVfNxsZUeMGbMVhCpEmtKHF2LPTYjklP7hsZxsnRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653865; c=relaxed/simple;
	bh=kbGuukyo5NVuqdwX2FCzLSAFMv2gkrlyNzPgdYI6GCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7yqWWfQgzQWc57uTnrE2SCLNgMXzlVC3fMYqb3yiOO0C0hAqMAD7QG5m/9o0Abf+ftGi5HQeFDBXtKDggFo70fOKg6RapQL0vg0oa50yzG01pYbNBP4iW+cBq/CrfresaaqFiq1C6vEGtr3txRsxI7NoLeOx6tzzR8F9+2DySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GOl5vDzu; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GOl5vDzu"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-43346da8817so5654905ab.0
        for <spacemit@lists.linux.dev>; Thu, 20 Nov 2025 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763653862; x=1764258662; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jVULdmnGJZUzqfCeuMvq76ewKlBDnLfe0I6V5R7xpM=;
        b=GOl5vDzumgg8Qfg5OrfLzAup1Ref2X+FsIJkLAyCwziWBYry4atmQsKEe0TaNkE4n+
         oKTVTN90uQJgizJY8TOWSy/V9y77wCpvWdnHTOjwF90+QESme+hjNWEMbf2eTy6QQi7t
         9v7YCdq/xZf8sgfvPL+Y+IKsvYZuRIruB8gnDLhFGChIagSMyI1NVI26Ge0zAwO4So8C
         qTsdhhjQUgk8slzpkKzo5cpdxjxpK1jMqa/+20GyAFb0xCKKjiiCMwD3s+2FJgiUi9as
         hDQJVnBFL8oNp5dOJg8xwAKd9s5+YYVa2/aM6oMkmAQd4HPKug+G9IQ7rhcMfKjCyJJG
         OhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763653862; x=1764258662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jVULdmnGJZUzqfCeuMvq76ewKlBDnLfe0I6V5R7xpM=;
        b=DWas+7o2u08+W5nk+Dwy0RYd51RD6JFNpsNIia9WuQAZaCGz2e/QeO1PaDVaTUZwjf
         jfvla+p4dVf0AdKMj33ikmjRSetQCZkNbY9ujQa4MtsigMXQ13ndOLb/lx1Rlsij2WHs
         gVcIcedqRehr4cuGcV3cO4ZUPmRBhopzQEL+SkTUOIb95NksxXdn+ai5Fmn1GPOy6P46
         mMsUvAQ0iqnxCxsY+JqFJUX/np5+ctKWJEe7JY45Mznmu02HtSBmIkAcJyxTA0ZBHZw8
         pfJ4aZBQ9vdzLEJVW0dtIrNuNIigB00L2deoCzMO1kX+D5spxNfb6Rgp86kUnmIdEhwA
         2RRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbY67VAB6bN3Cl7BDafXmrh5FKVsLbvFtHuMwYNqAYcS9PRgmNV33HmSmVTakf6vBWGvjVkTk4zA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqdecKiA7/wH04S12spLX51VXL2YodR85ZTFtuO4YDqIak/fn7
	Mcu3d2z5ZErPSUgrZ5Dllm8iI0GDrBQiBZ+XkF53fTuK4Cbl0YVR4ovVMSzoc4l7fgI=
X-Gm-Gg: ASbGncvUWXHMeeMmESmDHReL+KdCaMt2cjc2GTFWmTvwp5PJTCzsgvDuCwgDxWk+72R
	dejh/D4DzYEVL7h/2HvR1u3zhEDQ8QRARmStY6qMi4Ua13yw9IuIlLpWV6ACK1to0y8a8if4FjD
	/dEe4v/M/jlg4e4PtOhLyNkNNdt13D/Rwn5pGvkk5akb7P7iJq8bmw70vy0PVzmQvAC5XHgaM2u
	DNe3UY6HYwhWgiPXRIhbZqadhImbSco0/+SDj0ng8rnQrDfRKDC8IyJEn82PXeXShEmWsHb7vuR
	LyA5kV83j7sDkSONy8d9WZHVYL2h5RT6lUMT+2eKPScdOf4QVXpQVB509tnFWuF/aoU6u7WjROz
	5pxTzVBGBmg3FZm/5ea+cdFKBZIkx19Bvwf/8xlUNiu++YMObmQfe4MfWbVPFhXNs9yzB2eQp5A
	NftdJeuKiCHCb5Z993Wus05f6huNVdcWTi0fI3HYHDWwsVJwZXfg==
X-Google-Smtp-Source: AGHT+IHY73/hmK2ihdGHJpO3Mip0NgdP4MWhJ3aese0GPaKfQ3SvazcDhmEwhbgkWjtEbqE30jfr9w==
X-Received: by 2002:a05:6e02:b46:b0:434:96ea:ff45 with SMTP id e9e14a558f8ab-435aa8ee764mr24969925ab.19.1763653862415;
        Thu, 20 Nov 2025 07:51:02 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949386c3666sm99186439f.17.2025.11.20.07.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 07:51:02 -0800 (PST)
Message-ID: <963990a3-d39c-4e72-8add-02d98f59770a@riscstar.com>
Date: Thu, 20 Nov 2025 09:51:00 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Mark Brown <broonie@kernel.org>
Cc: dlan@gentoo.org, p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251114185745.2838358-1-elder@riscstar.com>
 <20251114185745.2838358-3-elder@riscstar.com> <aRoVqVtYLJJAPCia@sirena.co.uk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aRoVqVtYLJJAPCia@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/25 12:19 PM, Mark Brown wrote:
> On Fri, Nov 14, 2025 at 12:57:43PM -0600, Alex Elder wrote:
> 
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.

Sorry for the delay responding to this.  You provided some really
great feedback and I appreciate it.

> This looks mostly good but there's a bit of open coding that looks like
> the driver could make more use of the core.
> 
>> @@ -0,0 +1,966 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * SpacemiT K1 SPI controller driver
>> + *
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>> + * Copyright (c) 2023, spacemit Corporation.
>> + */
> 
> Please make the entire comment a C++ one so things look more
> intentional.

I do see in drivers/spi/ files that start just like above,
and others that start with all "//" comments (more of the
former than the latter).  I really don't prefer using "//"
for anything but the SPDX ID, but... since you requested
it I will make that change.

>> +static bool k1_spi_map_dma_buffer(struct k1_spi_io *io, size_t len, void *dummy)
>> +{
>> +	struct device *dmadev = io->chan->device->dev;
>> +	unsigned int nents = DIV_ROUND_UP(len, SZ_2K);
>> +	struct sg_table *sgt = &io->sgt;
>> +	void *bufp = io->buf ? : dummy;
>> +	struct scatterlist *sg;
>> +	unsigned int i;
> 
> The SPI core can do DMA mapping for you, the only thing this is doing
> that's unusual is that it's imposing a fixed 2K limit on block sizes.

OK.  I will use the DMA support provided by the core.

> If this limit comes from the DMA controller (which looks to be the case
> since we feed the entire table into the DMA controller at once?) the
> core will already DTRT here, assuming the DMA controller correctly
> advertises this restriction.

I will verify this.

>> +static bool k1_spi_map_dma_buffers(struct k1_spi_driver_data *drv_data)
>> +{
> 
> ...
> 
>> +	/* Don't bother with DMA if we can't do even a single burst */
>> +	if (drv_data->len < dma_burst_size)
>> +		return false;
>> +
>> +	/* We won't use DMA if the transfer is too big, either */
>> +	if (drv_data->len > K1_SPI_MAX_DMA_LEN)
>> +		return false;
> 
> The core has a can_dma() callback for this.
> 
>> +static int k1_spi_transfer_one_message(struct spi_controller *host,
>> +					   struct spi_message *message)
>> +{
> 
> ...
> 
>> +	/* Hold frame low to avoid losing transferred data */
>> +	val = readl(drv_data->base + SSP_TOP_CTRL);
>> +	val |= TOP_HOLD_FRAME_LOW;
>> +	writel(val, drv_data->base + SSP_TOP_CTRL);
> 
> This looks like it should be a set_cs() operation?

I'll implement that, along with using spi_transfer_one_message().

>> +	list_for_each_entry(transfer, &message->transfers, transfer_list) {
>> +		reinit_completion(completion);
>> +
>> +		/* Issue the next transfer */
>> +		if (!k1_spi_transfer_start(drv_data, transfer)) {
>> +			message->status = -EIO;
>> +			break;
>> +		}
>> +
>> +		k1_spi_transfer_wait(drv_data);
>> +
>> +		k1_spi_transfer_end(drv_data, transfer);
> 
> Why not just implement the transfer_one() callback?  This just looks
> like it's duplicating code.

I'm working on this now, and it's the reason for the delay.
Methodically switching things over to the generic interface
has been taking some time, but I think I'm close now.

>> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
>> +{
> 
>> +	/* Get status and clear pending interrupts */
>> +	val = readl(drv_data->base + SSP_STATUS);
>> +	writel(val, drv_data->base + SSP_STATUS);
> 
> This unconditionally acknowledges all interrupts even if we didn't
> handle anything...This is a good observation.

There are only 6 interrupt conditions that get cleared.  Three
are errors, and the other three are read/write FIFO "ready"
interrupts.  The code that follows handles all of those, so
doing this right away was a sort of shorthand.

That said, there was a chance for an early return (if the
message pointer was null), and that should be checked before
we clear the status register.

In any case, my work the last day or so has included a lot
of tweaks to the handler.  I'll try to make it clear what's
done makes sense.

Thank you very much for the review.  I wish I had looked
harder at just using spi_transfer_one_message() before.
But I *love* suggestions that will make the code become
smaller and simpler.

					-Alex

