Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B17B2DBF75;
	Sat, 22 Aug 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787405877; cv=none; b=PwIvGyqKWmV3ONGcjd5NYOKhXDsgFCZ0o0PXjY200SPzEoPyRgqnK6vtt355l4uVt/Xp1LzstL7uPR9DXamwymSfXdj07GWuTq5va9NHRa/pZDwNeNtHEKC0lLxL9m1aN8IgbHv+rj267wIUebdGTPBKoQDAterLUvYSo9DixOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787405877; c=relaxed/simple;
	bh=1S/sw/uWsM7FO7iMBajD/6RGmVXM9gMjjdl1BWM2v4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLhjvWbfr0ikSV+9mwAvUj/oNB23Tq1qGMMeNFIbPwfGv4yfVykTIdyYUx8G0syERVRoZVGU4b2K43PRjecwsoSu1mUZpM8fdIK4otBNrmBHubwebvSCm2BJniNp4Qh9iToNIihRH5zjm2ysNFXMhmuXLqZJChjMCMy8HHKB+go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=GwWRbV3p; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="GwWRbV3p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=zDBgsV3+jDmiqlzEZNoPIOW8mF2ckwIKQWsrUdzM27s=; b=GwWRbV3p3phXULnOIKKsbeIyxS
	a/iq7+zFdy9cVFu/p5GT0uvFZcKL/jOrlXlWyZO/pKcyELSZ+EyqiT/hLnNjiJVPc7+gLn07NHLrY
	k+U1K7ZIalmwwMd8oFtHZAcfV30WWqqP/GxA8vm86RCRSvnLfqGO0P8YMGbyLFsPy2W0IUXUhfRrx
	/rpYcsaaPRMO6rKxggF8NWaHgPla149UaPEa8pQJMsVFrXbe8asH8i2bzd8VNdDBWMsOAC8BVntZ1
	1T+z26BdC9S0L1tkDnBnT/PRfDE4jaEi2cVRPoDTQxOeOGDjVPnLtKcFONUL/whLvqaRjpNvNrHUy
	us1Wi0fg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wxluw-0000000GuRp-1pH4;
	Sat, 22 Aug 2026 15:37:50 +0200
Date: Sat, 22 Aug 2026 15:37:49 +0200
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
Message-ID: <aommLXHW26fbHe70@aurel32.net>
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
 <aolt6CaL9b6p8A8V@aurel32.net>
 <aomWjQGk_p84pPD2@inochi.infowork>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aomWjQGk_p84pPD2@inochi.infowork>
User-Agent: Mutt/2.4.1 (2026-07-04)

On 2026-08-22 20:33, Inochi Amaoto wrote:
> On Sat, Aug 22, 2026 at 11:37:44AM +0200, Aurelien Jarno wrote:
> > On 2026-08-22 10:17, Inochi Amaoto wrote:
> > > On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> > > > On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> > > > either be used for PCIe or USB3, depending on its configuration
> > > > (spacemit,apmu). This configuration is defined at the board level, and
> > > > assigning a phy line to a USB3 controller while it is configured as PCIe
> > > > results in an "Invalid PHY mode" error.
> > > > 
> > > > Move the USB3 phy at the board level, the as it is done for the
> > > > submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> > > > there is one phy per USB controller.
> > > > 
> > > > [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> > > > 
> > > > Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> > > > Cc: Inochi Amaoto <inochiama@gmail.com>
> > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > > ---
> > > >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
> > > >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
> > > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > > index b084a35aa00e..171bd2f40aa6 100644
> > > > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > > @@ -328,5 +328,8 @@ &usb3d_u2phy {
> > > >  };
> > > >  
> > > >  &usb3d {
> > > > +	phys = <&usb3d_u2phy>,
> > > > +	       <&combophy 4 PHY_TYPE_USB3>;
> > > > +	phy-names = "usb2-phy", "usb3-phy";
> > > >  	status = "okay";
> > > >  };
> > > > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > > index c3f2dce0969c..3e24054d2084 100644
> > > > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > > @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
> > > >  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> > > >  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> > > >  			reset-names = "ahb", "vcc", "phy";
> > > 
> > > > -			phys = <&usb3d_u2phy>,
> > > > -			       <&combophy 4 PHY_TYPE_USB3>;
> > > > -			phy-names = "usb2-phy", "usb3-phy";
> > > > +			phys = <&usb3d_u2phy>;
> > > > +			phy-names = "usb2-phy";
> > > 
> > > I suggest removing this completely as we can not determine the
> > > phy we used. I think it is suitable for setting this in board
> > > file only
> > 
> > Yes, moving all the phy definition to the board level is an option. I 
> > decided to keep the USB2 phy at the SoC level, because contrary to the 
> > USB3 phys, there is a one to one mapping between the controller and the 
> > phy. Do you think it is a wrong assumption?
> > 
> 
> By default, I prefer to make the forgotten thing as an error in
> validation for any flexible field. If you leave the default value,
> the forgotten field will lead to a downgrade hardware (or maybe
> broken hardware). So I prefer to remove this rather than give a
> default value.

Ok, thanks for the feedback, i'll fix that in the v4.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
