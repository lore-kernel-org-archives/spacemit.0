Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC29258CE7
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768048384; cv=none; b=QClCEw1pMN4QaMVF2If3XW6/ltloViOI9pMzIf4xvMJ7qoTuKjbOOM2YIMTvGbp6sTffexw87e2ue0EMOvLkFOAm+41GrF+Y6XbZ/ybkbzgDzvGJ/6irlnvEQLu6uASu/tfm1FtxqwsWfqakHkWyb5OaX5FgxVHs+6VHIBqbDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768048384; c=relaxed/simple;
	bh=t1y7T4jrYQEaGe7Td3k4kzLfpBsZdkJWPMu+vpmvTkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIMZ36m5ZcpRUTGycqL+uKXT1KPR3unlJynSTs9gk+h0eiQSleaPJEn+jVaK6Ka6QAYGgcECJP2rzCr/vVREXlUBEYyvVIxhXJnZ/p1Rk/D9q56+wVB3oP9eanNpmCsycjY1BizZ42JMZ0zLvfhzHnW8Hem7axDDr4KUprvxnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B40FC340EC3;
	Sat, 10 Jan 2026 12:33:01 +0000 (UTC)
Date: Sat, 10 Jan 2026 20:32:54 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Ze Huang <huang.ze@linux.dev>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
Message-ID: <20260110123254-GYD12783@gentoo.org>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
 <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
 <20260108012157-GYA2355@gentoo.org>
 <20260108113605-GYA4052@gentoo.org>
 <aWB-6UkudFit3ZBX@monica.localdomain>
 <5c54077c-f9fd-40c9-84eb-54139db8aaa6@sifive.com>
 <aWJAT3n_KcND8bOz@monica.localdomain>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWJAT3n_KcND8bOz@monica.localdomain>

Hi Ze,

