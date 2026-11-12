Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490439;
	b=M+VGL1LQ+bI04TFc6leZQlC++bcUCKm67LYtAyCMWlGX6G5OjgRD+5EQaf7aLDAae0dS
	 qioukZPe9T2vVs97XLbHYSIeN9R8ewJETx3rYWhAB0an7nA4YghENBrGne73q2skrlapx
	 hlM97rsUqpFw/XTF9jgak7eXMA9Iy5a/8MhqD3+FapiaeeqXzfiNqgJS9lelTEeFhlm6b
	 Taz6jD6Al3fKZ4sCAl4sj2RpM+AikTuZr7tljtq2DmCrOVXrGcQJa5ULK+6lv++raRwU5
	 3LYdWY0iR50iMbbB3YMV17NwVd4IoNt3K7Uxu0Vtw0R46l5pAHLLOyUzKyGZIYE2iwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FwL/KWXkezDHAFArKAWV6uoJFctTAPwUR8TBzgDQZkM=;
	b=GgPA32G/tcUfmdZu9J8X1hoKiNpGabz6wlzVETc00foKuqmDReEh/j7Mdv9raApj3r0G
	 7DEyKDfnUeSA37COTWtVADfCbeDeaNlZ20JrvToib0Hv2nOgNzwhVVa1OoXs5+ZvixXa/
	 nIl7k2cob61QYgrd8yuR2EPPmFl2EUph6nYHbQ4U5HCLVoNx5/R0GjU2sJ/YQY93NinY+
	 oOyh8KKo3i3sDRveha6kWob0SfADVsMUFTiFHwCZ1Z0rmYdfdK1rnUkgIh2nIqY+9/ulQ
	 IJlqMXufd5GBP3sKNsXklxsuR9InzSc0tPsiebARrN+S2dPR0cT7icJl1PUXgZSCvdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QMS4JiIf;
	arc=none smtp.remote-ip=74.125.228.131
Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F09D606A327
	for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 13:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F09D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QMS4JiIf
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c50485c0cb8so171691966b.0
        for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 05:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490437; x=1795095237; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwL/KWXkezDHAFArKAWV6uoJFctTAPwUR8TBzgDQZkM=;
        b=QMS4JiIfHaU1dALff/WxIffHZzQUoJeFXt3yGpFxCepgKkq7ZDmEle/5cdgJrkvpU2
         ndR6COkWFzMKn6ncLRkOJrfB+fPo5iQeY7+kYWPcSoMCqIihIHMZ2vkH5mSfNcog/Qxx
         m0odLlOilh1FjH5UY7gmfiFGqp2Vs5vQQHU7DYSmP1zuHyJYq6pj6M51UaTx8NwZa5f4
         TPxECXueUax8a3J6z9JPwvAZFwa3Keq90OVwuq8SQiOw1ptmlCOPCuyFJNrB6p0yGoVz
         ClSoidfGVXeskprBYDf/thytL8qY9S019LVZSOWA+msEjHf37YDRUBKXWamOhm7xrrul
         zrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490437; x=1795095237;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwL/KWXkezDHAFArKAWV6uoJFctTAPwUR8TBzgDQZkM=;
        b=dfDRFZPzndd9x9aEahnaO82LeZNG4lq5ztLRusS7/u0tgK1vi2jU0ljCQYY4uxDfu+
         BUiD8QcpcY3+66y1q15VIUQJdwO2a9ph4s2j+97yhSMuHfEJacQyhIpf74ps3TdY25YG
         50chUKAHYmK9t2Iu1higpRwH7hUxXx450OQGJSOcDmeVJ9QpCMxp4WpVmP8IwaO2DYpy
         SMcqn8nBXCwWZNl+xfkO+RVNTUucHfcNlhB2eIrdDbHfbcpOSNQgKGtAIkQAisen/sOJ
         lHs2z63WScs5VS9gfNTJgDLFJG4MYalHDKVBcTAnwGQ+m+35za5LFFnmXsF/xaZJnqxC
         t1Xw==
X-Forwarded-Encrypted: i=1; AL+hErFa9R8C54o28plalOZcM1KSqY1KF7opFTnKPrOXSnCTeejnVikjh9UOemO3eV+NggtM6Rv94VblBQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+5CXm2uk6WHUp4IU8RmSaqQWqVL+vmlOikF3+obInSun4lBS1N
	e+NieQWTD7evGIC1fcgB59zoBfqaf4cDfTlJ+hNrN18YqvWoMmgyXOv4
X-Gm-Gg: AYBFou3mYXmqoe3TgG0f5ZTKSm9+73xx4wF9PkwcSRciO+wgJb3vHYA1Dio05OGoG8T
	mvng3h8QmVe3unynTmKpCeMSNHwAEfqS+5uQmKUzdvLI2NPaKXwvo7JEzkfp2bH9bAEupfB2QpO
	hflFsBuxq8KceBCfL+y/HnrNNcRUEZN6vn0F50stX0xp11S7bK7+PmVOaO55VbTt3TPevmI5I/v
	A0cGSS7uLnHroQSG7cVilk35jcimrY0X/9FhmM6505Id0M/CUFX0C075Blz2UwhNQdfRZIEiUV1
	iQzTl9GqKEJQBIhZiR0N/mCkSK6rOjidTzRg6MNtLNrKF8yuni63ZwA/k4qzJZXxpC1HlHIcRzc
	mcubF3ZwtXk05bOsJhPM0WJjhqAVDg6WGruyYn6y7WYZpitHJV0LtpzOKMoAJOSeNE6QOxqTI67
	HajNSlfxgq9XJHPYwsZ/r3GzyxrP3/6wELmH3gUN4FmygKM3mUnWrYfoykwfrZq2ZukRHCesc03
	VzqqDy8ZiTb/10ng/y930bjYQ1IBj05b3KtPD/KQWIgC6n0WWOKQm0A67Ii0tzJdUT/rwFmJk2V
	vuNHBiCTwJ5GmNGUxUyTFgH03WM8zoIWLtSekw==
