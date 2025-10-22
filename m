Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B3F2D77E9
	for <spacemit@lists.linux.dev>; Wed, 22 Oct 2025 04:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107672; cv=none; b=fmdK5RGoGfP06th5EO6pQ+5cD0Z6SjV0CcIxELqhrJAPzljid7BmVEyKXC3gfSL1p2asnnb73NpuB29FsyIcFsOXiW7GBexG7WgZ3cABz9mUNbzQBUrdtGx8RrMqGveOLDONlExzdXt0Am6I6r89kM/CZr3cNNdM9ozxEFwHYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107672; c=relaxed/simple;
	bh=Goyx1DuFl/fOnbQXpijC04VlfkeSYrobSs3FUEza79w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJonQq+e2FffK+5CuETD4EGzJLKNWTt3qsW280jkmiDKoEM1ewciGU9kNDC4t/XWmL1XvE5kscmzlrajl5947si3V2MVfcKytQ3T0zCCoO1f6yZjf4Vf38jLIp82HwA2EqidYU8aaoEECV9aRxgwkGZOCZH5C7bt1+ZcWzyCW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=aadsbPYw; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="aadsbPYw"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b6a73db16efso4055571a12.3
        for <spacemit@lists.linux.dev>; Tue, 21 Oct 2025 21:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107670; x=1761712470; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDiGuotIxX46vya9PSPOnNWB7duItx5Jd361PWPn4+w=;
        b=aadsbPYwXD+y9Dieq6ENyYxd8/0hMhCnQgVHrauna/xb5EprpZ8ONV95H/82BXKBE9
         a2iHoRTqHOCsYL9ztkZzt19cr+Kn7T8vq26InKIBfDwyeaw+N3PMzumgvMfNwKwQ68Bl
         wjdIHP2Stwq1MJlp4NxY3Y1JbO7TFBbQTblsVW+YjIuwy9gcAHrilttjs66/2p/ZlPwj
         hNL/bu9iL6nioyCu6QmRMR1+8FN7mX9B35w9Ts4PYEK2a1KrAJkpzbykhnaemZhQ/dj6
         56G63b1J7ac9tT2rmg2bfLUwzy3uRU5PPUBgR3e10rlT64SqyvSFBA1PADS0Ks3taqnN
         0hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107670; x=1761712470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDiGuotIxX46vya9PSPOnNWB7duItx5Jd361PWPn4+w=;
        b=qrKpgnmEEOp4fHcEfkszXu3j7907DOq3ukPSUAnizcIxeRcv7a184J7f39CefCCcgS
         nRhpJ+Rj0eCCuad+XUJ/P5/gPykEskhQdVU2Mk/+Vd3ILx96hyts6n/Kd5sirxbA7aX6
         WDjsPADhnKamfRyLDMY1MpR9BldUdLewpZH5aW5JKpZ924fRokoXP6yb7yhf5Pn2aZ51
         fZmH/cxYaJ7G2azHZzjpqhA1R/SKKNmHSsX4Kdf+v3TY66UNBsw9rESK5OVVPzmvQUEE
         2pnEE4e0WBAMDzZJtO9I7WmfJEynMfQ61T8lPMhQaSv9HHWT9xnNexe1sjSLfK+V8haF
         Gz5A==
X-Forwarded-Encrypted: i=1; AJvYcCWHwDNX5Nz94WF7+WyALOzgXIen8FcN2j+qViZPjqFZ2hnlxKqSjTs2eidmN2lc8lGxkJkgUUQUIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrkXdL8sdfa05BcwzBJMaskQmkxTcE8UDYjb/b2BmlACYQ8B2r
	QPauNWfnQMM6oNfyiUiMNmTyEwoVV3xvPejyLcvQZrEij8YTv0Or5D6/BLlPwH5cbQ0=
X-Gm-Gg: ASbGncuMS/9Y9k6m8E+8LL4wt4NL+vQ6O1/ZFxGvsmhnxBmuBAx15K0+eU+xssVm3CD
	YN3jb1ZuenCRsr0MgftWPW5DKlVTt0POeL6F4aVrWNQxq/uGVb3TnD4bRKjpJE5gGwo2vXHVli4
	xuPR8TEdjQTdIkd8Ifcu6w2DuvgaDPXNEyAXulH27p9LADxQv6PeBcz+aFvPUUbGpwRNZkmA1hw
	UiFjhZK57fMtMvy7m8djYw7+6h4tn2aUN55BsK7DldklQSekYRJP2xMJhwvcs97uCY0n2nGsaox
	WWwC3k6cfXtOiZwVcefLkWB8xAWfhNy/EURn5C7//VyeVPFExofcMLTx9drn44cUimqNrA7DOWS
	FGSUqZNmCtiNYakS32A0hwjK8VLwJYld/yGMT5EmtLFmddMCtjgK1ZL8qIkYuWReU2A0f1YZvZd
	gcSEvWeT4EBqJkrhqbNvahoOJ/7L62zADY2g==
X-Google-Smtp-Source: AGHT+IFAmBZDikILCClmp+7vVKcnj+i3LKl9ZiDVNdmnt9krXWJ4kKo97aK6dBcsuheQDKRB7IIDbw==
X-Received: by 2002:a17:902:e784:b0:292:39b4:e785 with SMTP id d9443c01a7336-29239b4e9cemr216223575ad.26.1761107669783;
        Tue, 21 Oct 2025 21:34:29 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:29 -0700 (PDT)
Message-ID: <91bd83c0-c721-41aa-9716-a750b73c7e41@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:28 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] spi: fsl-qspi: support the SpacemiT K1 SoC
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-7-elder@riscstar.com>
 <aPaML32I0Ao1xhpX@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaML32I0Ao1xhpX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 2:23 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:49AM -0500, Alex Elder wrote:
>> Allow the SPI_FSL_QUADSPI Kconfig option to be selected if
>> ARCH_SPACEMIT enabled.
>>
>> Add support for the SpacemiT K1 SoC in the Freescale QSPI driver
>> by defining the device type data for its QSPI implementation.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/Kconfig        |  3 ++-
>>   drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 4d8f00c850c14..2e3d8bd06ceb2 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
>>
>>   config SPI_FSL_QUADSPI
>>   	tristate "Freescale QSPI controller"
>> -	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
>> +	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
>> +			ARCH_SPACEMIT || COMPILE_TEST
> 		   ^
> 		   align to here

OK.  I was mimicking what I saw on the only other instances of
a continued line in the file, SPI_BCM_QSPI.

					-Alex

> 
> Frank
> 
>>   	depends on HAS_IOMEM
>>   	help
>>   	  This enables support for the Quad SPI controller in master mode.
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 9ecb756b33dba..f4f9cf127d3fe 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -267,6 +267,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
>>   	.little_endian = true,
>>   };
>>
>> +static const struct fsl_qspi_devtype_data spacemit_k1_data = {
>> +	.rxfifo = SZ_128,
>> +	.txfifo = SZ_256,
>> +	.ahb_buf_size = SZ_512,
>> +	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
>> +	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_NO_CLK_DISABLE,
>> +	.little_endian = true,
>> +};
>> +
>>   struct fsl_qspi {
>>   	void __iomem *iobase;
>>   	void __iomem *ahb_addr;
>> @@ -998,6 +1007,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
>>   	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
>>   	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
>>   	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
>> +	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
>> --
>> 2.48.1
>>

