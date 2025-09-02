Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF41226AF3
	for <spacemit@lists.linux.dev>; Tue,  2 Sep 2025 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756777241; cv=none; b=QqB+U252zMs1isonYdRqEnFdK5hykk5q4cFpULzQbmUdzMBgi+eP0VR/JKpnYG/k76neq65nnKASZolqVQLRY+sp4Y8yMAS5M7I9TXhN/P9zeVf6sStphW6L8pNhLQdvGxI6nn2MzoEcQDSiaN2hCeb/C+i1NTQVP6Rh1WrQoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756777241; c=relaxed/simple;
	bh=7+ZmVvbuSWjNsHKt4aH0z0j5m0PLR7z1c10b2M+RKhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRA5m7Um9XnA0RtQAXvYz3vjirsrnUX8cYi3GCCYUWjGJ9Se1Q1MRloYcOI7ZWYqZiLFGW2S4MDowC9H/3Af7NIVfNNiILE5+UIHWoDj7A9LvX2M/qmbVXMy26Dw7jqDO9QDcwsUTr6+w+FoI6FjP0YV0K7yJo+lCDT5z4T08SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=wyS7bbF/; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="wyS7bbF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756777189;
	bh=Wx6uFFrlOYm1QT1WpGuIUZOo6tC3AIX9NR1xVvEN+A0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=wyS7bbF/5ngMZJsCNh6GJqibAtoDnt+jULiUPL5JUSqh87OfSYXTraJBe6L5Id7uk
	 6xDa/UDwM47trUZizPuSHMI25v0/TexfJanWZfk0Oi1tGzRX6eaRh394Yb8KV/GqYx
	 SXOiPD8cVJLeDC+rwzauYlF0vCAlKtis5ydVqo/c=
X-QQ-mid: zesmtpgz1t1756777182t6b1f51f6
X-QQ-Originating-IP: hnb0EBq5kdR38t0NCC6tWx42nt3/po6TjNAAMjiMEw4=
Received: from = ( [14.123.255.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Sep 2025 09:39:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7662810495034026138
EX-QQ-RecipientCnt: 16
Date: Tue, 2 Sep 2025 09:39:40 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v2 2/2] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <C855339EB347C5D6+aLZK3D678QUDB8hA@LT-Guozexi>
References: <20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com>
 <20250828-k1-i2s-v2-2-09e7b40f002c@linux.spacemit.com>
 <aLAbk_0emidBCJBn@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLAbk_0emidBCJBn@finisterre.sirena.org.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OSUW9vQLVhiZ7WW+uZZjtQFz++ZsfmwhSi2kQzzCdtf93NABFspHbAHe
	Ft+CDeMgys9wMIP1zjKbh/1wu+UQ1azcgeJmIRGwZBZEV+yF3XZTM9eeruaO3jR0yN8HFUw
	RCY28ql0AfzX8Rl9XFD6YtoUuTZQPS5XBEV6nw/wPewmYIrKsUk5Zh5uD4nKQdFFHhnywi5
	Pnsi/S3d7+wNt1qdoJr1vvR2H5GcMfIWKlvlagECO97Pk3w4Y6Hu0jJ3RgTZ2AS7zUlkX2O
	MXpgddJoAl+F7FoI5r+yPLSLNk2xUoPuVaNfGTATkCHeje+2LsQu+KTgZq7q0pDoZdE4BnF
	z3fdBpJdLFtC0WfCXEF367vZs9tbjTH1g5gcPU9gAhPQesH+OqOBf9VB65OtZb1y4H9qQ6v
	PIEAKc0/9j+Mv6yk2amVYgkRmptIjcEuNE9KBeZb98MACzvRPRTC9Lgkk5Za7W9DKuGnTo8
	zCLIfQ3ysSfhN1hfm/1SCnoOWnJSLz1ShDDD1DzwlU0A7HtaLdWtmr9+1a3y9qLEXJ6/LoT
	MF/13eJIbqCqXjyrgW4F1naaORUTD2mPj24exJEBMXEhSuCCuDrW87T/ToKY6OsXugDVezq
	XXMGwRLZanPC/jOwtWzWPvxE1SdPfPo8NHgLRMIisXN/fJnRr6lqcWWwU4jiMcJwmLBuFte
	SmlGqErdzW/GlzTeXTKNyvgmKqsZpq3J9QHgBajeu7RxrRr+lFTGtbi+DfDAXaKpWSB27xm
	8+EZRN9jcgmLj+RDXJfln8fnMzpgTqMoTgreo2LERRMFmCBa0VAYZO6jDFqVyc9WsCVN5lI
	QC6z7kWF79Z111atkP5p9ZlGp5ETDy6pcJZXWWkm6/AcZVOgNbBIGDC5IvHMjN3k6pFLjGs
	sYdpRdZxtJwew8wD4iTxP8lBUZQbfPWVktXrUZW0ZF+g81t81mb8814lGD9gIIaTF3v2OiN
	qViL83Qd6pm8TP9KmwF8br/d0au7s61xY2PzfHUshQJUXH4Yc5F0VALKYJXcBdiizUkBSvs
	s9jEx3BXpnsG8pbD2A011hBLlWcJ3IxlKAjNOXeSJMEvrEj5I4
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Thu, Aug 28, 2025 at 11:04:19AM +0200, Mark Brown wrote:
> On Thu, Aug 28, 2025 at 11:37:33AM +0800, Troy Mitchell wrote:
> 
> > +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> > +	case SND_SOC_DAIFMT_DSP_A:
> > +	case SND_SOC_DAIFMT_DSP_B:
> > +		cpu_dai->driver->playback.channels_min = 1;
> > +		cpu_dai->driver->playback.channels_max = 1;
> 
> > +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_DSP_A)
> > +		sspsp_val |= SSPSP_FSRT;
> 
> It's weird and confusing that this isn't part of the above switch case.
Thanks! I'll change it.
> 
> > +static void spacemit_i2s_remove(struct platform_device *pdev)
> > +{
> > +	/* resources auto-freed by devm_ */
> > +}
> 
> If this can be empty remove it.
Yes, I will remove it in the next version.

Best regards,
Troy

