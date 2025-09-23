Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F53207
	for <spacemit@lists.linux.dev>; Tue, 23 Sep 2025 01:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758591868; cv=none; b=qCuQs5mRPB1TK13gSAGhRdIOUbrZ3ZswCt+Rjp6aK7GzjQVqI9sJJF9cOU7gA2/8ZuSecoQM2up53x6X/tjJAp0vma9zYvOXeHsMfcmDKwFapRbVGakotJJgkzGFzdLkLTX015stqBFGVmJheooCBDGE4K0z707n6w9BaOnNDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758591868; c=relaxed/simple;
	bh=YG2r7FX0EQ72xa46H0A6wQ+v8sKKfzXoRvvr1immiVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfHY/XTSGB12XUjaNNWl3c2e1s+kJvA4Rp8n2Awq35/K+9Hv7Y4siKKgR9n+ld9f4YQCsh5v3Rd3EE/Ns+VWQqRvGkVLARYIc94f5bcjdfalLtYXrAUmUy+XFLZGuIzdnwhDIncpkL5FsIYzUn3xEZCrjr2jHtnC1M0QOsrRCIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=OVunnsFx; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="OVunnsFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758591787;
	bh=N39OL6Pr7pWEkA5vpwKdJPI+E73Ce/KceXwnANzYhDU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=OVunnsFxAWkbBwlyAx8BDKjZKpFjrE29AjEPDoam0RR4/LwUjTvf2fdakC6mF28yX
	 wAbswvY2Agt1A80rb4xaPMoS7D/FVwaIkl4RSefwrFAuwBivJi9tX8Mk7GxK8bjEYo
	 YnB+HxRfxxZaBHzTVY1iUrHVBDa5gcqWxlQ1Snv8=
X-QQ-mid: esmtpgz16t1758591778t13d40fcd
X-QQ-Originating-IP: Hc+LH0UrY3yVBAKjC/pyw1ys3jmxXTRFpK918+xs/uk=
Received: from = ( [14.123.255.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 09:42:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9024809329057754653
EX-QQ-RecipientCnt: 13
Date: Tue, 23 Sep 2025 09:42:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <2A310AE601C62BAA+aNH7IfsDeD7-Vrxf@LT-Guozexi>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MIXpHopat2IaZcToI7lCE7HiHeS3+Ky2VDHrmXLaPqlR/x1vLRke0obE
	fdLVrHFwnk7Fp9RDPnbzdgq6r/IUxOcEfGX27z4uCLQ8n9kd4noMDU/k6uJ9GAy6Qcfunxn
	Q6KLls5EOiPxOWce5O0157J2EBaCA5DO79sVKTmIBFjdVt55Ytyw9LeDTDtHh18kHmdJ9hX
	rTRqDz9USKbobcopek7U/cKbIaD0KGW6XuMolcR+KImLIArjJY1V+mDm50KiOrotE5eOq/J
	qaMiEkLDODC5C8h4q1enkWpV6/pjpAf3iIatQDPXda1QCqvdB6s9AbSLW6eSz7I3mKyCJYd
	ITLQ4s9Aj+j15SEARhzSfmeBhy/sMGwBKW/3ShPE6qZgBWRg1exwjM6E0W2o8GFa4y/h64I
	QefsoQ3B7PEOaRJh/pIAbOUMf5cyIMMStaK7r3bNSdzuT4mETUtqWVWIifgR4+BwAvyGYeV
	Rhjc8Rwf28tsh8h/J+BNw/msefxPqloLnRL8YQghiwIlxUkNPIpNcLGta3baTmEZ7HUlxvl
	ozivQt215RL0tHLyDYMRX8nOORaERDH5LOt9RKGwm7ie8vMg2Tf6cTWxAhHMvBE7TXDK3Er
	k7dCQyJ1M2yv1qyghAeJuz7bmUwPARkrk8gdnAyMoe5gpSngR5lQo0/Yj/MyZ5EFwZLVAAn
	Cm2Zy8kGDXhcKOuPRO+DngRJFBkbh8Had5i44Kd6x28m3+f+hpepPWwxQc+mVga/Xeykshz
	+8sXg3OoMluxcHgict/8ia+TvCaP9AT0PDDeRHpyV9CHf11ogx4acQ2zdx7tP6biHg7BCxL
	AaXWqk+qsXSu0aQXrMGoxYqRAEt0n+KTXtAjSM6PlnhV6GCTU3wGP+hWP7Q4mzVMXeM7ScO
	4BIl9+NglwernfuENdDEN6VIl0wTgf+jq5/34Mi1NYGNkwd1JUESMfORi+EdxM+XU1/2Tcx
	CGoM3W6xuq3jJEK6c/n9gYgCJGBEhVE0Wz99t7tKA9z3z5hxi7kROscVw8iEUv/LaCYsIrH
	Hvx2t+RPuc1SuhDSTpSkcRzLYzIsErk0gI9jSG/D0C9jcDVdW5ggvTS2wzKf+RUA7GERYgJ
	vH6jTCBtkwR
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Mon, Sep 22, 2025 at 06:49:35AM +0200, Aurelien Jarno wrote:
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
Then you can split the EEPROM into different parts.
Each part can be described as an individual nvmem cell in the device tree.
Some of them can be marked as read-only, while others remain writable.

Documentation/devicetree/bindings/eeprom/at24.yaml +15:
```
  - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml
```

                - Troy
> 
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
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
