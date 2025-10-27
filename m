Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27DC226D14
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561121; cv=none; b=g5kYyc+RhThAd3SZGfCW6taNn9EwDMLn8ylWO85FKoW5FSsyvxDgZOTsdRh0KW9ryL7UHH0M6hs8n4vuhTbGaYRJeOze7n8YL4P59792Cj5bGT66pNt9cL6tNT1j7y9YCkJEAO3QqhQVpGsJVDR/wDRIQoqynyamJWFqABqjE/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561121; c=relaxed/simple;
	bh=iE0Fpaw7tlHv6jebVhsUQPscABYHz4ICSG5izh7O5yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KU7g0pI5Ke1KrvS/LtD4/UAyikcK8mJGfQHWBMQdo9qr0cLvV9q4hcEGoya22XUk0mEyab22GkP8akvH5zJm13DG2e9K2qe4LllHrPrdwvdRL6DV2idMz2jhKQo0iDzGDrM6A+1o1ColpChx1DqdU0AZBS8fwEAZO0e6Pg7Y2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BEF7E341A11;
	Mon, 27 Oct 2025 10:31:58 +0000 (UTC)
Date: Mon, 27 Oct 2025 18:31:47 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Andreas Schwab <schwab@suse.de>, Yao Zi <ziyao@disroot.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <20251027103147-GYA1541054@gentoo.org>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8QHwsYDlbQxQJo@pie>
 <mvmh5vk67in.fsf@suse.de>
 <aP86TltQ2uqeK6FY@pie>
 <CAJM55Z9w0pnFmVjJKJNMs1iqOxoL=YpkBu0L7NuUZ_0ipMtQAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z9w0pnFmVjJKJNMs1iqOxoL=YpkBu0L7NuUZ_0ipMtQAQ@mail.gmail.com>

Hi 

On 03:17 Mon 27 Oct     , Emil Renner Berthing wrote:
> Quoting Yao Zi (2025-10-27 10:24:30)
> > On Mon, Oct 27, 2025 at 10:03:44AM +0100, Andreas Schwab wrote:
> > > On Okt 27 2025, Yao Zi wrote:
> > > > On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
> > > >> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > > >> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > >> > index 8248895ca9038..61c16f3d5abc7 100644
> > > >> > --- a/drivers/power/reset/Kconfig
> > > >> > +++ b/drivers/power/reset/Kconfig
> > > >> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > > >> >          help
> > > >> >            Reboot support for the KEYSTONE SoCs.
> > > >> >
> > > >> > +config POWER_RESET_SPACEMIT_P1
> > > >> > +        tristate "SpacemiT P1 poweroff and reset driver"
> > > >> > +        depends on ARCH_SPACEMIT || COMPILE_TEST
> > > >> > +        depends on MFD_SPACEMIT_P1
> > > >> > +        default m
> > > >> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
> > > >> I believe that reboot and shutdown are actually essential functionalities,
> > > >> so it might make more sense: default ARCH_SPACEMIT?
> > > >
> > > > I don't think there's anything preventing it to be built as module by
> > > > default: even though it's "essential", it's unnecessary during kernel
> > > > and userspace startup, thus I see no reason to build it in the image.
> > >
> > > Wouldn't it be needed in a reboot-on-panic situation?
> >
> > Oops, yeah, I missed this stuff. Seems systemd automatic boot assessment
> > could switch to another boot option if one fails to boot. And if it's
> > caused by a (very early) kernel panic, then reboot support does play a
> > part here.
> 
> But if systemd is running then you've at least got as far as the initramfs,
> and have the module available. So I don't see the problem.
> 
In rare case, if got kernel panic before load this module, then we
should really fix it instead.. Besides, there is no restriction to prevent
user to make this driver as built-in, right?

So I think this isn't really a big problem either
-- 
Yixun Lan (dlan)
