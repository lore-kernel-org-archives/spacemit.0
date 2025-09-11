Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211A350D61
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608606; cv=none; b=nNv+bGUBNF2M/FslnGT1J+MY94Q7oc0AhFp/Iv2/wnBNBWmWZTCSah/SO5enzoxQQGcVHMIv8RtBKCxZNC1gISxf7Ve6NFV93LVUkw+CazFPhgwnl9ZQ0zwa19pGhmtjAyI8VG9iN5wGcv/AZCuEV7bIUs6CbP4wTSM4FM7IBAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608606; c=relaxed/simple;
	bh=oGr1NP+FaJpK/sXC8O9G5aKW1G8kNDUhZmWJSBYSlHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jd5Jyv8/X6r+qnw8svvc40hbnPGmQcMTDU8y9P+2kxDaNoR9tgnL/SSu+f7NNgrga8dSQRwgazXHci8XSWeKOMdQnaUOUbxFjc9x+X3qIeO4r27Q7Y7MsblQh7w3OxwbNyjnmS8W7QnHPz6YsCW+i4ilRwFl0v+HGsFLGhhjMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0F/sDdrS; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0F/sDdrS"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-408929699eeso4426815ab.1
        for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1757608604; x=1758213404; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vIx9TAJKLDgZyZ0KM8pnfuvTopILKycVYmXw44N/kos=;
        b=0F/sDdrSf7LlDf+mX5qucpcBVzOwrRx7PrmnSG9UiqQ8wg86vJl82QfbInXA5R90E6
         TPS4B6RwICFh7YkKxVTB7ZVO2GYrvkDSuPjO1nS1qA8/4VQy6bipO9sulA4+/xoYpj7Y
         8Znog4iBJ+a0rmCfegtstuMXHfxGv7DxXxtxubd3t9r8j68YdAsR9kG1fgMj887sfFJj
         5bUNIcEWPeKeznVb23e+jPvCR7HyeHQyi31uq5dtHKMzNCEm1V4IEpQjyBmHSkFAZPa4
         KM2CpO/gHT4wPifcA58WndKt2VkZYjTYakss9XTE/zj3BSkNgTKVjtR76hf8rKjzh/eT
         Xq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608604; x=1758213404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIx9TAJKLDgZyZ0KM8pnfuvTopILKycVYmXw44N/kos=;
        b=FVMNaHV6mZWnmXyWvIEnleJlAQ9V/GHsVxlQiixWDdJk0lE5BUFk7BrsaRAcT6Cdi2
         8WFN7JNYAWv7rVpJhIZtFDvl+k8zV3L0QTW7BaZLGzsimWCkUsp1MLa7GyVZUjdOpr97
         /V2cfokB734LxSr887+ZTV5zEQ70JSN6Lc4ARhVWDzqsSfPKeVA/YvFSLcm07tnfIBAt
         4hGUXsIMg/0+T/V6VpnrZWtPc4FAE41l1nFqoD/QbQI4TggR7P8VRT/dfdRHIjBfp6Wq
         NZLRjv+uYHvmoeE35/rA9/LkideJeTDUSr9cBVj8ckwiZS6OlBXGm3cGZqOdMY3mppOU
         XTtw==
X-Forwarded-Encrypted: i=1; AJvYcCXduG1HU9vsmVCBBu88HOKCmZ/B/tpJIncjoXgLrMIa4nVHRx5JrF89v2dtlmI5LzAsorFDOhFtcg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7wr/M/Wpe/4ArtkC/KMBC+P3OxCSaFox5MFmXktWCs1Kb1nJ9
	1BWtM24VAhj8AFD05qIfBrDiw1ydJPaBqYTGBaoUSytbsI5aTeeOqUCjFrxXN4ggF94=
X-Gm-Gg: ASbGnctzRo4NEtTl2yf3eFviprK43SHrBKWCDjvxZzhJa28HSelfHqjj+JZM62Cured
	Df9xydetacGE/RNxcCnJzWGVTe6WPgRvSkq+OrJ2X51dXxoBad/NfcyOWBC1UIMw4R5tCAhVqTK
	d4f0jmnVvo9Jx8UdYXqRjUUJWd05S1J9EYiKEPrmITKplikX/u4YsDDZZwD2yHyafjZbg3yaiio
	ScBQY6N6dtlBOdjTN7QLQlmvVnssDtso3jHGUM90fbFa0eopT69ES0MFtii/KRSxwS80eqHhqim
	rlTORQRmj0Wik7beCTiSW4TswLdFycnKEIdZR5r5P1eKZwG5UdfLqu4DwproReF37jhnvJnUm21
	DuDs67+3RwIuCD91yNmHY4t5COqHhPa5VJDe/arq3IpXC2xH71FthaGFPJwIBzg==
X-Google-Smtp-Source: AGHT+IESTZWlrQ1ZzOp78ng5g4AamFP7UoV30m4Ba+h4YJCV6xC2C6gMfXuIzAo8ydU1NiPZGPw6eg==
X-Received: by 2002:a05:6e02:17ca:b0:405:5e08:a3e4 with SMTP id e9e14a558f8ab-4209d40ff0emr3215465ab.1.1757608604054;
        Thu, 11 Sep 2025 09:36:44 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-511f2efc55dsm735646173.1.2025.09.11.09.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 09:36:43 -0700 (PDT)
Message-ID: <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
Date: Thu, 11 Sep 2025 11:36:41 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
To: Lee Jones <lee@kernel.org>, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/3/25 7:19 AM, Lee Jones wrote:
> On Mon, 25 Aug 2025 12:20:49 -0500, Alex Elder wrote:
>> The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
>> converters and 12 LDOs.  It contains a load switch, ADC channels,
>> GPIOs, a real-time clock, and a watchdog timer.
>>
>> This series introduces a multifunction driver for the P1 PMIC as
>> well as drivers for its regulators and RTC.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
>        commit: baac6755d3e8ddf47eee2be3ca72fe14ebae2143
> [2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
>        commit: 49833495c85f26d070e70148fd9607c6fbf927fd
> 
> --
> Lee Jones [李琼斯]
> 

Yixun Lan plans to merge patches 5-7 of this series.

That leaves patch 3, which enables regulator support, and patch
4, which adds RTC support.

How should these two patches be merged?  Mark has reviewed the
regulator patch 3 and Alexandre has acked the RTC patch 4.

Thank you.

					-Alex
