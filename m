Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E2414A0E;
	Wed, 29 Jul 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317674; cv=none; b=CBXSflOjVelTvpykNT+EBIhW9HuqItq/+VLH/ZV01Jrvzp6cylMbiMCrUJFLmIsqcoR6tXv5J8iub5IhtOwHTqzk1dQMxBMf0n+Hr3vQV5e1Jki2CxZx+WKHrUj/sCbeDLTl7u5VCEOXfDfonJLiCgdT0l5Si3pkPq7FOyuWsVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317674; c=relaxed/simple;
	bh=5zCNE6Z+d9LVETaBb9BQbd9+nu7f2LrNWK7M2PpjQQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Is5AA8TV3eRBaWHiIKzid77W7u+9/5G7sAWahQEyyC65kINgirO1KJkHGTneLwNX9ayXCdeJ7g1L+dvw8FK82rXsTwULyanAwrC1K6jCkKz50hEV1tdfIzNz9g6wa/8gb4YRtN8DrgBe3E/6hDQd8jBMfdC8lxqJX73Kd4sWd8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=kdi/Jtth; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="kdi/Jtth"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ITBzCiYFggLZSp8ukd13GDp1HtfOO2NZFOp5MB2pVow=; b=kdi/JtthPnX56uF4eH+kuw5eYD
	trqbHxfHmfj2NHpVtUVcW1YphSCep8WEl67mFZw5GgO9UpV4+W1D3EhZULM7MIsA5zWe+CPaAkAH5
	0CmOMqf66GM0nECNm8FNlqNbe4PKMqjllXwCBnpAnfmSS8quKSz+rm9OfOiLtH/vLATqMi/6ucNyv
	m6APXjKGTpNxUcruAr+6x8gsWY2gxtVzdpAZ/Bs5m3nsvkzorNdB0SZNnTcCXXPkOlDx6q1W55Ju2
	RVedMHyvQGiZ9eDnyKJR3AqoARyxiWh0Tz8A2QTWWmlvd0rEVGVFkaatlzu/2S1xytayblrXXJGvS
	knDAuHGQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp0gG-00000002JWq-0fjs;
	Wed, 29 Jul 2026 11:34:28 +0200
Date: Wed, 29 Jul 2026 11:34:23 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <amnJH7rsvbtTUheL@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260729013240-GKF76518@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729013240-GKF76518@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Yixun,

On 2026-07-29 01:32, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 23:05 Tue 28 Jul     , Aurelien Jarno wrote:
> > This series adds cpu scaling support for the Milk-V Jupiter boards.
> > 
> > The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> > 
> > The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> > the common part, i.e. everything but the model name and the operating
> > point tables, in a shared DTSI file. This file is then included for both
> > K1 and M1 variants.
> > 
> > CPU frequency scaling was verified up to 1.8 GHz on the M1 board.
> > 
> Looks good to me, will queue for v7.3, thanks
> 
> Reviewed-by: Yixun Lan <dlan@kernel.org>

Thanks for the review. Unfortunately Sashiko pointed out issues in those 
patch series, including preexisting high severity issue that also affect 
the BPI-F3. I'll reply to the individual patches.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
