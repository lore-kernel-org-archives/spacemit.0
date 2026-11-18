Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017028;
	b=HLD6q1LYu8Bo6Q0+8T+v/3VTN3CRQKUoWFkTtapZlZBPKiaMMgoTh5JQtcrCTubofyMS
	 d05Y0stKKjGq9OAR/2QG93KqKkyStL+N7RbiCanO8OoCS1k90HpCj/hUQ2reTrQbTnbG0
	 xhH3GPq3nxV95mdX/5PJKAErtP4ddf4SXkuAK2BO7AFKScp+8952Yt8b8xGLja8BbNL/h
	 Up5vw2+HfrpUa6N4jR7GU6I7hIGaSKjsruMKShOaFD0G7JqesUUV5YB+oyI5Rtp5UYihu
	 OAyeIdCM+8fyl6o0Hh19d20JOGGMc0ckg/rUVH1mW8Dc7a9gfPK8jDAeqSvp0HCHV6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
	b=VyGBZEFKatcvq3lHzvlVApu5mi6l203gIMQsly6ezMlXmr6X3mDSAa9U8KS8aP7MQ9i8
	 4NCuRREN9J2CMl1DfkMlhSb87tMjr24WDouDuZWHxyTTS9S3TK2X/P/naZEi0BQdFrGXW
	 DEr19p/MFh4h9Mm+YuhzbmckPdcSmCYvruOOaQWiJsnCky3KaNGOKHShyjt52WYh1X+Te
	 +U3/pbJhLZtKksYXxp5OA6LLehdi9Qik8SOl3qZJiLrtORCGA0NNHSNrs5KA1FARDtmo8
	 E0oYgIR8tQ43VkryQP+LR2LyRHEjHeeAXt17bSg64N64q2R9G+UYrGAbTOtWDkdQ6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1m9M+Xj;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB3606A32F
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 15:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAB3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1m9M+Xj
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so228982a91.0
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017028; x=1795621828; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=L1m9M+XjnLb0AbI0lDB7AQ1HVkMwyViMklFigzvY1vWVr+LigdR11UQD2jybZwAQV/
         Hbmpgufet45e3PfSzYw/5W7QrCh5CbwsOEBSiIIkrU1S7ox99K2HzS0UABdJNbv6Rkjk
         td4hKOeEddtoBx29D7x/lxt42IQd4cUhlsVR+ZwB1eSrWQjHjj5dcunBROZrZEURhv/8
         CmRxHZsVMd6LroFkn2jgKWxthPwB27E4gQmAEUPEVfa7gsSsEX4aLFLajSpaksqNtx+f
         FpnsEesamVYM4HA76TD32lWuHSO0wsOWF9pwt8jtMN16UPkEABgNFIx+DvUYGZLg4uIE
         Rs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017028; x=1795621828;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=YskUTjeZ1OC6Z2ZHvaXAC84MpeCCjiFfImgd6yTJq4SxSTJVMGpnL8pDtpnpXl8a6h
         d4rzsbxFJeXT2DHNmh6onQQ62IbQJq687doP6Vfny0GRo1wtl7N920173tzhWVeCvdi2
         qNAAHK0u3GTOb7+Rt2SiGbpZHbxgydE5xGwyTyOHXCAvqrFTUXACVp25+lpfQVQrUI8R
         rhnXSBvq49j1jkuRsWjLUvTlfquwytMKqvHb/cID6qmqm/qJSb8HVYc6Nq55CxcduKRB
         j98dNjVcOhTtJs7RvrOs2UVBP4daxN/2OZ9c11PIXk/SBx4bTRyr+I4Nwy4mbD15czuu
         YNGQ==
X-Forwarded-Encrypted: i=1; AL+hErHTgLTLiRn2xYerT63hoNKg8LOo4pSMILjtF32VyjuIwNmdgAEbCpIqP3+ytA9pomuk81axAyZtvg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/5h7Ziu9lK+H9tRH66/HORD0JH3SvR6zr8vTDvsC5HhxkqK1+u
	XPRGzw9h03uhofgRUvBKzr+BRV4NXiNJxEgy4++gS+UgCvIxOI9ik+qG
X-Gm-Gg: AZFdTZemhV3KHixJtaXbAP9Ciaa6MgxZ++YYxjyM5XEUj0cS0CbqP1+ybluC9jMR5rc
	dtJgkfF9zzsE6TrcmScVheKsARN7W6IU/UPlS12Z75tY7vuXfqJweqLfWuzc+x+CdtrAPYf8BZV
	2RmNmLePygQXJOrGwpHNT1R68YjCu6NCMvtL0SsxnRwyOaqykMBvnqczOZStbolOX1oAu/+JzxB
	o609TWesEcuKgnp+QjLiQStSSHBG2HYkhbelVbAdpjeJOPxt+3OuH+lGoKiO26Vu/NM8LIz1wi4
	pkAao3ckazKR7GxS68moxTt7XeAAeBrooZ4wZjsh6Eo2S2l5xLJbYEByUPcE/W9llMB7w6osk/z
	5jn/LibNDILnF9JCjvJNOGAZvPbMLrNlsaUA5+TeQfqHsvcUju6OCZiBaxnaPvoEbm0G7VzcE55
	kvdysrCB2089NBQjSCegalEmK4RawotsqmGsgd+Syo+cdUHalL3dBM0IGmU+X6uI1jRpNNrKdQi
	XKfAKVmSW7F/MU53pqg7hIwd5xFJkIYHoOCAAvcNsFrY5xf5dA6o0+vwq76jK0qFBqTZZW0emr1
	pFY=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b3d07c9ca5mr3201351a91.43.1795017027692;
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534ae0edsm193214a12.21.2026.11.18.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Date: Wed, 18 Nov 2026 23:50:21 +0800
Message-ID: <aee275aa2ebf093d8518e53c5d264064.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
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
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
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

Hi Icenowy,

On Thu, 03 Sep 2026 20:07:32 +0800, Icenowy Zheng wrote:
> 在 2026-08-09日的 21:14 +0800，Cody Kang via B4 Relay写道：
> > From: Cody Kang <codykang.hk@gmail.com>
[...]
> > +	drm->mode_config.min_width = 1;
> > +	drm->mode_config.min_height = 1;
> > +	/* K3 user manual: each DPU scans out at most 3840x2160@60
> > */
> > +	drm->mode_config.max_width = 3840;
> > +	drm->mode_config.max_height = 2160;
>
> This is for the biggest possible framebuffer instead of the possible
> scanout pixel count.
>
> The width here should be based on the maximum allowed pitch of the
> display controller instead of the single-GPU maximum size, otherwise it
> won't be able to drive two 3840x2160 screens in a side-by-side
> configuration because this will create a 7680x2160 framebuffer.

Thanks for the review. Agreed; will fix in v3.

v3 will take max_width/max_height from what the RDMA registers can
address (a 16-bit byte stride and 16-bit image dimensions), and move
the 3840x2160 limit into the CRTC's mode_valid.

Cody
