Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFF259CA0
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339410; cv=none; b=CALsgnGlX8o21jhCKQ+pWMedcndR/+tAjv2hHUEl/oUyuGIVKkMwppkzyWBfrjz6kSyzSmGOkMtU9qLV3kJTzZaRi6Dhjc32F0QGfQF5oP1QCGyES9rZTSbwD53yzUf0YGAvPB5SI1vUF4arNGOWaMUReYVtLC4SkSt7wXyftKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339410; c=relaxed/simple;
	bh=s56PJFNbAR0+4oVC0BXCzijj2cnK6zrUkEsGzFgWjP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psfLWYojweKLbX3xXjNfciv/Fbd+3RLNt1xgeU6pdlCJ/LH6qffQJB++wKeFJAm0ZAE4pt+SPsNIXYpFvD1y5GiV+I6I0FbCHtY+rAhaF2O/Ug4mFZJUUNmfI9xxMRfDPrZpOm5hiirmfunVgpZt5mWqcsXq3vTIaBxzgymE2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0Ygv+Tbr; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0Ygv+Tbr"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40791b696a2so192484b6e.2
        for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339408; x=1750944208; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/70FnD9tQ+fRiZyRY5r5SMsQadgm6QXv7BQ/o/RrZC4=;
        b=0Ygv+TbrQl5QjbFEsUZrNx6mCNVYETI5Vey/8QB/vjoXU3YuuU77lfWn07Y9o87tPq
         Ifh8LHzAxqUgOacwvsxUsJOU1AW7+4ZYGOF/W0nM3MapY99YF7Z4sv9BxGMp/2rdaIgz
         VTbDimBLWFxbeV60Xbb26xTtM4+H/uoLqp7cb4Aem8I5P7Co+6z2a1lFVgl0bWvxKLg5
         a4SqVUPNEI+AinFe9CUJY8JZVpDN7WHLGC5njlg+ENx111Qkh+WYTVv1BqAzHiP764Vp
         9PCtGVcyh8Kjj9OONUPmFLCm0/HYaJGJR7RwGkYlVWd1+fZZr9u8S20YU+/LUonQL6LY
         0Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339408; x=1750944208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/70FnD9tQ+fRiZyRY5r5SMsQadgm6QXv7BQ/o/RrZC4=;
        b=EwE7FTP8DbZupRt9bfg4BbCf7CC1US36YUdusNOZN95P8YiyV96WLqVMaCbUZIBA8D
         iQcI7MRhjxg7+BlMiZ2JQZFsnMoRevK25e4+pMR9G9fYkywf5PePcgJ/EfV7R89RqTJj
         9DHlj0MLb96tUhqE8WnNsohG2p4Iwf/MPVvvdmki6I8ka2XVyoFz8JyaSxa9dy1Y35kL
         D3d/0vjTEd3wDFpDh+h97OhogbDNmtj2oMfHBP3Qhlqwahfd2WImA7fcmyHzfAJK1SVL
         /izIEqMml9WFhPcDo3ezD0ohGVt65dxwpmysuQffHhrmkmNRIS1SfNoESlh3S0XncuDy
         xv9g==
X-Forwarded-Encrypted: i=1; AJvYcCXc5fJ2Q/NAg8XMEahCC91ykaliNdOYS7P3RWViMEW0N/+BMUusnE2r843yKVJNC12kMtrH7NErsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOWQwixm2I/O5BDVLOsxVz8bJt3wPelc+UKCMzDNhsNm0zsrq6
	/nRFGwhTqc5yhyflP2IpaVqNKr4MAKvncmY7UzJWbBsA7rrFW1vSCOk9JDJBJpbYgd8=
X-Gm-Gg: ASbGnctyAYlndoKnaZLDxYAPhBaMN3KUqGaKrSiDM54govt/faB+PobXw9dQx073VNq
	yhsYE6399zDPBWY/Yu9CHv/l27zSkmNHxeCsd1knOBseCOGbIZkZQtCq4xoUDwZEtcX+IkggRmC
	j6Osycw8+17xlC48r9Fh2MYUW4A6cgxVcN/wJ7JFCxj4dAufBD4T8F5N3M/NcVH25WxA2YMUSqR
	rkdPTxTTNw8STMuaZHj+X37iFiSR277xDNiw6UciiyBXBWzH4IC+H6dv3jOmZl+/dcFEAvsuv2B
	+asHNi1SIXAVdVrdUEJvnsBaeUyLUSifK07xYLLXFQNx1uluziy4XfsF8YKvOO4bYuqXOiomYdl
	gDHFEKKFsMgtXaNWOci19/3BKBQ==
X-Google-Smtp-Source: AGHT+IGVYUqAL7UYn2pwdI0pVBJFm39ZocyoGLl1F6P4Vm48on+LUD6YmdbeE2h0MWfBSEJb6OB1Ew==
X-Received: by 2002:a05:6808:152a:b0:3f9:8b5b:294c with SMTP id 5614622812f47-40a7c23cff7mr13295372b6e.31.1750339408304;
        Thu, 19 Jun 2025 06:23:28 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b8837sm2759463b6e.46.2025.06.19.06.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:27 -0700 (PDT)
Message-ID: <3d8b4025-4e82-4245-8923-b55954894137@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:26 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <4036e3c2-8324-4eeb-9aa8-df1fbe9c7943@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <4036e3c2-8324-4eeb-9aa8-df1fbe9c7943@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 12:46 AM, Vivian Wang wrote:
> On 6/14/25 05:01, Alex Elder wrote:
>> <snip>
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 6fb3768e3d71c..c59ae6cc2dd8d 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
>>   	  Say M here if you want to include support for the Qualcomm RPM as a
>>   	  module. This will build a module called "qcom_rpm".
>>   
>> +config MFD_SPACEMIT_PMIC
>> +	tristate "SpacemiT PMIC"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on I2C && OF
>> +	select MFD_CORE
>> +	select REGMAP_I2C
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  This option enables support for SpacemiT I2C based PMICs.  At
>> +	  this time only the P1 PMIC (used with the K1 SoC) is supported.
>> +
> 
> Module name?
> 
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called spacemit-pmic.

I will add a comment like this to the help text.

> 
>>   config MFD_SPMI_PMIC
>>   	tristate "Qualcomm SPMI PMICs"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>>
>> <snip>
>>
>> +static struct i2c_driver spacemit_pmic_i2c_driver = {
>> +	.driver = {
>> +		.name = "spacemit-pmic",
>> +		.of_match_table = spacemit_pmic_match,
>> +	},
>> +	.probe    = spacemit_pmic_probe,
>> +};
>> +
>> +static int __init spacemit_pmic_init(void)
>> +{
>> +	return i2c_add_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +static void __exit spacemit_pmic_exit(void)
>> +{
>> +	i2c_del_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +module_init(spacemit_pmic_init);
>> +module_exit(spacemit_pmic_exit);
>> +
> 
> module_i2c_driver

You're right.  Thanks for the review.  I also added
MODULE_ALIAS() for this driver, and defined MOD_NAME.

					-Alex
> 
> Regards,
> Vivian "dramforever" Wang
> 
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
> 

