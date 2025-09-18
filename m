Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34D354673
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206853; cv=none; b=RDnn2MSOZCvGgFQ1fBi1V2+LTyyAopbLCUZOsi58L3BojHCUOkaKiRcvuZSGkH62c8UXzbAT83cPqu4ovbMmhBjeHB0FXHMK8o3qm/qu13dPAQw0eEV2l6wMfw+q8SKZAnIxnswnWMS0x1qarElwCgXuLKB10ZnnGyxdEbKlCGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206853; c=relaxed/simple;
	bh=akaRzKCQx78YkRPr4p40L/GyehZvgbPiD0PCPnmsSFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVu450WarFaaEbCVHJ/39CF2l/hpM/hYME3+ETlrePPkL7BcfXTv0UM9vitEpFJH+ARG6qMLXHQLWjsQGDGqGgB/vVlF6ilHns0EwFtffYN1LjkAdcQ6m2lTk02TryH1VQ0Rjs8Y3r1d+PdAKLg3MyHGi3QXmNDQlTi80JdUQl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pznSkqDq; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pznSkqDq"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-423394b393eso4450205ab.1
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758206851; x=1758811651; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAKrVBT0TdCvSecGbjneeeJlKJ2CfD2yiQLwxahqo/M=;
        b=pznSkqDqhF5o/ioirbqhB6+V5bfq9nL6RXdOv663Vg8QsEm4xzyXZC4tOOjno2nA3+
         nWRN4Fpd7rzLn9TJhLre7g/7BLSWI1fQ6z3JUYZgzby9s2v9QLaCkGclT/0F2imrvHfo
         ibRAHyfOCz1SNHxMIPTDVlFOiIyjliBie5XZh+uJlmUOJlVemHuwiGvu2SHJRD7hFrL+
         9TDs5qTS934GJclbkyV/qrQX761JrBnXEbCX1j49vBqkBMruiHuBWgx6gQM3NVRrcmIc
         B/siWGrMfNEAWcVtflA63en2OqdyZuaW6ItCgXv6puoY5QHbQML/VSE0C4fH8vIVDgFL
         wC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206851; x=1758811651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAKrVBT0TdCvSecGbjneeeJlKJ2CfD2yiQLwxahqo/M=;
        b=FsBakBu5Hwav5fCzyS8w3+XfHBGo8IEaD75dAJ+qEX275Z9/2qY7+ATtSBAwa/zOwg
         36h6NnvZhcP1AXJ9ipeJF4UQPbrcmhl8l4NvXNSZy4PjZ1MzS10UlKrISG1i9R9BJUbJ
         8i19j/p5Cy9a4DaZv1DkIFOJgsOFqdppH7AnAZDOG2nfThYxXrYMKQY9xTJ57BTUT7za
         hKPMiBJGAsoGkpv58XRHS0q3H+gsAoZGKvxzI3vW6++y+sWJZQUDBQ0G804g0OPZL5CZ
         V/5vtftT/uZVDJJfQ2AziGxPhoKYNWvdzrhaeE3vFPQu3VXM6+zgnZ0GT3Y1mE3E1rK2
         WSrw==
X-Forwarded-Encrypted: i=1; AJvYcCWlqreU9e1Lljdj+gPMoQ1BOEZbwYwPAVNROGzKRNF0073aE77IRrqVdUU9XScsqC0fFqDz33PO9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzpYd7bDBjJo63RRtqYf+cZuVAuVbPuilY0KXPK7mtVAze3m6u
	66hHcMRwEVt2r6A4mhZEhUDWiMnF4gm/mzshemyXFrV15wTxD94TK37jtIf/4IXeesM=
X-Gm-Gg: ASbGncuS0cmqzDO2Csl14jXnAQ/1YAOLNjCmKCTh9XLWPcn3E40Uhf491CTRghCFrWx
	5MVqvoICE5CNjEv1QuTdyOfzPgR6KkEQ+tYaL5s4l7vUwCB7xMbk5L/wVt5im9tC7V9xM6H1imc
	ovNt6Zmws8sE1TEVMP5bNSi9r+X06d4A6mn0KoATkTb5ae/yy12iBKtdtZ7O4JXhjDjCOEcAHYk
	0jHja5sv4c6kWr9yZBmFve6yTdjR/5K2+3uYIHNHrwa6vkLQm7hqzEK9nm2AayNxH/Fi/lDajkl
	S8CJLt9ApUf+390657eci21XwdUNkTEIdzPP2H28K7NwI2j9kxHUDX4UrX845Avhy6w5YawwGg5
	DpB2qhbZqwzSvCUOaa7Nnm1H97brFI85/hOUcf5k6VmGQfQDPP/jNN20vcfFt/+9YEweGIJoKoD
	+06C4rvw==
X-Google-Smtp-Source: AGHT+IEwi75aX21g/zBSieivVckv6HnF5UMX8645TVtHJlraH1tEzr8ABh0L6G+D5Sf9/VskB4583Q==
X-Received: by 2002:a05:6e02:338c:b0:422:fc2f:b809 with SMTP id e9e14a558f8ab-424414d6c95mr62078845ab.6.1758206850744;
        Thu, 18 Sep 2025 07:47:30 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa6538sm995541173.51.2025.09.18.07.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:47:30 -0700 (PDT)
Message-ID: <cedaad98-1eba-431f-af4a-b84e106e5f65@riscstar.com>
Date: Thu, 18 Sep 2025 09:47:28 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918143928-GYB1274501@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 9:39 AM, Yixun Lan wrote:
>>>> +	u32 data_reg_addr;		/* DMA address of the data register */
>>> s/data_reg_addr/ssp_data/? I just feel uncomfortable with redundant 'reg_addr'
>> My convention is normally "virt" or maybe "base" to represent
>> a virtual address, and "addr" to represent I/O addresses.
>>
>> This symbol represents the physical address that underlies the
>> "SSP Data Register", which fills the TX FIFO when written and
>> drains the RX FIFO when read.
>>
>> How about "data_addr"?  I know you wouldn't like "reg_addr".
>>
> another idea here, instead of introducing a variable here,
> how about simply using plain iores->start + SSP_DATAR?
> 
> so you can cache "iores" instead..

This code has gone through a huge amount of refactoring.

I hadn't looked, but now I see this field is used exactly one
place in the code, in k1_spi_prepare_dma_io().  It's still
needed though.

Here's what I plan to do.  Rather than saving data_reg_addr,
I will simply save base_addr, which is the I/O resource start
address that corresponds to the mapped virtual pointer, "base".

Then in k1_spi_prepare_dma_io() I'll use base_addr + SSP_DATAR.

OK?

					-Alex

