Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E02D9792;
	Sat, 22 Aug 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787391477; cv=none; b=MmUwQpmaoVEaQR1aZhhe7/tqdBF4OFRzjSkqo5sx2AdDPgOZuY6dwtUsnSOmkuKfFnC9cStkAIVumIAJg7Bf5pLMbcSfUC3zXIj097pk5n4l+GUS4zQvSk8BUhoRpw1Bgkt40gaOeN6Nrw9apUvjQdT2eRI/XvBtp7aqD1FN5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787391477; c=relaxed/simple;
	bh=wdWgeUoU/VB7fcZZM4/QWweDg+t4Yxw/zF99iOmKNvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjOsoQUEm+/iCWY6EgxDpy6wab/Dz5t/ZKJCaRjrFyZ1JVTdM4bEfC1sZVkCMmTJOEb+Kn/OCej06dRAF66SCb/wyq3kV/D85KduQo9Gs+/q1GxxMCnVmIv7henGeWBVuWP3Vm+8GO34B9SP9WRNIQNGsf44qIS0uZcPutMJo6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=ktaxalRV; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="ktaxalRV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=PXtr0FjCl+UhNS+rb/fTOHoXrNWxlpBFn/+u2wMK3T0=; b=ktaxalRVTUSReGk9GXhu9N5bs+
	Z/iyvukyhoi3gYd4ynDR5LcIzftPg8Gnax2P1H6nqk2pK8uH5tsa+ZT80pQc/0n4xzO6ifdgg5HcE
	F3SkISlhWF9uXzlCyqXahWS2/nQv+swdR/NhjW4lcE16p9O9zWAPneoEhktBRt2h2DIEsWYHDnylT
	aMunADRl+UOBHZoHPbqFjc8wH3LdfPuRocd1UUlDrCmNgCO5aTIC5JcJ9rRvBLVyQ3Cn35zH+Ae84
	FB5e+/O72Te6YiiK05lbnzYSk6Le6/x0a6JPtYXwxn4IQBP6KvjDLb0/YFpfRuTP6LKcFYOE3lJqr
	VaxJpSpA==;
Received: from aurel32 by hall.aurel32.net with local  (Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wxiAa-0000000GhRJ-31Jx;
	Sat, 22 Aug 2026 11:37:44 +0200
Date: Sat, 22 Aug 2026 11:37:44 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <aolt6CaL9b6p8A8V@aurel32.net>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
 <20260819162115.2252812-2-aurelien@aurel32.net>
 <aokGbT7XTCbxUQzl@inochi.infowork>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aokGbT7XTCbxUQzl@inochi.infowork>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026-08-22 10:17, Inochi Amaoto wrote:
> On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> > On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> > either be used for PCIe or USB3, depending on its configuration
> > (spacemit,apmu). This configuration is defined at the board level, and
> > assigning a phy line to a USB3 controller while it is configured as PCIe
> > results in an "Invalid PHY mode" error.
> > 
> > Move the USB3 phy at the board level, the as it is done for the
> > submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> > there is one phy per USB controller.
> > 
> > [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> > 
> > Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> > Cc: Inochi Amaoto <inochiama@gmail.com>
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b084a35aa00e..171bd2f40aa6 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -328,5 +328,8 @@ &usb3d_u2phy {
> >  };
> >  
> >  &usb3d {
> > +	phys = <&usb3d_u2phy>,
> > +	       <&combophy 4 PHY_TYPE_USB3>;
> > +	phy-names = "usb2-phy", "usb3-phy";
> >  	status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index c3f2dce0969c..3e24054d2084 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
> >  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> >  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> >  			reset-names = "ahb", "vcc", "phy";
> 
> > -			phys = <&usb3d_u2phy>,
> > -			       <&combophy 4 PHY_TYPE_USB3>;
> > -			phy-names = "usb2-phy", "usb3-phy";
> > +			phys = <&usb3d_u2phy>;
> > +			phy-names = "usb2-phy";
> 
> I suggest removing this completely as we can not determine the
> phy we used. I think it is suitable for setting this in board
> file only

Yes, moving all the phy definition to the board level is an option. I 
decided to keep the USB2 phy at the SoC level, because contrary to the 
USB3 phys, there is a one to one mapping between the controller and the 
phy. Do you think it is a wrong assumption?

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
