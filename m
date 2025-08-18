Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEB72749D1
	for <spacemit@lists.linux.dev>; Mon, 18 Aug 2025 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502462; cv=none; b=h+ZnLcmKrFlWm/kP53FfgFS/GrwDzMPXs8kCiARrGpua/VJhg9FWMNx3DXyNrocudAs5XZMfeXZQYV98xWaOdUzKQk27Nlo4YgK2uRhUMcuG91eoh0KmaqzUtLbNYcalpf4He5GEjCyQKV4aeOZ0zKoj4Euf0cHSdQ3g7BHzP9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502462; c=relaxed/simple;
	bh=HFhXrifZno/dPB7M4JG3n3MLisMdU+y2W94PDsHVhhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWBb1t3+q3nAO+IOkaWLwbtuG7ghyP6Z11ujhTq5HotHPU92+dxVt0JlCy3+JUAYLl5+OkOhoqyG8aTcjCroXfJWarNXz3PWOV8WY5uORuBu7rL7QAv6E4cE7ZdAXm2f7YHzkRHOnmeRkb/cZneMXILV+EY5tMe8zdBj8eYljsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=W61BvZ2x; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="W61BvZ2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755502389;
	bh=uwNK2cvpl14UHlk6Q5HkI+LCPc7KO0VzPNrORHnwh5I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=W61BvZ2xoHRXH+yg9R/6GYIReVXi0MSgronvvyLPLYB4xdHMQf9qIfJZwUBU48Clb
	 A+qEjsvmbTKLPiiVDqJ48mqB6HQIs/Y5kZDI3HiwxEJ/8eaoR1s6IunOx/fefvjjy0
	 gQGI0xdBi9GHRe71gz9VKWAQb/rq7m1a8w8iGlbc=
X-QQ-mid: esmtpgz16t1755502387t4d77be40
X-QQ-Originating-IP: rqQDzakR9JIpcJNuoSEqQ+Nb63NMEXIV97JzDC/KoEo=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 15:33:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13474632048173593548
EX-QQ-RecipientCnt: 16
Date: Mon, 18 Aug 2025 15:33:06 +0800
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
Subject: Re: [PATCH v2 3/4] clk: spacemit: introduce factor for div clock
Message-ID: <0CBDC60ECB91670B+aKLXMuKPpicjd3_r@LT-Guozexi>
References: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
 <20250811-k1-clk-i2s-generation-v2-3-e4d3ec268b7a@linux.spacemit.com>
 <aKKN05w88uKP_HY7@ketchup>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKKN05w88uKP_HY7@ketchup>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MeukCuWaRbQlQJ3u5VItcX5xPI4s2nytYKNTuyN6PFs39InvVwFco0m5
	AU4ULQxqQ9Yqf15kTr1BTevS8+4+h4sbSerNWvT6dJvJTvfQ5pobVb0o1KwjQ7sor654p9R
	/WKPzTXVEBcunT1aq4xE7edrIW3vYONaB6bPujrkgHrfh0PYQffVdC7A/JyYb3OganziM7Q
	yduKBz8I/Y5+66Y223vr7AgqePZfbks8aGkLMIFOA5Tf5+EGUYHMYJ+aU8y+yuuid8twJzP
	3COzWA9WTXCAiZozsL26UzGTsebdON41jfItp6va8HySl5ixmlfqlhqh95oJwETl11qkc/Z
	Fx5DCBH66g5hjBMdaL3mO8/dig3/W9k11swqlBwwBBpK8vdpQ0QrQDrgQa/+PCVgwqLvnX8
	zLUmOm90rGf0NQW6TqGMmlim5qydN+FnxjWLXd1HhRavDKTH3AGeBb8n4UV/HJXifZ+fdqF
	vCw6SdKIIXCymfPPbERsIonJRgoOpIFkVlYwGBO8NiKyxeNIzUgu1rEuswNEXjIo01VHP2Z
	BQwWdmk+7hiExjfLxETY9QskPcG3w9DCBhgsI6sOTiTyQenEmXN1VtWL8brYB8gVSrytdHB
	epUhpDpNDBr7NOO9rtI5VE9CPxWIflAQnMmVrPQ7uIxQZCpY5fOjGTXBWKX6YLYFdo6woZc
	FBC+KF8RtRZ0lGQoNVqXNZg/9OSwuMmd8SYtxk78WAIFU/KX7SyvL6QNCQGIOzSeXSbn6C6
	rWJ3beoyqO6FutQacNrWOs905WM67qalTkQnHQv8hrQJlTOwEtQcJ2sJ1HAulRWhL6KXJU5
	gu/7cFUI/WQEfcCqBH2p7hNdbqRRJYz1heu5KPICSEM7qoat3ZZU9rICajQgvWV2i7+VzGE
	ezMFkYNmdogWLEsG8HxAI3sk/mmgOxMNQEwejKC3XV4HBj2A2156QUYnuVgZCvke/M83c/I
	uILaITTIv3bnnKCOSM3Nty0Mk8qWSLIU3ky32TneDo/+AyZR0IlTdjnkVuzr45YI/EGK4Nh
	TtFZcsk2DD6m0e+qkLSM8m35D0/JvS5NRn+vnBm6J+t3B0CBDHgJmxzY0gDBP+Jg03Bj6In
	BEoP3ezd7vtCLE2LkSVhQKmNEPhhbyrhWkGcJIokCy0
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Mon, Aug 18, 2025 at 02:20:03AM +0000, Haylen Chu wrote:
> On Mon, Aug 11, 2025 at 10:04:29PM +0800, Troy Mitchell wrote:
> > From the definition of register, The i2s_bclk is a non-linear,
> > discrete divider clock.
> > 
> > The following table shows the correspondence between index
> > and frequency division coefficients:
> > 
> > | index |  div  |
> > |-------|-------|
> > |   0   |   2   |
> > |   1   |   4   |
> > |   2   |   6   |
> > |   3   |   8   |
> > 
> > But from a software perspective and this table, dividing the
> > actual div value by 2 is sufficient to obtain a continuous
> > divider clock.
> > 
> > Rather than introducing a new clock type to handle this case,
> > a factor parameter has been added to CCU_DIV_GATE_DEFINE.
> 
> Actually, I expected you to represent the factor simply with
> CCU_FACTOR_DEFINE, introducing no new clock-calculation code...
I'll change it in the next version.

