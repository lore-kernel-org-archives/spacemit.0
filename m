Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B42E11DB
	for <spacemit@lists.linux.dev>; Sat, 14 Jun 2025 03:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749872003; cv=none; b=fYLXEZpML23nT+1TlruIQVFPGI+llqMfR7HsKaRfQmlgPEbGW3lEj/qlNGqIfhpgyRDXZUtzixJ5FbBufvkuuenwzUCmhAES6Dh2kvR0vYBXofFWyYX7s5mOO0USq2Y9WyGJW14fM129Z6QFp54AYvS6QFKKTy5Z7MECnvkfLYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749872003; c=relaxed/simple;
	bh=5zj1CCPqCqbanv6cOh5uOvtbh/D95b0Hh1gqZskXSVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vydq8l7Tqei0/iaivttA6VUty7MP6+KqsvcwWDnrkvgurneKgm0wMmz4NWtIUL0u9SOswDWtpBSoBJhurONJEJMkaNW52kx9FrFA5Sqa0zl5mzjy7IrlbwZyZf+T4kykP+BE8ShcTsPwqy6mr1oRbUPXwChv87izGhH/EMRqw60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2FBiYwfn; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2FBiYwfn"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e75668006b9so2725721276.3
        for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 20:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749872000; x=1750476800; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJcrqi5pwJ9wED2HFmauPlfgqPYzc6rbhv7dX2NmqNc=;
        b=2FBiYwfnO9nPjVcb5HFtdvpjphm475vD1aOl+4R5vqKUm1/PlMELSw44Y3klwCmb/i
         bDx7dkxmvKuJlPUwi/ssPFV64/5NXO4+ZToQ53xyKKJatsp7DrhRvE+BT26lmoNeL7Zs
         t38KEH3CsDF6rNuXj1jlwWrcD5q8lR8BKjA6zdPba94yAY6iNhYEuK5XNr4L7BqC6wGU
         pv9KksJ6Cak6sh3JzZCdtfO+uXTg9pjtHEZuR355Tx5Xs/CSovGr/dJkR1jUerQD8H3Y
         JWrwPP8+cj3aRqs8JWEo0H6T80z9EgVjlTJoTFrn4d6H6/g9xaORO/2+0gJzmIhAG//F
         zyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749872000; x=1750476800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJcrqi5pwJ9wED2HFmauPlfgqPYzc6rbhv7dX2NmqNc=;
        b=rFvqeqK8D85h+Kw7HZLXIhDhL+3JJx0MiKyHtMpL1cq/baMeZrOu36XGn1w4UqPpUB
         c32xMJMAPkmulUPK+iiR3UkQEVBaMz/522yfLFsAdOQF6LsOghzfezE0PN9o+9LK5aKK
         5hWkoNJToWS5Uu+YHRTxd/pp77ZioYrZjXAQQuKZDHbYhVo3MyPXajZ9PUcJcOwXUPvK
         2xNVq7eY4fvBdSNtArlYUa70LAGGUTI7NrYpcAueainmDwU1XobCMHQBe9COLYMn24eM
         1wJFmz540L0UwncdG3U3/3ydBDvJJNfkS4vOK6RpoOX1cUsPAPmvK2h7DeP2F4r/v8Ax
         4ClQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtdoq+4b0HlWITaoxjm17mwoaUQUOE5Ob+ce5X9hdL+z3WU8f6bYhCzC0NZEArOT0ISXZXxnnfjg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8xIE47BdETu7qNwAF7+NHMjFi0jsXoGdNWmOb82ed90XdzLXC
	Hcs0h/cC/ybnJPnH6z07dx8XGeIdOR2DvrUKwqNzxHtSwDzqushsp8/cLnuWUOxOhYHJoGYxRTr
	BuA0SdIR+pwlkRbs0/EuSDK5NQNG+jWDlKAULqvRaZA==
