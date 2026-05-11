Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D313BADBD
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493237; cv=pass; b=n8DMyuv57pOhNmltWIf0mfx2hQBPx9aJzvxLCVCTZx20RGnQLjEy2x/inB104s69UbKBLWuuh3fRPhT7TZrIYxS8HGlfhvDbwECA4FtwbM09+zf4aws3QoL5bkZZQLlZUkd/+DpgdYicWvpps/EnhAqiZWgVFgQiQ/OJ2rkQSrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493237; c=relaxed/simple;
	bh=OftHF98utKe1fDefYZB9XhEpzmYB4opOcaHJtqbq5xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9LKSOEnsl9Zm+RpgFjsDX7VED7XaqJZS1lVd3vM6MaVwAcDJBHhz6Fn67o8Yh70OYhAHB6r02VsVhbHnDiPoNatSSQQKrP9GhgwbzonMTpQ+Oqtg4qQXw8fZ8mZONsnJOFzGRqVp2/vUiVryTsB6Xzq9zqaQMesfy+MJgg8+BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHqGs6gR; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHqGs6gR"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so4628925a12.0
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 02:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778493232; cv=none;
        d=google.com; s=arc-20240605;
        b=hEqT109ydhQ7Oq5PBbsEXvKTT91jUPfGvQIrJPaLx5kL+MvPuS1MjtmTRipNhKzrCw
         DCVkGvFVAlnJTGyj9i93510dZCWmPEwfOfy4zlve7u6dY8p4tyJFyhad3Q0kHOKAp4Bl
         aNuloYhdi7osOpyArNh16+FGJSN4RerERQEBHXAnH0pSrhli4/nCyBtaiB+FVCXCu7WZ
         luHYq3RuVrZKD858bk0rlEQY6rhRCIWW5kbdh+U8m1MBvzB9YWfBGoQLLz2yTHkvRd1O
         gCAGjIQ2u3Gd4VcMwdFICY1+JmuIhL0Ru8GIVMgm7O5KN1QeNVXJXBBe1yJ6WtXvHiuP
         BSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        fh=tblBcdJGGB9og4Ujik/YWaEp38vWgy6ikdxrcUMbfgg=;
        b=W14hwUVfjwD3W0hefqxS1m/gFqpcYV2CWgv8gQqPk54UrN4p/LF/jAvnY0zL9BmOuN
         Rm5aV1aKZblThwCQgb3+f/ytEHAUYweMNLHPIhO1sbRBhTTbEw2r2Gxy9uE75Rp2z/WJ
         Oco3oL5WQTQTtJ2qMct9uZ/yB7HF+z5ArLsBMzqFk1immfvXtK1oQLejFq0vQcGJ5wfN
         r4giw4xxEdCjD2xMdTFXD4Xuo/WFsa5oxSWXkCxC9cfvm9HW5EPN6BZT63F9xlEgmSJd
         3FJr13rwSz+hqH/752xq2S9r0NVHckIL0l7XjMQNvn+gBcvFqH8LZuC2A8YLquqvqF9+
         2sqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778493232; x=1779098032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        b=FHqGs6gRPiHxRm5o979cGJI3wcS0pL8ao+p9Ean8cZG+OmuKUso6nh9CzC0de/iNul
         6bIVVjl8pO1B9LLVIezp9HCiqPPcI7mXfAkumh62yg6V0GOxqfidsGIw31R5Tp+uaCmm
         Zj9mpavufWFSQlGVABZmWfL3TcsoCAIk7nDKgwbXCtOHC/jfUXJiz/uBH9bLLLVE82zW
         j7j6P9uOwS+wxCyr6pNXCUbfInvioiMLEKncGXJH7VBrYYHVrIDjOO1eiadd7s9GMER5
         QVNH23FAuW2mkYpHuSGd73DyL2zKGlL4W2B6zR/MIj2/SR/yqy8RvYHbXOLX7gqQYQKm
         MolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493232; x=1779098032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        b=Jm8fOE0ORmQcfpcx2gNx/zHRC9RO/xqq81f1qMliR9PzSf7brcOL/QLL5IqgdEtzGe
         xwDBtHSm5uM8WUpg6aSHlpQUiXZuMOCngu9W69jLfaXRrPU0mNZd/7yHXSYRJs5lQwhC
         EsZ16MTtzhISr0l4ixQ4uLgWRzjs5/vhTRScFvcY5I/5CXYuaA+qZOrDSAuouGqFwQX4
         btfMvOC0BorflEK4RMX8TFgvas6wrHtLHzOws3MiYsbgVxRSk0iSD6JWW53mGnvWlem3
         ufQIfyTqPPjQUXlsTHHWxfCxOv9DwTsjOjvHymiOh8va2FFrvFnnG9zsbEnJux+DWL54
         egdg==
