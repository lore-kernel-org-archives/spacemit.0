Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA17C30E82D
	for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 01:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768959490; cv=none; b=nZTv4G9deG3I+wK5qzapdzlR787uKHVODre1jH7/yhI6qcHcS0ZlCMKip3Ko6pRHR2X9kEE8mv7hTC559HxWqhRUNz2t3EVC5EAkgFP4Yqd4Yxl0Um+SeP628ITChALRHWg01+oCVAbYtqNRHOZF+XtLCN0yi5c2f3VSLP1M3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768959490; c=relaxed/simple;
	bh=vWu9HLOleefdsDITsXsJ53ZaMRnGMvdVMKyNUSlnqlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sywjWuhVkDhVj0yoyc+vxr4/FoB/xW5VSAEdGO6jCWdHMDPQl9XhtcBfLmpgpVPfa/+lLa5W/1iEgiwkzYXQw2vN/htvgPrUbExdkawwZcXdIMyAjBqUhz0a/wjEHNUE4RWP59+utcw7u3bZDpRQ1/cZRfbh47tdlmpBDkmRJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOjFZ01V; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOjFZ01V"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ae61424095so5998203eec.1
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 17:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768959484; x=1769564284; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=;
        b=LOjFZ01V+GUqX0I98vYdcB5O0Ecl4M9P9v6jtxtKn7zbPdtwHfJmtyIHdtYXOo7tzU
         fbO/ZX4PANOPw5M0gpYd89q5dDeQ8XnkBSzCG9OHwPOZrCiitZULgM3x18y2STUC/xkM
         oKOkaNw7C+eS6kBnxYnblhNwe8rgRxMRH0DdTpOYN+QFCjWlTCgGCMeyXCA//l24TR5L
         4hFjtGgZ1I3om8gW1F2dMq9j6ok7cZpN79Edv4YgxdhfCsfMmwp7H6TjJfOX+9eZjQaU
         JlPFC5guMZpNyxbCnUB7isVaqHlE2yob4iW9qTW7D34jgKrtHU5259yrTJIUiFLWp/xe
         l9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768959484; x=1769564284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=;
        b=CRzuKvqRUbPEzKrH6u2sJyvsA6NgPIM60TiZSz8JnMYDJki6iLa57O6Yu6S4+s+BJp
         uLsC/wvW7p9Etxjv/dyAB1XXRKeMQfQAjRVImVQb4mpoL9cqQSYbJDbx13d+P0oFam0k
         YMHmyaAp6HJiKrVNi8eTOADgXccd1YnOX2tHf8BealWNOWB8OHmbpBjixA7tdukXgsJI
         qW0F0GigMykTjHnVyjneivVbSBL/iMeVJJ6GjRdoREVhG23zROcmfoXaBDLKCp/Y0+Oe
         e4Ia2Sv7/FCH3Ok2SqIJCmwj8/fgC7ipxMd0pBPBw02HRvqmjEP/hov99qH3I4UfFefY
         w5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCULqhY9XXwwekvG+nJn2Aw40F/i5E5c5qRdEz8XzeHu0K+kWiJWs1RyDmWGExlivH+K5D/vs90Xqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyurOy5cGxVarwYRmeWwuUGrPpLbWyDYlMiGtKC0xaXjPNd2NS
	hwlsaNnZ0RaXs1HtiiPFdjyfmWcMeDq3TH47mGCfAfDBpvfbjE13Nspy
X-Gm-Gg: AZuq6aIz1hjFanQ8xGwl7DD7GqT1Y39dU9+E29v3IxfUNyv+VF1I24DvWdq3JCa2sUN
	vaROwSNG759GqokehH4dBZLoH8F0qXSeSmDiHpF3HbULhkwmXkXjtuusJkClPNWa7yAsV8w69aY
	8geUgCGBmopCB25YkSUgDNb/SBRiEGqBe6RZAcTBW1xKCDufjsH5ebh00nhXXRutln8TW4TOfow
	KFsu0i7aCq46Tx2TkUW7Sa9WJtXjraB1V7JZ7WNCoht1lH3nQctFCSwG0xJuF9SezKOf0PeJsSm
	MriZIqMkAEQGwqQgDWXJ0ORsApg1iTiX1oVK9DNoInBE3ABx7rPdgi9h+QzpZZ/PiSDGoFKf7jW
	pu3QCMCEyuimpI3E0VfCwmsbAZhNuroBbuyC7hOyliBVSwXoEmhtYIbLHI1esaazDVA/CuAApI3
	/aNJaPFDWZBA==
X-Received: by 2002:a05:7301:2b84:b0:2b7:f12:9503 with SMTP id 5a478bee46e88-2b70f1295ccmr1043461eec.30.1768959484158;
        Tue, 20 Jan 2026 17:38:04 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7047b099bsm3361798eec.31.2026.01.20.17.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:38:03 -0800 (PST)
Date: Wed, 21 Jan 2026 09:37:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXAtMZJorEBiK2R-@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
 <aXACRN7BaumIySp3@inochi.infowork>
 <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>

On Wed, Jan 21, 2026 at 02:29:23AM +0100, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 06:36:01AM +0800, Inochi Amaoto wrote:
> > On Tue, Jan 20, 2026 at 02:56:26PM +0100, Andrew Lunn wrote:
> > > > +/* Note: the delay step value is at 0.1ps */
> > > > +static const unsigned int k3_delay_step_10x[4] = {
> > > > +	367, 493, 559, 685
> > > > +};
> > > 
> > > Am i reading it correctly that RGMII delays are limited to these four
> > > values?
> > > 
> > > If so, please add this list to the DT binding.
> > > 
> > 
> > No, these value are just adjustment interval, and it is also
> > controlled by another code register, the final delay is calculated
> > by the following formula:
> > 
> > delay = delay_step * delay_code * 0.9;
> > 
> > So the delay configuration needs to be calculated instead of
> > directly assigned.
> 
> O.K.
> 
> So what is the actual range? Can is do 1000ps? 2000ps? 3000ps? Should
> there be a basic range check to avoid dumb typos?

It can have a pretty big ranges, and I was told the total delay is fine
to work between [1200, 2800]. I guess it is fine for us to check the
upper limit?

Regards,
Inochi
