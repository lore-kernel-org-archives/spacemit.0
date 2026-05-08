Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39223890EA
	for <spacemit@lists.linux.dev>; Fri,  8 May 2026 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225793; cv=pass; b=JMjh4Ze4UyUWU23zB+ENOD8xnA138tAi/XOxGFqjTpYwuJswddkRZNl0/EFGKKqxz0XboXiLrmRw7NZmIEjvpv2TkpEV4F/T85vv9mW4s8W0O1v0H2k4U8yROwGe9ekPIEEV/CVV+SMCdsMGCdwXKLLHRWrPyQuOoqG5gRmz96A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225793; c=relaxed/simple;
	bh=/9IPBABBlUmX6oVvFKAFFIYxh2fd35YOKdzr67DM7kY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4GXDTrTHcNqYiKIONwRwD3/FXwZ2C+itcF1gj14dOb2aKvUng3991U6JkmqljPDmBC32G8xu7bWyYS0KOcnkU92mXMPgfzBFhme7Np5qxDtZHE8luuXHnPPOTVce4oMTPf3Sa19RgcqcVbwqDRK73F+LZio7DuE0nAf8YCjlfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxxj+y+O; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxxj+y+O"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba699316b42so279658066b.3
        for <spacemit@lists.linux.dev>; Fri, 08 May 2026 00:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225789; cv=none;
        d=google.com; s=arc-20240605;
        b=lHOK18sAUk1+++WDoPMOkTbD7tRsCqUBm9muf2kFJhi13FvxIwoxk4t9QeRk0CXrqS
         4OkP+ASLg+n2cNDZdesJCcK21+melYzFy9DP9w19xfgG1cRdrnfG239n/QOaUTmxWApH
         k5a9PtL5csk9t+0Ny/Co+hn3VvkbjcBmRkpQu0exZp5lf3VEa1zDSKiTkoBOTBtCJMV+
         yGegmz1VJwN339zNVk0fvaeGLKBoEUx+s7W5eynrEiIKLKKWwV62rL1fQSiOC3XsqXBb
         Upp5P9btBlKurGRLrbiWum4boyOXPxGZExumwx0ZsZ3NXP1W1uWvpGIYSfOvOg10rp3Y
         M6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        fh=Xf1MhZ2UKpjHnCmST0NStrnb3hgzZnYYxQQFVPGZrME=;
        b=BsmxF3laarTBSffcQz8Y/uYWt6/tig8VmR+GA+d+I8MHgGHWgsBlaM7HZFZktNe3aD
         1NCN7GXaIMgnPd4unVHp0MctD3UtyWLt5tABOtQ4Lx4YXCfhXQacPKtqukS3m5X44yGM
         ynlo0g9grc7tECMXvtuv//lGHz10mMRFPQs+O7HQoqX0kof2MRnlGirf0O5rsTrEbonJ
         pl6jH36flOG4hWo1a6QEd/mIyvGiPOcRt1aLr1USm/djTHBdytiyd9yEGJNaUDqGV83z
         U4EKEqoz9redVL51hGwdiaGBgzXgvcZYSfjYwUHZlJJYKdO9hmDeNBI4GmL3xPQ1g4Xb
         kBKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225789; x=1778830589; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        b=nxxj+y+OtbpFvQW+DyBgMgmKz6j0JBG+xwnjwMksVSYok3anujjstLb5PX7JSGVzxM
         iVAYsrzTW18+ozsewgFrA5usgiNC1fUwis3gf+6nQNUvb5EF7d8Enkvr81HDjgZhLFP0
         oG1Mzc1pi64h5to0ar4ZASF2NbtnJ0LC3owTHUWMJREiBhExE2Jnpn2vWaPs43+8LFhp
         qi7QFEQ+nsr06w0m1mFc+jFhVnMg28/gAhF4DArhtVLAqefbkNDwjxiQV/pTbHOOfaZ7
         LqT/odSZSA9x5Bcm1fmupyamVdA/FVuaE6aAaU8OQ9ChPudqqHschVhRQ6xYQQ6BniRC
         AL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225789; x=1778830589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        b=Xo7Hw5BrHnYC4EXFaIczkONqrVv6fjSp/l9+3bm45ZvaavzhDBq4j2V61PlBDZFKIs
         XB8k6/IiogYhPeVY9qdBX4H+3O3LJb9wAHKlPu6pMr3x0gl2obOWsoDkDvdasP+nuCdl
         g55Ir+1QIiYNIY0+I8eEveWCpT6UNJQx2JfB0qyfrwr+HG7Dp6rPsDkW1y5gzt/hPNae
         cGWuXGK3TcEDWrxphx9iD4C0Wl66KKwFFlG+rzeiYdQMHIp/7EojnfJWzOVhs2PDa0Rj
         YBNb6030YFcPyQvJDY5WuLWsiSkFZJUN/54TuznSMmMsDq3yYeoEiEzmXlvAfbkdlOfZ
         5yiA==
