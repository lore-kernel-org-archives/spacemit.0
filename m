Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0F9385D76;
	Tue, 12 May 2026 22:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778626437; cv=none; b=u59fvAb60n3g1fZlbfcRvszIpwUq8BXvEmVneW37N/QtY9+1glR41VUus1xCk0yZbzwevnu7hWbQQDulLv3obIx1QiDNgoEzEUguWuEH3cZRwWevpdJ8R5U3ZS7D9H6A3OR/yb9FeRT+NJRhpDZlbaWPp+FSZ70xmZeREVquPN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778626437; c=relaxed/simple;
	bh=KaxJ46V/uBhVm6vtn0aABXcVxrwFHKMWYT8RUDytUHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBRT/ZjG8cl8wt2bZnQzIBITxt/AYtD+w35oVyBqXTB+ScE9ehCsn9wOYstO8HehJwQpx9wsNmYeYWhlISo7523SJHNnVptH0o2RL3ysQpm5nCBRv1nXAjxxp9FFVZJ7H4aW850KifOOxEmAZoNoROOSzwWgXG2+/trbh07HxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6RJ/LjZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6RJ/LjZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F78DC2BCB0;
	Tue, 12 May 2026 22:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778626436;
	bh=KaxJ46V/uBhVm6vtn0aABXcVxrwFHKMWYT8RUDytUHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6RJ/LjZzNlZYnF/N1c34MGwmzwLtB7c/OY4zSj9ZHdmTGhoiimEMm90Tx/n63mgF
	 eXkNPgUdVNIRBZVxXXsrNS4552UE79on4WinhtQ4+Nop17SIsSiV6OUfFAMSZlR7PT
	 mWZOVCgEnQRKbJ/czdsTygt1WIB/IZ58S6fjiDWPx3Aw4Kr1lKSeViyrojerHlM1Hu
	 7P/STKS5c3KJzNjTQvqhAwMHh/BWQZm7+/M7EwTIbjeH2IRvfowfhDsqc4O81Y7v/9
	 Xh9d7dhf5A+3aN40jaaWoYWXWl2n3jUkQPCyn8ZHnlazaBp56dcH9hfEkqTRJ/ZIFX
	 yydt/xb2ztc6A==
Date: Tue, 12 May 2026 22:53:54 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
Message-ID: <20260512225354-GKK3624147@kernel.org>
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-2-a.heider@gmail.com>
 <20260512113913-GKH3624147@kernel.org>
 <a41f87cc-55e4-4a48-bbee-d863e5a4b00a@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a41f87cc-55e4-4a48-bbee-d863e5a4b00a@gmail.com>

Hi Andre,

On 14:20 Tue 12 May     , Andre Heider wrote:
> On 12.05.26 1:39 PM, Yixun Lan wrote:
> > Hi Andre,
> > 
> > On 13:11 Mon 11 May     , Andre Heider wrote:
> >> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
> >> for the board's power infrastructure and voltage regulation support.
> >>
> >> Signed-off-by: Andre Heider <a.heider@gmail.com>
> >> ---
> >>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
> >>   1 file changed, 144 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> index 29e333b670cf0..88c35ad1ef2ae 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> @@ -17,6 +17,7 @@ / {
> >>   	aliases {
> >>   		ethernet0 = &eth0;
> >>   		serial0 = &uart0;
> >> +		i2c8 = &i2c8;
> >>   	};
> >>   
> >>   	chosen {
> >> @@ -33,6 +34,25 @@ led1 {
> >>   			default-state = "on";
> >>   		};
> >>   	};
> >> +
> > ..
> >> +	reg_usb_vbus: regulator-usb-vbus {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "USBVBUS";
> >> +		regulator-min-microvolt = <12000000>;
> >> +		regulator-max-microvolt = <12000000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +	};
> > I think you can further drop above regulator, which merely serve as vin-supply
> > and not used by devices, plus it's a non-controllable fixed regulator
> 
> It is, but as mentioned on the cover letter I left this one as it's consistent with the other k1 boards.
> I don't care either way, so I'll just drop it.
> 
Please drop

It's a historical reason that we instroduced the unnecessary regulator
before Krzysztof's comment, in other words, we should also fix that too..

-- 
Yixun Lan (dlan)
