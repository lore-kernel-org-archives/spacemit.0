Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FC62F7ADE
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097847; cv=none; b=qh3LB3ZtgO59OuorToS8mCbTyAE+zVCyjMtIp7DR974qG3DUpAfVwXvmkomMzhPhcsB6VcBpSM5hQ9bh9cEzmHp1gewx9ajXSBOAK6xxzeZEUl3gwSbyEYHLJ5CZbCwTTFlyZTEq2DCSGBuDnVExPPqwl9YX+cAfBHmpffgO3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097847; c=relaxed/simple;
	bh=GuDHRV7Wtw4/EUs3qYgLvnTsv99V+ei7MivBMLJNjv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHDceXvHTdR59f/WGPDBPTdwW3y6wUKV/vzRttt4UvQkAYovbERHfloPprZ7aqbRkRelsqL6BIdmmjWnwndXSjTndretk5P9zTE/67RPBz+DJNiwXY+Y75dLMDNkPJm/Cw3l78mM2T3fyJ3pr66V0wxOmU0LLZsP/y1ckPFk3fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=s3fyEkF0; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="s3fyEkF0"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64472ea7d18so905531d50.2
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 14:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766097844; x=1766702644; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNtkMphr11RONSM4Q0l7F/V0bPE7UA2WWJNfv0nmNOE=;
        b=s3fyEkF0ElKcl7XWqQDws/dWGixaqU1TlOe5GmdqWFXp8pobomDkOjGuDafpS3ce6F
         lWFcW/yOPNCFwBqkgsXA1yLA47+wJLoXQg35gvXtQ2z57NjZo40afBRK7Nv93vyfTSgi
         4WmuEfnyzhf0buRFdDBBMCnO6FfSwp2qxg5qdUghcmIbSvS1bSxHafnvy56YS8c0/qQ0
         8gITdOR4evrQhuZrmrFyN5gk74pD9MV/cNsPJ0ACRR1CtSGyx4msLDgWULzg6U9ZZUBA
         v8cK5fw2S24JThMq3vh63OjQUwf/YXlbqsZX/0rTtn7njCEF/VhRwKn0u4JkPpmOSlvp
         VCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766097844; x=1766702644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tNtkMphr11RONSM4Q0l7F/V0bPE7UA2WWJNfv0nmNOE=;
        b=o3ZVlZ3cj+thhSWEGXUj6DYNfT9OZaN1ADzPrs7P3YEHNsDjlqccU/WkBplEJkBeK4
         oz4V1hNTsN0/qvbkuuM5Y48GkL63c4AbywZb6yhRhznW70psYdOCais+J2G2reFgak1f
         PnMegCNN+DXPaAfBJcNqQk/6BS6FNjPBbQ767k+UQAK4AWqX5tNaKtGBzVbGGwsVbdF8
         +bNlzzeztGWyP8wjmscx5w76SFMGOiDk/BamTO0YFXevcmHGjhLaiRmxmogxxEHKkKi4
         2Lw2Pq0nyYq+i2M7/sMSCbBEGTF8W4qq7WWC13V/+D4t0Ax3Jbk3h6NNBBmUslNyHPIr
         vyLA==
X-Forwarded-Encrypted: i=1; AJvYcCVFcFbN4BPOsLr+QnMpcIsLOvO4UfMjWXQr6/Zi68LwinmUwLEElDliKKml24OPPVor3GMkLKqcbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZydnJs25ESyQefQvDnHns1XO/GPwyOP1J0vWVBCl9vJDqRfAZ
	uG2Gy1F8jbyiLOrEH2d+2X/hhlDc+UYqCv4ChO3yDy/kJLnUI3j25SyPY3j1oHL7B2RqG/57WPW
	KhZ5vlFmOpeWdeI3qwQDXIHp8lXbiICOA/xyVskKKRA==
X-Gm-Gg: AY/fxX5RrPAi0A/iYeiovJTwWfsXaf7W262KvvsXIsV+2ZO0DO/DjXXKWljxMwEAhhq
	aL+9Yl3ygxTw40tgsWdWQTBATwxQSBG3b5SdoUS+W05kRFzb4ba6eQ7u5+tcg+Q7JHK0Owrwu2x
	npJBx/7CgSBFb+nIMy9RIbhJ/UCtXUl4wnxRB2vK1ieH/PrhaWIJyRRZSXIQh+jG0xbY5LVrwKZ
	M/9ix4YhtphU2OWBsES7z3e1Tki6MAK0ALYtLQ/G3qwBSmEqgFZVMsLoBayNtMWgPz/+vPf64jp
	NqwIZah+Ci+N9ME7nGllLPJ1rkxmZShkZIImxfdlOjKV
X-Google-Smtp-Source: AGHT+IHr9hpj9uqrYP2d59hszb1BUZgIk82NvUf6gFEhieUb4Vo2pOoa14pKSV9rG9cinvTKc1D+k5JkFPZo7lCJHqE=
X-Received: by 2002:a05:690e:1a07:b0:63f:a103:5d57 with SMTP id
 956f58d0204a3-6466a8398e7mr669772d50.5.1766097843665; Thu, 18 Dec 2025
 14:44:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com> <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
 <CAH1PCMbzv_uggyZ3JLPyWXSwbe2dJAh7jVT64xpM6SLG77VZqQ@mail.gmail.com> <e5d92ecd-6bc1-438d-87ec-96f60d1b8a24@gmail.com>
