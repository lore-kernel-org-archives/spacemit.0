Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093A132103
	for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 00:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246681; cv=none; b=KnCRO6m7vlKlRpFgpYomC+D+yzo5QEAAKU5ha8T+7bGHU63Nztd5sGgBbLZBM9tbJJuExSKkOVgHI5jsSNXsvj0nV2v5H6rwPwEkY9KCaJJyJhi4dTDr/jnB4XGP5VJrrIXrP6rMqCJKxbCH/z+88sUm3MtChPRmSrMZ56RPxjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246681; c=relaxed/simple;
	bh=gTFgNKyrKidNGGxA7hq3GqQc+k2Bkqh/7DU9089x8mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzYIBWN8FiKG/pv9XLofGxKXXNcKubL163BlqE5Gg3VNfB3GhGFEGZCrpCj/oi38j6oIxf5wXKA6j0ZPKGaZgLRItp9OvoDeIokZVcqJowPy/g1LBPBQer8CwCyPW2erIrOG9Ws02Gt9ynnQfKiBCRmfWY55OPEetUp0ow5anzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvALp0NC; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvALp0NC"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5a88b34a6so30953185a.3
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 17:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246678; x=1744851478; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9iTZbextS/6RO2qTODUHsN3tyzaIcsCAslxYIXkL/0=;
        b=PvALp0NCogOL4zuouB8vrLrXTSr0wNp3vuwP6upAtElQNyv+1bHRs/w90zTBxvW2Fl
         KamtjBnT+IyngjN/beGaCE3osGnjrgblj0jrXouNBbdUPbo5p0mX1k0n7LNvNXXivYYk
         kv6vViHu9Q/QQCwO8gCJMGEo4arNm45pdVoscSYfXUUOTmf21y4AOitmoQdiuF/NiEyn
         8HgeoJoH+m7Y7LRiAVgjloeUHX621vcsZkXhjm4xn0PAovMh16S8cjIlfZtfFKmPaelw
         PB2WdkJIArvVT+7xYPTJWqaMlImNK+/WOFaqFN6WqdSzrJaSP283ar2jpkD6lAnpdES+
         OAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246678; x=1744851478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9iTZbextS/6RO2qTODUHsN3tyzaIcsCAslxYIXkL/0=;
        b=DXRyhXdQfi0uToDYhOV4aBFuRR7l//80DxffDv2Hr3HBTv11SBpYjRdfxcpwFRd+vn
         LrXuGWHeuPbASsrAxY30lLM7oPptZ6+2QyiXa2+4ZyBe4W51WsgpBN9o+MH2MkAjBo0o
         kpzzrTmIkEsWxO3UaqVqzJLbVLF1GHvUCxXGR3DdRDbtXjowskc7sRSfvNeRPfbnDik7
         lT7qGMclidr8KZPs5f0+eOXfgxoLKCg9OInnhT0KSxZb9pwBNiXv0yEZkYKYKbcw7n8M
         HaGaRLI5iPMzqiN0RfWCl7yzOvZ/NpQAN8QES186nLhN3sTiukNIechVDetCC1ADCCKj
         DgcA==
X-Forwarded-Encrypted: i=1; AJvYcCXbrzqGDJX0+nzxhX5BHOQ0sJPM+ElZLSyBUU1/wZaR/6v3r21vmpZOKbxNWMrNEwJkDaOgjqrRbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy07Pi5uoQHoMniZ1VKw4vvaNUGGFqXT/kza8Fge0g7VuyrL+Md
	gs8D8NFXRdjIlCZRM9Ks+v5/Wowvikzjw6AUnQ3SJSa2bN0Zgpzr
