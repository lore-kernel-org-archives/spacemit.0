Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B8A29B79A
	for <spacemit@lists.linux.dev>; Mon,  7 Jul 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751901510; cv=none; b=J/yXw51NXxWV7JJcgBLVArOtGQSBx9G4cx6nYTN1e840tU/n8YVU8m4nTFXJHB0bXanCCHtnk7aoxxHRHfrSnvDAWyayiWLn+0kKJYrhb6l7hXE+0rk5xXuy6qUW24kHcBMsfHqnqb3NGE0r3UY9hUo2ox3p+YgigYkUh6ywpi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751901510; c=relaxed/simple;
	bh=UYxbzP4enqvlZLYbDydbT2B0N+b4fJfsrGskHaO7mtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaxW6omyktC8Mb6O+IWzUnCwO4uGZTuUSoJh0Km2HJ5lXetOmA4n//4W9P31dMW2dzVhsD86wq/yIpB3BBDx8FQGJWkUk/Ntded5MY0092x6ojpOOA7IesM8+C1zizMyJCw17UPOuJHuQa9C/q5U/aNhBRipidjpw/7LuxBnXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rT8cisRJ; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rT8cisRJ"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86d01686196so97959839f.1
        for <spacemit@lists.linux.dev>; Mon, 07 Jul 2025 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751901507; x=1752506307; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yx5aXg6P6SNdPzRe+7UpHrkN5msdFi/K5+r1J0CI3l8=;
        b=rT8cisRJr+MIuMx3U/usJKuHwEZLKhfV20eyHMt6qjO24rT1IGbUOA9PS7DHGeNDm6
         Ckux41XePxvId/b1roYggXs8/lunV62J3B2zoj4tPvOsZ1emUWPdUhYzsGR35lG2ppLF
         CuN4U95v071ZD7ccMXA1ahtQ25Cgukef2iOETSklKRuNsk9381JdEeNZV3Jb2zVKoA43
         MxwuQsKgIYyBbPgUb4xLkJ1wSUvSV14zntxtSgGhXKDInWUw0BX9Zj+cmzrszX7Fjz1r
         LmujqIPl03orTUbrIrXXfq5X5cOTWWGQNFCk84aSlmjco7I1S90dUgmdk60HerHSjEiB
         ajWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901507; x=1752506307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yx5aXg6P6SNdPzRe+7UpHrkN5msdFi/K5+r1J0CI3l8=;
        b=hdFt0Bru8T9y1+9XgWK8efi2cWUUmxFtZtEo/L7PoYYfkINO6jJtrfi04NCI4cGFb7
         aJXBOtLUhWs6y7KTQ4Gc2XhPyFyrEnXVvegbF4bg+FUtW03uMi+dS/zxpTcLCfPqMnIk
         YVpIP32Fb7I3B/Rha1OKYMmKAfI+eQtFdJ0Fik+4buTURdMl0lnbnnY8s+6MyDDZe0Dk
         UBNv4Gh5wfj7wgngBVEh0KFNaQ7QL5CxOXoVsloa19evkIrmXso2M7WvF3oq5wepiN/d
         3x8AiHt/dRN4ksWBWu1Hbl097PzGGmQdfzXqDJC1OzxaEJHmoP7BEZXHMCt1EvHZeLsN
         n1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhwf0mboDp1HCfvuqpYUFP3af+tXN+BD/xrryfhFJhIDn3DctmagO/FPJdgMvKP/GBZ32VShJNrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi8ItZHsmmKGemsOWtg7GykoaxlLHFP62cXMYVDUak7Rcio5M1
	uPoRt4xS0EWwQCTzMM8EnscBQxeeZx7nKtLfIeyZcTZuxD1i9H/feBwWmfs2hOkAwVo=
X-Gm-Gg: ASbGnct8GsV4RMPqsHL/4XjA7ghXu6Kux79vDewueDKxnjinmeTrSZkhf5rzlLGhF2S
	BQI7v2zqaBtJ485xLjUGwyAy7LxRqabOazIyIxuZqMooDh3O0AUDYP36In/I5WU6z0kGlh53mnm
	2QnFnMPXVVyoUycKTFJCGH00Ro8tRF1olT/OBP5Iyq8U49QLl5MyyJGHK1Ebp//OoXGrzi3qgaz
	MnCWUeKHlZ6PVdD6vayN9t35JaDuLlNlLWpp8m6E79VGRghKN/3cJ3J3IHw76exIGTCVhTpzHRK
	6ZYvPptN8+6EjSbQkberJCIMx8i65nZuy3MVYVENGzVv+/lXloxdocFFg9wEIPoAiTKNlk10GpA
	WEnR8G4xYmK+TxDG12wzkh7WX5g==
X-Google-Smtp-Source: AGHT+IEcpAKi8rMSKDtA341deu1ji4vXPPPi4MsMqdh1gMhGYZ+finPoZ6kUswodqeMPhgepaUG+Cw==
X-Received: by 2002:a05:6602:1606:b0:875:bbf0:8bf with SMTP id ca18e2360f4ac-8794a3ae0bfmr1164439f.5.1751901507273;
        Mon, 07 Jul 2025 08:18:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-876e07ba3fcsm238619539f.12.2025.07.07.08.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 08:18:26 -0700 (PDT)
Message-ID: <7e652d26-ffae-4bce-9952-4061b2799095@riscstar.com>
Date: Mon, 7 Jul 2025 10:18:25 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
To: Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250612224856.1105924-1-elder@riscstar.com>
 <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
 <20250707142846-GYB408198@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250707142846-GYB408198@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/25 9:28 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 07:19 Mon 07 Jul     , Alex Elder wrote:
>> On 6/12/25 5:48 PM, Alex Elder wrote:
>>> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
>>> parent for numerous clocks, including those used by APB and AXI buses.
>>> Guodong Xu discovered that this clock got disabled while responding to
>>> getting -EPROBE_DEFER when requesting a reset controller.
>>>
>>> The needed clock (CLK_DMA, along with its parents) had already been
>>> enabled.  To respond to the probe deferral return, the CLK_DMA clock
>>> was disabled, and this led to parent clocks also reducing their enable
>>> count.  When the enable count for pll1_d8 was decremented it became 0,
>>> which caused it to be disabled.  This led to a system hang.
>>>
>>> Marking that clock critical resolves this by preventing it from being
>>> disabled.
>>>
>>> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
>>> be supplied for a CCU_FACTOR_GATE clock.
>>
>> Is there any reason this bug fix cannot be merged?  It was
>> first posted a month ago, and although there was some initial
>> discussion that led to revisions, this version has been waiting
>> for over three weeks.
>>
> Ok, let me explain..
> 
> I've queued it at for-next but haven't sent out the "Applied" reply email,
> it should be eventually merged for version v6.17 if things goes well..
> 
> the reason that I haven't pushed it hard for fixes branch is that only DMA
> is affected for now, but DMA isn't fully activated in current mainline
> (No DT, No config merged), so I think it's fine if we target for-next..

OK, thanks for the explanation Yixun.  I've been working in the
networking subsystem for a long time and they tend to push bug
fixes out right away (once reviewed).  But you're right, this
particular bug fix does not affect any currently upstream code.

					-Alex
