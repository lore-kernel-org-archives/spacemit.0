Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1912FB601
	for <spacemit@lists.linux.dev>; Sat, 20 Sep 2025 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758384004; cv=none; b=Q36A7z/ybvnuCmM4M8cJ/V2nWGPve3wihptpI1coQrY8Zd3pN0WTGHoJrO7ED49PYXxRFyigZuBQTXCOmSFIwXswS9DXXWZD8EWjWMNi79qKCDldAt8QGoUU0d7/GAvIfY6ZQ5SUSVhn6PSlRt4QkQZSSqLWk3SDKTgt41DcbAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758384004; c=relaxed/simple;
	bh=jXP/oScWBYO1Vre2koa+7iI9MhZ+QpEupRNca54lv/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4EtI96MmZ3uaawckNEM7Y0Ow1S50PHbkqQeMIJbnrrmXbqMD/m/7FpX2Ok8vus/2fYF16JcooFaE7jOJK6fOkpoPRAY35iE/TeuDP6CugPOn7wyIuwR2Plfo+GfDn7AiZQuBm8nQp9XMlhV118Fvo2iPJXzlH13EBk5FkBMigc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jCfruRVt; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jCfruRVt"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-4242bb22132so29667545ab.3
        for <spacemit@lists.linux.dev>; Sat, 20 Sep 2025 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758384001; x=1758988801; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6PlODS/te36zEm/c54Mnhcz+Tcquz9ec/vMr/RjPtI=;
        b=jCfruRVtIWoaW0HAX3t4tb3nHRq2/aaC7gPYec/CiVGjgfhS6B4vWTLitS63AoIo7J
         EQKhCS2/HGiAtyHI1ejdaZUMp1RjIsnrPZi6fCeo6qdXAyQPbF9bMMKRbFTgbRxEiJuk
         6C4UQWlPD/cSBX9wWl+krwz8ibbo0eYpzi033etUGe63/m9lTsWFGYw9fXHUqEmj0vmg
         moOaTm8FOAtXt+YydIK9ZIYnphQRBSpZ0hCgDltaLm+pWAc/N0sOm81NfNlFJE8IX/uz
         b8eR5eGFL4JGOKL6qZICeXJpZOBT0k1GF/FVEWL3+/b5FO4W0RzQ4pdhgDcrcxpxYa6K
         Wz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758384001; x=1758988801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6PlODS/te36zEm/c54Mnhcz+Tcquz9ec/vMr/RjPtI=;
        b=IBP8HKsu7saiK4mDETX89FOJlbHIdxzAc/0yRuf2Y8GObOYXXRTUujKL4L3l9QT++A
         qct/CFDTkKjanG5rrxI5Te7WOtuZ4Sc+Apj0ITvoN9jiGeYBw5TosPl83cwLsgwsOjjZ
         s9p4BbnFbxofGR9F39bjlFRFxzy/+oqcL08lzO6u0Uuppo3Umy8JioTwEG5bQ4LRt87g
         dm/+GvXndJATN/C/vuGiar3VCoSkH+wpBTknFAcb9XHZLh4HOrgFbuknmMApWyrJgZdX
         fsYeG6EgAfKRiwBjYghOFWajHV5YPe5h6Scp3CFd5KO/mQUNM9ZL3Qws5JT91NCkp4F8
         DKwA==
X-Forwarded-Encrypted: i=1; AJvYcCVME7IydMQ7qmiBX8dCSf+WXjxeO3+jZyDSb0Zw/436kW9BBwH1+yBHPb3645qt5rey1U49C8043w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq0APP7IzQzaSNRvU/URHhhdI4QEeF2Ww70gTVaZvum0gpj4ul
	UGGW0IgzvCqAV2LPf4NHrNkhvq3Wrt9RB6cbBffHZzmMXhNAG6s13aOdvX763lt4gxI=
