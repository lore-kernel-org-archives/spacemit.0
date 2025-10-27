Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5E1A9FB8
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 01:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761527981; cv=none; b=uWB1avoqkycToJK2PV+kLiikm0nAx8t5Y1nSjNHKjjQ96/vZxgwHSRyQf8VlmOqOem6Jiln2FHR3cZz0+xsS1tb3RFz85Q44XXOD4IiUxHHuPMvL/vgblHf+eBxVTxhikgwLxTeZlDT8vkRDNm46amUiHEgiPtnAonhn6u2TfiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761527981; c=relaxed/simple;
	bh=oEeKSjnSGvkAMwZ7ScxLWldwWxpHMvZKUm71u8WPyrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYugrEJ6fm9jxVAiuVEUh5JiEgBi7M5LCDPl1D75KBe1WUAGZZSF0BUbW4/5ntgIXenlny06eiE12xF0wWxaAIQadSvyMWrObHQPaC/esAOybbcAJ8VBMdYmqUiG+5QHYLAnJ/33t/jv/+ePRepbGP6MpjO/hsJp+VuJ8HZpiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=yBxeUGDG; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="yBxeUGDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761527937;
	bh=FtNZ8zy+l54IpAnURTHO+1r1GOzAAhW69sizKWqnidw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=yBxeUGDGCE2mtPOqUwC/4cbTKgm4hHnawaMB6a3CZ0jAQ0VzmUrqTrA06xrmjOP4e
	 vPcwqWFEMKfJzKtWxrPqOuimjsCPOhK6dlsstt1/PI7YkREb8GzZ1qAFdwZA4yIEcM
	 OHmNmxBm/SkmugjESQLo6UM/G4bHfcgGLDzg8054=
X-QQ-mid: zesmtpsz7t1761527932t8c892f9c
X-QQ-Originating-IP: X46h/Pqk7NaYdaGiCnjlkcYaOwRSoAVzeudXsZlyse8=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 09:18:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4802128976697344578
EX-QQ-RecipientCnt: 4
Date: Mon, 27 Oct 2025 09:18:50 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
Message-ID: <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NYlggeZuI0UG6WA1n9n/zQdNuazZ8e4RdsaS8q0dpYRLKx4kfoFQrXgi
	4ZsCNkujYM6RZwihAcgbR1dsQ2ISg3DGeSOzv5wZMHG50doS1SP3OMb7YVZnnZkuMPIhfaI
	QbYqTgO8RetUgZ11dpRqphRlH47QDS5nhWByhCuO/guT7uCWDWHBPoZshaXCrtIN9pqX45t
	VAzncdmRYYo+yuclf4P9du/ch7KqIq3b/2h0yKZGL45D+9CVDVY9DjQbRFk5dXg5J5UUVmm
	lJTQFQ9RwMes18GgX2ACd9hxetO/XDIqUrcd8XiE3VP0YrteIfg1oXUqKkUQahcj0zK3FmK
	O4yaMeITJHFT8DwhaIt0TtQxSplcN4VZ20GyB2+AIxSyNBK5680FsqS0655mPLvnAsyOuW8
	slEt+NnBVpw54L85ErkN1VU1xJbxLmF364z+eeQeGabRotk2t8NOrFf92wL+GJOfTMH1wlh
	Bn/RfjzVt+uRgEL+VPgSlAE3bSywVkvN9x283pI+g3FOPptJ5gJXbrqaAyUGrJrT/Q/brZr
	TMVmUftQ0J43Imb6PVWxKs/Q7iR/UrisYNJVFOOkQIvyQ/9kLwpDd+lV1xohgiwPKqoTXDA
	wjQm9eLU4mPV8g4UTok3LD8G0lZJo3kP8dQcoEr15544V+gnftQkMlwZ0zP/nZ5loHLZYlF
	r+7+/nX691PHu+B5mHkVPPzlICDYScfV/FumRo1UME1UxlJAAiGcaArvxKGs4UO6Y5c5Re6
	Y9xv8Oq4yqDshq1a9OaUf4htVrQFzlMdhIm/um06s2m3ePdJUBnQaDdBTsnNwAgCKoWyltS
	FyvUFa6neLZXxBu7Ju7q3R1b2d8uEacwWImLF86gxXoGtmSqQt0cKzFg7xdCX+RIYGXaAGZ
	3B+b82BQKUiAY/b6H0n+uBfq2H6PwAf/mvW9aRH4XIs+dxNt4DyF7ByEUQDqVg2ysv0j8eH
	oaSyFiK3qXfH358Aq1lhFzWkk7Z+CpdcddzL9mzvBKMnQ4GZfwX3xE9zDqVE/xNdDOIgV/v
	jrDkW3WeHpAy4ByoAaWPQr4fuybveLbJlhxhg15jh5ofEE1S5O
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Sat, Oct 25, 2025 at 07:48:45AM +0000, Michael Opdenacker wrote:
> Greetings,
> 
> On 10/25/25 09:45, michael.opdenacker@rootcommit.com wrote:
> > From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
[...]
> > +&i2c2 {
> > +	pinctrl-0 = <&i2c2_0_cfg>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&i2c8 {
> > +	pinctrl-0 = <&i2c8_cfg>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> >   &pdma {
> >   	status = "okay";
> >   };
> 
> 
> Unfortunately, these changes are not functional yet on OrangePi RV2, testing
> on https://github.com/spacemit-com/linux/commits/k1/dt-for-next
> 
> # i2cdetect -r 2
> WARNING! This program can confuse your I2C bus, cause data loss and worse!
> I will probe file /dev/i2c-2 using receive byte commands.
> I will probe address range 0x08-0x77.
> Continue? [Y/n]
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:        [  124.675321] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11
> err 0x400000
[...]

>                  -- 09 [  124.686769] i2c-k1 d4012000.i2c: i2c transfer
> I assume the i2c-k1 driver works on BananaPi F3.
No, It doesn't work on BananaPi F3 actually.
> Any clues why the same
> buses don't work OrangePi RV2?
This is a known issue.
I didn’t fix it earlier since it doesn’t affect functionality,
but now that it’s been reported, it’s time to fix it.
I’ll send a patch shortly.

Thanks for reporting this issue.

                - Troy
> Thanks in advance
> Cheers
> Michael.
> 
> -- 
> Michael Opdenacker
> Root Commit
> Yocto Project and OpenEmbedded Training course - Learn by doing:
> https://rootcommit.com/training/yocto/
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
