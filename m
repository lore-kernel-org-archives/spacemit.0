Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815C410D02
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 19:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489576; cv=none; b=IO5Zt8ipUKCNh9RvinEbpOH2z81A2kd3SJ96DOCWZUBBQDUwwpzDuFJxsdSLyn54KBTCw/JfngRzo8FLoByh6FrtHY78o9gEtV2+bwzW1Xhy5B9LZ6ebJPkh+BHU70tigyjMwbLCgNmrDGw5ouazXlNB6HtWltPGc81tcBK5GiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489576; c=relaxed/simple;
	bh=v6/9V/mp+0VaUqiO4OggX9M3nsJ9rsEkbG6fS3iZ24o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNk5TvJTILe6K6kuE01c0rxLUbQT34bPVV5iuCfIxdTrA1WeOfQvvqO3qUWPJv4hqWUbbd+YL7UhOPMkMoftRExZt+YFLM/A7c9Ep3gEcI522eL7/CTfFvMb9k56eYg2ON7XThZKo1yDAoGnXxDZvQ+4TigHdaNqDTE9ZAAvd94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=JG7W5S9d; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="JG7W5S9d"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dbe437b072so87725a34.2
        for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777489573; x=1778094373; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLp77h37TVQdWoQsotndHzDBo5bpvvkPFhWBJBsBzYc=;
        b=JG7W5S9dLVpu5CDdzAtdtIPzWXWBrev2F7IEJbJ9aNrWEvcOdlnXbw9vpFEPAjUFpT
         hoK1pjwx+WSf9cLE82DnN7ayCQ6bTVPccul/kpJw5A3Ge0rx4Yo88bnCg/0vpna1WPt3
         CaVE4fsz95rlJg/XUugyeoq75W6qozWSODUjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489573; x=1778094373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLp77h37TVQdWoQsotndHzDBo5bpvvkPFhWBJBsBzYc=;
        b=J3Ratwx2R6PmO5bDN1a73Ya9Om1FmZuUctPLETxocb/AMvY8m+N2fPN3slWezBAjpu
         bzJ4m3hZJDTtpSPUniskN16EB0BiPVjAeSIbQ2Ktw7D78G9//Qo5Tn++qb0z28LfIu4W
         1Zv912Tpgy3I/Zae9zV+2CWdCHTepdNt/B71Ef2L9ov1puVxPFI0cO2KjbpfMvFsIzDV
         I/dzohk7CF6yPTE5zpW1ODDJUfFVV9EMhJOjaqhco/Ayd7hgS+ThXZuR5QvW8SHFR+05
         gBIJtQ/wCrV2zYVLiefIdWTqFIDxfX1OmKgf6Aayy3DYWG4b4VvPg/RpphS5MjV7hSnp
         ZXgw==
X-Forwarded-Encrypted: i=1; AFNElJ+9Ee2Y51hQKpOsZq3ylXZoEDnyrwt3g5o7pNXjIw2R1nKsgIlM5Emf5zgoXHsMUfOex0dpim6P3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywkl4HrSKmiwz0LBG//1jAIo5SV2xBBzK081kV89/zeU6pjX0wJ
	pWcn/7BsEJQr34POEDEFI5kq/e0l+R47Ioa5LEIRROkor20rh62o9ngGU4bZ6jjoBQ==
