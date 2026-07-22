Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE662D6407
	for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722458; cv=none; b=Qu5B/1TVyIbOJe28IaP8err5rcqBtjF6G8hYLflaI1arX3rSaNZ9tJEwLjpal66St1TdFtK7tAh/lG/xBKcmMF6V9j2jEdyykAI2T+If+yak1CPoUSWU0Bbnx4/72pA5ueJRtdPieDG8+RN0nyZ4x4rTzCQqetBPYq+l0kwR9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722458; c=relaxed/simple;
	bh=BNDSL0Nv+QnTOb/BpUOkxBNpTRpd3JVzXhV1IfBtomY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQ0KtmZYxDIFkudjVDHxU3xEc3jsm+HmJcgMzUZ+2WbbVEyat3zzQU9nV3r420zQ9aai8PoVoGwpXqIIruO5RLOTJGssq30/FQSQ9PfvnoDfpBNsuq8eam24c9LMunuaHwd8OHnZW1jsMFTNV0Sliw02wx6pmUwlNKpe0WGCOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=QidWef2i; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="QidWef2i"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c167c58f2so107441371cf.0
        for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1784722455; x=1785327255; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGQC9a0lDQVYs2rzJjXKUgf6ViPQ8mWczj4aICyEJF0=;
        b=QidWef2ijIC4heLVY3nBYq/TEBMD3Hm/awA4BQG+yrLU557QTGBeS2RkH3Lf4lOAgS
         eicz9nE9bWf2KB2jhVj02xDubmC9JO0H9SUZhifTBBwnBBgy0Xmt1bzISMKE9NMFClSK
         tJ0G/jMSj7eCMXoTPrr67F0usrKdfBPVvhMqN1MpC1ippkGI677IxDhaf/mmv3rSM59H
         bvDOQlLL8X75hVcw5TAnrJNMOg6CfX5hns7FVIUPKFiEMed/dQ/bsMnq0e9j0lpaCos1
         HVhxileqk+/bPZNWC9y3guG3DIUuG5KDRtX/j7ELluyKCbdurSosxZZ+QIkRzCznKuEt
         1kCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722455; x=1785327255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGQC9a0lDQVYs2rzJjXKUgf6ViPQ8mWczj4aICyEJF0=;
        b=E0wfODrZRxgGSYZfv2AlpItEy/4vD9FH5L7VHEDI3nyQ53vrwiHKvZ29GYGej4PWGf
         3eM5uT2SKFEG7CXrz/fmdSHyn+Pr3QIJO0xhNCO5/yKQ+Wfwc+hhJJ2xKBrlc6blDUE8
         BLShsI7svp2YetFq6FqB3GtNiT0jf7oC20ObcO1URpzq3HWWYJFVb+VaGyJBgufJwhKV
         maNPhHnJcGXy4Fz43pseYm9pYQEHXrdD6PKGtBtNuMYx4EHzY1LLMDU6ueGCKZpSZHEs
         u6blcTJfVvyu43PqEkWzhv3xw4TKo6vhRwKJSxiYYvIpv5XUt1YM5vAOKdDjSO6Kla7B
         RvQw==
X-Forwarded-Encrypted: i=1; AHgh+Rol0BGS4mX8szJ7nzc8uDv7KKr+EYvn7bu+i2plgD/VOQe8K4MUPtR+qCKEBwnB7RI3su+8tYo8HQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyH9JHbXWDNR2fa480tN6+ynItKNrhoT53c7bHqD5nKDBAuAaPv
	fju3GSiyUQd9WUGROl9lwlGREL8B1UzMW9EAnoEcLiI/AoEy7fpERq0E1HV4mFPutSw=
