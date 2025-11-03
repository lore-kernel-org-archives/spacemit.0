Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA77C2820A9
	for <spacemit@lists.linux.dev>; Mon,  3 Nov 2025 02:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762137914; cv=none; b=bsHbf/WEse5ow4ajtpHIx8oMcQk+Z3fI7yDxaguQqEBQTzzC8/2ffL2V+aIMgiW05O308YegdTM6VOUKHb/wVy2TnjldpnDjWHi78NjWDVYSLZ2n6RQOlUNV/2AuQPSDdKmo3ExRENA1knrxDH83iqH1ZrT5my86prBKuvEgH1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762137914; c=relaxed/simple;
	bh=hEYVR9JNeSamINJK7zjTeE1h6YBcMasRcYIT+ap+X1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGF5B4FXFI6oIvdUNMLrTb7LCZnCj/WuPQHmFjLZ2lC46YnGC35ozjBq4evtUYGo7l4EeW70Glo2AOQDVSaS9TX8L0GVQWTn2rz6JNFnBEgcALj9p3NCwktFBYVUG0Fh0/QAH8HYvJAzaoYbJQSKgszGUda8C4RyIMJCenhBM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=q4JkamuK; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="q4JkamuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762137874;
	bh=EzhqW4LTolUoeFR6p40cCHk6rVnU+KQUnuF+gS36JjM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=q4JkamuKKZTlgKGhfP9hJrv85LD7eIagA4Rl7OwJnkdKsDI7rR6oqEocYmpBq0s/l
	 qgJcIrAlwGmEN3KEG+g/SI/EHjFwiMNrezTPWgse0+Tw+Zkl6k4vZs4zC1/mTQSksF
	 oOKES8Jf12DBEOkxz//ZMVDwNXvvEQ6fx4t4UqP8=
X-QQ-mid: esmtpgz15t1762137867ta3d9be05
X-QQ-Originating-IP: ULHth8tWTgPrwdTvp7p10X6LZ87YT7f4b9dFm0/Sijg=
Received: from = ( [183.48.244.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Nov 2025 10:44:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7644360371679395444
EX-QQ-RecipientCnt: 4
Date: Mon, 3 Nov 2025 10:44:25 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
Message-ID: <D8EC2D64D80DFAFE+aQgXCTbGv9o9t9IS@kernel.org>
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
 <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0

On Mon, Oct 27, 2025 at 09:18:50AM +0800, Troy Mitchell wrote:
> On Sat, Oct 25, 2025 at 07:48:45AM +0000, Michael Opdenacker wrote:
> > Greetings,
> > 
> > On 10/25/25 09:45, michael.opdenacker@rootcommit.com wrote:
> > > From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> [...]
> > > +&i2c2 {
> > > +	pinctrl-0 = <&i2c2_0_cfg>;
> > > +	pinctrl-names = "default";
> > > +	status = "okay";
> > > +};
> > > +
> > > +&i2c8 {
> > > +	pinctrl-0 = <&i2c8_cfg>;
> > > +	pinctrl-names = "default";
> > > +	status = "okay";
> > > +};
> > > +
> > >   &pdma {
> > >   	status = "okay";
> > >   };
> > 
> > 
> > Unfortunately, these changes are not functional yet on OrangePi RV2, testing
> > on https://github.com/spacemit-com/linux/commits/k1/dt-for-next
> > 
> > # i2cdetect -r 2
> > WARNING! This program can confuse your I2C bus, cause data loss and worse!
> > I will probe file /dev/i2c-2 using receive byte commands.
> > I will probe address range 0x08-0x77.
> > Continue? [Y/n]
> >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > 00:        [  124.675321] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11
> > err 0x400000
I recall that the PMIC sometimes reports I2C timeouts.
Could you please confirm if you’re seeing this issue on your side?
If so, does it still occur when using my branch?

Thanks!

                            - Troy
