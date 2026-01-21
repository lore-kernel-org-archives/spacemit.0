Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4046451059
	for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 23:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039821; cv=none; b=ui0pxVYusHgYrP2PCAs50oSzllhWqWBwozffMNTkhiPhHrPrjlCep2AZek+VtPU/YF5Us5wQivJl7eL0c7aBRmO06Qfe4tjOaaMIKh7RkyZlIh9pIMtnDyO7fykBtbvlYJl35ePEpHCH/kJFXM5EoxW8t1CaaZrXBDt3nGaTttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039821; c=relaxed/simple;
	bh=SeCqNM8GWvX5mggx4Dkj2yTgrU7KsCaM5jxCJB7vXaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnNive7g3M/LQD1B4tp3iTGucDliCqzdpENxHcELLUfpUrqn1m6soCCWwd0MGbGEarEGG1p1aywyY6bJMqRe1fRk6TzL/Cj08ZpEh3MZe3y/hD2JUR9nckJrxY7WZS/XrJjo+jik5ilSuzESi+e0XRxEh+bHoeF1o4QAhmcQBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArWB4kh2; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArWB4kh2"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1233702afd3so744215c88.0
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769039817; x=1769644617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jp0I2O5rvzmCmzT9e9dhaVxnINQFtm8fPyCPAakfKbA=;
        b=ArWB4kh2IQ5+GboqTavg/CJYBs+1zJtGP11SxQvGvG+e66fy+PRmx4urQoc5EY4UII
         1HvhB8BRfoTOyaS5roglk5hkCY4AkVhGOP0cWTyApRcpNmzrcB/2d+EVIj08e45+YRsk
         wjId6qsY3i9GWceRe731tUuKUUdIm2/BWO9a8nL4/WBK+a1Ci51+pvRYhev8eL3etqbM
         rQNY8hpTtt+jdHHrq+8L5nJxT7YaFOqXsxwueqTmDvYivHeFkx1Rf1syAbanIZlt5MyV
         7sqkRSKg0+zB+BkHMAPdspjOGCWK8UVwm5ix7u3UStIda6pA1n9R0F2y/mh5qMC1cyMb
         6QHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769039817; x=1769644617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp0I2O5rvzmCmzT9e9dhaVxnINQFtm8fPyCPAakfKbA=;
        b=alG/gA9vZAjw4fsJxnZF09zvcX+pyEXQBDO34wyBnKROIop0PHvoRk/+UBbJxq+NBR
         YX3YcmpFUQH0aoQTjUYcXkq+XrEeL+ojDTEI5kop80+Qpjh2QjSgZxnVPB0St/dyc+TK
         1sYHodTDR1mm/+bO0FaKw0U4bchtvzJKCbtoJkVnb5fQ8u0hAZ7GHnM7AQAGAB9fUTL7
         wjCSBDNllT6GhJ5h+h9BQ/kq3YL8WExegvha4m/F4+OdAWy5MhP7xliKG97wdSClaLQG
         sMjHn0pLuA86aB6/Ntzm6H7quAILemt0ShlR/WKes64p+k/nvYhfSjPdZq221AeRojsw
         qQLw==
X-Forwarded-Encrypted: i=1; AJvYcCW2za///i7riKJLLue4EVGC5eyyQoYkhsjcBsxWfWyhTTPYTb3e+Ad0W+VAmbcoQSVRInNJ/Kcd1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxS+e2AjiohqE2JEIO/iZzFHDC+vki2FZkykKsy6e79DSicA0Ww
	27W6OWSMOPGfog2cXSmBqqzS/9F6qbLgEuEM4dFrLNqm06dr5yJIov8z
X-Gm-Gg: AZuq6aJbCtSijAXZNc/HG7gNngpKOaULzocnhUVfdRIPqsdTCI7zr2LHgpnZkoDMKij
	rnGIVHbaoeVXosaJbf7v+3WxhsR3FbddWLV0WU/BKXRLSP1vCZyR0BYyI/U3isGs/5bhxIEQo1f
	4c55LM413qoid3qk4ziv8ckDXh5KGGWvcKvIAhYweNgYCM+DifqND4W9p90LrQ4mBRyNPn87pr9
	24Pn+i5QCiEz//15+Pu0aJsLNJoUjXRQun5/IsNXLJG1DzNKtUar6OBgrrrImiOuCG2Vmwko2G5
	L/a5KiIsa1sJdknMZbu390i09LCSctflbF/oK6UD28LlLXmZLzjnxj5DYl2wfAXiPeGFy3xtApK
	poVTQ59fPPktSqA+linW2iTf1pXAI8EyXpFSoxNByGADN3in6EsU5BPQV+z5+UQ+3h4AV1xFt3F
	fmnz09fslI+A==
X-Received: by 2002:a05:7022:4389:b0:122:33e:6d41 with SMTP id a92af1059eb24-1246aaac67cmr4335389c88.23.1769039816566;
        Wed, 21 Jan 2026 15:56:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac5842csm27914226c88.1.2026.01.21.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:56:56 -0800 (PST)
Date: Thu, 22 Jan 2026 07:56:45 +0800
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
Message-ID: <aXFnmXIwSdKCS9Uc@inochi.infowork>
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

OK, I will use a local variable here.

Regards,
Inochi
