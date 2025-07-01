Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B026A0ED
	for <spacemit@lists.linux.dev>; Tue,  1 Jul 2025 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358007; cv=none; b=hq1ENkRzidObHpjbgMdzSnl2Y0uU61XDUVxpWcnZxvk2xFIajH3I3iopnFFOY3nD/IQI/2eeEqop1WYuSTCll6aqsdniA39LPmA0Kie3yFj7JDzB7yy7JQNHTFcjZP9SbTN2fZdyHUZ5zRM1wAyXzoBg8Tjw54RUngUVqqF2DOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358007; c=relaxed/simple;
	bh=TUPLhW/JmtwEUv3AE6ZmIEitSNuWEsD/cufR7kVF8ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9SgECc2ecFsrloYfXW3bx9GllcQTV3QM8RV4308BglOROWzAiUcFV4MNXX0SLACcUUyhOZ0fDORAoWy2Qk5S0+cE/WM3r1ZEaU9x0yGOBKolTndug554K3dFI1op04IcB/ovKcwqvhv98NYxvGvTB7l3IYobhw2Gt/h+aZgjBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HBXSiM0c; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HBXSiM0c"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e4043c5b7so28830807b3.1
        for <spacemit@lists.linux.dev>; Tue, 01 Jul 2025 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751358004; x=1751962804; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbuOsRMFTiJD9Z73+tptA9tOlUhWfVFv9XwbRhZntqs=;
        b=HBXSiM0ctH96quEMRZsRu+65xZXiz69yttnhIv1647aEcdTDOsymVjhFhDrNbOsSIR
         l9feWbFoXd8MRhAmTEhGrN/rtsmRCVmEl8+vOMZWTET8zMPFkWXShDgaqGxD9mjAAYk0
         31DPMYhIDJW3kiHnQr2Qim2PxjbHIpq6WWDX+mr0ukEFlaKKV3fF5CXAdjcj1XjaSK0E
         eqkPEb1baaN/E0Ah8KTxJY86y9WXEKOW2twc+Jka7SwH4Cg1aqoIEeBXLzvjFk3RdnKq
         yd2IYc28HqaYDndlIDZ0pGInLG/xD/QzV7xeh8BsoEowXzWWe7Y/Q8FNH6KsbDOAokA9
         /2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751358004; x=1751962804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbuOsRMFTiJD9Z73+tptA9tOlUhWfVFv9XwbRhZntqs=;
        b=P57l4biTwnFqOOxz+2o6z/tf/BLxMXAAkC6rcZ1FCJgaqmZOcobMbpi9k+/mqtLsq6
         wUVVXJ1Jb5z13nDoOMPT7DHNz5Nt0/7tLXkfy4lTNYFGc+mtiDxr1j9aMoDL8CrcJbOw
         qLZRJSPT3xvzVdogrsIo4J+Jc4ZjKtI05X20Y4uQgRqwijueXeB3ArN60LPnZQHMKmQv
         9du28Dw/bp2g3xdfMbb26xTV5Pds5fwpMa6zk2KrNOnYaUhjqW2bLZvua+vc/DhHaD9+
         7Nrp4QeHXPZ88Vs5tarK9oapIyPj5DKWyDDZ4n3xlBhF4cwmAzvXF2iTq1GpKTcG8/0y
         O1PA==
X-Forwarded-Encrypted: i=1; AJvYcCW6SrMdp9hUUnEYiDwm7rjb5oEG/uei9oWUPaI0qYsfcpxHVm1F/zoSTVsncDe/lI73fI0978ZECw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXEZz3GI74iOGhgaz2u9MKoT76Djcly1bm7NUln/AX2Nt8QARz
	aNvtZiyR2txoVXHVG4Ks0LF7ejwj2Ady0MesUygpNtnMfFQ/XnLU7UXrpYNuTsBEIjCEUdeS3B3
	XI6xXncWkGovIVVZigBk4Uo1AX1Mx34Rbr169iqciuA==
X-Gm-Gg: ASbGncu2j0papi1SGXb4RNsFHMAG6tB0PLfyUvs6puWJT7NPh5fdh+J/Ok+dk1o1Bev
	4RUMBZurDycdGXS+2NfVtze31WpurXL0DEFqQ59cr50tOf16iRZwdZWLT2sToT+JilfyAMEoaro
	5OhFNFl+BOzv1w5yCTNx5DLebERq7z8CkO3B05wwt4X6yqyClP
X-Google-Smtp-Source: AGHT+IFre+CwhTt7pE+B50luWB9F2Nl0i0HpZdG4/qK3UkvJ4Pwbg0TDxDpw39sn7GQMRaKyZ8jEL4jGCSy8+Dou2x8=
X-Received: by 2002:a05:690c:30d:b0:70f:84c8:312e with SMTP id
 00721157ae682-7151713d346mr246421247b3.1.1751358003665; Tue, 01 Jul 2025
 01:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-6-ab6ee9171d26@riscstar.com> <a329e8a9-d581-4af1-ac0f-9f104a810bc9@kernel.org>
In-Reply-To: <a329e8a9-d581-4af1-ac0f-9f104a810bc9@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 16:19:52 +0800
X-Gm-Features: Ac12FXz5TtaMdqHj-qXiGBKlygWCWhHUUNjiyvuAFFCHITTv4zQR9b39KeOkZO4
Message-ID: <CAH1PCMb8OKiqT1R0mHSU1RFxcJvd6VyFyWJWhhKpWc5nKvTi3Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 3:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/07/2025 07:37, Guodong Xu wrote:
> > Add PDMA0 dma-controller node under dma_bus for SpacemiT K1 SoC.
> >
> > The PDMA0 node is marked as disabled by default, allowing board-specifi=
c
> > device trees to enable it as needed.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2:
> > - Updated the compatible string.
> > - Rebased. Part of the changes in v1 is now in this patchset:
> >    - "riscv: dts: spacemit: Add DMA translation buses for K1"
> >    - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1=
-0-c0144082061f@iscas.ac.cn/
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts=
/spacemit/k1.dtsi
> > index 8f44c1458123be9e74a80878517b2b785d743bef..69e0b1edf3276df26c07c15=
d81607f83de0e5d57 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -591,6 +591,17 @@ uart9: serial@d4017800 {
> >                               status =3D "disabled";
> >                       };
> >
> > +                     pdma0: dma-controller@d4000000 {
>
>
> Oddly placed. Is spacemit not following standard DTS coding style orderin=
g?
>

Oh, I see the issue. I will fix this by ordering by "unit address in
ascending order". Thanks for pointing this out.

-Guodong

>
> Best regards,
> Krzysztof