X-Received: by 2002:a17:907:868a:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c5066b51879mr464464066b.35.1794490437222;
        Thu, 12 Nov 2026 05:33:57 -0800 (PST)
Received: from [192.168.100.182] ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6947sm353760066b.10.2026.11.12.05.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:33:56 -0800 (PST)
Message-ID: <e11f1ba6-6e56-4bac-a0cb-f9258a53f34e@gmail.com>
Date: Thu, 12 Nov 2026 18:33:51 +0500
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn <andrew@lunn.ch>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Tomas Hlavacek
 <tmshlvck@gmail.com>, Muhammad Bilal <meatuni001@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
 <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
 <12a95b3a-9c8b-4a2d-9b81-12b3839e64a9@lunn.ch>
 <DMPNAPNEGQ5I.XYUIB7Y8HDCA@linux.spacemit.com>
 <ee3f414c-fffa-41e6-8bec-6af7ce676c4b@iscas.ac.cn>
 <DMQJ0R4QTE6R.2I492KA9N85CB@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMQJ0R4QTE6R.2I492KA9N85CB@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/26 1:10 PM, Troy Mitchell wrote:
> On Mon Nov 9, 2026 at 7:59 AM GMT, Vivian Wang wrote:
>> On 11/8/26 15:19, Troy Mitchell wrote:
>>
>>> On Sat Nov 7, 2026 at 5:32 PM GMT, Andrew Lunn wrote:
>>>> On Fri, Nov 06, 2026 at 03:44:50PM +0500, Ali Tariq wrote:
>>>>>
>>>>> On 11/6/26 2:43 PM, Troy Mitchell wrote:
>>>>>> On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>>>>>>> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>>>>>>>    		return 0;
>>>>>>>    	}
>>>>>>> +	rtnl_lock();
>>>>>>>    	emac_stop(ndev);
>>>>>>> +	rtnl_unlock();
>>>>>>>    	clk_disable_unprepare(priv->bus_clk);
>>>>>>>    	netif_device_detach(ndev);
>>>>>> This can deadlock. emac_stop() -> emac_down() calls
>>>>>> cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
>>>>>> emac_tx_timeout_task() starts with rtnl_lock().
>>>>>>
>>>>> Thanks Troy, that makes sense.
>>>>>
>>>>> For the deadlock, I think the correct function to call is rtnl_trylock()
>>>>> inside the emac_tx_timeout_task(), which would return if the lock is already
>>>>> held and will hold the lock if it is not.
>>>> rtnl_trylock() is generally a workaround needed for badly written
>>>> code. Please try to avoid it.
>>> Agreed. If the reset is done in place, the work does not need RTNL at all,
>>> so .ndo_stop can keep cancel_work_sync() as is.
>>>
>> Thanks for the diagnosis and suggestions.
>>
>> Although, maybe we could simply avoid cancel_work_sync() in emac_down()?
>> emac_tx_timeout_task() checks for !netif_running and does nothing if
>> already down so it should be safe. The task cancel_work_sync() in
>> emac_remove() does cleanup on unbind so the task is not leaked.
>>
>> This seems to be the pattern in other drivers as well. What do you think?
> That was my first thought too, but I'm not sure netif_running() is
> enough here. emac_suspend() calls emac_stop() directly, so
> netif_running() is still true and a pending work would stop the device
> a second time. And since the netdev is devm-registered, emac_remove()
> runs before unregister_netdev(), so the work could be requeued after
> the cancel there.
> 
> So we'd still need to cancel it in suspend and remove, and at that
> point resetting in place looks simpler to me. What do you think?
> 
> 

Thanks Troy, Vivian and Andrew. I'll drop rtnl_trylock().

I think a simpler approach here will be to go with Vivian's suggestion
of dropping cancel_work_sync() from emac_down(), and handle Troy's two
cases by disabling the work where the device is stopped without the core:

1. Suspend: emac_suspend() calls disable_work_sync() before stopping
    the device, and emac_resume() calls enable_work(). So the work
    can't run while the device is suspended.

2. Remove: emac_remove() uses disable_work_sync() instead of
    cancel_work_sync(), so the work can't be queued again before the
    devm unregister_netdev().

For a normal close, the work's existing netif_running() check is
enough, because the core clears it before calling .ndo_stop.

With this, nothing waits for the work while holding RTNL, and the
work doesn't wait for itself.

v2 will have two patches. First the TX timeout fix (reported by Troy) 
then the suspend/resume patch, which will take
RTNL after disable_work_sync() and before the netif_running() checks.

If you still prefer resetting in place, please let me know.

Regards,
Ali

pw-bot: cr
