Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F52940B
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 00:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264254; cv=none; b=JCcWY6dbVA9ePcjXoiG4SQVH1uAyzy9trvFNEyz/k8nKG5EhzBBI2KGzwOXD5EQaSYjBTonWq0m/fe/Fh8m0eE1IwDQV4HJ/9ZgPFw74DhCapgha+nzQCd0j+Nrd4AvNusDCfr7iczWjmPlt7kzJ06Ebky6TAeJL5bd6BxSZEiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264254; c=relaxed/simple;
	bh=oBXWaTXlxJXobBTW+QXHPr5R6s0tFE5GXaxWYWcUIRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ab1v4mk7lNrhwC+woEc7CVu9aGw7YwnN0L312a9Qs4maC+4eeDu+Heke7L9sKcs1s3gT0/UMTIalr0xygEWEqiPq3bR0vjF1YY26pIK4lPSPc1H3ve8TCvC5jV35A8bgBjy2rhGynAxcpFSPpO2t7poy771qxSALlokPlZPjZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sPblAfLz; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sPblAfLz"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33255011eafso1553246a91.1
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264251; x=1761869051; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kG8oovmqRaNzTSGBD2RsxBVDQfNgYBWR0ofPiKC/9wo=;
        b=sPblAfLzz+oU5K7g9NDzvTZ73Mm0sExoZxKk2a2LSKtwbj6nCIBF9lMo4UQrxKYF4B
         HsT6i282pcKjnTu/PFf/dlYb76w0sTpDC2NrsBdlkdOMYYZNVmFM1HlwCJPbvYExuI3T
         UT23jZ3PKIRcRbtru1eK397nncPktAfEhe025FP0ObUBkBwX/q5E8J7MDNa3uuEO9+Hk
         sFQ0ng7icUzGmuE9HeT4zFx77LQ+gHD0ykq0CeuESipgxzT/E0o8bAp1tHtgFg4HTfrp
         i6hDv/rTMC0ZNGz1y4gklTIi3hZdUQf2bk2d4jAmTlUQxIDnsnl7loXZIk7Sep0/SHb1
         +EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264251; x=1761869051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kG8oovmqRaNzTSGBD2RsxBVDQfNgYBWR0ofPiKC/9wo=;
        b=Di73jaRvTcsjmuG0VI97EAvjAl9vxUmQZ85GZahvS2hdQA/3VegRwRN19vfvke2DBV
         HgFW809mSXxkQyWXFfelr4C3Wntnq7zhIDr1AacKvwPsqZmyKtpvXXVmIx8H4vVMoJ3O
         j0AmlBtitwoTDYSq7rnaWffQdP9njoNbe/1IHt2HVskZIcXPit6lnj8a/kaAlxNxjYny
         cGilZpOFBrVZzJkhD7pJYorCsL3yYbjhbm+IbEWzugpLIiLKXgiA8AcowtLZJk6zl/H+
         lqX06L5sM7J+UlJHneFEik3c/td+UadKb8Ij6BXFCMJ8soOjxgZPIL8ii9QtEcec78ie
         9HMw==
X-Forwarded-Encrypted: i=1; AJvYcCVMjJfq/DtuanIR0/p+ypJ+FuQFH2sfqxC0EVo34BTGZwkqmyg5Im7ZNQ6Se4WHtH0f9tLcD0UpNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YysThJ+kuWp5XAajfSHOEZVf53/zaSiBkTR0B3GB6QELT6M3Ipt
	LwdwBbd2Nannc5Suc1LUe/Jaof5qx8HknC3XKxUWCS68fUbN1HddlpVTK3Luwi182bs=
