Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C893C00A0
	for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997075; cv=none; b=W+MAZmkf2Mhcv+wnQr+7VCyHFVCXSwNhiKMncGc7XYwshfMnCW2CO4MS0hgd1YaR5F/NTy+a96kM23a7WcO9AJPAX6/UYjeY18WXlc6YAUzxbNe4DqhRYvrI9KMtgpXe1eTwve9JWUjLbETRCmV/VKR+sMyg9N477zDxO3todz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997075; c=relaxed/simple;
	bh=YK9zh0Ep6DWTX4vTsz5QYyGRak2PjgX8bV+rgw/6iHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGE1PLO+RJqYL7bQn5C/tHWrCq7Uv0V+/Kxzqu8SAJ9fJ0zyIFMGzo4DjpkNUUiV1ijiKNT5Qxe4YwmXGQF7/Xp07Zy5z/e1pQPN3AetQ0wTydBdD0bxkyTlyvZlntB0TakzSbSwxrfCXZuouk/KvYmlwSVJrgVLt03sTpwOx9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mto1Zpx3; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mto1Zpx3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FpPajyycP6hR8UaVkW71uLW018aze8MN50EScuTtwQU=; b=mto1Zpx3LkWT4BlB+EH50113Nb
	gD+8T7D+2WAtGQq/HAETjWDP9VjyUv0Zasp+mlwBBJM04gLMpIW89udAEmz0zL+R4JNQd+rXs+PY4
	USSP0T2O6gNnTn70MPBH5jdo6z8YgUfyFRirWq2Tdz2Gw4zd9r4L65P//5N1ynOsg2l7TAuicxjP6
	pGTRuUj70fLX9dSQS/IJJpvxKeml9OwJP/7gY9jCdnner/ChJebJ2/6jm6tSsTTsHzq6t8RGzRX8J
	mDoh8xcKRYL9T2uWFq+YyJ7ioJN2ZBtPvrNsVJYdxw+n90kPlQUz+vbO864VHSfMySk3q0BDAeUZa
	DuvPldTQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39012)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1viWw8-000000007Ns-1ncE;
	Wed, 21 Jan 2026 12:03:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1viWvw-000000008QZ-3jNS;
	Wed, 21 Jan 2026 12:03:36 +0000
Date: Wed, 21 Jan 2026 12:03:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXDAmDEpUArE1_en@shell.armlinux.org.uk>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW8LAFhCRWlMVemz@shell.armlinux.org.uk>
 <aW8MJpERR3TmsiKg@inochi.infowork>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW8MJpERR3TmsiKg@inochi.infowork>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 20, 2026 at 01:05:39PM +0800, Inochi Amaoto wrote:
> > > +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > > +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > > +	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
> > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
> > > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > 
> > These FIELD_PREP() fields look wrong. Did you mean to use DLINE_CODE
> > both tx_config and tx_code, and did you mean to use TX_DLINE_CODE for
> > rx_config ?
> > 
> 
> This should be RGMII_TX_DLINE_CODE. This is a copy paste error, I
> will fix it.

Are you sure?

In that case, please change this to:

	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config | tx_code |
					      rx_config | rx_code) |
	      RGMII_TX_DLINE_EN | RGMII_RX_DLINE_EN;

If that isn't what you meant, then your reply is wrong, and it seems
you're confused, which makes me then question how reliable your
replies are.

> > > +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> > > +	if (IS_ERR(plat_dat->clk_tx_i))
> > > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> > > +				     "failed to get tx clock\n");
> > 
> > You set plat_dat->clk_tx_i, but you don't point
> > plat_dat->set_clk_tx_rate at anything, which means the stmmac core
> > does nothing with this.
> > 
> 
> Yes, the vendor told me that the internal tx clock rate will be auto
> changed when the speed rate is changed. So no software interaction
> is needed.

Please do not assign a clock to clk_tx_i that is not the dwmac
clk_tx_i input. clk_tx_i is a name used by the Synopsys DWMAC for a
specific clock.

As you don't need to do anything with it other than to get and enable
it, consider using just a local variable here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
