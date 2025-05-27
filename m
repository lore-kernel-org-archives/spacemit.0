Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE395149E17
	for <spacemit@lists.linux.dev>; Tue, 27 May 2025 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748314113; cv=none; b=eda2+1FGUnHPyWNsOeEDBUYkf3bo/P913WCC37cM0Il1MDW9HJb1Cu7CrgtXjQxRF9xhqIYOdCS49DrLYMjzPlVki+2C7sK8zkr7oU1lEzPDhUsBFDRtRasEaqYXt8KqmjUB7b0L+Q3BQmCUZFJ7LaOA65RwaGjo5ZboxlUh2Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748314113; c=relaxed/simple;
	bh=1sIkGvLRc4q9F0wAGlww0AgdOxuNbiq/W5VJZQg3ebE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICd+JDYn4wCK3exJHsNadcpFKEEU30MSbIrrJ8IF3Lkq4SItqWBy/134eRc4/8hRV4SMJ5CuZXydyxr2KquamgQX8CV9BDezrgUfW3N29WHl1+TzAHOsXEaDn4Wo91d8HkjHV2qNA40Rqs72eCFXDWf9qRvv6vCXXzVOxQbht/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QK5/Np4p; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QK5/Np4p"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604e299b5b6so1916535a12.0
        for <spacemit@lists.linux.dev>; Mon, 26 May 2025 19:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748314110; x=1748918910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxISWGK2XQPkm4Hhr1US0gvD1FZ3zYyiGOuHAQJE5eo=;
        b=QK5/Np4p+btJo7UV28U8wczj13UZCD8u5yptjRBF4umCmbqRKyPg4o3aqqsCK2FeEB
         ZLwBZiyl8xwods8yl4d0xq0+9Z0V9d0kSKhSorgdGJ6/k+/p2LEa5zYIrcWTcu4nTz6g
         B9GEmDRqfHwAMhCihHrrCSwEsvfvWoUskhd61RqP0t+/boICBVMnQxQh1vgzvKJNBDUZ
         ilautJOBrRW2Z5qche72vuQC2C5sC1zC8+TFFRdKOt5QgIQk5Flq3W6weOnR4E4NSr7R
         s9803/DljJ8DCcTk6XVkjheKh1C4AXKWfkWRc60NML3sS/4fhbAF0IqPbwl5T+re9sLt
         nnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748314110; x=1748918910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxISWGK2XQPkm4Hhr1US0gvD1FZ3zYyiGOuHAQJE5eo=;
        b=WIe8JhHkTbQMfBMtYy+MCBp2Pqkv1yT/EO+1MlKUV4lEszHIiMiAqldP1dGlixo8bw
         xoE3Fc7hx1GeZmFxdHObUAN9ZMu6ZStBB1ye5Cyw7a8QAYDqxijaWGe5SlCTg022wc/o
         EByU69Uwd1wCKEB9d0pDIX07L0RAThRaa8q8pl0PfWdX4EJDQjkEX/Ca+zAEwhXs607g
         TIKQB/OF+A5+6DGd8pviR5CO/GQyRcKoBKby58EbqfLqcnzosVO4zalcFH8jJLRSc5ts
         A7C4nLqnIVEeGFt69M4MteZCvbVWmZ/JfXN5WVkersQVkHhPWlEy+tXsAxS3BKnNPL8L
         s47w==
X-Forwarded-Encrypted: i=1; AJvYcCUbWZQ/ch63+3H+01ezsyUB4CRV4r8+MmXIeHURFf0qvPrtbUYt0VDKD6sg1ihzJaGjeUj6vpCqdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YziNrJawveZgLPO6DCmQLZUWEzXPsuKveFyJj0OV+zcsr24rso8
	Ald/oIEn6yY48XtOCyrcF3Ja8POmd5cMYM//xtIjhMiSC0a93eOlbZdCefXMwfDcIByDdfs8ctB
	3PC1OoJQEnlPw7f3S/9wr/LAEtBOAx+xaO5jw6qg47Q==
X-Gm-Gg: ASbGncsoHOLIfVgHKskQfejCy8TDgs7IZdMPbcZig6GjmKl7BTgYHV65mpdaaRCc9j6
	18P7zVUpNAx5AloYGE9v6aNhJBlGan/eNF12Mu0RgSrDV1APtqyofM94KEkbeh9uQM5sY2y+mSv
	oRHD4bN1ixiqp0pWJldcdQwTFMm9bqQ2e21Q==
X-Google-Smtp-Source: AGHT+IGlQnBA51IfLDQtlV4Tsj0DcivukafO3WpRjoRYo7aZ2XNkgT/ISpHO9OKoKdboUS/Oi+TdrQgc1gVBGNRrhUg=
X-Received: by 2002:a17:907:9303:b0:ad1:d0e7:a698 with SMTP id
 a640c23a62f3a-ad8596d8c4emr1099084466b.2.1748314109982; Mon, 26 May 2025
 19:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-5-guodong@riscstar.com> <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
 <20250526215243-GYA53128@gentoo>
In-Reply-To: <20250526215243-GYA53128@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 27 May 2025 10:48:18 +0800
X-Gm-Features: AX0GCFvI_6k3vBVjk-TWBpWmMUcHskFmulTKZz7Kxcz7kFRTgK5PHEc_K-e3F1M
Message-ID: <CAH1PCMZhS4_u3nTdAQDfTTRVJ_61n-OYjmMuv2m4DHYDzGE0XA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
To: Yixun Lan <dlan@gentoo.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 5:52=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong, Uwe,
>
> On 18:54 Mon 26 May     , Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Apr 29, 2025 at 04:50:46PM +0800, Guodong Xu wrote:
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/risc=
v/boot/dts/spacemit/k1-pinctrl.dtsi
> > > index 283663647a86..195eb8874f3c 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > @@ -20,4 +20,11 @@ uart0-2-pins {
> > >                     drive-strength =3D <32>;
> > >             };
> > >     };
> > > +   pwm14_1_cfg: pwm14-1-cfg {
> > > +           pwm14-1-pins {
> > > +                   pinmux =3D <K1_PADCONF(44, 4)>;
> > > +                   bias-pull-up =3D <0>;
> > > +                   drive-strength =3D <32>;
> > > +           };
> > > +   };
> >
> > There is a newline expected before the pwm14-1-cfg node, isn't there?
> >
> Right, I could amend this and fix it while applying this patch
> (so if there is no other serious issue, no need to resend)
>

Thanks, Yixun.

By the way, do you plan to take patches 3 and 4 of this series into
your tree? They only apply if the SpacemiT reset patchset is applied
first.

BR,
Guodong

> --
> Yixun Lan (dlan)