X-Gm-Gg: AR+sD13uOm0DChd2fbBMmOq8QZIk7KuqWPt+JzCVIwZxume7J0Y5M1TfRXRLOq4XOGE
	I9+ptRinneOluaI8AN+4DW87J9lH23wqp+CE0ZZZAT3IzICY2fBH4JpDzBPSBJKR2Av3sz7hbtu
	I7dlxCsuVf52BhqoeoCyfeqXNQzB3DuctMVpwcjy4FG3dEgQy3G6bsMkojYGBwZufAz3pjg6N8h
	iPraioHz1gC6hpilW9f1vahJ3cZP1xpCuT0oVgZmZlMBj0qUOv/SEqiioRTuI97Dqi7LN43zbf5
	3AOdMw4RQdxF4k34//kwX5SQqWQKKu7d0UnGNchulz3xWBtVEMDiw4qPiD2FzKdtgLsoUP9u/re
	g+bEP9cAU21FdE4/Ym9k/OJkeam6PQjwIV0S5tzflANsk/5Ywkl5JurrrhyvW7j9eMT2TQ/2ldP
	LFFg==
X-Received: by 2002:a05:622a:58cb:b0:51c:19af:6341 with SMTP id d75a77b69052e-5213cbd5495mr205627331cf.36.1784722455297;
        Wed, 22 Jul 2026 05:14:15 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d402caf9sm13896591cf.30.2026.07.22.05.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:14:14 -0700 (PDT)
Message-ID: <3793653d-f06e-4353-968d-ea42200899a5@riscstar.com>
Date: Wed, 22 Jul 2026 07:14:13 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spacemit: prepare both DMA descriptors before
 submitting
To: kr494167@gmail.com, broonie@kernel.org, dlan@kernel.org
Cc: guodong@riscstar.com, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260722034103.12190-1-kr494167@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260722034103.12190-1-kr494167@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 10:41 PM, kr494167@gmail.com wrote:
> From: surendra <kr494167@gmail.com>

Do you have a more complete identity?

> k1_spi_dma_one() currently submits the TX DMA descriptor to the DMA engine
> before preparing the RX DMA descriptor. If preparing the RX descriptor
> subsequently fails, the function jumps to the fallback error path without
> canceling or aborting the already submitted TX DMA descriptor.
> 
> Fix this by preparing both the TX and RX descriptors before submitting
> either of them to the DMA engine.
> 
> Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
> Signed-off-by: surendra <kr494167@gmail.com>

This looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/spi/spi-spacemit-k1.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
> index 215fe66d27b4..96b41b67fcbf 100644
> --- a/drivers/spi/spi-spacemit-k1.c
> +++ b/drivers/spi/spi-spacemit-k1.c
> @@ -278,25 +278,25 @@ static int k1_spi_dma_one(struct spi_controller *host, struct spi_device *spi,
>   			  struct spi_transfer *transfer)
>   {
>   	struct k1_spi_driver_data *drv_data = spi_controller_get_devdata(host);
> -	struct dma_async_tx_descriptor *desc;
> +	struct dma_async_tx_descriptor *txdesc, *rxdesc;
>   	u32 val;
>   
> -	/* Prepare the TX descriptor and submit it */
> -	desc = k1_spi_dma_prep(drv_data, transfer, true);
> -	if (!desc)
> +	/* Prepare the TX descriptor */
> +	txdesc = k1_spi_dma_prep(drv_data, transfer, true);
> +	if (!txdesc)
>   		goto fallback;
> -	dmaengine_submit(desc);
>   
> -	/* Prepare the RX descriptor and submit it */
> -	desc = k1_spi_dma_prep(drv_data, transfer, false);
> -	if (!desc)
> +	/* Prepare the RX descriptor */
> +	rxdesc = k1_spi_dma_prep(drv_data, transfer, false);
> +	if (!rxdesc)
>   		goto fallback;
>   
>   	/* When RX is complete we also know TX has completed */
> -	desc->callback = k1_spi_dma_callback;
> -	desc->callback_param = drv_data;
> +	rxdesc->callback = k1_spi_dma_callback;
> +	rxdesc->callback_param = drv_data;
>   
> -	dmaengine_submit(desc);
> +	dmaengine_submit(txdesc);
> +	dmaengine_submit(rxdesc);
>   
>   	val = readl(drv_data->base + SSP_TOP_CTRL);
>   	val |= TOP_TRAIL;		/* Trailing bytes handled by DMA */

