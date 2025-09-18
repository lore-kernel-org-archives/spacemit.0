Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035D230C36B
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758205239; cv=none; b=ZAH293SWW0QGWwXoJKOEXV73nYDbGCG3l8vGNv0rPyYc5+ITKzYugitjccyDxMrXelVd0Og5WPKjQp7DBajgsfYPoPWvGUirXTGD+UPPzb1SkTe5m73Wp1vmfD8rQ7MLXL5NBYgm9UnZAxV9VCeDsajKyj4vApN+/BM8Vh92qPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758205239; c=relaxed/simple;
	bh=aLT8EU4W6ZT2ILFHMoAHb95Gaq0GYb01rVMThh8lhs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+dXZBkLcV2pj9wTCqI6QYUnHcCeSvKx1s5Q5INVurc0MOViMmf3SHet6PMBWLgcygfYQ9jeMIWrASiPbVbgrcAaBmqmDyRXbnaTibCVMlAzSGxjUSW2x2t6amHAuzHicskCRPo3jG2hMpZ9VoKyrEV9VyyQFqnpGlhzGJEzVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MipFVZEI; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MipFVZEI"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-42480cb4127so1491725ab.1
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758205237; x=1758810037; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGUyDQ28gbrezc/y2GGrwAvmT1nNgBRAv5nk0GUCrzs=;
        b=MipFVZEIUrvRVvbIzPUOGMaGA4VyWzcW+TpqBBkK27OY/cMK9FwbdrETV0mrQSgMof
         Ur7fmV10psyuL+xenWBq9PbRN1tt8s6w85EyP0FoDxQXuu7naPGJ65ch1uXv8NtpNmzt
         YrX+baR5d2LOQUZ1JucW2bjgtP1Diw4ItfDQByYbqeCkkPRVARRptMJe1hpvKAqG8XvA
         sLnwu5LYPUz4WOBxAA9PdAhZlVDF5LZPmK/SXE0eeIVF+LbYKfU1J8mLtyh3TfTL1uqR
         BNTMn6rIUBKQCJu0QBi2ZCSu9ZEFu7JIOSBkSCsPRYz66ggH5f9Nw0MyRiqxJrj8CScz
         LLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205237; x=1758810037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGUyDQ28gbrezc/y2GGrwAvmT1nNgBRAv5nk0GUCrzs=;
        b=a4d+xE3/POLY/fkaWzha5q9F/EZFbV4HkFqePv+tntbonoNDDm2Hmgg+ZkH5byJMVb
         nnn84lHfDEiamSa9k3X2I+KV6snpbfl/5wks9RJLBUy5jjgJaTJbmmxd11jIE//keqHa
         bainYBz/2H6urcBJ9ri/s7Lt+aN/Si/jfd2LsPgefgcnTrynQOetVXc1GANoeP5mEMrK
         ZtHBU21cwjZKTBLXOBADfoQyI0KA8Atl5r0HPF2Kn8QA1ECR8hU3VYclkFXZ+Ye4Utq8
         uU7ExWFGh2NcN/xBhCWr96U6pyXgyNgpstcCpJ27WpDZR4V1MUQ7yhcJ4HsW83eXNs/c
         ywig==
X-Forwarded-Encrypted: i=1; AJvYcCUkSB10oPIeuwMlO04bFKcK3qgwj0IoPuX3Wx/bG/AWnER0YhD4HoSdnE21qui0OxbIEcRGppvBLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxspsbchsAAD/jsMJ5ISGlsCh/320v/HBvaiBCD9M9y7IsYr8hP
	Wnf0q+I5CMIarayDCkrOrCVeUzUOkH78nnwpKIRZhD7r3I7fK8hOXH8HQSWdPUk7vrI=
X-Gm-Gg: ASbGncv5DJrU1LyBqlg4wU6MAgnMlyq0LowL8qm3nwDWcVRLJtf/ck1cIYlCc0HgahR
	mLS2nv/9Y+DZUNSe6fyrCbSEVe7W6GNl7ZyE5cd68pEd7E4dSht7pw7bE6SYVnZ6N7H0p+U6dXt
	zz+O6iwtHHt1JgMUqOBkdoXjGecVhV2FuIgU+GAWfmTEdijLYzum5imuWBi6YDrLN+rdDTDRKKQ
	eZNXR//v0XKVWj8UoKSBLHOJyerqApTC1lsjwqKL8Ry41iBjBjRJ3DSOiXASA5ehG4x2th8B71Y
	ww4vwuLraJXZqvn8D+bXegW91K5kIq7d1qMN9+u5H8dCWd9/JiPwaRkj/UDDEXH7wf4qREHUUgA
	FD2L9Smn6dRKjh9/RKVYhJlqKdAl/3hGaqIGoKRx063J7TG4vnIeoELsk1wEGZ9pzZ4zK86/1pq
	FhmHFLPw==
X-Google-Smtp-Source: AGHT+IFYve4EQ3dvEX4MzZuxtP/eJg9hkH/7xZ8/C/iLPdxKPkoWIGurBe2rCvRfKygvBsgv23fk9g==
X-Received: by 2002:a92:cda2:0:b0:424:6c1:a778 with SMTP id e9e14a558f8ab-4241a52851fmr78183445ab.20.1758205237057;
        Thu, 18 Sep 2025 07:20:37 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afaa351sm10679535ab.29.2025.09.18.07.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:20:35 -0700 (PDT)
Message-ID: <0053c0ca-340f-46fd-adb1-6af6928717ee@riscstar.com>
Date: Thu, 18 Sep 2025 09:20:34 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org>
 <5956e320-7cbb-4d9a-95a7-720cfa6b9654@riscstar.com>
 <20250918140633-GYA1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918140633-GYA1274501@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 9:06 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 08:51 Thu 18 Sep     , Alex Elder wrote:
>> On 9/18/25 8:32 AM, Yixun Lan wrote:
>>>> +			spi3: spi@d401c000 {
>>>> +				compatible = "spacemit,k1-spi";
>>>> +				reg = <0x0 0xd401c000 0x0 0x30>;
>>>> +				#address-cells = <1>;
>>>> +				#size-cells = <0>;
>>>> +				clocks = <&syscon_apbc CLK_SSP3>,
>>>> +					 <&syscon_apbc CLK_SSP3_BUS>;
>>> ..
>>>> +				clock-names = "core",
>>>> +					      "bus";
>>> can you simply put them together in one line? it's kind of tedious to split..
>>
>> Sure I can do that.  I've seen it both ways.
>>
> right, it's merely a coding style I want to enforce, to make it slightly consistent
> 
>>>> +				resets = <&syscon_apbc RESET_SSP3>;
>>>> +				interrupts-extended = <&plic 55>;
>>> why use interrupts-extended?
>>
>> Because it specifies both the controller and interrupt number
>> explicitly.  Why *not* use interrupts-extended?
>>
> It's just unnecessary, the SPI node will fall back to find parent node's interrupt
> which already specific as &plic, brings no benefits

The benefit it brings is that I don't have to search backward to
see what the interrupt controller is.  I realize it's redundant
but I do prefer interrupts-extended over just interrupts.

					-Alex

> 
>>>> +				spacemit,k1-ssp-id = <3>;
>>>> +				dmas = <&pdma 20>,
>>>> +				       <&pdma 19>;
> 

