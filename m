Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939CD1BFE00
	for <spacemit@lists.linux.dev>; Fri,  8 Aug 2025 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754634931; cv=none; b=X+c6zQeD8jcztg7GBfEFBmqAyFw3yKLDR4u4doo64Kstf1Kguz56L9nkt++WwEl7D9edfDnh6GyND3qxRX/8qH9uu+54UViYJcBknBbrOSV+sadK+kTrFBf5QZoD7J6UWzMbjxYjXoLTIy7ly6jghbB2np1gfT/iTh9wYyOhxhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754634931; c=relaxed/simple;
	bh=YngK+0IgR0j5KAC9O8kwtc9pXZLRY7B2jDE94hzuZyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVleWVV/B0fjDi9jHxYA5b5Np642S08YBAa7rkZs6IWMcROAlf78wkDmjjggdfIKqD9ocI0NSlbcw5FFGA1OYPSyV4xpmxVvJ9P+2DKygaNyvQ7eIGGO44xBGIWerEmxHu67gM0GpEba76B3Edn+7QKVehgqQbSD6poPp/WynJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=k7/bBURH; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="k7/bBURH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754634846;
	bh=QcGiq4w682okKuVdm1qm3v4koeCXrUM8SclcFr1jZ5I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=k7/bBURHSaB7kc3cP27DL8QuDVLTVg8jrmRUuGn0NUzdMPmqJP4DdJdNOWlIMnMO0
	 OlCpw7Ks7YawaZctE0rvalIuvIoUlkmqMGW1nuF5vp/PtTeRQ4BPfoxDGLqMiSJffY
	 WEPs+URWcTaeT31E5oq5hTeKAI1chCDMoysx6ays=
X-QQ-mid: esmtpgz15t1754634844tcc2eb4cc
X-QQ-Originating-IP: 8s9Kpd/fbzV3EuHsEpru298bA5IkZi4aBtRN22rDyq0=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 Aug 2025 14:34:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9071104872846208711
EX-QQ-RecipientCnt: 16
Date: Fri, 8 Aug 2025 14:34:00 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Haylen Chu <heylenay@4d2.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH 2/2] clk: spacemit: introduce i2s pre-clock and fix i2s
 clock
Message-ID: <78351F50C5DA0C45+aJWaWKEyO_f2a6Kp@LT-Guozexi>
References: <20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com>
 <20250807-k1-clk-i2s-generation-v1-2-7dc25eb4e4d3@linux.spacemit.com>
 <aJQXKN_ccpWVJ5oZ@ketchup>
 <C7EA7A1D0F9884EB+aJVcqFqix0GF_RnX@LT-Guozexi>
 <aJV2EIC_0E1FQX7L@ketchup>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJV2EIC_0E1FQX7L@ketchup>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NRd2RfivhHiieO1Th5PWfZhf6DvhO1jMM7ZptJBuWfGbKPsg8LwmejfD
	CJb3mFxG8WNAmfgs1jeVMo9rg3VQKZIwRvhTH0/U6bYWSG5KY/VffKRyLNhs9K/kbXfBd/X
	5IqFwNADkr76sMUVZ1V+TS5oawQM5LR1rXD2y4EjR2EGKUDs7rWOCmq2lfysR6GYbFDJ7UQ
	Hvr8o+3WyZzIiR3J+se0ureFKjrRGQzD9QWTr3YDaWK2pQMFnheTRP7SQL2FQ7r4ZWBKib2
	zsoB9lJFoJSCUdqbBKmrBVtAA/ZUcsyd0G9YnFG7bpLC9FmseP2Rdt+65JCJ0ZjWP3n0aYP
	kBciBTFiUeKsLc7J+v+IPXBfaARO/65s3J4Kk5Xv8K5s4i0qDRAXv8x6Op6ihSJWB0FoMMy
	qvZbyoBonn5w9lZPsnrmzPewPsORccIKUQoVKYXAUy/L6ee+5d4RkY5j7VACKguLv4En7Zf
	isn4Aaru5rm1/e9bYWit3q55n/5fCWQ6WW+1ilknkMs2Hw/HJVqa6r0KO8uSVCJLq5KuM2d
	k+1iey8jp7HEe4/B++6BxTV/J32pdhJ04O7s7jqfCgOftjlTsdNQh0H7qKm3uaZOr/gwErU
	QZCUGZaI/ao88iMEMf7ibOnq/Ky1xxe1hISlZvU63kLmrH/VnLgFAB9fAWfhx5r3g31vOn8
	G8Wmo26LLaaTLuQyGtaKsTCG7glbQFqi7ps3wKYWSiJ0AAw/Os3W0maSvqm2AjtJ77QM76W
	RMpYRYI4/uXE1fEkhiynu8CE5+z2SCm1hsLPG086ZhFqy1Kw1Sy+Q7MQcdMOMGCfisO76Yb
	6CcvdwKec5i8CFagGHVy7YwWRQ5aRjbYdhnyMJD1I2ZyXFjht+xdW9n3lNr6ZhmfOrqfqj2
	gU1B5FkVyaD+YYL3bK7/XWT1qAIsJJmKvNT6ykLufZkpMw5TDKs18eHxPQd7cMYFnCxa/xa
	I0Oifu/UVGUgkuG++elfdmELbnaZcSbRT73F94tfe0mS1c20ZlD7XqfopadBDufmReo37Sq
	/VF96MEizNMqRmuKbtDZOLxugh/U+VuLUiCm7aOPYz76P1q04T
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Fri, Aug 08, 2025 at 03:59:12AM +0000, Haylen Chu wrote:
> On Fri, Aug 08, 2025 at 10:10:48AM +0800, Troy Mitchell wrote:
> > Hi, Haylen!
> > 
> > On Thu, Aug 07, 2025 at 03:02:00AM +0000, Haylen Chu wrote:
> > > On Thu, Aug 07, 2025 at 09:30:11AM +0800, Troy Mitchell wrote:
> > > > Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
> > > > for real I2S use cases.
> > > 
> > > This is a little misleading: they're modeled as gates with fixed-factor
> > > for now whose rate is calculated from their parents instead of defined
> > > statically. You could avoid possible confusion by replacing "fixed-rate"
> > > with "fixed-factor".
> > >
> > I'll change it in next version.
> > 
> > > 
> > > > Moreover, the current I2S clock configuration does not work as expected
> > > > due to missing parent clocks.
> > > > 
> > > > This patch adds the missing parent clocks, defines i2s_sysclk as
> > > > a DDN clock, and i2s_bclk as a DIV clock.
> > > > 
> > > > The i2s_sysclk behaves as an M/N fractional divider in hardware,
> > > > with an additional gate control.
> > > > 
> > > > To properly model this, CCU_DDN_GATE_DEFINE is introduced.
> > > 
> > > Could it be represented as a DDN clock taking a gate as parent? Just
> > > like what is described in the published clock diagram. Generally I'd
> > > like to avoid introducing more clock types, there're already a lot.
> > Uh, our new chip(K3) may uses this macro that I introduced..
> > so I don't wanna take a gate as parent everywhere..
> > how about we leave it? ;)
> 
> I wasn't proposing a workaround. What will go wrong if a gate is taken
> as parent of DDN everywhere? 
I think this a bit troublesome...