On 20:04 Sat 10 Jan     , Ze Huang wrote:
> On Thu, Jan 08, 2026 at 11:21:48PM -0600, Samuel Holland wrote:
> > Hi Ze,
> > 
> > On 2026-01-08 10:07 PM, Ze Huang wrote:
> > > On Thu, Jan 08, 2026 at 07:36:05PM +0800, Yixun Lan wrote:
> > >> Hi Ze,
> > >>
> > >> I've done a quick check of the "regulator-always-on" issue, 
> > >> it's ok to drop the one from hub, but not the vbus one..
> > >>
> > > 
> > > Thanks for your double check
> > > 
> > >> On 09:21 Thu 08 Jan     , Yixun Lan wrote:
> > >>> Hi Ze,
> > >>>
> > >>>   thanks for your patch, I have few comments, see below..
> > >>>
> > >>> On 20:05 Wed 07 Jan     , Ze Huang wrote:
> > >>>> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> > >>>> Banana Pi F3 board.
> > >>>>
> > >>>> The board utilizes a VLI VL817 hub, which requires two separate power
> > >>>> supplies: one VBUS and one for hub itself. Add two GPIO-controlled
> > >>>> fixed-regulators to manage this.
> > >>>>
> > >>>> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> > >>>> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > >>>> ---
> > >>>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
> > >>>>  1 file changed, 48 insertions(+)
> > >>>>
> > >>>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > >>>> index 3f10efd925dc..013df91c6a4c 100644
> > >>>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > >>>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > >>>> @@ -59,6 +59,26 @@ reg_vcc_4v: vcc-4v {
> > >>>>  		regulator-always-on;
> > >>>>  		vin-supply = <&reg_dc_in>;
> > >>>>  	};
> > >>>> +
> > >>>> +	usb3_vbus: regulator-vbus-5v {
> > >>> I've checked the schematics, the name is 5V_VBUS there, so for the consistency
> > >>> with previous naming convention, let's change to:
> > >>> 	usb3_vbus_5v: usb3-vbus-5v 
> > >>>
> > >>>> +		compatible = "regulator-fixed";
> > >>>> +		regulator-name = "USB30_VBUS";
> > >>>> +		regulator-min-microvolt = <5000000>;
> > >>>> +		regulator-max-microvolt = <5000000>;
> > >>> ..
> > >>>> +		regulator-always-on;
> > >>> do you think the "always-on" property really necessary? it indicate the
> > >>> power regulator is critical, and should never been disabled even during
> > >>> suspend/resume state, for the case of USB, I think it should be totally
> > >>> fine to poweroff once the device is not used(suspended) or even disabled
> > >>>
> > >>> besides, the regulator is designed with a gpio enabling/disabling control
> > >>> which means it can be powered to on/off state?
> > >>>
> > > 
> > > 
> > >> not ok to drop, see comment below at &usb_dwc3 
> > > 
> > >>
> > >>>> +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> > >>>> +		enable-active-high;
> > >>>> +	};
> > >>>> +
> > >>>> +	usb3_vhub: regulator-vhub-5v {
> > >>> why use vhub, but not hub? where does this name come from?
> > >>>
> > >>> and for same reason, the name in schematics is VCC5V0_HUB, so how about
> > >>> change it to:
> > >>> 	usb3_hub_5v: usb3-hub-5v 
> > >>>
> > >>>> +		compatible = "regulator-fixed";
> > >>>> +		regulator-name = "USB30_VHUB";
> > >>>                                     ~~~need to fix too, if above is valid
> > >>>> +		regulator-min-microvolt = <5000000>;
> > >>>> +		regulator-max-microvolt = <5000000>;
> > >>> ..
> > >>>> +		regulator-always-on;
> > >>> ditto
> > > 
> > >> ok to drop, as it's already handled at drivers/usb/misc/onboard_usb_dev.c
> > >> which will explicitly request the regulator and enable it
> > > 
> > >>
> > >>>> +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> > >>>> +		enable-active-high;
> > >>>> +	};
> > >>>>  };
> > >>>>  
> > >>>>  &combo_phy {
> > >>>> @@ -67,6 +87,34 @@ &combo_phy {
> > >>>>  	status = "okay";
> > >>>>  };
> > >>>>  
> > >>> ..
> > >>>> +&usbphy2 {
> > >>>> +	status = "okay";
> > >>>> +};
> > >>>> +
> > >>>> +&usb_dwc3 {
> > >>>> +	dr_mode = "host";
> > >>>> +	vbus-supply = <&usb3_vbus>;
> > >> due to drivers/usb/dwc3/dwc3-generic-plat.c has no handler to request regulator
> > >> there will be problem if "regulator-always-on" property is removed..
> > > 
> > > On the BananaPi-F3 and to Jupiter, the VL817 hub setup uses two distinct controls:
> > > 
> > > GPIO97  controls the physical VBUS supply.
> > > GPIO123 controls the VCC5V0_HUB supply for the hub logic.
> > > 
> > > (Note: This differs from the Orange Pi RV2, where only GPIO123 is used to
> > > control the VBUS supply).
> > > 
> > > dwc3-generic-plat can not currently handle the regulator request explicitly,
> > > keeping "regulator-always-on" forces the VBUS to remain active even when
> > > suspended, which consumes unnecessary power.
> > > 
> > > I prefer to drop regulator-always-on in the DTS to accurately describe the
> > > hardware capability, and let the driver manage the VBUS state. This ensures
> > > better power management.
> > > 
> > > If anyone have other ideas, please let me know.
> > 
> > If a USB device requires board-level resources to function, then the USB device
> > itself (not the controller) needs a DT node that references these resources.
> > This is the purpose of the usb-device.yaml binding. For the VL817 hub, there is
> > a specific binding that links the highspeed and superspeed hubs together. See
> > Documentation/devicetree/bindings/usb/vialab,vl817.yaml. These nodes are matched
> > with the Linux usb-onboard-hub driver.
> > 
> 
> Hi Samuel,
> 
> Thank you for the guidance. I agree that VBUS control is a board-level
> resource and handling it at host controller level is not appropriate.
> 
> I noticed Marco Felsch's patch series "[PATCH v4 0/5] Add onboard-dev
> USB hub host managed vbus handling support", which adds support for
> optional vbus-supply at the USB port level. This matches our hardware
> situation perfectly.
> 
thanks for digging this, the patch looks exactly what we need..

> To avoid dependencies on unmerged code, I plan to stick with the
> "regulator-always-on" approach in the next version (v3). Once Marco's
> series is merged into the kernel, I will follow up with a patch to switch
> to the port-based VBUS supply method.
> 
going forward with "regulator-always-on" approach currently is kind of acceptable,
I wouldn't consider there is break if we switch to more proper solution later on,
and thanks for pushing this

> Link: https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de/
> 
> Best regards, Ze
> 
> > Regards,
> > Samuel
> > 
> 

-- 
Yixun Lan (dlan)
