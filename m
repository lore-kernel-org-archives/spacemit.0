Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551C30E0F2
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 04:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770178183; cv=none; b=W3+myZTBFx1NbW/ZvHdXABfpAVx9fHJ3ATfpzDg729O4mvKPISY+GdZr66iGzt7RvoF3Vhb4oy2opw4CXSLc6hvvsUH/xYluw3A4erEbGvTc1VqYY9mh72Ib6dcvCwi65QVEJAgvb/XEyyblzJHW0IcrTh2oD7+hZekc6fbkbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770178183; c=relaxed/simple;
	bh=VeokmRxKrzPdkUW4Q5G306mDxXMWUl855v4qe7W+BKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBZ9lqQ8P7RGwaFmx3uENp3IP1qBi0/Pj9YPzNLSEyyy+a/BD7t4U1Pf2Vcn56aqjH73/QHQ2cd0ApFRxDltcERFMMLiSKjorYpXwZv5aCDgwoPiiX/6UGNGnXfapdXwMxubXiz8w8rkEgzSkin619GSyyqyU5i2BvLDxcCP0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5onF76t; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5onF76t"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c7199e7f79so954136185a.0
        for <spacemit@lists.linux.dev>; Tue, 03 Feb 2026 20:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770178180; x=1770782980; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=;
        b=A5onF76tAfh/nPYBS09hrcUlCuyJu9UzQreVJ2tvlV6og+PRucLAKx3uwrvuI5XyMm
         Vl1tHK1OiID4ZiZ1p5QdqGO0NUJEjF1utszSSsJPdQHMsOrxcWz9UNk4un3ArMv2yJwO
         DLLsn6yf0QmuSAxqPTqTLeSz3phHTa8lkTE309L4n9NULRgjdSvkpxHjpuKbEe8ihKmO
         MSIGJ16yIm2ptgMLdt543KJn0IXzllrB+6qlxhq4K7jMBVLCQ9hiJ68c+t5eqVX29Y/q
         IvaTUhxdn6T9OgjJ+yO5wdrO1/MCi1ST8xEbusJ/vuiowaZVV6d2hBC38YY6X1d5qOVL
         Pmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770178180; x=1770782980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs6BBarzwmD2Zm1TSaGTp7E5XeDaUo3g+3j+s/whg7M=;
        b=sL5xEooSG5PzRVvSziMt7YaOiGO2dhu2OwQnaoNEgsG6y5wXu3oniWQVAaBQbJOTgH
         FPfY6piaGyazP8MY4epIDFgIDX1aTLkSK0e+r07h47G2Sajth5W+2REWvGWGAmitbMEx
         AwAr0ICZHtyXbXqZWo05jDN23I3HEZqXxzBRQpT8UM9rEWUhyJM27Qu0mzjjRQjs0ogC
         1YDdQiNh4gFgfNiG/WeBoLj2LIg+Tn/Xyzzyye0RSbZ2jjLyIw1OYS0Z/dE8OVjiKGN5
         lP/9jBvhMpeBAxruoSO/yzX9ZT5LYkIorQApW9hvqHW329urAAYkJ2gUozXEvKLIXTv2
         54Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUGC1TGaA3VHGNlokMC4GXI4NX9w2zgev3NrmNcp+6porlvq6SvZ44m0//wccCdYuOvhJ80zQT1fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhQV5XOB5wgmTc978bkgyUszxakYPcIMIpyr+r+S9YWSbdvmIm
	BH/VCo1rUOvGVyGXTUTjsVaYdWzRKkW5psxqgIPc69qXAIcRcZ7C4NZLdwZ86XE/
X-Gm-Gg: AZuq6aIQ/QkUKvvQgDxpbXkaFNq/teVYvBr/oDHSQ2ExYDiTmdCx6Yr3asCxIOYpUjI
	fMAR+8Et3nJhZMrBSXb/DX9cyntF2X929dH8pyALWteNgq3QVVTx8EQEdFtV6W1N5U3EFRwn5Fc
	KtWMdh8Punf1a2PRhy0HMULeJJqXcHQo2huBJ40JNzURi/OpPpLfsWngpCQ4qNk9IZuDF/kqRwF
	9/AE8nlXeagtxkG9yWIH9N4Le1/O6Ore3q0DyV2sNwzipIq4j9Of5/Y6+SsoOEDWcboyf3QpWBe
	Botl/k3W6g6d9AxFXzTCJWipX+Az1acOYsk1FeezoPdiqHePuPA4nLDM9s6Xy1+gMuMC1zXjNk0
	Z5WFVBwy+VIzhV5/8/aHKkLDjORK+/y2Q7FKcH6MzYQedD57FHEU++islF0rhCetJNCs+rLgkYs
	O3dHZUbWEKxQ==
X-Received: by 2002:a05:7022:f103:b0:119:e56b:91f2 with SMTP id a92af1059eb24-126f47daa76mr613066c88.35.1770171313127;
        Tue, 03 Feb 2026 18:15:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832feacc6sm940814eec.35.2026.02.03.18.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:15:12 -0800 (PST)
Date: Wed, 4 Feb 2026 10:14:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aYKq4qlgCDo42rnw@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-4-inochiama@gmail.com>
 <aYI00Exytbgbnuzp@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYI00Exytbgbnuzp@shell.armlinux.org.uk>

On Tue, Feb 03, 2026 at 05:48:00PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 30, 2026 at 10:27:04AM +0800, Inochi Amaoto wrote:
> > +/* ctrl register bits */
> > +#define CTRL_PHY_INTF_RGMII		BIT(3)
> > +#define CTRL_PHY_INTF_MII		BIT(4)
> > +#define CTRL_WAKE_IRQ_EN		BIT(9)
> > +#define CTRL_PHY_IRQ_EN			BIT(12)
> 
> Thanks for updating these.
> 
> > +static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
> > +					  struct stmmac_resources *stmmac_res,
> > +					  struct regmap *apmu,
> > +					  unsigned int ctrl_offset)
> > +{
> > +	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII | CTRL_WAKE_IRQ_EN;
> > +	unsigned int val = 0;
> > +
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		val = CTRL_PHY_INTF_MII;
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		val = CTRL_PHY_INTF_RGMII;
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (stmmac_res->wol_irq >= 0)
> > +		val |= CTRL_WAKE_IRQ_EN;
> > +
> > +	return regmap_update_bits(apmu, ctrl_offset, mask, val);
> 
> I would suggest that this is split into two parts - first, this is
> renamed and reduced to just controlling CTRL_WAKE_IRQ_EN.
> 
> Next, a function hooked into plat_dat->set_phy_intf_sel which sets
> the CTRL_PHY_INTF_RGMII and CTRL_PHY_INTF_MII bits as appropriate.
> Note that this function is passed the dwmac's own phy_intf_sel
> value from common.h which will be PHY_INTF_SEL_GMII_MII,
> PHY_INTF_SEL_RGMII or PHY_INTF_SEL_RMII for you.
> 
> It would also be good to have plat_dat->get_interfaces populated
> using phy_interface_set_rgmii(), and __set_bit(PHY_INTERFACE_MODE_MII)
> and __set_bit(PHY_INTERFACE_MODE_RMII) to indicate to phylink which
> interface modes are permissable.
> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Thanks for your detailed guide, I will try to switch to these helper
apis in the next version.

Regards,
Inochi
