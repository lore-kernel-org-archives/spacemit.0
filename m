Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2507D495E5;
	Fri, 10 Jul 2026 02:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783650355; cv=none; b=ZL9jFremSqhc+GGQO3QIyf7SocV5CwrSiN9+qLSBdpjiFPs842VC3AOWy5FITHCmP7loQM8dZywotbObP1eWMewKlOMYI1EwYyfzOFuIImg4wEwSE4s/Tko+cemF70Dl+lwfc0lUrIhudr0ZcFbw1+Co137kgFKhJdvjhjQnV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783650355; c=relaxed/simple;
	bh=GU2VK51tK1PDrBdebf9kLR418fx7mDmOvDe2sDW9onM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV1k7P4cCeZDBL/wqGt+dBOPGkQURW0EuDExv6QhBqfZ/YuIzEJD7HgdPx/fd2gpdsIzlGDaFIi8kOrEnv08w9ijZKIhyULxhrjE3S12hVY6T/onYdUIcM+TRg936bqrdyKzkEye6diCtR7g4DPKApn3W+W3PL9p77Gt/B5ChAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOQ5DQaF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOQ5DQaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB331F000E9;
	Fri, 10 Jul 2026 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783650353;
	bh=IWdxRNQcvqbzwNQ55npFJS3Ygeq6C+SURBr82oQYTf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cOQ5DQaF2aj4ylcwfgro0w5oCT1iPh+MqmXKEZFaUUyAu2Ch0zdFr7I1Xzio4Np9o
	 9PLtwD2OpLN6BOl6eOnBFNQYs6544331Uic2udXo9SFNPI+OL7qGUN5oh9awiBfF12
	 LaHpIorJRpXLzl82beq17UYT22qv4SlhHlrMVR3Sbf4RF3F0gUPbgis765BCh2/Ggq
	 M7Q7ZFmSvcxvttCQ/R+pnSYhJbR9JyFMAJ3TSFS+4rTwhIoL1iiip/Qc/M+pU0BNnJ
	 kMTm2uirzZ27LVOtNm2hh5DwnFERPAOs1Dnn0MgSkOrBMTIl4bHSK39XSrRf+uYJ/+
	 mcp0hqoB3+csg==
Date: Fri, 10 Jul 2026 02:25:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Andrew Rembrandt <kernel@rembrandt.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <20260710022551-GKA106000@kernel.org>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
 <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork>
 <aikmOfazxdrhpty7@mcmanus>
 <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>

Hi E Shattow,

On 00:29 Thu 11 Jun     , E Shattow wrote:
> Hi Andrew,
> 
> On 6/10/26 02:05, Andrew Rembrandt wrote:
> > On Wed, Jun 10, 2026 at 07:14:56 am Inochi Amaoto wrote:
> >> Do not do this, just leave the rx-internal-delay-ps untouched.
> > 
> > Sounds good, I'll leave v1 as-is. Many thanks for the review.
> > 
> > Regards,
> > 
> > Andrew
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> I do not notice any difference with or without this property present,
> tested Linux -next with U-Boot modification to devicetree:
> 
> load usb 0:1 $fdt_addr_r /dtb/spacemit/k3-pico-itx.dtb
> fdt addr $fdt_addr_r
> fdt resize
> fdt header get filesize totalsize
> fdt set /soc/ethernet@cac80000 tx-internal-delay-ps <400>
> load usb 0:1 $kernel_addr_r /EFI/BOOT/BOOTRISCV64.EFI
> # throwaway use of ping is workaround for broken vendor U-Boot
> ping 127.0.0.1; bootefi $kernel_addr_r $fdt_addr_r
> 
> Aside, there is still some problem with the driver which does cause it
> to fail. This can be reproduced by unloading the module and then loading
> the module; built from -next with 'olddefconfig' of debian Kconfig for
> kernel 7.1, no patches.
> 
> # modprobe -r dwmac_spacemit
> # modprobe dwmac_spacemit
> [   61.469745] spacemit-dwmac cac80000.ethernet end0: cannot attach to
> PHY (error: -ENODEV)
> 
> [   91.544646] spacemit-dwmac cac80000.ethernet end0: cannot attach to
> PHY (error: -ENODEV)
> 
The problem is unrelated to this patch itself, but I can actually confirm here

> If not reloading the module then I don't see any difference, traffic
> passes (ping 1.1.1.1) with or without your suggested
> tx-internal-delay-ps property. Is there a specific test to run to
> observe expected difference?
> 

Although I haven't narrowed down to the root cause, but it's kind of
something wrong with the reset procedure, remove it from phy node will fix
this issue..

+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -232,9 +232,6 @@ mdio {
                phy0: phy@1 {
                        compatible = "ethernet-phy-ieee802.3-c22";
                        reg = <1>;
-                       reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
-                       reset-assert-us = <10000>;
-                       reset-deassert-us = <10000>;


-- 
Yixun Lan (dlan)
