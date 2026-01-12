Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA9333C1A2
	for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205662; cv=none; b=lyEdjagIE5vUgq0Ni9Kkmpt9To2Lfhrhx6WBQfCcFLaxLCo7QW8FATPp5qEf/TlenisneCsLOOO1E33nr47Isb8iMyLx1gqgHQysoVLmcXMKlYED0LzwMiXSIY3fM/8pm+E3R5ZHS9hasmwOrsK76i/8/PwxalGi3nQtLJsDU1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205662; c=relaxed/simple;
	bh=VYy3AjnDSWMpdYMiu5+vuTaZIbRUvnr7IoGcdtG3324=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXL8NczgJE2gmjpNA0N5GIBNm9hDfR4CbdfkMVYr5myb6faxhsaukJpdDMis7Tl5VnVQf006Gas4y1eYv6/Z4bGvjgdGKaVqm1Nhvc7XqFHNMY8uxsYhDq9mlI3yT4DHeaKrnuleN/AuDrsty63sRtGOi0o4KZmI5xM6IrBb8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fa2COZ4n; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fa2COZ4n"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78e7ba9fc29so64398047b3.2
        for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 00:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768205659; x=1768810459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdHYyTf8yNUB9PUhTyJBW4AOfvFKsuolfjygPMMLYzM=;
        b=fa2COZ4nt/eKZOz8zwd0/tnCm+DkCywtHIlRsffsPG4/6869fvNmtZSRNEqVzdAhcG
         ake9bPceB/P82Z4XOI3/YEUUPWjvIYg5IQObmH9Q6k+1a1LwQpjx6ztc8/iz1Y17yuYK
         Zs/+saKpsDrjQIbkiZGwsfapQaRFSmZl54k9upm2HqqQ4x2JcxSyo+sgiT/gRUm5/ORM
         3Q0PneAhik8XDcvkw+AtSq5HgfD+OjYp85muZLVt5QY5eYcwKCOAuN80O0b6N29HL5c3
         7MzYS7fKsdaeDsCv/PbAc3rHZPT33N/xm0TVrBGKtXAhxlpT8/zci17LfdBi5iZE6rEg
         YXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205659; x=1768810459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdHYyTf8yNUB9PUhTyJBW4AOfvFKsuolfjygPMMLYzM=;
        b=IcsePA/4LjzxG8eCG9iOexckpe0KoynMxNn/kkO9KyCJ+jgmAf4R7lhHwxOO5gFtpi
         tGkN0jMo7/ADycS5w3TyK58Aan7OUy4vB4QUn3v2ecSd1AY31Migk3P+6omC4uEOwJu5
         wo8j72HyXdYDYKIDQc/Yivg+OPHDkuiYKv65VSOx1v2BoDLPVBsn/m+zfBp0YTiS6agj
         tIZbiUcXa+vhX03pxP2TCnuLLSSaETnuSxuRr7H/7huGQRrlGPbLzc/8j3Fa//JXevog
         mk6MGgj5dRzJR08eu4Xfz1xjVcPnesQRNyKDAum/gtzl/m3RYOMijJiX4Z0NI6BB8u4W
         JHNA==
X-Forwarded-Encrypted: i=1; AJvYcCXLRdYUPZAGoy9UoMjA7N1PwIh57Maxz/8GrtnGNiS2QV3zOIAvNNVjqngBbMsAFtmp0J1uCGQG4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ7TTp+XWrYPCD0vVEyGfCx5LZRuiYYOeYVeE8NKxY43NsBfEP
	QmpYs3GRv7SgIcWTAR+OTHfUy8gao2bx52JzRKVSXBvkzI8JC2Nad9Um9i5KkQlizJDkeX/F/2L
	n0mV1U+kRCGepPTv2VrxD/BVMMDuP4bzmQanD7tjv6g==
