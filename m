Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C130A39D6EA;
	Thu, 12 Mar 2026 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314941; cv=none; b=kNH2jK3mcu+KDoRho98bHcHrc76m0gjEGiv6FEyNDzZa21LHv7TJBXMcmI37Y2raRPlkh5Mg6ZMh3EqYTtYZgA9Q22v1rUYfTURSZu1I5d2fK3W0GITkGc/m970t2cLPwEE08Gv4m22Cym93nlfTTv/Sgu4n+jSafZE3FM3ae0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314941; c=relaxed/simple;
	bh=I3jwJdCsHstSRrFGSH1oMaY/GRHwpkyvBFzK3V5Esg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkyY7eLZjU/BWI3PUpNCcmsBSboI+Xo3nLw8zUP2fpkF5R+l476QMbXRi9rsASMJrkyHetO53HzzP1X4e6wR334jm4O7QEXqlCltagDL5ucaZPN3iotaSzzoA+1GE41x8Z8RRSC1k5G6I5THX4JxO28BIbm2jOClgeuwnHjp0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRAyWZLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRAyWZLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00FEC4CEF7;
	Thu, 12 Mar 2026 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773314941;
	bh=I3jwJdCsHstSRrFGSH1oMaY/GRHwpkyvBFzK3V5Esg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRAyWZLCtwhisWSIXGIBgkFyqGlK3d2PUxqdwBm7VoWQdRQC2OeiR+7DdCgy6VYmu
	 TqJ1XEIw7CFONs70RY9lvFnMxNll6VONm0YfESkI2DFSyIKNPz5LZET9EEAk7H6Wzp
	 SoHSYdG5J0OXj9A/YOvAlT5Nyk0D0J6LMDMqfTCyyBuu/RWBLEqd8CFKjZ5XAPgJA3
	 H+L/umWKH9zRxubbgiqTjoQAaMDO1Uct2u69UiVuAqP4zCZenoo2g3Y4RW0njhWUxi
	 NFBhXLvDBIwNn+/SsWmQOVA9l8PPwZiQj/GCfA4qeEMteNyoC/Nyu7IJffJOjvzy0v
	 5LVI8dotSIsgw==
Date: Thu, 12 Mar 2026 19:28:58 +0800
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
Message-ID: <20260312112858-GKH302167@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
 <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>

Hi Philipp,

On 12:09 Thu 12 Mar     , Philipp Zabel wrote:
> On Do, 2026-03-12 at 10:34 +0000, Yixun Lan wrote:
> > Instead of grouping several different reset lines into one composite
> > reset, decouple them to individual ones which make it more aligned
> > with underlying hardware.
> >
> > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++++++------
> >  1 file changed, 32 insertions(+), 10 deletions(-)
> > 
> > diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
> > index 79ac1c22b7b5..c12f8bd32047 100644
> > --- a/include/dt-bindings/reset/spacemit,k3-resets.h
> > +++ b/include/dt-bindings/reset/spacemit,k3-resets.h
> > @@ -97,11 +97,7 @@
> >  #define RESET_APMU_SDH0          13
> >  #define RESET_APMU_SDH1          14
> >  #define RESET_APMU_SDH2          15
> > -#define RESET_APMU_USB2          16
> > -#define RESET_APMU_USB3_PORTA    17
> > -#define RESET_APMU_USB3_PORTB    18
> > -#define RESET_APMU_USB3_PORTC    19
> > -#define RESET_APMU_USB3_PORTD    20
> 
> This is backwards incompatible.
> Are there any device trees using the APMU resets yet?
> If not, I wonder if we should just renumber all APMU resets into a
> contiguous range and try to get it into v7.0 as a fix.
> 
No, there is currently no consumers, so I could rework them into a contiguous
version, thanks for the suggestion

> Also, this breaks bisectability.
> reset-spacemit-k3.c will fail to compile between patches 1 and 2.
> 
I've tried a first version to squash the two patches, but got a checkpatch.pl complait
for binding should follow into a separate patch.

I can combine these two patches into one, is this Ok for you?

-- 
Yixun Lan (dlan)
