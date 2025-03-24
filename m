Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE91B4231
	for <spacemit@lists.linux.dev>; Mon, 24 Mar 2025 06:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742797502; cv=none; b=M/viuE3dpaqORHYX4QwUod/bHClNRqGs/ly0D7pWn1UoIHegQ4GieusVXvO0ec5R1tFIoOafm5tPWNsu/FqRq8wDdMu/2IBxhZ9QNA/YzjYrPcyF02d/qelh+ylsXaUZbi3jC8PMhYSFmS0In4A7zabETBEzFQINTf74gdlViIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742797502; c=relaxed/simple;
	bh=GLUjQfEpWB2Nxp8PDFXc3kKHegJ9tbzWrH3NEbLiPAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuntbV1Tyyrvebln9SWLLxpODvG0B7BhS4NwvOxZKA/RwiplwZA4C+NRcnXfgTjylinSs3kmkFN9DLjZ2M/rvmlFf6uUtoJg+k/lEUBI3hH6Nqf7cj2hBLrdNWS62VOiaR/+wukikYNPl/ic/35aDB6lXKI4kftMiirKdLc6iWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7AA283434DF;
	Mon, 24 Mar 2025 06:25:00 +0000 (UTC)
Date: Mon, 24 Mar 2025 06:24:56 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 4/7] clk: spacemit: define existing syscon resets
Message-ID: <20250324062456-GYB18687@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-5-elder@riscstar.com>
 <20250322162909-GYA15267@gentoo>
 <ee9fb4b7-7829-4eec-815c-1e269d6abc38@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee9fb4b7-7829-4eec-815c-1e269d6abc38@riscstar.com>

Hi Alex:

On 08:23 Sun 23 Mar     , Alex Elder wrote:
> On 3/22/25 11:29 AM, Yixun Lan wrote:
> > On 10:18 Fri 21 Mar     , Alex Elder wrote:
> >> Define reset controls associated with the MPMU, APBC, and APMU
> >> SpacemiT K1 CCUs.  These already have clocks associated with them.
> >>
> >> Signed-off-by: Alex Elder <elder@riscstar.com>
> >> ---
> >>   drivers/clk/spacemit/ccu-k1.c | 132 ++++++++++++++++++++++++++++++++++
> >>   1 file changed, 132 insertions(+)
> >>
> >> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> >> index 6d879411c6c05..be8abd27753cb 100644
> >> --- a/drivers/clk/spacemit/ccu-k1.c
> >> +++ b/drivers/clk/spacemit/ccu-k1.c
> > ..
> >> +static const struct ccu_reset_data apmu_reset_data[] = {
> >> +	[RST_CCIC_4X]	= RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
> >> +	[RST_CCIC1_PHY] = RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
> >> +	[RST_SDH_AXI]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
> >> +	[RST_SDH0]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
> >> +	[RST_SDH1]	= RST_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
> >> +	[RST_SDH2]	= RST_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> >> +	[RST_USBP1_AXI] = RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
> >> +	[RST_USB_AXI]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
> > ..
> >> +	[RST_USB3_0]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0,
> >> +				      BIT(9)|BIT(10)|BIT(11)),
> > 100 column if possible, also add one space between "BIT(9) | BIT(10) .."
> > continuous bits can just use GENMASK for short?
> 
> You'll notice that every place that has multiple bits in the mask
> also have a line break.  I kind of liked that as a way to highlight
> that fact (i.e., it goes beyond my preference for 80 columns).
> 
ok

> I will definitely add spaces, that was a mistake not to.
> 
> I will not define this with GENMASK().  In this case each bit
> represents a single reset, and so each one is significant on
> its own.  It is *not* a mask of contiguous bits, it's a set
> of bits that happen to have consecutive positions.
> 
ok

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
