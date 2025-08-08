Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54F2F30
	for <spacemit@lists.linux.dev>; Fri,  8 Aug 2025 02:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754619154; cv=none; b=Ew7GhZpDcBIE7f7vidvAwKZCiIosnokQh9hyMjqHY4c6yIoHhJOx4qUSf2rZusfg2v52xXA7ts+lC9HsVkNgfW2yePZ3GL+lBFZnw58Vjc0EE3xzNYjSROdsljql+rW5Pf7w+c4V+3iyFX5H5wxqEXsT9oUPAuohlfPtUCVUT8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754619154; c=relaxed/simple;
	bh=i9lpry8Igk1iVBOghldNQbrNw1AdbekEz7pm+wEbS7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkz23ZqQShEY0KHgaBEuDgQbgEUwD/fqnEjOA2POGhDlSc+QybKUaC0WIaT/CR+GNjQon1uGRzFXUPrTjomTO+88m86cbU4S8FG67vqrSaGRorz3MElGJtIcNCOJUIJubVnGB5FV3bOw1708tt37iz2al5ynTUSF49LyjnwDFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=bbCjJ+MG; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="bbCjJ+MG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754619052;
	bh=XruLpPGKKhIAXV5GiyK/wgZqZKwAzbK6bCViQs/BVy0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=bbCjJ+MGt+AS7mnhKGwiwrFfxPOcH4ok5PZ6ZV+tuI4Qg6AJA2fVigsmkZAT3miPv
	 O2oNKYyL5VjmC/rmPFyQ87Nv9kNL2YjmiF6BCbeqTGA4B+Qje0Ld+6MQkN+42UxpRP
	 TkwbvnhXjFbu8IGUsacuRiXN0Qi2NEI3sWQeUKAE=
X-QQ-mid: esmtpgz10t1754619050t37e96f67
X-QQ-Originating-IP: r9yuw17eteziLvplyQDL5/oFpwlod3gjP0a44mCWCbs=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 Aug 2025 10:10:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4317720997078926859
EX-QQ-RecipientCnt: 16
Date: Fri, 8 Aug 2025 10:10:48 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Haylen Chu <heylenay@4d2.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <C7EA7A1D0F9884EB+aJVcqFqix0GF_RnX@LT-Guozexi>
References: <20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com>
 <20250807-k1-clk-i2s-generation-v1-2-7dc25eb4e4d3@linux.spacemit.com>
 <aJQXKN_ccpWVJ5oZ@ketchup>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJQXKN_ccpWVJ5oZ@ketchup>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N8tT1W7MFzrwFp9BT63vKlCb+S+S1bPCkznHmwkFIErQrR8ilBAwxIel
	e+e85YXK8CJQaMp1BdZc1FgHf9riGqUMC1GwVIunxHD7AKQ8AiUyd/oTQQQx9POERrtYV82
	XGQdzqTL7DmodHxe8wbFVbUveH5Ks3GDR1GfCvW5qlwYP2jkhSTxJreeSxzqn7IIPzoK5cd
	bzZI+4iRP4X9LQTR/z66yAq6/TZ7FNopMW/SdVWnxhuEFrvWyATrUfOD5yK2RVAJ9E7tZqK
	//v665N1BtEExewCo/3RSgZLcrgzvhyeJjW1ViPpzxYpbN/+/5UN3e2aSNN8CF93gHjAKuj
	FiT25I3JTdHcGZ6rnsEpH696yaqSLNRrGb1ay30w9gzyg8TlWFqo+VfIpa6jlZe6KLv6a8+
	GxkzJzKZioQ+Efs2yIGU5lMFfgKVMPQYrCEvP1xdPo8CH49tEvg2bWJb9V9tnzPrLbUg6uQ
	E7r09PH89CaLZ/EQXpSOKOxFVKaCIF+pztb5vA49ITgLh8i7ZmbBvnYAqUtQnzX9ViQ0o6O
	8TznlyrWiplya1q2lr23Yr4RtYsCZ2kOwVqQGVvgIhvYhYdRo/4wtCMWwa3CuuUm0V2LIKT
	TV/ZYnnX1R7Kv6np0jpm2kci0rOv/0YEiqEFqqPeogQStSN0icFTz3PR97LkdTu/ex2UthS
	nuG0X/i+zIpF6jckcs5yH/cnY4x/5wHIkxyw/XW2yqDBgj2SJDfcY8YigPCMb70wHsLPjuh
	rRXySCprMN8lsQUfzbreL8VbfnOxxduGajmJ58Okq8GjB1+mieXEdGBTCKN3SooDowGkbhr
	XnsU2ddqjPjwJr91kEfsPozsl+PsEjqYctB+M1juDc1K5PZjX6EXgeWuWfa/LcY9w80kGZy
	YDwtPmxsrwighzrDQnP89ndzevMhnm0SCIpoCGsTkFIUgBMUo0TEjFeMnHw7EwMqZt+Hgxd
	XgJjssHN4dxFA9eijx8RbhgqmwwAFfTUyPpDsbaUPq2pxubsuCZFNXGO7ton2TBy2v91zLj
	dQ3bw8yitLTBX7TzzxzI4SmeM2d3J+jNUW48/c7vNfu31c6QdclMGamkeHCz8=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Hi, Haylen!