X-Gm-Gg: AY/fxX5a5b+BvsTUb5HXp5pH1t8AxEl6L7gYwTII8vGAkyH3FvYfkqHweRHvRx6yZZP
	2KJLrTiu9J2UR1gkA6N98ne+lPv8qvBuqepTBg8Q9+UlKg4yAXKjnNZbsp12EgGvkUSn5+NLF/f
	pFW2/+KEfcw/wvUHhkKAdFrp+RRT11tTu2NVUzXmDENhfmqRjfNkPfuFvwOAp2Fp6eARh9QWz+C
	NuEhnk8juOx8vEGrEhB6eUbAZqi04tZUiVuDGQF3SuOZW2IQrVU5D0am8ulJamDI5Q1WL0KrBs+
	+lCzDSofd7gs6So/XbEThaPB3dCHnIqaG8Eq5RZGwGLmSkeil6iwQ9U=
X-Google-Smtp-Source: AGHT+IGaUMti/es8KDCK9VKF8Pq/ZGqb+Pn4kB7n8HEpQA0mof3jCeBYsxR3EZFKC9/bg55lrEWXaPLSWS2ilkC4UcA=
X-Received: by 2002:a05:690e:13c3:b0:640:d255:2d6f with SMTP id
 956f58d0204a3-64716bda139mr14249893d50.34.1768205658908; Mon, 12 Jan 2026
 00:14:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-10-d492f3a30ffa@riscstar.com> <aWIi9LFdqSF3c-FP@inochi.infowork>
 <20260110110502-GYB12783@gentoo.org>
In-Reply-To: <20260110110502-GYB12783@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 12 Jan 2026 16:14:06 +0800
X-Gm-Features: AZwV_Qhr0dttuBvrLtxWYoEzTqFnHiF6Qe7y0CQjr_1X00MIdkxaUixcgPpB4IM
Message-ID: <CAH1PCMbh4f1fcZ1sUWGtYoZCH_G1x626rb7YvoNTnKjfm9znXw@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun and Inochi

On Sat, Jan 10, 2026 at 7:05=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 18:00 Sat 10 Jan     , Inochi Amaoto wrote:
> > On Sat, Jan 10, 2026 at 01:18:22PM +0800, Guodong Xu wrote:
> > > SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
> > > Add nodes of uarts, timer and interrupt-controllers.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > > v4: Fix missing blank space after commas in compatible string.
> > >     Add m-mode imsic and aplic node.
> > >     Reorder properties in simsic, saplic, mimsic, and maplic nodes
> > >      to match DTS coding style.
> > > v3: Remove "supm" from the riscv,isa-extensions list.
> > > v2: Remove aliases from k3.dtsi, they should be in board DTS.
> > >     Updated riscv,isa-extensions with new extensions from the extensi=
ons.yaml.
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k3.dtsi | 590 +++++++++++++++++++++++++=
++++++++++
> > >  1 file changed, 590 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/d=
ts/spacemit/k3.dtsi
> > > new file mode 100644
> > > index 000000000000..a815f85cf5a6
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > @@ -0,0 +1,590 @@
> ...
> > > +                   d-cache-sets =3D <256>;
> > > +                   next-level-cache =3D <&l2_cache0>;
> >
> > > +                   mmu-type =3D "riscv,sv39";
> >
> > I think this should be riscv,sv48? IIRC K3 supports it.

You are right that the underlying X100 IP core is capable of supporting
both SV39 and SV48. However, not K3.

> >
> I would second the idea here, if the underlying hardware support sv48,
> there is no reason we should limit it in DTS, DT should reflect the actua=
l
> hardware.. if user still prefer to use sv39 for simplicity, a "no4lvl"
> command line argument can be passed.. see
>  arch/riscv/mm/init.c +860 -> set_satp_mode()

I have double-checked with SpacemiT, according to SpacemiT, while the X100
core itself supports both SV39 and SV48, when it was integrated into the K3
SoC, it was specifically configured to support only SV39.

In this case, the K3 SoC's MMU is configured for SV39 only, so mmu-type =3D
"riscv,sv39" is the correct representation.

Best regards,
Guodong Xu

>
> --
> Yixun Lan (dlan)
