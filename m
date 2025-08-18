Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241D2741C3
	for <spacemit@lists.linux.dev>; Mon, 18 Aug 2025 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502454; cv=none; b=DyHTib67rYASd0PV3n4sKaBHkCTsTUUbmoA5BqgYum8GIS3WcgI4Ls0X8HA082AYF2dNtX2RfweXBtFDv++W/K6VzZoqzUspijbT6QsGOmWZsZjvq/oi9TYxxrqoKZUXO0HZ6v6TE/qU9M28/wXcLESFvp293Je1zJj97zV29Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502454; c=relaxed/simple;
	bh=EPzh3NzHyqmYZ/c/XBA93Cdzlt0nsRYofywQe6RuU2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvRgr5topq8gXv2a07g7X9+wSoUXC0IZvZT9C+B57IIMI17VSrr5YoToSLDJuM7wxDXkTMuVmOFpZGgqhywZESb6x+8cmXaA6yh0i+NDVayAvELHDLoFaLkYcbY29C3YRv5fd/olLVyqHuzIy8+dVv11xxZ/mTieLANgUuvZoyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xp6GF8gl; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xp6GF8gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755502368;
	bh=hGJ5K9s0Yp8aThcYwUIFCFOisXwtrtzSiCz6334Suws=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=xp6GF8gl+MUMZ04JitlW/eTq7Fvx+VNb9uvqbTuYXkdbWLliQI6AGkxZHlrr4+1xX
	 sF6DAv89tGdii/3oyDuzQL3kSZXrj7/Zkqj6XQJ5QkVXwhjeMEjUt94e8rb5zU3fFA
	 jB8ruvsMgoikdXQUXrutQdMjezuW55VbQR1D1kSc=
X-QQ-mid: esmtpgz11t1755502366t70d98cfb
X-QQ-Originating-IP: 9nT85dNpey8gNJPRsy567TDQcjCRP7XKv8Zl8iCkjPs=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 15:32:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7156475783990062859
EX-QQ-RecipientCnt: 16
Date: Mon, 18 Aug 2025 15:32:44 +0800
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
Subject: Re: [PATCH v2 2/4] clk: spacemit: introduce pre-div for ddn clock
Message-ID: <20058E075D69E4A3+aKLXHNNdwT-SP25i@LT-Guozexi>
References: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
 <20250811-k1-clk-i2s-generation-v2-2-e4d3ec268b7a@linux.spacemit.com>
 <aKKKNynq-w89YeAx@ketchup>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKKKNynq-w89YeAx@ketchup>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MCk7GSmjSGXyi/V+t/RdOkrnnRidTf36jgGgsvFIyuy58ivSBOHi3Gn3
	rlK8UYi5EyaQnFMlUrMG07Y8NH7NbooKU+k/OKrW0sUBkTTtQV3y7lWzZzm9vPWC6jedsE6
	hWYIJdSfpSQCTgPt17BK6TuGU3nrsJFtxDnTyMhJSTM9njX8rKLjSvXYiGakZj2OaVWNVhg
	MIQcuUU5qpkrokgyU3MKPZnjqoZITLV3VucZFVyGqHP4d26hWmsp1MDZ6TYd/4A4iTmrxJa
	hrK3cLYMJW2Lg8b/EdgiUWr5tw4r9LpZmHWnWzFYxsYrp/Ws/CwiqkOD5UBV9fIeAmG2nqD
	0dE8tu9eNu11UGQNKUZxFj6ela1QvSRVJoUylc0lVm/mcUxgWUlJG+hlzNoUGMmMByNtcG3
	/rGq8O/2Weky/WetUvHUskI7S5ZdebB/JSLyVf2qrVDKrFh9FK49TBk5o3/iKi/f/6780HR
	b/Q3g3kRfGS/l/grdmKKpTakx4aTfZE5th9fK/k53JH1w/2JcyrYxcThSFc19UNfajpeNSa
	xeo05IxnClznQzk/CpkTPKf8INUwTHJmvuUtOMbyAnWNT4Rfo/U+ml906TtHF4TerMn62ui
	htDWEG0W6rpPuRcOmvhNBWIvuzJAsHAZb8FUs2JPhj/hqgFbMeC7GYY8aPuShO28XKlPKwR
	8EKO83sfl9z5DUnqXDUtox5wtY23N/04H34L0DyaM8MhlON0yLAOBXscFbPj50/BJhTPgKn
	Hw9snUzZVMJ/blW4bXVqz7akipYFu8LWQpoAeGZHI2x6B1yp7IZHt0USts2fWXkIWRuXATJ
	VGVZ/Z3ooU/FrS2AREPJiWSB0KKOqoQjfqxA+CU9DId8pqWTpcSH9r8/54MbtbWa2I357Gj
	L8CNm3O/xEZPjuEjbbvXg3E9ttuFZ7FSPAP95ryB+3AQPpGTZQ1PTvOdkReWpA5d5Nz4RSb
	sOWgyJDHi1Vogu0QIY2MUQ4jEQzreCc7q7DANcGAC+xfJXvHn3VE8H5dMEXnDoJJaFwbvYe
	kUWfqZtBoZC7Q+o6/CII8ik4/CR/6hvE+nZUucreCCrfNjriGE/m1pIG1336CHRIPd/0CI/
	bRcJhZpE9o8KglGcmGFGoDIFf6X4MYlF67aIhY4oywUMN0V4oMGFdY=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Mon, Aug 18, 2025 at 02:04:39AM +0000, Haylen Chu wrote:
