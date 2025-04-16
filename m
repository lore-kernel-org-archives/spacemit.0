Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C32DFA20
	for <spacemit@lists.linux.dev>; Wed, 16 Apr 2025 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803227; cv=none; b=GYpeBZFyavRV4vB1InrTEJzLWDMGIYvmx/haAMwLrSKr8jo8mfoRZ9oXfJPqH13dAR0kLuhPdt1/hIUhFL9rVrxiHIX6DCSj3NTn3uYHMymYronrrGyfcpkOsy9dVu62cN3vIt+odthqWtxjbQYLd32JQTL+z4YTd91dQC8YR1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803227; c=relaxed/simple;
	bh=9c/9l7Gx6pO3uJ6uw/xSQ8RpmhZ+3ORIT5sR3A/UcG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVzdXH6bZ4NXjcazY/TpZb5+GwnCz9HuRdwY9LRwpgrK8q+AyPabOQyMPh3KBXUzmjONcn7wZXZK0dps50mS6DWkCNCozddp6DbGNlWTe+ivMVYRIjn/V0NkaKDdQ3G5C8U6QLr43l6z0dmzUWq9r21w8AuFouzysX5zphKmAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ap70rXVQ; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ap70rXVQ"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85dac9728cdso136423539f.0
        for <spacemit@lists.linux.dev>; Wed, 16 Apr 2025 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744803225; x=1745408025; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUKLRPozuEL+beG7gwcwBgRjJD70PGCGuYuOaYbRFSU=;
        b=ap70rXVQzQNGd/zm6nyEgUJ7yw/ZzQRTBxM4yVGxxFgi1DIkfWRmsDgNTmZXy9zGse
         1oLx8sS5srJwV9UAUKcWZJAemTXYSe6I00ObPDHcNhBj38RMvs7AW5VfaFs8uM0hT2Ph
         AePA+0yQwhmNSHwD+UiRFd0nDHH3J9r92PodmOi6ZBfCBGGi4IQ8/nqSurGhy7Nt5tel
         q8H3xdWqpFZ95SGTWImYHXQBpT7ONRlXEP7CKRSh1vlCUMwqKahJcWBAjZIXqOIKFXJ/
         qXGTs79rmK9xF6PH3y2r9gZQ01yI6ZzYsFm0B9m3Et0atKth6qTwE31x82PUC1l6coCU
         lXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803225; x=1745408025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUKLRPozuEL+beG7gwcwBgRjJD70PGCGuYuOaYbRFSU=;
        b=MOqw3XrAzG85vHx9WqyJ5om0wiNrsTqM26v6PSFu8Mw6DRvu39532uXzjCTWkkGCYc
         G839tp4egTYgZKGdHAz9opDVnUkLieOZyvnIBjHp3kpcHKEfPTx0P0a2U4woxHopAxJx
         Jxjdp1vQ/nGTB2LMPu2UloTCeMSi97T8AyHw+AgZW1xZeuEsycxBR2umIqfz4OqG8TD2
         QOc0M3ob749eSeUNY+6cfzKZVQBQO7ahIO05LbR+IeLpk9QxAztJNPNPeFoOemOwXPxJ
         y8XcF0c72GM5M1jHjKQm1O1nqQY/8FAwOQYSPBuEL8CD7x2qsQoGjmIFWuY98gRJjPq0
         Hkhg==
X-Forwarded-Encrypted: i=1; AJvYcCUCj10LMjmLVcBWh2bb36/2bQz5M7jozirXd34bzmN836OJWFv0dsEj7o+p/TSe3A1GCi+5+PTpmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMLCpIag2ZiBCK9FDcDQ0FV1ix84DuCeSaKZrnk0gYyvGmkOh8
	1QmBMKnV/5xGOsHgvHjjCB4Y8/Xm9K0lRWWtq8k6y2IRMS8vck4fO7vi/oZ09XO7fGRu/xNj/nG
	Cks4=
X-Gm-Gg: ASbGncs1K/dqgrFjmLl6/403j1+DO4UTaOXQMQa8xIVM1x91B9hWFYaOBYxdq1004lQ
	0rITVA0jGUc2x5gq9kLcB4ErjvXkpzWMio6n4BQEYUm5zW6Vbq6G7DKsXPOlQSUCFp8CImfiXHO
	eFOqgxXSFuonN5PWYdYH5ZWoW3RReJhhtHkGUqROrfMnxCIAZDkdUQRJSfWlkm64P4sWrTr3vPw
	i5s30NejrU4Lo1J6k+hwkfUbCtmG4zXxYYia7F6exDo54ktvEzSWweZg0Sah8xLKWB8WWbaA4GM
	Qg3QhZGPFe2WlhLJ1+LpbObasKoRHqlYVd875Qsy2DWf2TGitATKwESser93JT29etY5OVV56fd
	GJbXk
X-Google-Smtp-Source: AGHT+IGUlzNooKv6H53Lv+4jj0Zw67S54d15RSAIPzhmPstWQkhOlgh0PpMBph3Z+r1w+yJha2JiPw==
X-Received: by 2002:a05:6e02:1fe4:b0:3d6:ca61:5f67 with SMTP id e9e14a558f8ab-3d815b5e5bcmr11964315ab.14.1744803224840;
        Wed, 16 Apr 2025 04:33:44 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e02105sm3566624173.90.2025.04.16.04.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:33:44 -0700 (PDT)
Message-ID: <3dfc300f-081c-4824-97c3-842f72d2a7d3@riscstar.com>
Date: Wed, 16 Apr 2025 06:33:42 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Yixun Lan <dlan@gentoo.org>
Cc: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, drew@pdp7.com,
 inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org,
 tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
 <20250415101249-GYA30674@gentoo>
 <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
 <20250415122807-GYA30943@gentoo>
 <hogqotzzpzcow2xjrwh34qcuiu7ooc2qnvlhuvexzvqkrcsfop@mhz26t5vu35p>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <hogqotzzpzcow2xjrwh34qcuiu7ooc2qnvlhuvexzvqkrcsfop@mhz26t5vu35p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/16/25 12:18 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 15, 2025 at 12:28:07PM +0000, Yixun Lan wrote:
>> maybe there are cases that users don't want to issue a reset..
>> so, want to make it optional.. I can think one example that,
>> display controller is up and working from bootloader to linux,
>> reset it will got a flicker picture..
> 
> Agreed. You can just deassert the reset at probe time. That shouldn't
> interfere with a PWM that is already producing an output.

I think you're saying reset can be a required property, to be
harmlessly deasserted at probe time?  Yixun was suggesting it
should not be required, because it might already be deasserted.

Anyway, I don't feel strongly either way.  Maybe the DTS
maintainers can recommend what to do.

					-Alex

> 
>> GPG Key ID AABEFD55
> 
> If you advertise your OpenPGP certificate, I recommend using the long
> id. See for example https://keys.openpgp.org/search?q=AABEFD55.

