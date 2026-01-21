Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6666923EA9B
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 00:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769040913; cv=none; b=Pl291BnmpEp3UacxqFnFn7bfNWa+RaRbZvwMNcDwzCPjv1sxx5V5EWcAPiDKIOenMhOW4t4Id2FSTEK5rG2og5UCfD0/Lm7HX1e4GRDtTxMYr8imcMv4M+vk5JEp3xrrIe5nmz8aGAm8ohaiQ5wGwUHsz/XB03sItjFMsrtwU3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769040913; c=relaxed/simple;
	bh=wAtMZUK4FV7iRWMYfcVdkDkwpZkU2TSPElEoKPCQOFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tv389IT/AxBJvJSXS+W3ziPNdtvGlWiHwiV0XzcxqkBi0eeRtF9wgvg5MfcxQ7F0hmZhU0bNw3XOFtjM0E9+XrLuMZHDmoBAJ+idFWojYHPDwqcRGlsVqwQwq2BS1x5jC6fuXgkOxYShlaVka6J88qKZAidwhfUEVqCFrHraTi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euBW3TrO; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euBW3TrO"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94121102a54so232105241.1
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 16:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769040910; x=1769645710; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzXSISnrF9gPuh5VrYor9F9pE35gc9wpvxNp6irLpQw=;
        b=euBW3TrOKHQBgxwCI8tp6X0A3wbErpC5sIrsLTgT0kJi+vc72CuH+zz8nUbXS36PNH
         b+m1fTx5L182tkDAGuSiwO1tQuLhNnwppHb2184z2OMq4zw+dUjyNIdqRnfcCUGEoFkq
         mrWbpMm2mcO3zqNfPzP1W/zgU9ZIii9MH+jooZSDzKdZLFhRwEc/CqfxrDGRt8WVihQe
         L+Hs65qIB/T5O7VkSMRrDUQKyiwVGeYjFmMCyi73tQCZjGlxfd/mQG1YSSdPZ0iFr68a
         rYtNdC7K/rs6XdL/2HgW01sZhFR81h/H64Cv4TP13Of1bLm/mbREIMstgi2yqy7rxlgK
         S62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769040910; x=1769645710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXSISnrF9gPuh5VrYor9F9pE35gc9wpvxNp6irLpQw=;
        b=a8Uz4Tqm90oDr89SygB6iZCwbvTQ9ZyzWmnqrUt1w5MxdBpBZXaBU617Mkbf+HhdJi
         vAw4w2Ejg7Gds+JTvHZDlauWWLdp2B/pt1uiKDzxi0Xr3bb255/qMLLH/atHDevmPex4
         sI1zkvbyGH9em2dT1AVnMRcJUy2oAItjUw2JiSd4g38zP9pq/0ZD5jDJ8987Z+ykTlAO
         IQsbmd9LmjAPs9XrqgCZ+ulWnFt9tNTfkkp9gfCJxm3QhWF9m7T8rJyeiKx3eaQ4a4d3
         LCdjpe9YtPKcvMDF33AugPGeCTrqCnQIE3xtZ7v5u+OS7Xec8Ke/cI5iJzz8U9wXxPFE
         PJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWs/DYkxw/VUZbt8xbY8HXSpl3j2yMVekdEUX5IJwzb1NMw6zFsNYjAr+XaeMrZnKwEqTheKJh6VQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5DQcimFZTGPohFcBuNUKP0MKljVMlbx/HwwsuBs6wio25znOv
	MFPjDtPjKvsBSaMI29GEiVO7kBv+ugU9ihovR1bLGWYXVYNmdD++HWIJhL/Z9VbF
