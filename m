Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1933644D4
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 01:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047007; cv=none; b=E/Sw2+HY6Q1uM3yVRI5nPjcKQtuSunaVMRGVbPkWiRtjhWQDClCRq7GeZgrxZ+8FOwKsEMmjiWHXzSqiZKUTn9P6QFsB3mAe4p2AjqPFbPaZyXr0yURkcnguPLKiw3tnf+TgitXZdYmbPn/vHK6Y6SnMI8jlHIV39FDGMpE11TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047007; c=relaxed/simple;
	bh=ms5pWR92u/Sb/qm5qVz6BRpgwmPmV2/bOD5kn3A20VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAlr58qtT8oxA+/IjjD2k2/AzJoC3KfbwGDGLZFQ9FtZGQ0RsgBaHkhgTKiwHrpfQ/sCKyki84k06rn0pV6aXTNWgObewgRXyMvTd72QtYAaEHxjQxGoGf4um4cyT8g+Ne6bsXLAVD3oCcP9lJUTNl5MVAO3eHHoX5FmHXQiLac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIzJk58S; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIzJk58S"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3ffc3d389a8so325399fac.1
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 17:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769047004; x=1769651804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGEOJU/uiNboJwAtLEE6S07BEXT+vA5BV+sOD/aPObo=;
        b=DIzJk58Sq+RwS7wHzGKmplruasYUFHQ6yRGzbLNQpoo/OKh25H1GPVHEr/psCbpxbi
         xb5YcmD8jgrDvDm9vYRSsstHMX+Lbx6SvGBhVdQY84Zb2d2BkaBRW61cY7VF5xsLLjNe
         3N34bId92WMIHK/c3dn/tNfmP+RJfFMhrxuI/91KdXc/PlKAPcAIaO3ZPjVT7ihKQmhb
         vwu1QiNqXVL+5aUafp9Q0xSa5ITPTvfwep6romyLWrWM5Wis7WAAQtBuPlMA0QrWvZvr
         1bJKM54GzVzpY4WIXYRGrzY8gSqucjuriOwsDg6kRJ3sgyHW+ZayVLwV+On6XL7okfqO
         Yy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047004; x=1769651804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGEOJU/uiNboJwAtLEE6S07BEXT+vA5BV+sOD/aPObo=;
        b=ZP+8BKm9QIpGf6oJiOlxFBIBhibuiyyIlE9Jy/lb4yUF87kfpAyG/IPMvF52oqAg/n
         20n5lXJc4HzeMPmkyqwrLUx3K3qryHlJvf86ooZG5pYWljfO7oTLVYe3fUUSzchZhiLe
         5DvUKBT+0pRIx+MzEIm3f5LeMIcvjdFdsAjMGHbWpka79Ey+XejdHqBq5DTr9tGms4/t
         r2/OkEvKg68ycjDonPMD7oHjWGY6klIq8VE1mnNDx39fpiyOV6LgL/zDHKEB2XiUjp1O
         cp6iDQamrtuEvXBXqI9YRCcAY/kB72tRvFaP2ueexMyDVd1VsO1BPjg1bUN+I3XMyHzu
         NcIA==
X-Forwarded-Encrypted: i=1; AJvYcCVGwp4p+esE/Diq/gVKJ/IxqBuRqbYCC1rESzMtiPUFbekSE3HjLeK5Q5fjtxFHKumTuFNhC4Xsrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDlcq6pyGI4PoMhsDgDUWLqWHjjsdIwtAkkGzYVgpQEknCFpeC
	zwf3u3N6hqAECoct6kK0AZikJ3XAkxxVF3GdsnEw1lqHXIKhJNU4d6wi7nBIFwiU
X-Gm-Gg: AZuq6aITlatRVRh3+cfNjkR6LaNHy4Us7BoMg4h4+M6xrXFYtk64LQQNFc0m/4tQrIN
	OgHyMvYl/BmKhwDd73eEov1C4OlKb5mCK2U2ge11cL7rAPe1iZlYvZR8UAEdO8KN4lGXWHnp79s
	sNZUNgrtWBfRSboBPsaeJHlpHTlrWn+OzDh7wdDxCUYFt8/h8gnunjySNOs4UcyCHBFwBVxySVo
	xm4I0eoZ6/L4bCRHfmPVC83VDyyoCYry4IxeewRWb9LMVeS4cYT1Li48QI2zS3s95qRxUq8S0Ho
	otGrwjTjUnsSx4m9gpcyMyLaagJQvPmNRswqNyJRJ0HxsAls0X6ZqE+i171RB82n8QMxKEAUw5K
	1FyQL7zKKlfMNXf9ExiPfCDyMdsS07SMXHHo6lSK6xM/0nAuz4ENFDwPGxOQP6nSPgMsKnYrdyj
	+JKOS2uNF6mAiJXmWQlU/8
X-Received: by 2002:a05:7301:408c:b0:2b7:143a:9a8f with SMTP id 5a478bee46e88-2b7143a9e6bmr2183820eec.7.1769039928585;
        Wed, 21 Jan 2026 15:58:48 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b361f5d4sm23459514eec.17.2026.01.21.15.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:58:48 -0800 (PST)
Date: Thu, 22 Jan 2026 07:58:37 +0800
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
Message-ID: <aXFVIK57ZNMD_Sbg@inochi.infowork>
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

Sorry, I have found there is a mistake for replying you.
Now I give a detailed description about this registers.
You can check it at 
https://lore.kernel.org/netdev/aXFnmXIwSdKCS9Uc@inochi.infowork/

Regards,
Inochi

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
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
