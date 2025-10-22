Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAF12D7801
	for <spacemit@lists.linux.dev>; Wed, 22 Oct 2025 04:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108092; cv=none; b=ZElzafxh0W4AVVc8bvNZqZERlH5z/WGJ965DGnxNV85o1KBk6vg/BmAhfV3X5UBH2VzaJpaLo1sPFTwTAik7sEgPtQvMq0f5pZc+lPtBfFMEu27yR3m2K2GF6hPjpWNlgl8WSrQCLRL++crBI3MpavD6yqSWK2k07b151IrX0NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108092; c=relaxed/simple;
	bh=Yyh30BqXzoeYf2IPMMqMZWfKBKh76tv5r0WPuHXjxIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwZhqesGq0UPfJj8f+UudTuCLATOpSI0A7wbrJ5Ri6jfEjyCaMYvuXt3K3PjYYVqkSNNFsH1pssoC4DoIi7f8RLo5k4uDpxLVWCBd/33WT2dl4c3kTJvh8U0kFgbYF1OgGllaJRV+EhD6E9f6thzBepCYezWIAGo8Xg9NtMEozM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YX77/iKk; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YX77/iKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761108031;
	bh=JQDFvf5I1dyCH/Y7blrGy1YqVRXPt8LzOkgRdqckuY4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=YX77/iKkMUbuT1N7NzTa6XHHxtoWSTkoTHeAztc/I26FJ7uqhOcSy5zxVUqOi3Irq
	 NMecrlL4UHm8g/NNl99tngs/LnvA/QmZEiT6wf9qRInIFHQ/9noA3fxYuDsBnzcX+Q
	 UbjH+73FoU+kG8b1EO6lUHJfD9Cp24bzGuhcFV1w=
X-QQ-mid: zesmtpgz6t1761108025tcd8e51e8
X-QQ-Originating-IP: K+sLGzXws9S2GyOVegV1iBZp/fosgcrzaZzr8htxs/o=
Received: from = ( [14.123.255.147])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Oct 2025 12:40:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2474559367131974335
EX-QQ-RecipientCnt: 8
Date: Wed, 22 Oct 2025 12:40:23 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mfd: simple-mfd-i2c: remove select I2C_K1
Message-ID: <579629FC3E61E9E6+aPhgN9kIRsEhuGE1@kernel.org>
References: <20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com>
 <965a6f1f-37de-4029-ba16-cfd2de7895ed@riscstar.com>
 <6DB8C5F20B3FAC2E+aPhfoRXlJtJymlB5@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6DB8C5F20B3FAC2E+aPhfoRXlJtJymlB5@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWLpwLZrMWrIXaUnIu+eOoYfTeDIdQXogb9/0HskmIISGz7pfvwOwke3
	GZeLpIMcg2dgA4iKudrnkAbqsnShkI9MyTbiVDgYvY7GcWf+Py9ibsw/KhRsNQbWm99Blh/
	oriize2GCjs4X+UcbRv3Sjxly8fGGssNzFyODC27h5XWOUNy09WVVAaEnTcRpJdnLASenMo
	I//XFmfwDtI431rh7fSsyPCKQULevD6RWJpnK3kJR/DHADf/LvqpLZZIVXTRcqK76iCTzSs
	+nffx8pBThWhaJDnIiuMjx3OfYZD8OeuC2LwdsA6S9yVUenXx/LI2tf9nrigYGywgWg6Gft
	2vd5QFvib6Jnf7/68s18+L20QfW77q7lwX/oanWMHa3GV94K9EcKG4loENINQwwwaer2WLG
	0yq+oO9m4FJAwJRP7eTTDUUZgcPAtIqI29uhQ1O9uvF3PmeCprsI5dkc2NcNbH6X2W7Zuww
	fN3QbbFHUe0dTLquFdieDbDCBoclxm+8yk+TfloT8eqZZD649ZW2bqwRvPnY4uK9vRKiy8Z
	jrq010ewSlyjyw+/VVQ4No76X3Y93dQZWA8SRtSe8v3QpgJYDACi8nZZpKg8TkwWaalLyqA
	1eJdlpS8kQEL/v8ICm2hDRmqmooF2RIzg2IZKHPhT8U3z0CRS7R+Q1bOhVvNcvRjr6N1h9I
	3izQkjgVAikFCeXIXDsMLX8MlOqjkF2YknXCzZzQp2DoMGQHjFTnHtx7VCJEU1mYmeJKxX5
	4ABpBNJ9KWhW0n0km+Pn0owrrd1++3CkLVfZkKyxcKcCdqFJeZEC56SHSFKYE5l+ld4XUam
	WJlOk1stZDa/hX9mTV3BiUHe12LOHhsCFfdmsCGfSoAseWzY3SFbdLh4Qhz3xVAORZgIyFf
	kllAaSECQUgTAApLkPkd5IBXKkUgILf+3zywybWAg8iHZv8MVfR9rChJx+wflaAZxRTuDJ6
	JcYFRpve0ZDF4sXOIL4lSIeLErPUE8bnmfCdRLwwRwLKlrc0xp7rhUbjhp+iCZi+xIp8yIK
	BpaFw84cMPovy4liD/L7E9u28DNFmg3ODw66XSdFUkoNx68XkGu/29kDfIlNu5vADCSIh6g
	w/3YIAXEtASirT+7+R167A=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Wed, Oct 22, 2025 at 12:37:53PM +0800, Troy Mitchell wrote:
> On Tue, Oct 21, 2025 at 11:30:37PM -0500, Alex Elder wrote:
> > On 10/21/25 8:58 PM, Troy Mitchell wrote:
> > > select will force a symbol to a specific value without considering
> > > its dependencies. As a result, the i2c-k1 driver will fail to build
> > > when OF or COMMON_CLK are disabled.
> > 
> > Should config I2C_K1 depend on COMMON_CLK then?
> Yes, this patch [1] registers the ILCR as a clock.
> 
> > 
> > But you're right, the selecting config should ensure the
> > dependencies of the selected one are satisfied.
> And the config REGULATOR_SPACEMIT_P1 select MFD_SPACEMIT_P1(RTC same).
> Should we change it to depends on?
Yixun has suggessted here[1] and I think too.

Link: https://lore.kernel.org/all/20251022004830-GYB1522542@gentoo.org/ [1]
