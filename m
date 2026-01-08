Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA113470BCD
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767872175; cv=none; b=QQD4Cg5mHcPW7RtdL37zE6m/xlKzNB5uxlgkY8KCBSrUKbi8zYdsnRFzTZc0z/Yr9B7ZodT8jNSLRoFHn3cXuyG61Mm9owCAaPHtJC3Blcpu0K8hXeM2bziIWN6FDSivHQKpRzlECT1NSgDizFfVipcnj3e2aZjSC8h6WrBDDas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767872175; c=relaxed/simple;
	bh=mYO24g2o9Em/aqHLfqGVQGosMGGz+WZ46J7P5PgTzoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ufo0pKVOa/NW+5BND4DIyMISOocaCC2mL3YnQ1QzI6GdJ+JQ9zygX0ytC1fHRWq/xyTH+2yi4zQo5eYUua76l3YEE5ycgUkWYHCHEdCAn9JxqODsgzRPSn1mI9lkIe02hRTcYnTEA9SzpNQKKIqYTfrLDeDfDyr72NaNN6ZaZxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 60F90342189;
	Thu, 08 Jan 2026 11:36:09 +0000 (UTC)
Date: Thu, 8 Jan 2026 19:36:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
Message-ID: <20260108113605-GYA4052@gentoo.org>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
 <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
 <20260108012157-GYA2355@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108012157-GYA2355@gentoo.org>

Hi Ze,

I've done a quick check of the "regulator-always-on" issue, 
it's ok to drop the one from hub, but not the vbus one..

On 09:21 Thu 08 Jan     , Yixun Lan wrote:
> Hi Ze,
> 
>   thanks for your patch, I have few comments, see below..
> 
> On 20:05 Wed 07 Jan     , Ze Huang wrote:
> > Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> > Banana Pi F3 board.
> > 
> > The board utilizes a VLI VL817 hub, which requires two separate power
> > supplies: one VBUS and one for hub itself. Add two GPIO-controlled
> > fixed-regulators to manage this.
> > 
> > Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 3f10efd925dc..013df91c6a4c 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -59,6 +59,26 @@ reg_vcc_4v: vcc-4v {
> >  		regulator-always-on;
> >  		vin-supply = <&reg_dc_in>;
> >  	};
> > +
> > +	usb3_vbus: regulator-vbus-5v {
> I've checked the schematics, the name is 5V_VBUS there, so for the consistency
> with previous naming convention, let's change to:
> 	usb3_vbus_5v: usb3-vbus-5v 
> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USB30_VBUS";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> ..
> > +		regulator-always-on;
> do you think the "always-on" property really necessary? it indicate the
> power regulator is critical, and should never been disabled even during
> suspend/resume state, for the case of USB, I think it should be totally
> fine to poweroff once the device is not used(suspended) or even disabled
> 
> besides, the regulator is designed with a gpio enabling/disabling control
> which means it can be powered to on/off state?
> 
not ok to drop, see comment below at &usb_dwc3 

> > +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	usb3_vhub: regulator-vhub-5v {
> why use vhub, but not hub? where does this name come from?
> 
> and for same reason, the name in schematics is VCC5V0_HUB, so how about
> change it to:
> 	usb3_hub_5v: usb3-hub-5v 
> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USB30_VHUB";
>                                     ~~~need to fix too, if above is valid
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> ..
> > +		regulator-always-on;
> ditto
ok to drop, as it's already handled at drivers/usb/misc/onboard_usb_dev.c
which will explicitly request the regulator and enable it

> > +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> >  };
> >  
> >  &combo_phy {
> > @@ -67,6 +87,34 @@ &combo_phy {
> >  	status = "okay";
> >  };
> >  
> ..
> > +&usbphy2 {
> > +	status = "okay";
> > +};
> > +
> > +&usb_dwc3 {
> > +	dr_mode = "host";
> > +	vbus-supply = <&usb3_vbus>;
due to drivers/usb/dwc3/dwc3-generic-plat.c has no handler to request regulator
there will be problem if "regulator-always-on" property is removed..

> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "okay";
> > +

-- 
Yixun Lan (dlan)
