Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C6846A;
	Sat, 14 Mar 2026 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773478377; cv=none; b=bkXEzKtnRfaW9SEajYOwOJmVr3yXp74hhWf6pR218irFLBs9qj+mfILVTjGOjxggOfQqdjxcQEmGvuLGoLnnxbfBPHA2/3frGlJOG5BSXaDcK2vA5EzjoSTr7X6huBlMLjtVFMR5dbm3gMlRCceBZe+KU6wCeb4Y90XUQM6z3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773478377; c=relaxed/simple;
	bh=isyAYh5ojmORloCgPaNY2dTczDe0Vz4+tpOhyTGu6gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQVcjSNRTGQbTSUnIe67H7JyUVnM1Kwhc0VBhXsfx38ShBbk9GOEtqWsO+fW/P8fXLaHz5QcDTwP/1XDtoxUZ0kRS+oR+zKg0TdsLMcBi8xzf3T01C0z5ryPCL9cf6xl/MHb9A3dHnHaeFKIdm7u01SUoSCWkii2pwYnRjvsZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FG0XXk9s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FG0XXk9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183CDC116C6;
	Sat, 14 Mar 2026 08:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773478376;
	bh=isyAYh5ojmORloCgPaNY2dTczDe0Vz4+tpOhyTGu6gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FG0XXk9sqlykF+WTrPP6Ra92mHopuoMNuMu4U/kRaB5eTRWeCH2Es+O4bivRJvt0h
	 xkwdx1VosZCrxboHeTVeo/Z/305oScEfFYnphPE3lqJLcK6v59hY7C6ssj8ZIF3LjT
	 FRwyNLZbwVEnzLeoieLUEu+YPDF3npLUlKnHZlhqljprrKRWaJRjxtjTA6gQJGEaT2
	 EfsDh9jw7zC3MDTqKoJcKbz0Fh7+6DFfCfDg3bJpn1GokSvQUM2whoYaa7ZLcoZWev
	 EmwvnDWTDtcsNwHG6uIERTr7twHHes1pWZNrHdwLtp0o5y+8jOcn8GIytEqmki32ne
	 XnIoOG1lCbFWQ==
Date: Sat, 14 Mar 2026 16:52:52 +0800
From: Yixun Lan <dlan@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: k3: add clock tree
Message-ID: <20260314085252-GKB415778@kernel.org>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
 <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
 <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>

Hi Samuel,

On 20:44 Fri 13 Mar     , Samuel Holland wrote:
> Hi Yixun,
> 
> On 2026-03-04 1:36 AM, Yixun Lan wrote:
> > Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> > blocks which are APBC, APMU, DCIU, MPUM.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 75 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index b69cf81b5d55..e3d7f3102fd5 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -4,6 +4,7 @@
> >   * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
> >   */
> >  
> > +#include <dt-bindings/clock/spacemit,k3-clocks.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  
> >  /dts-v1/;
> > @@ -398,6 +399,36 @@ core3 {
> >  		};
> >  	};
> >  
> > +	clocks {
> > +		vctcxo_1m: clock-1m {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <1000000>;
> > +			clock-output-names = "vctcxo_1m";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		vctcxo_24m: clock-24m {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <24000000>;
> > +			clock-output-names = "vctcxo_24m";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		vctcxo_3m: clock-3m {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <3000000>;
> > +			clock-output-names = "vctcxo_3m";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		osc_32k: clock-32k {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <32000>;
> > +			clock-output-names = "osc_32k";
> > +			#clock-cells = <0>;
> > +		};
> 
> Are these clocks provided by SoC or by the board? Usually there's a crystal
> external to the SoC that provides the root of the clock tree. If these clocks
> are provided by the board, they (or at least the clock-frequency property)
> should be in the board DT, not the SoC dtsi.
> 
It's true, as a quick check, osc_32k provided by P1 PMU, while vctcxo_24m is
a crystal, vctcxo_1m and vctcxo_3m are also marked as external in the clock
tree, but I would confirm them later..

I agree to move them out of SoC dtsi file - k3.dtsi, while due to all boards share
the same clock topology, what if I creating a k3-clock.dtsi and making it shared 
between all board dts file? to avoid massive DTS duplication

> Also, the /clocks node is out of order.
> 
I will move osc_32k before vtccxo_1m, assuming it's the problem you
refered to?

> Regards,
> Samuel

-- 
Yixun Lan (dlan)
