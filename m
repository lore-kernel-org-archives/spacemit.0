Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025FE2D9EE7
	for <spacemit@lists.linux.dev>; Sun, 19 Jul 2026 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784477219; cv=none; b=j3uER6HtxgshhG579ufZ6OUx3YIdCJyqMAuRqInS+9oqkQNWJILSGZc2nZUZNoYiRLOePBLhEgTGtyDCatR6QiJdj+bwt8M5NH5yQKsVXBPzjBr9blmvaJ0fEhwuzZ/wDdp0T7y6Jhs6RMXEShfyUMzZL34MsJDfDisy8XX1mk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784477219; c=relaxed/simple;
	bh=VFTghjX6HKXGwzRY/MGUvlwIx+XVV7uZiVfIe0hJTz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pme5jaNq3eUayAPWQY+UTZA/5qtHILlXZ+RVZmKLCMgkr8EP+Wi6+0KqOexKOq8MOu6mg12q9ande+zzVhylsdGZbma0CwFy9seENBYlyiL2OAM2j3udlwMnGrqRTRWOJFj6LdwWdsH6ZxEH9vGz4gft6svV4D5Ca/PwNftG1p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=ahtVlENi; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="ahtVlENi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1784477180;
	bh=Q8iDxIG5rzBraxaTwXCs8qargwBew5IqNBt/AQGfd0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ahtVlENi3Rsd0F4VNPQMMXB9sLLN28kd2elgVRrmhkB9g7RXYfZp8nFyqLYcF0Mxr
	 w8Lrn6WtqDPO99n/b49BKEjdhP7RxtpA+Noy14wUeqJJ0fkTJmtKzeRccNzRifzx49
	 Gn0YT1oulm9eSg0gIvqd6mQKF21pO9QhH7VtSvEUuK0UR1/E1xnIa2b40zc+rRaAVw
	 A0RpTReWQB4+zo8Z/a192VnEKPG0vYfmAXZlRzph/f5Tb/hYzbgOvrOARkOujuhKHS
	 PIMal1dWGyHKfgiHNRdQI2BhfqYvLw5qzzn7/lMiMimau35njqDh7Kt7if4smwXg4y
	 tz115qnfFqjyA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8E1AEB2213CB;
	Sun, 19 Jul 2026 18:06:19 +0200 (CEST)
Message-ID: <501b84f5-ca7d-441d-818f-eb78dc202983@freeshell.de>
Date: Sun, 19 Jul 2026 09:06:04 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
To: Yixun Lan <dlan@kernel.org>, Andrew Rembrandt <kernel@rembrandt.dev>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork> <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork> <aikmOfazxdrhpty7@mcmanus>
 <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
 <20260710022551-GKA106000@kernel.org>
 <738ce6b8-798b-4689-a0f5-791fe85addbc@freeshell.de>
 <als2a8ra4PB6Y1t5@mcmanus> <20260719102857-GKA8523@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260719102857-GKA8523@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew, Yixun,

On 7/19/26 03:28, Yixun Lan wrote:
> Hi Andrew,
> 
> On 11:07 Sat 18 Jul     , Andrew Rembrandt wrote:
>> Hi E, Yixun,
>>
>> On Fri, Jul 10, 2026 at 07:34:34 am E Shattow wrote:
>>> On the topic of this ethernet TX timing thread I don't know what
>>> this does? Is there a test situation I may try to know if it is doing
>>> anything? Thanks very much, -E
>> Apologies for the slow reply -- I've been swamped the past month.
>>
>> Thank you for taking the time to test this; your results are what
>> prompted me to go back and re-test properly, and it turns out my
>> original premise was wrong.
>>
>> The non-functional TX I originally saw was not fixed by this delay
>> property at all. An unrelated commit that landed between v7.1-rc1 and
>> v7.1-rc7 is what actually fixed the dead TX on my board. While
>> developing this patch I'd inadvertently picked up that change, and I
>> wrongly concluded the tx-internal-delay-ps addition was what got traffic
>> flowing.

I guess this refers to commit 3ea695eb111f ("dts: riscv: spacemit: k3:
Fix I/O power settings") pulled in for 7.2 and with the fixes tag also
applied for 7.1 prior to 7.1-rc6 tag. That was confusing for me until
having the benefit of an explanation by the Fedora RISC-V special
interest group discussion member(s) highlighting that patch, as I was
experiencing three distinct problems for that network interface. My use
of debian-installer just happens to be a reproducer for all three
problems. The Fedora RISC-V SIG members did not have difficulty with
their distro development processes on two of the three problems I
experience which led me to identify there are remaining problems not
fixed in 7.1

>>
>> To confirm, I re-ran a series of iperf3 tests without the delay patch
>> and saw no transmission problem whatsoever -- a full 1Gb/s in both
>> directions with no errors. So this matches exactly what you and perhaps
>> Yixun also observed: on a current base the property makes no measurable
>> difference, because the TX path already works without it.

Andrew, there are remaining problems of de-assert delay [1] and
rmmod/modprobe cycle failure [2]. I suggest you test and validate the
proposed changes so providing another data point of [1] the minimum
delay that is successful. The rmmod/modprobe cycling workaround [2] can
also benefit from testing. In the case of Kconfig with k3 networking =m
as modules, or =y compiled-in either way it would be helpful to know
that your use of networking is not disrupted in some unexpected way with
the expected fixes.

Yixun, are patches [1] [2] expected as fixes for 7.2 ?

1:
https://lore.kernel.org/lkml/20260710063314.1030249-1-inochiama@gmail.com/
2: https://lore.kernel.org/lkml/20260712045233.800748-1-inochiama@gmail.com/

- E