X-Gm-Gg: ASbGncubR2k1YGYYKdEn2jne7KqyKS+RDjp5hfyBQMlfMghnRfrO2VhtB1grNs6ly1h
	17ywrO8WgslX1gGzkaDa7x6Gr5WfbTkYyBjYDddQF+TMgyxov+h5jCoSztUxDi5/di8l4isR8Jr
	sLI+CXdiIbrRzOddsYPqEHlN+s22E1vl2l40Ypk/bS3hfZm8HR8RZzAMnmAesM09J+qykfo4tdw
	QNy76He4vFlekkMOLBNuOo5i6RrXAWVD4/rCCzGXXjQE24busl3a2AqqF7XEwGlEBB3Cu3TsYrW
	7UZaP82sxgm7ucOR
X-Google-Smtp-Source: AGHT+IHrGSeffXI0VYRSl9GnvlywdVwYqlOpNJ0nBajlzAmynsAYh/0Dr6x3Qk/EjEDEI+gdM/HEVQ==
X-Received: by 2002:a05:620a:430e:b0:7c5:65ab:4ff2 with SMTP id af79cd13be357-7c7a76c3ae3mr127180985a.46.1744246678606;
        Wed, 09 Apr 2025 17:57:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89f9938sm8543585a.69.2025.04.09.17.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:57:58 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:57:20 +0800
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
Message-ID: <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>

On Thu, Apr 10, 2025 at 08:54:51AM +0800, Inochi Amaoto wrote:
> On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> > On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > > The clock tree of K1 SoC contains three main types of clock hardware
> > > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > > 
> > > > All register operations are done through regmap to ensure atomiciy
> > > > between concurrent operations of clock driver and reset,
> > > > power-domain driver that will be introduced in the future.
> > > > 
> > > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > 
> > > I have a few more comments here but I think this is getting very
> > > close to ready.  You addressed pretty much everything I mentioned.
> > > 
> > > > ---
> > > >   drivers/clk/Kconfig               |    1 +
> > > >   drivers/clk/Makefile              |    1 +
> > > >   drivers/clk/spacemit/Kconfig      |   18 +
> > > >   drivers/clk/spacemit/Makefile     |    5 +
> > > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > > >   13 files changed, 2348 insertions(+)
> > > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > > >   create mode 100644 drivers/clk/spacemit/Makefile
> > > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > > 
> > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > index 713573b6c86c..19c1ed280fd7 100644
> > > > --- a/drivers/clk/Kconfig
> > > > +++ b/drivers/clk/Kconfig
> > > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > > >   source "drivers/clk/sifive/Kconfig"
> > > >   source "drivers/clk/socfpga/Kconfig"
> > > >   source "drivers/clk/sophgo/Kconfig"
> > > > +source "drivers/clk/spacemit/Kconfig"
> > > >   source "drivers/clk/sprd/Kconfig"
> > > >   source "drivers/clk/starfive/Kconfig"
> > > >   source "drivers/clk/sunxi/Kconfig"
> > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > index bf4bd45adc3a..42867cd37c33 100644
> > > > --- a/drivers/clk/Makefile
> > > > +++ b/drivers/clk/Makefile
> > > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > > >   obj-y					+= socfpga/
> > > >   obj-y					+= sophgo/
> > > > +obj-y					+= spacemit/
> > > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > > >   obj-y					+= sprd/
> > > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > new file mode 100644
> > > > index 000000000000..4c4df845b3cb
> > > > --- /dev/null
> > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > @@ -0,0 +1,18 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +config SPACEMIT_CCU
> > > > +	tristate "Clock support for SpacemiT SoCs"
> > > 
> > > I don't know the answer to this, but...  Should this be a Boolean
> > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > clock driver built in to the kernel?
> > > 
> > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > without clock built in as it's such critical..
> > 
> 
> I disagree. The kernel is only for spacemit only, and the pinctrl

Sorry for a mistake, this first "only" should be "not".

> should also be a module. It is the builder's right to decide whether
> the driver is builtin or a module. In this view, you should always
> allow the driver to be built as a module if possible.
> 
> Regards,
> Inochi
