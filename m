Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C497308F2A
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196809; cv=none; b=r2PGP/tEmqqQS+xXlX5OJ6vb99b2bYHMnkOLZh4EGM2Ap52Pz3Ol1rC/kD2iRZ+pUANFdGO3Zmw55DRrgHDdUck6kYWldRKqpQrd3Pi3JGfpyzyC7Wcz+cEJIESSVgGgULWRjwWUZjI4Aha62t9XcLwDQXU9vmCl6EAlv212Wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196809; c=relaxed/simple;
	bh=GMflzAzfPG6U1zOzWU4RjcrfYSa7kAlw9sH+pBQ+zkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArBE8raHlah3mexwi+JqtClOkOoYnHQtIVE4RXV/XkP8xv3cK7jxWDBde1gI+Jjvc0qV/bSv9zgZRzM6ZF0c1kjNpyuFiCNy4VDfoldWEPiWtbLtNFFrkLUE220LYtDzrSFlfrn+kRVvPnjrG4EQISyGiDPmIh+TX7Ql2+vFZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JkxNu/a0; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JkxNu/a0"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-424144fb09cso4464965ab.1
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758196807; x=1758801607; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qhRL1lPN/JJ3TtUo+Jx4GT/xOTZw7lSfANOvM3eSdY=;
        b=JkxNu/a0oJKo0jvrJisPsNIf4B5KiuE00bNsEDPu9QUM3uM1/8h3PQZEPoqxLiucaG
         WvUo9BqX4vjzN/+AtCxR503dzx+B0YUFT48MqUs5pyyNXDk5/TsR8wssP0SnYFsYWgWn
         opctfCJ2AiBHEMuUGyh9UvzKU2JXn6bMzM0Btcv0xy0ag5RetZWh0hLPFY69z5bxlNE1
         jqMsvIWvAeTpqJppwPaMvXTlWpJ6MVIzBwlv8bPOCTmQK0ZZu/r4gsW/AhPY0J0Ycwbu
         vIuBGSHBXO4C+71SBQJr5+J5F/daraSTkWFr+YL2Y//LK0zz7dVPbiTVH2Et+ST8GqCa
         Kwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758196807; x=1758801607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qhRL1lPN/JJ3TtUo+Jx4GT/xOTZw7lSfANOvM3eSdY=;
        b=pmfMwJlKaeuevQBH+AonZ174F8akVibdaL0OqFv4SCuhNu8QtTxWO9LafUPQvhYycc
         mblcxQ1/MWlpj7jkgZ6IEUDuiNvpCN7VOi8y6KWt1SoUNo6ZZ7+TaXr53e1h7EaC1Pvd
         20yOyUfwR9yf+9dFGsYUjVWk6HZuQXBCI/MIZxPgrFEGFQIK58piuZkDrlEeDBc5dQVF
         2lsEvrNYNHZlHFXYhQj0QB4q54FPeKofkFiGizWzi9HRjUmyWVfDhZlRwFVucvKQ11UX
         Jznq5OtihEPHm5K63s9QyTsowCaESGJzkRM+tC3Cb4o8NbgRM8cgzsmHXIsMrpDhTmw0
         iT1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtvBwkGs1p52fsfT3XoswjgAOWd60gqCZZCGb2u1gMLWeoqiI/MwGRa71lX3BTejYUD1SArD7BBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrf76yrrqRChnM27xnrWGM4Wvxv07Mm9YrCODzCQUstWPdl/dz
	LtyijYQ7A42cvCa9EodRDAiWFMoDDzrqifg68LI7Gwo9aWiYOrwujraYrGmTvrT+fI0=
X-Gm-Gg: ASbGncuM2WpC8eA9KSrnqFJc2t+8Q9ZpdWvpkYWlHZ8fdax2vyVVn0flr2EB8tWY7Zn
	NFGDFboahuf0UtU9zsbDlnI4qHmoRbE9IR7x6kSn+GSgRuF0O/1LHFhc49eqBPd/qNN1dUvvHCv
	Syqr1kdP+KcOfmEyVIYA8ERvFmhPJwm889j3iSJydZp6a0UPvSUrxsGwE0pRhT7xYC1efFDlBKN
	YYIsPo5YGJaGuyYgjveLLJCYEI2mxZ5q3nK+fC045bWrZS1R0xu+lFO2GCZbjE4LCH5oyEaBhz7
	kUlIw/nYzkyQ/DwOeh++B+SvPDP8L7SWucONH+75pkA2U+VOrIjkYDu7RrID2UqlSCD3039S8Vx
	i+uLshh/nRS0euR0BAz38+HHdMGEIN7IUQJDBOmpDerxXK/Qld1ViR3cusEASQzYASNMlNjVhrL
	qgV+0PHA==
X-Google-Smtp-Source: AGHT+IFQAoOoSgU3pp/rBPSgXlJVaHY1FXv4zqmRznbRq1wJRwagCo1+JA2yZnbtsBf93bWGJ+FcbA==
X-Received: by 2002:a92:c265:0:b0:424:bec:49f5 with SMTP id e9e14a558f8ab-4241a52891amr66059875ab.15.1758196807090;
        Thu, 18 Sep 2025 05:00:07 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa5dc6sm876180173.47.2025.09.18.05.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 05:00:06 -0700 (PDT)
Message-ID: <95d9b310-7edc-47b1-ba9c-81390e9a8532@riscstar.com>
Date: Thu, 18 Sep 2025 07:00:05 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <4C1E339412373423+aMu5I4jmngaN0rOy@LT-Guozexi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <4C1E339412373423+aMu5I4jmngaN0rOy@LT-Guozexi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 2:47 AM, Troy Mitchell wrote:
> On Wed, Sep 17, 2025 at 05:07:22PM -0500, Alex Elder wrote:
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/Kconfig           |   8 +
>>   drivers/spi/Makefile          |   1 +
>>   drivers/spi/spi-spacemit-k1.c | 985 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 994 insertions(+)
>>   create mode 100644 drivers/spi/spi-spacemit-k1.c
>>
>> +static void k1_spi_remove(struct platform_device *pdev)
>> +{
>> +	struct k1_spi_driver_data *drv_data = platform_get_drvdata(pdev);
>> +
>> +	k1_spi_register_reset(drv_data, false);
>> +}
>> +
>> +static struct platform_driver k1_spi_driver = {
>> +	.driver = {
>> +		.name	= "k1x-spi",

Oh wow I missed that one!  Yes it will be "k1-spi".

Thanks.

					-Alex

> k1x? iis it from vendor driver? please keep k1-spi
> 
>                  - Troy
> 
>> +		.of_match_table = k1_spi_dt_ids,
>> +	},
>> +	.probe = k1_spi_probe,
>> +	.remove = k1_spi_remove,
>> +};
>> +
>> +module_platform_driver(k1_spi_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT K1 SPI controller driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.48.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

