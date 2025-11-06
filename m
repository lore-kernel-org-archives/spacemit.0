Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFCE823DD
	for <spacemit@lists.linux.dev>; Thu,  6 Nov 2025 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762391144; cv=none; b=KSSHk5MuQ1p3xJ9Kdxg6t/+x8HAHtuwGfHd/kTn7b1yDRcuTbqoF5CXHZlfJslYcQBDeF+bkw4wSlDdwtmdM1abLzi7D9Iz0TIE4fL9yhR9OZ5kHFG/wN34XY3XbyLHFH2eVhozPvyLLBIRFVVPOcHo4xmNbFL+iZtWwCQcqxqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762391144; c=relaxed/simple;
	bh=NXdLgx5++w/rfA9Dm6V03ZycL3uKzY//ob28ovmREGU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3/2/oUYr/XaFooktSms9gxwNBaw1zyklfjK7fzoLGfyZjwxjv3qRjd0MHfD4H9d738fyHSHJf+CX10zReSRN0xGwTmsozqwKoEX0f6N6UPCAv6Jnd9KD1z6xy/QSvSqyUUoxFOuyo5uz8YVQRbIIwXxVee7eJyTi4zxYKIGGoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Mf2rJUv3; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Mf2rJUv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762391050;
	bh=vyp2Kx+dt44hfjvf5608tzCtPl9ysFpd/507p9pCYdE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Mf2rJUv3CtLPscJRcBnWuCaYJKFotilEBq6DKMQGHl949H/R+ht6DqDZiwsEMqU+G
	 GQ8TT/K9EfmDA9QEdUVZfg15wu1lSkx2ni3RRZh8tIjeNBA0Q8S3+aPU1tbGvGI2Sc
	 g8wFOg9rYwoI69jc0eLzNV3DljuXRzG1k8ujEypA=
X-QQ-mid: esmtpsz11t1762391034tcbbad8ae
X-QQ-Originating-IP: l788y3NbUzY9RphsrdxIwMifswNmTWK4vbzwWT5nAzU=
Received: from = ( [183.48.244.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 09:03:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14392221022385016133
EX-QQ-RecipientCnt: 13
Date: Thu, 6 Nov 2025 09:03:52 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <751C70A7BC663B0E+aQvz-ASa-z4fvGiO@kernel.org>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
 <aQvUgQvM48LsSzei@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQvUgQvM48LsSzei@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N349XWt0QhArpi25n9LXj75OyzuFPq2bXspqzSJUucSGydOOODDtmYxK
	hinXGhhyo8Rk99VXKPXY1vsMcMBVHUzmKi9eL+k/UAdkXYya9/jaLFibV3aB5/zYJoxa5Ni
	J7JykzddZK92gsl807/pZ0klJ7SXnVzeBNMmUSMb9XLqZRfy0Lb2i5rLBQEOijVdAomQ8+I
	cwv3EiE4udg8BNFhRD5ofYR6WUoE6JIZ99DbmHumm5exvEbRLQ9mbXdS/bWaRMd+L2zCxdl
	CfuYzvCeJ/3OCoeV9E4pQG0AbiWKgcfOfZBLqqbJsj3Eg9YHlplR4aEbDCfbdNmu93/Lw8W
	O7pVDur8ec41+eV8EwzU1/Sx2bFRSXrTsxHDnpZCseoEas/Gr4CmokfDAc39G/7Z1HpHJOm
	BKotiGyanWszbhWoy4tR1Jva1Kg7Dd77ERvO5G6GLULhwYgvrqJBKZVDkZiWty7Oyacc9j2
	gbHMjBJtd/HlH8HObimQobfQiTCK+4pW0UpSL1VluyoRR/2IJSaWRmZeMTzXr2w/ENhRlRQ
	ZrFjgIQt768S8eX/lWaAnaU+jefXzdcTJmviVHTGIhEZ6dzBb6Br1C7HjUwrBaiP7CCd10P
	WvdcgIVmfvsSsY9TJmciG3D/+5XX2R+Jrb020h4xPATB7wbGjkZ1kPKVgoh6cyYUaLBP6b/
	YmmjvTSRBJ4lKVC71PHfX/tmCYlscBd30QBDrmw9oY2CRdI91S+o/R0yK5rRGnxSubM5Id6
	HN2fnmUuMTgDSQKZSrhCwtGFGUxYPKeu8zryAS5RwwASJP/WGiWsTyWbCLwHbmoFe9k5vw1
	hxDHRN2g4jcX645abv0Jbe6l+b1u9DR9vuR82zGZp6LK52YKKVRBDS2vZNDXyWdEVmjwYzJ
	iX4biutDneqHyRHcjA9RvFFQ+6TjmuaP3MB2aAgNWA0dH20F4eW+Kqvp/8r1sIAwDWMA55B
	6Gcm9QLyHsCpjvG1NHA3LcYtev1fp7gLm2hNRWWjSuIylJPDj5hSMXTckNqq44a0iFfcceb
	DnSbfZ1GwGFP7V8vbIJFnNqCJ6jzfLDpjDMnGbIGC5i8Scxdbo/gSSJ27Sv5LH/JIc+NLz1
	8rBdE7WLwnRl3Pu5X/J46SfaiHsxSJvxIsKORZ5lT7xZe6azEzQyFf+Nt/fP4odH3Wy3LQD
	DM8s
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Wed, Nov 05, 2025 at 11:49:37PM +0100, Aurelien Jarno wrote:
> On 2025-11-05 17:42, Troy Mitchell wrote:
> > On Wed, Nov 05, 2025 at 09:34:21AM +0000, Lee Jones wrote:
> > > On Tue, 04 Nov 2025, Troy Mitchell wrote:
> > > 
> > > > On Mon, Nov 03, 2025 at 01:48:33AM +0100, Sebastian Reichel wrote:
> > > > > 
> > > > > On Mon, 03 Nov 2025 00:01:58 +0100, Aurelien Jarno wrote:
> > > > > > This adds poweroff/reboot support for the SpacemiT P1 PMIC chip, which is
> > > > > > commonly paired with the SpacemiT K1 SoC.
> > > > > > 
> > > > > > Note: For reliable operation, this driver depends on a this patch that adds
> > > > > > atomic transfer support to the SpacemiT I2C controller driver:
> > > > > >   https://lore.kernel.org/spacemit/20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com/
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > dependency is here.
> 
> Oh indeed, I have forgotten about this part.
> 
> > > > > > 
> > > > > > [...]
> > > > > 
> > > > > Applied, thanks!
> > > > > 
> > > > > [1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
> > > > >       commit: 28124cc0fb8c7dc01a6834d227351e25d9a92c58
> > > > Should we apply it now? The dependency patch hasn’t been merged yet...
> > > 
> > > What is the dependency?
> > I point it out above.
> > Without this patch, reboot and shutdown would end up calling the non-atomic i2c_transfer.
> 
> Note however this is not a strong dependency, it is needed to make the 
> reset or power off reliable. Calling non-atomic i2c_transfer lead to a 
> successful reset or power off a bit more than half of the time.
Oh really? I never had success with the non-atomic transfer.

But however, as Lee pointed out, this patch doesn’t need to do
anything special now.
We only needs to ensure that the MFD part won’t be probed.

                          - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 