X-Gm-Gg: AeBDies9NIoIsw5/BMnHZLCIJJfeNCjqOzHZfMdaztPDQp2tpRaNVk6Gi2PRIsllgal
	Vk7wnhqFIZiHMQew+sjsfHizg5gZCPNhCYtCpkF1qDAOq3aNNmmunbwwWs2VIgBdTMFImi+5B0Q
	5hakgsCbTu3pvaxo5sNuLDkSF3TycOaPlXAQj6WtLOFsmqBGZ+Wmme230zwtXMbXXV2PHMDVwLJ
	O3ykNjhZ0CDLnE8U9pNtD8UGKjOvIsIrjWCX9AtAU0oNg2WhSIqullgadvgrT07vvHz6+XCJrfH
	MLa8HtJRE4upmLU/16cOwt5IwqmKzDreNbEBbsxvYqQzt222l40rDEdSbKF9AquI6pP6JPoXQ0+
	yI6qvTisQ0rLXJ0OcWcbfaKvXJQ/klLFb1A1R9AOAfa+iKD0JyWCuX4COYu6QAJYseQEU15LX63
	gw5L7Ee2z94s4NEEnGGC443lZC/rjwz32g0NiJV0LGeBIj+tTlvfQ4W5GzwEcOzxeXkIS+LZQvQ
	OKJjHg=
X-Received: by 2002:a05:6830:6008:b0:7de:44a5:51ea with SMTP id 46e09a7af769-7deba07072emr31818a34.6.1777489573064;
        Wed, 29 Apr 2026 12:06:13 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7deab9d5b9asm1822657a34.21.2026.04.29.12.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 12:06:12 -0700 (PDT)
Message-ID: <856f4e8d-ff7c-4744-9624-e838c758f009@ieee.org>
Date: Wed, 29 Apr 2026 14:06:11 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Mark Brown <broonie@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>
References: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
 <20260427-spi-spacemit-k1-v9-2-ff753b551302@riscstar.com>
 <ae_8n0I_ORDLib1y@sirena.co.uk>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ae_8n0I_ORDLib1y@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/26 7:17 PM, Mark Brown wrote:
> On Mon, Apr 27, 2026 at 10:01:28PM -0400, Guodong Xu wrote:
> 
>> +static int k1_spi_transfer_one(struct spi_controller *host,
>> +			       struct spi_device *spi,
>> +			       struct spi_transfer *transfer)
>> +{
> 
>> +	/* Record how many words the len bytes represent */
>> +	count = transfer->len / drv_data->bytes;
>> +	drv_data->rx_resid = count;
>> +	drv_data->tx_resid = count;
> 
> This is setting up _resid with a number of words.

Guodong, see below, but I think the above should be:

	drv_data->rx_resid = transfer->len;
	drv_data->tx_resid = transfer->len;

>> +static void k1_spi_write_word(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct spi_transfer *transfer = drv_data->transfer;
>> +	u32 bytes = drv_data->bytes;
>> +	u32 val;
>> +
>> +	if (transfer->tx_buf) {
>> +		const void *buf;
>> +
>> +		buf = transfer->tx_buf + (transfer->len - drv_data->tx_resid);
> 
> This is using _resid as a byte count.  It'll be fine for 8 bits per word
> (which is by far the most common thing).

You're right, this is a really great observation.

The best thing is probably to just have the *_resid symbols
represent bytes.  (Their definitions in the structure say
that as well.)

k1_spi_write_word() decrements tx_resid by the number of
bytes transferred, so that's OK.

But the FIFO handles words, and k1_spi_write() limits the number
of *words* transferred, so the "count" calculation there needs to
take the word size into account.  Something like:

/**/	unsigned int resid_words;
	unsigned int count;

	/* Get the number of open slots in the FIFO; zero means all */
	count = FIELD_GET(SSP_STATUS_TFL, val) ? : K1_SPI_FIFO_SIZE;

	/*	
	 * Limit how much we try to send at a time, to reduce the
	 * chance the other side can overrun our RX FIFO.
	 */
/**/	resid_words = drv_data->tx_resid / drv_data->bytes;
/**/	count = min3(count, K1_SPI_THRESH, resid_words);
	do
		k1_spi_write_word(drv_data);
	while (--count);

	return !drv_data->tx_resid;

And we have the same problem in k1_spi_read().  There you can
probably change this:
     count = min(count, drv_data->rx_resid);
to this
     count = min(count, drv_data->rx_resid / drv_data->bytes);

You'll want to review and test yourself, but scanning through the
code this is what I see.

					-Alex
