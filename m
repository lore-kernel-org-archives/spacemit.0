Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CAE1DE3BD
	for <spacemit@lists.linux.dev>; Tue, 18 Mar 2025 05:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742276651; cv=none; b=Jg5u/icjHsQYSYJIj3MwWRTJHpaYDtU3q4USXSoF5JJMGPdTjCALFg9eMiPwGSui+T0RGR0jjorIuxLAmQBanc8vc6WWcbZ0lr6zWghDSBTEVVZMSZ/h4zndMg0bncg9eyelxCyETTEGx4ECC9VqXRApzB0ky1+Cic7LE9q938Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742276651; c=relaxed/simple;
	bh=T8pUQSZ6nXVl1MPwVY3xpS3rfghdPQEDEwopbbkvAfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2gXGyGyKxs+DlTWigfHbJLyRlhqq0k9P93V26V5hFN/9UCMCyp6Fm2jn7BlNua/ucMcNkKbYrfdLNR7bjfGv79AlGsOeJ+bcRLMbRCQnAEgylHTkrJa45KkBvPD/Swyu1TvjgjeI4jlo+0i/uCEDGtr9UDxqheRSI1+SbaaJ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBjN/vSA; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBjN/vSA"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e89a2501a0so51107096d6.1
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276648; x=1742881448; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwFdLf1c7kbfx/fdwSi1PJ2VuLIMc4Zv90ArV+gVLqE=;
        b=KBjN/vSAwxL7uQeKLp7Zyc7tSDpIWidGqeTPWX3c0Srqlxdx+yQN67IlH6UiUznwgg
         FY+l3lASWoJnUgFQN9ClajW7TGnsYg1ZpnhsFiEmMUPZEWvO4PmCwgXCq20S4NDPChg1
         r5NODshUV7jPcRYVQ6+jJ2lwjbTmorgo1btNUouIfRVxhYfwCf5Bm1UTsl7MusGnayAf
         UMeOQciogqqTrQPQoFdddOnlc5wZLymNRev+qLzapryoQa4U12iVOclFw0mcSRgGJwbj
         xYGr0/nqaDmL5fiwxsMioin22OKoynQUnTwf5FSL1UCYoJRexXiUNWyp1j4tXK5bMd6O
         dPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276648; x=1742881448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwFdLf1c7kbfx/fdwSi1PJ2VuLIMc4Zv90ArV+gVLqE=;
        b=FfI8s0QZcq9x2ev9gfZrgVGAFsKO2EVSYz0WZ0Xy5iUZe2WIxazwPTiKnBECmIBYXX
         SGCl8HmFt3VS7/eTYEWP9trMreJai/yRRK66AFoS3UfbYUbm9Q/6bZ3tfIXsboB51InL
         vqE2XCrzwB+E9LCCJgc3N+KpMZU4UnfzEGJgGntj35HGou+D6YzysSbjs2bLipEzklhs
         3OlZKqIfwYGyt14xfaER2Piau47solRGblhLnBmo2OUvnWv6Bibd13Hjm1EJ3muXNIks
         Tr5apBgpJpMGmOD0dKlxuewNkk+HEovaQEFQXe1RnYY15xK2nBNySWMrT1J0M80Nr87G
         iL8w==
X-Forwarded-Encrypted: i=1; AJvYcCV4c8sWIexnKohM1yImT1H7X+bGdEp1ICvDV59Y3gI7UopZAiXt5JdKVRxhfWmWMievWKxLtmaMlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRTpKtFtHexHwBUmcrztunR+13ZKBOyXn7tAlbIeeXCbmDu/qP
	lKMzJhwWSX39V7OhA7wVy6I7yJARveLtm60M5vmfb7jLX+pa2gyS
X-Gm-Gg: ASbGncu6GLvsU44V8lvQGyMh8SBnaRolHArw2HE/Jvi0NbtOvvu0QtL3lfdb+egs5Rf
	9V7kbu3C4pJbBQQqicTkH3KMEuFo+h1C7T1G8UlFyqSm9ClYYpOQSuBs1GACaaqV9qWQWLU77ne
	wyeoCQZgWU+7l/b/3uLjrbmG87c2sO0oZIEypiGkd2xxxHY9D+QflIGXP75oRqsnoduESiG5sCG
	uOarlQ61iT7cIkel2IsfMsBuSgsnvwdOTVXat4h2TqDEq6Hciq4hrqo0hoIvDnsyKXfQeZeSmDE
	gPslWceuuI4Jwpu6GRZzdTvJ48Xfv0Y=
