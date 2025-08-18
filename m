Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358731E105
	for <spacemit@lists.linux.dev>; Mon, 18 Aug 2025 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522557; cv=none; b=DTaNPKwTAAA2u79EzY25S/ETlNJ079kjx4cg2c+xUxEpEPJbylgLFCWYjj6qeFod6g/17VpWnGqa2Tq7c74U4aoHbeY/eT3WFIka4MG4yF4OAji0ulIJN5XUX09ozxPe/I3/8rAXIKj26GHwYsPFQV9DOpZASpsUM0C1XhRgBAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522557; c=relaxed/simple;
	bh=ZWlzv9zQPgG3T4Qdt+COdLbnVTsm7kZtfnXMkGnLfdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6VvVU6JwCPXssW+tqlbQSn3EMSnYepPU8hNKPR0qQRKKbipxSACySHPyyjErnudxhnbiGustXHbrekbPYsGfdgy7VRutNmnAvUS2V6Me//surRl/GJHkVzRc6O5uxff7Xr2tePGWECD+Qwt9lE+fQ9LkUb1y8EItWEVRCr6WGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=KTF0ZmbZ; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="KTF0ZmbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755522486;
	bh=s8YclNR8beo4nWkkZUjnovn1goim6RIxNT6d2tnjL/s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KTF0ZmbZZcLnmrdiokOxKonJKRDPuK3ldJN39AXjBl05dQGjorzbBYxT+Z7AUjeiu
	 CDdXKglwU0ci+Qz02k2fkW+u8nVBCITCqICJFT91NNNQuc/YFuqLUY9jMfmpT00yYE
	 NYQVrCfiuHCbPgHK6LEeL4z7ts+9I92lCXKM/x3c=
X-QQ-mid: zesmtpip2t1755522484tf2d46652
X-QQ-Originating-IP: /v1dWevNYr4qGYbGv6tjmtqkcrChCHifqsQeMmx0+5s=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 21:08:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14735046647836716306
EX-QQ-RecipientCnt: 16
Date: Mon, 18 Aug 2025 21:08:00 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Haylen Chu <heylenay@4d2.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v3 3/3] clk: spacemit: fix i2s clock
Message-ID: <2CB30FE47E82A003+aKMlsDlLnLqh2fC0@troy-wujie14pro-arch>
References: <20250818-k1-clk-i2s-generation-v3-0-8139b22ae709@linux.spacemit.com>
 <20250818-k1-clk-i2s-generation-v3-3-8139b22ae709@linux.spacemit.com>
 <aKL6ormE1N72fwVG@ketchup>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKL6ormE1N72fwVG@ketchup>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N2bAIxLK0eln80JCKSJv13qkBZf4ZOHw9t6e3977sV8zdayvYp8Z3QQv
	rM2Aj17hri94+TrhvtdYQWNDE7irGpCDMlF2nhO5DfqpyvpQ4Y76QpDr3hHXH7RV+piyU9D
	PdDPMWUHqfdPNt9inkUivBKkSzJcDG2PdDZuj6JV40DafR0Dz4KBobm3wL5wYgTTdAq6Kkv
	714qePlH4J15u9zolEDFCvAVKCA222A6s8lpTOUKBJnZPgBz7xmllNjiPwcGCwrP8hnLFdM
	RIKSIbaSpBQyXprUGKXnOQKanOTDlV1wJrvfJOGnUgKWvHN/GGt7ReeX+5VZRrr4DwN73/4
	lT98bivxcvE048Ofm8SjPzRCULtku19bOjrWo4QVAzESvhOpM56PkGKos1rirvkGPnrnxgh
	koPY4z/Qr3CvzW+iQWVSs3+LHb1pak6MV8x4iONfpMVej0nelei2xe/Px5Pl7jnT6BbTpiP
	6kFiFNm446y/ap37JXPaEl52NzXKYsf6LON5zmRXc/aih09muUNUCdMkJQMogWtAgKJNhb3
	xH1sjfZELHnPmo+l8rtDNkGj6MBOHSMmiMPyD886pb4kaRNc1IB96gEvarlRurxMD3eIS7s
	occyzG3kOeVoBDXurftGwSHMh9+yPLNZekXLUa86CY7GUdBIKMDIQ01qvEAgGaj+Fg3bZxy
	WdbyLuzM4N4K5akGwlrree76qNA290eNd50mMU0wJ8R45qIoRurdBNkRDVtfW4y4wETCigu
	fN8fbDpUIvtcLGWP12OLztxprXYTMBLqjwkX2ChJ7tJCPeCSn1KtSinFx0j/6bYznZ30Bbp
	g5X3CeEilEygDSVhfscq30nA14ZXLScGWtaXHsOh6NaUxoFSLQys/vFjnipeYzMdt47PcSi
	gbxGIM27Lra8FiiFzv895WE1c0dzExxp5yBi+GaflwLkaV1w7//1vbMbFr7/GFadsPNfBp1
	HH6UvI/Fs2rvak2u8wiJmZe4esMRpKfTBcuSgxqhGtmLKkcYqsTBjcH9VVTWAjSYPf8Sn2h
	6hG1PC2aD60DDCT/dlsCflASjFcazmIkOD7dUd0koC0/5gSeVoNuD69kHEiIC1Ewk/yvFzD
	p2q53UjnbS/
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Hi Haylen,

