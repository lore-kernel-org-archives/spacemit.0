Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A55448D14
	for <spacemit@lists.linux.dev>; Fri,  4 Sep 2026 20:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555132; cv=none; b=ApcnNztjojp98c6kZ+oerjrXKybGNK+YSkzZGHIInrDTIqEsMqbQ2tYJoR2KSQxMzl8r2pn9A3e3DYknT0nZd3d1XPLIPFkSP9pWMSSYxKKON+2Wm4k2Ye+79rkEyGz//0Tt62mt9u+NBdOWYoh+1lPvgNQO2yArjtZHrDA3f3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555132; c=relaxed/simple;
	bh=c30PDiddrLA4oyHlYfg02onRKnBMXzqv4IbLFULbIeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4+Mxuey4ecuzY4CKIp++WkMdwYvgxqh4nnCDnxtOebo3bWH50F/XJN85ibwM3ELuO/vOZPZFHss3nUvZD2A8/hbCtM7LkRwoiLXV0/5m0Kn9OZxPy9ZOvQWqWfU6YJOKPGbSOV5HZ4CpXpqQ9Vxm3No5YQT/HEqDP0Gt/t19NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fU9si/dV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fU9si/dV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEBD1F00A3D;
	Fri,  4 Sep 2026 20:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788555123;
	bh=6GQcHgR85XdlVHpXTOOmvcdOAAPtunBQvPqpohTbcTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fU9si/dVdej8WMy/sABljKGhehyDdd9jeXzw0BEoItdKMY40wA8R3QfCR0rpmxnNO
	 uCRlf4b906O3gHpjUSoBTYXzN7wZ9rd8R4lOx2klnL8ckPdNg9fWELfRvnbcLXrqpp
	 DKpzolsh8zZU/BtjLaA8eDKg+/JQmjv6YoyBADtOzrzYBJD3jzSn4z2cvgBcVO2YeU
	 vEUe71vc6wrdAdFGhTiI0CqYGvtKY5PSGcWErOhnYwzWWEk7gn2pLMNsoz8RIupKQE
	 P2slcOJmv6KoR6YLOhdzYU6ny5/5Q2YudCCd50u0OaPcGewBk0p0gz2iK+qjKcuBXI
	 W+ZLYoloFauiA==
Date: Fri, 4 Sep 2026 20:52:00 +0000
From: Yixun Lan <dlan@kernel.org>
To: Tim Ouyang <tim609@andestech.com>
Cc: u-boot@lists.u-boot-project.org, spacemit@lists.linux.dev,
	u-boot-spacemit@groups.io, Lukasz Majewski <lukma@denx.de>,
	Tom Rini <trini@konsulko.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Raymond Mao <raymond.mao@riscstar.com>,
	Guodong Xu <guodong.xu@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>, Torsten Duwe <duwe@suse.de>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@flipper.net>, oyst.lnx@gmail.com
Subject: Re: [PATCH 6/8] clk: spacemit: k3: reduce clock tree for SPL build
Message-ID: <20260904205200-GKB53903@kernel.org>
References: <20260825-01-k3-clock-reset-support-v1-0-c430253e759c@kernel.org>
 <20260825-01-k3-clock-reset-support-v1-6-c430253e759c@kernel.org>
 <shthcaz5wjcp2vwd2c2i74axiayf4zhlgsoq5fbswofld5poq4@znfx5b2yby2t>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <shthcaz5wjcp2vwd2c2i74axiayf4zhlgsoq5fbswofld5poq4@znfx5b2yby2t>

Hi Tim,

On 17:55 Wed 02 Sep     , Tim Ouyang wrote:
> On Tue, Aug 25, 2026 at 04:24:16AM +0000, Yixun Lan wrote:
> > Due to SPL image running in a memory space constraint SRAM environment,
> > so reduce the whole clock tree a bit to make it fit for final runtime
> > requirement, only a subset clock tree is registered, which includes UART,
> > SDHCI, I2C (TWSI), and their PLL/MPMU/APMU/APBC ancestors; while the
> > full clock tree is retained in non-SPL build.
> >
> > Where surviving SPL CCU definitions reference parent clocks outside
> > that subset tree, it will use "clock-dummy" as name of clock parent to
> > ensure the framework still successfully resolves the parent clock lookup.
> >
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> 
> [...]
> 
> >  /* APMU clocks start */
> > +#if IS_ENABLED(CONFIG_SPL_BUILD)
> > +static const char * const axi_clk_parents[] = {
> > +       "pll1_d8_307p2", "pll1_d6_409p6",
> > +};
> > +CCU_MUX_DIV_FC_DEFINE(CLK_APMU_AXICLK, axi_clk, axi_clk,
> > +                     axi_clk_parents, ARRAY_SIZE(axi_clk_parents),
> > +                     APMU_ACLK_CLK_CTRL, APMU_ACLK_CLK_CTRL, 1, 2,
> > +                     BIT(4), 0, 1, 0);
> > +#else
> >  static const char * const axi_clk_parents[] = {
> >         "pll1_d8_307p2", "pll1_d6_409p6",
> >  };
> 
> The SPL clock subset does not seem to include all the clocks described
> in the commit message. For example, the SDH0/1/2 clocks are excluded
> from the SPL build.
> 
> Is this intentional?

You right, but I will update the commit message instead of changing the code.

The lastest dts in u-boot next branch just synced with upstream kernel v7.2
 which doesn't include SDHCI support (need to wait for v7.3), also the SDHCI
for SPL support still needs some testing, so I will postpone it in later patches

-- 
Yixun Lan (dlan)
