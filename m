Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B633E9F85
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909203; cv=none; b=eMbpBFW7LiHbwbQ2b8dHQ9XonGy8NCXAXb73YLVE32B2Ku2PadTE6+QKjbTeGnswDzQeVhrX6bxO5hCZq3unfJhdMLKTfEg7YieNY1zYlsEPbFmPTvC4apqt6DPQoiDsWWGLxdPmIDLsbahTfrm2DHmAV7QP5Gp8J4VXneqH5Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909203; c=relaxed/simple;
	bh=jrQhr8hRcob+nmP7FXhfmRMEqhWFIhwmQ2N3yM90I3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YiMD489zW2H0q5l5zKccg+yXcxGjT67FfsEM8bPzabUCWBy7lUGrSPUYzg5DffnnzCo2KLEOMkRDr8QXM8wJcqlQfPTx2vRCSEx5SToQJjQL8OxSs0MixzjlGz8sVi6lZ63WXE4GOCxo1lijFd6XyOSr6/lmnMi7iT8otmjzAy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9737XZT; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9737XZT"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso1356119eec.0
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 03:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909201; x=1769514001; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=;
        b=S9737XZTlfnXNzxA9BOFnwg1vW6fOMe6PsBebInNnA0lWzP1l5rWrHjOzjFqY7t9ha
         ZxZ1p2+O7obg7YVbnKLM7ZWyaw/9RY1yPCklrpyQFtSH0K8SmvkNGQUuX+dPcXDtvvO1
         gXg+YeI8Sno3aju/CpAtrQiSrivsiwh5VIGL7nq6tVgotHw7tbFCox/FWaU1H6Rp8qi5
         WALezxXlpFBc55M64eKpX/kfqo+gkDd0BBmPLg67DxH0+lQOKsL/CUFO1oPBmzzBFMnA
         fw1GAxyl8gsH3V9BdX+7qrIWfhv3bLAiOg/OWVuGlad14NKyC5iuYv2UKXV//+h1nvTN
         gWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909201; x=1769514001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeACF3mv4Ishn0NV7RQhnzhSMHx1UMVLhYGwPqoV7AE=;
        b=Kn89+svUrEm9Suu4SH2BG3uyMh1yiOoKwFGgaDlBcVXikSZe+axDrJGu2wPeMjgunH
         qx/jK+KkPX/8vpF7dlnqS8o4yeI0GpE51bTYh67fFJfMqJfmM2nCGvuclXS59rlG+Yfk
         dHI3X4pBojHoCkvYL60JDyhQE5JEEN5xeug19OPY5r39HNOWBHShVJhv0E1fcz2vm/Yo
         mpWRtEb2//FpbNaeCfk1UEROZo1hb/GkLN1rR5Wk1d56Jw49MyTJoZmgvhn8LjQtvT2Y
         g72N6TKamKNKfKkkrPXnnsndaMOW78PRNLwobcVS6PbqIwVzBwg7y7vOynbQlE9JnJlJ
         EklA==
X-Forwarded-Encrypted: i=1; AJvYcCVuX0QAwVCXeMnkVlkdnp/T2BgRdgv6uRJ/cMZhM4Klg6uKaCD6HNFrvTbGh/saX+U6sTASA8PVkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMvSbUKlcvJIfX3zgiD6PGBCm/5v0c2aqwuTho5upWuM42V4xl
	K2DOB8nrPmOwuK+G07V/kQTSCjPOsxGu3u8VvqdLcffzCRU71vHNfhcC
X-Gm-Gg: AZuq6aJg6vwUd5MHpLzqnUM1xBZw+snM5VVSHIBgrvzBb9d2h29G7kTGgSa6X4sQkbo
	WT5AK2UM9peIOnfktFuBr4Y8EN6IdeUx/bg2rlsU/eOYMTnsEnNTemShsuQzEzKZBKByc22Aqzo
	inLW4wg3HlNEVNUW7FX5q9PA2d4ZX5nS5zBV2EiwhSrjjWwU3ygAN3lGUcuC+kKK0i4jg6O7Cvn
	+2CvC9eBiecFFCpXAn42R+npYqOzwPz+H5gLcqzVOOPFYBIh/y/KLKzRVjcGI9WgZMR8Py0S9b0
	O+EOmo9ZW8BTFNpOhBjS79EFzmMqCv5hXq5LtjHEubc1tXMd6YtBkCqeBq2eXkERaAXncXHvGZW
	8ecWnuiQmzR7mMViJtoEyKB/ltNTIZN0nQxQvmZjIaxUAx2mCiJiNAp1EBMWHG1qN7KV1Ob+U8K
	sH8NyKbLqUtA==
X-Received: by 2002:a05:7300:2315:b0:2ae:5967:db5d with SMTP id 5a478bee46e88-2b6fd746cacmr1048269eec.13.1768909200775;
        Tue, 20 Jan 2026 03:40:00 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6beeb4b9csm17558900eec.30.2026.01.20.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:40:00 -0800 (PST)
Date: Tue, 20 Jan 2026 19:39:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yao Zi <me@ziyao.cc>, Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
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
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit
 K3 dwmac
Message-ID: <aW9ou-lsQQ5dVzqW@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-2-inochiama@gmail.com>
 <aW9fL7r0AM0flALJ@pie>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9fL7r0AM0flALJ@pie>

On Tue, Jan 20, 2026 at 10:55:43AM +0000, Yao Zi wrote:
> On Tue, Jan 20, 2026 at 12:36:06PM +0800, Inochi Amaoto wrote:
> > The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> > MAC (version 5.40a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
> >  .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
> >  2 files changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> ...
> 
> > diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> > new file mode 100644
> > index 000000000000..58dd98f79e8a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> ...
> 
> > +  clocks:
> > +    minItems: 3
> > +    items:
> > +      - description: GMAC main clock
> > +      - description: PTP clock
> > +      - description: TX clock
> > +      - description: PHY clock
> 
> Why does the MAC require "phy" clock? Shouldn't this be handled in PHY
> driver instead, or I get its meaning wrong?
> 

IIRC, the "phy" clock is used to pass the phy from the mac core, I will
double check if it is possible to connect to the phy directly.

> Also, I don't see "phy" clock is acquired anywhere in the driver. Is it
> really necessary for the MAC?
> 

This is a mistake, I remove this by accident, if it is necessary, I
will add this in the next version.

Regards,
Inochi
