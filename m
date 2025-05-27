Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A12136347
	for <spacemit@lists.linux.dev>; Tue, 27 May 2025 04:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748320607; cv=none; b=cfA150xDVF+dGJqaoeUVuezrzX+gGGszS4pTmLNtW2FKMTuv6hCDnOSxQs/7Xrj3IxLZBBagHaffD83tRuE049GKKKqD69jtMRmGcbGG5T9P5Z4n/HBbB8i8RtREyn3bOgJv3RBE+e4vpBRZkyp1JgQuoAgmgGSYVyqEyg7s4KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748320607; c=relaxed/simple;
	bh=rvrIyHHXNp53veEtFKTuGweTwWvdMYYsxGORAMmxxLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYS422o4k6gY7kJsPck7BAAALDFeXkKknFAxMJGoXz4szXd7jZj5dBfru23WlqI8APNzJ/ZicerRzp9gPeoUwVvAHCgfhLxdEvmq2qIfUgLAX9PVSRbp8hFMmAnFdnV0SQiRZRHUKj7hpVdWidw8ZPFx+fKPXLcVPqXZMWOExgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2sBFcsNt; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2sBFcsNt"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad545e74f60so381134166b.2
        for <spacemit@lists.linux.dev>; Mon, 26 May 2025 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748320603; x=1748925403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ff6UC8ZTNe+I+eItze3lLHep9njcdURbGAHAI1WTvXE=;
        b=2sBFcsNtmexsj0dV0d8gxruHl8C2uwtbmXj3t3umClWcSSuwgxXXNISVHOTzADsFzP
         Gw+i/YVEJ1X0iCvXFDZNLqd0xVBCXGXiwTsPJ7G3WJqZhc36oQcxXYpVbi6Jw1Ou5K5x
         igU+9ltx6HIdGoP8gG/F6oy6SSoymu35wvMpLnfDmk0kzqTItDI6MIqKAJTeUBH9NuSQ
         P04XBAA12uYXy9Qujn9FH7i/wsslmsl7GgJ5wOURLWIDMYSikXiwRJf0XDCBhhdiYACn
         COoy0xBF4+5HBQ5/QgAZgBc3iEvji/9HXueRT+ECjl4SwJtI4a5vhaHDq4arBn6gVA8S
         0nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748320603; x=1748925403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ff6UC8ZTNe+I+eItze3lLHep9njcdURbGAHAI1WTvXE=;
        b=krPSLhjz6ZoRmdXHHj1RJ5sOtEF/fX7rrIYTGqGe3gaWUMgI1opA6TGUAnNNrxeh/j
         cAyaZwWEI9riGJGRl8lTHijpZelJAG3t2+XH8dxydOOXmM2+b420vZpHGyuoeFQAoRcS
         7H2O+mihGTcbJs1nVgg7LbCgIivnTeqhSx+fZ3ANyF7tbfEqoUCYAN4yy/HnwjDvx3PR
         E4Bf13ABO9MkZi+1zZJ+1mpsS4mxXKAnXyEGbm2V+E9pSuV/rDuGrWLYlpdxaMIpCuv6
         itFLwBiCLsFBfjw/4cw6VhNSibmyXqvv6n6P8cCoBkW9+ELWJBceDbdbqavhc/gibIPG
         5x/g==
X-Forwarded-Encrypted: i=1; AJvYcCXw3Rna374+pzFuJ8RpWDtfLVlTDZTAWrl/i4Xg14r4EBCBOlBD/bNxZpo+mlxHR9HznAUfqrpbWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO449O2T6NVD+QBpmbe+N0pX3P2GtO4iy/TS/RMlgumTcoDfp7
	JJ/ZaA/wttK6pi5SPPyJHt5GG7Tz2cA8WLREm7VdzyBWD8dPXJL4O52yTtbl1ROmdCYnFl5z6tI
	7iJIeL6H9tzzGLKm8qITDEmYhPdXI3PWPXyVIAIYE0A==
X-Gm-Gg: ASbGnctxaGmgCMPXQWGI5NvuOAw3llHYnQ0kDgL9CQgXBnL+XBnAyYqy1o9BK8eXtAR
	Jb23TabzStq88kHr9IX001+Eir/p7jC/N6YIflxWzGAjG12FnsCZ/alSqlKx3jatJRs37Xc0p2q
	WFyxSruMsBP19WDgkVPGtlM9EVZ0VA34HNQQ==
X-Google-Smtp-Source: AGHT+IGo6E8NJmIu7lDX7Br9+8Vm3DHhMozHXP52l3uoUCX6XeCyxyt49ZP4sGWmptiI89VtoPx732i1dLPzVdepgQc=
X-Received: by 2002:a17:907:7faa:b0:ad8:9084:4ec0 with SMTP id
 a640c23a62f3a-ad89084517emr53114066b.35.1748320602960; Mon, 26 May 2025
 21:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-5-guodong@riscstar.com> <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
 <20250526215243-GYA53128@gentoo> <CAH1PCMZhS4_u3nTdAQDfTTRVJ_61n-OYjmMuv2m4DHYDzGE0XA@mail.gmail.com>
 <20250527032701-GYA55693@gentoo>
In-Reply-To: <20250527032701-GYA55693@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 27 May 2025 12:36:31 +0800
X-Gm-Features: AX0GCFsJEcR3EmfV6Iyccb0DPbXPaPY_2_j3czeJ2Y8-ennyhBu-Ez1iIOffJ7g
Message-ID: <CAH1PCMatGM6y2AhQB5e=DMu9kD8nxJ3Xv9AYy7Y=E8JhMV=Z8Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
To: Yixun Lan <dlan@gentoo.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 11:27=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 10:48 Tue 27 May     , Guodong Xu wrote:
> > On Tue, May 27, 2025 at 5:52=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wro=
te:
> > >
> > > Hi Guodong, Uwe,
> > >
> > > On 18:54 Mon 26 May     , Uwe Kleine-K=C3=B6nig wrote:
> > > > On Tue, Apr 29, 2025 at 04:50:46PM +0800, Guodong Xu wrote:
> > > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/=
riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > > > index 283663647a86..195eb8874f3c 100644
> > > > > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > > > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > > > @@ -20,4 +20,11 @@ uart0-2-pins {
> > > > >                     drive-strength =3D <32>;
> > > > >             };
> > > > >     };
> > > > > +   pwm14_1_cfg: pwm14-1-cfg {
> > > > > +           pwm14-1-pins {
> > > > > +                   pinmux =3D <K1_PADCONF(44, 4)>;
> > > > > +                   bias-pull-up =3D <0>;
> > > > > +                   drive-strength =3D <32>;
> > > > > +           };
> > > > > +   };
> > > >
> > > > There is a newline expected before the pwm14-1-cfg node, isn't ther=
e?
> > > >
> > > Right, I could amend this and fix it while applying this patch
> > > (so if there is no other serious issue, no need to resend)
> > >
> >
> > Thanks, Yixun.
> >
> > By the way, do you plan to take patches 3 and 4 of this series into
> > your tree? They only apply if the SpacemiT reset patchset is applied
> > first.
> >
> Yes, exactly. The dts patch will go through SpacemiT SoC tree, and we
> have to wait untill reset patch series applied.
>

Appreciate you taking care of this, and thanks for the update.

> --
> Yixun Lan (dlan)
