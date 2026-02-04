Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522A3DF59
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 04:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177760; cv=none; b=mJhvtnLT8Av1F7mJL0p5M+vIUNe2h+eMolRlair6MLRzeCWdEoLLyfACz3E9p57Hv/spN0tHX/hHMf86n/8v+OCvttcRUNfZzCResHmLzil5ms8YA9OLajfvS/yQ2D6LLfWhyYJKVYL4zJtymBv8gItK0HBEr5NUtGm0Q0n4WBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177760; c=relaxed/simple;
	bh=AGkaUKeA48k63GxPvSgLYxDOipDNRk5KS3ygY4PCKG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksXqEDYvi3ryL5kz3M/5bWX08fCP12TUKiVIpfawsB2VusKJ/rCMCyf/BuUYrYvI7kD9/oCqaHY+/CfCxZkJD2rlXTECIzIVUkRitu7K4lml5vbJ34oRk92farBbMlntCAt5ZF1SYR1YAIP6OpR6mUl6cVAWp7ptANhaDuKZxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g23iIv5i; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g23iIv5i"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50334dd44d2so73849241cf.1
        for <spacemit@lists.linux.dev>; Tue, 03 Feb 2026 20:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770177758; x=1770782558; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=;
        b=g23iIv5iBCcOsxsiWOsmA5X8gThxYeBTNqFxn2t3SnpJ308t4tJ6T+mTpXjXg1kBjN
         TQFtaYA0oQyMQLpsQSLcA3wi8urv7FT/WY0dWudxEkEMs07oB7N321vT4LbyPN04SYUy
         eS+b9APT5L1Jl1QC49Vkm13nOIFs+WmWtsG7tpZtPTuy1ChQQPu/iCJ2JgXNEgZ6F0Ij
         Eso3AnaeBU1CsX4XVeNVMeBcoR/YOUPCu87eEcZW2Le/n1mdNB6vMOzDCvOO7UstIqi/
         rmRbi4l8g8aD/siud8IlMjK6gu7AOqnvukaTmH9WfkBsiZYD6IBdef8pKQUTtR4/jwuj
         GcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177758; x=1770782558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCf4lzrMziBndOsmo8GuusOdBN8cx0cDMD3sdQZPXW0=;
        b=MWmT3fkKu3PZJfSuaj9dY233L+e+V86hKluLsNtMA6HlrsKvjk9zfaabM4GOqvNTJk
         G9vWYt1jgOnMCrplKxJgXNfMfVi6IQAKlbwt9ZVcLHJXR13yeWnrEQzLS2m1WKo72MWc
         MKJC7d4bJAYU8mWWXbTjzMzBWBzrohs4kfyiC/ZmTDJ5Dc7hdF1DzGVFedlbt9/PE9A6
         R3TPfaFK6rNeUrxicfJZxr+0jOAnCg42HEZcUs+UpJn7IsArDSRxJ6sEMNFsC4/0VaR+
         YOgbAvRDM4LQiN7rmKMpmSFwNJtn0qVSnBPh3CH6Bgww4JAkcF31Le7QDDH5tEmds7OL
         24HA==
X-Forwarded-Encrypted: i=1; AJvYcCX4+P7FeNRdjfHN0qGrz/WSzi7kMRh3mbWTNNhk6ezcPkU0pEvZXm5rVnQo3ueHX0mQI4g5WlCgMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+A3UvSMDn0r8n8I73Fb4ayk0Yy0189Sx2wLVbRgRkQaBwS/Ui
	TsCJzTHV8DaOhDApYjM4yPfYy4FPevOKknA6WRV621u5imObQVQC6e6f
X-Gm-Gg: AZuq6aIVaViY2qYBLINdjOGKhkl5KCvHm4UdZUDtAsLPeza55ZmTpL0pJ7UUCmiNBVk
	cLAe5WQ8FDHzYhskcPT7o0wWF1yeOip7T5/MkJHyw5I9lZ2hAKPsMgxEmObjloUcgb++jSQi9bu
	+8GDYK1tPVsmHs2Oy5yR61i7uCIxxv+n50HULNwqAp7h2s69DoWCfG1UUxXwE1BIhVbuWzb599a
	P2xbdl2d9Ey19ES3U20F+4nsSZqb4US8Zt/1sq7BDE09bQ7cBsauGN6Q2n2M/Tvu0Oww9XeMmqA
	lv3qnTlDOZmf/SbvQpRohnceMrH2TcZ5+Tlt9SkyOG+XgKF8pxDZP/l2MPcBssfsuwWFTIWoS2C
	3JWcCSTKUViqh6uLBTmYCMFuYGCpGUOf9B2p1ok5eVBAPL3AZdf0CkGUMRckAIS1pD2EzVDxtaQ
	Sjrwx4x5jz7g==
X-Received: by 2002:a05:7301:7003:b0:2b7:32fe:4bbb with SMTP id 5a478bee46e88-2b832895197mr603971eec.11.1770171121283;
        Tue, 03 Feb 2026 18:12:01 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fafc2fsm746589eec.24.2026.02.03.18.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:12:00 -0800 (PST)
Date: Wed, 4 Feb 2026 10:11:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 1/3] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <aYKqh7SmoHO83Avr@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-2-inochiama@gmail.com>
 <aYIyuulFADU_j3V0@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYIyuulFADU_j3V0@shell.armlinux.org.uk>

On Tue, Feb 03, 2026 at 05:39:06PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 30, 2026 at 10:27:02AM +0800, Inochi Amaoto wrote:
> > +  clocks:
> > +    items:
> > +      - description: GMAC main clock
> 
> If you know what this is in terms of dwmac databook clock terms, it
> would be helpful to use it here. I suspect "application clock" would
> probably summarise it, that being the clock for the bus interfaces
> that dwmac provides to the host.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

That's a good point, In fact, I have no dwmac databook now. So if you
think it is fine, I will change this description to the "application
clock". Thanks.

Regards,
Inochi
