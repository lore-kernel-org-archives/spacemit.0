Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598DE50096B
	for <spacemit@lists.linux.dev>; Fri,  9 Jan 2026 04:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767931257; cv=none; b=oJVPrcUnhOQCuG5pqLjOx1aESMFv8tW/v96xs44DO3xNDrjedKduuDCuNA/oAozwYXHAfRxoYAJZuL/s2QwGGJYAS/09GLGKsooC3r9S3S8dUhcSMU0SwGAAUM/wPqUdXZjGsgc8O44D2M3x6YAfCkNK10F5mCn6ZdkMWvrP/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767931257; c=relaxed/simple;
	bh=VQ/l+wMiRcDn/Vk/UNOk/P0fGHJvkRRT4KRRoJWNFXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnNQGxO9/nQNfzQFk4Jph4LsXprDjYY09H7hrxYgM+N82VsHpYjjzMF1eUQQCBIm2JtxR5y6aeMH/qCHZbEu5KTMKnSClU0x0NVutpnFOw3L3UMz99ando4j33apCRBXWFhl4/4LBw86tnDMep8NdRpENOBYHo/dJasJ1I8fpeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pUaBBrS7; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pUaBBrS7"
Date: Fri, 9 Jan 2026 12:00:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767931252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lavz1MSmjFqCciY/xo3Qbip068Uin2Q84GMzH2IKmGg=;
	b=pUaBBrS7sf/Nm3jDcO68XK5WakK795Qs2FNRiaTDXrAnRBCNm7K2HtrFYgw/gIYYB2dA5O
	uvY7rN7jHX+VXxRSMRekISM4Eyka9nry9AC//dq4l9ZxRg/Tj87LCW6LFqukJuoh5tgWfR
	9Ygo39IYeUOHf0lIu41pTvK/RhTdg30=
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
Message-ID: <aWB9ZN1iDkvoAiDj@monica.localdomain>
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
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 08, 2026 at 09:21:57AM +0800, Yixun Lan wrote:
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

Agreed. I will rename it to match the schematic.

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

As you pointed out in the following email, dwc3-generic-plat did not manage any
regulator. So, either keep "always-on" here, or manage vbus in dwc3-generic-plat.

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

I previously used 'vhub' just to align with the 'vbus'. However, using the
schematic name is better. I will update it to usb3_hub_5v.

> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USB30_VHUB";
>                                     ~~~need to fix too, if above is valid
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> ..
> > +		regulator-always-on;
> ditto
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
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "okay";
> > +
> > +	hub_2_0: hub@1 {
> > +		compatible = "usb2109,2817";
> > +		reg = <0x1>;
> > +		vdd-supply = <&usb3_vhub>;
> > +		peer-hub = <&hub_3_0>;
> > +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	hub_3_0: hub@2 {
> > +		compatible = "usb2109,817";
> > +		reg = <0x2>;
> > +		vdd-supply = <&usb3_vhub>;
> > +		peer-hub = <&hub_2_0>;
> > +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> > +
> can you move these two after &uart0? I'd like to keep them sorted by 
> label alphabet order..
> 

OK

> >  &emmc {
> >  	bus-width = <8>;
> >  	mmc-hs400-1_8v;
> > 
> > -- 
> > 2.52.0
> > 
> 
> -- 
> Yixun Lan (dlan)
