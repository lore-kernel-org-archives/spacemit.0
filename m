Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F91A683A
	for <spacemit@lists.linux.dev>; Sat,  9 May 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778339946; cv=pass; b=uDCmJZQbW7oCzY8xdMTpDKdVl3jdLZlfuSvXbKKtifSKMR7qcZUzTfqvf8tkbVSkqFkjhR88s5mTQf2bVne/DJkWPIRradWaB7IOIS6eQOYVGg2UnbTIS1/un07c7Uda5cSu5xIICO/49aX9UMGzHo0NKC55oBJnsZvmnLurDQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778339946; c=relaxed/simple;
	bh=DrWy0y7NveVkzYd9hPpSEEvdYt2saIyWubWUA0UpiTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6zZwzrWyWoY4BTTwX2p4qr7F5LAcvxDF/aYvbptdJyoPkTj5IAtbtJBj47eB6+gpZwyA3ISLWFj6x1U6rHc0AutlIHeqO0K4KxSMBjCnAlw6AknJU6sW4nteAHUgIF79jVxKVuhL4AZh9RqiVJvQ+jQeh+bXdYkqpLWFFrBdxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtV8IqoL; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtV8IqoL"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so4971854a12.3
        for <spacemit@lists.linux.dev>; Sat, 09 May 2026 08:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778339941; cv=none;
        d=google.com; s=arc-20240605;
        b=docuCAP4Kr27OYN0XoTYglZPYXS2P/4m3vVFgfVPn0ir55hY0WNhiGYhzgWumihawm
         yrnVdOIgvC/KCujmX2Dxy3lXnlSfBFTK/iKovm3Y8s80k92PFgi8rUOi52/0JkuuIkga
         FKaVoPYkmJ5Ma7rREshfTrCzlEU5D0Cue0AiC++UtiWv2nBFrP63sK8/roum7xZOqfz0
         mLQsfyvFLkXEeYJyO+Iz9R8sipSYFewVKr10KyYHseu4n41QsMPSZTEhCMDQy7CxfrZ1
         lWeujCnC+nFphTI71z2HFjk3ZJ+LUZf4hGpxY86ngy6igg/Ess4vzBUV4aviTx6ExqiX
         3HSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        fh=HTRrIx5TglQxsbUcGWiamw2C0G08hh6tj7zwUbi1AsM=;
        b=Ech/ZB31lAtqHkGpZyBVTjHEwCJXQb5xZ3EQt1Csg1+slVEyonMVwlYSn0ti22QaTn
         WVWnUpCpzGSI181WyS6LeskpoIrlD5ai38zqCogcvO2KK7/ISxsPGoDflEtZkzNqgF4U
         QHQZwxbMHHvYllI3k+56q5dGme9mSJ5wB4GMhzvdW312xhgSGL42GokpjjFSwTI3v/uw
         HMkFJ2p9l+DqTe7g0CFRd9AEVFF+cOQDk7wlMP8He6w9rnS4A9bW8tqPsE9Ic6bhdyyp
         LvP7ln3/kGoDohj+RVxkZdhGKJ2v8GNHKEJ2L1EQhQ1hNnQIaiwJfcHM4j7V1cs/MqqK
         JiJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778339941; x=1778944741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        b=KtV8IqoLfAbD1BqLQYm1lzzVpBmPYsO+aEACuWOCLFlQDXBmZ5h1qYCJ2TKG5iYkQz
         dLP03aN9kdzBeFQFmmbU1QPQJsAD5nO7zTpT7UjfYFrHAjIw2BgJGKJOKawnf7BfrOl4
         8PBOyvRrTQW6EVcriNT991aONiV3+waQk79w+PMcFsN45KqETF39qsGwGPWpGcNdTVeA
         wZ0t0VkWA9sSn6KWwyLCAFjbSwtdMm9uvI4JZ4CtiJdxNCluoh769r+T6gOPKLuB9nkS
         IuJfPjMa+jpxnkp4KXaesqajrO4XsKilV7UsN4vM0mLAdwokp7NlKGC1VarZ7f/nJ01N
         TRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778339941; x=1778944741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lWC4p6CoR3WnBZepPidUEBffnCrNgpoooO8w4NtuJ7M=;
        b=omfhq6/fdHcBhIcG5WUvY7wZ54E6pj01xz8W7KxxWAxVzMJk6oryxS/3wpVaB6SVM0
         QtSFP99aRJ5Li2foYt2Dj2E9BAOpK4PenyLOfI03dCNQerKlzNNHtADnDIplTTKzN9at
         +pcM80tMpzg1cRx1RYvMtqaZmBYeNeFUAogttp+F8UNiadGDnSrh918sN9Yf66fey6Yy
         DJUTiZXis8DwBCTT8zrkwMJfnJnYNlPrcaTyEPBQ9VfBSZOa0Boqd4/sS5R6xgqbHICK
         +eXlDyhPh0SY3N8QCcFUQXSa2OGn4jLYx8nII0cZKgB6dq/XZeeiN9rK6HTNBOJTFm6q
         0fhw==
X-Forwarded-Encrypted: i=1; AFNElJ9MaXqRs6LCxGNpFzlG8AEN9EnOXlpx94FoQpMXwV0lxNroJF5NJulvjQ4dgHaQKQzHMNzm7U2wSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYfkO+Irg5uNur240Uvomgi6bwnuRzbDB1pFdzbejsDOSt+W/Z
	U7RjWpte5AxeygTUYGo1ZKC4Ge5DJwA/y1x50uMvH/pI+gj5u3VWU/F8de/cbusOD0y5FWqPkCK
	MWylOGJTAO3PIVtw78/3i1aqA1q3rtQc=
