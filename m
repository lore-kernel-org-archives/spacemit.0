Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4969327204
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 23:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766444628; cv=none; b=M5sBYbgrdn4kj848HErpQsr8NtWxSSS5js9akqQmyNaruCCNh9EfpiVHo6pNyhYnGlV0gNLQu3LJuocLI9qFiVON26jLX4F883H7Pa9pKOz4PZw2zCoRIJdpW2jAdQsCiLvhpaOiQ7JmC5i4wCQ+ZyPHMHPT93oGYVihSEOG6VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766444628; c=relaxed/simple;
	bh=XCvJf6qlu/VMDjkgq3WTt8Db5snQ9tXdoI/+wsdaynA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckR9K3c/gKLo9rGKsvw8LJxjO7LkxqkxpqJhdHOwfAT4vZRfnWg9hwYU9qvZyDC76Xr5+6n5ZM/H12BGNAfW9Q804M9N7I+f9BUyXcSDXtHF0u13WCXJTwUK25MzNNQkAQkSwtEg+PR3xBZEaBZKcLXE3ZcKcnQYSj3ngGtUcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F01CF340FA7;
	Mon, 22 Dec 2025 23:03:42 +0000 (UTC)
Date: Tue, 23 Dec 2025 07:03:38 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] pinctrl: spacemit: k3: add initial pin support
Message-ID: <20251222230338-GYA1980456@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-2-f6f4aea60abf@gentoo.org>
 <74FFF1F2D1BF3EFF+aUjsbTB607IkAY87@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74FFF1F2D1BF3EFF+aUjsbTB607IkAY87@kernel.org>

Hi Troy,

On 14:59 Mon 22 Dec     , Troy Mitchell wrote:
> On Sat, Dec 20, 2025 at 06:14:54PM +0800, Yixun Lan wrote:
> > For the pinctrl IP of SpacemiT's K3 SoC, it has different register offset
> > comparing with previous SoC generation, so introduce a function to do the
> > pin to offset mapping. Also add all the pinctrl data.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/pinctrl/spacemit/Kconfig      |   4 +-
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 354 +++++++++++++++++++++++++++++++++-
> >  2 files changed, 352 insertions(+), 6 deletions(-)
> > 
> [...]
> > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> [...]
> > +static unsigned int spacemit_k3_pin_to_offset(unsigned int pin)
> > +{
> > +	unsigned int offset = pin > 130 ? (pin + 2) : pin;
> Is this necessary? I think it's hard to read. Why not:
> ```
> if (pin > 130)
>   pin += 2;
> 
> return pin << 2;
> ```
> This avoids the extra variable and makes the code clearer.
> > +
> > +	return offset << 2;
No, I do not want to change, it's pretty much a personal taste here,
I did similar as k1_pin_to_offset(), explicitly introduce a variable offset
to let reader know it convert from pin to offsett, which is more readable..

-- 
Yixun Lan (dlan)
