Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810CD7080D
	for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246532; cv=none; b=SuSfiqEvXKJydgU7DXyN4sSgWNPukg0+KHYS7UrSmUUAiiqyBLSMJHpr1lv2U86E5zYW1T4iC11E0hkFTtuVZYQG3MMewMBG70og+5SESxtVM7tMO7zFO2iU/FH6KUjkamstl6TNc2CGZxqnq4r7fZWwF80BEG3Hx0nKlcwL2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246532; c=relaxed/simple;
	bh=OHnJFSDfJoLhxqs6zRdOqEbaAkBnWO045bR+BCPNRRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hkbq3BP4fwU43I3GrRVMs3blKJnBRWwM6NxU1gloXnp5gBU5tNaoSm3/6fddzzwzTX9HYtl/dvEWcG6uvR1idFQBddAS40Ajym0CjnHQv9G/9K6uH0Tz26lQRXZqN38GBnrEPrMMwJuaAa8zeQAc9SklRywmSxPJGH7mfA8hEAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEhcnoGZ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEhcnoGZ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5675dec99so32047485a.0
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 17:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246529; x=1744851329; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwkifruprja03lOjmLEiYD8iUCfTbujfomvweg3q04s=;
        b=MEhcnoGZujWUjTdYuwVDrA6d/fBDAIbIDjivSSUw9ZRkIcT9eRfFRmNMqlbAi87SRc
         7Rrr40NG4ZqNPZDlbljOmyAnKLV+VxUJhjm/rC5gpWbbYKOVBMbAsem3XE1WFSOq5Ex3
         dX+PAsfImhfD9daId09WAu30CEbSrdF7YTkGD0Wxz+oYtMC9cJup0EiMutECDShFbjys
         f7gEpbxHk6C6M0oGLSeYfOu6yxfTAkAhL7qnc/0L2TMBrmFOBi+o/Eg3eLcweez3Bd0U
         otjAqzGQvn6lgvsSqn/szv42MVvKyYwEHHwGSgZ+stfii6eYwVoFbAtk1aAXVX9tMBbK
         /fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246529; x=1744851329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwkifruprja03lOjmLEiYD8iUCfTbujfomvweg3q04s=;
        b=NBezXQYmybL2OcwIq7rLaNW3HvbZ3Uh0okKhNqLANqgoSceZhz0/LgfEld5I03uLLU
         WcBqcxtdUZaypVPEDSu9f2rd6mwbev8tgewuux9FQyPSOA26l5dcYVqL/J0PLx807+j+
         4kTCtSRCpMJuWzgodv+9ePhoog9L0fmuKrICfy327JeZqYtnofcVB27OirQYZoY8GRAc
         Ie1D1JUrlLcP8Q9ML5lsorYDycPIPQECXJ6Ccw4NHzAv5AP7L/Qmq532pRawZj29TRgU
         06tRjqvzGr77CSmzQvKY5+L0xcK0xefGCwvib77Si+PCQb7fgesekp1ydQTf2IvuNXwy
         uC6A==
X-Forwarded-Encrypted: i=1; AJvYcCUXiJM0b1/+kmfCrW5vp+i2gsnX4V4ErCv31QWcT0g2vdC1sxlP4Z+zAxzkMzmIWYQhu1WadTURVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/Ttg7am4lxPC5rC4sGFfW3Ssro5OAg28hBrZXSGN28nwEbFFF
	CNd1VL8MjbCRkkSYv2Aa5PTffPdZuO0RN9KQ9aJsRs89RcYCMRy5
X-Gm-Gg: ASbGncvbzZujlgoM7vZkdSsRPSWGgjVYZt3HmeShZqH0+hBQs/lqHioNUfOlIfkjHth
	11U0O2A9PSREXxfaP2S2EKxIRWtwiuFUOT18JuPJL6ZDJA9x4wckf7HK5niEmyP/Y7zOnah7ZWG
	/xKIP6RbaVnjMXhIGCqx6EdSk7MNZXOjcLtXLj88L+XgldCJFitTvresVdsaFNEWp8tCczodauN
	zfYvWUxPUi0CPoAggjohA4DfRa//rljPRZVlXOhZIpjbsMlIVyIJDG+wa8jEcZVjp46j8cTKeG0
	Wy6mC8uA2qlQ7EMK
X-Google-Smtp-Source: AGHT+IE60U0O3t2g/z0t8CojVDZ5ZM/gRTXCJPIa/XlR1ySwWZ4MEZOecT280WyJJ9QmFd0KPggOIQ==
X-Received: by 2002:a05:620a:4141:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7c7a8164bf9mr74285385a.23.1744246529432;
        Wed, 09 Apr 2025 17:55:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942ec7sm9342585a.18.2025.04.09.17.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:55:29 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:54:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410003756-GYA19359@gentoo>

On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > The clock tree of K1 SoC contains three main types of clock hardware
> > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > 
> > > All register operations are done through regmap to ensure atomiciy
> > > between concurrent operations of clock driver and reset,
> > > power-domain driver that will be introduced in the future.
> > > 
> > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > 
> > I have a few more comments here but I think this is getting very
> > close to ready.  You addressed pretty much everything I mentioned.
> > 
> > > ---
> > >   drivers/clk/Kconfig               |    1 +
> > >   drivers/clk/Makefile              |    1 +
> > >   drivers/clk/spacemit/Kconfig      |   18 +
> > >   drivers/clk/spacemit/Makefile     |    5 +
> > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > >   13 files changed, 2348 insertions(+)
> > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > >   create mode 100644 drivers/clk/spacemit/Makefile
> > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > 
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > index 713573b6c86c..19c1ed280fd7 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > >   source "drivers/clk/sifive/Kconfig"
> > >   source "drivers/clk/socfpga/Kconfig"
> > >   source "drivers/clk/sophgo/Kconfig"
> > > +source "drivers/clk/spacemit/Kconfig"
> > >   source "drivers/clk/sprd/Kconfig"
> > >   source "drivers/clk/starfive/Kconfig"
> > >   source "drivers/clk/sunxi/Kconfig"
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index bf4bd45adc3a..42867cd37c33 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > >   obj-y					+= socfpga/
> > >   obj-y					+= sophgo/
> > > +obj-y					+= spacemit/
> > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > >   obj-y					+= sprd/
> > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > new file mode 100644
> > > index 000000000000..4c4df845b3cb
> > > --- /dev/null
> > > +++ b/drivers/clk/spacemit/Kconfig
> > > @@ -0,0 +1,18 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +config SPACEMIT_CCU
> > > +	tristate "Clock support for SpacemiT SoCs"
> > 
> > I don't know the answer to this, but...  Should this be a Boolean
> > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > clock driver built in to the kernel?
> > 
> I agree to make it a Boolean, we've already made pinctrl driver Boolean
> and pinctrl depend on clk, besides, the SoC is unlikely functional
> without clock built in as it's such critical..
> 

I disagree. The kernel is only for spacemit only, and the pinctrl
should also be a module. It is the builder's right to decide whether
the driver is builtin or a module. In this view, you should always
allow the driver to be built as a module if possible.

Regards,
Inochi
