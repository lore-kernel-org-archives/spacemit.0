Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425D23BF91
	for <spacemit@lists.linux.dev>; Fri,  9 Jan 2026 04:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767931640; cv=none; b=iCTxxZoMh4ggroTpVfQ6KvpOyzIDKoc6SsTL6ek5TwV1TeOE5ZzBbw/WX7XZqmRUIn5eqoRiLx7LgesSLG3kDaBg0mNGPl0FUgHN+vxiItzD5nKjSqvBNk7Qxw+PHjljRrH8+KTP4ow9NoQR4er78Ba0NzsoWM+8hkbu/OcE0mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767931640; c=relaxed/simple;
	bh=iOIOb3aawiqisN7pJ8zyYsiwPt0fTR6dgFprID3BeV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eS5dcNczw4/b67BpodHfkYYaFBUXBFWzq84Wx4cMOvcrUbpbRqNCPmfQUuHjatskJ7MUU3Sk1pLAXnvkaxDmVjpZOcAIpxtQowho8iTPQR4vMJvfVxFDk2n1JdOMl4DlKbMYkzzvKAuaD9yBkeXML0OoG2rA7CiFEEG+vyOrMso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bo2aO6/b; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bo2aO6/b"
Date: Fri, 9 Jan 2026 12:07:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767931636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tl36MNJVZU3EwlEGA+H8nYpkZdkwvt5ZI8VgXPXTog4=;
	b=bo2aO6/bLGszAjG5ed6NXWylByWoW94sU4VkA4+HYwZb7Sheey0AymZS2/q+WhZGwJMx7f
	5b7Me2tVENjZDXw/zWsGX72P2/BAod5JF678LKzSiJQ8tnjJlwVSqzpRnROvSjhW5mKVYH
	fAmyt7AEZ/ugeW7f4t8ijdfzJs/7JBI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Yixun Lan <dlan@gentoo.org>, Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
Message-ID: <aWB-6UkudFit3ZBX@monica.localdomain>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
 <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
 <20260108012157-GYA2355@gentoo.org>
 <20260108113605-GYA4052@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108113605-GYA4052@gentoo.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 08, 2026 at 07:36:05PM +0800, Yixun Lan wrote:
> Hi Ze,
> 
> I've done a quick check of the "regulator-always-on" issue, 
> it's ok to drop the one from hub, but not the vbus one..
> 

Thanks for your double check

> On 09:21 Thu 08 Jan     , Yixun Lan wrote:
> > Hi Ze,
> > 
> >   thanks for your patch, I have few comments, see below..
> > 
> > On 20:05 Wed 07 Jan     , Ze Huang wrote:
> > > Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> > > Banana Pi F3 board.
> > > 
> > > The board utilizes a VLI VL817 hub, which requires two separate power
> > > supplies: one VBUS and one for hub itself. Add two GPIO-controlled
> > > fixed-regulators to manage this.
> > > 
> > > Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> > > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
> > >  1 file changed, 48 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > index 3f10efd925dc..013df91c6a4c 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > @@ -59,6 +59,26 @@ reg_vcc_4v: vcc-4v {
> > >  		regulator-always-on;
> > >  		vin-supply = <&reg_dc_in>;
> > >  	};
> > > +
> > > +	usb3_vbus: regulator-vbus-5v {
> > I've checked the schematics, the name is 5V_VBUS there, so for the consistency
> > with previous naming convention, let's change to:
> > 	usb3_vbus_5v: usb3-vbus-5v 
> > 
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "USB30_VBUS";
> > > +		regulator-min-microvolt = <5000000>;
> > > +		regulator-max-microvolt = <5000000>;
> > ..
> > > +		regulator-always-on;
> > do you think the "always-on" property really necessary? it indicate the
> > power regulator is critical, and should never been disabled even during
> > suspend/resume state, for the case of USB, I think it should be totally
> > fine to poweroff once the device is not used(suspended) or even disabled
> > 
> > besides, the regulator is designed with a gpio enabling/disabling control
> > which means it can be powered to on/off state?
> > 


> not ok to drop, see comment below at &usb_dwc3 

> 
> > > +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +	};
> > > +
> > > +	usb3_vhub: regulator-vhub-5v {
> > why use vhub, but not hub? where does this name come from?
> > 
> > and for same reason, the name in schematics is VCC5V0_HUB, so how about
> > change it to:
> > 	usb3_hub_5v: usb3-hub-5v 
> > 
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "USB30_VHUB";
> >                                     ~~~need to fix too, if above is valid
> > > +		regulator-min-microvolt = <5000000>;
> > > +		regulator-max-microvolt = <5000000>;
> > ..
> > > +		regulator-always-on;
> > ditto

> ok to drop, as it's already handled at drivers/usb/misc/onboard_usb_dev.c
> which will explicitly request the regulator and enable it

> 
> > > +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +	};
> > >  };
> > >  
> > >  &combo_phy {
> > > @@ -67,6 +87,34 @@ &combo_phy {
> > >  	status = "okay";
> > >  };
> > >  
> > ..
> > > +&usbphy2 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_dwc3 {
> > > +	dr_mode = "host";
> > > +	vbus-supply = <&usb3_vbus>;
> due to drivers/usb/dwc3/dwc3-generic-plat.c has no handler to request regulator
> there will be problem if "regulator-always-on" property is removed..

On the BananaPi-F3 and to Jupiter, the VL817 hub setup uses two distinct controls:

GPIO97  controls the physical VBUS supply.
GPIO123 controls the VCC5V0_HUB supply for the hub logic.

(Note: This differs from the Orange Pi RV2, where only GPIO123 is used to
control the VBUS supply).

dwc3-generic-plat can not currently handle the regulator request explicitly,
keeping "regulator-always-on" forces the VBUS to remain active even when
suspended, which consumes unnecessary power.

I prefer to drop regulator-always-on in the DTS to accurately describe the
hardware capability, and let the driver manage the VBUS state. This ensures
better power management.

If anyone have other ideas, please let me know.

> 
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +	status = "okay";
> > > +
> 
> -- 
> Yixun Lan (dlan)
