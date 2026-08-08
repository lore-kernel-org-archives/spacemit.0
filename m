Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD51730C16E
	for <spacemit@lists.linux.dev>; Sat,  8 Aug 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195859; cv=none; b=FgVKPJecmP+0mW8Gb4ibbhLgc7vxfePL084SqKI+Wt+PEJbHe4W7/ovEv+KJ4kpMKUw+YHcyaXSKwPceXpWeciwPpcKrvU1UM6+pBPy/2KlrVsTl0rezDUcmiD53TfMCVca8dj5kHkSHP8hDiW3vYNwstKMOJXeeYNsxRqvgmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195859; c=relaxed/simple;
	bh=GcFnNVCqGghgN6FJ2JiRi+jSktMU9+DvANABx3igE7g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/Q8i0vGlBkJUqN7N+uaDnJGtsUbovNJcaSDr3EMo5C08/AbUR+j1MiHw3gC5hSNau0fz+ddV/G3Efzff+XT/VuqSZgSMYMZ7iAX4NXuVeVFIEHWUN6fIkVokiap41aMJvP3xDB3YxF492DJp5CaOw/3cD6QP4vlh6pFrmGrfZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oa/ouRc1; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oa/ouRc1"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-cb01d87597cso17296a12.1
        for <spacemit@lists.linux.dev>; Sat, 08 Aug 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195857; x=1786800657; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zYCYgrPHJ1R0IyDM9ZJHQW95fmf52/M7XVvd8snhDU=;
        b=oa/ouRc1c7zbzClJ9M5fqcu8D1LX9DU9BMhGZTtZzUwennFOtyrbd+J/NL5SzasVFH
         rpa3thWPNERwmsEjXPVmVcvNPb3/YAG8H82Ul2wJgUwLsU2MtHzIj6FNXV2bMUhxU5QG
         C6euyWIhFJEuOIOxOm0aorI1V0N+sYcipQ8KnLd+FK0/YHLYu7ucoyQNwGVfYZiiCaX+
         sFWV2SKJSBnz6pQpU/wIMvV45pWC8hNHpUDWiD8tIJmQovoPfzifFlwKAl/3rXPfS97J
         gqYdEFRJPo7WaMlIol2qckrxw0vmzrqfNc7mEUYQfoaB3FOydTLr2rkswYtnoK4edEl+
         U66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195857; x=1786800657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zYCYgrPHJ1R0IyDM9ZJHQW95fmf52/M7XVvd8snhDU=;
        b=DcpIWyCrI0X8SOSSz+hGvCQ9GMNBqjugoSA/5woBgvqgVY/LN5DFCUoKykTNrPp37W
         rF3z/zculiWgGs6sKfivdPj9Jf+LPHN8EgzRzhcb1IbzwJh+57D/xUY0GB/7ijxWCtPY
         jqsIjpqGlx6HODwj0DHWUQSvlEGcHJIuFZuxVeP0NeG4C6W+QEPns8H/VjvsipEvA2vG
         LEos2NULVDTV0xLpEnfGE0R3o+j97HHPWsTmiVbRMFD0KSknECOCkxGrlKXOeUAqFks3
         3UiSY/cUwQT/h3q/Xm3O7epSq+FR7lchy6bTRLO9pGvFutCnlJRLod/gxLsZsscGYP2z
         50eA==
X-Forwarded-Encrypted: i=1; AHgh+RrhELtzjWzvRbPCRzRxtziE/NBZmPbv94ox4UAcIkvBdpbInGv+Hc8B6O/ME1tV0cIg57L/hb5BBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YweNarK3/FLba75TxRRiXS0UZse02EmnkIqtdTbF8K3D3QYAiow
	5sK+jPjJyK4Tj/Vb2WNbmXgd4gCPMy3j8B1NlBNsljVtQGcOoX8eW8HR
