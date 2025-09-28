Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F71F0995
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759039687; cv=none; b=qAVxAtR34LHN3WwdlQ6/F5LSOOQjzLHEDxCp47ge0FKagldIJ0fhAJWILbxa6iTtI3+D3vK6LrtFyORSVb5LX88O3RbAFZRr8Yb/SV4WujzM5w4YJHuFN8hOOX7EKCrMahEml4dPxbuuzdKmI7Mz82Ln8+b5SOf/n4H6dxXBYA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759039687; c=relaxed/simple;
	bh=tgKidxJ/DOpm7K+vrUr6kYg0xXA6YbjOr6EMZ34+sUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h07yOWax1w+HgNIeZ7ZtRkXrS4HK11diKBEhXtTujhTsn2zOANrZzmWpudbED/xSWwX21DsSqtjTtshIo2ZyhErHppGQt9MhQFOlD2CLLpB3A1obIZBDMNrA2LtI2soJJdSgDHVvDHNgBMLsD5Ny6TF9ObYv0tmGb7fP77XEXFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=gOz/3bge; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="gOz/3bge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759039625;
	bh=cc31dHKQ97poTSVYFyMonuGh7mgdDdLkybwefE2Gb0Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=gOz/3bgeXJkZNV7fvkGEhCNKhRJhy3LPfbW8IgJ2vbz0LRa9mvUCBrGU0ifW/0oCg
	 8nSYo3vWmu7xHa/8cCyr4/nATHteH1Ttm36RpN/Zlojbv6zwOeDmZKWR5IDBg4Zs4b
	 5yZKRGBdhy6zsacreYlUb30NQ2umOBGoA/SV6feQ=
X-QQ-mid: esmtpsz21t1759039617taf35aede
X-QQ-Originating-IP: 6dN3nUS+saf+Q2aWdR6Kclb8uT4I3Xw3siwEG0sA9V8=
Received: from = ( [14.123.252.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 14:06:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7651757460385003930
EX-QQ-RecipientCnt: 9
Date: Sun, 28 Sep 2025 14:06:55 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <4AE256D88658986A+aNjQf1whw2K1t6JC@kernel.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926111055-GYB1324993@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N+/GyfuFbcLiD9fTcUZPzBRZFFZUEfDHSUu0PCFgb69GACTJ6gtri+Ea
	IMN1JYDDkvZnBIvz0ii4qgr1o8DoWmjluu/2faiKAeBecIpPG3fvGR23JqU62vN9Zr1zVah
	eLLv+8x16OWwQFFm9SW+s6nJMIQNZGQTP6RVqqUtj3i0bzOvBN8+bXe+CNChPttioF+/oOm
	jCbf+sBtfKzeeAeBflYPfc2/14AAqCcQMqJJn9ahueFKcIONJhh8k3iRKvwZH2kiNEjV5p7
	RN53yyJblJShdyxtn0JjOZ4SGvmmF7JxsNQpPNAERhaRMhCeo0Aiyujvlf0bMti2hgmcgCI
	9rcND0c0hE4A0UYIuXm5tb9kU2pesaKOCNXIq8lqLYFLtJw9P+rZ5ECwEvtkfZR6iw/NFRJ
	komCwKBYC0AQqLvu5XtVlvnkhg1I3+DofRKR/2e00H57UujLzX157OeyF0WThDuLC5Xrvs4
	JkFcu2orbZJh1qc9n8jFmlk+/JVqK55Gzb64zBBO21EEPKQTE+8gc/N4MI6U6A6z39LfOZa
	7YhLHOndzLh8Sb4dM7+Zc7ETc5iHkgdhBPsmiu732KRq5i3dXrOWHNx5FHbSBua5f4H8sXq
	BMOZhT8TtPn2PgBhu56ekv3Ghyk/MfqL9QKIzp5wgbjn/UM22zOqOWTUsWGDlu4lL5SgBsV
	ENz+Xluv2O5kKQCFvORWNnzKYvCCgw+Y64jAGG9BMJasutcfiEoRmNVCoFKaleP+kLx2kkK
	2Kd7Fp6KjIaTnixksxsVJcF78cMhEiJerDqm4li21QQu9i5uVTiWQ9mNwlyGfNS8iclmwKR
	wcuswnS5CGKCqJNMyDPpGS2f62Ug1Dgek24EhnVZd7RM6a61caPeHr8aRetcvLJdp7qayqY
	SX247/cBuO8dKp4l6VgH4A9jh9wRnF3YLrjwiZiCgtyyYeLg8anaPsHH6m6MCg+iUvE+/cX
	zQTw7qtUDGwigMB5FfGrE7p9lEMPea3jYbr0FWxigH7tdbOA3HcNqswu0331OrcwblQzxRr
	Ii6EFZY/wXEzIwXoMSIubcTgsXVpW37lJOj8cYj5ly9Mjfuj+m16aShG0V+XI=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Fri, Sep 26, 2025 at 07:10:55PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C with interrupts disabled.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 140 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -97,6 +97,9 @@
> >  
> >  #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
> >  
> > +/* Constants */
> > +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
> > +
> >  enum spacemit_i2c_state {
> >  	SPACEMIT_STATE_IDLE,
> >  	SPACEMIT_STATE_START,
> > @@ -125,6 +128,7 @@ struct spacemit_i2c_dev {
> >  
> >  	enum spacemit_i2c_state state;
> >  	bool read;
> > +	bool is_pio;
> using_pio_mode or simply use_pio, but have to say..
> 
> I feel it's improper to have this flag here, since it's not a controller
> level feature, I understand it was introduced to support aotmic operation
> 
> Personally, I'd suggest to pass the flag in xfer(), then propagate down to
> whatever needed, so it limit to single transmission which more flexible
I no longer agree with moving the flag into xfer.
Keeping it as a global variable is better,
otherwise it would affect several functions:
wait_bus_idle(), start(), init(), handle_write(), handle_read(), etc.

                - Troy