X-Gm-Gg: Acq92OHht0uxYfIk1r6l+bCD5ev4SLl6RNL0abcJusl+/3F6Zqv4SNuuWk+KFUWp6rp
	sHxDtb0JzkLT8/o/M/Yo2fVR2pWLkl1OGnB+HpR8YYyk9d6++eOcU8Hc2iAdJ6XZ+6kubgV6vsy
	varmIKRAek5Q4+FGOGWspLQvJPdep+bV6S6L7PNvJfY5sIo5ZqX2nOrN1wzqwndzko32BCmqIvA
	oHPFYsXqhjZByC4on9ik2CFv2U5raR97pMo6s+FN67mUJOGZKEUU1nsxazqErLER7Q04rDkWH+W
	IAq0
X-Received: by 2002:a05:6402:510f:b0:66f:8fbc:c73e with SMTP id
 4fb4d7f45d1cf-67d63d8b785mr8680905a12.9.1778339940657; Sat, 09 May 2026
 08:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org> <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
 <20260509121802-GKB3601591@kernel.org>
In-Reply-To: <20260509121802-GKB3601591@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 9 May 2026 20:48:43 +0530
X-Gm-Features: AVHnY4LyUVJYkL_oLwoNQx2o6mh_XMStte74J_KAFvL20bhQMAlNuMI_2ORcHgg
Message-ID: <CANAwSgQNgXKitogbhQFcQaTTFtJ2sfxHehOCPdHH51S0a5wcSg@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Sat, 9 May 2026 at 17:48, Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anand,
>
> On 13:06 Fri 08 May     , Anand Moon wrote:
> > Hi Yixun,
> >
> > Thanks for your review comments.
> >
> > On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
> > >
> > > Hi Anand,
> > >
> > > On 10:48 Sat 02 May     , Anand Moon wrote:
> > > > Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> > > > DC input. As per the schematics, vcc5v0_sys is the input power sour=
ce
> > > > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> > > > to correctly reference vcc5v0_sys as their parent (vin-supply).
> > > >
> > > > Cc: Han Gao <gaohan@iscas.ac.cn>
> > > > Cc: Ze Huang <huang.ze@linux.dev>
> > > > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch=
/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > index 5790d927b93d..9727ecdd9f6b 100644
> > > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> > > >               regulator-always-on;
> > > >       };
> > > >
> > > > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> > > This will fall into the catogery of "non-controllable & serve no devi=
ces"
> > > see similar comment for 'reg_dc_in' which raised by Krzysztof
> > >
> > > https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kern=
el.org/
> > >
> > > or should I ask, what's the real problem if regulator has no vin-supp=
ly?
> >
> > If the device tree is not configured with the correct power source it
> > will affect performance.
> >
> Please elaborate, or provide enough evidence to prove this, because the
> conclusion you gave here contradicts with what Krzysztof pointed out
I don=E2=80=99t have the schematic for that board, so I skipped replying.

Please refer to the POWER TREE diagram, which provides a clear
visualization of the power sources.

This board accepts two primary power sources: a 12=E2=80=AFV DC input and U=
SB
Type=E2=80=91C power.
From the schematic=E2=80=99s power tree (page=E2=80=AF4):

Type=E2=80=91C =E2=86=92 DC_IN=E2=86=92 SY8386J (Uxxx) =E2=86=92 PI PMIC

According to the block diagram, the SY8386J regulator IC is
responsible for generating the VCC5V0_SYS rail  VCC4V0_SYS (see page
13).

USBVBUS =E2=86=92 SY8386J =E2=86=92 VCC5V0_SYS
USBVBUS =E2=86=92 SY8386J =E2=86=92 VCC4V0_SYS

USBVBUS ( TypeC port) --> DC_IN--> 12V

In this design, the SY8386J operates as a step=E2=80=91down converter, supp=
lying
both VCC4V0_SYS and VCC5V0_SYS rails and P! PMIC.

SY8386 is a high-efficiency synchronous step-down DC/DC regulator
capable of delivering up to 6A with wide input voltage support and multiple
protection features.
Datasheet [1] https://datasheet4u.com/download_new.php?id=3D1604744

I have tried to elaborate as clearly as I can.
>
> > > Any probe failure or something bad happen? (besides /sys/../regulator=
_summay)
> >
> > Not really; the regulator summary just confirms the PMIC used the
> > correct power source.
> > with te device ip blocks.
> >
> then I see it's unnecessary to add this
>
> > Bananapi F3 schematics.
> > [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/v=
iew
> > (page 24)
> >
> > Please check the shematics VCC5V0_SYS page 4
> > VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS
> >
> > Please check the shematics VCC5V0_SYS page 24
> > VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
> > which is enabled by USB3_PWREN (gpio pin)>
> >
> > Plese check power tree page 4
> > USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> >
> > So, this series tries to fix the vin source for USB 3.0 and PCIe nodes.
> >
> This is not what I ask..
Opps, I tried, but I wasn=E2=80=99t able to clearly elaborate on how the po=
wer sources
are distributed across the various peripherals.
>
> --
> Yixun Lan (dlan)
Thanks
-Anand
