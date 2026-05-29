Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805192A1CF
	for <spacemit@lists.linux.dev>; Fri, 29 May 2026 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060970; cv=pass; b=Orm6EZeh3stYMra347/VKUwuSZBD8IeRB3g7wp6UFOqQmrItff2faJzURXMUaqY4Dt/VoNtdHisNgwGWVjCwmIrWutcjDK9jnQbbVEY8u/r1sebay2Lmniqh9WadrhrCpnUYynUqdt4UpIuxoCKbg7lIFqDYV1vugkVhI8vdwDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060970; c=relaxed/simple;
	bh=IAsxPFjVuJP+GW36OLLktoHQwp0GqX6ZN5zfutXTnoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhiSRlT4Z/NwYUnKvCUXrzCoyjj7S3k8qMshC8fXu2Nw+gSk/DKNixzMr7WJ3Nod0ne1RcBZVEzmc+FSTvi9w7mETGcsN78QaWX86ju8bHFUtaCoSZ6Q+S6hiHnc70TCT/7AnanKyG256qTotijRQhHk82sV/oOck1IGH/fEvDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=r/nwLyFX; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="r/nwLyFX"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7dc78af7371so22518117b3.1
        for <spacemit@lists.linux.dev>; Fri, 29 May 2026 06:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780060968; cv=none;
        d=google.com; s=arc-20240605;
        b=SToXvU5jC3vWtq4LVyXrs/+/Q5TA77LdmJTkmIfTlqirmrCDdwdeqZaca5A9MRxL2G
         7Z089OyV8bKIAWRCkMDxKN/rIDZi1rxpruEZaqGqnMV+jF45OYQ5fQDg8X/BxBrqylZY
         F6C3CUZ2O2/RUwQkzvtthivdYIDHeTIOeRO6nzQrEGFb7QzHFJT7jXtG4/CcuoPxWTo0
         AbND7RGdzVNAulw2W1OSCCesRdlQA+jEYAfEpBA/eGZ2i9h8+5hXQuGSyV43bEqLGggR
         GRtunRruLy4zdIWWW3Jf7PAgyortm6rRf5UjBk4wVqvOQZSsbrQziRAE+pxX1abkBAL7
         E1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        fh=lKOisNJc1G6hV9S/5tQIaOF6Wh1nrOUvX7rD4fxtMmo=;
        b=eh911tYO2K2uKEPWLpv2X57Kx67O0902tjw/gsBhmJkRVhxkkeZrdKmdbfsScbwA9w
         oHyFZAWU6WFfyup9Khd1Hf7rOVn9RsxqiB425vN/Yp1B95C7+hYn/tg0SheooWOeuaji
         HPo08UQ/7r2ftxtJaR0uDqkbuogUFPIDNen3XT6LlLOIQg1YCisTO8JljRdO2oAjhaho
         OS85FreoGq1/Qfw3ywjBmvQ+cCcbFaQzq+MvFIApf5ogRzIqit61gyI0rm427i4tsvkq
         uAa5NZstzGuS0+EcY60ffIA8u8WyKZ2YHBZRI71aLU00y+5DuN5JzekevLNQkyGFV6M/
         RhAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780060968; x=1780665768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        b=r/nwLyFX6hkWz6sCgDUbiqXBWMWFLq0OaF8PFZH9moz/i5jTeoZKlb6kJabigp/ij3
         y/zp5ZQEuexU9DDlUnNudFEOQdR/EotnTuSQe9weyVKLV7qaw84dSoverSNUkmyg3KJ8
         Q+KJQwpY+Iqnzjkib47iFCMGiMLpAjYEqurqALaMXRQJpS6NVwuno43nwPs77Rs9+VLG
         t9gdJdyYBzTs+NXk+U8n5hE1tYfDWKEuu/J/Qt2YcTE8lS2TId86VobkpCJl4gNSO39l
         hM3J+5v0g0uAy3vsg7yCl1GE2Cy2nNu9SYhEHecSHsyKtX7ZloeR3jnEcRjZdqJG8CmG
         qbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060968; x=1780665768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        b=rcHxTmdBrWVloyjvj91NM2EK+Rcy1fWDiFF/9cPgWwSi5620DvJevU/mNED4JYoV/g
         95x06kvukVe1xwUXax4iBvjPkwmABL6VV5NzxNFavhjvBNo+m1ukPiEmfSULspjyi6wI
         6VKlAJGm2WHr7w5eWxxRkOATy/1MvN9TNpe442pOx7gyLAx8Mw+/X0khM/slfUwYRExh
         NdkaxnpMYnweAbAZQ5aziIDDMwRZqR07DO9RcsxDEkqmtnNU9dORB4Q9cWV2WXYUhIYI
         2owwHBQ+7yta2DPdvLc+Op5j/IQrbg9rfQ5Ij7hNC3BYl5jwjq2EiC1GHyn7Cf5jgGWY
         66sw==
