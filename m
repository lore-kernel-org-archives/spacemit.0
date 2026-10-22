Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688033;
	b=M63ozp2E0YUltDee7qITdCzidoCOij/EKmuxPF3hmIt5ZS4ek+Ekn6K35SQrBO6XVN7u
	 hyTV4ER3nVKbCnjQpf7Iig5hoNhNPBJQiHVWS1MnH2kM+snpbfF7dsxGgWoAs9++DNF7v
	 AEMuqLsNegtycNOIZ1FlBDA1WLrzNykPrcvGfDYHoNzTc8wnegG8sU+w7gL8gdhLISIIW
	 Y1a1o5Odlc7zVxwEyVfP+zlRmMe9XIvo76sOrAXyueFSCj/q30zTI3Fnog4k6blnWqLOP
	 PBzJ6p6DFp3uLBOx72C28dHLRXVRZZ1lbYZhcFzpOmu1kJd9/v1n9++vbcTyjmJhwrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688033;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent;
	bh=MN3l1M08sCGITJaNtvFuaCEwDyESp6f/Fe3N4avbuGo=;
	b=2wcunnaicrX84A40oIbkSAzJQYI7PnrJ26EpAyx0l7NWaQnL7h3R7Ukq3UKEjkz2Qliv
	 LGFIpIZ4/bLMdBLHuVXBdR1l1B6OurdsXkaQ/gertnkXPn1VIDf1LqAbTA4SHP673EvlZ
	 JD69zJPQB7h3NjQygxxKOwnYul/l1FMe9/kg7DZHcRUUeXP1w0Cgwcb0bw0zxV+EPkBb+
	 MnOqGncaiS+iNUEhQyzPOFhe9nLG1iL1Ympf2Pkc4YI3xcojfHhXz8s6Sl0cGVdgS8y16
	 puUT74EKIU5JlxCYizZfYTmn3HfV/NYphY21h8laZ8/IL53w0hU+CCpxXivkxkabtOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=0vp9tCl7;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7174606A319
	for <spacemit@lists.linux.dev>; Thu, 22 Oct 2026 16:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7174606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=0vp9tCl7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=MN3l1M08sCGITJaNtvFuaCEwDyESp6f/Fe3N4avbuGo=; b=0vp9tCl7c+otLaBYlnXL8J1OF5
	eL2Izybj6MFAyiOHuhixca8q8nzKlYq2EqjjtB5CEuDRRVYuBblQbwD5e1lywvECG7edmLSLcGBQU
	9caE0Ik3Sa/UTTqkCP4XtYhQiXk1eF3Mm0EeAqJFO0tns0ANjYGsZJh3Slz2PgXSNQOvW/DU1aWIV
	toG2cCH+5+bQ0Z4tkJRMJnf1qMwSFfHNW+6rftLyHc/HIqFtU5qSzaQttYOH1FTyryioHwerxcAw/
	QSpt+bsHkRCG4ygAgd9LFYkyeE7C4k9JgkiPqKWH2ardBBYIfzJt8c5T44LHo4ybOc0r+9R1QDzHm
	/63CNNzQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xJw2v-0000000EAHB-2ts7;
	Thu, 22 Oct 2026 18:53:41 +0200
Date: Thu, 22 Oct 2026 18:53:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <ato_lUcnuZV30Mtj@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
 <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net>
 <arS-yYLK8Df5knSE@gmail.com>
 <arX7PwOnlz0N9rUc@aurel32.net>
 <arnt6EEacEm3YRIC@aurel32.net>
 <db540b00-a017-4c82-9a6c-93e862dcde67@iscas.ac.cn>
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
In-Reply-To: <db540b00-a017-4c82-9a6c-93e862dcde67@iscas.ac.cn>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

Some small update on that. Sorry it takes time, it's just the bug 
happens sporadically and I need a lot of testing to reach some 
conclusion (and when I can't reproduce the bug, I am still not sure it 
is not there).

On 2026-09-29 12:07, Vivian Wang wrote:
> On 9/28/26 12:32, Aurelien Jarno wrote:
> > Hi,
> >
> > On 2026-09-25 06:40, Aurelien Jarno wrote:
> >
> > [...]
> >
> > That said Han Gao pointed me to this patch:
> > https://lore.kernel.org/linux-riscv/20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com/
> >
> > I have been testing it, and so far it seems to fix my issue with both 
> > CONFIG_RISCV_ISA_V_PREEMPTIVE enable and disabled. Or maybe it just 
> > hides the issue by changing the timing, as at this point, I haven't 
> > fully understood how the bug fixed by this patch can completely explain 
> > my observations.
> 
> I don't know how that would cause what you have observed either, but it
> does superficially appears to fix a real bug.
>
> > Unfortunately, I have been able to reproduce the issue, even with this 
> > patch applied. It just significantly reduces the frequency of the issue.
> >
> But this, I suppose, is still useful information that we just *might* be
> on the right track.
> 
> Can you perhaps try this hacked together patch below and see if it does
> anything? I just put guard(preempt)() or something around a bunch of
> places I could find that access regs->status. It should apply to 7.1 and
> 7.2 as is. (The coding style is deliberately horrible to minimize diff
> lines and discourage others from shipping it)
> 
> (This adds some more widely-scoped guards, and AFAICT /replaces/ the
> above linked patch from Guobin Zhang.)

Unfortunately that doesn't fix the problem. I am still able to reproduce 
it with this patch :(

I also have tried with a 7.3 kernel, and I am still able to reproduce 
the issue on both the K1 (the above usercopy issue or the not 
reproducible GCC ICE) and the K3 (only not reproducible GCC ICE). 

Disabling vector extension in the device tree fixes the issue in both 
cases. However the LLVM JIT doesn't care if it is enabled or not, it 
just matches by mvendorid / marchid / mimpid so you just get a SIGILL.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