X-Gm-Gg: AR+sD10fTTFkoypTNcK+XTzKbkHm3DHBLDQtKHcI9WSfxLvafHYrKz5dguLWxVIy4jW
	U3yXfpg1MxAMD6f615ahPvCLCQQMUxsYB6h2CYa89vM1UlBYodOYIn+XQBIT2SU8FzB8/XjRR4u
	RjGAzxWtIdyQ2+mt/fOf7HIJS7uMz/6uqsJOr6q5V/5nSxOIvnm4JeghBsAQdVTdlsQBsTa8S6d
	7z5+Yvvyxz7dV7yD9I/otB3yq5wVwsFx3W5qHiYTmmxWC1Zcg6AkGPf1fTy1zPLHcBdPp++YfNZ
	2G4vhgk3RZ5I+uud1TPYl/Zn9GuK+wtqoIp1bJy8n1OoBC7S8z2UIJpVbu6QeLAYHmnVa+GbENz
	r75yusGASsY8pVdnAYQxjtGUQO75VQQO071eoDcJ1xvbwnIBo0uJvTKJ+J+rLZTdKHxK2qw63oy
	pMJSrV7Ts1WJi2Z+WTusZKBIMTXsQDz+etrg7DRQ+7b6HX5viMOw==
X-Received: by 2002:a05:6a00:240c:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-84f6b778b44mr5395163b3a.11.1786195856790;
        Sat, 08 Aug 2026 06:30:56 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9a9sm2125357b3a.37.2026.08.08.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:30:56 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:30:52 +0800
Message-ID: <b66d3009f9cf310ca0f068999bd475ac.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
In-Reply-To: <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
 <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Philipp,

On Mon, 27 Jul 2026 09:49:58 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
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
> >
> [...]
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_inno_dp.c b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> > new file mode 100644
> > index 000000000000..e88731d9b18b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> > @@ -0,0 +1,2443 @@
> [...]
> > +static int inno_dp_probe(struct platform_device *pdev)
> > +{
> [...]
> > +	dp->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
>
> Since this is only asserted in probe and deasserted in remove, you
> could use devm_reset_control_get_optional_exclusive_deasserted() [1].

Thanks for the review. Will do in v2. The binding marks resets as
required, which means I shouldn't use _optional in the first place.
I will use the non-optional devm_reset_control_get_exclusive_deasserted().

> [1] https://docs.kernel.org/driver-api/reset.html#c.devm_reset_control_get_optional_exclusive_deasserted
>
> > +	if (IS_ERR(dp->reset)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->reset),
> > +				    "failed to get reset\n");
> > +		return ret;
> > +	}
> > +
> > +	dp->pxclk = devm_clk_get(dev, "pxclk");
> > +	if (IS_ERR(dp->pxclk)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->pxclk),
> > +				    "failed to get pxclk\n");
> > +		return ret;
> > +	}
> > +
> > +	if (dp->edp_mode) {
> > +		dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +		/*
> > +		 * OP_DETECT is required: without it
> > +		 * drm_bridge_connector_detect() hard-codes CONNECTED for any
> > +		 * eDP connector and fbdev wedges at bind.
> > +		 */
> > +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > +				 DRM_BRIDGE_OP_HPD;
> > +	} else {
> > +		dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> > +		/*
> > +		 * No OP_HPD: the HPD interrupt is gated by the DP pixel clock.
> > +		 * Leaving it out marks the connector POLL_CONNECT |
> > +		 * POLL_DISCONNECT instead.
> > +		 */
> > +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > +				 DRM_BRIDGE_OP_MODES;
> > +	}
> > +
> > +	if (dp->reset) {
>
> This check is not necessary, reset_control_deassert() handles NULL
> pointers.
>
> > +		ret = reset_control_deassert(dp->reset);
>
> If the _deasserted() variant is used above, this can be removed and the
> reset control doesn't need to be stored in dp.
>
> > +		if (ret) {
> > +			dev_err(dev, "failed to deassert reset: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> [...]
> > +	return 0;
> > +
> > +err_clk:
> > +	clk_disable_unprepare(dp->pxclk);
> > +err_reset:
> > +	if (dp->reset)
> > +		reset_control_assert(dp->reset);
>
> Same as above. Remove the unnecessary check or manual assertion
> entirely.

Agree, all of these will be fixed in v2.

Cody
