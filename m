Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBA12D8385
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 00:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769041801; cv=none; b=j3RkavdsCkTiKD4tzIM0ddhvTacAO6rBcP3JrOrZ190kZBknBFf/1yiBm4Qk+zYEO4YvU1u8DjToHBu9a/+16bQNOewxxDU+4Y6JLmQtB2Jk1ILOmiMpkWNruBeaw2MtD7VwxfKXvESCJ40pPNyumz936lnhMC/oDDBm321qzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769041801; c=relaxed/simple;
	bh=lxbS6mXH2DJytQVGlFnthobG4ZmqTQXYckFy549cSX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TE+B0Sl9C/nnbkwHJk+rt8TfaXlVYmcepu28fSQ2GcIa5DZqtKJgPPR6vxbshijQIg5tLYdv2kDHtL1fSEORa4yt0p1uYxMCnSvi7c62S4GM0VTAAo9IlXQWE+1FtoZBm2KtOrVmQEDQ7ZQiVEP5T/QOzw9GzxBVQdTnH+rut8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGpgYoLa; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGpgYoLa"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b70abe3417so889705eec.0
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769041798; x=1769646598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=;
        b=EGpgYoLan7LKkzX2B5bfxNmxdqUdFTLMM/SoRtp9ZZsNR3JiqSlEdlkfiU9TFcFmNJ
         U+wYLJFK4mLjVTPxdOD/WuoXYVZR/a+TEZ0qur2CMr/X8dBXDZ8bRryc8Ijyy+xqaLYG
         3yKzIZ2wc8M54h8hg9LHGCN46DujEwsPQFoRjYC+U3zzNvzdAhCgxruMMPoU5lKiRRsq
         JZ4tG/dQ/4/shAfM38vabiYtUhoE9h+2KG/SFzkCMOeUZmP+E3ccldZKLM5HNeoGeW0Q
         AjaxYQ/F131a+YGoV7acRUykkm0y+S81+YkQBIMvBI6O9FEA527fONWLwBFhqkGqJc1W
         54vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769041798; x=1769646598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLRvrHf0GT+SLm7VDguQ+pvYrJH4LqQuaP1lqxnXl2s=;
        b=PzMzx9wVSKxSxOSZfl6d1rbJFNUs6VFkeXfO9fFjw8JmQjrocT9F6DHAeDUgg8H0LJ
         3TVvj9PnS8OzBA61hhHLLeS3vexOSA289YFxmP5CITcNQZ3AVCyH/h/z+RF7MPdKmDvK
         6wOYCoTIXD9eMQ6cLRbsGxRZ20DmS1RQYb2D5aLllppejCbPMyKIx5zIwFAxbuxynpdh
         oOk7rSWWMhgkmi4XQ3gkze2KYWXv5PkGbV2xGEXebb3vJLoIMeP76FahWIhYZ8jtr1i7
         Ia7EzlYD84Bdl8zequ0MZImqaGzvGcKV1msM9KcifWllCDnNNYwEAcRDyl9ZeqZ9TGm8
         Ebww==
X-Forwarded-Encrypted: i=1; AJvYcCUV6j4F6/iH3g7fmjh+eh8CUkWbAsygd8rqkRmQwLgkt0Bso4mKqi03keHf9fErLVaVDCfBgli1Tg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8hZFORL4zGe9HkE9d95RT0iOHl1ytx47vuI4dve644uvfjKDL
	SQhU5MqfDq4c109yGrvmmJnlKCeY5q7qxow8b7/8xSPDuMGgIgj4l3Somd6Y31NA
X-Gm-Gg: AZuq6aLbQWl7gTQiQUnDZPndVSJDqaTAM/060WST/X7GWAOLhJu49nl+fpq33It8Ilh
	GOZeNiUWVIXggfctQ8s33oRHzhcK8W/B7/lgiAXCJpwLchZT/7kFWRUGBRzTK1eDtDaRzlf5a+d
	wzKQiFDRSTaI1ZG92gC+o5qkO5zljkdUZXQal+n+z2pTHyAxws0m2dzCrfHXmJm3ztj5eEFVvq0
	pCMWiiXnIQyldzpHvnYqP1JEj6tyQWF0A3TGJ60A/iOOL9mw1UIeU2yt5UPHi8rlGrKD2SyrDL0
	gu2Px4DCAMEV/+8uzBg4uHyeRFYTPaCh4+JKvlK7CQdNoQn6xV/X3IVnJJeAXTob0rDa26BHJ/z
	34BTh7vSYj5ocENd9XI1BDDAsSeA9l0e2N5S02/R0Smt/X8Qz/UHckbPIXggur+4RSypP0MQW/9
	qQA2gukHhqVC2TmU2O2hCH
X-Received: by 2002:a05:7300:324b:b0:2b0:580b:856c with SMTP id 5a478bee46e88-2b6b41005a9mr13294371eec.28.1769041796817;
        Wed, 21 Jan 2026 16:29:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac6c2besm29548495c88.5.2026.01.21.16.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 16:29:56 -0800 (PST)
Date: Thu, 22 Jan 2026 08:29:46 +0800
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
Message-ID: <aXFvWzw1BlooyG7s@inochi.infowork>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
 <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>

On Wed, Jan 21, 2026 at 12:05:30PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 21, 2026 at 03:13:11PM +0800, Inochi Amaoto wrote:
> > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> 
> So your reply where you basically stated that all the RGMII.*DLINE.*
> constants here should be the same was nonsense. How can we trust your
> replies?
> 
> > +static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
> > +				    struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_delay, unsigned int rx_delay)
> > +{
> > +	bool mac_rxid = rx_delay != 0;
> > +	bool mac_txid = tx_delay != 0;
> > +	unsigned int rx_config = 0;
> > +	unsigned int tx_config = 0;
> > +	int rx_code;
> > +	int tx_code;
> > +
> > +	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +								  mac_txid,
> > +								  mac_rxid);
> 
> Maybe Andrew can confirm, but this function was to fix up existing
> broken DT, and shouldn't be used by brand new drivers.
> 
> > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(plat_dat->clk_tx_i))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > +				     "failed to get tx clock\n");
> 
> As stated on the previous series, please don't abuse clk_tx_i for
> soemthing that isn't the dwmac's clk_tx_i signal.
> 

I have seen this comments, I will switch to a local variable in the
next version

Regards,
Inochi
