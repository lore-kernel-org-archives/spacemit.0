Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F73563F0;
	Fri, 20 Mar 2026 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000993; cv=none; b=HhLrzGuTcEQgjY61FUSl0XrjU/Dbd64xI6+AGLnhETSHhQNHtcbRCq8hsn+PA5gAu3wAVkNzeGDJsDCb/arEOFxuSKf4MxTz7Av5jL9Nzj62eRyFG3FIhv2mpRz2aYqfqzYG6PBX/zzG4ck+D7nWU+yvOVw/FHKYpBE6kr0JXCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000993; c=relaxed/simple;
	bh=7ScUjOk9W/drDXblkhRsDrw/vCcn0HfJ2wuKW5dR+Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5SCvWzVwT0zH82ZQINYL6EKXjgE4LtOKFyxCnFpe0Efk/bIOkwRCt0OwLqdbiTUK7eXQirGovH8I0GLPcbs7wYOkRdxMGwmK13keFSuKNRDD3DOatzXolJ27o7mFEr4X6ObUi9fNg3geAtompUSyVp9BaI4tgmK2/p5sS9urf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQKfhaOc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQKfhaOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F12BC4CEF7;
	Fri, 20 Mar 2026 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000992;
	bh=7ScUjOk9W/drDXblkhRsDrw/vCcn0HfJ2wuKW5dR+Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQKfhaOcKUyBteWvcd88d6C1/eBUYyjEFdUiVlaBVbuxfqWZJsR0e+y3huVojBi7A
	 a0lY1Bfa6R8NU5Drgp5BjpafaIXdGQBu9BY7r8AKvNJsNiR26tF8JCSUUL8dR0PEzo
	 IjtcNQlrr25dk1wZwppBxFpu0nkl+Q4RQHuRZ3F7f8UhdWZeYOfpt2YBOAjE7bBeF/
	 EA0C0B3+Mvi9QPKAfdKBPfsNr6D9mecKq4zU+012O6c6Ywuj2mXtkhy0yNV2ACzP0T
	 1ni/3ahX/3wzML6dXkyUjk1cUoZU3uy/laTkTgxsmMIUGN45oxJWrtceMDzFhzOxVg
	 VOkXOo1m3EFSQ==
Date: Fri, 20 Mar 2026 18:03:09 +0800
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
Message-ID: <20260320100309-GKC525649@kernel.org>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
 <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
 <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>
 <20260314085252-GKB415778@kernel.org>
 <b885158f-3859-4bfa-96b0-39c274a856cf@sifive.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b885158f-3859-4bfa-96b0-39c274a856cf@sifive.com>

Hi Samuel,

On 09:13 Sat 14 Mar     , Samuel Holland wrote:
> Hi Yixun,
> 
> On 2026-03-14 3:52 AM, Yixun Lan wrote:
> > On 20:44 Fri 13 Mar     , Samuel Holland wrote:
> >> On 2026-03-04 1:36 AM, Yixun Lan wrote:
> >>> Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> >>> blocks which are APBC, APMU, DCIU, MPUM.
> >>>
> >>> Signed-off-by: Yixun Lan <dlan@kernel.org>
> >>> ---
> >>>  arch/riscv/boot/dts/spacemit/k3.dtsi | 75 ++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 75 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> >>> index b69cf81b5d55..e3d7f3102fd5 100644
> >>> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> >>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> >>> @@ -4,6 +4,7 @@
> >>>   * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
> >>>   */
> >>>  
> >>> +#include <dt-bindings/clock/spacemit,k3-clocks.h>
> >>>  #include <dt-bindings/interrupt-controller/irq.h>
> >>>  
> >>>  /dts-v1/;
> >>> @@ -398,6 +399,36 @@ core3 {
> >>>  		};
> >>>  	};
> >>>  
> >>> +	clocks {
> >>> +		vctcxo_1m: clock-1m {
> >>> +			compatible = "fixed-clock";
> >>> +			clock-frequency = <1000000>;
> >>> +			clock-output-names = "vctcxo_1m";
> >>> +			#clock-cells = <0>;
> >>> +		};
> >>> +
> >>> +		vctcxo_24m: clock-24m {
> >>> +			compatible = "fixed-clock";
> >>> +			clock-frequency = <24000000>;
> >>> +			clock-output-names = "vctcxo_24m";
> >>> +			#clock-cells = <0>;
> >>> +		};
> >>> +
> >>> +		vctcxo_3m: clock-3m {
> >>> +			compatible = "fixed-clock";
> >>> +			clock-frequency = <3000000>;
> >>> +			clock-output-names = "vctcxo_3m";
> >>> +			#clock-cells = <0>;
> >>> +		};
> >>> +
> >>> +		osc_32k: clock-32k {
> >>> +			compatible = "fixed-clock";
> >>> +			clock-frequency = <32000>;
> >>> +			clock-output-names = "osc_32k";
> >>> +			#clock-cells = <0>;
> >>> +		};
> >>
> >> Are these clocks provided by SoC or by the board? Usually there's a crystal
> >> external to the SoC that provides the root of the clock tree. If these clocks
> >> are provided by the board, they (or at least the clock-frequency property)
> >> should be in the board DT, not the SoC dtsi.
> >>
> > It's true, as a quick check, osc_32k provided by P1 PMU, while vctcxo_24m is
> > a crystal, vctcxo_1m and vctcxo_3m are also marked as external in the clock
> > tree, but I would confirm them later..
> 
> In that case, osc_32k should ideally be a reference to the P1 PMU clock
> provider, not a fixed-clock. But this may be infeasible if it creates dependency
> loops (PMU depends on I2C, I2C depends on clocks, clocks depend on PMU).
> 
Yes, in an ideal case, not only there is dependency loop, but need to
implement a clock tree for P1..

Currently, I'd leave it as fixed-clock as is, since the 32k clock is
always on from P1 since power up

Also, for vctcxo_1m and vctcxo_3m, they are clocks derived from vctcxo_24m which
unable to be gate off, so I think it's ok to leave them as fixed-clock.

> > I agree to move them out of SoC dtsi file - k3.dtsi, while due to all boards share
> > the same clock topology, what if I creating a k3-clock.dtsi and making it shared 
> > between all board dts file? to avoid massive DTS duplication
> 
> Yes, it is common practice to create a .dtsi file for things shared among
> several boards for a SoC (for example if they are all based on a reference
> platform). You may want to name it something more generic if more than just
> clocks can be shared (like k3-common.dtsi, compare jh7110-common.dtsi).
> 
k3-common.dtsi sounds good to me

> >> Also, the /clocks node is out of order.
> >>
> > I will move osc_32k before vtccxo_1m, assuming it's the problem you
> > refered to?
> 
> I mean that /clocks sorts alphabetically before /cpus. Your ordering of the
> fixed-clocks nodes themselves is fine.
> 
ok, I got

> Regards,
> Samuel
> 
> 

-- 
Yixun Lan (dlan)
