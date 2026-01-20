Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFC410D1D
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909306; cv=none; b=HihJKFHNips1e73JG9DVc2FTsEIUnPNbokmbeL13kPeI+2SsGwlamZNac7y+VLs/E9/W6ndxPR8qHDPrzOsybgBKbBZGkjhO3Jn3s1CQM/u0ti62bGN6pIa2aA61uredHhv9l6qTJLBYSQhefmdkvqljWveDRF3BEkOniUWdtO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909306; c=relaxed/simple;
	bh=2OE/hSoh1It8bhcmM1nk9V99B9U/eNy3jRJxpR7UOWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zeqs1tLqXJCcG4I7/rdqtQj7fUtKnVhtGuVop6xkX8l3+hVIOiLS9zPFhh9gl3LFRUc0oHRu+joqteCCNzSix/Gr7JwcKZJUz+J95ohYDvXB47mgDTq30GLGGYljwCvZJLpCE6NeKWUL6jf9aHGhkeJB3YxZHCbqCBr72syakYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtTNklS1; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtTNklS1"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6b0500e06so5416380eec.1
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 03:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909303; x=1769514103; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjkNqktI4MZMt6SSfHT5UbzSxH8+GJApfRaBdqEuizY=;
        b=DtTNklS1umczWCZGImWHBGS0HxKbYMv7Mz04k7QR+FNV5od2keiMFLPUuNECCxkT7z
         5mCwhcm+vr4Afg37PXxuz0KP2tDK2tCAsO71uar2/LGR1+7iN0GjVEfku84vE3rddFGE
         CS9yNnl/doGhckVPGGXDg1q505gLKu1PUZhPUdaGVYW71OAb2l7zPvyrYsqq+K0RZ0SJ
         tDvJIEGP/18zzRs81r6FrJAsVcYQBv7M8U3AF/hxFRH+xVmb9uMl2qI9/jL67xt1KmKk
         KKJb8wQQ9ouflA5Zh69VzZU3I0uJM7YuTzdMzGjD6cWTt+P1bjIb1Ecn+34Pgxrdls/L
         R7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909303; x=1769514103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjkNqktI4MZMt6SSfHT5UbzSxH8+GJApfRaBdqEuizY=;
        b=GWT6fHGOng4PFepfytzSzpNxAGJOFdifUU2r3QflBY+zuODzk0Sy1ZAIV6+nXBPZvI
         0P+AeAHpHEidLNlYxQ5XirtvJoBdllqZt2NkkDFXbscA2X5nfmuB3lGZDPbDGnlnydyF
         HzQqrQi+3q6DR/Jag8xyBKW/VwMhsuOLEhlWT5q5Osutk0nwnIzuCUp8gS+pD33WjyBf
         TGBKNLExBfprnDUKXaZyx6wEBsBPDQkABm5clpD7+7EpkaffupZMSdcznLDUgHYXUoin
         HrV9ZGYALedsWpBFJKrgXfCtIzbB9Q8skl9XxjwrHxquSO54IzX9ycmrJZraJ2S7fckz
         Mz6A==
X-Forwarded-Encrypted: i=1; AJvYcCXi8Ywz9wVdTVtR7Bu6Koac4PdNmuuka6S7lhuw1E4g4SqglsP1AghzprBcLxY+p0hHkRE3ozhqbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcYCR7/aLCU0y7zkjPyNArs0et5ajBzo6KtsUagON+EkFByRkm
	ZZ9RGGar+Iav9jYffZCBnC9t/Fnq0+4a2jGdGzyQiNHi+BfnRjaXKfkI