X-Gm-Gg: AZuq6aJCmiyQqOWWxtj736f0XRjXCXSuUY6pQgpzeO6FsKboxoTOIcfI04QfzwNZo9D
	LgQ0pcoO4f1CcC3NmL5MQWDkcFDz6pHATFa/3gcSd5edwASdx/gPzeDInvySKE8g+nYdRkiCdMR
	XtwtY29h/sqq2/sRX/e1/X8stC84f2t+fubEUoU6zC9ScPLmst80zBLgZ4kwvIXh6C/LhkmErGn
	06cVnmjGxHTy8elQajnpfXDHL9oNoaqQEXWAqifrimi+vV3HUpTJ6N5rMzAP2GtbOv9wm9oLjw6
	l4ZroUbrPfqn7r4VbgCRRxlumAEPowOlS46Y2GpxF5DKwWiNlJe1ZgD/BJA1H8lm7KaBI/VtDT9
	jAHn3ucgI2upAKes1ecKjT/5dsrUvJNGFb52nyNSB60ig/BdpvVf6MzFLBbab8zHQDFLwFUAgRs
	AV3Oc4QXtBew==
X-Received: by 2002:a05:7300:bc08:b0:2ae:5470:2e61 with SMTP id 5a478bee46e88-2b6b46c68e2mr15434088eec.2.1769034989298;
        Wed, 21 Jan 2026 14:36:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503a30sm25165715eec.13.2026.01.21.14.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:36:28 -0800 (PST)
Date: Thu, 22 Jan 2026 06:36:18 +0800
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
Message-ID: <aXFS7fW8kdsi_2ud@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
 <aW8MJpERR3TmsiKg@inochi.infowork>
 <aXDAmDEpUArE1_en@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDAmDEpUArE1_en@shell.armlinux.org.uk>

On Wed, Jan 21, 2026 at 12:03:36PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 01:05:39PM +0800, Inochi Amaoto wrote:
> > > > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > > > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > > > +	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
> > > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
> > > > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > > 
> > > These FIELD_PREP() fields look wrong. Did you mean to use DLINE_CODE
> > > both tx_config and tx_code, and did you mean to use TX_DLINE_CODE for
> > > rx_config ?
> > > 
> > 
> > This should be RGMII_TX_DLINE_CODE. This is a copy paste error, I
> > will fix it.
> 
> Are you sure?
> 
> In that case, please change this to:
> 
> 	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config | tx_code |
> 					      rx_config | rx_code) |
> 	      RGMII_TX_DLINE_EN | RGMII_RX_DLINE_EN;
> 
> If that isn't what you meant, then your reply is wrong, and it seems
> you're confused, which makes me then question how reliable your
> replies are.
> 

That's wrong, I think I have reply it in a wrong way, it should be

RGMII_TX_DLINE_STEP -> tx_config
RGMII_TX_DLINE_CODE -> tx_code
RGMII_RX_DLINE_STEP -> rx_config
RGMII_RX_DLINE_CODE -> rx_code

The RGMII_[RX|TX]_DLINE_STEP register selects which step is used for
rx/tx delay. The RGMII_[RX|TX]_DLINE_CODE register provides the factor
used for calculating the delay. These register are computed in the
spacemit_dwmac_detected_delay_value(). And finally we can got a delay
with "code * step / 10 * 0.9" for both rx and tx.

Regards,
Inochi

> > > > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > > > +	if (IS_ERR(plat_dat->clk_tx_i))
> > > > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > > > +				     "failed to get tx clock\n");
> > > 
> > > You set plat_dat->clk_tx_i, but you don't point
> > > plat_dat->set_clk_tx_rate at anything, which means the stmmac core
> > > does nothing with this.
> > > 
> > 
> > Yes, the vendor told me that the internal tx clock rate will be auto
> > changed when the speed rate is changed. So no software interaction
> > is needed.
> 
> Please do not assign a clock to clk_tx_i that is not the dwmac
> clk_tx_i input. clk_tx_i is a name used by the Synopsys DWMAC for a
> specific clock.
> 
> As you don't need to do anything with it other than to get and enable
> it, consider using just a local variable here.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