X-Forwarded-Encrypted: i=1; AFNElJ82pNftS+/ey44iIC2P5ZL9iuyoeRXSapo+jGfbJsy0IioiGkjwUhu+StddGI5nmHyaj6+1vq8ODQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8IcXR/GLkgpSPKjdKJA2/F8jDzW/L4pXOSvCa/wj6234dFh+M
	gG8YtJb7cFy4TWDK4vdNcYthkIx7fIZFHPyG0+cU9IBwCwzCsMBvgq3BZ1vl7QdYgG8kmI0goMl
	3RBW0LuZ1dfIolDNyUbz0s4BaYEuvmZs=
X-Gm-Gg: AeBDieu8+9naD2GEhbdT/C+LWdeBeZRfPhY5v0cRjtrTbg0K5tpByfuRJRHyX57UKsW
	5wsa52MbnDyds7PsUSXwmzbz+vFhq4EYNnglz7K1Fe1Z+L48U/nPU+ekNf9ycOud6kDEvbZdYQt
	fQGZFl5oAuXuivs6wDPyxZFMCTMIEdu3VqaPGW+8isiJ0FQvuEjveGnRNkQyMj+f6l2rfqwi5IA
	pLdk/QF+cw4B8c7WWH9nYLuv9sl6cYWIIq8q1zNuFYU56qpDKFnlrLeZIwEPKbe0xFe7/FvUfRw
	XLwg4xT+lgVIABk=
X-Received: by 2002:a17:907:3cc7:b0:bc4:aafa:65cf with SMTP id
 a640c23a62f3a-bc56c92bfc1mr713084366b.16.1778225787261; Fri, 08 May 2026
 00:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org>
In-Reply-To: <20260507024524-GKA3579608@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:06:07 +0530
X-Gm-Features: AVHnY4KAmj7VrysTgYaoh89w72UBvUEf0oATrqx17Po5ftzAdn9p97hUDfjyrYc
Message-ID: <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>, Chukun Pan <amadeus@jmu.edu.cn>
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

Thanks for your review comments.

On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anand,
>
> On 10:48 Sat 02 May     , Anand Moon wrote:
> > Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> > DC input. As per the schematics, vcc5v0_sys is the input power source
> > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> > to correctly reference vcc5v0_sys as their parent (vin-supply).
> >
> > Cc: Han Gao <gaohan@iscas.ac.cn>
> > Cc: Ze Huang <huang.ze@linux.dev>
> > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 5790d927b93d..9727ecdd9f6b 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> >               regulator-always-on;
> >       };
> >
> > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> This will fall into the catogery of "non-controllable & serve no devices"
> see similar comment for 'reg_dc_in' which raised by Krzysztof
>
> https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/
>
> or should I ask, what's the real problem if regulator has no vin-supply?

If the device tree is not configured with the correct power source it
will affect performance.

> Any probe failure or something bad happen? (besides /sys/../regulator_summay)

Not really; the regulator summary just confirms the PMIC used the
correct power source.
with te device ip blocks.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
(page 24)

Please check the shematics VCC5V0_SYS page 4
VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS

Please check the shematics VCC5V0_SYS page 24
VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
which is enabled by USB3_PWREN (gpio pin)>

Plese check power tree page 4
USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source

So, this series tries to fix the vin source for USB 3.0 and PCIe nodes.

Thanks
-Anand
>
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc5v0_sys";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-boot-on;
> > +             regulator-always-on;
> > +             vin-supply = <&reg_dc_in>;
> > +     };
> > +
> >       reg_vcc_4v: regulator-vcc-4v {
> >               compatible = "regulator-fixed";
> >               regulator-name = "vcc_4v";
> > @@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> >               regulator-always-on;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >               gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> >       };
> > @@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
> >               regulator-name = "USB30_HUB";
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >               gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> >       };
> > --
> > 2.50.1
> >
>
> --
> Yixun Lan (dlan)
