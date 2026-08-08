Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822E3EC80C
	for <spacemit@lists.linux.dev>; Sat,  8 Aug 2026 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786198028; cv=none; b=Xg1X+gVfeA6p4+2dZYuFogGElFKwhrli+RserSIfs2hyWCpgP6eGWXcfR5llSDCi/uMF9YP64yiFeToPPpupc+FFRpaSYeyEd20JTCgadWyC0Arp3R1rTPU6YzMDnJ9dpp6jSBkXsJ9fJvuuv1a3zX9hv/GV+mBWjZ6T0aoavaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786198028; c=relaxed/simple;
	bh=Aar1x9JA3i5d5qHNi8WoHCLxzhdIChv9/LTSPfuTPLQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSRoTfzM7aSIh26wUDViw/op51VYdFzbTALYdU23/aTXDs5FL6UlrpFtycxtgDi5eAQZ0tlpUH5n3NXFkq6SfxeP3QaLtZsjA7gQD46Y1L8hSUMgh8eLUU40oQ9AVsHR1qV2/XcssywYbcjYVOCNVjbK0OtLIPnR49gRo2Rw2wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijGYYj52; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijGYYj52"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c9fcd903839so283010a12.1
        for <spacemit@lists.linux.dev>; Sat, 08 Aug 2026 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786198027; x=1786802827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zrxXzmuLnBiNnwK74e3uO+cSnorKNXKL/VAH2ROuE74=;
        b=ijGYYj52aANyEwSubofjufSS+78Ld32XA/98nfofdKn2Vq78IPIEkDcutqeiHXRE/k
         OfKEARcsb5wr0sUKepe9AqTdY1FT4BDlktbuAphk+ZjH613xGsMNXwGezX06/3Oe4m55
         qX+l0eyOOrX9kuApr+dvirbL5CKJu8olA4mCmGc47nnwoNoZj/agI8zYbbE0S7NAQ1yK
         Qj7Kpoi3zzdIgIOQ69eaIrQNL5WeI5zfoAN93gfOGIQ43Fi+EOmUmwDWmGQtijwtDag0
         y5ASagPnXLXppbQqLlJAQUR9qjfvRrE+pRVttvwSY/NuaM6q39ZUQUyBf1yC0P5eNYxn
         RAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786198027; x=1786802827;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrxXzmuLnBiNnwK74e3uO+cSnorKNXKL/VAH2ROuE74=;
        b=jQmykQVRb6KaWKDx2Cbkb9n85xxYdDtjX6J7p+sVtSAai65moV/hRDqgfR6gmpRoIR
         bBsowDsLeivAn6HjggM0h/GfSuleE2UIu4H8bpZzrb9TFk0eP4jb1dBkMo/l1+j15zM6
         3TBaojC6/fFzEzTSFYxG76+KLwMVuhTIO1t36QzZpi/HUcJoFoBQHwqCYk3cAK9G7Lqg
         YizaZ/iDXvX5fFjeFoQoL01EfdZgxO567uCeaNQWnGPperWlngKoxtijYjRvGU1FRlZX
         Oxja01ZI5NpEtvRzAsh4obE6NIYMGzIihvpVnfb+lyvvOL7zMLAJQpZh4wAbtd3TgXA4
         e17A==
X-Forwarded-Encrypted: i=1; AHgh+Ro6sPkSN7R6ruQzZYabfPW0P/4tVk/OvS/iohF2hCQrPVkc27EYxc3/8pdCszz1Yz8vJDcnt3fnGw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg3YPd1uxTnU2ncfEG2sibjk482/AV8FHULxxHDDHAizlK36Ug
	TUdyxUoyLsexT9RCZlhnNBtTLVDhFrGuoz1IXPsloQWf1Op55yEH+Zj2
X-Gm-Gg: AR+sD11yCkYZ1BHnsUNbaIUyosPTPf/AhM1AcvI/TJthrJa/0l4vRp4faJul5JgKrFm
	vZJz4kIi8kaI0WWdWQNus4uBtFOcoL8yKUitJVq33qV0PU/m8UJhvtIB41oJ6O6bQGRZSXxqEr5
	fr3sSoZz/Kn0jbiN5UNAwlZcu1ZcOVFVQZcrPkyw9pKOZaNE/9N4BoTcbGAz5OOcnTBiCAyPf19
	XEhRlFKo1KA14YkBEOH/hrDEspkaHTI6K9QUPA+KQmkUeA+mCGZmsU+jAYdTCjopSsI6EYZjo/v
	ZgmsV9LzEVhzC1ndKLzP3kyTi5iSjuBJOPEpW7SjP8UJf2OOefaeU4WWjHilT/X6Nn/8ceaXQBq
	yRVlHKTM4/+V9iYhDysx0YGpxRTjB2OC2LCVqTPrAOLR+2i8V89bZ9wJ8f4aTokknoUQALq77t2
	Uj1Enpf8QFnClfhcsI9jAGRgF+2daPxzj0xBiebtE=