X-Forwarded-Encrypted: i=1; AFNElJ9FCzKxuCDnNzms6vmCgX5jtAL2TWl6CyUUNnk1HbbbvuofVbwDgQe1vqSrHXgR72NrCClQkkxhzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXHVeHQYIkiz0XLwHGNq9bSkH9tgGcrwIyKrvsUzbydTJzM3nl
	NPFU/I598rgQsY547IWw/vJ1wGcf/Lc1XZxTl3E1F2qpHGZz/oB4QUo4Yx+NUENyciV/MAvMH2i
	PD607orUaheAzTl/cGL4EW0oDmQ7Mw5A=
X-Gm-Gg: Acq92OHiGSPlBjhtimAbvEluBAJMx2leD1a1uLotfvnvBc9X6kiV2tfeaVn8xSzV2ae
	k8/ROmDU+1mPwgm1xWksnjvZmKn9/S+xIc5Q4Iu+EaQmYFOFmfiXzxblvjBUmnu8/ZPmr1cF1bM
	gcWxqfsdBxOEDyw497D81R3dw57m121fynfHU23L6qvAUthBChpQsNFHDzVjXpoXtEb/VHOuWEq
	Zs/gJggNaPu9n6Ky2oP2+dFOZojFPllOnV4cT+xFJ5ZTIl8200FjS503v7gjSfbjPhAcgRV8gEk
	RNBH56A+IUtJ99h2B3Hjtd/zNw==
X-Received: by 2002:a17:907:970d:b0:bcf:1d87:11be with SMTP id
 a640c23a62f3a-bcf1d871b7dmr249140166b.19.1778493231921; Mon, 11 May 2026
 02:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org> <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
 <20260509121802-GKB3601591@kernel.org> <CANAwSgQNgXKitogbhQFcQaTTFtJ2sfxHehOCPdHH51S0a5wcSg@mail.gmail.com>
 <20260511065338-GKA3624147@kernel.org>
In-Reply-To: <20260511065338-GKA3624147@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 11 May 2026 15:23:35 +0530
X-Gm-Features: AVHnY4KbnlDceZWMAiIkuvkcFalGLhmIPDWMJqWZnt6VcLlOiYENy77kljjTReU
Message-ID: <CANAwSgTXo_ZO5DhK5BwLvCFXqsJ0dwmXeA6o-TebW-A87Y8+-g@mail.gmail.com>
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

On Mon, 11 May 2026 at 12:23, Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anand,
>
> On 20:48 Sat 09 May     , Anand Moon wrote:
> > Hi Yixun,
> >
> > On Sat, 9 May 2026 at 17:48, Yixun Lan <dlan@kernel.org> wrote:
> > >
> > > Hi Anand,
> > >
> > > On 13:06 Fri 08 May     , Anand Moon wrote:
> > > > Hi Yixun,
> > > >
> > > > Thanks for your review comments.
> > > >
> > > > On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
> > > > >
> > > > > Hi Anand,
> > > > >
> > > > > On 10:48 Sat 02 May     , Anand Moon wrote:
> > > > > > Define the system 5V fixed regulator (vcc5v0_sys) supplied by t=
he
> > > > > > DC input. As per the schematics, vcc5v0_sys is the input power =
source
> > > > > > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulato=
rs
> > > > > > to correctly reference vcc5v0_sys as their parent (vin-supply).
> > > > > >
> > > > > > Cc: Han Gao <gaohan@iscas.ac.cn>
> > > > > > Cc: Ze Huang <huang.ze@linux.dev>
> > > > > > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > > > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > > > ---
> > > > > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 +++++++++=
+++
> > > > > >  1 file changed, 12 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/=
arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > > index 5790d927b93d..9727ecdd9f6b 100644
> > > > > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> > > > > >               regulator-always-on;
> > > > > >       };
> > > > > >
> > > > > > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> > > > > This will fall into the catogery of "non-controllable & serve no =
devices"
> > > > > see similar comment for 'reg_dc_in' which raised by Krzysztof
> > > > >
> > > > > https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@=
kernel.org/
> > > > >
> > > > > or should I ask, what's the real problem if regulator has no vin-=
supply?
> > > >
> > > > If the device tree is not configured with the correct power source =
it
> > > > will affect performance.
> > > >
> > > Please elaborate, or provide enough evidence to prove this, because t=
he
> > > conclusion you gave here contradicts with what Krzysztof pointed out
> > I don=E2=80=99t have the schematic for that board, so I skipped replyin=
g.
> >
> No, you didn't answer my question, I was asking why "affect performance",
> and you just gave me the opposite conclusion
>
I tried to justify my changes according to the schematic I understood.

