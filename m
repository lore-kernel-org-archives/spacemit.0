Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F253BA34
	for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715283; cv=none; b=cubUxcNXDp/osQ9FLIHDsb545LrloPdKuZKFSj+Q9auc9bU9kjVUo0Uuz42NejSEpgYkEolxSQiMwI77D90LwoHwoMGMAh74xaGgXskM0Gs/NDHtcVet6tU+mhmm88Gua0SZp+oxKlU+buf4fyiTs1zGLA24L49SIWbKu6V8jTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715283; c=relaxed/simple;
	bh=6Ose6+B71k7iqCx66aWRA/Yp59uxaaNK8czjGm/rHnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu4r60FK2tD4QKVvnkAB5u7R2cavQgwFoB8tWqwe346pCX6vjt55cevs0mSMHM7bkvDooLe92hEzvaGOU3GdeNyrd46tTjpIUcpheztil730cxhSnYYO2UsIqgDVeOrLcv6AqtSs+cl1GXtSkhX+Wq3sqPJpNjfKdowSfuza7HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MLhrY4S/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MLhrY4S/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so1540853a12.2
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 01:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749715279; x=1750320079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oxSJUEVlshkD0aDlvVP1clOg+BglaIQc1uVhMM16LQ=;
        b=MLhrY4S/FG5vWYQL8xB6C89UkqGtCQav6yw13FaYmmBB4l6NdQVy1p6ZgmWh8hitlb
         MovZTrb2WhvafjvTvQVhJ7ck3dmotjPZ2VrJD1HjoveIoVybEP5ztQqMyrcWO8Fod804
         u1VO9vf3IiPTML2cXJUFMVLANJnKhGuKC9g/FD88bXgmxY0VHdT9ImcTns+kBlhdyBWC
         RNQ3YQex5UU4Cmj4bbbSFyLUpQRZuwF6fhBCDudKqderHFLyqeCb1HciegzwiuwuzGI7
         vVgUD+//CaIRZKw9HXLSyNBe4eHCzzxO/gcAPYj9aCfugHyREFcS433LMje7Z/JE+64l
         OFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715279; x=1750320079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oxSJUEVlshkD0aDlvVP1clOg+BglaIQc1uVhMM16LQ=;
        b=YpfsQ1guzEI0zga4zZin+VizeHBdKWAdAetpQCiW/7/CUUYmhG2SOW2Kk6dfKwIQFx
         4h9Lv4mSW/3SUbvTf0LmLnd+PQhp/NtFfbVR0Z4Psq9Cgzr+izEyew/7FqqABIypIZE5
         pjjILBydJDpg2NVJ7MY3msN/Jvj0yxrB2IPojyewbfZQD9gyDEfRB6BYaKZuKYTba5ev
         pKAFc2xpFqV6zlFU/0F2E9Ha8vj9mqX6e6ArlM9r9pQ97QevciRZCtHjPGr9bnfnh9dZ
         9sJwishXQI6wI8xQckWrHjFtcv1mSUVbR3kad5LtIe8OJ5wfjNKtpRgap7mmx3MJMKyJ
         QuTA==
X-Forwarded-Encrypted: i=1; AJvYcCUaUlaO5gFiA0llgN/TRuQRSXfHn4OB9zU0cyGwooqXylZ4SHtRLZrKaR6VmKRJxOwwZO/AeDuprQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuqIG8CETQ1IhCtlzzjbt6mLCI8ni8C7Ox2axhzTCPf+jJ/38r
	BUre9qECKy8hGgCNrnoRZIC4C6GBRQJyLG9AacBGr/oG3U7hyMGPsRuXGvwJ3wydTkDNS+Ru3Zf
	luw68mxgHtTpBaqqOm1VssvZ776IUwrUMKXogI8y+vw==
X-Gm-Gg: ASbGncvHTj/HSUI80cGAztj61xTeEGEK6XbnZGqs4dVnefwzbp7uG7efPwH6ARoivOd
	0HhdClzSDXoGiFXH+bAV/iEUxfGn3qFF5E5T9+d/l3pUz5w4csBR7F/SwEgcYuu9uT1lX14c4JD
	NTF3jREU9F1FVPF0R+LnrZmHe2NRnsFoUd7n+RDwiKAHa4
X-Google-Smtp-Source: AGHT+IHDczhcOV54f0XomIKx+8AvFzloZqJPe+NAcKM5RDeAoHNu5Itf848xFcRsOPgv8woiTaDbH1WF8g3ZBcPtFeQ=
X-Received: by 2002:a17:907:d03:b0:ade:3bec:ea29 with SMTP id
 a640c23a62f3a-adea2ec74a3mr265693466b.25.1749715278188; Thu, 12 Jun 2025
 01:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-7-guodong@riscstar.com>
 <20250611135757-GYC125008@gentoo> <CAH1PCMbt3wLbeomQ+kgR6yZZ18TZ=_LF-kCcnLqad55FSHBhDA@mail.gmail.com>
 <20250611150227-GYA127466@gentoo>
In-Reply-To: <20250611150227-GYA127466@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 16:00:57 +0800
X-Gm-Features: AX0GCFtVVlHqZ-iio4sy0I0p_9gClOFpDAZk_842S7V7_Hx6vWxgyXXCaFMBON4
Message-ID: <CAH1PCMbNEMvpU=eNvrHj3pcLEMn=ObCOZZHVM4tjZbL9-BiraQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on
 Banana Pi F3
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:02=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 22:32 Wed 11 Jun     , Guodong Xu wrote:
> > On Wed, Jun 11, 2025 at 9:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> > >
> > > Hi Guodong,
> > >
> > > On 20:57 Wed 11 Jun     , Guodong Xu wrote:
> > > > Enable the Peripheral DMA controller (PDMA0) on the SpacemiT K1-bas=
ed
> > > > Banana Pi F3 board by setting its status to "okay". This board-spec=
ific
> > > > configuration activates the PDMA controller defined in the SoC's ba=
se
> > > > device tree.
> > > >
> > >   Although this series is actively developed under Bananapi-f3 board
> > > but it should work fine with jupiter board, so I'd suggest to enable
> > > it too, thanks
> > >
> >
> > I'd be glad to include the Jupiter board as well. Since I don't have Ju=
piter
> > hardware for testing, could someone with access verify it works before =
I
> > add it to the series?
> >
> Do you have any suggestion how to test? like if any test cases there?
>

I am using the dmatest (CONFIG_DMATEST) for memory-to-memory
and using spi3 to test device-to-memory / memory-to-device.

> I would assume it work fine on jupiter since it's a SoC level feature?
> instead of board specific..
>

Yeah, that's a SoC level device. I would say a boot test and some
basic mem-to-mem test should be enough.

-Guodong

> --
> Yixun Lan (dlan)