X-Gm-Gg: ASbGncuwBDAx1k44j0/OJ/iAmLv1NjNo2WYA4fqaS6iHYmfGqmdDN2ZYMnlW0ATmJwV
	y6RmMhf1ZAbcLr9LT2JAPgaRoWqzrWHnkqhNvz8FZMGnLAPsU5enPjb++ADazHp0RbVBDyB+C/V
	+0ItbKKXuMtU8QES7zqlhXcKjkEkAx/ekR9TCTusBiDKMm
X-Google-Smtp-Source: AGHT+IH1Y42tC9WOhyorVoIVUzg4d8lEv7srElHPGs2Vyxp0TjD0IOF4Ys3G9cHs3FqdWdAWUdm5wif9bNpbqowU6iM=
X-Received: by 2002:a05:690c:892:b0:70f:6ec6:62b5 with SMTP id
 00721157ae682-7117547d163mr25767887b3.38.1749871999806; Fri, 13 Jun 2025
 20:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-6-guodong@riscstar.com>
 <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page> <20250613132227-GYB135173@gentoo>
In-Reply-To: <20250613132227-GYB135173@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 14 Jun 2025 11:33:08 +0800
X-Gm-Features: AX0GCFvaqH-7lH0Zx6WGwcqUhaG1iGpayA9xWNyPAE7sjxcXfPy8V2aaJ994Vr0
Message-ID: <CAH1PCMa8DukTxxRoWBUV22zTFnSa-4pLkZjffXO2Z9s8dtpiMg@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Vivian Wang <uwu@dram.page>, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, Ze Huang <huangze@whut.edu.cn>, 
	elder@riscstar.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yixun

On Fri, Jun 13, 2025 at 9:22=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Vivian, Guodong,
>
> On 11:06 Fri 13 Jun     , Vivian Wang wrote:
> > Hi Guodong,
> >
> > On 6/11/25 20:57, Guodong Xu wrote:
> > > <snip>
> > >
> > > -                   status =3D "disabled";
> > > +           dma_bus: bus@4 {
> > > +                   compatible =3D "simple-bus";
> > > +                   #address-cells =3D <2>;
> > > +                   #size-cells =3D <2>;
> > > +                   dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> > > +                                <0x1 0x00000000 0x1 0x80000000 0x3 0=
x00000000>;
> > > +                   ranges;
> > >             };
> >
> > Can the addition of dma_bus and movement of nodes under it be extracted
> > into a separate patch, and ideally, taken up by Yixun Lan without going
> > through dmaengine? Not specifically "dram_range4", but all of these
> > translations affects many devices on the SoC, including ethernet and
> > USB3. See:
> Right, we've had an offline discussion, and agreed on this - have *bus
> patches separated and let other patches depend on it.
>
> But seems Guodong failed to do this or just sent out an old version
> of the PDMA patch?

Hi, Yixun

I realized that there is some sort of discrepancy between our understanding
from the offline discussion. With the information I put in the other email
earlier today, do you still think we should submit one patch which
covers all 6 seperated memory mapping buses for k1.dtsi?

Let me know what do you think. Thank you.

BR,
Guodong

>
> >
> > https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@wh=
ut.edu.cn/
> > https://lore.kernel.org/all/20250613-net-k1-emac-v1-0-cc6f9e510667@isca=
s.ac.cn/
> >
> > (I haven't put eth{0,1} under dma_bus5 because in 6.16-rc1 there is
> > none, but ideally we should fix this.)
> >
> > DMA address translation does not depend on PDMA. It would be best if we
> > get all the possible dma-ranges buses handled in one place, instead of
> > everyone moving nodes around.
> >
> I agree
>
> > @Ze Huang: This affects your "MBUS" changes as well. Please take a look=
,
> > thanks.
> >
> > >
> > >             gpio: gpio@d4019000 {
> > > @@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
> > >             };
> > >     };
> > >  };
> > > +
> > > +&dma_bus {
> > >
> > > <snip>
> >
>
> --
> Yixun Lan (dlan)