X-Gm-Gg: AZuq6aJ54TBntPyENnEvYuqOSqXg+Hm/AxFESjBNdhm6+IUbPmfkeyYzJYx03sfrC9D
	TqVsTd2njYuf3SJJ0GG1uXza5FiPgcX9Zw6yzS4TxCcrCY/SembGCk3XlWdWA9BB80h/4lHOIxD
	KYgvYgI8/O2mdw5ndG4cny8qiIZ/S6B1up91g4x/wQ3zD1AAxxxytHp6r91C2hpVVnEiWajaBtv
	w+jjefVpX2Pj0qkou8ryDbfs5+A+7Eii215zaWK7hKJJJvGS4WY3zx0sSJFDSz/CGzsCRQa49yX
	Q5JSPzmLy0Gyph7K6SZQyikR2egW9CZw88xZCurMqRUZSs5io47+QdiWQ/wlHWVKBodymrd0OIZ
	AO3HcbMTGBdFH2poW0Aiq1k66J0l2+XCyImkF1CsJruykn2BNxFllUHcnJxIO5iIP80aiJ4TtMC
	Snxh885LORFw==
X-Received: by 2002:a05:7301:3d0d:b0:2ab:ca55:89c6 with SMTP id 5a478bee46e88-2b6b412b2cemr9952612eec.41.1768909302992;
        Tue, 20 Jan 2026 03:41:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6c2de1f29sm14737037eec.15.2026.01.20.03.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:41:42 -0800 (PST)
Date: Tue, 20 Jan 2026 19:41:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yao Zi <me@ziyao.cc>, Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aW9plNvIujPTqHtZ@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW9jbqBSgkiLLw8r@pie>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9jbqBSgkiLLw8r@pie>

On Tue, Jan 20, 2026 at 11:13:50AM +0000, Yao Zi wrote:
> On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> > Adds Spacemit dwmac driver support on the Spacemit K3 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
> >  3 files changed, 237 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> 
> ...
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > new file mode 100644
> > index 000000000000..72744e60d02a
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > @@ -0,0 +1,224 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Spacemit DWMAC platform driver
> > + *
> > + * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/math.h>
> 
> These are the only two headers listed out-of-order. Is this intended?
> 

I will fix this.

> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> 
> ...
> 
> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	int i;
> > +	int code, best_code = 0;
> > +	unsigned int best_delay = 0;
> > +	unsigned int best_config = 0;
> > +
> > +	if (delay == 0)
> > +		return 0;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step = k3_delay_step_10x[i];
> > +
> > +		for (code = 1; code <= MAX_DLINE_DELAY_CODE; code++) {
> > +			/*
> > +			 * Note K3 require a specific factor for calculate
> > +			 * the delay, in this scenario it is 0.9. So the
> > +			 * formula is code * step / 10 * 0.9
> > +			 */
> > +			unsigned int tmp = code * step * 9 / 10 / 10;
> > +
> > +			if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +				best_code = code;
> > +				best_delay = tmp;
> > +				best_config = i;
> > +			}
> 
> Is the inner loop really necessary? Could it be replaced by
> 
> 	this_code = DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
> 	this_delay = this_code * step * 9 / 10 / 10;
> 
> Then comparing abs(this_delay - delay) and abs(best_delay - delay)?
> 

This is a good idea, thanks.

> > +		}
> > +	}
> > +
> > +	*config = best_config;
> > +
> > +	return best_code;
> > +}
> 
> ...
> 
> > +static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
> > +					  struct stmmac_resources *stmmac_res,
> > +					  struct regmap *apmu,
> > +					  unsigned int ctrl_offset)
> > +{
> > +	unsigned int mask = PHY_INTF_MII | PHY_INTF_RGMII | WAKE_IRQ_EN;
> > +	unsigned int val = 0;
> > +
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		val |= PHY_INTF_MII;
> > +		break;
> 
> The OR operation seems unnecessary and could be replaced with an
> assignment. Same for PHY_INTERFACE_MODE_RGMII's case.
> 

That's tree, an assignment is better than the OR operation, I will
change this in the next version.

> > +
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		val |= PHY_INTF_RGMII;
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> 
> ...
> 
> > +static int spacemit_dwmac_probe(struct platform_device *pdev)
> > +{
> 
> ...
> 
> > +	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
> > +	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
> 
> According to of.h, of_property_read_u32, which in turn calls
> of_property_read_u32_array, could fail with -ENODATA if there's no value
> associated with the property. Should the case be handled?
> 
> Regards,
> Yao Zi
