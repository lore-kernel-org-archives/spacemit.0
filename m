Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C3A849C
	for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 00:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686640; cv=none; b=Tj0IUKMIauJci4WoaHJHrU7r2/OedIcrnUbXHl460rTmNn0mfuP5FV4mlblg/1U1YbyvFUVTVvQ0pfP45j3s6OTuqXB+Qxy2MDaczgbyZiUMpRcwGwwI5vE8Kj77XB7UhEQ3XuA79WUfmv3eLr9A+NeiNGSPsrAgRtTrmc09N+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686640; c=relaxed/simple;
	bh=h7yWjbfCQMl8h9k980xlB+2nvO4sI+S7hDa8rNNI6+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbURmPHQvDgYyWMwQBGQkySG+P9QWs76I+UhBREByswTjGNeo3s/toQfa2mAkChnTWC5DrSN8aHtFgxYi4Sm4OBbk+KsE8T6F7vWvGx8FNH2SZlprx//J9s9JmQim2QtXaNjuv6FwVMS/TjZRl5vsfoUlpZrPuYQ0RKJPJQuk8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 09DF7340B10;
	Thu, 12 Jun 2025 00:03:58 +0000 (UTC)
Date: Thu, 12 Jun 2025 00:03:54 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, vkoul@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, drew@pdp7.com,
	emil.renner.berthing@canonical.com, inochiama@gmail.com,
	geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	elder@riscstar.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA
 compatibility
Message-ID: <20250612000354-GYA127864@gentoo>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-2-guodong@riscstar.com>
 <20250611-kabob-unmindful-3b1e9728e77d@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-kabob-unmindful-3b1e9728e77d@spud>

On 17:27 Wed 11 Jun     , Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 08:57:16PM +0800, Guodong Xu wrote:
> > Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
> > controller in the Marvell MMP DMA device tree bindings. This enables:
> > 
> > - Support for SpacemiT PDMA controller configuration
> > - New optional properties for platform-specific integration:
> >   * clocks: Clock controller for the DMA
> >   * resets: Reset controller for the DMA
> > 
> > Also, add explicit #dma-cells property definition to avoid
> > "make dtbs_check W=3" warnings about unevaluated properties.
> > 
> > The #dma-cells property is defined as 2 cells to maintain compatibility
> > with existing ARM device trees. The first cell specifies the DMA request
> > line number, while the second cell is currently unused by the driver but
> > required for backward compatibility with PXA device tree files.
> > 
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > index d447d5207be0..e117a81414bd 100644
> > --- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > @@ -18,6 +18,7 @@ properties:
> >        - marvell,pdma-1.0
> >        - marvell,adma-1.0
> >        - marvell,pxa910-squ
> > +      - spacemit,pdma-1.0
> 
> You need a soc-specific compatible here.
> 
is the version number (1.0 here) actually documented anywhere?

otherwise I'd suggest using "spacemit,k1-pdma" which follow the convention
which already done for spacemit in other components..

-- 
Yixun Lan (dlan)
