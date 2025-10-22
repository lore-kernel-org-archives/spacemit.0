Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467C32EA14D
	for <spacemit@lists.linux.dev>; Wed, 22 Oct 2025 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111797; cv=none; b=n4KzXixvncyspRALs9ui3IO6VhuizFTT2UiAEFAPqtF6tMt8gVYFsSZ997UXS/2M4yhQHmJhycubEmtcxrC4mUaNkk8z9WAefIOSuGQh8RgLbDrW4cLxmLKiz1vi+TD8/smZkvORxKr7tLBzTH7C6QhfELTRNg06TxxUXYl82iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111797; c=relaxed/simple;
	bh=Ip7I2oKx+cUmVaYf0SMRJxuVfNJW+zHyD80hJta800c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT7fyzjax83BoB7fEhcL3dH6ukZAGJm5+vroBReaEnyRkjYZAfleJIl5JQ1Qcxs7RWhD1Ny8JfBxNPrynMfKfHXrrDcoFwjigI/4N2TjN5pcH/iqlaKx14l+yamtQVq7upKT9cjb93gW+JIsk0bWtji0ttKL/gpVOf22eadflF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=SegtPXpW; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="SegtPXpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761111727;
	bh=2SLeXGDW3QlALU6I3vpBIG1DJuO1fm4ZApuKV65CGdI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=SegtPXpW51/lDFjLkmbFTKcp8WOg+Kx7zRr4jK74xY2ZuUyMI2ny29fqFCuXaZEY4
	 WG3VS0RsIJRtwqGwGlAzfJwFS+4hZY/i956gnHfKLolNcgXznjHv944yzDf+HKNoGV
	 KsS7gZ1UhJMiBpNiQYT2JDMB+vjh44WMIXOLusUE=
X-QQ-mid: esmtpgz15t1761111725t9381ce62
X-QQ-Originating-IP: 731FWEj5minQ81tpITCfvoBW2wAz+Y/YGXcnH39jcE8=
Received: from = ( [14.123.255.147])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Oct 2025 13:42:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5196498867470666752
EX-QQ-RecipientCnt: 12
Date: Wed, 22 Oct 2025 13:42:04 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <52468F28CD7B50FD+aPhurJD4HTXqIGDT@kernel.org>
References: <20251021201451.1013640-1-aurelien@aurel32.net>
 <20251021201451.1013640-2-aurelien@aurel32.net>
 <20251022004830-GYB1522542@gentoo.org>
 <aPhtd0j6iBpqiGUQ@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPhtd0j6iBpqiGUQ@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MMnP0fEUKo/hJbSJp49IW3C5NyplfbAqiIfyC7CwQgmxbq2O4Zdbxf/U
	35jckEMWxdq+Qiz9BOvquakSb//D2yPPPE9JwWGn7YvhkUtk9iLjXzdoPz/NBEYrqlx33e/
	w0/5ruOSxUuAPLOIklzRwnKWYxN1tettcRFquTglE4qgNeSuc3iC/lgJOtSht9qw3WD1ICc
	yrCjzDmg0vdT3ZAl6j8AfMHIKNS1wURvUez3cRT2DUmEkBAnu86c1jhuka5Aaz4Kg1h8hOy
	50aTG4mM44NfbDzem4idFVqbYw/+XqJtx2Pl3Z4o80XBBeQ/u5fIaWu7PCguzxab1TCVnhp
	C7RNlDbcnZ3cjq3vNBBrZ/GEo9X4Zppj+J3sNs6SXfmPxUXPn5j6xB8YA5ei48kDaIuDqQI
	FgZxUcrKYlHQj43L3CoKoYOaBMmy8NIkCCEsOI5srzPn8/jGREhiuTH1vP3oorzDB6Jzm0S
	KufbcytajThyqgIAz+Irv8x2sUe46bMsmoCuQ3oS4jdwQFwL9xeOkzZsypvBnDEObZcp4Z+
	eS2XnQM5Gs979XWlPNgwbtISpvjiXNz8aAzgvBhE1yQCJoWLaHwo936zUmrDcYOjYPLXObB
	SQ0R1EZgBWsoj6IL6gaMG3/uVOY4yuzd5EzyJNIdyFDQ3K2SO/QlEXs8aWdLa4T6tYa9p3c
	X6JAcJEwNnzuOdzBIv53EdevNOYSwDkHTdrc+vYBCmi2aLetiEi/0B6xdM7dvuZl7ZoegUx
	RtAR0QrcfFKztZMAhrGwyNwrz8B26ZzJpkS3/Q1tKpVMJQlgcyx16L4d2ncBiwRmrbEQcXH
	L2ogU4TLDNkAZ5aUppJC1bfpNem7p4hK6DFBXn8EdXwia8gcEZPoLP+Shz144onMXEHxH0c
	TtXhZso9Vr8Qm6DytyPI/knOx0Ahl8pUMjZsznDsRNa8i2yuIFqZLBK6+cLQPhFKRVgt80Y
	xdDxM0Ru2duJGUWN71kFVBdSYIM8+Mj6QZpbWzI87L7pDRlpL0hi7Ql2zN0OY7hzohsKzeL
	HKCbbTtf2E67Eam/1YEt0/xk7il8x/WL+ybRb3EC229+91CJPDNCZBWdwtBwfDfNHtQbXnk
	sBTQA4UBfIxTcbPGObwBoA=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

> > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > index 8248895ca9038..6577d73edbda4 100644
> > > --- a/drivers/power/reset/Kconfig
> > > +++ b/drivers/power/reset/Kconfig
> > > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > >  	help
> > >  	  Reboot support for the KEYSTONE SoCs.
> > >  
> > > +config POWER_RESET_SPACEMIT_P1
> > > +	tristate "SpacemiT P1 poweroff and reset driver"
> > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > ..
> > > +	select MFD_SPACEMIT_P1
> > I'd suggest to use "depends on" instead of "select", the reason is that
> > using "select" will sometimes ignore the dependency, considering
> > the reset driver here is tightly coupled with P1, so I think it's 
> > reasonable to switch to use "depends on", also refer below link
> > 
> > https://lxr.linux.no/#linux+v6.7.1/Documentation/kbuild/kconfig-language.rst#L144
> > 
> >         select should be used with care. select will force
> >         a symbol to a value without visiting the dependencies.
> >         By abusing select you are able to select a symbol FOO even
> >         if FOO depends on BAR that is not set.
> >         In general use select only for non-visible symbols
> >         (no prompts anywhere) and for symbols with no dependencies.
> >         That will limit the usefulness but on the other hand avoid
> >         the illegal configurations all over.
> 
> Thanks for the pointer, I'll fix that in the next version. I used 
> REGULATOR_SPACEMIT_P1 and RTC_DRV_SPACEMIT_P1 as examples, they'll also 
> need to be fixed.
Yes, I have said here[1].
Do you want to fix that? If you don't have time, I can do it.

> 
> Note also that without the select, a default value has to be added to 
> MFD_SPACEMIT_P1. 
Yes, I will add it in my patch. Thanks.

                  - Troy

Link: https://lore.kernel.org/all/6DB8C5F20B3FAC2E+aPhfoRXlJtJymlB5@kernel.org/ [1]

> otherwise this makes the default values on the 
> regulator, rtc and reboot drivers useless.
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 
