Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7369E1A5BB4
	for <spacemit@lists.linux.dev>; Tue,  4 Nov 2025 01:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762219365; cv=none; b=m/wibECodyQlCs+2sLd/9xFjmRDvVfDe+eTztR7yJzlcnOmuPy8CVxA/BuCJ9CMck4NeAtEcQvGK+EJKD70vCc6AwxVOMZaLJuDt8ZdC46WbSKKSKyQae0nxoGOYuA4vB2dGFBayczDz2/nT8yP9H3uKlFkVoYMdpeuBdgzwp7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762219365; c=relaxed/simple;
	bh=LV83vzeLibskdeCQp5nDjLj0aAIez+oIJYv1K2YV4Pk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ny/TqDqnDo7kUwnWZhheEEr9e4nRrpDWYwWV3bGxASYs5d0xYJRrAaOJfMEBbq6AQoUmCWZvLDhH/cg3SphtLhgczP+mCaIWTTH6MWe1LEP8orT2NzBqOPIP72q97Eh6wqsbet9YqM2rtmr+bWYr0rvgPZb4CNlsTuA6h42grW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=cfgMtV3z; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="cfgMtV3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762219327;
	bh=PzAHLHHFoGCUz6X48qei81ozO59TioTzXVcGf03QZvM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cfgMtV3zz5XrgN2kIzMTkfCNmo0zRK6dTFs2hO0znf/HDoNrgnakuKUzeg5sgSN6M
	 +l2rE6wKVoLMcP+0u01v4sSAOwaSASj+T2RLrA/dl8G4LUv5xcUerUCfbhn3ORJn11
	 swP74QeZlmNSF8iUP1H7Cdc6Y/bBq95JPwXDxwY8=
X-QQ-mid: zesmtpgz8t1762219321tb851fb03
X-QQ-Originating-IP: JztjGiKrit1lX5of7v0LQ4ORFK9KYoWUVAFGXsRMA2E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Nov 2025 09:21:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5613329585161487684
EX-QQ-RecipientCnt: 4
Date: Tue, 4 Nov 2025 09:21:59 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
Message-ID: <DA278404237CBF3D+aQlVN4Hnu9b_Mv5l@kernel.org>
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
 <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
 <D8EC2D64D80DFAFE+aQgXCTbGv9o9t9IS@kernel.org>
 <40d90aa9-4ab2-4d8c-939d-337e63179515@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40d90aa9-4ab2-4d8c-939d-337e63179515@rootcommit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M+niivh25UZIoawQuqISKTkBpFlaH/tTOMChTFqVSxgehp459HubhQjZ
	nbV1M4tNK/vjIdPLJI/6O57Y5eu2d49vE+V2Ge3zJgcysOQwm4X2Y78jPS2OsZEOREebB3a
	r5w4qC5GGBNEN9c89kVsBmHlDA0gV9TgNjfffh+g4oa+D5fEEGfFrhhbCMIGQ0XgVos/+6g
	fNTooheGd5dW3ByfuEi/HfiGzCQ24fWU6hBIM1hO8mRfZCKI8wD94kIGa8ff7k2lwMtHNt3
	jmhv5p6oryjLwFs1rBe0lfnXMewEre/+M7hRsUeIUbOXBIXJj3XORJxbNLN9PF83SqNoH+o
	V2TpKnrAgIjXCSRHGzyyN2yKoZQp+2opx3MA1YHJa4zH6ReLxqpBI9gxZBezV+A8/oTs953
	aN28M1X2bsVeGFZ1SmHVbHNc5Obgp0sBIDtwhOTv2ygzuKFllBt82dhzsI/YRytlBSA1jgo
	RdL75wNyNmQXgI1r8ndMyUVaVj+k3EOY7RFAaHQzvXBGNjytQ+mGvqQB19kiyqfLTGjX+/I
	7/jDREeLELQiFNIfk15g9XMKHAdB9uBkmw7I1MC0KFDOy0SAg1OHQWdqbe+NbC76MPVMVxa
	v3GszvGK+J3g+MCQ0iHDxAaEcvUaLvlkUCcYvUB53t8tJx/jS1qvcUrmq54BWCEBkBa/X4n
	1tKUkO20+dVVz0CIVtiurayFzOkTECdRj9T4dn8d7W2C79rc7XU6amFAgAzx3J3mBb29v2i
	Dnt8C6Y5FVFgknycGiVeEy0qFgjErCutCGmmTduwWoElFeAmkQOHfYQv7ccAHRS2aSVIAHJ
	oOdQTh3FM1t3Txqj8hfoe2Cd0qiGfK9podKK7mkFplpGH/MvuDHGKPm7qJYhhFxIAK4oyPm
	tYX4V+owsRPMbsZPgaP1WrnghdFnxMTfS3sdeguyfT51GUKBskrkXljVBk7zv7UT/r8N1My
	lN8vpzAGw8nMxuWmXw9crBm/2IeYa0arfvTRrtmKswqDQt0VSplgea2E7x+p/LxC6YTaTgV
	hgKNMWTZF1iXUI/wyMT3nM2nb8+HHTeRDofGh3hzoKGd2K72xvq7ikWjVjQhJvAjm49RyXH
	0vlxPpnLoKw
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Mon, Nov 03, 2025 at 08:51:11PM +0000, Michael Opdenacker wrote:
> Hi Troy,
> 
> On 11/3/25 03:44, Troy Mitchell wrote:
> > > > Unfortunately, these changes are not functional yet on OrangePi RV2, testing
> > > > on https://github.com/spacemit-com/linux/commits/k1/dt-for-next
> > > > 
> > > > # i2cdetect -r 2
> > > > WARNING! This program can confuse your I2C bus, cause data loss and worse!
> > > > I will probe file /dev/i2c-2 using receive byte commands.
> > > > I will probe address range 0x08-0x77.
> > > > Continue? [Y/n]
> > > >       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > > > 00:        [  124.675321] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11
> > > > err 0x400000
> > I recall that the PMIC sometimes reports I2C timeouts.
> > Could you please confirm if you’re seeing this issue on your side?
> > If so, does it still occur when using my branch?
> Unfortunately, I can't try at the moment, not having the board this week.
> I'll be able to test again next week-end. 
Thanks!
>
> However, I don't remember having
> it with your changes.
I forgot to put my link.
Here: https://github.com/Troyself/spacemit/tree/k1/fix-i2c-detect

                   - Troy
> Cheers
> Michael.
> -- 
> 
> Michael Opdenacker
> Root Commit
> Embedded Linux Training and Consulting
> https://rootcommit.com
> 
> 