In-Reply-To: <e5d92ecd-6bc1-438d-87ec-96f60d1b8a24@gmail.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 19 Dec 2025 06:43:52 +0800
X-Gm-Features: AQt7F2oVki_LCRnJdnjikkWlgQNyCWYw-P2aQmvWCPvKClL0oukF3aD3rXDC9xw
Message-ID: <CAH1PCMaRrw1zu41oKpBO+5DpDU2Ri69TQEQa+4tXkZJtEuQDHw@mail.gmail.com>
Subject: Re: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
To: Bo Gan <ganboing@gmail.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bo

On Wed, Dec 17, 2025 at 5:06=E2=80=AFPM Bo Gan <ganboing@gmail.com> wrote:
>
> Hi Guodong,
>
> On 12/16/25 23:13, Guodong Xu wrote:
> > On Tue, Dec 16, 2025 at 10:33=E2=80=AFPM Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >> On 12/16/25 14:32, Guodong Xu wrote:
> >>> K3 Pico-ITX is a 2.5-inch single-board computer equipted with a Space=
miT
> >>> K3 SoC.
> >>>
> >>> This minimal device tree enables booting into a serial console with U=
ART
> >>> output.
> >>>
> >>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> >>> ---
> >>>    arch/riscv/boot/dts/spacemit/Makefile        |  1 +
> >>>    arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 25 ++++++++++++++++=
+++++++++
> >>>    2 files changed, 26 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/=
dts/spacemit/Makefile
> >>> index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e31=
917eadf7562f488d825 100644
> >>> --- a/arch/riscv/boot/dts/spacemit/Makefile
> >>> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> >>> @@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-milkv-jupiter.dtb
> >>>    dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-musepi-pro.dtb
> >>>    dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-r2s.dtb
> >>>    dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k1-orangepi-rv2.dtb
> >>> +dtb-$(CONFIG_ARCH_SPACEMIT) +=3D k3-pico-itx.dtb
> >>> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/risc=
v/boot/dts/spacemit/k3-pico-itx.dts
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..0f9d04dd352f5331e8259=
9285113b86af5b09ebe
> >>> --- /dev/null
> >>> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> >>> @@ -0,0 +1,25 @@
> >>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >>> +/*
> >>> + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> >>> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> >>> + */
> >>> +
> >>> +#include "k3.dtsi"
> >>> +
> >>> +/ {
> >>> +     model =3D "SpacemiT K3 Pico-ITX";
> >>> +     compatible =3D "spacemit,k3-pico-itx", "spacemit,k3";
> >>> +
> >>> +     chosen {
> >>> +             stdout-path =3D "serial0";
> >>> +     };
> >>> +
> >>> +     memory@100200000 {
> >>> +             device_type =3D "memory";
> >>> +             reg =3D <0x1 0x00200000 0x3 0xffe00000>;
> >>
> >> Shouldn't the reserved memory be described as no-map /reserved-memory
> >> nodes instead?
> >
> > Hi Heinrich,
> >
> > Yes, you are right. Using a reserved-memory node with the no-map proper=
ty is
> > the correct approach. I will update this in the next version to explici=
tly
> > reserve the first 2MB.
> >
> >>
> >> I would assume that 0x1,0000,0000 is the location of OpenSBI.
> >> What is at 0x3,ffe0,0000?
> >
> > Yes, confirmed, 0x100000000 is the start of OpenSBI. The size 0x3ffe000=
00 in
> > my original patch was the result of manually subtracting the 2MB OpenSB=
I
> > offset from the total 16GB memory.
> >
> > I will correct this in v2 to show the actual memory and put the first 2=
MB in
> > reserved-memory {} for opensbi.
>
> I don't think this is the right approach. The Linux kernel shouldn't care
> about the size of the underlying SBI implementation. The size of OpenSBI
> also depends on the version and features enabled. Thus, you should just

Thanks for the review. You are correct and I confirmed with the U-Boot
which we are currently using on the K3 Pico board can handle this memory
reservation situation. And it should, as you said. U-Boot
has first-hand information about where and what it wants to reserve.

> let the OpenSBI or whatever SBI fix up the device-tree for you. OpenSBI
> already does that today. It inserts one or more reserved-memory node and
> carves out the memory region of its own. If there's some bootloader in
> between SBI <-> Linux, such as U-boot, then it's responsible for copying
> over those reserved regions from OpenSBI into the device-tree Linux uses
> (U-boot already does). Thus, there's no need to manually specify it.

Agree. Back to the K3 Pico DTS, next version, I will describe memory layout
as what it is on the board.
memory@100000000 # starts from 4G

BR,
Guodong Xu

>
> Bo
>
> >
> > Thanks for the review.
> >
> > BR,
> > Guodong Xu
> >
> >
> >>
> >> Best regards
> >>
> >> Heinrich
> >>
> >>> +     };
> >>> +};
> >>> +
> >>> +&uart0 {
> >>> +     status =3D "okay";
> >>> +};
> >>>
> >>
> >
