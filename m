Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1763B71A7;
	Wed, 29 Jul 2026 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318186; cv=none; b=fEIJQnBgsrsF7ZC6DOnujaJixOrUqm03XjFh6v1VIk95fm/6e5PiQZ6cAoFdcvPhTKGt79Z/jxxBuRvkyxY/X6BuUq6d7E9m9SAMOAJCysMGg+GoPGyNHyTn2W5LvvTlGrd8/7pom+G5sSYCIk4gdQBfA++iayk3tnJBLO57WP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318186; c=relaxed/simple;
	bh=2RwU+JhiPReX6IkCruketXeUO5gcY8z4nBo9G0L006Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcOdtjgXSoEFYXe0uPcXuMXB/miNJcovxcEqYSefcgHaG4gK6IZGfuW2LMPgDRAWN6jcz3+o61rVpMBekQbzf4xQKZxZ3qrLRGQcu5U+vNziYnEpvePGn1AXN62u7sNvwMWrxshE9RFM8un0s7ZzcY3Jdk8Gp2gxdeT81EPrYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/QafSwO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/QafSwO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F631F000E9;
	Wed, 29 Jul 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785318184;
	bh=gAID/OGinxtFgFlPhsHRor54uCIhJClSpvnVsPSAhfg=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=N/QafSwOO2Ah6PDwebPgumjrBc0bKjuEGD80CVu02u29/3vRbP8rofdK5/GV5A2iH
	 tMGta/+4aErf/bvHSA3DQkV3aFercKNuxrUo5DpS+k0A9xoY4F+9hYP6S+G3bMuGyh
	 ilySaMNVvuuey+5I1sRSLWU6N3nsTt5XGyslI+wBNOnPUDcCevda5ERjKhMx704GXX
	 qPvbft+8KKLdTr4l2R3YG5hFmTzhrScNJ+qdxv7AUw9wWGVQsKuiLrg/bVNIwmmDvN
	 MVIU2zeqg5OMD4WBQ04TrlbhvV1GflRFmluVDeMINRTj8/E3JBRwLTmHcve2+4aKNo
	 4O2xAsdU7esnA==
Date: Wed, 29 Jul 2026 09:43:01 +0000
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <20260729094301-GKG76518@kernel.org>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260729013240-GKF76518@kernel.org>
 <amnJH7rsvbtTUheL@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amnJH7rsvbtTUheL@aurel32.net>

Hi Aurelien,

On 11:34 Wed 29 Jul     , Aurelien Jarno wrote:
> Hi Yixun,
> 
> On 2026-07-29 01:32, Yixun Lan wrote:
> > Hi Aurelien,
> > 
> > On 23:05 Tue 28 Jul     , Aurelien Jarno wrote:
> > > This series adds cpu scaling support for the Milk-V Jupiter boards.
> > > 
> > > The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> > > 
> > > The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> > > the common part, i.e. everything but the model name and the operating
> > > point tables, in a shared DTSI file. This file is then included for both
> > > K1 and M1 variants.
> > > 
> > > CPU frequency scaling was verified up to 1.8 GHz on the M1 board.
> > > 
> > Looks good to me, will queue for v7.3, thanks
> > 
> > Reviewed-by: Yixun Lan <dlan@kernel.org>
> 
> Thanks for the review. Unfortunately Sashiko pointed out issues in those 
> patch series, including preexisting high severity issue that also affect 
> the BPI-F3. I'll reply to the individual patches.
> 
No problem, I can wait for your v2 series, but may postpone to next merge
window due to time constraints..

-- 
Yixun Lan (dlan)