X-Gm-Gg: ASbGncuqntm2zOXzl705edsoCRICOZ9hSuK7ippKWzwWyg8POXF4dbuEzLZ0NkOqcue
	viiFYLg4BYkIkq61X92KYKR1LUEjkp+7paaL+YRpSfCKdsWKHUEzIuVK/jtL1O9KPLVsRvR0KYa
	EgGpJ2K867fbzTuJPn9lIKGjLs7Ib0hq708t0AuM8NIeeKVo+yx/rHv8/YIAucZSL++Iz+ZE7EZ
	2kkraqS/qcJMUaXCSXUgbqD5yAiOBjPMsytAi2JyxppMCC8qhoOXCkuD8/tzatQmoCAppv31xxh
	POuEyGTlMqqTamVyFvassq0AUPeyt8STs4ebNWyNHh05UGPoR/3JbposfCBf/T40p/uQ6IUKPa6
	IRhBj0MX+0ceSJFcHtpa/HVAc0jPDxdTIe+6scjjabNmpnjY3WYgKfx8tPSFjCxOVZuu30M5Hax
	71+ObZbbcMat/q5UC6dSABrkidGd5vv0I9ucCAwA==
X-Google-Smtp-Source: AGHT+IHSGU24WurHFEd08HU+CrxqEKTFB2CNJlwi6t/j28NxxvFCPIXZXTfDae9QkSIwWA6BVf5SSA==
X-Received: by 2002:a17:90b:48c6:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33bcf8e95c3mr35479556a91.17.1761264251417;
        Thu, 23 Oct 2025 17:04:11 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:11 -0700 (PDT)
Message-ID: <a43b6ddf-c552-4db8-89cc-49951015161d@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:10 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-6-elder@riscstar.com>
 <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 6:36 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:17PM -0500, Alex Elder wrote:
>> The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
>> clock when changing its rate.  Add a new quirk to indicate that disabling
>> and enabling the clock should be skipped when changing its rate for
>> operations.
> 
> remove "for operations."

OK.

>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - The quirk flag is now named QUADSPI_QUIRK_SKIP_CLK_DISABLE
>>      - The predicate now returns bool and is not inline
>>
>>   drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 1944e63169d36..c21e3804cb032 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -197,6 +197,11 @@
>>    */
>>   #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
>>
>> +/*
>> + * Do not disable the "qspi" clock when changing its rate.
>> + */
>> +#define QUADSPI_QUIRK_SKIP_CLK_DISABLE	BIT(6)
>> +
>>   struct fsl_qspi_devtype_data {
>>   	unsigned int rxfifo;
>>   	unsigned int txfifo;
>> @@ -306,6 +311,11 @@ static bool needs_tdh_setting(struct fsl_qspi *q)
>>   	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
>>   }
>>
>> +static inline bool needs_clk_disable(struct fsl_qspi *q)
> 
> needs_skip_clk_disable()

OK.  I was trying to avoid the double-negative:

     if (!needs_skip_clk_disasble())
	clk_disable...()

But I'll do as you suggest.

Thanks.

					-Alex
> 
> Frank
>> +{
>> +	return !(q->devtype_data->quirks & QUADSPI_QUIRK_SKIP_CLK_DISABLE);
>> +}
>> +
>>   /*
>>    * An IC bug makes it necessary to rearrange the 32-bit data.
>>    * Later chips, such as IMX6SLX, have fixed this bug.
>> @@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
>>   	if (needs_4x_clock(q))
>>   		rate *= 4;
>>
>> -	fsl_qspi_clk_disable_unprep(q);
>> +	if (needs_clk_disable(q))
>> +		fsl_qspi_clk_disable_unprep(q);
>>
>>   	ret = clk_set_rate(q->clk, rate);
>>   	if (ret)
>>   		return;
>>
>> -	ret = fsl_qspi_clk_prep_enable(q);
>> -	if (ret)
>> -		return;
>> +	if (needs_clk_disable(q)) {
>> +		ret = fsl_qspi_clk_prep_enable(q);
>> +		if (ret)
>> +			return;
>> +	}
>>
>>   	q->selected = spi_get_chipselect(spi, 0);
>>
>> --
>> 2.43.0
>>

