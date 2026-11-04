Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828142;
	b=eZbBRMgwh1MCv0cjG835vx1H6FwUTs7izejB6MNDCKDP6CWSbzgsDrjR8/4SdkYS1HXv
	 3EZJK8ZbH1PePIIS2tepuSaAeskMGMsgQkX70Tcfj3W58an4Vu5+Ngo6P3es7DmwT9s+6
	 tAfXbPfBf6pxKvHQUhlIFu0aFn70ao8afu3EL6m+pGcy4sMxt/MY2/bkAQYY0Lbg+k/2H
	 YqAdUz1/PqP+Ga+AycPNiFgOY0L8VNatL6RFVG98mc/hLh9OmGod/nd3bbaCCjLN2Oy1s
	 GAWe2MDywWAdeF92SKxP/X65nj3IBFdXOatXbFAjnTjpX/nosMVIg/lHzFzA4LGb0iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828142;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent;
	bh=/7JrcXZgLdpl6NGyBFMTX/zKwhL1anMhZGiNls+BU5o=;
	b=NPnUinQXHZXLPvNWmLwzaUv/HyHvAuJMrMTHa48KFcmwReMzirtOzr8Ge28yhYwnGciQ
	 D6V4aO8gcBrc05cPVTNp84A8+ffnjk4WBNGv7yHwURh5lmCLLBC8R4DIYqU4yowcu0G5O
	 /jRJH57550s6diBjcxmS1W9vNfFMN1uFHAl+BVf/FOfE3d0mZVLW7lvRtDt0QDJDj5Jfl
	 lcjdsYyDT94YCfOKbnFQ3vjMEC4dmDFwmWNnq3FXkghtEWkGKzNum6F/MgAd5Kzzwq7M5
	 othlwZQB+jV5A2mPcQ5AhptU2jNNu+BGTcJ3CY/4HcnQXbjgnZQQQv/7yDp9pHCKDIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=ob5OVMRV;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60147606E2C5
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 21:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60147606E2C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=ob5OVMRV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=/7JrcXZgLdpl6NGyBFMTX/zKwhL1anMhZGiNls+BU5o=; b=ob5OVMRVUSBeNDNBiUEPoBb6BH
	+Z6m1MGzajBADFSlzRZthHp7MmSBtSpFf24Nn5TR2l2QGyf1xK3uKEpZ8mmnjled7Hm/AD+waTcG9
	eeZeJnzxDTA1MiDRLmHAb19TTLOJpjA89ThQlx1WUyEG7JVZ3AcESDUMdlyE71QI5sZrZqrV65Xnp
	Bvzp/6lI+bNIyN26jPpm1d/uvn7XJ0vfLmU0v5cxTSrEhgZwIZt98HD/BNeFvFl/PwacANTzqBxBH
	EcnNK4GbYzLzLmtK/HkY9QD2L06wMfV+GRkdH5TBHIH5wJKSjN3lINAoL+j1FNCMVLcUYRTPuz5Gj
	bWZrreuQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xOidm-0000000FWzy-2EF1;
	Wed, 04 Nov 2026 22:35:30 +0100
Date: Wed, 4 Nov 2026 22:35:29 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <auulITfR8BrabdVF@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
 <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net>
 <arS-yYLK8Df5knSE@gmail.com>
 <arX7PwOnlz0N9rUc@aurel32.net>
 <arnt6EEacEm3YRIC@aurel32.net>
 <db540b00-a017-4c82-9a6c-93e862dcde67@iscas.ac.cn>
 <ato_lUcnuZV30Mtj@aurel32.net>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ato_lUcnuZV30Mtj@aurel32.net>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

I have finally been able to capture the last few exceptions happening 
for one event where the vectored user copy code is corrupting data. That 
was on the SpacemiT K1.

I added a hook to handle_exception(), activated only when 
__asm_vector_usercopy_sum_enabled is running, and recording CPU state at 
the beginning of the exception, in per-CPU 16-entry tables.
On the OpenSBI side, I also instrumented sbi_trap_handler() to log the 
CAUSE_MISALIGNED_LOAD and CAUSE_LOAD_ACCESS cases. This only fires
during the kernel boot when it tries to measure speed of unaligned 
accesses.

The case I captured was a 4096-byte long copy, from 0x2a883310 
(userland) to 0xffffffd701e54000 (kernel), presumably from a write 
syscall. The copy is considered successful, i.e it exits with a0=0. That 
said after the copy, the source and the destination start to differ 
after the first 16 bytes, at address 0xffffffd701e54010.

The copy started on CPU 5 and ended on CPU 5, and there was only a 
single exception between the start and the end, so it wasn't 
rescheduled.

The exception happened with epc=0xffffffff80e09204, which corresponds to 
the location of the "vle8.v v0,(a1)" instruction. I recorded:
- cause=0xd
- badaddr=0x2a883410
- a0=0xffffffd701e54100
- a1=0x2a883410
- a2=0xf00
- vl=0x100
- vstart=0x0
- vtype=0xc3

As you can see, the exception happened during the second iteration of 
the loop. It is not clear to me why the first iteration didn't trigger a 
page fault, as both 0x2a883310 and 0x2a883410 are on the same 4k page. I 
have also logged the content of v0 at the time of the exception, and I 
can clearly see that only the first 16 bytes (out of 32 bytes) got 
loaded during the previous iteration. Its content matches the error 
reported by GNU as on the userland side.

Then the remaining of the loop continued without exception to copy 4096 
bytes in total.

At this stage, I do not have any other explanation than a CPU bug. That 
said, I have noticed that the problem started when userland started to 
use the vector extension, and with the above, I do not have any 
explanation for the link between the two. I'll try to capture another
corruption event (it takes ages) to see if it can help refine the 
explanation.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
