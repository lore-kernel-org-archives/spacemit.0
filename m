Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C929D26B;
	Fri, 13 Mar 2026 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773361439; cv=none; b=ZC2gqyatfjmuOMFDiD2q2Q9XqneaX9F1iSaYre1zGIcl9mAi1HuvEA7bPxzdOCgyI4O5iwb0zxmrGvA1tcuQhDp+TPrdGxI5bS6Spc4jIwUEqZCTeZndKnS/4DJCUa7bJp+GCa0zjaReczubJqRUdXiOZrT1+mjXT8oTaqHIGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773361439; c=relaxed/simple;
	bh=GUdwY2Du7QdcArJbkRJOuPYgueFjUjS8kp8TVA2xanU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNlddaFbNmsZpub0nT2SeWkrepmCxyXIX4YKZIOr3YBn09vGkAvvKAjsAFWhhYytSz3jmhiItHwhkYkRfIJ9DVxUuKNW3NjstfbIt7jgqrQyibNAjhJA16rQNsmmGkAKeEsN7x6jeJDnGZgH6QJu4w9dLwYltH3qU/0aJCcM9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVqfBwDQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVqfBwDQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D183C4CEF7;
	Fri, 13 Mar 2026 00:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773361438;
	bh=GUdwY2Du7QdcArJbkRJOuPYgueFjUjS8kp8TVA2xanU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVqfBwDQMgF5VH4QMuRtpy5s3xb2J8QBsmspLowwipidnNd9FdoJ4yi5JZxi2gQ93
	 Y8x8YjLIhWR2/1ANQRUSA1nABCY4SKyk0iONe8u8tFH5CnVvCJXnPqyTKzS4bR7Tt0
	 WsU0jKLkapnoBqx9g82kiNTPn8/k0u/l/VOo2WsEKmb9PZQ3noNhHqiM2Mrxb+FRQI
	 pV7DQ3dWiYsF1zlHv+h8IAkSR9HcVl8sbOdmeSd9pPkaDptI+d5iuAoA9FyxDAqXVj
	 oI0ahzlPXJN+6xRqP3Z84O9+HitWS2pwnKTy+R2h04SX1NjChpwToaTQxnfqhNspjV
	 pBXEIj5Sm89MQ==
Date: Fri, 13 Mar 2026 08:23:56 +0800
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
Message-ID: <20260313002356-GKJ302167@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
 <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
 <20260312112858-GKH302167@kernel.org>
 <20260312-legume-unstitch-129b278e14d6@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-legume-unstitch-129b278e14d6@spud>

Hi Conor,

On 17:30 Thu 12 Mar     , Conor Dooley wrote:
> On Thu, Mar 12, 2026 at 07:28:58PM +0800, Yixun Lan wrote:
> > Hi Philipp,
> > 
> > On 12:09 Thu 12 Mar     , Philipp Zabel wrote:
> > > On Do, 2026-03-12 at 10:34 +0000, Yixun Lan wrote:
> > > > Instead of grouping several different reset lines into one composite
> > > > reset, decouple them to individual ones which make it more aligned
> > > > with underlying hardware.
> > > >
> > > > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > > > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > > > 
> > > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > > ---
> > > >  include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++++++------
> > > >  1 file changed, 32 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
> > > > index 79ac1c22b7b5..c12f8bd32047 100644
> > > > --- a/include/dt-bindings/reset/spacemit,k3-resets.h
> > > > +++ b/include/dt-bindings/reset/spacemit,k3-resets.h
> > > > @@ -97,11 +97,7 @@
> > > >  #define RESET_APMU_SDH0          13
> > > >  #define RESET_APMU_SDH1          14
> > > >  #define RESET_APMU_SDH2          15
> > > > -#define RESET_APMU_USB2          16
> > > > -#define RESET_APMU_USB3_PORTA    17
> > > > -#define RESET_APMU_USB3_PORTB    18
> > > > -#define RESET_APMU_USB3_PORTC    19
> > > > -#define RESET_APMU_USB3_PORTD    20
> > > 
> > > This is backwards incompatible.
> > > Are there any device trees using the APMU resets yet?
> > > If not, I wonder if we should just renumber all APMU resets into a
> > > contiguous range and try to get it into v7.0 as a fix.
> > > 
> > No, there is currently no consumers, so I could rework them into a contiguous
> > version, thanks for the suggestion
> 
> Only as long as it goes into 7.0, IMO, as a fix.
> 
Yes, that's the plan

In this case, I would change my mind to add a Fixes tag explicitly(shouldn't hurt!)

> > > Also, this breaks bisectability.
> > > reset-spacemit-k3.c will fail to compile between patches 1 and 2.
> > > 
> > I've tried a first version to squash the two patches, but got a checkpatch.pl complait
> > for binding should follow into a separate patch.
> > 
> > I can combine these two patches into one, is this Ok for you?
> 
> Be very very very clear about why they're going together, otherwise you'll
> get yelled at!
Ok, will add comment for this, thanks for the tip.

-- 
Yixun Lan (dlan)
