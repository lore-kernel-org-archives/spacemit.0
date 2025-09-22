Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6065F198A11
	for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528072; cv=none; b=WJJF5yJqPEnGBYnOJbsFVFiCWR8ymjFmUgeKUqDWmmU4K/3MteqXnfTREoWGax+XBptJHoAyp/eeJKgLG0dG0bCYlWgWTayS9MHxFyY15RT0ArrKiuzf0BAjdvyWm3YQnv3huIQkyI3bGu4I6sHoqpm1Zs+kY1G00jkYRlS+TSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528072; c=relaxed/simple;
	bh=Uk7jFx6ij0VJG/+aJ2eTZp3XvSC+fw3naQAQN0dvgBE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHyHXKWz8BtGQZeL1J/uFlMiRkQfXs2lRsI+uBnnqRuDqL/lMexRl/491dPBtfZaj8nH8zXbkgpdbPLURA3HVTGzS9vMCaaypVK1RTWPuMo76Bp1BmxFymVfNOe334HqT6S/CdszO12P1zU09mtn6627CW790AqhVKHa+FdVDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 55F52340A98;
	Mon, 22 Sep 2025 08:01:09 +0000 (UTC)
Date: Mon, 22 Sep 2025 16:01:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <20250922080105-GYB1291757@gentoo.org>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
 <20250922032158-GYA1291757@gentoo.org>
 <aNDVX9IrDbH2w7yJ@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNDVX9IrDbH2w7yJ@aurel32.net>

Hi Aurelien,

On 06:49 Mon 22 Sep     , Aurelien Jarno wrote:
> Hi,
> 
> On 2025-09-22 11:21, Yixun Lan wrote:
> > Hi Aurelien,
> > 
> > On 23:01 Sun 21 Sep     , Aurelien Jarno wrote:
> > > The BPI-F3 contains a 24c02 eeprom, that contains among other things the
> > > MAC addresses of the two network interfaces. For this reason, mark it as
> > > read-only.
> > > 
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > index 3b6e4f52e9aad..574d10fdf9b82 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > @@ -115,6 +115,15 @@ &i2c2 {
> > >  	pinctrl-0 = <&i2c2_0_cfg>;
> > >  	pinctrl-names = "default";
> > >  	status = "okay";
> > > +
> > > +	eeprom@50 {
> > > +		compatible = "atmel,24c02";
> > > +		reg = <0x50>;
> > > +		vcc-supply = <&vcc1v8_sys>;
> > > +		pagesize = <16>;
> > ..
> > > +		read-only;
> > so you're sure there is no demand to write data to eeprom?
> > (update info at linux env)
> 
> It seems to only contains board infos (mac addresses), but if there are 
> other use cases, that can indeed be dropped.
> 
On my second thought, I'm ok with it being "read-only", as we flash these
infos during firmware burning stage, then never alter them later.

> > > +		size = <256>;
> > > +	};
> > >  };
> > >  
> > >  &i2c8 {
> > > @@ -143,7 +152,7 @@ buck2 {
> > >  				regulator-always-on;
> > >  			};
> > >  
> > > -			buck3 {
> > > +			vcc1v8_sys: buck3 {
> > I'm not sure if adding an alias here is a good idea, it occurs buck3
> > serve the suppy for many devices, besides, to me it's more proper to
> > name it as eeprom_vcc1v8 for the eeprom according to schematics in
> > this case..
> 
> We need to add a label to be able to reference it for the eeprom 
> vcc-supply, but we'll have to also reference it for other devices (e.g.  
> emmc, wifi, phys, etc... It tried to choose a common name, ie the right 
> most one on the schematics. Another option could be to call it buck3, 
> but other name suggestions are welcome.
how about simply making it "buck3_1v8", then probably add a comment
later in the eeprom node? to mapping to the shecmatics
	vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

-- 
Yixun Lan (dlan)
