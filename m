Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73482253F3
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707391; cv=none; b=ZgRIONwA7MvfiOunuIE0zPAnYmb3SpJR9+IZa7FDrEtRUm1mvHwyVyOf2j5cA7ORgl4a2hmKQd98w8O31rcaRAN9X+wQBwo5xjkl6UatJq2/l/NS+hKlNbhhOUr7su4u7vXt+NIoeFzhQrobr1TGfIHATGy+HVkflpUWGHqA3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707391; c=relaxed/simple;
	bh=TDGsCti3mPtYzlEBmLlDoOJKGEqKrgzVDiHCOzJhQgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exeS5KCd1+f9MQbgi5MlRt2ZvmG57zHFMqFgclAyjoPvwNEOSub7Sj6kJ53YGAWTb9LTpwUWas4km/zhhMDWLOf3ZJh94uVah5T2caXwUysSe5NsDkZZUkXdQ0uYpP3dcpv3BX7/vBlA+mDrnPl/reLWfCL6/5eHHbCBt6kR33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WWBBnMDA; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WWBBnMDA"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-8647e143f28so76218839f.1
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746707388; x=1747312188; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EchSTz2ixLAWYTB96sLu87zXRfh/aWLsrM0Vf/7G5Gc=;
        b=WWBBnMDAuq9gV2OYbQxVAoN7+28TuQixKp+g4Vm4RpiHtLK3eNraaM7pdJ6sJg0xGD
         jVIxmdb9BokOgf4LlKq8ovtuy0OqLs9G4eK2SBOc45VDRzsNjaoekGf8u+mLuB7z88GV
         p2fhLbS1+QIhkEEwee/jEKZkyZM8d3X5+bswFMy5hXV3t58JoKauiZiFeGvgunTmDMLn
         26n1RLna0KgSbsTgt6uyDnA2Hhaox29vGxXoUQx8l9eTYNo7uexpdUJjaoCdB1NIHdaK
         vPEhqOKk2NP7yZ+TrmE4/u0AZ1OVsYCHmQcQh6ROUk8+eWHIdcY0twkc3lP55Qv89QSp
         wlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707388; x=1747312188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EchSTz2ixLAWYTB96sLu87zXRfh/aWLsrM0Vf/7G5Gc=;
        b=DYIXnrRvnl98jt8W6Zg5H0flyf6Qr431kVYWDu3cRmXKUjvpeJngYpldYLeP0XYZSW
         6FwOp/yfyhbzFJ1R8VOawvX8ddie08sM3a63pl1wdW/do23trcWFJhh072BN2HzrbZ5d
         bgP8ecgyLKFi1NnAqgkdC1yiJVY3rSxHWbesOsD5MmHI6espFolhDwdofGrKdiets+Xb
         59v01BiTlsGZjCH8mVseOJhM9bPPD8sr6eCTECeqOuv9t9D37cbUF2310BNCaW58Hpf7
         mnGnZ6PwToovYx96zBtIvnYSVnbVoY8yHE6G2gVfZXQ+kmaBW/whRcMd2Ddn/DD/1PsS
         MGxg==
X-Forwarded-Encrypted: i=1; AJvYcCW5BCEeCNtKh5eBf97HwXAwXi7eHE9v5Js+042oxYBWobItTwGW9aEDijyKD8VVIlfXB9iE3t29Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6DMWwzdk/KdsWMB2wkZtfGNloJiZYHsytIZUlzuOlwXwcQvUZ
	vfCwZbhULOaqGi6qXRrWL8sG96RJd4XDNAzJzy9GRGUmVrYn3b3lkfdV1+5k6h7cbCvrKfWDtHm
	6
