Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655793;
	b=UKYLRjJ3+FKJWmW/+MSMbK84XSNq5s6Lu20J7l739VIMOYrw/et0x6rEa6D4Wk1rrYey
	 mE2rjhvW1cQLiGhv+1wfU5kPBi/ss6Z+p4U8m9T5p/5IliBr3aG7WFph1OpMULrhNtEYs
	 Sikz0gc1Kck25dTn1mg7qdXE+Ylqi7Eyeea0a5HwMGqseBz7YHsBzZ2SH3FYMYk77EDCv
	 6H5Yfwf8NPYPLoWJ6bVFa0ZHaHUZKddVb7AskuACdA+D1ZHRE1rcEZs8IHlNNJRKkSzRC
	 pF+a5bpBSweLg2KxxocIe56roNaPNKfKciQfNQc7cOgamPDxdLIF+RQubgvkWY/FKpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
	b=YqhZKSHucs6UykrrBe+tNuZ3jKbVG42f9RkcLCinIzFNHDIoaHPLkKTs+e5kB/vMBG0l
	 Re0I7bCqQlgvygkJfumpXFgYZPZgquSO+FW/NJHUAPhwm7pknL36drayYv0Au+H8mBEfR
	 sdeU0FloPlRSQqg2O5bOoc/ny+NjgJ+KtO6Wvjb+fEfiBAJUBLtPy1ypmvck7QQfHftOl
	 NEHsEL9OV5g3AL/R5SrjzEPPr47aUUHwhupK1ZsCP7A5i3RJUGVKpPT/Q5pDjNVNgBv6e
	 ZKEuprviU1q+yiMkI6xaadQ52j0xiLfo50VVwU2LG3wXYGWRBntyWIDdVWGZ7dafmoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYAK12kc;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83637606A329
	for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 01:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83637606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYAK12kc
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b335ef6441so46880047b3.3
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 17:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655791; x=1796260591; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
        b=yYAK12kcUUPM0P9F5bhbuof3Jlvaq1cbnhaQibkkZaLjeMVRzc7xzOSF4z+nh5iDJN
         oxfy5rUVwv996mSd+F1YpCKjy4FHlKhWG4F6nJ7PwD0Vw4TnO7qYs6fLxkkkfzz6x6ij
         e0fhxV0tOIUUWhnSgcqcx2FAozdCNalwqh/7JGvQ+e5DbKrQpxpDT5VkupY70QBA3nG4
         wpItbDWtD1whpzBSDN3794zMMrsnSTuwP/HdfmfSoF7uwepRtp63BOTh6qmeU11QY50o
         0bb0fpc4BA/D7M6XjHmccWqpSq3SHgG8oaoX90v98b76BDWgLPSj3+Ga+FrGwzfgdKrw
         37gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655791; x=1796260591;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
        b=ectvjjjuloiRywspd1fQx2PkCzKwnCXNAoqKQeyfe+LM8UPAPC3/9+7pcNJ325wvZy
         3R8m/4dJIgUKdhFjQ7Pf0JUZEeuT9shKZD5L1/3lMru/G9ssjWwMtMd6EpNDZFN20D2g
         Ym46XBvFIbSDTMCuo+ICfjyJLHDwkKTuKIC7zyTGeaoBw32ctmv+vxhixe/Shp0Bhxpq
         yizu/mssQtcvnCzbee2ytVBF5CiO0EKZEOiE4Ia0pgk2N3Wfc2GHsGG5Ue9s1mLSNSRm
         E44K66usp3KFDAtxcRBLjyIt4ytSGEUvb6USgOIEt+aS8JVZSHFZ7keI5WOlme7hHBu3
         PnmA==
X-Forwarded-Encrypted: i=1; AL+hErE/fZhAU6eCA6oUiHWOj/2J9qgU4eSCf6htXUXyuYNoQ2RFdMzGEH8XbD2QK+iF8jnqnVV81rMulg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8blXaPLbmfC67iDOOE8+gvnaEebPc/55U4xX0JxVCazjoShNGb
	HP/nxsnQDXm7aLMwVCRdXgJj9m0dhowpIwQvGO9xwGsbY4QIaymnwPSb