> On Mon, Aug 11, 2025 at 10:04:28PM +0800, Troy Mitchell wrote:
> > The original DDN operations applied an implicit divide-by-2, which should
> > not be a default behavior.
> > 
> > This patch removes that assumption, letting each clock define its
> > actual behavior explicitly.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/clk/spacemit/ccu_ddn.c | 12 ++++++------
> >  drivers/clk/spacemit/ccu_ddn.h |  6 ++++--
> >  2 files changed, 10 insertions(+), 8 deletions(-)
Hi Haylen,
Thanks for ur review.

> 
> The code change looks good to me, but
> 
> > diff --git a/drivers/clk/spacemit/ccu_ddn.h b/drivers/clk/spacemit/ccu_ddn.h
> > index a52fabe77d62eba16426867a9c13481e72f025c0..4838414a8e8dc04af49d3b8d39280efedbd75616 100644
> > --- a/drivers/clk/spacemit/ccu_ddn.h
> > +++ b/drivers/clk/spacemit/ccu_ddn.h
> > @@ -18,13 +18,14 @@ struct ccu_ddn {
> >  	unsigned int num_shift;
> >  	unsigned int den_mask;
> >  	unsigned int den_shift;
> > +	unsigned int pre_div;
> >  };
> >  
> >  #define CCU_DDN_INIT(_name, _parent, _flags) \
> >  	CLK_HW_INIT_HW(#_name, &_parent.common.hw, &spacemit_ccu_ddn_ops, _flags)
> >  
> >  #define CCU_DDN_DEFINE(_name, _parent, _reg_ctrl, _num_shift, _num_width,	\
> > -		       _den_shift, _den_width, _flags)				\
> > +		       _den_shift, _den_width, _pre_div, _flags)		\
> 
> You changed the definition of CCU_DDN_DEFINE without adjusting consumers
> of this macro. If I'm correct, this creates a build failure.
So I need to adjust consumers in same patch?

> 
> >  static struct ccu_ddn _name = {							\
> >  	.common = {								\
> >  		.reg_ctrl	= _reg_ctrl,					\
> > @@ -33,7 +34,8 @@ static struct ccu_ddn _name = {							\
> >  	.num_mask	= GENMASK(_num_shift + _num_width - 1, _num_shift),	\
> >  	.num_shift	= _num_shift,						\
> >  	.den_mask	= GENMASK(_den_shift + _den_width - 1, _den_shift),	\
> > -	.den_shift	= _den_shift,					\
> > +	.den_shift	= _den_shift,						\
> > +	.pre_div	= _pre_div,						\
> >  }
> >  
> >  static inline struct ccu_ddn *hw_to_ccu_ddn(struct clk_hw *hw)
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
