Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14F1A0BF1
	for <spacemit@lists.linux.dev>; Sun,  9 Aug 2026 03:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786246002; cv=none; b=SnXnQmqSKuRBXEjvT7rs0qTXnvOqRe+r3pE3Lis7bWz16RkuyfOR/X6LawROny7+DJdSbNLSLGvZnyocN0nt9vzLtDMCm4GaIteGlWzT0PJ2UwAZAiSwdAo/jWIvJT38LBJLP+bhbO0QTFzkUqXR8NQn7+OyGCAiBesIbgl0SJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786246002; c=relaxed/simple;
	bh=PwkRwVu8DgQxChoGdguymS5qtXjGLridD3lojWC38lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF1GpXQKwObg5EE+dNpv5XEC1CbdYdIIQgOs+mAEkhubWvx3mzc1dJ5qw68A1CVeGVPOZPzAiuPplgyDBTM3tyQsTFc+kXQ9YAgUM7XXjOCkd2vvwBj7iJokfncFENfTRM6k6OlPnsuXKe3JtTd4HLuKKRio0saET74oLXOb4RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+YnNtn4; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+YnNtn4"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-38f25802c19so365142a91.1
        for <spacemit@lists.linux.dev>; Sat, 08 Aug 2026 20:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786246001; x=1786850801; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+2ZP2VpD4hdDzBsnG2msnBM+iMSdLsJB7PET2eMgj0=;
        b=q+YnNtn4+ras5gElj+Z40LCJcvUipjmYqsuJFM5xWco25nGjLKtMK2BrpbmI8DD/oP
         A9GvEJIGuIKAM25MZeMSTbUw368njDg0LX6Gxvpp6dAmeq0fEKiB/hQ48FlO8c7yo+fh
         E1Dr5fYCS2Ks/XwGh4uWPchzHzwENFlu5zIdxUVntYGQC3CIejzzf5tb1jTgy9I3En5N
         I3+dA/fiDoBJLiRU+qRW1VsogNMc8x/H0FNmMTTOvUQmhkR/FCgcTBOY68JL17Ny5fSG
         HQunJtgk/ub2jkklsLmr+R9zfJa0BcFWpvWoU0Jj8u8eKnTTURNJu2S+45TLXNq94qLj
         fElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786246001; x=1786850801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+2ZP2VpD4hdDzBsnG2msnBM+iMSdLsJB7PET2eMgj0=;
        b=LF3bAHVrbDOBoRBLI2OBqJTu9K6czH2jhUn8k8CT68qT+f5drlwKZNeQh/c/57e7N3
         yrVPwDk544o1tI7G1ns3sHgtCk7t8SPN/saIy9SWG7OJxHez8ffNu/tzND2dnRbu8NAX
         yI+HF5XHF/wfzfdLua5GHftIzUfArgjahh8rZqPYIIsC7Mjrl8IRM3XT6fMJEa3zMgA5
         Wt2DjK3nV4dxPex8B3sttwn6WfDdqVo89medDyvZxMu1CxjQxfEVhzZPe9kSZ1K4o3e/
         CAwDzg3Qwh7O3vlPxfkDXOyVd03DlbGmpHNlz6QfqnN6EGGOYLdGiOB+9Erfj/HeWlbo
         1QGw==
X-Forwarded-Encrypted: i=1; AHgh+Rqv5OXzBCkyio3YDHkIQ1DBMgPSvSKnsAjLlU08k1+e5xY9/vt9j5zJqv6xws262HB8yoj6JhBajA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUc5O0g1C602I/ICkW2McHorE2BuaZNHMCR+NNJU6y4iyk4L35
	o5lfc2HtaU0XGLI0awMobKDxnhxUw7FgRAqZUh+HymydOHXAWCAJK+Sw
X-Gm-Gg: AR+sD11a2v79zSUFF32cAZigaan6aYXppCXaLeuG9DYDtffB97Q1IUgpAiHJ/i88X7G
	EuUjMlt0NCA1VD8SjKX+4W/+/CkKlKFJ+gJGtofSUV8zld48NlXoEDCcZA6PIHgTtp5iovqUo4R
	sk7spibQzZcJzvgW6UVZq1Ee/+AzntXGWygMgZK5IH4gGN6cN7zZf/i4P8S/05KEMqGh0ygjxwk
	CAqZ4DpoT4ZfQ+0z/+s27C/MpVmRLiRfqISnJo6qC5BovBsAToOnGFiQGKv3pQkIyzhvw3h+Qbc
	x2V0aop1fGLm2jU3SQ6lFzuvC9kzRui6hPQ0S+9NLNyP2dz89FEpsOwOw8nC6lk3/jbGlQdeo2G
	A1m0e/3bSeTNo99u33zMnoQRbYhM8OUuxCC7VCLXcSrPJvj3mPWGkARoGkLHnvfsJH23XE4a8aJ
	3y2kHbJv27bOThLF5YUDiVPJEeV/c4DX0ebA==
X-Received: by 2002:a17:90b:390e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-392823ea541mr9657081a91.16.1786246000598;
        Sat, 08 Aug 2026 20:26:40 -0700 (PDT)
Received: from localhost ([2403:2c80:6::10db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b35ca2b7sm3210539a91.4.2026.08.08.20.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 20:26:40 -0700 (PDT)
Date: Sun, 9 Aug 2026 11:26:35 +0800
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
Message-ID: <ko2cc6jyezfyqzg2rdftyebeydw6nfd65ajvu46acfewhnrqxi@om2uhqdlhmzv>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
 <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>

On Sat, Aug 08, 2026 at 01:03:52AM -0400, Guodong Xu wrote:
> On 2026-07-27 09:35, Philipp Zabel wrote:
> > On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > > From: Cody Kang <codykang.hk@gmail.com>
> > > 
> > > +	/*
> > > +	 * Assert before gating: a reset asserted into an already-gated block
> > > +	 * has no clock edges to propagate on and leaves the register file
> > > +	 * untouched.
> > > +	 */
> > > +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> > > +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> > > +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
> > 
> > It looks like these three are mirrored, and could be handled by
> > reset_control_bulk_assert/deassert().
> > 
> > > +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
> > > +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);
> 
> Is there a reason these two cannot be mirrored in order? Please double
> check. As I checked the vendor tree, the suspend/resume side appear to be
> copy/paste rather than a deliberate ordering.
> 
> Please double-check. Unless I'm missing something, I suggest to bulk them.

Agree, I'll check.

Cody