> Not to mention this DDN variant actually
> duplicates the code in ccu_mix.c.
>
So I’ve ultimately decided not to introduce DDN_GATE.
I’ll change the macro for i2s_sysclk_src from
CCU_MUX_DEFINE to CCU_MUX_GATE_DEFINE.

What do you think? From the clock tree perspective, this should be fine.
> 
> > > 
> > > > The original DDN operations applied an implicit divide-by-2, which should
> > > > not be a default behavior.
> > > > 
> > > > This patch removes that assumption, letting each clock define its
> > > > actual behavior explicitly.
> > > > 
> > > > The i2s_bclk is a non-linear, discrete divider clock.
> > > > The previous macro only supported linear dividers,
> > > > so CCU_DIV_TABLE_GATE_DEFINE is introduced to support
> > > > the hardware accurately.
> > > 
> > > The divider IS linear, from the perspective of functionality, it just
> > > implies a 1/2 factor. Could it be represented as an usual divider and a
> > > 1/2 fixed factor?
> > ditto.
> > 
> > I know you don't wanna introduce new macro..
> 
> It's not about new macros. It's about new clock types. And the solution
> I proposed for the divider with a factor isn't meant to be a workaround.
> 
> For the divider's case, I think combining a fixed-factor and a normal
> divider looks more clean than introducing a new LUT. It solves the
> problem for K1, right?
yes, It solves.

> 
> > But K3 requires this, so whether it is introduced now or future,
> > the final result is the same.
> 
> Could you please confirm whether K3's dividers requiring this patch are
> really non-linear or just imply a fixed-factor?
I will confirm this point.

If I send v2 without removing the CCU_DIV_TABLE_GATE_DEFINE macro,
that would mean K3 really needs it.

> 
> > Please leave it..
> > > 
> > > > The I2S-related clock registers can be found here [1].
> > > 
> > > So this patch actually does four separate things,
> > > 
> > > - Introduce a gate-capable variant of DDN clocks
> > > - Make the pre-divider of DDN clocks flexible
> > > - Support looking up mappings between register values and divisors
> > >   through a table when calculating rates of dividers
> > > - Fix the definition of i2s_bclk and i2s_sysclk
> > > 
> > > IMHO it's better to split them into separate patches for clearness.
> > Ok, I will split them into separate patches.
> 
> Thanks, that'll be easier to review.
> 
> > ...
> > > 
> > > ...
> > > 
> > > > diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> > > > index c59bd7a38e5b4219121341b9c0d9ffda13a9c3e2..253db8a602fe43a1109e2ba248af11109c7baa22 100644
> > > > --- a/include/soc/spacemit/k1-syscon.h
> > > > +++ b/include/soc/spacemit/k1-syscon.h
> > > > @@ -29,10 +29,11 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
> > > >  #define APBS_PLL3_SWCR3			0x12c
> > > >  
> > > >  /* MPMU register offset */
> > > > +#define MPMU_FCCR			0x0008
> > > >  #define MPMU_POSR			0x0010
> > > > -#define  POSR_PLL1_LOCK			BIT(27)
> > > > -#define  POSR_PLL2_LOCK			BIT(28)
> > > > -#define  POSR_PLL3_LOCK			BIT(29)
> > > > +#define POSR_PLL1_LOCK			BIT(27)
> > > > +#define POSR_PLL2_LOCK			BIT(28)
> > > > +#define POSR_PLL3_LOCK			BIT(29)
> > > 
> > > This reformatting doesn't seem related to the patch.
> > It's worth that create a new commit to reformatting it?
> 
> IIRC, the indentation is intended to show the relationship between
> register bits and offsets, which seems easier to read for me. 
Sry I ignore this..

But isn’t the POSR prefix already sufficient to indicate the relationship?

Have a nice day!

                - Troy

> Do you
> have a good reason to change it?
> 
> >                 - Troy
> > > 
> > > >  #define MPMU_SUCCR			0x0014
> > > >  #define MPMU_ISCCR			0x0044
> > > >  #define MPMU_WDTPCR			0x0200
> > > > 
> > > > -- 
> > > > 2.50.1
> > > > 
> > > 
> > > Best regards,
> > > Haylen Chu
> > > 
> 
> Best regards,
> Haylen Chu
> 
