Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11FD27F4D3
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 19:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400169; cv=none; b=BLFLNilqhwfk7qrrS3vW3q08kd0veyucqd5ZSe2U3po9CiTIeBMWz7YKYlwxFCT9nUvdWeDLWPfXO9vqkCpzZtjFtFdnPTOfavAB8XHNVtKqEBnp/r226M2WSzAQP1NgNOjPPTXQPd3QjxWhIEbqey3ZU/95Ooc2OV61NkWp+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400169; c=relaxed/simple;
	bh=YWpsO5xUUd8r+lQC+34HlNpUYxi1N7dTXlea29z2cjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZ2VBOZMRkEQuenOgyOYMcteAee5OjNgFRh98HbFlflGIobL9lLDHxc+EUy/fPh7FM5vg+5SjVahrEEvT+vxcbTbHG0F4XQWNJogbFnoscSvfS4Mw8nEIQTXo+iduJHabZW/aZymkUidemwN2qONL8+bY7s/yN0MferQqaNo91k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pTTylYS7; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pTTylYS7"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86142446f3fso60398439f.2
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 12:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744400167; x=1745004967; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8IJA/pmXvNuiKKrx3r2PtlepPD+xmj2yEuRTpmM5lw=;
        b=pTTylYS7mCEIoCLWB7wZGn+TQYq62kRv7JyMnRBjT8gVcjZqnFlN1xI+lxpRN136+L
         z1gSE7NySedZ2x2MkG90ap4+grF/tzmUEppVz5sO2RvpRizz/mQWIY3rx8PMbmJbgP/p
         tR8Gzh2lvqotezi0DnBJDrr/mROrAynJcD+ygNxsXRECWEmVywOj7HTh3T5kkeeBR4wP
         eLzXb250mqDaE7pKW9jI7IeMsFVhjU2+XSW5IadzrN1DEGCwrD6zMPYFPdIvxywJX4bh
         LimJ7aKl06wD01hKWyqBz0iKWwUy8qDi6/M2f4VGSncyiKw5h+5hsZxSb3vFMZ6u6isl
         wISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400167; x=1745004967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8IJA/pmXvNuiKKrx3r2PtlepPD+xmj2yEuRTpmM5lw=;
        b=bnk8upioIETRKADA27UAVUvsG/IkZ7xvBkdDY02ezKFYauqB7TAHxPkSKIo255qa62
         UfX/ao6DWgrfBe0K31uq9HXgzOj41QRgi8X5ka3wM99KsbPJLDqGncJRd0nhClDLk8Ax
         ecBiW563hKAA1NFbvTzCye7DEiDGRLa5Y++PDPgmRMbVlWf/ivSd0eC7XssX4kXhGImF
         SU2Dd74/KenClGcOFfpNDqOCGS1fc7gvLZ3yAXlMsvZWNk0uU4pCejPl3cg5aByfGvA9
         cTC1bvgzYqOcuylwLIUak207hR5LmKjavG39eqmMLZ2t8r/YayuJr8ecSBJWkcoWHerD
         YEZA==
X-Forwarded-Encrypted: i=1; AJvYcCUppEfgRgGoVa5zI2gmbZw9oiV2qQsKaL4OdG917aCIu2NFyMuOrU8l4d2J63GH8RPDl93DdKl86Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzG+byP2sVgJ2ZY1dDztDmp7FhlvZGGbUbOIvLgdnxyc+MB+Shb
	PKh0XmBFOZDuUnMCwYi47UnX2NRLePOMiz+7ct658ZvfAyJrWmloq//IDqyLHAI=
X-Gm-Gg: ASbGncu0TyAjs8lAksRjSzmXqIF+vs3G4T3fcXG03FinKtSnud3NpVOEKfK4L6Gw5y6
	+biAl28wQsl/6oZOG9typOOmkgGlbme9QN4jG1cTUEHdicQsJoJ2Te6N8KbirF9F+0WGwqXBbwR
	UAiuC5PQiWasKf98uFwqkzc+qVLg/mYBC4amzRp9iwd77s8+nmkU+niuk8gIsUvVPTWWkBNkWsm
	0ZLAiZLewREoz5gEp/xZlrM75uq5uK5+6XRDyBwtKDejQ3LxDBai5znQAjmXNThsCnLmzV6Sfj6
	qjA4Yb5i1OEHnNv7mskQr07kekT6NEpCzJC83m7KbdbK04+f1mZWPUcw5l1DuwJ3oFWh9bt/NOq
	Mi4L0Ayo2zg03dVw=
X-Google-Smtp-Source: AGHT+IHpEgSqemBHCC96JM+TCmkYLDtVyLUCKWRb0L7zdDTWhisBDSszCwSCFlcKlvql0c4WxZEtlA==
X-Received: by 2002:a05:6602:3713:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-8617cc3d525mr485687939f.12.1744400166792;
        Fri, 11 Apr 2025 12:36:06 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861654295d5sm107606839f.19.2025.04.11.12.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:36:06 -0700 (PDT)
Message-ID: <a3b2d0cc-c055-4cf0-9e03-3ea73041642a@riscstar.com>
Date: Fri, 11 Apr 2025 14:36:04 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] serial: 8250_of: manage bus clock in
 suspend/resume
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 benjamin.larsson@genexis.eu, bastien.curutchet@bootlin.com,
 andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com,
 lkundrak@v3.sk, devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250411154419.1379529-1-elder@riscstar.com>
 <20250411154419.1379529-4-elder@riscstar.com>
 <Z_ltyAO-OBzl0adV@surfacebook.localdomain>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z_ltyAO-OBzl0adV@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 2:30 PM, Andy Shevchenko wrote:
> Fri, Apr 11, 2025 at 10:44:18AM -0500, Alex Elder kirjoitti:
>> Save the bus clock pointer in the of_serial_info structure, and use
>> that to disable the bus clock on suspend and re-enable it on resume.
> 
> ...
> 
>>   	if (!port->uartclk) {
>> -		struct clk *bus_clk;
>> -
>> -		bus_clk = devm_clk_get_optional_enabled(dev, "bus");
>> -		if (IS_ERR(bus_clk)) {
>> -			ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
>> +		info->bus_clk = devm_clk_get_optional_enabled(dev, "bus");
>> +		if (IS_ERR(info->bus_clk)) {
>> +			ret = dev_err_probe(dev, PTR_ERR(info->bus_clk),
>> +					    "failed to get bus clock\n");
>>   			goto err_pmruntime;
>>   		}
>>   
>>   		/* If the bus clock is required, core clock must be named */
>> -		info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
>> +		info->clk = devm_clk_get_enabled(dev, info->bus_clk ? "core" : NULL);
>>   		if (IS_ERR(info->clk)) {
>>   			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
> 
> While the first patch against this file looks okay now, this one inherits the
> same problem (seems like not enought thinking about the code representation).
> 
> Instead of rewritting half of the lines you just introduced (which is also a
> bad practice), add a one-liner that assigns a field to the local variable.

So you want me to re-spin this again so that I use the local variable?

I understand what you're saying based on ease of review, but this
is a simple patch and the change is very understandable, and the
code is no more or less clear when using the local variable.

					-Alex


> 
>>   			goto err_pmruntime;
> 
> 