X-Forwarded-Encrypted: i=1; AFNElJ8vGVKM9Q/h0DBbYNqjqft0yqJ0MZOeQEpApcmLkFKA0WyyW2xdJ72oTXY+xlFOf/ylavXC6byEYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/2F/iqzUpaXdFX7SeK6xQQ3mHXVzgqgfdkjZwAiGuIOuTEpZ+
	tcJi414ncVgfQSOssO4gCW2PO6OF87xr2NTTXpIXJlNRUwzHHAO/rb/I+ysI/YDBaYFLsWt6p1S
	FBmbEWXJ98Nwo7C2B6XwdfHMQmfYi0HUOE9uDViwhFQ==
X-Gm-Gg: Acq92OHiphIbb7fl+jIyxV9LpoaLAUc/t0uV9ZSy6FgfIbvcJQV/nicYEaxhV55P1El
	2FuM+UvdvaGc/9OiHiaPAKiaeHaV9ZhpaYTl/ofrKfTBcYCQpm9xgOj6pFdg3Dq3tAA1nR7FbKc
	uy+GPcVAad2zuB+WgMp+ap1JDif9kewjnbaRdgje1uIUziR54UrQPSanCTne4OPuU7SPKsHm+Jf
	PRTlyOvqrQPzD9NmK/eQpdZTHqZybacS+Ourl63t5d3+CCPivW3v3pgttn8cdEqDbLOMDRPEeeG
	C5BpKrcweEtJZ2MvDTVABiCG5ZOdJBMZNdpsFG/SrQUNAE/W4y0GULYo56UhnRn96kbGnSLRtaB
	8sQ==
X-Received: by 2002:a05:690c:670a:b0:7bd:69b8:f2e5 with SMTP id
 00721157ae682-7de44db875amr23947297b3.3.1780060968349; Fri, 29 May 2026
 06:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
 <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com> <20260529062159-GKE3748271@kernel.org>
In-Reply-To: <20260529062159-GKE3748271@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 29 May 2026 21:22:37 +0800
X-Gm-Features: AVHnY4Iab8wgmxmC75EDPrBfu1KDkBxpc0a7EJvkUE8WSVNftvwon2aew66vIo8
Message-ID: <CAH1PCMbNv3pGNvjhr02fiibRS3mt929+C3jwreWePN-3O5eLOw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100 cores
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guodong Xu <docularxu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun

On Fri, May 29, 2026 at 2:22=E2=80=AFPM Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Guodong,
>
> On 13:18 Thu 28 May     , Guodong Xu wrote:
> > On Tue, May 26, 2026 at 3:23=E2=80=AFPM Guodong Xu <guodong@riscstar.co=
m> wrote:
> > >
> > > Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
> > > provides a forward progress guarantee on LR/SC sequences in main
> > > memory regions with cacheability and coherence PMAs.
> > >
> > > The SpacemiT X100 core supports it per the SpacemiT K3 hardware
> > > specification.
> >
> > For the record, I have tested this change on SpacemiT K3 Pico-ITX.
> >
> > The stress test is run by enabling CONFIG_LOCK_TORTURE_TEST=3Dy then
> > boots the kernel with:
> >
> >   locktorture.torture_type=3Dspin_lock locktorture.nwriters_stress=3D16
> >
> > driving all 8 harts. It survived sustained torture [ran for ~10 minutes=
]
> > with 0 Fail.
> >
> > ... ...
> > [  735.588947] torture_spin_lock_write_delay: delay =3D 25 jiffies.
> > [  738.015096] torture_spin_lock_write_delay: delay =3D 25 jiffies.
> > [  739.204713] torture_spin_lock_write_delay: delay =3D 25 jiffies.
> > [  741.195211] Writes:  Total: 714319420  Max/Min: 45946599/43679876   =
Fail: 0
> >
> I appreciate you give more info about the test, just want to make sure,
> for the kernel config, the CONFIG_RISCV_TICKET_SPINLOCKS is not enabled?
> so it will fall back to use ziccrse implementation..

Correct. Thanks for double-checking.

In the above test, CONFIG_RISCV_TICKET_SPINLOCKS was not enabled.
And since X100 has neither Zabha nor Zacas, the runtime selection in
riscv_spinlock_init() falls through to the Ziccrse branch.

BR,
Guodong Xu
docularxu@outlook.com

> --
> Yixun Lan (dlan)
