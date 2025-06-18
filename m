Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1936E2DF3E0
	for <spacemit@lists.linux.dev>; Wed, 18 Jun 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246942; cv=none; b=bYBOTWd+KVDcPR/5n5xW2LadBBFQ7y2obcwdcPSc+XxIqLG/DgHVmyb6dP4tAHD+L7qj64tTNUnW2g9LzIw8BioMmV+gxubtI/p0X1CXNceojgxNCWfGTGylb9thGpcho/2YTMFaaWdqS6PujyKE+1ZjZHxbXEDcLZswg3StMp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246942; c=relaxed/simple;
	bh=Bqx7nYXPk7+x8RpONNnSG7vtyH7Y7MIyIgUrVtpA5Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FctVFjThN+yFvaL7G53YPKP/KTHGK0w8Qi8XyZVZk3GktvMfSZb98Oiz0R9orKxd9UPuotPiPYtPUhxQ4jPzQQmpwBCjITFn8kl6pIyvstwykpPWrEscU3XdztEXP0C4OxwY85z+vHnlUQUJfwvDjsRUaz2RbWoh5vjY01Pm1Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=14Gcg+OA; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="14Gcg+OA"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ddc5084952so28608645ab.2
        for <spacemit@lists.linux.dev>; Wed, 18 Jun 2025 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750246939; x=1750851739; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGoYPJ/PjlTLAT3PAQl7BTNWNSTONrcIyBDN+6W+nw4=;
        b=14Gcg+OA9KDVz3kJyhfbluGdXyT5ytaBCXUupIthcClt229iUOOkpz+gvekDZg5RD6
         D+7jSC4Mi8kswoEk+Zr4BreFUpy3ipm5z//fmklAUPOLjyc72qCfVVFzGKvFogfRFQA3
         GwPR8BsI3Ln8AfbpbbmbiUJ5a0PgTDeqb19DH3cZsfFpFMwFuKefsPWjvsa5L5zbdlgf
         H9vUtFKhNWR3Be+2ZecJCXMiPpU4CXVZnRxLOQKTfMS6EL8Bou2UxGXIOemVuvrHEQCb
         04jlQFRPp2dPO6VBHiHdyD324bjOYvVQUOGCveaRXqNQG3WiWG2IGD39Hirko+LJBBia
         Vwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246939; x=1750851739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGoYPJ/PjlTLAT3PAQl7BTNWNSTONrcIyBDN+6W+nw4=;
        b=a9WEgXHVszltGY58MON2DuaqogktlgirXjE2PDRirFY1J48wREvCg88tjMmCXk6FaN
         HI2ILr/sQvE0hb9YQSrA5+CZbgjmzZ8wCs+RP9fNwbWXqlMCr7Dg1EdFs5GuQ0OisdM3
         LKNt6xOBAvVY9ecFAMNx3GuMpIgIsMA1apLxLmErl4KqV/umfmsYRwPG3jkL4Ixwv3KZ
         JaXQrUumzrFrW3eanVZPvzAPO3h9e11fESlZBIzkCSJBdjtLZgkDbVg7LMlcGJEFfS9+
         tyXXb2u3UXlET0BqSrFYxcg3Beau/Rsv0uVA0JNhPGTtdP3V0exptsGj3rfB9Wm2yjvc
         bRLA==
X-Forwarded-Encrypted: i=1; AJvYcCXYVHbtriViKmGpVAhiENsPcxXERftpFDawwyzYMQ6bc026ktK999MY1Bo0hmfYA1oTnB1j04TTUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyeyuh4cA5dYsPv51mrucWnSYZujUzJGzBgxA5eNO54+tKK1X26
	cYlJsF1i2KLDvspW7ZdMKELgGpcCq/UVJYYoiafn4XzYFETC+QiMRunt6uYbkGWhwgQ=
X-Gm-Gg: ASbGncu0FQMam56Rlp2oNyPdxe8WyNhui+4xSX8xCkNOO1SUog2zl4y9GCPsiXY8PYu
	hhExnFMXN03E8FqQrUe41Z+uHZ0Q2eOboxWmrvwjGKfYFKQ/lFXXUEvnMpyM7D6mjrCX3Mg916f
	FVj+FR4fj7JzGQmIZRC0cN9op5KlDd0ogdR2NdjgEXLf7umqHVEopg67wOHavrHBoHm36rRuzBy
	CuKh6W+YHBWZmImNDmQPOW5b5meeUIpeTZGadMQ3uEQjrYrFA9Sjh2YhWjIcCNrT0h463eXG7gR
	yiPVz0gZZa3VsjDnTY6SVKzm3PnZ+FGfxpJle3Tdt2cBdGhvJe97SKaY1vu9QIp8q2FNWhGG/wi
	yT9pMUDour5jk/an8CXVdGvB8uQ==
X-Google-Smtp-Source: AGHT+IGZEcu6gwBAOkwxavLZ+RywP72ic1e+8WKzjWeayufFiBzYjvq43wkZd9VQN5U2/4NY0wJZaQ==
X-Received: by 2002:a05:6e02:2493:b0:3dd:ebb5:6382 with SMTP id e9e14a558f8ab-3de07c40cf8mr191072635ab.4.1750246939145;
        Wed, 18 Jun 2025 04:42:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149b9d9b0sm2675217173.38.2025.06.18.04.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:42:18 -0700 (PDT)
Message-ID: <5be51d5f-67cf-4e47-9bdd-e1e5956e184a@riscstar.com>
Date: Wed, 18 Jun 2025 06:42:17 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250613011139.1201702-6-elder@riscstar.com>
 <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>
 <20250618111935-GYA156140@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250618111935-GYA156140@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/25 6:19 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 21:44 Sat 14 Jun     , Alex Elder wrote:
>> On 6/12/25 8:11 PM, Alex Elder wrote:
>>> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
>>> device is an auxiliary device associated with a clock controller (CCU).
>>>
>>> This patch defines the reset controllers for the MPMU, APBC, and MPMU
>>> CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
>>> and ACPB2 CCUs, which only define resets.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> v11: Redefined combined reset definitions into individual ones
>>
>> After I sent this, I realized the clocks use a different
>> naming convention for two of the PCIe symbols.  I think
>> reset should follow the same convention.
>>
>> Yixun if you accept this series, would you mind updating
>> these?
>>
>>     RESET_PCIE0_SLV -> RESET_PCIE0_SLAVE
>>     RESET_PCIE0_MSTR -> RESET_PCIE_MASTER
>>
>> (And similar changes for PCIE1 and PCIE2.)
>>
> sure, done, check here (let me know if I did wrong)
>   https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-drv-for-6.17

Looks good to me.  Thank you.	-Alex

> 
>> Thank you.
>>
>> 					-Alex

