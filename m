Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A804E3E4C98
	for <spacemit@lists.linux.dev>; Wed,  3 Jun 2026 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780518504; cv=none; b=tb5amXq6qSG9dMbeyzvuGERhFjfN9tfeNsxjOUKHYgfLaRIIa15bTgR1ChfHqJx32eO2sCrca3FnDD8NFNW9ByeDJ7NjShkVGsNM2rfzeWnFUzmEHICyDoJ+gQRMJnWxYjdMSCLPoXdnW1TIxlbLHxk6wz03slACHfR5Gg+7kZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780518504; c=relaxed/simple;
	bh=XYunRdMmAzqUsQMnnJO4P8x+6tdzgJ5ccjupNfcQffo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aM1MNzWcjjWbn4aNVLwoR4c/25JV1DiCSCJkwGdrBJvxpxRXzjvPQ7ikIMmWxuKYcXjepAUY2fbBiCuFYc722AGPNUSZM3MZquUtBjqDkvdK1EK1tpVZ22mIeb6gCeAYPJ5aL/r8x7Ot0X8M71xSlj+fqKPg/SbpSgKtVaJcQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=MnHl7vsX; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="MnHl7vsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1780517888;
	bh=SVSZqLrNktqGcyxLR2Ua1Ku73FMd2lVYF7WXhi+1RiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MnHl7vsXPkKjoE61gw+tZRPVMDzdX7/vPbpNvbu9Y2zweKgL2bKl2L+/VcQ1/Zr8u
	 rWrIDcohxwQSN0yzkE/ewXx46WfqMjjwm4ZWKtzJGS+opUH22IrpsNS1Uc349f7zya
	 iv04qny+mPrK9QFjK0zcRjWsTNe4ROMYfi6vsc3cJK7aSQdd9hfzk5kWO14VQAWSXH
	 X9v1vzvrDLukFbdCo42/zX2anRQgV8bvO8pbCLMGf8fHMykXHjI+mJ+qy03LWXXAXm
	 4hySMNOYCVyGa01QTIVp7aLOFBLj0dFqbqVhpfqmjZl8oOIlS4K+/oOEmgMGy2Ra5o
	 ZeYyO723JfsqA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 0F5B7B220A94;
	Wed,  3 Jun 2026 22:18:05 +0200 (CEST)
Message-ID: <9585b7c7-100c-4d77-bed1-d2b6b25b3940@freeshell.de>
Date: Wed, 3 Jun 2026 13:17:56 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dts: riscv: spacemit: k3: Fix I/O power settings
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 13:58, Yixun Lan wrote:
> SpacemiT K3 SoC support dual-voltage I/O power domain, while initially
> configure to 3.3v, and need to access register from APBC space to switch
> to 1.8v domain.
> 
> Fix the GMAC0's I/O pins 1.8v switch failure that will result a broken
> ethernet driver.
> 
> Fixes: d8944577496b ("riscv: dts: spacemit: k3: add pinctrl support")
> Reported-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> This issue is reported by Han while booting kernel from UFS storage, and
> found the ethernet driver is broken, we can see the message as below:
> 
>  [    1.635881] mdio_bus stmmac-0: MDIO device at address 1 is missing.
> 
> This problem is caused by GMAC driver that unable to configure I/O power
> domain to 1.8v, which leads to the MDIO communication failure.
> 
> We didn't find this problem due to using tftp(net) to load kernel images
> while bootloader already configured the I/O power.
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 815debd16409..2b0bf9cd755b 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -803,6 +803,7 @@ pinctrl: pinctrl@d401e000 {
>  			clocks = <&syscon_apbc CLK_APBC_AIB>,
>  				 <&syscon_apbc CLK_APBC_AIB_BUS>;
>  			clock-names = "func", "bus";
> +			spacemit,apbc = <&syscon_apbc>;
>  		};
>  
>  		uart10: serial@d401f000 {
> 
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260518-07-dts-pinctrl-io-power-1bd33bfe5894
> 
> Best regards,
> --  
> Yixun Lan <dlan@kernel.org>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Hi Yixun,

This property on its own does not seem to be enough to get the ethernet
network port functional on Sipeed K3 Pico-ITX 32GB model that I have,
when it is loading Debian 13 Trixie debian-installer netinst initramfs
(with cross-compiled Linux kernel and modules from -next 20260602).

Reproducer instructions for cross-compiling and debian-installer netinst
initramfs modification at:
https://wiki.debian.org/InstallingDebianOn/SpacemiT/K3PicoITX?action=recall&rev=2

In addition to those instructions above I am using within the factory
pre-installed vendor U-Boot the following commands to try what your
patch does:

fdt addr $fdt_addr_r
fdt resize
fdt header get filesize totalsize
fdt rm /soc/pinctrl@d401e000 spacemit,apbc
fdt get value spacemit_apbc_phandle /soc/system-controller@d4015000 phandle
fdt set /soc/pinctrl@d401e000 spacemit,apbc <$spacemit_apbc_phandle>

I then verify within Linux environment the presence of
/sys/firmware/devicetree/base/soc/pinctrl@d401e000/spacemit,apbc

The same Linux kernel and modules as modified into the installer then do
have functional ethernet networking on that board if running from the
installed system and with the spacemit,apbc devicetree property. Is this
a dependency or ordering issue of the modules, or the Kconfig options?

Also, the more general problem is that cycling rmmod and modprobe on the
ethernet networking related modules fails:

rmmod dwmac_spacemit
rmmod stmmac_platform
rmmod stmmac
rmmod mdio
modprobe dwmac_spacemit

[ 1487.618517] mdio_bus stmmac-0: MDIO device at address 1 is missing.

[ 1487.623815] spacemit-dwmac cac80000.ethernet end0: renamed from eth0

rmmod dwmac_spacemit
rmmod stmmac_platform
rmmod stmmac
rmmod mdio
modprobe dwmac_spacemit

[ 1539.374486] spacemit-dwmac cac80000.ethernet end0: cannot attach to
PHY (erro
r: -ENODEV)
[ 1615.299451] spacemit-dwmac cac80000.ethernet end0: stmmac_dvr_remove:
removin
g driver

Please advise how to troubleshoot?  Thanks,

- E Shattow
