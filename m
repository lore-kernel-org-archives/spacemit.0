Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08322DDC5
	for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 00:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766882581; cv=none; b=qQkYmF0G7kucyTywuS0UFUq4piUwCtShwwnT+K5/I2Y8IRtiFzL443wF5vLrWEXCz1qOzaak9TGJyyrCk/mWFcfL+tbPBNq/cOJ91uOeWGIrvqV8XqSHT4KUIPRrsGOAbarXQuSXP5t/jqBjPQfXsd9CWExdsXqvRrxSpdLkpSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766882581; c=relaxed/simple;
	bh=I/NRGNwB9UgcD2l6EIAjGQuseMXjDZYSzJ6ijrVYqFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8+OrOR3ReNxcU/ajsYAKcSvVlxqOk3gInk2CYU2Cfe1+UjzmnyqbefZDGs2eoc0zzDxhzX/UFfl9HbcQdGRBy15nY3bZhL4mxlQl1eoO9w0WOQWUl0tLFXiFPZ+2R+rij/sJLb3abA4hfQbbCciszhLi9wPIwkvrd0izmFJ8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eHUgog+c; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eHUgog+c"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79028cb7f92so3170847b3.2
        for <spacemit@lists.linux.dev>; Sat, 27 Dec 2025 16:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766882579; x=1767487379; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwhU6tz2IAJuOhbctHFHYJBwk5gc+cswNffBuQKQ3CU=;
        b=eHUgog+cwv9ylqKnfDr2ohYA7ftX0LJ9JKWoJdsYcR0855ms0H9f0hyKcuDXpLyEgu
         YffTnmnmu2LPgHVU2FKy3qfUDr0iv9OEMnnpjM7VpflSIKenMdSVoBVX4z2HftsN7NEt
         WFrY1vDaLtFirW18iGR1H5cj875sGHHqKTvVXpeB0g4ZDDikfnTataEp+0mxB0tzu3ld
         qwrbF/KPGkGHtr8k9YBjA8/mSCoyLxD//DeuWQmV3ZEq3XJNo4EdlhVuPPsuouJugpTD
         +7iVRsbl1RW/FqRTVNimf013i5rDs99sqs9XmMaPtIa/7dWKqBF8bOhzrJGufVRsiycR
         jKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766882579; x=1767487379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zwhU6tz2IAJuOhbctHFHYJBwk5gc+cswNffBuQKQ3CU=;
        b=vr8WY6dQXam4vgUaT8OBPwMjE1sAdj9gqjpXnTT0CyP6bWX3qBSXYqk4utad+1PMKX
         ilRf8vqPlNNevJ228OZP2s+HLxx2A7IGtBvDoiFnBQHadqAAdrXvuU1tgVKVPZcHVnSQ
         AhELuZ3gUkX6sZk9VoCEgaHHdTnilroWYODYgTauq5Sy4VJipyXhwV2rL14IunO3X6Ox
         enGWAy6NG8/tE3BHY6pqGXR9Fh9VCSMeV2Xhp0af8/GndFCPYEXqjh3zW9pOkvMQXYQF
         kLrCnZUW3Kk0TNSpfouLgogdqfCOPm3HUQFNdtlNTkdRdPO0ulvAkLRxQiAyiFX0cW1O
         ntwA==
X-Forwarded-Encrypted: i=1; AJvYcCWoS1TlB9GxU+cf4E0OzLoToPAReGduE7kziPl+q4s6AHKGNaCdTwdZo1EpJ8aib8bv6ss0QuTzAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWQdjD5g0bzUjGy3womWJcaJDy+OTEiDoftf723QS7okBULc37
	2pasvP4LDSkOGxJ3kwyBHKuLvbCaCfj5TlltgNuGcUlAZuczrqfdbqlg71jfhv4fF+rry9NTrUF
	yuvCtKG88OyaRYn/K38DXHW5iCtkZAVbG0ZW6+0x36w==
X-Gm-Gg: AY/fxX6NqOF+nTfDobe6J1Zhfa7jWS6YbbDzJnKX4m0pIAh5GuA8u6UZXRrHZySIxV4
	qU6htSkJHAwOM+OrhZidX+juWEuyTYo5OwOYsQoRdb02WTPKeTlPbKBQrH4LTCFYQohSrxJVzYF
	NIMnrCF+U8opuk6rypMOXA94udQdNw+56RqPEsf5caQtV7w3EIczOfbhqBNta/UhjZl7lGBjZFf
	QduKjhgjNv3h1UsAC6S0OU33qs6md1gxQyrInnG5oI4+bzauBxQtHCDf7HGFSZ71l8X6lDD06Dy
	h2HZBZmjMwBmZhcd2Cq8JzcRT6bQX0P1OdYGIubxxNeUVZcXMpIsJ3o=
X-Google-Smtp-Source: AGHT+IErlcXBgMih7zxAEH5xWwRllR/TKu/x3r4n41MRYEc1IKi6ZvbVG+UxUtBlusdkfkmh4FvWruwadgCeYqiXZ8Y=
X-Received: by 2002:a53:b178:0:b0:644:7712:ed72 with SMTP id
 956f58d0204a3-6466a874977mr19597372d50.43.1766882578983; Sat, 27 Dec 2025
 16:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com> <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
 <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com> <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
In-Reply-To: <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 08:42:47 +0800
X-Gm-Features: AQt7F2opxPHnMSK_AxzmQeemtfy8x4nXYU2M7Wsw2w8qZ6_eughd9bfR4C5SjDk
Message-ID: <CAH1PCMY9A3CO1PXo-b5_BGY13xdx3nvAqb-R28hUz1VMLzTHWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andi

On Sun, Dec 28, 2025 at 3:26=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Guodong,
>
> On Fri, Dec 26, 2025 at 07:38:22AM +0800, Guodong Xu wrote:
> > On Fri, Dec 26, 2025 at 5:01=E2=80=AFAM Andi Shyti <andi.shyti@kernel.o=
rg> wrote:
> > > > +     rst =3D devm_reset_control_get_optional_exclusive_deasserted(=
dev, NULL);
> > > > +     if (IS_ERR(rst))
> > > > +             return dev_err_probe(dev, PTR_ERR(rst),
> > > > +                                  "failed to acquire deasserted re=
set\n");
> > >
> > > If this is optional, why are we returning with error?
> > >
> >
> > According to include/linux/reset.h, if the requested reset is not
> > specified in the device tree, this function returns NULL instead of
> > an error. Therefore, IS_ERR(rst) will only be true for actual
> > errors (e.g probe deferral).
>
> And this is quite obvious, but you haven't answered my qestion.
>
> Why do we care of internal failures in reset? If reset fails on
> an optional reset control function why should we kill our driver?

Thanks for the clarification. I see your point now.

My reasoning is that if the resets property is explicitly listed in the
Device Tree, the driver must respect it. If the property is present but
we encounter an error (like -EPROBE_DEFER), ignoring that failure could
put the hardware in an undefined or dirty state.

> Just ignore the error and move forward as we have done until now.

I want to double-check what you mean.

I checked other drivers in drivers/i2c/busses (e.g. i2c-riic.c, i2c-mv64xxx=
.c,
i2c-designware-platdrv.c), and they seem to follow this pattern of returnin=
g
errors even for optional resets.

BR,
Guodong

>
> If the kernel is suffering from internal failures (say ENOMEM),
> it will fail anyway or, with some luck, recover.
>
> Andi