> 
> > Suggested-by: Haylen Chu <heylenay@4d2.org>
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/clk/spacemit/ccu_mix.c | 7 ++++++-
> >  drivers/clk/spacemit/ccu_mix.h | 4 +++-
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> > index 9b852aa61f78aed5256bfe6fc3b01932d6db6256..dbd2cf234bf81d8e110b19868ff9af7373e2ab55 100644
> > --- a/drivers/clk/spacemit/ccu_mix.c
> > +++ b/drivers/clk/spacemit/ccu_mix.c
> > @@ -56,7 +56,10 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
> >  	val = ccu_read(&mix->common, ctrl) >> div->shift;
> >  	val &= (1 << div->width) - 1;
> >  
> > -	return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width);
> > +	if (!div->factor)
> > +		return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width);
> 
> Please adapt all div-related macros to make them assign one to the
> factor, which helps you get rid of this if and the one in
> ccu_mix_calc_best_rate().
> 
> > +	return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width) / div->factor;
> >  }
> >  
> >  /*
> > @@ -115,6 +118,8 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
> >  
> >  		for (int j = 1; j <= div_max; j++) {
> >  			unsigned long tmp = DIV_ROUND_CLOSEST_ULL(parent_rate, j);
> > +			if (mix->div.factor)
> 			---- this if ------
> 
> > +				tmp /= mix->div.factor;
> >  
> >  			if (abs(tmp - rate) < abs(best_rate - rate)) {
> >  				best_rate = tmp;
> > diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> > index 54d40cd39b2752260f57d2a96eb8d3eed8116ecd..7dd00d24ec4b1dab70663b9cb7b9ebb02abeaecb 100644
> > --- a/drivers/clk/spacemit/ccu_mix.h
> > +++ b/drivers/clk/spacemit/ccu_mix.h
> > @@ -34,6 +34,7 @@ struct ccu_mux_config {
> >  struct ccu_div_config {
> >  	u8 shift;
> >  	u8 width;
> > +	unsigned int factor;
> >  };
> >  
> >  struct ccu_mix {
> > @@ -130,10 +131,11 @@ static struct ccu_mix _name = {							\
> >  }
> >  
> >  #define CCU_DIV_GATE_DEFINE(_name, _parent, _reg_ctrl, _shift, _width,		\
> > -			    _mask_gate,	_flags)					\
> > +			    _mask_gate,	_factor, _flags)			\
> 
> This isn't that consistent: why could only divider-gate come with a
> factor? This is another reason why I think representing the factor
> separately with the CCU_FACTOR_DEFINE() macro is better.
> 
> >  static struct ccu_mix _name = {							\
> >  	.gate	= CCU_GATE_INIT(_mask_gate),					\
> >  	.div	= CCU_DIV_INIT(_shift, _width),					\
> > +	.div.factor = _factor,						\
> >  	.common = {								\
> >  		.reg_ctrl	= _reg_ctrl,					\
> >  		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_div_gate_ops,	\
> > 
> > -- 
> > 2.50.1
> > 
> 
> Best regards,
> Haylen Chu
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