I accept all ur suggestions and I'll send v4 ASAP.

Thanks for ur review!

                - Troy

On Mon, Aug 18, 2025 at 10:04:18AM +0000, Haylen Chu wrote:
> On Mon, Aug 18, 2025 at 05:28:22PM +0800, Troy Mitchell wrote:
> > Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
> > for real I2S use cases.
> > 
> > Moreover, the current I2S clock configuration does not work as expected
> > due to missing parent clocks.
> > 
> > This patch adds the missing parent clocks, defines i2s_sysclk as
> > a DDN clock, and i2s_bclk as a DIV clock.
> > 
> > A special note for i2s_bclk:
> > 
> > From the definition of register, The i2s_bclk is a non-linear,
> > discrete divider clock.
> 
> No, it IS linear. It just comes with a 1/2 factor according to your code
> (I'm assuming there's a typo in the table below).
> 
> > In calculus and related areas, a linear function is a function whose
> > graph is a straight line, that is, a polynomial function of degree
> > zero or one. (From Wikipedia)
> 
> > The following table shows the correspondence between index
> > and frequency division coefficients:
> > 
> > | index |  div  |
> > |-------|-------|
> > |   0   |   2   |
> > |   1   |   4   |
> > |   2   |   6   |
> > |   2   |   8   |
> 
> Index = 2 appears twice in the table. Is this a typo?
> 
> > From a software perspective, introducing i2s_bclk_factor as the
> > parent of i2s_bclk is sufficient to address the issue.
> > 
> > The I2S-related clock registers can be found here [1].
> > 
> > Link:
> > https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb
> > [1]
> > 
> > Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > Co-developer: Jinmei Wei <weijinmei@linux.spacemit.com>
> > Suggested-by: Haylen Chu <heylenay@4d2.org>
> > Signed-off-by: Jinmei Wei <weijinmei@linux.spacemit.com>
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/clk/spacemit/ccu-k1.c    | 29 +++++++++++++++++++++++++++--
> >  drivers/clk/spacemit/ccu_mix.h   |  2 +-
> >  include/soc/spacemit/k1-syscon.h |  1 +
> >  3 files changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > index 7155824673fb450971439873b6b6163faf48c7e5..b2c426b629a37a9901bbced26fc55c5f1b34eba5 100644
> > --- a/drivers/clk/spacemit/ccu-k1.c
> > +++ b/drivers/clk/spacemit/ccu-k1.c
> 
> ...
> 
> > + * i2s_bclk is a non-linear discrete divider clock.
> > + * Using i2s_bclk_factor as its parent simplifies software handling
> > + * and avoids dealing with the non-linear division directly.
> > + */
> 
> And thus this comment is wrong and misleading. Suggest something like,
> 
> 	Divider of i2s_bclk always implies a 1/2 factor, which is
> 	described by i2s_bclk_factor.
> 
> > +CCU_DIV_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_bclk_factor), MPMU_ISCCR, 27, 2, BIT(29), 0);
> 
> >  static const struct clk_parent_data apb_parents[] = {
> >  	CCU_PARENT_HW(pll1_d96_25p6),
> > @@ -756,6 +777,10 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
> >  	[CLK_I2S_BCLK]		= &i2s_bclk.common.hw,
> >  	[CLK_APB]		= &apb_clk.common.hw,
> >  	[CLK_WDT_BUS]		= &wdt_bus_clk.common.hw,
> > +	[CLK_I2S_153P6]		= &i2s_153p6.common.hw,
> > +	[CLK_I2S_153P6_BASE]	= &i2s_153p6_base.common.hw,
> > +	[CLK_I2S_SYSCLK_SRC]	= &i2s_sysclk_src.common.hw,
> > +	[CLK_I2S_BCLK_FACTOR]	= &i2s_bclk_factor.common.hw,
> >  };
> >  
> >  static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> 
> Best regards,
> Haylen Chu
> 
