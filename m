Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039718;
	b=ON6VM9rGznuL87dkd74RoB43PG8xOvqudvo7ULhhmRcRWNFDR3Mu0NHP6rl9xvofpsST
	 YZrKIyohb//rrkB6J0rLQLc7F8aEiFlJ+2X3FlH2Imw+B0iYBFdfU8bzTDZ8e5tpjSQAb
	 nZkzGQSsv82v6CconEu9/T84WQB92WwEiJvuFPuzqO0VhmIgYvn+S7VHSoMB2VuUnrU8j
	 vzAKqHdJU1K6u/2nVWGaQbKIWH4zmqhtsuiw5bkc0EX1huXoYu+6+Gq/KJS7tnVX8079q
	 WvfMcCPDrx8i40E9+ZdHe0H2aDLwetuk9IpXxTEF4F8XpT6ZTPhHJ5OQXZ3pM7Bv7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=48GpV2tL7XVTAarQnrcMPM8Usr/dY/fptCTJVKAYBQY=;
	b=L/AckyUOJke+S1z509xOyM3lX/LwOoa3/P+lsK2+QuD5QstW/ce29CkvO1+CA+mC6qWs
	 z7uOl8LnfZe+/GH6wQxQevRwoH+F9RKpAu2aKqchB1mo9PVc08rPGhUgEeTwHKiiewvR1
	 wBhtTsLkCU/x+3YCqYyOY9FGBZ6yctYn/8WRFoN/z4Djdrpxx66an7aOh5/8cfem5mwwh
	 Wcze6ctex54JlLAC4Su3kFNYDlYooVMINv2rmJ7Gyc7wJMOA7WyJp7lB6qxf01Y4ycgqF
	 1hxIH6DdKa4XLef68AliaqkgKc22P713wzeYGe1EMqZpZmIO6fq2WZYetJkKuDjSXSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOkFkkKK;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18DD606A325
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 22:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18DD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOkFkkKK
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3f3ac0f88so91096a91.0
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 14:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039717; x=1795644517; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=48GpV2tL7XVTAarQnrcMPM8Usr/dY/fptCTJVKAYBQY=;
        b=uOkFkkKK+S77Fb7hXmvu0W3un48YQn4Yazp38niz+JRVZO83DlV9tmu7WaEVRPNznN
         Z2DG1s6U2/KEFkOLs7NTvnJQ8VW7K+eY8fHOckD/60ES+dAB9cWkRWRW+WWAbf7On+V+
         eS8NZ7RUqwctSfrvr7db2uUbXOjX+y0k8RnECy5Htqn36CMTt4S4/FNSaepDZhLqqutA
         F31nX8zB1BVATdzbuebeQ5G4VCN9VhYCY3T+348P43xS99DZstUYPy1u4Cematrm7Vf/
         Wz3VXbmzEheN0Llk4mEEfc+uHyE3haWaGMmXD+mI2HrfONWVVjpTBzdVAJx1J2sC96OC
         WJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039717; x=1795644517;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48GpV2tL7XVTAarQnrcMPM8Usr/dY/fptCTJVKAYBQY=;
        b=KOPEKnK7C0cvu+THtrsLbuWL6GyifgzNqdTKVQBPEE6teSWt1TZJzf0a1qQJZlX4D/
         n+VGXZQpfkqHjZrPclX+Dkq8Q0HoFXYBqZ8N9KXTuvEhZx/vo0RfAEjwxlXCVgKb0LDk
         gJ5yp6TghPjbPUMsHRiU3Auzj76L9Bq1qObCmrg2yL5hDU7u3uiIVFpf1cWVy9U3fiYz
         xIjFNIEBGsl5WYR4Gu8BDk/juK6Bc7sYFKsS13rgQdA2U8uzP+LhwvebXEGj4N2C0+kr
         Bagn327OTwI7QcvVoSyELEw5yAWc1uN2o+/8G/GwrcUMgvDcAu/rhi6U9Y0w2DOcaA6K
         zwhw==
X-Forwarded-Encrypted: i=1; AL+hErEPSi8/mGdQa/ogNhKq5micoPi/2caU1+IDDH+T/ND/U4CbKn0uzhLMvaOcpFGujfAM+5UiTV2Pqw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+o3nKu1p97NEjiC7B4TWbVp6t5QhDuXxUd8ozNaUapqu+6xt6R
	2fa6WMluGm67R0lmgkvQIjlnnhm3zgsgy8enqiKEyEJo+47LkDd+3hgY
