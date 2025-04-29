Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9D3C17
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 00:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745887280; cv=none; b=fypISEMVjSboQ8PHsnvYX7sKrHOVrQTjW6C+sINWls0hH/4Jskks//lE6TB9KlXfHYN+pmyCJZ8C2F2l4/1EcQ/W5VjqiJ9J99grWgquX95rkZqfP2J12IlieNCzSnL1k2OAM/0iPrnKfrNCIX/3YHYP3NR0+btT4Bk1iODTFt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745887280; c=relaxed/simple;
	bh=rmnPc8tqdZn5hexoKGEPfBpixXioI1yDAyR7/EtGRgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hckeQ4jTvQesG1GQTXWmcj3u0G15zWO5tkd3fkv2VLXdSVTN39Uc5LgzMRpSZGze/+Zd63+sGjHCPkOOQ38hG0a84yHOmVzt1qeRn11kVFHoLSJ3zu9np4ikg48RUwQWcSzXd8YWAZ7Wu8lBW7x9pl1EUZ8rXzVkSQCYYWTFY24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UIvUibLR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UIvUibLR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so665788266b.1
        for <spacemit@lists.linux.dev>; Mon, 28 Apr 2025 17:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745887276; x=1746492076; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbaKAKCTzfmHltef4oBV78jsKmCoKC/2lN4zrIr3UH8=;
        b=UIvUibLRVOXJZZ1XnTBPuzpQDcKSXW2MoYT/ssREsfrSyQoG8+haWy137OHqmMkM4E
         E4U7g/fw9RdNgsrfaE08ZMNcPImKTNKuM27Peug8eiVg40HwRbkgDrBKV9BGP20SxgLY
         E7KMFzCdg9AZxByA4OYNjEarpavCNpucIuJFIsLY/xhV2mBRrMyuXhq5hAZfd7xjDRsx
         csdMy0UIcdsnzhdcD9HLjFVNEbKuyInNnLCw9tukqAJV0fEBCKK3dvg/gboT9IUeZ7fz
         ridJtAwNzIbE1YxSvqsZZ/QOqzAPVG3pEjOBYT8rm3c42cFG+FmK9ZIplEDcjuxtkIGI
         nw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745887276; x=1746492076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbaKAKCTzfmHltef4oBV78jsKmCoKC/2lN4zrIr3UH8=;
        b=VgilF8A2zh/i9+Z6WDcQAik3Ps2jZX0Rx7vaZZ7xC6I9Bjv8m1hQ9BJ84ZagmPLa+j
         WlGA94vKvRALYni03fBDSZO4/5pMfN/ZHGr0DEzi+UTIl/SD4V0UwWA0LNOkXhNxQFyp
         dFvrPA1y69FOL2YOyMpW1qqqsf5sS0Dc9ntSUTr3+l6ZRfrBvILhnzJC7FQwxY/RiBq+
         KW/UPJT7zijog+nQw8a0GmyQyPoHurcNTHtCIrzoevha8lpxD0HhbBfnzg//uythv+Eu
         BebMzCehcuDT0+freesFn8skvUTitRxS0c1QnExwYj7vjBd/2l/AmJWD8VaPaCT3MKO9
         XA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHRYkwBOIzkeCHZs6PCY3lYRhcv0GySd8fdc/EQadeEEAJc4wLFbE7jIquHLjMcIRK243Bb1MmpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+K1I86lkiYHQzne1dLPkhmGTynX7+tUXQ1M6xYlqaTmN8+VQ+
	JsdLrp7r3pywyRHCU1y+aqRI+Y3dlnQDL2dVI55LIHy9yMMHPXgkYpZEryfmk8h1Fffaet14Jts
	iyEZh2h8I5eAwYjy58cPs9d0IuF1U3PozjihdmA==
X-Gm-Gg: ASbGnct3PgjCVJMYSyOvhTx+uSdNJ7hC1HEgpnuZjD6+jgZK/x7hVAcg1q8TEMrXN1W
	9DALcj3t7igz98GNhzTaKcZToKMA4yvSkANnnrv5Pbp3y7v9jOZhOyXNXjJzP8EcImPwM7JcuTa
	e2zDotZgpfIB5wM5CZQ8Wq+ocBBfOHbK5ZWg==
X-Google-Smtp-Source: AGHT+IGDDd1KBmZYtGMAtcmO079rgPCkzThzjrRGdQyH+DShBHm1WziqDjfFzM1LQRG2qnLtbMLpLsYzzQQ9Ipi2Cr0=
X-Received: by 2002:a17:907:6089:b0:ac2:66ff:878 with SMTP id
 a640c23a62f3a-acec87b1b2cmr75859566b.50.1745887276408; Mon, 28 Apr 2025
 17:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420070251.378950-1-guodong@riscstar.com> <20250420070251.378950-4-guodong@riscstar.com>
 <kftfye2zn2ogyvuv7diuyrv5qkp43csbpkcqfcms2xp5lsuubm@z2kocdzkb7qk>
 <CAH1PCMZC5xrX07rd5bo+06zJoJDiAH3UNHqH5catwEALNJL2dQ@mail.gmail.com> <t4tnrsyl7t7hwfm752eapz3ajxkkl23nrfemw4jy6a7khi7a7u@gow3c2ba56ib>
In-Reply-To: <t4tnrsyl7t7hwfm752eapz3ajxkkl23nrfemw4jy6a7khi7a7u@gow3c2ba56ib>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 29 Apr 2025 08:41:04 +0800
X-Gm-Features: ATxdqUG3lFgkg3lNUF6_ATkNEyTDRUTSmHtumyCGNvrS81lb8iksobg6ENCiyps
Message-ID: <CAH1PCMbuP6CzA-0CWM93MifWDY-cKmvozh7SUoy0658VRssaAA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 12:32=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ke=
rnel.org> wrote:
>
> Hello,
>
> On Mon, Apr 28, 2025 at 08:46:50PM +0800, Guodong Xu wrote:
> > On Thu, Apr 24, 2025 at 4:18=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek=
@kernel.org> wrote:
> > > I want to make all pwms use #pwm-cells =3D <3> in the long run. Can y=
ou
> >
> > Sure. I can do this.
> >
> > > please use that for the new binding? (Of course this needs adaption i=
n
> > > the binding doc, the code should already be prepared for that.)
> > >
> >
> > I got what you mean. The code change for that is already integrated int=
o
> > v6.15-rc1.
> > Commit 895fe4537cc8 ("pwm: Add upgrade path to #pwm-cells =3D <3> for u=
sers of
> > of_pwm_single_xlate()")
> >
> > Now, if I change this #pwm-cells from <1> to <3>, without the dt-bindin=
g doc
> > changes, I would expect to see warnings (" #pwm-cells: 1 was expected")=
 during
> >   make dtbs_check W=3D3
> >
> > Any suggestions when the dt-binding changes will be merged?
> > or I can add your patch as a dependency.
> > https://lore.kernel.org/all/cb799d8a5bb284cd861785a691b8d5e329300d99.17=
38842938.git.u.kleine-koenig@baylibre.com/
>
> I don't want to merge this very soon given that 895fe4537cc8 isn't that
> old yet. But I suggest you adapt patch #1 to require #pwm-cells =3D <3>
> for the newly added compatible.

ok, I will add a conditional check of #pwm-cells based on the compatible.
spacemit,k1-pwm must use 3; other compatibles use 1.
 (if:then:else in the bingding yaml)

Thanks.
Guodong

>
> Best regards
> Uwe
