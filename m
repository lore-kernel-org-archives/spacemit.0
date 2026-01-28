Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801CF2FD697
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 11:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599211; cv=none; b=MxF5N1xoh9bogQZtNmlaDP3PMJCAjJLc3D/G+Wp/ozFO0+9ZyzMH7MwALmt0ya6MIz9jNzTd1hQuPQbnn3+DM/qY5JpghncAZOpGlfm5klOwFe+SDrpwd8804f6OzFEYGGAHWQlimI1eOtdb2hVI/fInSyV33pePaqdLJMKPlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599211; c=relaxed/simple;
	bh=HnHPH+j/OKPmgWAnhXrXBM80tftLuBhnT/v5StYFZsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHi3YK2VR1j0RC//+xwT0/+UiU+ORQP+al8PlqoygaeCTI4KIAJfMT5XrSHx3zsjWtWsMDH+hYl73/Y50/wnI/Ux+1rpnzLV6tPyd1DWuIZTzH4oog+eHIXAitYsS8AEKrDBSOMcnYGcYPL/VN8vu+giiuhicQ3fxyIM067y3NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIitcq2E; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIitcq2E"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1248d27f2b9so5334639c88.0
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599210; x=1770204010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2qYF+OMHzpUpn67zzVLUIwDwbqG7uxpk42nhaKidxBE=;
        b=BIitcq2Eqz806GNOxCTQRt2QOlSbeWVpmSbR4e20JnQRywuqHrEZC1eq0wyOLBI3sq
         SMYotwXh5C1xBFgxeyHexJx0G1+9gjfLhM0Kf9jCECloxAHfFVHt4NUmK4VV/dK/hjqF
         WhTtxUoVJLIpLyUAkYaMzV4vEOb8qd9xpx4rcaPDUT1bHjxiVHSAVNABuJbzaS4643Et
         2EHEmCXsvFzBMPB2X34WHLWyfezr8/Jcb38BuV9N0Bai4i1oc4GuTs8dJvZD6hlwIott
         MbuJ5aaGcBTzVEdetevdOIR1BCl7Hnuj8qwM0Si+Xw21yBqUxb8eYJV2FRlKxe1oEQSc
         zDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599210; x=1770204010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qYF+OMHzpUpn67zzVLUIwDwbqG7uxpk42nhaKidxBE=;
        b=Kxc3d0jLwOntpfrds/01299qepk1kCHiHmUTWIwHhFH7xEQfBmF2MA3aEof0Nf823w
         uFBV7fNiXFHFCK7SvbO07SxlT1bKuIRE6xnB7CGnz7bRuzkP1X8k1KMRypFXs0Cq/FbK
         4f0ps16gUq2iEmVaPZXR15s6WrDr8UuGZAR9L5udB1Zz2CsmLEAZjJSnKHWn1fQ8gV1b
         hs+LqLJ4qJcvRTJcdXELy4r+ZkJMIlrSBy8aDL5HWegdV5g1vuJuM8ECnu6Yd+IS7eig
         RGZGlPsv4sdJmx8+w3jS94G6OvM0TKSS3OfOoP7ZDFnY+2Hg+w3ta9MudWQTAI+vzwns
         Ht0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQmhoK6IdFxN5LGH6dEku/NT+Lp9UX5SxxtXBuDdT2My4Gc7JtbJoyEByJIShkizHyIGe50TlKDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbha4UKK8SLTv0xCrsKMywZB3Fb8anCs1Jh3XMavHzXFIe6Qu8
	Bhcoq6q4uUApJygunv9WuVwV/0rhDwSkarEzr9ucQY/6+7H1H2RI6hTS
X-Gm-Gg: AZuq6aJPBVI8SexPR2OWZrNKhuCqs0oJaCuE0i0MJ+jx4+EQWtAlyHTTAuzsnWrmFzT
	Z8karrgOHxekMfyipajAA1g5m9p+irjdMQM6SBQMiBULuT1wLMSY7rfs85Iypc52mkHUiPJFICh
	IwYFG4ZDIPXw2R8NDIT8Gx9LAxasKolb9qe9J+ap3mezq5uqxgaYi77IUMQYOs+z50S2/K+MVuS
	GC4a9j1m8+T5x0YFCOYLJfPespgvKggHoS9AUP+zL1bBegAVIEE7nhfc4bCGwX51nh1ImsPjY1u
	RhBeAijN7OT4wvZ903j5qyVpfl9ImcYm/PVmdFQmyb+SWUPqC2rC8WDryCBw2Y2/dUlpSPD3VRC
	svppGklYV2bMaZzdMbbaxKw3WEBK2XDF4AvLpzSM4KMR516uZEVtO4jAAKqiufdYKJ+4PwDLZjX
	TUo6oGVN4XxQ==
X-Received: by 2002:a05:7022:926:b0:119:e56c:18a8 with SMTP id a92af1059eb24-124a00745c6mr2790960c88.16.1769599209402;
        Wed, 28 Jan 2026 03:20:09 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f597sm1867369c88.5.2026.01.28.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:20:09 -0800 (PST)
Date: Wed, 28 Jan 2026 19:19:50 +0800
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
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <ziyao@disroot.org>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXnwlDOF40gs5L_7@inochi.infowork>
References: <20260128072931.875041-1-inochiama@gmail.com>
 <20260128072931.875041-4-inochiama@gmail.com>
 <aXnoV3Ay0uCc3HGQ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXnoV3Ay0uCc3HGQ@shell.armlinux.org.uk>

On Wed, Jan 28, 2026 at 10:43:35AM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 28, 2026 at 03:29:29PM +0800, Inochi Amaoto wrote:
> > +#include <linux/clk.h>
> > +#include <linux/math.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +/* ctrl register bits */
> > +#define PHY_INTF_RGMII			BIT(3)
> > +#define PHY_INTF_MII			BIT(4)
> 
> Please add a suitable prefix for these.
> 
> > +
> > +#define WAKE_IRQ_EN			BIT(9)
> > +#define PHY_IRQ_EN			BIT(12)
> 
> While you're renaming the PHY_INTF_*, you might wish to also add the
> same prefix here to identify that they're all part of the same register.
> 

I think this is good for me. I will add the "CTRL" prefix
to identify these are all from ctrl register.

Regards,
Inochi
