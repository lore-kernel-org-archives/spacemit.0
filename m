Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77612D0C63
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 22:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785019897; cv=none; b=fdBVUT5e173uSPBtXHYUzZOdTt6uFBsGpFitLY87Ko4qOlXDlGc3S4ojhurvQTQVEGGm84l8wmbUowE9ctmVV6aNBtKJQqAko17ZKxVnatZLRKzU4nzTDbVBnn98e8iKdvG/OSu5+tC6K4vkEzySyAn2LLk6zbL/4oIj/6OXv6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785019897; c=relaxed/simple;
	bh=OTMLoaXNmc0daefahm7Ve/Ya1YVd+Uzup/9wVhoFs/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKg/VrHXNW7bYZvFyxV95ueu6+Pugpa3eLsOI7K4w/0sfy6NQb86aVTIWOxWLFYc1y6FK7mnTRtbj/Usl6Gg8N7sw+XlzcYATKYLZRJGunXqMBYWFLXt9D0hzu6AREFBTIpHHFu0FbWsNkOypKAcNFZDZxoPuj4EqbjZQPXNBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0mDnkfn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0mDnkfn"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e347638adso1390798a91.0
        for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 15:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785019895; x=1785624695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e597SzF5n/PM9EkMnGuBBQh4XkUddaPspXC7fYxFtHE=;
        b=I0mDnkfnubd/L9cdp8/7eGe4TGd1ajXyqtU6yf2IZSv1o+OY+voFu2AcrecyEMvNre
         HlpdDH784BvEJ4SWZyM+b9r8/4Xhm+GTYKkiMccJ3NskU6s5IUAXIRZPbOiBu1ZlS+J5
         FTG9gMpt1tOZJ2SHyetCpDlw9gnYKwyoFMVFrO9Zf8aB3FihjqLPvP2Mj8YzsTkBEzdo
         Ub6ov9THG4HUXBos7MreX3kI/KxszjvTi9Pxn+K+feaTuiSfisbsv61Ie2EVeoAT/1Qq
         pgZmLsljnLL9k6gQ+AM2/iwlZtJ9rddWVKB+Vuj+6k5JiecRWl4yvtSuIkgFsG42it3c
         sa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785019895; x=1785624695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e597SzF5n/PM9EkMnGuBBQh4XkUddaPspXC7fYxFtHE=;
        b=azYilJ4OHrcMI6t9c6n19Ycj2m869VZouY3b5W2qX4SReFYacf7vlgFWUq2pGSDXYl
         aZKBfhYSseBl1eqdKQj5mxqQpigDcgdOIoE0rfzBh20Py6C7MhnFmPHqxo/wARX236mP
         rcNLk+Kr4Vlj7V7eukrw/r2EjosIfByJZxd7ucZ30tcYve+xV2PAuC/xj+B+dfV/u5Lu
         gXo1bGu2Hm5zkBAGfEdDCrzo+Y7biUw6tg8xo1ZGevr1hNW84KPsPXe1jr7nuk+R9Ook
         +zJMWb4h1jA57y4sXyakwYQAbVlqUvyBfOe/mgXrPnX4YcgOdY0tlO64woZhJdQ8RrwZ
         U8ag==
X-Forwarded-Encrypted: i=1; AHgh+Rr5/h63qZ4iTByv7buco4bER9AVVJklAVrhmugIBda+Xsz8OPeJ3Xhx5/B/oY3v3GP7bXCXEw006g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVqBT53zu0n+VoviqDoeyG/AO39W6qnaTG5AYq5I72tiOUH23t
	ZsF1FcTLKwy3+UwRzNnKi50IApH2b0e2ZZA3DuGlTI5VpV9Bpx6lV3Yd
X-Gm-Gg: AR+sD13mGllGC1fubyfDvxlHfmDx2UXTuxFawwk26hY4wiRnKU3gsdcsq/0GGmG4Y+l
	24nnjI6lnvTM2tvOGlcbjXAPJDrJ/6rrflokF1HgjSCj6PT1vCSpEOprafYwce2EYm3BzlViNFW
	KNk0SGMtdC7aLAcrAqeNw2Oc9ow4CLdCLM0PN4lKtVnuKE/6qZ6YYHnBZQbd60yu/22Bmx12piT
	bffPMlvMMlUzEdUL2jz9aUQe2yFfntAHvDSSEd10+PxA7xnYqOLIFxGF7xRRZ8MknSv6vTSbXSq
	B8L8Zwbm8TMv0cyJZ9QYBOLR/WgJStB0/CnfwQG5uvatm2C81y2AWt5cNv/okd2phQoGsP+V9AX
	vqdgtTeOohDl3HtnVPuy64wJEj61I/fB36HeIhAhlYjN9BOodUoXdK6BLoRj3WN3PrKyaHyDOKg
	vU
X-Received: by 2002:a17:90b:268f:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f2978b966mr3637050a91.41.1785019895045;
        Sat, 25 Jul 2026 15:51:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm3263879a91.8.2026.07.25.15.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 15:51:34 -0700 (PDT)
Date: Sun, 26 Jul 2026 06:51:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	E Shattow <e@freeshell.de>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Fix phy id check for the phy
 on pico-itx board
Message-ID: <amU94BeIJT39DRRL@inochi.infowork>
References: <20260725005804.373698-1-inochiama@gmail.com>
 <20260725005804.373698-2-inochiama@gmail.com>
 <0d11de51-546a-42b6-80cb-8ca258389a17@lunn.ch>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d11de51-546a-42b6-80cb-8ca258389a17@lunn.ch>

On Sat, Jul 25, 2026 at 05:57:42PM +0200, Andrew Lunn wrote:
> On Sat, Jul 25, 2026 at 08:58:02AM +0800, Inochi Amaoto wrote:
> > Current phy framework can not reinit the phy correctly, as it will
> > assert the phy reset GPIO so the phy id can not be readed. Setting
> > the phy id of board pico-itx manually so the phy id dectection can
> > be skipped.
> > 
> > Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> > Reported-by: E Shattow <e@freeshell.de>
> > Reported-by: Inochi Amaoto <inochiama@gmail.com>
> > Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: E Shattow <e@freeshell.de>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b2a7d2d0d3a8..b9d2de878f38 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -196,7 +196,8 @@ &eth0 {
> >  
> >  	mdio {
> >  		phy0: phy@1 {
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> > +			compatible = "ethernet-phy-id001c.c916",
> > +				     "ethernet-phy-ieee802.3-c22";
> 
> There was a patch recently from one of the DT Maintainers removing the
> -c22 compatible when there was a specific PHY ID. I did not look into
> why. Does this pass all the binding tool checks?
> 

Thanks for this mention, I have found the patch link.
https://lore.kernel.org/netdev/20260323194803.GA1241974-robh@kernel.org/

It seems like this patch is not merge at now, but I am fine to
send a new version for the incoming change.

Regards,
Inochi
