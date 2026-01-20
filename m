Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3613612CA
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 05:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768885553; cv=none; b=HC+u+ZpwuCOUTUsqfY2anuc/2em7FycBL7b/Ds7j9oligRMXRhb30Eh0VWYZKznYakhH3QRpZ02ILCGz/3dDeLlvXx1v13z1Y029pSsjqwqvFcKH4++Li2uYotZ6e6hd+15v/yBoG49q1uWA3alL4RXtdIFvRa77NB1cS8phTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768885553; c=relaxed/simple;
	bh=PC4UrdjLqaW0iLhVA9Sz3l4QXzyP/7m+HKjSOXpuvYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJTmmZCE8jJEMyh2lbvMlaSIwZE06Iq2yaZUGLhbWnbp8VPudVGd00UN/Uuvb/9EpUJ49n5SvfbqhNUQwucHf4dkTyHmNaHnPeh7Utx1lK3imHeuzIt0z8EQUKq8G4e+9tXx3NdQ9UTmvyW08afSVmTy49e370VOd6ErHiz7Aqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Odj+vPXN; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Odj+vPXN"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1233c155a42so6379194c88.1
        for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 21:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768885549; x=1769490349; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFedj4f11o/3T9vWUp8OttHw6rjgwlEi4dqKoM80zmU=;
        b=Odj+vPXNFd+uClmljdm+MlKEAwdl9T1Q9DpEM98mU2NzerFhdltSot3LAGr8M2BIO/
         4enf5yzXdyP5UmsUQxfvdOR6z7Lj7cUqojt29TwN3jZ0mtH0xEvrH+tWD0kO3L2CwKOE
         nqD6w8QeleZRYLvTsMdh1EwZukSWcPTygMylSigKT494uUoOY4iM9f9UJtd+SEfm3iRQ
         4VDD3ySehvt8zX18kvTnzopPT5JZPfpm/JEEnckH+Dvu3N859VPSpNIwz4m3XDso30Td
         UVgLSaNTRlt2FK+oBDwjTF7q/0QrJY6HsIFpS66OkDyL1ARPDlLyNlq5WLWzVxHmwU4R
         ojqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768885549; x=1769490349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFedj4f11o/3T9vWUp8OttHw6rjgwlEi4dqKoM80zmU=;
        b=sVMWUbYUWwKuJqq7VYH8Bjgx2wMAVcdicO0cH+9NoEIzxphS5zt+pjTu8EEIOza8vF
         VMtGwlK+fRn1cnTaNjgFC8bzhSdMwxcn1KKgFpstLWfmPR6pqCBp5W4fxCTn7UjVfcol
         w5jCfVTyOp2QHc2d+qpew+2+wLbKoqxuIzlxMRZtmmsLIso6k7hL4IHdTqQJM5tOqikJ
         WDYZynJxTLovRsS8THKjhiZPopodmNdORhtQFJx97usIWY8c6udC2QgCxCCtH+QhnxOx
         v5EOeuU8zQFSYCZUW8Bugk/M5u/u+Ojl1PfAAG3dtxipzY5td5S4ZX45Po9yiPL6FtIi
         tCYg==
X-Forwarded-Encrypted: i=1; AJvYcCVQWi8PpZWhUDTyKd+ghYbng8k6Ol0+w2jnaWcSJAL5LggKvEpnGobC463SZFBdZ8fYMW//72Shzw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4zv6ngMQGLpD52/IMDwIyKuSMiwlnDbTU9ScQicDc50n8y1Tm
	WdPQm8WE1IA0DYpUHsqG1vGZVPFks2LOT64ccRwCF7bl6D6I63Nb5YyW
X-Gm-Gg: AY/fxX7pAgSy5cRWHeApcV+5GxI4nbAavCagi0PYJnuRbRx2aGjPT9RWkRUExOL34Ly
	7f02AsoLwsCoDcWHL6x6+3oaDbp8fdFUA+WeYd2boi9stznZossBDKScmxfaD9GQ+6GHH0J9q4O
	7+K9MuoNpxx2fYNkafWYCjdI8nFJkTslktT2HfynbWoBH/7XuSrWNblW50ldsCESwQRdxR0ZhE4
	6217O2yrYNC1pZPMrmk0c8C4t//CsmzqvV4fdgOEOZ9359hLPdrgO8uN+p/WmW8Pg1oAjhUlZhw
	6CgHmHIOkGanNG1XGOqO2dnvqxTMx4d5knUGlUNR3G73RSAZ1LJMF6TFpVhu2n3CsrohGNL6rZ3
	GopLOAEqB2DG8IoFQJM6jWC9e2Bj2ZzQqv/15PwEdSWYq18mqM5ML3gDXCZAzjSlmGSig8MxYrY
	hA09rKCCmBIQbUyaUpvGTK
X-Received: by 2002:a05:7022:672a:b0:119:e56b:98bf with SMTP id a92af1059eb24-1246aac3151mr600082c88.38.1768885549389;
        Mon, 19 Jan 2026 21:05:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10736sm19178432c88.14.2026.01.19.21.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 21:05:48 -0800 (PST)
Date: Tue, 20 Jan 2026 13:05:39 +0800
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
	Yao Zi <ziyao@disroot.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aW8MJpERR3TmsiKg@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>

On Tue, Jan 20, 2026 at 04:56:32AM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> > Adds Spacemit dwmac driver support on the Spacemit K3 SoC.
> 
> Some more information would be useful. E.g. describing why you need to
> fix the RGMII mode.
> 

OK. I will add this.

> > +/* ctrl register bits */
> > +#define PHY_INTF_RGMII			BIT(3)
> > +#define PHY_INTF_MII			BIT(4)
> > +
> > +#define WAKE_IRQ_EN			BIT(9)
> > +#define PHY_IRQ_EN			BIT(12)
> > +
> > +/* dline register bits */
> > +#define RGMII_RX_DLINE_EN		BIT(0)
> > +#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
> > +#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
> > +#define RGMII_TX_DLINE_EN		BIT(16)
> > +#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
> > +#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
> > +
> > +#define MAX_DLINE_DELAY_CODE		0xff
> > +
> > +struct spacemit_dwmac {
> > +	struct device *dev;
> > +	struct clk *tx;
> > +};
> 
> This structure seems unused.
> 

Yeah, I forgot this, will remove in the next version.

> > +
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] = {
> > +	367, 493, 559, 685
> > +};
> > +
> > +static int spacemit_dwmac_set_delay(struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_code, unsigned int tx_config,
> > +				    unsigned int rx_code, unsigned int rx_config)
> > +{
> > +	unsigned int mask, val;
> > +
> > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> 
> These FIELD_PREP() fields look wrong. Did you mean to use DLINE_CODE
> both tx_config and tx_code, and did you mean to use TX_DLINE_CODE for
> rx_config ?
> 

This should be RGMII_TX_DLINE_CODE. This is a copy paste error, I
will fix it.

> > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(plat_dat->clk_tx_i))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > +				     "failed to get tx clock\n");
> 
> You set plat_dat->clk_tx_i, but you don't point
> plat_dat->set_clk_tx_rate at anything, which means the stmmac core
> does nothing with this.
> 

Yes, the vendor told me that the internal tx clock rate will be auto
changed when the speed rate is changed. So no software interaction
is needed.

> Given the last two points, has RGMII mode been tested on this
> hardware?
> 

In fact I only tested the rgmii-id, which does not change the internal
id. I will try the rgmii mode.

Regards,
Inochi
