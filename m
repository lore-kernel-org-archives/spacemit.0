Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2DD213236
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759046814; cv=none; b=rFOiqasqWFXSAEYPIWCWE0omuPpS/IDJ/Vzco4dUft7XWJaEWh6eCe+Lfy0zVqGF6Z+K/LeXkpyqrwpGkIpXleZiXsZGy0RkKujzAPRbDIJ/Vc7iOhpkGKm/GLLAARUi59Vo31tzZxhM5HRVFvn0B6nHdOo025b5WrW0urLRC1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759046814; c=relaxed/simple;
	bh=+hPwyKvXo5cIFisxD0X+VGQkAAJQ9LlZh1ATQ6RWhk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT7QTXmyAYhhSoEbkFSlvtXjvtjlsYnGxl6jGQ2dQf7NEXdWkXB+/ocT2pF/TN+xBO/AfkqnmqmYQZ9qP5a7R6oxbZE2uGWiAeG5HM/ZUMGPbc144oRrkOu5MW6VemPR1QhV6d8kM/mseOh5gONsnuG1KOabOtc0fVLxULxn6J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=zAJe62i6; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="zAJe62i6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759046733;
	bh=XydPf2hr5/LRillZoWelSgipJxHnxGk3kjMNGJt/nPE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=zAJe62i66neIscKAMAFNC62viSwONrq9JVNUIDEeXatHfPfuusRclOfWc+LY2Ny3b
	 d07TK6EIDa7ozzoOX+EUOBjt3ImaQwYXEdCVsja/x1ckRzxwiDEOKBx8DtK9mhgtLK
	 cpuhNKTYhNYHK76QR6AycxlTz6eSNzFv7fC1W03U=
X-QQ-mid: esmtpgz12t1759046731te1cd0686
X-QQ-Originating-IP: XgNb6m+8gRGQNrsjYykMtwnmjmXfp6Q8mOdpagPnEDI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 16:05:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15804236060269286392
EX-QQ-RecipientCnt: 15
Date: Sun, 28 Sep 2025 16:05:29 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MusePi Pro board device
 tree
Message-ID: <3074FC8521909735+aNjsSWwkd1aH-moh@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com>
 <20250928080003-GYB1344940@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928080003-GYB1344940@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MZQfbS02KrT5L+9ftrY4nKMxxuyC22YfZ7Yk2KDeBKQvgP49/eZczRCq
	M73bM4cMPxxAsAlCZlNWUgi7g520zVhg0f0WYf6BrYvMRYJbLYi/N2EF7dWHY2H5q/05mWp
	Xw9NJUUOZa12Yb+EyHSttfLWdkFBhWF4QZUoSHFt99+yipy5309pUUjsiccdGMWUtRp0D/7
	TRNhEAPPG6Veqd9yW/eHFW472iQfsCnqHfLaWwRgZPNcV8Dggz1jVDRppkdMUVjJdNZWwWi
	bepyGow4GMqvMN83Zv9UA0meF0qb2fkGFh/5QJAEMNV4nasMKsJbQ2nX+vtpy0uSz0suRaY
	eMnJkHgHUKWlTpUZJhoAwwi89R4SmsSpngXTuJwWg20DdQyyCSrcIujLhmlUWdYWjPiuFgy
	q9fE3cwUkdCKW42SqEnxv8g/e8Vehsv8PYyTlQzFJzEAnyuxoLB5AkvPiwzTzckVTyzjQ9U
	yzRrNVMW3SdC+f/GnJs0+g4No+X0NWq+tYO+PUD3SXnKt2r9mMOhFFxTYHOZZsDp35AavDp
	DB7qfuOkJc5RhWQDln+U0NhKvaBv7tm/L3oR/vUm8Qn4wXJzb5trsZBAm17OXP2KWQyz4CR
	cXyqbORpMTG8EiuOHQkOxMYwOQTiGUmqp3rVfpbOtt/TOw0gtSAfSSozE++ktwOOroLeFHG
	kTRwgQ4At3MZwC1CoUImXEzX85lLa2j6Jv0rsWHmp1vKAKKiWBT754tKBaFjxoWj6em0Euj
	ZzlDcej2hatUROubPVxpZNiCOTkbfhD2OFdFk60lhkElWA5AMG7l1lrX2J4turthGs79w2u
	jqu940xjgr07kzdN0iIn9ODl8Y+OKRmXm2AUgZvB+aQPuIVX1wiv5WWFHGxuoiOyLhdcZXi
	tJs/vWqNJwTHbs5pxzegFmLdVd333MmT+qorFazmVwz7jB+/B6gfrT6mbv3ywZCA+ZlpJtp
	p9SkPyWpPDRdqidinKrJ6l9E9o47mR5M3mBrRLkw/nNBRu+TqzwJFca/pU36GCzuAjjIJs9
	PTEG4qTOMYSqGfth2Pj9kfTt4ntk5/iYd/LW7e2wJ9Ps/wqtMc8L17QW8G0QBKVUDaBRn09
	v/hsGhECgwBrIv/MeHE8o/cQ34Ec8QJzxtpzdMd2D/K6uW3D+mSvOjJmMldfFaCMGvkRxa0
	0kJ1
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Sun, Sep 28, 2025 at 04:00:03PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > 
> > Add initial device tree support for the MusePi Pro board [1].
> > The board is using the SpacemiT K1/M1 SoC.
> > 
> > The device tree is adapted from the SpacemiT vendor tree [2].
> > 
> > This minimal device tree enables booting into a serial console with UART
> > output and a blinking LED.
> > 
> > Link:
> > https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> > https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_MUSE-Pi-Pro.dts [2]
> > 
> same as patch 1
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/Makefile          |  1 +
> >  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 40 ++++++++++++++++++++++++++
> >  2 files changed, 41 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> > index 152832644870624d8fd77684ef33addb42b0baf3..76b98096e2a46c3192651d6d66af7742f740c635 100644
> > --- a/arch/riscv/boot/dts/spacemit/Makefile
> > +++ b/arch/riscv/boot/dts/spacemit/Makefile
> > @@ -2,3 +2,4 @@
> >  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
> >  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
> >  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> > +dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
> please sort
Oh my gosh..
That's my mistake. I will fix it in the next version.

> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3791186ce47b88887eab4321dcd7035668e7f02d
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > @@ -0,0 +1,40 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> > + * Copyright (C) 2025 Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "k1.dtsi"
> > +#include "k1-pinctrl.dtsi"
> > +
> > +/ {
> > +	model = "MusePi Pro";
> this is a little bit short, how about make it "SpacemiT MusePi Pro"?
Sounds good to me.

> 
> > +	compatible = "spacemit,musepi-pro", "spacemit,k1";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0";
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> > +		led1 {
> > +			label = "sys-led";
> > +			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +			default-state = "on";
> > +		};
> > +	};
> > +};
> > +
> > +&uart0 {
> ..
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_2_cfg>;
> swap these two lines, for similar reason, see my comment here
> https://lore.kernel.org/all/20250918133209-GYB1273705@gentoo.org/
Thanks for this link.
> 
> > +	status = "okay";
> > +};
> > 
> > -- 
> > 2.51.0
> > 
> 
> while you are here, I'd suggest to push as many features as possible
> instead of this minimal DT, which say - PMU, emmc, ethernet should be ready..
> (ethernet is in next, should show up at v6.18-rc1)
Good idea.
I think I should split these into multiple commits, right?
Like, PDMA and EMAC should definitely be two separate commits.

                                  - Troy
> 
> -- 
> Yixun Lan (dlan)
> 
