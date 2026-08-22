Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529A49364A
	for <spacemit@lists.linux.dev>; Sat, 22 Aug 2026 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401994; cv=none; b=Fy6jGi8sx3NhK84/gZzzyJZHthm6hJJ2epOegnxAklqhrb4fNX35BDxy4bNe7ZCwPeQ/t8I2iC8XM48K50PUi6OvH8D56eoTR7Lb7XSKoRSsmZz0mF0zVoAxHyK4HSC+K+XT5KZyXZfSdkLH82tXOfsw9ocssXbTE14FbOcT2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401994; c=relaxed/simple;
	bh=Uw+TK3EgJNgltpy0OWy0qdquWNHbs0IQEHSfH/QkdGs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUeigO9GJeVonQLXupFlCBEybKF/q82TYIOVNYJeTy8ayJTl9iH6CA+DhG5ccMrXj5fVPQ9mcPmizqP3Msv7xo/yUumOchCmkQCk1uIytUZSleywFzNGcHt30OTX5bVRAnJMU8LCoeM//naAcLlUzifL4QseYzHRVe4/CeFVrU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHKT1/yq; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHKT1/yq"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1626078a12.0
        for <spacemit@lists.linux.dev>; Sat, 22 Aug 2026 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401993; x=1788006793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfHQG1lWh9ZlhxyhVuyS3JBvk/o8rp8H++Qugcq4y9w=;
        b=FHKT1/yqpzgqe/qzibEdKtpDgW8XQhlW4A4VnESs+EhiJLjJaV72ZTflmWmOqCIcgJ
         e/XvKzpUX5VkrFSTU2CskfmR73yxwjAxrHazav8kIZuLwGtpWZ8IqqqncLMIKqM6njxg
         XRs5bHnY/6u6nRZUJm6WrFeEMkX+9/k6cUhafb3CN7vl653ZiT0y2Np23nQqHBFBKbGy
         4uYF74iCYE9NlLtRL6na41Nxa6QAiEJA78x/UqvDKrYpKfQDdGXa4zLXQvaCjOmLoIyR
         9bYBVRpc8pbpDH0aE5ly0A4Y2x0sI5yV7hcynfwEByuANYvnAC0JkILgBEx0qVjTXg48
         KBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401993; x=1788006793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfHQG1lWh9ZlhxyhVuyS3JBvk/o8rp8H++Qugcq4y9w=;
        b=WDR5J+wcE4OD7zo+IwztWDjwq67rDhqjZq0LvFRJJQcbx3Bb7Hbz6FZ9aDNVC6knNz
         a7InLFUNqfZCmkK+CkPU6dpcONjB7f4+GdYHMXtrQX7EM7LoQb54Nad1yJnHe1edZt0z
         Rsxg4ArishKu740ZI9HaCmTvsQWlRXO48fIomyeCjk7HnmofiOGLHzCYwgtJwerWBMEi
         UC65Aft4CqYDyibWqKnubZl3XRkD5nm8mvPwPfgAgVG2mBHYX4CSTh4+j4CbL085HdJs
         IQlniskXuBLKmi+/k332rIo7vjYzr2DgrKhXlYuYXeMfbldiF2kE2Ov5hdX+WkMrbf+C
         2Ydw==
X-Forwarded-Encrypted: i=1; AHgh+RravGJg2oEO3bpaiKp7fhwjNAVp0IWYg1BAJjKso5sY8KcSAUguFFrYJeJhLGc4Onpt9xci+4sDLw==@lists.linux.dev
X-Gm-Message-State: AFuF++nVopGhHR/2qCnx5cLu9goKFssDkc0xdSuQmHKgolIK4mWozKgB
	sQqzHjS0yPAYCIj9ZG+ekpYxIeYz99QntoOJEFCLD/rUw65MYbv/oVt6
