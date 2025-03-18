Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4011A01D4
	for <spacemit@lists.linux.dev>; Tue, 18 Mar 2025 21:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742334909; cv=none; b=lhcNYtSbpYNzpRdZkhioFC1yxugWE2YeYThO28ikY5/HFcinaWPZkIINpjyWNDgd8Z622pIpOAIPNPwhtftxQyhw0y/zd7F4RWj+oZTCCqYtsXBcnvRoRjxonqspsdh+f+GjVsm44/rvdj3BxyToLk8QpeW1raO4+DHZd4717Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742334909; c=relaxed/simple;
	bh=hx3Sr4AFb5ucFf274orT/rk+C50ckIa8tHSb/t4lLeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbDXtUYZHsQQ0C9PeMT4YjbooLzlTTfEp7kq5n5lKwvT2b41EupDRjoBq9nBd87eyX39S7yGVOkq1xxaUeyCdyEv7pELvDGxoYoRfQXf1YsMnPmvQoZY82hprdQWxnwCse7HOMQQybZ2FFcoKyjFOkyc/nrCRj/B94aD+au9VoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=E2/FU87v; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="E2/FU87v"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d445a722b9so33167235ab.3
        for <spacemit@lists.linux.dev>; Tue, 18 Mar 2025 14:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742334906; x=1742939706; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BriU7gJk74pNPNWavKZMoPDwkWz3I9HqTPL00tnATHc=;
        b=E2/FU87vm8N9OBCuQciYxECBizYdRUDIn2L7+W+d5Ly8DKzRgOY8mddoUGpXNcPRv/
         ex2W0yyqUzA2mECA8VVT9tUEHuQyljeZpqRhb75790i3QLBDftO76zxpZzxr7LmzP5Zq
         gWr+TWFXNpv4Gyv+JuXIvCdNjCbj48CDbqpoJvR1VaFXcdPsFUO6wko3jPvuM4Uw7XL6
         RP6rHdPtX2Kd4MT8RquvaGpe7mI6LvzROBnRUoR39NMbds0aDDVwyAkolEW3xDwDtgqn
         EykUXkrf8Wk6ChXoY3uh0aiH+nwYVOJdhkVAM/kCE3eOho7WzAnj89JEpicGnwkXY50U
         gOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334906; x=1742939706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BriU7gJk74pNPNWavKZMoPDwkWz3I9HqTPL00tnATHc=;
        b=D3IM9SAktfoWjStsaML3lOTr3l6jvJxELTxRSOPI1/4MN0o/Incwf84ejJO/Fv/Fg7
         asRHT8asXg9WomcdTZaey0xbWqn/Tti/4Xr055iQYE/QbHfkoZXAtd+vqvI1GC2hlYsV
         4K8UFIsRzFWSav606YydTI09LKzsAbSB6S7dWEEoIQbFw2t1I9paPK1lafXb9K6zMod0
         BbdmZexoNrq2vX6ypojIvWHHEB7/LZVGVnEzFfMvH9Qc2NQJTI2jgb36ZNUk6z1nurLG
         EMy1DgZI9qp5SG/JvQemq32Mg0Sm1b7M+7tXcwVTEDi14sbPpF5ms5MmhCmViSwZTkMr
         wQJA==
X-Forwarded-Encrypted: i=1; AJvYcCUUoRQ97dk9+NQwPeERTrLUp2Fv7xyPpULVYgGD0OdeJRPB60LIDVumw5vAeYU8ahaIRbE+2AwFFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/IM1fZ19YBtko+27QnkGUkqRJHyQVf6U6G39msC/yqwhriQR/
	NQ23GynE+X9sv3SCExc8WtwSJ/EcegzQOVpT6HkJPIY260iSMVmOotTqRnAeKVc=
X-Gm-Gg: ASbGncvqTIxh6s2t5AeWcqTYrqt6gsoaJfGVeNIbJzbrZGsi2GnVan5PyVdbMjGeo0N
	xZx2VxJdTkeF1VA+HjLU5KrnFYe6lVS+x2BrBdO0FtvCzEyW+NjopVK7yjiQdGeVdbCfvMPL0HZ
	HQFgxjd4UcLMcyYVwemydyGD2w2rt5dFAvkRjwtIs28FKJon5rWjsfKLYYS7J7UEQSISnrfyIJh
	e01rFy7RHLIAe4jMxzmse/W3+iebnpTA0Seet6L6GwZRrbVeFD5Glxu+73NdLO3a1R1CbxsBjua
	G9ysTB6gFngjPJUhqy3+JrtDCWLLNkC1unS2ae3yLgdRr1Y7bh6Bhf66SB2Eiv8YsZDgpnweIs9
	qI7EHaNACKmR2JaIMJAU=
X-Google-Smtp-Source: AGHT+IGVf9GbYQhaKGZToeaVO4iSrNen2V8aeAO2lkOMP+96+7ao9O222hC69zg9XeGwmJ/p4dFgUg==
X-Received: by 2002:a05:6e02:2221:b0:3d3:faad:7c6f with SMTP id e9e14a558f8ab-3d586b2ab4cmr5124855ab.5.1742334906077;
        Tue, 18 Mar 2025 14:55:06 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a668e6asm35193745ab.28.2025.03.18.14.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 14:55:05 -0700 (PDT)
Message-ID: <c8cf2e21-ae1b-4e72-bdec-d7bd1b2bc9c7@riscstar.com>
Date: Tue, 18 Mar 2025 16:55:04 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@ieee.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
 <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
 <a7862a8b-4d81-4b1b-90d9-3cedde0699a5@riscstar.com>
 <lvwiyxitkuzi57cbbcvuanqpvhaihafarwqhkflxbctzs6j4o7@ev45pe3yuzj3>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <lvwiyxitkuzi57cbbcvuanqpvhaihafarwqhkflxbctzs6j4o7@ev45pe3yuzj3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/25 4:41 PM, Andi Shyti wrote:
> On Tue, Mar 18, 2025 at 07:04:19AM -0500, Alex Elder wrote:
>> On 3/18/25 12:44 AM, Troy Mitchell wrote:
>>>> I'll leave it up to the maintainer to decide whether these
>>>> comments can just be ignored--my Reviewed-by is fine, even
>>>> if you don't change these.
>>>>
>>>>                       -Alex
>>> I know it's right what you said.
>>> But I don't know if it's worth to send v8?
>>> Maybe I can fix it when I add FIFO function?
>>> If I'm wrong, let me know.
>>
>> Unless the maintainer wants you do do v8, please just
>> address these suggestions later.  Thank you.
> 
> it's easier to just send it rather than asking for a v8 :-).

You mean easier for Troy to just send an update?  I agree
with that.  But I have no idea what Troy's schedule looks
like...

> What I care more is if you would give an r-b if your last
> comment was addressed. If so Troy still has time to send a v8 to
> get the series in this cycle, otherwise I can change things
> myself before merging.

It would be great to get this merged this week.  Easiest,
quickest, and most unambiguous (if you're willing) would be
for you to do these tweaks and merge it.

Or just merge v7 as-is.  I don't really care at this point.

Yes, my R-B stands with or without my suggestions here.

Reviewed-by: Alex Elder <elder@riscstar.com>

Thank you.

					-Alex

> Andi