X-Gm-Gg: AZFdTZcxETDa4L6Xa5i2aSAGQn81npwypMGH4rT5FvXJtGufP/GG6EJ83JfdHkD3UEB
	JYRMPGTEsZRZYxSD9OHzHSuva1yJS+0mKS2FhDuvd1N8BSjYpgB/qWPriBCEuk8R8y4UYtMtjvk
	hy2wU+4DLN5aa1/GGi2WEKEFggHkHm+Zi2BLBxhIQVPAWTiooFTrM7sHCqWYGZVG19IlUOADwSW
	YW6PN3f1TioAQs7GZk+/qQINFADpIN98nTpxKyjNM7/uyyzREPuIEJplw+q/+wOj4Z5fut1jbSp
	cYTEW/214UFonPpY0tTgLtxcFtjGPIgMZJXkf6QZw3zY8T4oRUoekVDxe5JvsL/coFkI5EqvlqA
	xwoBPX67+bpG8A+0nHe0PU0cub/aENl9jDmDcSyAAfy7dpYCEORdJN6OmbFFyoyEZpYVdm2Nx9l
	7sZgKctwgZPgW+BP+xTwlpSLz9Yk8iVYjyMcZp1f3KiT+wp0rIKDpTUWdRxKbvX/UYB16kjGLGp
	/51P1luv1b5CWF4fGoZM5kMZ5JQ6aTLOHNHMYccjqE/2xsnGdLMhWb6a5+PsepkR3Rh8SFCyK4m
	YhA=
X-Received: by 2002:a17:90b:2ccf:b0:3b3:cb22:72d0 with SMTP id 98e67ed59e1d1-3b3d07656e8mr4366165a91.29.1795039717105;
        Wed, 18 Nov 2026 14:08:37 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe09df73sm93624a91.9.2026.11.18.14.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:08:35 -0800 (PST)
Date: Thu, 19 Nov 2026 06:08:29 +0800
Message-ID: <aef6553f89eba87f753b048a87e3080e.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <f0b2beb9-d0ad-4870-812a-fef530a964c3@suse.de>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-10-327d7910bf71@gmail.com>
 <f0b2beb9-d0ad-4870-812a-fef530a964c3@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Thomas,

On Mon, 14 Sep 2026 15:58:39 +0200, Thomas Zimmermann wrote:
> Hi,
>
> please find a review below.  I've only mentioned most issues once, they 
> are usually throughout the code. Please fix all instances then.

Thanks for the review. Will fix all instances.

> Am 09.08.26 um 15:14 schrieb Cody Kang via B4 Relay:
[...]
> > +	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> > +		u32 rdma_id = to_spacemit_plane_state(pstate)->rdma_id;
> > +		u32 layer_fbcmem_size =
> > +				to_spacemit_plane_state(pstate)->fbcmem_size;
>
> If you need to check plane state, please do this in the plane's 
> atomic_check. For atomic commits that only change plane state, the 
> CRTC's atomic_check might not run, I think.

Will do; the check moves into the plane's atomic_check.

> It looks like this code allocates memory. This is is something that 
> should be done globally.

It does not allocate memory: it partitions the on-chip line buffer.
With one plane per CRTC nothing is shared between planes, so the
plane's own check is enough.

[...]
> > +	if (!drm_dev_enter(crtc->dev, &idx))
> > +		return;
>
> drm_dev_enter() and drm_dev_exit() protect hardware access. Given hat 
> you have a tracepoint below, you certainly don't want to return here. 
> It's is better to write code like this
>
> atomic_enable() {
>
>    if (drm_dev_enter()) {
>
>        // do HW access
>        drm_dev_exit()
>    }
>
> }
>
> although not many drivers do this.

Will do.

> > +
> > +	trace_spacemit_crtc_atomic_enable(a_crtc->dev_id);
>
> Why is your modesetting code is filled with tracepoints? Most other 
> drivers don't need them. There is debugging infrastructure available in DRM.

Will drop them.

[...]
> > +		ret = reset_control_bulk_assert(ARRAY_SIZE(priv->pipe_resets),
> > +						priv->pipe_resets);
> > +		if (ret)
> > +			dev_warn(a_crtc->dev,
> > +				 "failed to assert resets: %d\n", ret);
> > +		usleep_range(10000, 20000);
> > +		a_crtc->first_modeset = false;
> > +	}
>
> Just no. This code belongs into driver or platform init. It is 
> definitely not for mode setting.

Will do; it moves to probe.

[...]
> > +		usleep_range(10000, 20000);
> > +	}
> > +
> > +	drm_crtc_vblank_on(&a_crtc->crtc);
>
> I'd say you want to enable vblanking after programming the display mode. (?)

Will do.

> > +
> > +	spacemit_crtc_init(a_crtc);
>
> The code is full of these tiny helpers. Please inline them. And please 
> also avoid the callbacks that these tiny helpers invoke.  The DRM 
> interfaces are your abstraction interface. Please don't introduce 
> another one.

Will do.

[...]
> > +	/*
> > +	 * MMIO on a clock-gated DPU stalls the bus, so an in-flight handler
> > +	 * must finish its status reads before dpu_pm_suspend() gates the
> > +	 * clocks.
> > +	 */
> > +	if (a_crtc->irq_online > 0)
> > +		synchronize_irq(a_crtc->irq_online);
>
> This irq is unrelated to vblanking, I presume?

