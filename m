Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B528FAA5
	for <spacemit@lists.linux.dev>; Fri, 20 Jun 2025 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428649; cv=none; b=oJKHoLspSGxyNczyQtWZqjaTmFGHPaFiFgLHvoJBvctd+pzSazi1HlXIvs6xbmKpuKPcJcDPsuI3OV8IZfWCSq+APAI/nUcvp1FFqMLtXLskE94x2FOCa6qv4nkxeD4do5CDob8pzB4ICQGSbi4owIysRWqXM+7hjZseX6qbaXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428649; c=relaxed/simple;
	bh=AbfY+khRhmnoM2GrJwd2PvwKLx/Otd5i6x62C7zENKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFWaryB6yx5V4a3cOHgFqBFZDjsDDIStaPIKe9g/k8Ab63hYxWJa6RULc/XO4v87Kct1G87E1iXNHBOs+MPfTWemW7lHzQZZDtjNUBwXvgFCQPqnhmVr/VTsLAhVdG2fOId8T+HZyyRTagk8frlo3p3MGBlqog/1rH7lPwofM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=L3mmmN0F; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="L3mmmN0F"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86d0c598433so52470339f.3
        for <spacemit@lists.linux.dev>; Fri, 20 Jun 2025 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750428647; x=1751033447; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/V0jiwDrSai/Ua3D+JcI8BdoFAg+vd8bUJc9dl+oAL0=;
        b=L3mmmN0F96a0VDwZYCmyUmXUWrv8/N9w64lNekKvJ89GN3sIJGCV6/Fr5d7pnMCEpM
         UqtwWzqH0NjB4QM0ZdOhkh5Shmm2UMZ2jSfbcg9Ry76n6fBGkbQ9do2HhJQTqBbwd0qi
         MDtFTjqRgcqy8J6eLeb4HF/ZSnxAGCHafiZEmWzKcT1aKiJ03bu1vXfSIf1VIEcZM1bx
         CXEvopMTq40fGcQiT7BkDPB55f1DwtL3+Y7ipdcxi9px4eaHo8aQKLatxWgE7/THvCvm
         tuJq+ce5pNjscgK8DHOPhzgI7/K/9Ar9fqHA2wmCgXqu3Ve8Ri5CGmCMqGY8HcSR31Ov
         Fj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428647; x=1751033447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/V0jiwDrSai/Ua3D+JcI8BdoFAg+vd8bUJc9dl+oAL0=;
        b=OeOnRAGNe9aeZ218JvXcWege1xgOy3BIY7oGwC19EIp3syMZxSPlC0M9tQJZb0BsBA
         RIoPqhXpHEwwc303LJQ4kRKvxYh1FGAJapXMTAdGtFOxdloLUWrDV1j4YGbblJe0S96z
         I5pqaepvGkCPNq1o0YPLumkQD1qHBkt35rPrsWRIcTCS6INaf7PI9mm/HWsnQP8CV8Za
         T+QAppduk2bIBsiNTZhgx485FmmvzOJ1PN7jcyHr5SqcQsMhq3yx2FLHeKrgbJ5lbhSX
         qBrfXeLlZoVqzrZFfvE1YEm5eL2dDrkH4ag2QUIJO+5C6VXeZ0OFNuOJcDx4nMkuEkEX
         m0LA==
X-Forwarded-Encrypted: i=1; AJvYcCU/K521vscCdbBw3ncc53wOhK0p+3kSaoujkRaBPv0Zc7G3HHb5jp9+9y9iN9SEOXBI2JRGM/79MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN3C6nFPbfLYy7MIcJM3eGSS7Oe3mIHFxT6yS8QJg6tf/lyKE0
	X790w9OF88pcjePVmMoOtoVSYWU7+5PsaWSeVmQMo9zPivBKpI1A/G4W2kO2ggiGsIY=
X-Gm-Gg: ASbGncuzKopHoAj7RtKi9QsuHPQKaPs6djqtoVRxQMavRE9vUnDBsK2f1XHXqClC801
	w84B9GFYSmTgZdbKBq7Gd0S9PiYfTXSgpM/U/yiYLCR+ZMmNnInw2WJoE0cHqSCpTU4efUBugXG
	xnvVpYcmyqkDUG1ANj7o0Mw21caLDn3Fh7Rb/A+KyRMSy4cN8mvG6m4WU2KlGYwLixJTlStwu1h
	UxoMnq1L5QKNW27lCjOlYSBVVQyyCHdS1eq+LMA0UjTaonu73uB4PoG3vHzDQNDO7xjedOlX59E
	xkW8xG8fyYpWOVSAuBraaorLTt3SCH/ReyMB2l3Ya1VIqQET+97Kg9a8tAjlLH07xGDC94B8Vdf
	AbPZ0/ukb7M+RlQQTpL1ScWvQcw==
X-Google-Smtp-Source: AGHT+IF191sx1Gw+x8ilTUOKPF8dmHGnHILkCee7ddq/TBaGfyhQHSrZPkzvoftsWVolVXrmsAPBTg==
X-Received: by 2002:a05:6602:380d:b0:873:1ad3:e353 with SMTP id ca18e2360f4ac-8762d1e8c96mr306397539f.9.1750428646946;
        Fri, 20 Jun 2025 07:10:46 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8762b7adc23sm50782439f.35.2025.06.20.07.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:10:46 -0700 (PDT)
Message-ID: <a694de5a-50d3-4637-a8c3-f90971bf33f8@riscstar.com>
Date: Fri, 20 Jun 2025 09:10:45 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com> <20250619144147.GH795775@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250619144147.GH795775@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 9:41 AM, Lee Jones wrote:
> On Thu, 19 Jun 2025, Lee Jones wrote:
> 
>> On Fri, 13 Jun 2025, Alex Elder wrote:
>>
>>> Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
>>> but the driver is structured to allow support for others to be added.
>>>
>>> The P1 PMIC is controlled by I2C, and is normally implemented with the
>>> SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
>>
>> six or 12.  Please pick a format and remain consistent.
>>
>>> regulators.  It also implements a switch, watchdog timer, real-time clock,
>>> and more, but initially we will only support its regulators.
>>
>> You have to provide support for more than one device for this to be
>> accepted into MFD.
>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   drivers/mfd/Kconfig         | 11 +++++
>>>   drivers/mfd/Makefile        |  1 +
>>>   drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 103 insertions(+)
>>>   create mode 100644 drivers/mfd/spacemit-pmic.c
> 
> Right now, it looks like all you need is:
> 
> drivers/mfd/simple-mfd-i2c.c

Now *that* is a good suggestion.  I'll look at that now and will use
that if I can.

Thanks.

					-Alex
