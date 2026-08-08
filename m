Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A880415F2B
	for <spacemit@lists.linux.dev>; Sat,  8 Aug 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194447; cv=none; b=IhoOWGJiAaFLUWRK1K7D8ZZj7LPvuPmZ/WxROpTE3hY65tVPpm/A9nt3iHHuk7cKJ8+eNyXq6dqENDctXz1WmyDg7U9vRHLoLHIpcC7Kj5youBQ/dTUEG5rlm8PCrZXqbSR3/p3Of7zhnS1tk2yKN67/sPN7MoHyvS7m5SBT+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194447; c=relaxed/simple;
	bh=JF1VrshOLJIpCGHfhuBKPN9sL6QGMmedrDFOC/XBzjg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmsxEQV3C68lXIR7QLYO+BR51Hk/0uiUu/3k2MRjzFS5KlUhfavg49wbuhiuVTNXlhMJ2dW0JK8XNA6xB3v9+iwkvdYEUCOWeHpMI4tb75RKI0IFSOfnOBo98yDRMz+FlYqLf1j6qt/xG/CgzWPkxPiTxeJZsiV5EaZFExppsco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3/NuVpJ; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3/NuVpJ"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-39292c67dc6so149789a91.1
        for <spacemit@lists.linux.dev>; Sat, 08 Aug 2026 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786194443; x=1786799243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=izR+Nrw48bEezTRpqIz/ECOoUps8WA+iQCICJD/Q9lE=;
        b=E3/NuVpJFI7TXlndv96KD0ohcUfgnWALjGbg7b5d6w4cmLIooxi9FN6k/UVR6iow6B
         X0dB6ySaqMZywOAnIRc7g1YqtFpigHB1+PevQKmK/QLrnQ0L6btdRFW2DrI9Vpvv932X
         DAcepOmGsyEREGmueHoI2KFM3l8S2OfmzVqs7DDMnqCiuNKmfyxwNq2E3dbUKzREntkj
         ChGQ1fWoRcQK90M1AciSWDhz/LkbfHQR9VyHjne6NPvNPrQZPnV+zC2QM19qXMUDlh4J
         SUngylNLiIXjwsBsQWxiLeml3LjxvnVTYeUjUJdbIQSVk7scRM9yEyUzML66V45PU0CX
         majw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786194443; x=1786799243;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izR+Nrw48bEezTRpqIz/ECOoUps8WA+iQCICJD/Q9lE=;
        b=NxKKzuMYQFuOmq45EQcLMhy15b/jEWi78wxeJVdymWfmThMNGAlEFAi/3zd+c1nTse
         DvHN9DTeDGs9F355tL9Sj9EwZYosG3NHqbabzoCNh1W/GKgBc/pjvv8Mr3LRx2VNmq5V
         7Zg+qzKQG4msJ+vd1WNEWMZbl6X3J2Ew8L8hbsq2uOUCSnSiZsfyDtpgX+iYLBnshj4w
         L7jiSm8La4ma9Ib1AMg+rfyfWA3V39+D+zMq9WcSYfRIn4/U2lwhJEvZLZyoANpdJtkq
         T/O3h3TfjB3NkLbBQlv8hSX/+rnE6Hmljgo+joRpGRczZnq3Cv/U+jiHZotYzZCO5kCi
         GaDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHGpomgxEm/GvsTzDTtxsKIz4XH7j1qVCwD0qpye9KttleMwA14O14LsrMSGSQcweg8hWJbxmRHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZAfW45my/Wh799F5Y0yrkp4nvZ71PYD+l1Y4qvJ68f0Qi9VaI
	R9A9Y/oseZ6BAhm58YUC8+jxkT3wJ+s2Cd1Vrk+ZhCp9laoGHpNkdxU7
