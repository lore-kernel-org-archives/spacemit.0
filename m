Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFD02D7DD4
	for <spacemit@lists.linux.dev>; Fri, 25 Sep 2026 04:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311235; cv=none; b=AEtilvU+/8XHDoZHtwr2nspsZ7N8Ef3BOa3IZkiblcyaisEEDCHnelmtjnzvOWrNN9zJiR4X2iTmPXAQuzkYCQXbDd/JEK3wUtlKphNQEGbhX5GYkBEiBk78ggSZElkaeywtKAVTawRxHA/yRTuFb3OBoUKc0Ld8nB8h5Hg4S44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311235; c=relaxed/simple;
	bh=cYlN68nBuDSOc7nnWWqy4zdtkCfMVujoFFjmMEE8izQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB3Kru+/MHRBXUvQHeRjQG6015HF/tW2FLTt8MbecxITllF7KLHlOS9SGlEvaK928HEWoREP2f4ZCD/LxCTlkOl9uBgEpuQA2XU4S1vB2/6Jub/EYBR9trTohihBXgcjrQda2g0hTqgvjCTCDZKwi0hvYkRQu+0HPc7xpFeGjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=EqpfudDo; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="EqpfudDo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=sXcHkvmEDQb95xO+WnTUyB8W57ObEH1tkNyscCOypJ8=; b=EqpfudDoW1OLUsayAgWvqZ6jWn
	6ljNv83y6UzA+pq00Rr4pa3abKgbvo+liICioNJ2K4MIv+kl1H5Zhl+y/0sfQygrhG9vgpOefCSlL
	9lGpliSVS/hzOHswfOVii1vQ7QsnVo/5ggbvFuqQyNbRnxcHjQAU2bCxy1OuoTCqJmEljvx+1s9jD
	f/Tu50JZ6N2JzBkhGiYgdjRqbkJx3JS8SX36Mpm4SeIrDCh+VpEi4xE3tOJB+dzqM8Jj1dRZupJpb
	J+Mw3cbF2VlrY7OqsPul4XC+9X+prTgY7534/+DMtFc6Fe7HeDLN0OqYsrtg/87lrQw9X4guZhxn0
	87k9nWHA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x9xjb-00000009gz9-348u;
	Fri, 25 Sep 2026 06:40:31 +0200
Date: Fri, 25 Sep 2026 06:40:31 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <arX7PwOnlz0N9rUc@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
 <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net>
 <arS-yYLK8Df5knSE@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arS-yYLK8Df5knSE@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi Karl,

On 2026-09-24 08:15, Karl Mehltretter wrote:
> On Thu, Sep 24, 2026 at 06:52:21AM +0100, Aurelien Jarno wrote:
> > Thanks for your feedback. Note that at this stage I have not been able 
> > to reproduce the issue with QEMU. I guess it's very timing dependent, 
> > also I am not sure if QEMU simulates partially executed instructions 
> > (outside of page faults).
> > 
> 
> Hello Aurelien, Andy,
> 
> I tested this with a local TCG diagnostic change. It did not reproduce
> the K1 failure, but it answers the partial-instruction question.
> 
> My LLM agent helped me running these tests.
> 
> In stock TCG at 7074591d7954, vle8.v can leave partial state on a memory
> fault, but the vector helper runs atomically with respect to guest
> interrupts [1,2]. Stock QEMU therefore cannot take an asynchronous
> interrupt partway through this load.
> 
> In a bare-metal test at VLEN=256 and LMUL=8, a page fault after element
> 16 left vstart=16 and a snapshot containing 16 source bytes followed by
> 240 poison bytes. After the missing page was mapped, QEMU resumed the
> load and completed the copy correctly.
> 
> I then added a hook to QEMU vector-load which performs 16 elements, sets
> vstart=16, raises a timer interrupt, and resumes at the same vle8.v. The
> bare-metal test completed 262,145 such restarts and 67,108,864 copied
> bytes without a mismatch.
> 
> I also booted Linux 388b607d107c with:
> 
>   CONFIG_RISCV_ISA_V=y
>   CONFIG_RISCV_ISA_V_UCOPY_THRESHOLD=1
>   CONFIG_RISCV_ISA_V_PREEMPTIVE=n
> 
> With the hook restricted to S-mode loads with SUM and SIE set, a checked
> pipe test completed 90,308,608 bytes across copy_from_user() and
> copy_to_user(), including demand-faulting source and destination pages.
> The hook logged at least 327,680 forced interruptions at vstart=16,
> without a byte mismatch.
> 
> As a negative control, I made one load read 16 elements and then retire
> as if all 256 had completed. That produced the 16-source/240-poison
> signature in bare metal, and the Linux checker reported exactly 240
> differing bytes. This is an injected symptom, but confirms that the test
> detects the reported failure shape.
> 
> Correct QEMU fault recovery and forced interrupt restart therefore did
> not produce the corruption. Reaching the 16/240 result required
> deliberately modelling a load that completed early without a trap. That
> fits the observed first load/store pair, but does not establish its
> cause. Your IRQ-disabled result also makes a normal asynchronous restart
> a poor fit.

Thanks for all those extensive tests.

> The normal Linux load-fault path exits before vse8.v and falls back to
> the scalar copy [3,4]. Do you have the original trap PC, cause and fault
> address for the second-iteration fault? Those values could show whether
> an unexpected synchronous trap is involved.

Unfortunately the issue is quite rare, so I have not found a way to 
trace all that information when the issue happens.

That said Han Gao pointed me to this patch:
https://lore.kernel.org/linux-riscv/20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com/

I have been testing it, and so far it seems to fix my issue with both 
CONFIG_RISCV_ISA_V_PREEMPTIVE enable and disabled. Or maybe it just 
hides the issue by changing the timing, as at this point, I haven't 
fully understood how the bug fixed by this patch can completely explain 
my observations.

I still observe a few GCC crashes, on both the K3, but more rarely, but 
without this corruption pattern, just as non reproducible ICE in GCC. It 
is likely a different issue.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
