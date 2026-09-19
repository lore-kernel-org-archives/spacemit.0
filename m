Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B620F3F86FB
	for <spacemit@lists.linux.dev>; Sat, 19 Sep 2026 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812498; cv=none; b=RqnJV+MGdVl1rUColdwQT29xp6oDsnMEv3ZydJeYj1DuGSyNxbMCLkr5tLt4K3Kn9DLw0026pXU3Be15Jk37Nsjk5iNepbMEIPLSgm0mGs2pX0BeXs6cbiJJYZ5oTV0JJBfRJzZDmaYQp4XK8CfijAG24oYrSl1jjYcAI0gOPmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812498; c=relaxed/simple;
	bh=nc04gebJd3pxp4ZajjYKcPFZ2oHKCBHbv9q+aA1Msro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGzFwHRIekNykDSdq+nh6NIDTfNhFc03i2worw+F5sjKJjCd9t+EYt1Qy4n6jEwhNCASBtKQCmAOoHJzAXcCq5am/Hj6Uur1VHDx9eqiONMFKHtjDhgxjLnewYpUnGs3sKOcKmNnyZtl1QET+px32y4nhKaPMRz5GzG41ajo5w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jytaQsAT; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jytaQsAT"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so837582f8f.1
        for <spacemit@lists.linux.dev>; Sat, 19 Sep 2026 03:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789812495; x=1790417295; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEDackXqYkNwDSUsp74coCO6I5hlg5B9lEbDTL2AtH0=;
        b=jytaQsATaxMEn3qX9SBkXTuaJvUr86pKKSz3N6sm0I6bYZDA7di/iq7gAEIHBUSapy
         QEtsyqtQAiAawExcTkZ1DSz0zCJX8QmUNTN2m7Yaw6JQLbAf42FliixJl/Vw7RyJafro
         amb3DQen2WTeE/cRKrPQJkoAUW0xf2Sjuxp4W3CywEIlTYABnFDCiMokjCnzmBfPw4q1
         uxiJVE7Hy7qSqxvEmhH1pQCKSWnbsmUX0MOa4KwwcRyYhg2Qh3Z19fGXP5qo2CVspsxy
         waToDS5MyUC4CJOf3ILQaNSqyJBrrpcaV+KTN+cwp0ClIooG0NwF9S3SRC+5xFlsUI1k
         f2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789812495; x=1790417295;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEDackXqYkNwDSUsp74coCO6I5hlg5B9lEbDTL2AtH0=;
        b=Bd2aZn065oD2kM0jx25VY4QXUryVY1QNDxRbxmPTYXZgXXJPYrSlb8w+Ca+x0AiMvD
         kJK8Z5C2fbE17tuuuv17uT2bcX2hSMqhs3bdZJs6Ve+SIjf7SeFqLMwUiK1oaA76nTgb
         iqWnGK0CRD2GtR20TP/Z1JCiQQ4goa7EoFiu9exaOUPl5r6f23mGkOiScOeQNlXx0VU7
         UPu3sAx/mmH1UhTnnMlNDkfOuYoLlwS1/14Ps7CpWWW/xOpQ61LAgAZs1Id2gQywDlW7
         pholC9zMTgJKgkWMnQpiWM3z2o5kpHMm38UdPbJjctQ7TAKEJ6km+6Jgq6Ry3gB35978
         wWRg==
X-Forwarded-Encrypted: i=1; AKwUvBzc9vZC0v9VIPHAXY3LDOzjV88xSx2apYhj0j8ZMoUU6NyeYf9kFCLOm6aRZ6g0mfmEUgA+Ipwtog==@lists.linux.dev
X-Gm-Message-State: AFuF++nOItt6tzluSpemjJrsS0nB4wmG2hbPjd4s8Ysv2nF+yllOiF2I
	JMgFigP4my8nC1yQztd0a+A4PjQq4tn7+vJHc3v6DrEMGlnYmOzxTEmG
X-Gm-Gg: AYBFou3U8oCyEfNi0CEwjiiJOIztqC27jp1OpBhX+cdDgYZ33heNVATkRA4JiXW1ROn
	ixEuitr9UrZdxoA8J4a0WBK52cqcOzRJQzDd7V9eO8A9H5kecsUuUGhndi4lSPPJ+s6n67Mq8pf
	RHYtM7l084fXvdefofbPj6a5DrKeFGC/6gpLYhPWqAUXqqXohmyjXnd4e66gR08aNJp1VleUj7o
	1O/OTqfkAKCf4zklbmiul3gXoc0jbmbzkMvwNoOk2DCZIa36yGE4a45PfKPeC0EGJMwynhmPUnG
	zVNre+nemHOZmJ845tBFBD28ZUTn5kMY6HzYSnXTQsBcYHTOnL+3eI0OE47zYm22fV5CuyVQqCU
	aZYOXtB+RZ5di520+hSiddllJxtnIPd574uhr3Wg7ugLbb+aNETQU1emV2k8Q8KP9aGFyKCba4V
	nbvTy3/mPEJu3Ta2U4agrR6HmuNKUGDDVdauigOqXe28EYL1YPIbwlrLnNUoUqZ48840Yn84l/N
	wLAo4TrQUflalOnOjtBEgLMXD6G5uBYkvAzduo=
X-Received: by 2002:a05:6000:2409:b0:487:489:7af1 with SMTP id ffacd0b85a97d-4871e3645a7mr7898104f8f.48.1789812494679;
        Sat, 19 Sep 2026 03:08:14 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-130-19.net-htp.de. [89.182.130.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724591eaasm5999770f8f.26.2026.09.19.03.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 03:08:14 -0700 (PDT)
Message-ID: <6a7777a9-a9bc-4acd-a39e-ee5f78cbe662@gmail.com>
Date: Sat, 19 Sep 2026 12:08:12 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
To: Yixun Lan <dlan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260804133236.205668-1-a.heider@gmail.com>
 <ac94820c-5e34-4f07-91de-d08e1d4ef629@gmail.com>
 <20260918225420-GKB297024@kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260918225420-GKB297024@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.09.26 12:54 AM, Yixun Lan wrote:
> Hi Andre,
> 
> On 11:18 Fri 18 Sep     , Andre Heider wrote:
>> Hi,
>>
>> friendly ping, anything left for me to do here?
>>
> 
> Not really, I will handle them shortly, there is one minor
> issue, will fix it while applying (no need sending new)..
> 
> WARNING: please, no spaces at the start of a line
> #33: FILE: arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts:87:
> +       cpu-supply = <&buck1_0v9>;$
> 
> 
> Thanks for the ping (and sorry for the delay)..

Thanks for the fixup, dunno why I didn't catch that!
