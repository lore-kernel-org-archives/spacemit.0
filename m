Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F8271443;
	Sun, 19 Jul 2026 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784456942; cv=none; b=FlUxeKqzwSZS9qf8qfritinURrAdyHZ2haotIf7Q6bNczDn4TM/CTV14BBhO57DO5QxC4hSvjKZfmg6uIisTA4cwoGGFJbl+w9GMfpMBekWBYPes5rPEbty/gmXCE2AEAdMD8bxSnhLOhzYsHqL0dWkcqTyjQy+RZTQbza1Rlnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784456942; c=relaxed/simple;
	bh=xTmgJoX5Xx9MAeOhEaswcoYvzs+nGlOzSAA6zEP/yzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mI/4N182lG6sBjF77MmbCVdk98hZMTAAR+6vFjPl7IfNu3j0BnfasRw6+0p/uSSWsPr6BI2FPnCBC+3cNsW7oD82r0MWmwRJfhPsZIyRrDPD7zNa4OsOtnBQWqXgtEzVkSCnb6Im7DOZPt3vkr9ctNjXHcdnP4SP3OzqPuUTu+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eq4GXvPK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eq4GXvPK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5121F000E9;
	Sun, 19 Jul 2026 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784456940;
	bh=ETZXRx5XNfVk+Trkw1tINvb56g2yDS5JttoGN+C4/Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eq4GXvPKRSfXFRzSYFY7TwM5egRhknT5jUTz/LfLAihXSCUN5DvGsFGUv06UwvXmi
	 RiRB4ngzWiuijrDDXZ9tAeSp4rxEv5Rmwqe5sXbrCF30AcjEI7+W0HceG6xsC2dA/c
	 D3HlCjqNwOVyxESfkhOuMBayuoboqds/2/m/eyKmIM69AzP54snk4Rr0tR08XaRQ9u
	 SmviFiQoFqyx5IKWoH8pZmfKzpdzYI6yaLiTS5JHlB9VUX+3EVy5ZLWgdotYfeV7hu
	 LV8MVnRVhsD3mjFrEMcYheVowC4LDPGR/v42Hsm0ucn7dAVsd3QGsj/cQo3E3bsEmi
	 UfII5Ou3KNE9A==
Date: Sun, 19 Jul 2026 10:28:57 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: E Shattow <e@freeshell.de>, Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <20260719102857-GKA8523@kernel.org>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
 <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork>
 <aikmOfazxdrhpty7@mcmanus>
 <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
 <20260710022551-GKA106000@kernel.org>
 <738ce6b8-798b-4689-a0f5-791fe85addbc@freeshell.de>
 <als2a8ra4PB6Y1t5@mcmanus>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <als2a8ra4PB6Y1t5@mcmanus>

Hi Andrew,

On 11:07 Sat 18 Jul     , Andrew Rembrandt wrote:
> Hi E, Yixun,
> 
> On Fri, Jul 10, 2026 at 07:34:34 am E Shattow wrote:
> > On the topic of this ethernet TX timing thread I don't know what
> > this does? Is there a test situation I may try to know if it is doing
> > anything? Thanks very much, -E
> Apologies for the slow reply -- I've been swamped the past month.
> 
> Thank you for taking the time to test this; your results are what
> prompted me to go back and re-test properly, and it turns out my
> original premise was wrong.
> 
> The non-functional TX I originally saw was not fixed by this delay
> property at all. An unrelated commit that landed between v7.1-rc1 and
> v7.1-rc7 is what actually fixed the dead TX on my board. While
> developing this patch I'd inadvertently picked up that change, and I
> wrongly concluded the tx-internal-delay-ps addition was what got traffic
> flowing.
> 
> To confirm, I re-ran a series of iperf3 tests without the delay patch
> and saw no transmission problem whatsoever -- a full 1Gb/s in both
> directions with no errors. So this matches exactly what you and perhaps
> Yixun also observed: on a current base the property makes no measurable
> difference, because the TX path already works without it.
> 
> Given that, the patch isn't the fix as described in the changelog, and
> the property has no functional effect on this board.
> 
..
> Yixun -- since you've already applied it, could you drop it from your
> tree? A revert is fine too if it's landed somewhere non-rewindable, but
I can drop this patch

> I don't think it should go upstream as-is: the "Fixes:" tag and the "no
> ethernet traffic passes" rationale are both wrong. Sorry for the hassle,
> and thanks for queuing it in good faith.
> 
No worry

> 
> Sorry again for the noise, and thanks E for the careful testing that
> caught this.

-- 
Yixun Lan (dlan)
