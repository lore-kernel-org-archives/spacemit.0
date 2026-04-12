Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72044377541
	for <spacemit@lists.linux.dev>; Sun, 12 Apr 2026 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776003787; cv=none; b=V1/Ule8xALzKaT/dy1nVzma7CBvo2G/S1Vhw8hoBt6YvGcj7tUQF+3SrJGlQ9WDfNcI16KpPIG4Iv2AGNzL23Ncs5sMhDMahAiS6Tp9G2ikx4/MtjTeDFuHFqG+FQYenm9KD0wH8qYHhHc/KHG5pTKKMIKDYeTVJgNV3g652hpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776003787; c=relaxed/simple;
	bh=S9ikXTvQyxclzbgG4oXF+aw5e1JLHj7cOX8GY1x4mx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkRbaS8/O3zpkc9ycr13nGLl/iaD11frbcekxOSTflE2XhsstUHyC4VoLAPHYpVJ0OJ6brmyID/dr3R17Ek7t01AnxoIIRAC2A5Eg97PuWtnLtF4K8JTTRGcaHthWj3pkQt8CCSrV/YmfPPJqtfxFOOk+4cua9F1dlGQPBoc/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=yniygkQJ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="yniygkQJ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8d428da4300so390380985a.3
        for <spacemit@lists.linux.dev>; Sun, 12 Apr 2026 07:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1776003784; x=1776608584; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCwYE0TqPeRH6qXObZKYZ/Hps0Zq2xbI26bnfS8VYZ4=;
        b=yniygkQJdKoRa9ml5dG9eAflV9X4fwRBb7c5x25cpJ2r0/XyyG1EgJ2yF7vviwkbWu
         KceEUTH2lcWQ9I5VKZI2I44y9RAtJ+0aXMlbGxdacgGzr2VtwPyUrnbIKURdzI0KgujU
         o5QsWq9XsFX4zjauwuAXFCbo//7grhxXnZtbqkhUX2tjONRMrJ7DD01qBai+r3C7MRyi
         xax0dZOELauug85rZ1vqLG0MYMoyCoQ0EptGdw2x7kw1vrJz7LoT2L12AUzsCYo7MMtK
         QYd6X8eK8DU5gPpnkXhw4t6+aeu+dEOFhg/ype1ap2uZnSr6FgEfGnfIz1LozZBeGpyy
         vQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003784; x=1776608584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCwYE0TqPeRH6qXObZKYZ/Hps0Zq2xbI26bnfS8VYZ4=;
        b=B/dAdsI+qMsDYVJcQhgnHC2TCPkG0ZAdQxls8OmH/1JiV/vus/i4ivuz8o+90RbO0H
         j616IEF363Bfhu/yEBFa8gIYawLIzoxFZI98pSCkgv5x/a4Id1nEng/Opm2PH6y9CopR
         kXwXZfbaysRic8gqtGFjmpBAqdB2UC3qN0K2rSBpD43kJQ5gGNwjSNXRQCJccELsIHmL
         BOQZ4GJ4lZsSmUD2X0yu+VnyAL5Qk7Ona5fTgX+JzWYOpQYro6H9nf5dsCH2nlzEephe
         OwFS3SJVlqd0wiAgRSaRy8tCHlyVtV7cDtr9GipF6mRGMlhBjYqDZRS3qkWWkbv0vlZJ
         EJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXv2i2UwzMjgZpU+GkPmZA0NXSLtVZ6acHTon+99Ffj2+G0AHbl3u3//+pIiVDuUuaDKD81M7Giw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ0orfctYwNMW8o77pme5u+MmSnUc15jmo/waEhtAO5y0O3ogJ
	c5o3EuZBacTAafpChMMrPPSWA7CDO1ikbonAMD0Dmm0cKp5YASJH7YcwciIpv1lt+vw=
X-Gm-Gg: AeBDietYK3Z0+Sjwh0KW9VDRjPQn/0cJgeQRTjhgKYvNBkZ8AKt2lZmijiagnMK3C/U
	kKPt6rcbysW/9h9xb+8g1aEt8676zwpRwKgWOuCV1J5GxosohjohZwdp1MudWviJqqZ0qfJy4WU
	33FiZHFTqG2i9zkhHVEWfSEM3WHIyb9+GnK8OM/YRF3UZxlzIoKGtv34FhTTjxNAuNYAPoriVLV
	Iw4bAPomqLMzHqzriA3OlUE/rZOrHtUa1VhrAf9dPVTcw8TUkTlVseKGLtfsFxYAwRt1yGXcYmZ
	saWUWmyWXVnCG3VyE42cVh8yXczl4apZ+HMQIQ0Oce7BxCfKdrla21gx8v8wUexsPQpVMgt91Ul
	QyWPP5xSqM9mfR8RJKsYcKAdSnCQCf6JvQJmVmqrZU0DBTdxrUezj6aUmLLHlfSn83j5flvdbp/
	73SEVcK52mvESxv5muVChZIfLry3tgTQuIW66Ehd6WZTwKrND2uNs2lIbb7mwvMqxLfoZZWCArz
	8oJ