It is the vblank interrupt as well: the one line carries the DPU's
vsync, config-ready and underrun status. The synchronize_irq() is not
about vblank, though. A register read on a clock-gated DPU stalls the
bus, so a handler that is already running has to finish before the
clocks stop. With the move to runtime PM (next point) the call will
sit in the runtime suspend callback, ahead of the clock gating.

> > +	timer_delete_sync(&a_crtc->cfg_rdy_timer);
> > +
> > +	/* Close the ISR's MMIO gate before the clocks actually stop. */
> > +	a_crtc->clocks_on = false;
> > +	dpu_pm_suspend(a_crtc->dev);
>
> This whole DPU PM stuff doesn't seem to belong here.  There's are 
> device-PM ops for controlling power management.  It might happen that 
> compositors disable the CRTC for simple mode setting. This should not 
> suspend the whole device.

Will do; it moves to runtime PM.

> > +	spin_lock_irq(&drm->event_lock);
> > +	if (crtc->state->event) {
> > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +		crtc->state->event = NULL;
> > +	}
> > +	spin_unlock_irq(&drm->event_lock);
>
> You need set up the vblank machinery to send the event on the next 
> vblank irq. See [1] for a simple example.
>
> [1] 
> https://elixir.bootlin.com/linux/v7.2.5/source/drivers/gpu/drm/drm_vblank_helper.c#L51

Will do. The event will be armed from the config-ready interrupt
rather than in atomic_flush, since the next commit must not start
before the hardware has taken the current command lists.

[...]
> > +	trace_spacemit_crtc_atomic_check(a_crtc->dev_id);
>
> Please don't add your own tracepoints.

Will do.

> > +	ret = spacemit_crtc_atomic_check_fbmem(crtc, state);
> > +	if (ret) {
> > +		drm_dbg_kms(crtc->dev,
> > +			    "failed to satisfy fbcmem size for all rdmas\n");
>
> Drivers should only use drm_dbg().  drm_dbg_kms() et al are for DRM core 
> and helpers.

Will do.

[...]
> > +	if (WARN_ON(!crtc->state))
>
> There are helpers like drm_WARN_ON() et al. Please prefer them over 
> WARN_ON() and other non-DRM counterparts.

Will do.

[...]
> > +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +	if (ret) {
> > +		dev_err(dev, "failed to initialize vblank\n");
> > +		goto err_unbind_all;
> > +	}
>
> Better do this after running drm_mode_config_reset().

Will do.

[...]
> > +	/* The programming paths use the raw rectangles, so refuse to clip. */
> > +	if ((state->src.x1 >> 16) != src_x || (state->src.y1 >> 16) != src_y ||
> > +	    (drm_rect_width(&state->src) >> 16) != src_w ||
> > +	    (drm_rect_height(&state->src) >> 16) != src_h ||
> > +	    state->dst.x1 != state->crtc_x || state->dst.y1 != state->crtc_y ||
> > +	    drm_rect_width(&state->dst) != crtc_w ||
> > +	    drm_rect_height(&state->dst) != crtc_h) {
> > +		drm_dbg_kms(plane->dev,
> > +			    "clipped plane rectangles not supported\n");
> > +		return -EINVAL;
> > +	}
>
> What's the matter with this code?
>
> Allocated buffers can be larger than the display mode. If the hardware 
> cannot handle this, it might become a problem in some setups.

It worked around the driver programming the unclipped rectangles.
Will fix.

> > +	/* One-dimensional sources are invalid (only 0x0 = constant fill) */
> > +	if ((src_w == 0) != (src_h == 0)) {
> > +		drm_dbg_kms(plane->dev, "unsupported src_w %d src_h %d\n",
> > +			    src_w, src_h);
> > +		return -EINVAL;
> > +	}
>
> I'm not aware of any driver testing this. The above calculation of 
> state->visible should have detected this case.

Will do.

[...]
> > +		cur_state->mmu_tbl.size =
> > +			((PAGE_ALIGN(fb->obj[0]->size) >> PAGE_SHIFT) +
> > +			 HW_ALIGN_TTB_NUM) * 4;
> > +		cur_state->mmu_tbl.va =
> > +			dma_alloc_coherent(a_crtc->dev, cur_state->mmu_tbl.size,
> > +					   &cur_state->mmu_tbl.pa,
> > +					   GFP_KERNEL | __GFP_ZERO);
> > +		if (!cur_state->mmu_tbl.va)
> > +			return -ENOMEM;
>
> Resource allocation/deallocation like this should better be done in 
> begin_fb_access/end_fb_access when you need them for the commit. 
> User-space compositors might send in a large number of states only for 
> atomic_check'ing. There's no point in allocating actual memory then.

Will move the allocation to prepare_fb.

Cody