X-Gm-Gg: ASbGnct7VHi2U2PDBPFJACBgcrrMPBcj5+XY/ttLHS6VyBMz26g22Wsk09LhYbJPcd8
	aXfDTfSXLktr++WZWB+lWLup8fNyrcXnH8Vv+0hblAlEeOMKIaBl4kGcuZ1/lTzRkkGREzJyoGp
	TqUw8z7R9okuVN4geggDMSpSyCIFZaLS5IcLEEgNoLyPe1tSr9aCxVbkeCdqXw+bdwP9FaNgtF6
	m2ULRwMmN5uya1u+M9rOY6+EjRSMJLtNErU5fIDEF7Ef7JaY3oua4GXBbhIRBAmRDNRXMNYUtK0
	xO3V63s19ZRGYx8u9gTu1cucNnBOmpGQNxmaeMRwQ6lXA2tWHvcW7IxwwlfPAwZ8bYW0uRYCtlL
	IGm4MhTrF7CsoQ+gONUmaC1BB+/quq8KklwjSZX+TMX8JG0z3cqvuvb0MhVIJfw==
X-Google-Smtp-Source: AGHT+IEYudR+gY4osM7EXsgeTUGXkWk8dyLDUfBMwlEzSHDNS9I9DR2PejT5vWtn2160i7yeUhZThw==
X-Received: by 2002:a05:6e02:481c:b0:424:85b0:e1cb with SMTP id e9e14a558f8ab-42485b0e39amr80339845ab.31.1758384001381;
        Sat, 20 Sep 2025 09:00:01 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d5399014dsm3493825173.59.2025.09.20.08.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 09:00:00 -0700 (PDT)
Message-ID: <3c9aaa62-f685-47f7-a21c-00f51550f185@riscstar.com>
Date: Sat, 20 Sep 2025 10:59:58 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Vivian Wang <wangruikang@iscas.ac.cn>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-3-elder@riscstar.com>
 <a7070f3f-8857-4834-9e9e-02068637075c@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a7070f3f-8857-4834-9e9e-02068637075c@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/25 10:52 PM, Vivian Wang wrote:
> Hi Alex,
> 
> On 9/19/25 23:59, Alex Elder wrote:
>> [...]
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 82fa5eb3b8684..4f6c446c6bc16 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -1071,6 +1071,14 @@ config SPI_SG2044_NOR
>>   	  also supporting 3Byte address devices and 4Byte address
>>   	  devices.
>>   
>> +config SPI_SPACEMIT_K1
>> +	tristate "K1 SPI Controller"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on OF
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enable support for the SpacemiT K1 SPI controller.
>> +
> 
> We could still add:
> 
> 	imply MMP_PDMA if ARCH_SPACEMIT

I have never used "imply", I guess it's new (as of 2016)...

