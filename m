Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A938DC4E;
	Wed, 29 Jul 2026 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338179; cv=none; b=dfkzwA0vxUR0jMyiwTIA2aUUvNpvcGGVJtWetGaAygQkcCzpIkWhrsTIJLhCauIFu5P9SN1P1z9WH5cz6QW1jwIK4975GbYJkU6JthqdHKVimrYdcbvRI7L2avxBGeHZXjtXon7SfnCNgTIM72rMWxwdHSUzGf3ohPCDqKwsAPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338179; c=relaxed/simple;
	bh=ZFO9ENX+rvggfRbPTAspC5Lc7T2fTo+r4EP3eIJbHl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxW+EyU/fglIgbTrahmjIsHr8laL21E2VXaQ6rFY6Tam2xJpg8UR9cMYnlekV3PhAanwd+CoYIqyEDwmtR6UEMA12XLsUy14vItgJVMPcbFpYEeCP8AKVnvJO86pwabMcmN0/EJXMz9A/kFP+cy7MIj8NK+aXjHoYQDXW2VO7rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=IgNSIRBF; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="IgNSIRBF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9E5ALZ0/ODFdfRiIDSfcsJYZbOjkT0QKDIEAO2hfH9I=; b=IgNSIRBFWOL7iNGvwLRxojQAbX
	TsyaelWAJUrlTXEEdvpD4D+GqQsm5h2SrVsfplJY23Bb28GeAPsV+fzli1py4SjS0luKouqY5Id4S
	fh2/Qw12/L06nAPAC4VVIA1KMSfpZ+4+XdfrmcbryRuTw8AqUbvym8k3Zy8TiH7O3OmW/WR6CNrc8
	ce4wWEmaFGmC7TZ3pbuZ5xC99zHCBOR44io9VMfiX51qoKd0pKA3e9LoA8DDz7FEkwn5UL+8Bq5c3
	FOuRsDEl198uix3U9ycYRIOUxDI5csiDtc6rYlRkNW9Sc7XZq3ehlDrD1xG5T/vDh0Zm04++hobsN
	O27Osq9A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp611-00000002emq-3aYy;
	Wed, 29 Jul 2026 17:16:15 +0200
Date: Wed, 29 Jul 2026 17:16:13 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <amoZPV-wdchZuCq_@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260729013240-GKF76518@kernel.org>
 <amnJH7rsvbtTUheL@aurel32.net>
 <20260729094301-GKG76518@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729094301-GKG76518@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Yixun,

On 2026-07-29 09:43, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 11:34 Wed 29 Jul     , Aurelien Jarno wrote:
> > Hi Yixun,
> > 
> > On 2026-07-29 01:32, Yixun Lan wrote:
> > > Hi Aurelien,
> > > 
> > > On 23:05 Tue 28 Jul     , Aurelien Jarno wrote:
> > > > This series adds cpu scaling support for the Milk-V Jupiter boards.
> > > > 
> > > > The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> > > > 
> > > > The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> > > > the common part, i.e. everything but the model name and the operating
> > > > point tables, in a shared DTSI file. This file is then included for both
> > > > K1 and M1 variants.
> > > > 
> > > > CPU frequency scaling was verified up to 1.8 GHz on the M1 board.
> > > > 
> > > Looks good to me, will queue for v7.3, thanks
> > > 
> > > Reviewed-by: Yixun Lan <dlan@kernel.org>
> > 
> > Thanks for the review. Unfortunately Sashiko pointed out issues in those 
> > patch series, including preexisting high severity issue that also affect 
> > the BPI-F3. I'll reply to the individual patches.
> > 
> No problem, I can wait for your v2 series, but may postpone to next merge
> window due to time constraints..

Yes, that's understandable. I have just posted a series posting the fix 
for all K1 boards [1]. Once it is applied the patch 1 ("riscv: dts: 
spacemit: Add cpu scaling for Milk-V Jupiter") can be applied.

Other patches definitely need a v2, I'll work on it, but it may take a 
bit more time.

Regards
Aurelien

[1] https://lore.kernel.org/spacemit/20260729150722.1598630-1-aurelien@aurel32.net/T/#t

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