X-Gm-Gg: AR+sD1199ckjjsxzdkok7l8LN7WBquFAzM0eulrlmQrJAB0f7K7/pQZc/xu6X+j/19Z
	3xSjqTpcv/fB8kUFT4pSHsMPheK5rKHjY1B+kZd2rr3EpNs3VfyqhWDg22CeQlYwHzenDzRL0NZ
	+GY42B80iVuBgJqqsEMQ4hOaaM8S6ZTl0hBoA/V6tAV2swQQc1MZYFnajTCEbHwdvT0eZ1xEJOA
	al1ni30lAbAR/1JJHvP22s3lzAlV1C93EI3nOOuSZcyBjLwbZ+PnOrHYIf01PJ+p0kCIdWfd2CJ
	nAM0o1me474ab7uVvajZ1a7EjT9S69jiRjS0BCgDIcwAIOITImpzGhX6unG/XMcUCHC6XXEhbd1
	KBUWsF4/U3g1LEfQ0vw8W+j9Hq89XYWDeirFYwiA49eMa2nI4QpKMt3qb5UaJ32nf2bkggyE6BY
	r7kGjYESkXSyqPCxSXyufcLrqXNfRqRc8RQ7tISkzkx+HhUaqqmnuKSPczb8I=
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-395c4528324mr11764124a91.0.1787401992755;
        Sat, 22 Aug 2026 05:33:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af6e88sm2619008a91.9.2026.08.22.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 05:33:12 -0700 (PDT)
Date: Sat, 22 Aug 2026 20:33:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <aomWjQGk_p84pPD2@inochi.infowork>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
 <20260819162115.2252812-2-aurelien@aurel32.net>
 <aokGbT7XTCbxUQzl@inochi.infowork>
 <aolt6CaL9b6p8A8V@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aolt6CaL9b6p8A8V@aurel32.net>

On Sat, Aug 22, 2026 at 11:37:44AM +0200, Aurelien Jarno wrote:
> On 2026-08-22 10:17, Inochi Amaoto wrote:
> > On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> > > On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> > > either be used for PCIe or USB3, depending on its configuration
> > > (spacemit,apmu). This configuration is defined at the board level, and
> > > assigning a phy line to a USB3 controller while it is configured as PCIe
> > > results in an "Invalid PHY mode" error.
> > > 
> > > Move the USB3 phy at the board level, the as it is done for the
> > > submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> > > there is one phy per USB controller.
> > > 
> > > [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> > > 
> > > Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> > > Cc: Inochi Amaoto <inochiama@gmail.com>
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
> > >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
> > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > index b084a35aa00e..171bd2f40aa6 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > @@ -328,5 +328,8 @@ &usb3d_u2phy {
> > >  };
> > >  
> > >  &usb3d {
> > > +	phys = <&usb3d_u2phy>,
> > > +	       <&combophy 4 PHY_TYPE_USB3>;
> > > +	phy-names = "usb2-phy", "usb3-phy";
> > >  	status = "okay";
> > >  };
> > > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > index c3f2dce0969c..3e24054d2084 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
> > >  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> > >  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> > >  			reset-names = "ahb", "vcc", "phy";
> > 
> > > -			phys = <&usb3d_u2phy>,
> > > -			       <&combophy 4 PHY_TYPE_USB3>;
> > > -			phy-names = "usb2-phy", "usb3-phy";
> > > +			phys = <&usb3d_u2phy>;
> > > +			phy-names = "usb2-phy";
> > 
> > I suggest removing this completely as we can not determine the
> > phy we used. I think it is suitable for setting this in board
> > file only
> 
> Yes, moving all the phy definition to the board level is an option. I 
> decided to keep the USB2 phy at the SoC level, because contrary to the 
> USB3 phys, there is a one to one mapping between the controller and the 
> phy. Do you think it is a wrong assumption?
> 

By default, I prefer to make the forgotten thing as an error in
validation for any flexible field. If you leave the default value,
the forgotten field will lead to a downgrade hardware (or maybe
broken hardware). So I prefer to remove this rather than give a
default value.

Regards,
Inochi