X-Gm-Gg: ASbGncuvWsCptWO0DgJN+t/xCsuvnY7j2/9C3jJ4UKjLy0jjrdfWK1T6hPCxTPLOnJi
	wkdq4rA5dnNbEeL5ol7b3Lg72SRh3GeZr10CPHWhDrYlr43IY87+tbXJdItzN+5bMPAolBDx4de
	poGDz6w2TdYujaY2XSkWafkFRP+k62klO+hfxYbJ5sqVMzxIaJqlBWQveEO4It5snhyhk5jky6C
	/ngy+0AtxwrX8ZPJyaFsMNbbdooeiBqU/YDYqVi42SwFkWsHVX8lobbgYsSmYwqibzIR1tXKxfI
	YVvJwXwtsgujMFb5e7SaEWxFODXzP6GeLmf9q1PqaiTOI/VZZAgEV/Bafx4gVkMB+/VfK2RuLDq
	r5vdY
X-Google-Smtp-Source: AGHT+IF690lf3lW382YdkiJiBkYc8A/KfmHLjKI68D6s9G2Rm2ydeiV8IBPkiN5nxv5k+Txl9dCHlg==
X-Received: by 2002:a05:6602:3413:b0:867:17a6:9fd2 with SMTP id ca18e2360f4ac-8674737348bmr976931039f.9.1746707387766;
        Thu, 08 May 2025 05:29:47 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8cf769sm3129157173.2.2025.05.08.05.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:29:47 -0700 (PDT)
Message-ID: <65bc21e7-d936-492a-b095-4c1469932623@riscstar.com>
Date: Thu, 8 May 2025 07:29:46 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] reset: spacemit: define three more CCUs
To: Philipp Zabel <p.zabel@pengutronix.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-6-elder@riscstar.com>
 <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 4:11 AM, Philipp Zabel wrote:
> On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
>> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
>> Define these resets so they can be used.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++
>>   drivers/reset/spacemit/k1.c   | 54 +++++++++++++++++++++++++++++++++++
>>   include/soc/spacemit/ccu_k1.h | 30 +++++++++++++++++++
>>   3 files changed, 108 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 6b1845e899e5f..bddc83aff23cd 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -939,6 +939,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
>>   	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>>   };
>>   
>> +static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
> 
> The /* No clocks in the RCPU CCU */ comment belongs here, instead of in
> the reset driver.
> 
> I wonder though, if these units have no clocks, why are they called
> CCUs? It doesn't make much sense to me to add their compatibles to the
> ccu-k1 driver only to load the reset aux driver. Why not just add a
> platform driver next to the aux driver in reset-spacemit.ko for these
> three?

In fact, the particular registers involved *do* have fields
to control some clocks, but there is currently no use for
them, so support for them isn't implemented.  The reset
controls in those registers are needed now, however.

I actually first implemented this as a small, separate reset
driver, only to learn late in the process that these other
clocks might be needed someday.

> 
>> +	.reset_name	= "rcpu-reset",
>> +};
>> +
>> +static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
>> +	.reset_name	= "rcpu2-reset",
>> +};
>> +
>> +static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
>> +	.reset_name	= "apbc2-reset",
>> +};
>> +
>>   static int spacemit_ccu_register(struct device *dev,
>>   				 struct regmap *regmap,
>>   				 struct regmap *lock_regmap,
>> @@ -1106,6 +1118,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
>>   		.compatible	= "spacemit,k1-syscon-apmu",
>>   		.data		= &k1_ccu_apmu_data,
>>   	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu",
>> +		.data		= &k1_ccu_rcpu_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu2",
>> +		.data		= &k1_ccu_rcpu2_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-apbc2",
>> +		.data		= &k1_ccu_apbc2_data,
>> +	},
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
>> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
>> index 19a34f151b214..27434a1928261 100644
>> --- a/drivers/reset/spacemit/k1.c
>> +++ b/drivers/reset/spacemit/k1.c
>> @@ -137,6 +137,57 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
>>   	.count		= ARRAY_SIZE(apmu_resets),
>>   };
>>   
>> +static const struct ccu_reset_data rcpu_resets[] = {
>> +	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
>> +	/* No clocks in the RCPU CCU */
> 
> This information is not useful in the reset driver.

Yes, I think this was just copy-pasted from the previous code.
This won't be there in the next version.

					-Alex

> regards
> Philipp