X-Gm-Gg: AR+sD13MnHq3AJnBNqLjvFNeNImwpHjndgIwK7cGMJWLnx32NULiuXLsMpP7yuIfD5T
	NAuNMqfkJi0hOEHGwMM7SkJgVMDAmwOecA6rPiHmkXRTFF5g5iBw9quU0RsHr6r9UfIeMMevXk1
	FKrMHeQM+vkWE+AbCUZi1D+FOfDAt8/QLZeruecWQtVeN+LzgDvyAENYsjbluvPzlUEEODGrFsa
	DLbTLk3Tu4l0zH13+x5hPQGZNR/JYUftOGL49LizplyiBbGFQjtzBFFCEfkmKgfocRtUckdtVjv
	HlRPUdexRLHBzxZHNOZWeshgS17yL+dPgMi1VepTYW9VzpF98womsKaUkSMeRg4IOsLq7DAV6iR
	n9fGYVAdHh2SKDS8gx9n9AZhpxVZ58SCETZoeMpP7sQEwzkCKWT9YLpr2BlQqEYxAevr7KRjcRi
	PRTeBAtfBKv5Xbz/87YXL7bHTcGpGx2ojpPo+XhnI=
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr26378580a91.0.1786194443454;
        Sat, 08 Aug 2026 06:07:23 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm6117441a91.2.2026.08.08.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:07:22 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:07:20 +0800
Message-ID: <c8634d5b486e8d9eaa1a46aedb853438.codykang.hk@gmail.com>
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
Subject: Re: [PATCH RESEND 08/17] drm/spacemit: add Saturn DPU core types,
 cmdlist and display MMU
In-Reply-To: <3d4204dbd1c73d50193144d1944d8237c625f6e3.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-8-6de34d80e86c@gmail.com>
 <3d4204dbd1c73d50193144d1944d8237c625f6e3.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 27 Jul 2026 09:35:35 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Register programming of the Saturn DPU is batched: the driver builds
> > per-module register lists in memory and the hardware command-list
> > engine replays them at frame boundaries, while scanout buffers are
> > mapped through the DPU's private address translation unit (DMMU)
> > rather than scanned out by physical address.
> >
> > Add the shared driver types, the MMIO field accessors, the trace
> > events, the command-list builder and the DMMU table code. Some DPU
> > configuration registers are write-only, so a read-modify-write would
> > corrupt neighbouring fields; byte- and halfword-aligned fields are
> > therefore written at their native width instead.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/dpu/dpu_saturn.h   |  35 +++
> >  drivers/gpu/drm/spacemit/dpu/dpu_trace.h    | 350 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_cmdlist.c | 304 ++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_cmdlist.h | 146 ++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_crtc.h    | 259 ++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_dmmu.c    | 103 ++++++++
> >  drivers/gpu/drm/spacemit/spacemit_dmmu.h    |  40 ++++
> >  drivers/gpu/drm/spacemit/spacemit_dpu_reg.h | 108 +++++++++
> >  drivers/gpu/drm/spacemit/spacemit_drm.h     |  68 ++++++
> >  9 files changed, 1413 insertions(+)
> >
> [...]
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_cmdlist.h b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> > new file mode 100644
> > index 000000000000..d5acdbeb3b0e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> > @@ -0,0 +1,146 @@
> [...]
> > +struct spacemit_crtc {
> > +	struct device *dev;
> > +	struct drm_crtc crtc;
> > +	const struct dpu_core_ops *core;
> > +	struct dpu_mmu_tbl mmu_tbl;
> > +	int dev_id;
> > +	int irq_online;
> > +	struct timer_list cfg_rdy_timer;
> > +
> > +	bool is_1st_f;
> > +	bool first_modeset;
> > +	struct dpu_clk_context clk_ctx;
> > +	u32 aclk;
> > +	u32 out_format;
> > +
> > +	struct reset_control *mclk_reset;
> > +	struct reset_control *lcd_reset;
> > +	struct reset_control *esc_reset;
> > +	struct reset_control *aclk_reset;
> > +	struct reset_control *dsc_reset;
>
> Why are these duplicated from spacemit_drm_private?
> dpu_pm_suspend/resume() in patch 10 have access to priv.

You are right, they are plain 1:1 copies. Will drop the five
pointers from struct spacemit_crtc in v2; the reset sequencing in
spacemit_crtc.c and the suspend/resume paths will take them from
spacemit_drm_private instead.

Thanks for the review.

Cody
