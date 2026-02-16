Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF33318EEB
	for <spacemit@lists.linux.dev>; Mon, 16 Feb 2026 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255810; cv=none; b=QXUjV/mNYxpPFNGNEGvzFEHQtih2QBh8L3IRBoJIwimDCqeAf5qPa4DtpJANLV5xz1ztdbDo/LM6mki9XcH/x3KwzFBzXw2ycL2hP6fmeYhEkBgSdnvrjF3+rNC1NYtYGWdKXh0eXKeNY0iZGGSO5aJsQn4bB2cgXLa1N9YtLXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255810; c=relaxed/simple;
	bh=RXP4QiFFbHpU8VtE7I0fwf8J83MalDeCnXa3E6o7cv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gESyEFjc9mrgj8mMYiLQTxhtWkq6PvSO89wTEsaLN3vzOulAOG4/e/hFC1Ij/uMrMXWF2izLSIzqkmqmvB3oYB5TfwpWVCVuIBDmjbh5LeLX8azKE+8AsCjyOjCkw3lHj2Eek/vlWs6eDbkQviQi6t0VOwchVAjmRYMY4DgEoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 25219342558;
	Mon, 16 Feb 2026 15:30:05 +0000 (UTC)
Date: Mon, 16 Feb 2026 23:29:54 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: k1-usb: add disconnect function support
Message-ID: <20260216152954-GYA183788@gentoo.org>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
 <20260214-11-k3-usb2-phy-v2-2-6ed31e031ab4@kernel.org>
 <20260216090112.n5jjpui3luqsybb5@skbuf>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216090112.n5jjpui3luqsybb5@skbuf>

On 11:01 Mon 16 Feb     , Vladimir Oltean wrote:
> Hello Yixun,
> 
> On Sat, Feb 14, 2026 at 08:29:15PM +0800, Yixun Lan wrote:
> > A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> > it will fail to work properly during next connection when devices
> > connect to roothub directly.
> > 
> > Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  drivers/phy/spacemit/phy-k1-usb2.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> > index 342061380012..959bf79c7a72 100644
> > --- a/drivers/phy/spacemit/phy-k1-usb2.c
> > +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> > @@ -48,6 +48,9 @@
> >  #define  PHY_CLK_HSTXP_EN		BIT(3)		/* clock hstxp enable */
> >  #define  PHY_HSTXP_MODE			BIT(4)		/* 0: force en_txp to be 1; 1: no force */
> >  
> > +#define PHY_K1_HS_HOST_DISC		0x40
> > +#define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
> > +
> >  #define PHY_PLL_DIV_CFG			0x98
> >  #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
> >  #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> > @@ -142,9 +145,20 @@ static int spacemit_usb2phy_exit(struct phy *phy)
> >  	return 0;
> >  }
> >  
> > +static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> > +{
> > +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> > +
> > +	regmap_update_bits(sphy->regmap_base, PHY_K1_HS_HOST_DISC,
> > +					   PHY_K1_HS_HOST_DISC_CLR, PHY_K1_HS_HOST_DISC_CLR);
> 
> Please align function arguments to the open parenthesis.
> 
Ok

> Since we are in the merge window, it is likely that new features will
> not be picked up at this stage.
> 
Sure, no problem and I expect this is normal..

> But this seems to be a fix for existing SpacemiT K1 support, currently
> in the linux-phy/next branch. The linux-phy pull request hasn't been
> sent yet, so if you can resend just this patch and we can get an ACK for
> it in time, perhaps it can be included for v7.0.
> 
Ok, done
http://lore.kernel.org/r/20260216152653.25244-1-dlan@kernel.org

> The K3 support should be resent after the merge window.
> 
will do once new -rc1 is tagged

-- 
Yixun Lan (dlan)