X-Received: by 2002:a05:6a00:2286:b0:848:76af:db37 with SMTP id d2e1a72fcca58-84f694200b5mr7899614b3a.7.1786198026809;
        Sat, 08 Aug 2026 07:07:06 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f372b5bsm1905209a12.25.2026.08.08.07.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:07:06 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:07:03 +0800
Message-ID: <7b4b8457715c2e447f3b3522e519f0af.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Yao Zi <me@ziyao.cc>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
In-Reply-To: <amdPPBOH-Dk4oU7y@pie>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com> <amdPPBOH-Dk4oU7y@pie>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Yao Zi,

On Mon, 27 Jul 2026 12:29:48 +0000, Yao Zi wrote:
> On Sat, Jul 25, 2026 at 12:51:21AM -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Add the DP/eDP controller that sits downstream of the Saturn DPU. Two
> > identical instances share one compatible; the eDP-vs-DP role is board
> > wiring, so it is taken from the devicetree: an eDP panel always sits
> > under an aux-bus child node, an external DP connector never does.
> >
> > The link is driven through the generic PHY framework, so the controller
> > never touches a PLL register. The controller's HPD interrupt is gated by
> > the DP pixel clock, which can be off exactly when a plug has to be
> > caught, so the connector is also polled and the interrupt path re-reads
> > the live level when it does fire.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/Kconfig            |   19 +
> >  drivers/gpu/drm/spacemit/Makefile           |    3 +
> >  drivers/gpu/drm/spacemit/spacemit_inno_dp.c | 2443 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_inno_dp.h |  328 ++++
> >  4 files changed, 2793 insertions(+)
>
> ...
>
> > +static int inno_dp_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *aux_bus_np;
> > +	struct spacemit_dp_dev *dp;
> > +	struct resource *res;
> > +	int ret;
>
> ...
>
> > +	dp->pxclk = devm_clk_get(dev, "pxclk");
> > +	if (IS_ERR(dp->pxclk)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->pxclk),
> > +				    "failed to get pxclk\n");
> > +		return ret;
> > +	}
>
> It seems pxclk is only enabled in probe() and disabled in remove(),
> please consider using devm_clk_get_optional_enabled().

Thanks for the review. You are right that the disable belongs to
devres. I will move the disable to a devm action registered
after the populate.

But the _enabled part of devm_clk_get_optional_enabled() doesn't
fit here: it hands the disable to devres at get time, before the
PHY child is populated, so on unbind pxclk would be disabled only
after the PHY PLL it is parented on is gone, and the clock core
would warn.

I will keep the non-optional getter, since the binding requires
the clocks.

> ...
>
> > +	if (dp->pxclk) {
> > +		ret = clk_prepare_enable(dp->pxclk);
> > +		if (ret) {
> > +			dev_err(dev, "failed to enable pxclk: %d\n", ret);
> > +			goto err_reset;
> > +		}
> > +	}
>
> So this check could be dropped.

Yes, all the if (dp->pxclk) guards are dead code; will drop them
in v2.

> ...
>
> > +	/*
> > +	 * The PHY exposes its PLL as the APMU pixel-clock mux's external
> > +	 * parent.
> > +	 */
> > +	dp->pll_clk = devm_clk_get(dev, "pll");
> > +	if (IS_ERR(dp->pll_clk)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->pll_clk),
> > +				    "failed to get PHY pixel clock\n");
> > +		goto err_clk;
> > +	}
>
> Same for the "pll" clock.

We never enable "pll" ourselves (it is only a parent and rate
target), so it will stay a plain non-optional devm_clk_get().

> > +	if (dp->pxclk) {
> > +		ret = clk_set_parent(dp->pxclk, dp->pll_clk);
> > +		if (ret) {
> > +			dev_err(dev, "failed to route eDP pixel mux to PHY PLL: %d\n", ret);
> > +			goto err_clk;
> > +		}
> > +	}
> > +	 */
> > +	ret = devm_request_threaded_irq(dev, dp->irq, spacemit_dp_irq_handler,
> > +					spacemit_dp_hotplug_event_handler,
> > +					IRQF_NO_AUTOEN, dev_name(dev), dp);
> > +	if (ret) {
> > +		dev_err(dev, "failed to request irq %d: %d\n", dp->irq, ret);
> > +		goto err_clk;
> > +	}
>
> Since 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()") devm_request_threaded_irq() automatically throws
> an error message when it fails, so this error message is redundant.

Right, will drop it.

Cody