> Let me elaborate, the reg_vcc5v0_sys is a regulator that has no software
> or GPIO control, so no need software control from the kernel/driver persp=
ective,
> which also mean it will be automatically enabled from hardware perspectiv=
e
> once the board power up - "non-controllable" in Krzysztof's reply
>
> the reg_vcc5v0_sys currently only serve as vin for other regulator which
> is not a device (e.g not USB, PCIe, eMMC..) - "serve no devices" in
> Krzysztof's reply..
>
Many development boards follow a similar regulator structure, with
fixed regulators assigned to USB, PCIe, and other internal subsystems.
This design is consistent with the semantics diagram, so I=E2=80=99m not
introducing anything new.
> and by introducing reg_vcc5v0_sys, kernel driver need to do additional
> work to go through probe procedure and register the regulator device,
> consumer depend on it need to wait, this will hurt performance, slow
> down system boot and even consume more memory..
>
No, it simply defines the power hierarchy to ensure that each device receiv=
es
the appropriate power source.

> By dropping reg_vcc5v0_sys, it will result as a stripped power source
> tree, this is only downside I can see, but doesn't really hurt..
>
No issue. If my changes are breaking your development board, please drop th=
is.

> > Please refer to the POWER TREE diagram, which provides a clear
> > visualization of the power sources.
> >
> > This board accepts two primary power sources: a 12=E2=80=AFV DC input a=
nd USB
> > Type=E2=80=91C power.
> > From the schematic=E2=80=99s power tree (page=E2=80=AF4):
> >
> > Type=E2=80=91C =E2=86=92 DC_IN=E2=86=92 SY8386J (Uxxx) =E2=86=92 PI PMI=
C
> >
> > According to the block diagram, the SY8386J regulator IC is
> > responsible for generating the VCC5V0_SYS rail  VCC4V0_SYS (see page
> > 13).
> >
> > USBVBUS =E2=86=92 SY8386J =E2=86=92 VCC5V0_SYS
> > USBVBUS =E2=86=92 SY8386J =E2=86=92 VCC4V0_SYS
> >
> > USBVBUS ( TypeC port) --> DC_IN--> 12V
> >
> > In this design, the SY8386J operates as a step=E2=80=91down converter, =
supplying
> > both VCC4V0_SYS and VCC5V0_SYS rails and P! PMIC.
> >
> > SY8386 is a high-efficiency synchronous step-down DC/DC regulator
> > capable of delivering up to 6A with wide input voltage support and mult=
iple
> > protection features.
> > Datasheet [1] https://datasheet4u.com/download_new.php?id=3D1604744
> so right, SY8386 is a passive device which need no software control,
> non-controllable..
>
Not all regulators are software-controlled.
If the K1 P1 power management IC provides 5=E2=80=AFV rails, these can be
utilized to supply internal peripherals
> >
> > I have tried to elaborate as clearly as I can.
> > >
> > > > > Any probe failure or something bad happen? (besides /sys/../regul=
ator_summay)
> > > >
> > > > Not really; the regulator summary just confirms the PMIC used the
> > > > correct power source.
> > > > with te device ip blocks.
> > > >
> > > then I see it's unnecessary to add this
> > >
> > > > Bananapi F3 schematics.
> > > > [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyy=
lv/view
> > > > (page 24)
> > > >
> > > > Please check the shematics VCC5V0_SYS page 4
> > > > VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS
> > > >
> > > > Please check the shematics VCC5V0_SYS page 24
> > > > VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
> > > > which is enabled by USB3_PWREN (gpio pin)>
> > > >
> > > > Plese check power tree page 4
> > > > USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> > > >
> > > > So, this series tries to fix the vin source for USB 3.0 and PCIe no=
des.
> > > >
> > > This is not what I ask..
> > Opps, I tried, but I wasn=E2=80=99t able to clearly elaborate on how th=
e power sources
> > are distributed across the various peripherals.
>
> Hope I make it clear this time..
I tried to elaborate, but wasn=E2=80=99t successful.
>
> --
> Yixun Lan (dlan)
Thanks
-Anand
