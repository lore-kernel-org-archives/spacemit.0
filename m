Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DD727FD62
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 06:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545295; cv=none; b=fAhHe1HtsZMIeq/W6Ycjgj1CF0RWj8XC4ZOxc2LBXv+X61zaIViJptRr4CeptsPPQXQKZTZHpG8oLeiWD3IChtcgyJIDaxn/lTkDKoys6bD6VFpUVTVHOyMWpJo3w+OjEvTgGHk9sjNWFv0PIl7syQycdxc1RWtGyKEaXTHDgDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545295; c=relaxed/simple;
	bh=5XT8CJzUJB6nvVvVmvtxIz6ke4BVepzM/qAnFjWabAA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mad+JP2Nn91gJzS6buiJfgDrukqGJKtRO10dOLAxwzRbM71lqnhTJ2XDyiibjym0fhSEG1II1+vdX15ctx5v6t13Pnlmi/HX+UGwVofS/Oy5bC/BUUE1SwYix+BXFPDNpwnD4SMcEOpFq4Z2GfzJbgBX/4NEBvUq3llPJo/AOf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QuQ5dThh; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QuQ5dThh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761545210;
	bh=l3+MYw1gSrGd76gzuuq7j2y+q9z2WnobGN51l903Alg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=QuQ5dThheXeI0UvbraPlrrU59bBZ3xKZvcypL54LpAG0JItBTB8P1QhUNZqhKt+gi
	 uy2hkidR0S7GMXhvf3aJ/er030A4X1d/sU+L4Hzgkg98EWLaoLbwR0+70b4w5rY2px
	 X2clxeg2+WTI0JWmntSGBcIUbPp0uIMRd7EFR4Wc=
X-QQ-mid: zesmtpsz8t1761545207tc173d1ef
X-QQ-Originating-IP: kaW+7dLJIqioSezBmW/uoXxbeOrYpMqkQA962FFA75o=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 14:06:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17316863097272151893
EX-QQ-RecipientCnt: 12
Date: Mon, 27 Oct 2025 14:06:46 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <751AB506001CBF5F+aP8L9hBdTaVEko73@kernel.org>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8KqZ1hlqfQVPii@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP8KqZ1hlqfQVPii@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKzYG8XJzx27j0WWC65akscbY+LZtJglnWV8yCkpERTiSlc6AP1TKEu/
	k3+9fQJd0y5KIcL9UmcRn+IJhBnLkplgVGxaU/Z72cT3+r/j3/1HzKBnVX+L6aJZPBTHKGM
	4h+BzlINtHDE5zVMv0avvivCetlqpnNwFLW7LlYmcbHUOJTfi+dGoghFa2to0P39H/Z4XiZ
	fZw2jULovbnvakmh3wz+g8WOD+I4nJ0Nvnsrjyvyoc36IOG/rYep6y1lbwLerumyDGmV1B/
	xbGjAF/Ljs6IaeupMUeF1nNHatiKfptuuP/xyzOFOYZ747l522H2Vifl+bqlcbEXOnraPw4
	3MIoJS073nt2M1nLza8usjqPgdZgTH3VNm4dKDNv8liyFM5qAou5U5DcAtosrieHm1fwPMd
	xnme1Fx/bSfWrAVeG0Vrrf+aPtMNUOtaLnRkzimRE+16q1Fu/8YNT+1WZDcnUAJyXlEPK8Q
	31Hzut6Gu85ajobu9M8T1sYNJ7rtj6OBtH3co1VQUjhbYnPIGqX0rsy8h1JQZZvMeSYavK7
	kcjdLBVpz4HOk2yDsTGCfvJ/LxSI55qig8+am2SXCtUSeqmBjvF0/otk4XPgKSTFzfvDNPJ
	v8q2hsbd8CwOeZNSz5KoBzDicEMXkWcx2NZGrXQn1bBFPbBrEW++6KmnfwVHwh5A5C6LsRl
	mBfjOifrgDhPxPHuN74KCUZmCWKOlqibnOKqG11cs6yEyMS9ReVfP1hHRNh23frwx39Pbyk
	hZUzNrVzAtcO9n0Mh7Nk5Q0od/E0nkGBuFe76oTOG9pUVjgiTBtERB9VNNgH+WB7hf0mXb1
	rQCTw2lTCbYgWplpGDZaXQVWiMZoUpgtZyw3BYwfHonRc7r7NzIIKlwvPQU0mLwpCruIxuv
	Wx46tgqDnBt3t40FLzkwAhZA0E6ZgvYP8du15co1ony85fw28kca1tgMVvrfFIPAK1Ystt4
	7StzsZ+Kh38Cg6Vxa2YxnvDa/h6WF1x9XwgvupS/14OlVRNJaXE8SdXCld/C+mwG4P6HjkU
	i8m3jj1D2YjKyZRynDgbnUuo2bVvNgdIxeR6mYZog4aLa+aow+PoqqN5A6X7ZvaWrRDsJhp
	c2ik/5JTEXQnyUNnumRTo8=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Mon, Oct 27, 2025 at 07:01:13AM +0100, Aurelien Jarno wrote:
> On 2025-10-27 11:20, Troy Mitchell wrote:
> > On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > > This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> > > chip, which is commonly paired with the SpacemiT K1 SoC.
> > > 
> > > The SpacemiT P1 support is implemented as a MFD driver, so the access is
> > > done directly through the regmap interface. Reboot or poweroff is
> > > triggered by setting a specific bit in a control register, which is
> > > automatically cleared by the hardware afterwards.
> > > 
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > > v2:
> > >  - Replace the "select" by a "depends on"
> > >  - Remove outdated Reviewed-by
> > > 
> > >  drivers/power/reset/Kconfig              |  9 +++
> > >  drivers/power/reset/Makefile             |  1 +
> > >  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
> > >  3 files changed, 98 insertions(+)
> > >  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> > > 
> > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > index 8248895ca9038..61c16f3d5abc7 100644
> > > --- a/drivers/power/reset/Kconfig
> > > +++ b/drivers/power/reset/Kconfig
> > > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > >  	help
> > >  	  Reboot support for the KEYSTONE SoCs.
> > >  
> > > +config POWER_RESET_SPACEMIT_P1
> > > +	tristate "SpacemiT P1 poweroff and reset driver"
> > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +	depends on MFD_SPACEMIT_P1
> > > +	default m
> > default m if ARCH_SPACEMIT?
> 
> As explained here, this is equivalent:
> https://lore.kernel.org/spacemit/CAJM55Z_BzfRo5aKf2VrneTymSizwDQq6OfMK_LNgyoGjp43K8Q@mail.gmail.com/
> 
> But I can make a v5 to change that, if it's the preferred form on the 
> SpacemiT side.
I missed that conversation. Just keep it!
> 
> > Or default ARCH_SPACEMIT?
> > I believe that reboot and shutdown are actually essential functionalities,
> > so it might make more sense: default ARCH_SPACEMIT?
> 
> That was already changed in v3, following a request on v2:
> https://lore.kernel.org/spacemit/CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com/
Thanks for your link.

                        - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 