X-Google-Smtp-Source: AGHT+IGuMQhkzUcBs7MzT4DYgtuD7a9Q+hOatvcVV/vkg2Yr9NtbNUqUpAe6FnTc1MisRqrMXkfHwA==
X-Received: by 2002:ad4:5d65:0:b0:6e8:e8dd:30d1 with SMTP id 6a1803df08f44-6eaeaa5fa9amr264171126d6.22.1742276648364;
        Mon, 17 Mar 2025 22:44:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eade231bcbsm63413776d6.36.2025.03.17.22.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:44:07 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:43:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <xwo2jjqy634z4rimgyrbjmxlgzxzauxmqzl57qr5oasph74qwj@7we45fnhwfzh>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <20250318053736-GYA2516@gentoo>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318053736-GYA2516@gentoo>

On Tue, Mar 18, 2025 at 05:37:36AM +0000, Yixun Lan wrote:
> Hi Haylen Chu:
> 
> On 17:57 Thu 06 Mar     , Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and has control registers split into several multifunction
> > devices: APBS (PLLs), MPMU, APBC and APMU.
> > 
> > All register operations are done through regmap to ensure atomiciy
> > between concurrent operations of clock driver and reset,
> > power-domain driver that will be introduced in the future.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  drivers/clk/Kconfig               |    1 +
> >  drivers/clk/Makefile              |    1 +
> >  drivers/clk/spacemit/Kconfig      |   20 +
> >  drivers/clk/spacemit/Makefile     |    5 +
> >  drivers/clk/spacemit/ccu-k1.c     | 1714 +++++++++++++++++++++++++++++
> >  drivers/clk/spacemit/ccu_common.h |   47 +
> >  drivers/clk/spacemit/ccu_ddn.c    |   80 ++
> >  drivers/clk/spacemit/ccu_ddn.h    |   48 +
> >  drivers/clk/spacemit/ccu_mix.c    |  284 +++++
> >  drivers/clk/spacemit/ccu_mix.h    |  246 +++++
> >  drivers/clk/spacemit/ccu_pll.c    |  146 +++
> >  drivers/clk/spacemit/ccu_pll.h    |   76 ++
> >  12 files changed, 2668 insertions(+)
> >  create mode 100644 drivers/clk/spacemit/Kconfig
> >  create mode 100644 drivers/clk/spacemit/Makefile
> >  create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >  create mode 100644 drivers/clk/spacemit/ccu_common.h
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 713573b6c86c..19c1ed280fd7 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> >  source "drivers/clk/sifive/Kconfig"
> >  source "drivers/clk/socfpga/Kconfig"
> >  source "drivers/clk/sophgo/Kconfig"
> > +source "drivers/clk/spacemit/Kconfig"
> >  source "drivers/clk/sprd/Kconfig"
> >  source "drivers/clk/starfive/Kconfig"
> >  source "drivers/clk/sunxi/Kconfig"
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index bf4bd45adc3a..42867cd37c33 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> >  obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> >  obj-y					+= socfpga/
> >  obj-y					+= sophgo/
> > +obj-y					+= spacemit/
> >  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> >  obj-y					+= sprd/
> >  obj-$(CONFIG_ARCH_STI)			+= st/
> > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > new file mode 100644
> > index 000000000000..76090cd85668
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/Kconfig
> > @@ -0,0 +1,20 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config SPACEMIT_CCU
> > +	tristate "Clock support for Spacemit SoCs"
> > +	default y
> similar reason to pinctrl with these patches [1], [2]
> I'd suggest switch to "bool + default ARCH_SPACEMIT" 
> 
> Link: https://lore.kernel.org/all/20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org [1]
> Link: https://lore.kernel.org/all/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be [2]
> 

Clk subsystem prefers no defalt and set it in defconfig,
so should no default there.

Regards,
Inochi
