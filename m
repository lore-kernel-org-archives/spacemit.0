Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC5863B9
	for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 03:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256869; cv=none; b=G4KbCwd7BOSHygZ1QEYazskVTNrNkwjQ4wtywcvE0LT2Nj3LoKAXIYkZmmiarWZwrOyOIJ5C6B6bIo7jtpDg5MCeuOr35L7HT6ZOUgS8dJxQlY5VNRrXb0dTxz3bj5ziRze9EQY/jmxMGoj8//oYxLUd6MUc03kSqvxarDJ/dks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256869; c=relaxed/simple;
	bh=8BXdnXUZJhaBm/iK86CU2W0BqVu6Jkde/ochweChcTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KglYvWpNdieDVjBcOB57fPxPRMG4OABN2xAVxjUIU5knGLZb8EDl3dYdlUF8YO/qgNMxlgAJBiKiTJs2w6nsUtj86zZhJQ42bIW1dlMvVdhIFgsCQ7rs4GgqCiqmZlTuAhU2ggCW5VPWk0poydaae6Me0DF+RapXJVepdNGmPsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkxirEyu; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkxirEyu"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c59e7039eeso58093485a.2
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744256867; x=1744861667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl2Sw4bxxEHiJQNxloPaBGado/8eDTdeu7twZOJULCU=;
        b=FkxirEyu82gS8OMFGjHgg2xONx2xg7pQf8NoTVU4IgQhDE2md+GqEiUsy2ri0m4i3v
         /i3Vr2HzW9iMjRIcRkvRRJJ/Ol5tfArK3ygbJgdCF0BWy5rbwb1WtEdGt5NleuMBcjMQ
         QmLSggUPkfoaIfl6gbmVcB1Iy0F0xThn8laZVnNJYjPQEsvo7DVph4nVNejy7PknspKD
         g2BlL4C+dt3jgsfc4eg76dT3kku+k2/MDiMgdWq6OA75EV6LcYNtNnaO6g1MmkTmiNer
         CBXu+7L22sAudffyIoEhKEJN0Qosuia1kG/btT3gGP0pDEH/YYMJlXJbMFoSxQz55vyV
         XAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744256867; x=1744861667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nl2Sw4bxxEHiJQNxloPaBGado/8eDTdeu7twZOJULCU=;
        b=MhsdjHHFh7Up4Ux6FGl9LqiSetHgllZhXwle+T8tKLn5/KEeqQxMARMI7ij8yoYOOt
         qjz7oaci16eGKD+TgpL+s56837Ojayf7uIG2mfv8kP3HY8vKgr9ZKFkhCSiOw+o3nRDh
         +tTY+Tj8H5CxRHs84IB+dIKpKAZqKQNnS88QwDJyvrhsVJ1/L8GO5hrAhsE24XznRYZ0
         I6ZQc0skJh/uQj3HH4FRlWJDw0eJL50gXm7fOLg5bhsPGbE2QVqeKe4du/5SZGmce33+
         9YKD+RsVCwnCB6Nzdyi3AZ5w6H4TkA+NeJEt2FjwCtujZ2gXtiQs13G4s9rHZsukBsv7
         fzsA==
X-Forwarded-Encrypted: i=1; AJvYcCVBOGKvnXBPOtbuH2kLdg+/RRGl6ZvhuCuV3eXa5k8/ppiFW3pqBLhH81CDG3ROlG7DS7tHEKaTuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxE8bVGTkKFHPTHr7DfgS6cnXqpIcZx7mkUkPL1EMRGaqU3yFSr
	YPK8MigJPNLm+xWEyO+EMIpnOIzzaLuYa+NhccD9sPsq9Uvq5ulJ
X-Gm-Gg: ASbGncs4kfmfm1ce+xjdyyIWX+Lx784CeD4z1yM/YnAZiwdNisrk5eLk/J+G94Sl8ld
	5W6dZulwsUsKs1XGG2GCUtMGLPGGjw+hy5aUfm9Elrb0oOWsTYkoHa7G4/XQZMyilETNTwZlwGP
	xXkbWhHvtQzOzq3hfTzBcFzW2oX/Epy8bRInq6at/Z4YeUiUM+pp2Z+0q9xl5E+JAPzgQYqCF/+
	l08e18nJR1Va71xFpKEz8+EgWHe80Pyq/8VgHT7GSlkPddVtwdt8pN4CNc5qAkc9ce70YWwIdpV
	ul+sbpJ+ogRJF7MB
X-Google-Smtp-Source: AGHT+IHFC2Rk9C/yn6FcOPV21K6GfuBdCrrACTPvQR733CaBYV/6ZYW0J+2NXRDP1n9a2LO4HgQDkg==
X-Received: by 2002:a05:620a:2943:b0:7c7:a555:4a11 with SMTP id af79cd13be357-7c7a76c22dcmr202020785a.44.1744256867149;
        Wed, 09 Apr 2025 20:47:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942eecsm27221785a.17.2025.04.09.20.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:47:46 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:47:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410015549-GYA19471@gentoo>

On Thu, Apr 10, 2025 at 01:55:49AM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 09:20 Thu 10 Apr     , Inochi Amaoto wrote:
> > On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
> > > On 4/9/25 7:57 PM, Inochi Amaoto wrote:
> > > > > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..4c4df845b3cb
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > > > > @@ -0,0 +1,18 @@
> > > > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > > > +
> > > > > > > > +config SPACEMIT_CCU
> > > > > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > > > clock driver built in to the kernel?
> > > > > > > 
> > > > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > > > without clock built in as it's such critical..
> > > > > > 
> > > > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > > > Sorry for a mistake, this first "only" should be "not".
> > > 
> > > This is a general problem.  You can't make a bootable
> > > SpacemiT kernel unless you define this as built-in (at
> > > least, that's what Yixun is saying). 
> > 
> > Why not putting the module in the initramfs? I have tested
> > this in quite a lot of boards (Allwinner, rockchip, sophgo,
> > starfive and etc.), all of them work well.
> > 
> it works, but not optimal, why delay clk initialzation at modules load stage?
> IMO, it brings more overhead for using initramfs..
> 
> but there is always tradeoff and bikeshedding..
> 
> > > But we'd really rather *only* build it in to the kernel
> > > for SpacemiT builds. You clearly want to minimize what
> > > must be built in, but what if this is indeed required?
> > > What goes in defconfig?
> > > 
> > 
> > As defconfig is more like for a minimum example system. It
> > is OK to put a y in the defconfig. But for a custom system,
> > you do give a choice for the builder to remove your module
> > in non spacemit system.
> 
> I get your meaning here to remove/disable at run time stage, while
> we do provide compile time option, if don't want spacemit system
> just disable CONFIG_ARCH_SPACEMIT I mentioned, clk/pinctrl will be gone
> 

I think this is not suitable for the most generic case, Especially
for distribution kernel. They prefer to set almost everything as
module, and load necessary module in initramfs, but the thing is as
you said, it is a tradeoff. So I will wait and see whether there
is any new voice for it.

Regards,
Inochi