This sounds like a good suggestion.  This would mean MMP_PDMA
would by default take the same value as SPI_SPACEMIT_K1 (if
the former's dependencies were met), while allowing it to be
deselected for the configuration.
  > To add a "recommended" dependency. This way, enabling SPI_SPACEMIT_K1
> automatically enables MMP_PDMA, but if the user is willing to fiddle
> around, they can explicitly disable it. What do you think?

I like it.

>>   config SPI_SPRD
>>   	tristate "Spreadtrum SPI controller"
>>   	depends on ARCH_SPRD || COMPILE_TEST
>>
>> [...]
>>
>> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
>> new file mode 100644
>> index 0000000000000..8d564fe6c4303
>> --- /dev/null
>> +++ b/drivers/spi/spi-spacemit-k1.c
>> @@ -0,0 +1,968 @@
>>
>> [...]
>>
>> +static void k1_spi_read_word(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct k1_spi_io *rx = &drv_data->rx;
>> +	u32 bytes = drv_data->bytes;
>> +	u32 val;
>> +
>> +	val = readl(drv_data->base + SSP_DATAR);
>> +	rx->resid -= bytes;
>> +
>> +	if (!rx->buf)
>> +		return;	/* Null reader: discard the data */
>> +
>> +	if (bytes == 1)
>> +		*(u8 *)rx->buf = val;
>> +	else if (bytes == 1)
> 
> Typo? else if (bytes == 2)

Wow.  Yes that is an error that I'll correct.

>> +		*(u16 *)rx->buf = val;
>> +	else
>> +		*(u32 *)rx->buf = val;
> 
> Maybe
> 
> 	else if (bytes == 4)
> 		*(u32 *)rx->buf = val;
> 	else
> 		WARN_ON_ONCE(1);

The value of bytes will be 1, 2, or 4, which we can tell
by inspection.  At one time I had a switch statement with
a default, but I decided to leave out the default, which
won't happen.

> Just to make the pattern consistent? Same for k1_spi_write_word.

Consistent with what?

>> +	rx->buf += bytes;
>> +}
>>
>> [...]
>>
>> +static int k1_spi_dma_setup(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct device *dev = drv_data->dev;
>> +	int rx_ret;
>> +	int tx_ret;
>> +
>> +	/* We must get both DMA channels, or neither of them */
>> +	rx_ret = k1_spi_dma_setup_io(drv_data, true);
>> +	if (rx_ret == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>> +
>> +	tx_ret = k1_spi_dma_setup_io(drv_data, false);
>> +
>> +	/* If neither is specified, we don't use DMA */
>> +	if (rx_ret == -ENODEV && tx_ret == -ENODEV)
>> +		return 0;
>> +
>> +	if (rx_ret || tx_ret)
>> +		goto err_cleanup;
> 
> This seems a bit convoluted. I'm wondering if all this explicit handling
> really is necessary - if we get an error at probe time, can we just
> return that error and let devres handle the rest? With the special case
> that if we get both -ENODEV then disable DMA.

I agree it seems it should be less complex.

I'm trying to ensure that both channels are set up, or
that neither channel is set up, or that we try again if
we get -EPROBE_DEFER.  And if there's something wrong
with the configuration (only one of TX and RX is set up
successfully), an error occurs.

RX		TX		Result
--		--		------
0		0		0	(DMA)
-ENODEV		-ENODEV		0	(PIO)
-EPROBE_DEFER	(anything)	-EPROBE_DEFER (try again)
(anything)	-EPROBE_DEFER	-EPROBE_DEFER (try again)
0		-ENODEV		-ENODEV	(error, abort probe)
-ENODEV		0		-ENODEV	(error, abort probe)
error		(anything)	error	(error, abort probe)
(anything)	error		error	(error, abort probe)

Finally, if the buffer allocation fails:
0		0		0	(PIO; clean up TX and RX)

Let me think about this.  I'll see if I can find a simpler way
to achieve the above result, relying on devres to clean things
up.  I'd have to change k1_spi_dma_cleanup(), but you might be
right that it could be done more simply.

> k1_spi_dma_cleanup_io seems to handle unmapping and termination of DMA,
> which we... don't need, right?
> 
>> +
>> +	drv_data->dummy = devm_kzalloc(dev, SZ_2K, GFP_KERNEL);
>> +	if (drv_data->dummy)
>> +		return 0;		/* Success! */
>> +
>> +	dev_warn(dev, "error allocating DMA dummy buffer; DMA disabled\n");
> 
> Just return -ENOMEM. If we can't even allocate 2K of buffer, we're
> doomed anyway.

You're generally right, but I don't want my code to assume that.

>> +err_cleanup:
>> +	if (tx_ret) {
>> +		if (tx_ret != -EPROBE_DEFER)
>> +			dev_err(dev, "error requesting DMA TX DMA channel\n");
>> +	} else {
>> +		k1_spi_dma_cleanup_io(drv_data, false);
>> +	}
>> +
>> +	if (rx_ret)
>> +		dev_err(dev, "error requesting DMA RX DMA channel\n");
>> +	else
>> +		k1_spi_dma_cleanup_io(drv_data, true);
>> +
>> +	if (tx_ret == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>> +
>> +	/* Return success if we don't get the dummy buffer; PIO will be used */
>> +
>> +	return rx_ret ? : tx_ret ? : 0;
>> +}
>>
>> [...]
>>
>> +static int devm_k1_spi_dma_setup(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct k1_spi_driver_data **ptr;
>> +	int ret;
>> +
>> +	if (!IS_ENABLED(CONFIG_MMP_PDMA)) {
>> +		dev_warn(drv_data->dev, "DMA not available; using PIO\n");
>> +		return 0;
>> +	}
>> +
> 
> Shouldn't be necessary if we do the "imply" thing in Kconfig.

The messages I provide are based on an assumption that using
DMA is desirable and it will normally be used by this driver.
So if it won't be used, I'd like to provide that information.

On the other hand, I don't issue a warning if neither of
the channels is configured in the DTB.

I'm not going to commit either way on keeping/removing this.
If someone else weighs in I'm open to changing it.

>> [...]
>>
>> +static void k1_spi_host_init(struct k1_spi_driver_data *drv_data)
>> +{
>>
>> [...]
>>
>> +
>> +	ret = of_property_read_u32(np, "spi-max-frequency", &max_speed_hz);
>> +	if (!ret) {
>> +		host->max_speed_hz = clamp(max_speed_hz, K1_SPI_MIN_SPEED_HZ,
>> +					   K1_SPI_MAX_SPEED_HZ);
>> +		if (host->max_speed_hz != max_speed_hz)
>> +			dev_warn(dev, "spi-max-frequency %u out of range, using %u\n",
>> +				max_speed_hz, host->max_speed_hz);
>> +	} else {
>> +		if (ret != -EINVAL)
>> +			dev_warn(dev, "bad spi-max-frequency, using %u\n",
>> +				 K1_SPI_DEFAULT_MAX_SPEED_HZ);
>> +		host->max_speed_hz = K1_SPI_DEFAULT_MAX_SPEED_HZ;
>> +	}
> 
> I think it makes sense to have spi-max-frequency default to
> K1_SPI_DEFAULT_MAX_SPEED_HZ, but if the value is out of range just print
> a message and return an error, to get whoever wrote the bad value to fix it.

These errors just shouldn't happen.  But the way I handle this,
it allows the SPI controller to still be used, even if the
administrator can't really update the DTB.

> This range seems to be fixed by hardware, so, it should also be
> specified in the bindings.

I define the hardware limits here, and enforce
them, in case the bindings specify an out-of-range
value.  Again, this is an error that just shouldn't
occur in practice, but the code is defensive.

Most of your comments really made me think about how
errors are handled.  I appreciate it.

					-Alex

> 
>> +}
>> +
>>
>> [...]
>>
>> +
>> +static int k1_spi_probe(struct platform_device *pdev)
>> +{
>> +	struct k1_spi_driver_data *drv_data;
>> +	struct device *dev = &pdev->dev;
>> +	struct reset_control *reset;
>> +	struct spi_controller *host;
>> +	struct resource *iores;
>> +	struct clk *clk_bus;
>> +	int ret;
>> +
>> +	host = devm_spi_alloc_host(dev, sizeof(*drv_data));
>> +	if (!host)
>> +		return -ENOMEM;
>> +	drv_data = spi_controller_get_devdata(host);
>> +	drv_data->controller = host;
>> +	platform_set_drvdata(pdev, drv_data);
>> +	drv_data->dev = dev;
>> +	init_completion(&drv_data->completion);
>> +
>> +	drv_data->base = devm_platform_get_and_ioremap_resource(pdev, 0,
>> +								&iores);
> 
> Maybe
> 
>      devm_platform_ioremap_resource(pdev, 0);
> 
>> [...]
>>
>> +
>> +MODULE_DESCRIPTION("SpacemiT K1 SPI controller driver");
>> +MODULE_LICENSE("GPL");
> 
> Maybe MODULE_AUTHOR()?
> 
> Vivian "dramforever" Wang
> 