X-Gm-Gg: AZFdTZdNbzvLjCOGqfZ2uyhPwlDewOOtf2AZEvDjglXujs71fvmk+zsgk0PGRiWdYz+
	H5wnCTgp0PopJxpUuGRdw1pGZy95KVqUL57XkzjnEf+kTQ682rYNmKYzqYHygQySUth9ix6X5w1
	4vGnzgZwlvdT+Ir3aWmn14rU7gyLDCCVwzTe5z59CYXVAaStPl3sA7S6v5Jo9smBZ4GkGBr1r/N
	2MjlpxZ1q8d6XBYnujQoUMnp3C7cChW9Lz+lgFbM7CbJJYqnIYivomWaoZx78MV51Ot54RRsmeU
	JX64+eSQy93AEJkgJJExuGmXo56ItnMqDuP+JHdiAAkAfy6Tj1GUGk23FUlX3QKKJQ6FG6HY8p0
	Wh1OVqVs0ZKJqELsINkXKtaBkd5EH0UMCJFxWXT1Qn6sFhWQE9ZA7TCdVBWF93rUTuDlAur/P9G
	Scb4Vmv5pRAwbPADzlkjgjflc76487TjMrmy57A9gujMbHaDD8czUqzv1dK0L2BWg1TMN+rUrAc
	cJBQp1eM5NpXZHGLgSVEBAMin1o3H/29rSajj0ADg+u0cw4QCDrM84gSlqTA8L6S7HYQcCUytiL
	5tF71EWgWh7QUEk5ZMtbx3BB
X-Received: by 2002:a05:690c:6a06:b0:8b4:d0ea:ca9d with SMTP id 00721157ae682-8b52045f6c5mr70876907b3.25.1795655791098;
        Wed, 25 Nov 2026 17:16:31 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b575ff89c0sm12140497b3.0.2026.11.25.17.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:16:30 -0800 (PST)
Date: Wed, 25 Nov 2026 20:16:25 -0500
Message-ID: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Cody Kang <codykang.hk@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Cody Kang <codykang@vsit.ai>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP controller
 bridge driver
In-Reply-To: <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
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

Hi Cody,

On Sat, 21 Nov 2026 15:40:51 +0800, Cody Kang via B4 Relay wrote:
[...]
> diff --git a/drivers/gpu/drm/spacemit/Kconfig b/drivers/gpu/drm/spacemit/Kconfig
> index 8326a7b98151a..4667cb624401a 100644
> --- a/drivers/gpu/drm/spacemit/Kconfig
> +++ b/drivers/gpu/drm/spacemit/Kconfig
> @@ -16,3 +16,22 @@ config DRM_SPACEMIT
[...]
> +config SPACEMIT_INNO_DP
> +	tristate "SpacemiT Innosilicon DP/eDP controller support"
[...]
> diff --git a/drivers/gpu/drm/spacemit/Makefile b/drivers/gpu/drm/spacemit/Makefile
> index b3b148000cf7b..260d316a271b5 100644
> --- a/drivers/gpu/drm/spacemit/Makefile
> +++ b/drivers/gpu/drm/spacemit/Makefile
> @@ -9,4 +9,7 @@ spacemit-drm-y := spacemit_drm.o \
>  		  dpu/dpu_saturn_hee.o \
>  		  dpu/saturn_fbcmem.o
>
> +spacemit-inno-dp-y := spacemit_inno_dp.o
> +
>  obj-$(CONFIG_DRM_SPACEMIT) += spacemit-drm.o
> +obj-$(CONFIG_SPACEMIT_INNO_DP) += spacemit-inno-dp.o

I noticed a corner case when testing module unload on v3.
spacemit_inno_dp can be removed while a process still has cardN open
(say Xorg or kmscube is running and somebody does rmmod
spacemit_inno_dp), and the DRM device then still holds references on
the bridge. When that process closes cardN later, the kernel oopses. On
a CoM260-IFX:

	sleep 20 < /dev/dri/card0 &
	rmmod spacemit_inno_dp

  Unable to handle kernel paging request at virtual address ffffffff01ac5188
  Modules linked in: spacemit_drm [...] [last unloaded: spacemit_inno_dp]
  epc : drm_bridge_put.part.0+0x72/0xb6 [drm]
  [...]
  [<ffffffff01b0b142>] drm_bridge_put.part.0+0x72/0xb6 [drm]
  [<ffffffff01b0b19e>] drm_bridge_put+0x18/0x22 [drm]
  [<ffffffff01c41318>] drm_bridge_connector_put_bridges+0x34/0x7a [drm_display_helper]
  [<ffffffff01b23400>] drm_managed_release+0x86/0x116 [drm]
  [<ffffffff01b13cce>] drm_minor_release+0x68/0x80 [drm]
  [<ffffffff01b1ce2a>] drm_release+0xd2/0x102 [drm]
  [<ffffffff802b325c>] __fput+0xa8/0x248

An open cardN pins spacemit-drm only. The last drm_bridge_put() comes
at the final close and reads bridge->funcs, which was in the module
of spacemit_inno_dp that is already gone.

Other DRM drivers with the same structure, rockchipdrm for example,
put the bridge driver and the DRM driver into one module. I think doing
the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
solution.

Luca (added to Cc), is module unload something your bridge hotplug
series [1] is meant to cover?

[1] https://lore.kernel.org/r/20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com

Guodong