On Thu, Aug 07, 2025 at 03:02:00AM +0000, Haylen Chu wrote:
> On Thu, Aug 07, 2025 at 09:30:11AM +0800, Troy Mitchell wrote:
> > Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
> > for real I2S use cases.
> 
> This is a little misleading: they're modeled as gates with fixed-factor
> for now whose rate is calculated from their parents instead of defined
> statically. You could avoid possible confusion by replacing "fixed-rate"
> with "fixed-factor".
>
I'll change it in next version.

> 
> > Moreover, the current I2S clock configuration does not work as expected
> > due to missing parent clocks.
> > 
> > This patch adds the missing parent clocks, defines i2s_sysclk as
> > a DDN clock, and i2s_bclk as a DIV clock.
> > 
> > The i2s_sysclk behaves as an M/N fractional divider in hardware,
> > with an additional gate control.
> > 
> > To properly model this, CCU_DDN_GATE_DEFINE is introduced.
> 
> Could it be represented as a DDN clock taking a gate as parent? Just
> like what is described in the published clock diagram. Generally I'd
> like to avoid introducing more clock types, there're already a lot.
Uh, our new chip(K3) may uses this macro that I introduced..
so I don't wanna take a gate as parent everywhere..
how about we leave it? ;)

> 
> > The original DDN operations applied an implicit divide-by-2, which should
> > not be a default behavior.
> > 
> > This patch removes that assumption, letting each clock define its
> > actual behavior explicitly.
> > 
> > The i2s_bclk is a non-linear, discrete divider clock.
> > The previous macro only supported linear dividers,
> > so CCU_DIV_TABLE_GATE_DEFINE is introduced to support
> > the hardware accurately.
> 
> The divider IS linear, from the perspective of functionality, it just
> implies a 1/2 factor. Could it be represented as an usual divider and a
> 1/2 fixed factor?
ditto.

I know you don't wanna introduce new macro..
But K3 requires this, so whether it is introduced now or future,
the final result is the same.

Please leave it..
> 
> > The I2S-related clock registers can be found here [1].
> 
> So this patch actually does four separate things,
> 
> - Introduce a gate-capable variant of DDN clocks
> - Make the pre-divider of DDN clocks flexible
> - Support looking up mappings between register values and divisors
>   through a table when calculating rates of dividers
> - Fix the definition of i2s_bclk and i2s_sysclk
> 
> IMHO it's better to split them into separate patches for clearness.
Ok, I will split them into separate patches.

...
> 
> ...
> 
> > diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> > index c59bd7a38e5b4219121341b9c0d9ffda13a9c3e2..253db8a602fe43a1109e2ba248af11109c7baa22 100644
> > --- a/include/soc/spacemit/k1-syscon.h
> > +++ b/include/soc/spacemit/k1-syscon.h
> > @@ -29,10 +29,11 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
> >  #define APBS_PLL3_SWCR3			0x12c
> >  
> >  /* MPMU register offset */
> > +#define MPMU_FCCR			0x0008
> >  #define MPMU_POSR			0x0010
> > -#define  POSR_PLL1_LOCK			BIT(27)
> > -#define  POSR_PLL2_LOCK			BIT(28)
> > -#define  POSR_PLL3_LOCK			BIT(29)
> > +#define POSR_PLL1_LOCK			BIT(27)
> > +#define POSR_PLL2_LOCK			BIT(28)
> > +#define POSR_PLL3_LOCK			BIT(29)
> 
> This reformatting doesn't seem related to the patch.
It's worth that create a new commit to reformatting it?

                - Troy
> 
> >  #define MPMU_SUCCR			0x0014
> >  #define MPMU_ISCCR			0x0044
> >  #define MPMU_WDTPCR			0x0200
> > 
> > -- 
> > 2.50.1
> > 
> 
> Best regards,
> Haylen Chu
> 
