Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11610399377;
	Thu, 16 Jul 2026 21:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237476; cv=none; b=iyXAOiGOM6V4ZT/ppBvoh07m/n9Gxi2gXlWMlfn6XfBcHAwZK3ZvreQEzku/S7/gR3Yh2ksscC+Z6xvKDICtJ/ck2gxflLfAxWIV6IsT99E39F6ybbEpwK7+T4k1v4QF5g0qgwzqdu8cUdGCf9RD0l0cHoy1WpOzU4SqT3CGnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237476; c=relaxed/simple;
	bh=LkJq9jQsyM08G5vakOYdHBCw49Bildrt7SZugRBmbRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDob+YUtiyTAU9wxGVw9biazhUdZit4bly1tEEPD9yuDJFbwP5KMyiNvCfroJkV7WIxzotOs+a26WGbWmgUe5PMLxa6lk+IjSsqa+0/8CFHnYPt0YpzEx28+nKdbFWIox5oTwILjMucZX5J/KW1Uwg49FITtQDL5oNhXp9oi8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=UsM5lhk1; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="UsM5lhk1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=DLyqifiJvUqD1TFfODwLCmx07fkJuJfKQGsBLX8IZRc=; b=UsM5lhk1eT8JUMCjFx1ZaIBmgB
	M6oE6oAh/Yy8sqcqe3bBv9cM5wxp467kplWvF3DMnnfx34SQI8YkdNplUtaizM/DKzivX0mWlCZ9E
	GBH158jtsuJZB8koFIxIeSNI5PeJyPwkZDj1sN2EsXgWfmd1Ptag+2qhuEnpZFZvUHPc34IMcGfzN
	qk3HvL3tb3UGibM/2fpu1Or71ggpOUHnKYyxfJtmw2iF8BdemAxoAXn5cZmO0SbII0ZfnCG+8NEnr
	aeY5vzUmGou1lBrEZ6gONWBgmI0sLlFYcAbPhZ3lqpdjg9099za+asd76i5+6ENUpj44B+aNi8h5v
	hkW5RKdQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkTfj-00000003GSb-2MgD;
	Thu, 16 Jul 2026 23:31:11 +0200
Date: Thu, 16 Jul 2026 23:31:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: k3: add USB controller and USB
 phy support
Message-ID: <allNnol5HttviAan@aurel32.net>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709040415.977784-2-inochiama@gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026-07-09 12:04, Inochi Amaoto wrote:
> Add all USB device node to the Spacemit K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..2a6d35a64d5c 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -182,6 +182,11 @@ dldo7: dldo7 {
>  	};
>  };
>  
> +&combophy {
> +	spacemit,apmu = <&syscon_apmu 0x11>;
> +	status = "okay";
> +};
> +
>  &eth0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
> @@ -221,3 +226,11 @@ hub@1 {
>  &usb2_phy {
>  	status = "okay";
>  };
> +
> +&usb3d_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3d {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 19fc9b49668e..82c9e2da82e9 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/spacemit,k3-clocks.h>
>  #include <dt-bindings/reset/spacemit,k3-resets.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
>  
>  /dts-v1/;
>  
> @@ -438,6 +439,47 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		usb3d: usb@81a00000 {
> +			compatible = "spacemit,k3-dwc3";
> +			reg = <0x0 0x81a00000 0x0 0x10000>;
> +			interrupts = <149 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&saplic>;
> +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
> +			clock-names = "usbdrd30";
> +			resets = <&syscon_apmu RESET_APMU_USB3_D_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> +			reset-names = "ahb", "vcc", "phy";
> +			phys = <&usb3d_u2phy>,
> +			       <&combophy 4 PHY_TYPE_USB3>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			phy_type = "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			snps,parkmode-disable-ss-quirk;
> +			dr_mode = "host";
> +			status = "disabled";
> +		};
> +
> +		usb3d_u2phy: phy@81b00000 {
> +			compatible = "spacemit,k3-usb2-phy";
> +			reg = <0x0 0x81b00000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;

This should be CLK_APMU_USB3_PORTD_BUS.

I am also not sure you want to declare the USB3 PHY in k3.dtsi. I think
it should be defined at the board level, as other boards than the k3 
Pico ITX might decide to keep this controller as USB 2 only and use the 
combo PHY for PCIe.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