X-Received: by 2002:a05:620a:4721:b0:8cf:c30c:ced5 with SMTP id af79cd13be357-8ddcd8ea3cbmr1458489585a.14.1776003784339;
        Sun, 12 Apr 2026 07:23:04 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb9830344sm785313885a.41.2026.04.12.07.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 07:23:03 -0700 (PDT)
Message-ID: <517ed025-40d7-4c3f-9ca3-6c3367c97815@riscstar.com>
Date: Sun, 12 Apr 2026 09:23:01 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Mark Brown <broonie@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
 <20260410-spi-spacemit-k1-v8-2-53ebb48a4146@riscstar.com>
 <adkhJhEQIZHgIQpH@sirena.co.uk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <adkhJhEQIZHgIQpH@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/26 11:11 AM, Mark Brown wrote:
> On Fri, Apr 10, 2026 at 11:04:21PM -0400, Guodong Xu wrote:
>>
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.

Caveat:  I haven't really looked closely at this code for
a few months, but I thought all issues had been addressed.
I was wrong...  Guodong will be addressing your comments but
I wanted to weigh in.

>> +static struct dma_async_tx_descriptor *
>> +k1_spi_dma_prep(struct k1_spi_driver_data *drv_data,
>> +		struct spi_transfer *transfer, bool tx)
>> +{
>> +	phys_addr_t addr = drv_data->base_addr + SSP_DATAR;
>> +	u32 burst_size = K1_SPI_THRESH * drv_data->bytes;
>> +	struct dma_slave_config cfg = { };
>> +	enum dma_transfer_direction dir;
>> +	enum dma_slave_buswidth width;
>> +	struct dma_chan *chan;
>> +	struct sg_table *sgt;
>> +
>> +	width = drv_data->bytes == 1 ? DMA_SLAVE_BUSWIDTH_1_BYTE :
>> +		drv_data->bytes == 2 ? DMA_SLAVE_BUSWIDTH_2_BYTES :
>> +		/* bytes == 4 */       DMA_SLAVE_BUSWIDTH_4_BYTES;
> 
> Please use normal conditional statements (in this case a case statement)
> to keep the code legible.
> 
>> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
>> +{
>> +	struct k1_spi_driver_data *drv_data = dev_id;
>> +	u32 val;
> 
>> +	/* Return immediately if we're not expecting any interrupts */
>> +	if (!drv_data->transfer)
>> +		return IRQ_NONE;
> 
> That does't mean the hardware agrees!

You're right.  We need to clear whatever caused the
interrupt it or we'll keep getting interrupted.  This
obviously didn't happen during testing but thanks for
mentioning this.

>> +	/* Get status and clear pending interrupts; all are handled below */
>> +	val = readl(drv_data->base + SSP_STATUS);
>> +	writel(val, drv_data->base + SSP_STATUS);
> 
> Nothing after here can report IRQ_NONE, even if SSP_STATUS didn't flag
> anything.  I'd just move the checks for transfer to when we're handling
> FIFOs and have the IRQ_NONE report be based on there being something set
> in the ISR.

Sounds good.

>> +	/*
>> +	 * For SPI, bytes are transferred in both directions equally, and
>> +	 * RX always follows TX.  Start by writing if there is anything to
>> +	 * write, then read.  Once there's no more to read, we're done.
>> +	 */
>> +	if (drv_data->tx_resid && (val & SSP_STATUS_TNF)) {
>> +		/* If we finish writing, disable TX interrupts */
>> +		if (k1_spi_write(drv_data, val)) {
>> +			val = SSP_INT_EN_RX | SSP_INT_EN_ERROR;
>> +			writel(val, drv_data->base + SSP_INT_EN);
>> +		}
>> +	}
> 
> This overwrites val...

That's no good.  We need to assign the interrupt status to a
different variable if things are going to be handled this way.

> 
>> +
>> +	/* We're not done unless we've read all that was requested */
>> +	if (drv_data->rx_resid) {
>> +		/* Read more if there FIFO is not empty */
>> +		if (val & SSP_STATUS_RNE)
>> +			if (k1_spi_read(drv_data, val))
>> +				goto done;
> 
> ...so the read won't see that there's data to read and we'll need
> another interrupt.  I would suggest using a more meaingful name for the
> actual interrupt status.

Yes.  I actually think you commented on this before, and I thought
I had addressed it but it's clear I did not.

Thanks for your review.  Sorry for not fixing everything.

					-Alex
