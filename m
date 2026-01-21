Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9744418C0
	for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035046; cv=none; b=e/9R/mKx9LQCipj0rU0d9RSNiBtrevVKv5oRbOcMwp43Nq9eqTQFUgKyOjL+voQIGrb++f/MMYSU2WU3B8CuOWKdKwvEI6LdxkMyUvJZcQtdqHW4BJONxjOGX5m+PQ01zdzP+AQ7TQXsp+X3Iu8Rr64erEyWRVmX901CTQQyoY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035046; c=relaxed/simple;
	bh=SlWwyculiBABzhQdRSWezuPYqL5XqkaaZzBL+IrKxxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/P7ILX43ZlOXRsJu69Cc90I431Nkx/Lh/jRVkvyvz8X8y73Y0G1a7ZxHEgtOqAmHG9y0MO4wrCedqwtOiV7tOVsDL38TSX+LDq1O8eGciu1nSlG6PODmHaijW2Pqspnu5IOdqQ+1ny0ed+yNXNIphKC2DR7xmejmm/DxX9Iz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VV/tOxKP; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VV/tOxKP"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b720bb90d0so379243eec.0
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 14:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769035044; x=1769639844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pgjMJi+m/42Lvq5w641HEHT7p6jawBc1Rvrn2olmX9o=;
        b=VV/tOxKPeYxTzT+dRyzQHnGd9PJV9GKUEQbocUaqUkEQEsDaCPT3QBEgfJkW+HtNL8
         3il/Y89fgutlBoHBOFK8NPlVRcyilLoRlxWUuwFUZvvcfL5VfFhwqZ+pJwtYzaNcHju/
         6UKrAAqEoSRFjYfKazAyu1gzaID6bfvHnU0NYjJawj/egO26pxWcFSL1Ynl+U3XJs/LQ
         sJVoUBM0N5EcX0lokA1F3ap2K0EJ+h1V9zWbv9HS210QeV8vOy6tzjFR1CtHXw4/2T2j
         01sMRS2HMgyIHhKdHTudcVB+febeA2vM9IJpKBylTjPQOio5AY0CuqudM9p224J29EJ2
         RPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769035044; x=1769639844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgjMJi+m/42Lvq5w641HEHT7p6jawBc1Rvrn2olmX9o=;
        b=mnrJHCc2eEz7lYOwk6eKKex+UqYxQqPp2MaFAbaMSLKXSJg2iHNCBnb/B5Uc25sLST
         mW9Xor+FkkR9x3ETNzpbPxRyv50X14PPPpiMkUsAM3mZ6ZUMqUqEcznLtjMZZL9gDDbj
         +lFdozk2XufE8ktt1QBku3N+sLy6zYJkXAetc8eYhHanCMj+htwdWZxkQkq+lLY7QuIr
         kKBLqrUVZKw/5SDS4YY8Z3PL302rsUJBdLskmUjJR7f/hMxsy6GmJiilNkFN5gGfHJJi
         AXPWZDDZGPWAkN4j805gNY115Up7Iw8Lp4V/GZtlLjltjXBX45cJRPaNaJZuE34YyHDU
         sdXg==
X-Forwarded-Encrypted: i=1; AJvYcCWrHuDvBZCnBi6P/y9Jr/0hsbnv+hT55MY3Bus5gGZ4xSrM8Up7b+Q314QBU3NNxYhAtA05qyWybA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc1KS/KppCirZ3A0UzAB9Nt29BenyAD1HNlak97QSg2X2QW+/8
	a14QWc7rRTUTp76MrxiRWl7gbgKmP4czQDIduBQkuM24cz1qB8V4iCxA
X-Gm-Gg: AZuq6aL6ETrlaDXc86CD7ybJi3MYSF9wGok1xLD8r7fqzDsTLq2IVxAzFMPUHRRpm/W
	tGeVtRnZT74HGg07V4y+QKlEYGkr2F4hm/uyFWHnoEDQBkpKiZo30XmrQEk1pwGUunhEUhauBNB
	2UcNlM+xaQvgybmwazr54TkIFi+bx5oyHCzczucMv2aIvG/prUJtIi6ppqq45w/ZV8pMFfzSXa1
	h4neB3/bD9x+Ivrthlkm3+LtmyF7fy/HTrMoJrcNwps5xqOs5feSya+JCKpOT9g2Z1AHnhdxfMf
	bB1Yiu9rEC3dYHwGAJ/EeSyeEWNrVh8sEVZDRfJG7dkYebuutEnrt8vU2PwCz54SaPswmMopozn
	CTGNNNsc9RejB0f6fmt0us0gvw70Eb9Hofm5AFeBSDnm/7ixbL60JTUSXqGSHqHxUqabj7IItyk
	pL35YgBCa1Cw==
X-Received: by 2002:a05:7300:8b14:b0:2ae:5555:4880 with SMTP id 5a478bee46e88-2b6b4713257mr14102244eec.13.1769035043476;
        Wed, 21 Jan 2026 14:37:23 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70d7f729bsm6725736eec.16.2026.01.21.14.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:37:23 -0800 (PST)
Date: Thu, 22 Jan 2026 06:37:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <ziyao@disroot.org>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXFVAoChTPZhjnGu@inochi.infowork>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
 <73bf2977-ad1a-45fa-9b06-5df083c060a8@lunn.ch>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73bf2977-ad1a-45fa-9b06-5df083c060a8@lunn.ch>

On Wed, Jan 21, 2026 at 02:45:24PM +0100, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 12:05:30PM +0000, Russell King (Oracle) wrote:
> > On Wed, Jan 21, 2026 at 03:13:11PM +0800, Inochi Amaoto wrote:
> > > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > 
> > So your reply where you basically stated that all the RGMII.*DLINE.*
> > constants here should be the same was nonsense. How can we trust your
> > replies?
> > 
> > > +static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
> > > +				    struct regmap *apmu,
> > > +				    unsigned int dline_offset,
> > > +				    unsigned int tx_delay, unsigned int rx_delay)
> > > +{
> > > +	bool mac_rxid = rx_delay != 0;
> > > +	bool mac_txid = tx_delay != 0;
> > > +	unsigned int rx_config = 0;
> > > +	unsigned int tx_config = 0;
> > > +	int rx_code;
> > > +	int tx_code;
> > > +
> > > +	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > > +								  mac_txid,
> > > +								  mac_rxid);
> > 
> > Maybe Andrew can confirm, but this function was to fix up existing
> > broken DT, and shouldn't be used by brand new drivers.
> 
> Hi Russell, thanks for pointing this out.
> 
> This function should not be used in this case. MAC drivers in general
> only add small delays, in order to do fine tuning. The PHY adds the
> 2ns delay. There are however some MACs who cannot disable their 2ns
> delay, or have historically been broken, and add 2ns delay. In such
> cases, the phy_interface passed to the PHY needs masking, to indicate
> the PHY should not add the 2ns delays. That is what this function
> does.
> 
> Please don't call it. Pass phy_interface as is to the PHY.
> 

Great, I will remove this call and pass the phy_interface.

Regards,
Inochi
