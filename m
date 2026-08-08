Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9240587A
	for <spacemit@lists.linux.dev>; Sat,  8 Aug 2026 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195325; cv=none; b=bHjIuMqqc7szFRqZKBWRCuC48/V442LM+U/+risV5G6AgrxScRxTluXTL2984KSXh6pN3zW5CUZhiQTPjbQokfCQoEyG/AEkTZNg7rMYaJDkhEBsLcNvUz35ATV1bJa9AyMq25cikaZSFrXSdnIPoOd0KCUHUGY8uuGj1AumdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195325; c=relaxed/simple;
	bh=3bY6g03Im9fvI5gkQ67473PMLqfsCYi0JF6q2NRnWt0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y8wZj+OXo+/sAPob8qAV8jJIjLve9R2MXPmlbJxBytfJGBjPPKxN/dzPTfeJmp2wBbL5h5CZdRY1aVs0CxnYUHxojtHXdWmAixJEnZZ1g9UreasGuDtStaqsCxPMPLWlJfDqYH7ayY7ZlkTirEuNnBbRH0lVX1mH0//ljGGD2P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arWVLv0D; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arWVLv0D"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-38dc4f9462cso263057a91.0
        for <spacemit@lists.linux.dev>; Sat, 08 Aug 2026 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195322; x=1786800122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li/c4+/312t4GgA151ifIixBtg8Isry/It3D3W9Em4A=;
        b=arWVLv0DdtWSO8e7dL76bQr90SNFt9m36B2VlKYO+AyhYnYClHkMXHOsst+PWcP/SX
         FZKe9KQtFqpcxbAKmMXM05stIsiNLX8Alpt2IJaSMA+3UevyHM85tOlEi4O/LwZh7jf7
         4Ph2nIWR2CYGpWt8fo2oEwZtrrohSplP2rNKUxZZieuBG2t9fUKprGtZE9ODoUBgn0ar
         IAwiD3NhrQdRmTrDDWXnLaVpYb0yQdd8E7gB8ZamGjDFKUIDNF5BUatGR2LSHxpckjYH
         u8RR9AWcXaB2roQPYHNrdZ0CMC/yO66wuccJfblN6nV6kmH1M1aA2UFzXywcdO9VmKQZ
         nQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195322; x=1786800122;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li/c4+/312t4GgA151ifIixBtg8Isry/It3D3W9Em4A=;
        b=E2szMzWXUozHOzP0G7E/CHGQtZrUDseO1y311IIj6Yxm0lwYtT3l4RW5ZxmWVWcZBJ
         HMB379ASBBhOFHwzWEXMJaFmzjF/IEXrHVwi2mUXpOMgkmF00rpGSwBg6rsGSDFT2su2
         9DMtKjPTJG429TY9vHtLzYxlPz2WXPuywOj8IjR77tTKdUUgECk5RSDsoRaEAtDLX3Ko
         kgsSMytk6Z60pifxJ4ja2s7KyZLoQ2aYttXzSm1sYNSYi1/NF3n0bXojPhlOoAChLRui
         xcBupC8UcbY8cmHmnuMeqtGuTNUHT8lKgikWW7k1AQQNHe78c/4y4lSeHUPwbupfODfW
         0I4w==
X-Forwarded-Encrypted: i=1; AHgh+Rqdaa/BOYN0TZ1ibFNCgIoO0z4n+0d/1cexkV1bQClD352yCbaPjr5G/KTEn1AxyYBrYrlHtYpFMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAPpZcCeLcy1CoY9lhFQUk6BFXk8BsOcRq1HEfnhWrb73hZfv1
	l4L4DJ/xw7mcbSvC6uBXiV5uTd/EmC3ACIwrJQZxqV5Sug+BLCol+TXU
X-Gm-Gg: AR+sD12wG+zUXhtmGQ2dPEE9988Vst9vQ8GN/kqZtt3NMfruh3xzuxbMt0QVBsrjl6J
	y26TGcIaU/0WU4n3hkIak1qCk4M1tArhjdo7TXGJSKC/RSH5OxmySCUUelRXS/DdOgtVBx3D2t2
	3ZKCV7KfFvH/ZqfTApTOSLUGGYWz8rV9DbqVeeBzpPn7+6WCnjclIf5rFnSGm9QmemCoUVvC4j2
	DD6lDWbT/KEzYo5CHz7JdQE3Q8boqpKPk9caZiHjJ1L0WmnrcedI67LtbJQB7GNVeDz8ouGsrSG
	OHM2on1460GKFC9kod7qT3V9hL7e1PN5R3Yco1JwHjgQlVxtAiQo3BmkwCcO36sVYQKD58f4kW8
	uM1qKBmlLCb84PcLlBGc8RUpHaI5ILPPNXsx29grKqgWtckBaKb+PUZmtAMBkBNxq+Annob9VqJ
	7+cwvJBaV3xxu8+ZJwvXdJg9tVvdl6aWNFpg+aWIg=
X-Received: by 2002:a17:90b:17c5:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3903b9f3ee3mr28104214a91.0.1786195321821;
        Sat, 08 Aug 2026 06:22:01 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b343e662sm2307387a91.2.2026.08.08.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:22:01 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:21:57 +0800
Message-ID: <c73cc405df108dd7c3c5da95a1f8cddc.codykang.hk@gmail.com>
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
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Philipp,

On Mon, 27 Jul 2026 09:35:38 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Add the atomic KMS implementation on top of the hardware backend: one
> > CRTC and one primary plane per DPU instance. atomic_check validates
> > the plane rectangle 1:1 against the mode and sizes the per-channel FBC
> > line buffer; atomic commit builds the cmdlist batches, maps the
> > framebuffer through the DMMU and arms the cfg-ready handshake, with
> > vblank events driven from the DPU interrupt.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/spacemit_crtc.c   | 815 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_planes.c | 376 +++++++++++++
> >  2 files changed, 1191 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> > new file mode 100644
> > index 000000000000..b75ff6320501
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> > @@ -0,0 +1,815 @@
> [...]
> > +/*
> > + * The assert and deassert orders are not mirror images: the hardware wants
> > + * these.
> > + */
> > +static void dpu_reset_assert(struct device *dev, const char *name,
> > +			     struct reset_control *rstc)
> > +{
> > +	int ret = reset_control_assert(rstc);
> > +
> > +	if (ret)
> > +		dev_warn(dev, "failed to assert %s reset: %d\n", name, ret);
> > +}
> > +
> > +static void dpu_reset_deassert(struct device *dev, const char *name,
> > +			       struct reset_control *rstc)
> > +{
> > +	int ret = reset_control_deassert(rstc);
> > +
> > +	if (ret)
> > +		dev_warn(dev, "failed to deassert %s reset: %d\n", name, ret);
> > +}
> > +
> > +static int dpu_pm_suspend(struct device *dev)
> > +{
> > +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
> > +	struct spacemit_crtc *a_crtc = priv->a_crtc;
> > +
> > +	/*
> > +	 * Assert before gating: a reset asserted into an already-gated block
> > +	 * has no clock edges to propagate on and leaves the register file
> > +	 * untouched.
> > +	 */
> > +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> > +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> > +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
>
> It looks like these three are mirrored, and could be handled by
> reset_control_bulk_assert/deassert().

Thanks for the review. Indeed, reset_control_bulk_deassert()
walking the array in reverse gives exactly the mirrored order the
hardware wants. Will fix in v2.

Cody
