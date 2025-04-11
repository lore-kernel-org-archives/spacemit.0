Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95499280A21
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400686; cv=none; b=YG31uks2voc11ehrK/d1err1bdhuvWrLvhUxonVQkXjhTtnU1bUPSt1sXsf76dacRz7Mq/l003ScpxE5eA1kjVDCl0sm5A/yX0ng6bPwvTQnzmt45n0ByygnKsAiRp0XxhhDv+3LwS3r1VJhJicuS0/S81iJ0+cur6NiseWslSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400686; c=relaxed/simple;
	bh=cvWYMueTnNI052lI0vphIrO8EfCwUMaz1n9lCvWw0Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vb8MDcb4Q3fySF5afaPDoOEp0pEf6/Ia+O4QOKNGZPB6tIrMTnKstNjW5OO4K9YoWeJLneVjb7jBikTeBCOkA0u3AQWFk2J3ANzbAJnZPQoo6fCbQBD22OyQwVu0xXKzDjjstdYCn3n6BbAydOCok/o4kkdNIxk/k21Zb/yXkjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJBZFK5O; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJBZFK5O"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abec8b750ebso396186266b.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 12:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744400683; x=1745005483; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixNsTL0ouXPTlyTlApyKLv+63+cCzL/+fZpquEKOP2o=;
        b=NJBZFK5Oo48cvodkayxK89IyuaLKDKO0+kUuo9u6YMiFUnRpdbn8fV3OIlKb6cdsjj
         v5S7joCA0ZoUrU9o09PUS9eyUD7SGnOaFpwbQ2cyqySSfR4iVaIIN5tiuSD9Wsc4jfnN
         ZnNKCcFGaaH9uO4ZiaLQ6LZxsTDmvargW5vV6Im1RalnGsVjJ2K4MEO667tZkbC/DKgI
         K0oQigS3qgTlIkGlHm8MHeA3+XA5DnorTzkTgZvDOCLMTq2uVXV9XM6kifsCzNYw87NI
         npoJqsJ3RQQHfCZLVXchXfivVULRb4UJWu0HGJ5rlX7vTe9LaAjuBeppPujPs2dV/V9i
         R2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400683; x=1745005483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixNsTL0ouXPTlyTlApyKLv+63+cCzL/+fZpquEKOP2o=;
        b=Smq8nZ8HJf/DAgxPy0GYBbPyyc88rIYNIC0kdzJgg3RgFZqzHZB6+roQiZseQIfWVP
         WMBHwMVi0gRd9LqE3HTfpi0LgO2T3+rvBea8c3r1G6hGU23GR3hRK3zD0tgzUpUdo6bK
         hPammuK7FBDnSI0ghZnNfR/8CnUW0DuovRDNISLLOSPTay1dPWNItfFO/Ns7C/Vgv6Lr
         Mg+M0hccrVKLGiN0Y2NrHtpPyg7U9+Nh5gEHXIP5W5hgB7Ai+X7FMtAEelf6mJBd+teY
         5R7xYriUwDK4aKFegGeV4Bf9TImaxr4s0Ae8UhaVoFHCtMLsF3J+RNvXIS+4VJkYvKZX
         K5ng==
X-Forwarded-Encrypted: i=1; AJvYcCVpaoONTgYe01gr1A9nSHDJ5gtrBljBpovZKSpsBtXMgpRkfKi9yH9KNq/lRxIStTjURdNu6eh+Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHFKi2G3/7e4D/InGl1GNGHrHkqScaUcoUiMUo97LRNV5ERAFG
	mmwT0MPRQLwAH9f2Dr3bnrMU0IvebEAbaWvRqTztnjgkX4/EMF7CAkUtuMu26AezOoBqzh1Yw5N
	/Cxlkocdz4um/zC5wwyFHO8v0G5E=
X-Gm-Gg: ASbGncvTgq5qw1VLbKAtx6oX+bGqxO5I0wffAonWLwwdzpOV/Gc6GOwaV/JIrhWgtY9
	hBa5o5idK6B2zLfYEQ7BTRJKMTTmB6q8VdRJQw9PMZsGYdByR8coF+wz5L0aM3OnIwi63OU2jlC
	vq1Nf8gRNorZI37PNUakg3OA==
X-Google-Smtp-Source: AGHT+IFzcDH1iaEP6q1tsygbT4d9IKEyZV6bQHQY47gKw2g34rXwdM4yQe80wOvA0/o3z03M9J4E9lW/QhfczrM+cos=
X-Received: by 2002:a17:907:720d:b0:aca:96a5:9861 with SMTP id
 a640c23a62f3a-acad3491f59mr366210666b.20.1744400682645; Fri, 11 Apr 2025
 12:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250411154419.1379529-1-elder@riscstar.com> <20250411154419.1379529-4-elder@riscstar.com>
 <Z_ltyAO-OBzl0adV@surfacebook.localdomain> <a3b2d0cc-c055-4cf0-9e03-3ea73041642a@riscstar.com>
In-Reply-To: <a3b2d0cc-c055-4cf0-9e03-3ea73041642a@riscstar.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Apr 2025 22:44:06 +0300
X-Gm-Features: ATxdqUFkskQhMsG1Fkk7AzvcChX0YXHgUTejwz7OwkLd792_lQxr49tcIoE0XwA
Message-ID: <CAHp75VchEcpP67oPC8xD+tYrY_A0BGSJqK=1au939-W60_qQoQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] serial: 8250_of: manage bus clock in suspend/resume
To: Alex Elder <elder@riscstar.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org, 
	benjamin.larsson@genexis.eu, bastien.curutchet@bootlin.com, 
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com, 
	lkundrak@v3.sk, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:36=E2=80=AFPM Alex Elder <elder@riscstar.com> wr=
ote:
> On 4/11/25 2:30 PM, Andy Shevchenko wrote:
> > Fri, Apr 11, 2025 at 10:44:18AM -0500, Alex Elder kirjoitti:
> >> Save the bus clock pointer in the of_serial_info structure, and use
> >> that to disable the bus clock on suspend and re-enable it on resume.

...

> >>      if (!port->uartclk) {
> >> -            struct clk *bus_clk;
> >> -
> >> -            bus_clk =3D devm_clk_get_optional_enabled(dev, "bus");
> >> -            if (IS_ERR(bus_clk)) {
> >> -                    ret =3D dev_err_probe(dev, PTR_ERR(bus_clk), "fai=
led to get bus clock\n");
> >> +            info->bus_clk =3D devm_clk_get_optional_enabled(dev, "bus=
");
> >> +            if (IS_ERR(info->bus_clk)) {
> >> +                    ret =3D dev_err_probe(dev, PTR_ERR(info->bus_clk)=
,
> >> +                                        "failed to get bus clock\n");
> >>                      goto err_pmruntime;
> >>              }
> >>
> >>              /* If the bus clock is required, core clock must be named=
 */
> >> -            info->clk =3D devm_clk_get_enabled(dev, bus_clk ? "core" =
: NULL);
> >> +            info->clk =3D devm_clk_get_enabled(dev, info->bus_clk ? "=
core" : NULL);
> >>              if (IS_ERR(info->clk)) {
> >>                      ret =3D dev_err_probe(dev, PTR_ERR(info->clk), "f=
ailed to get clock\n");
> >
> > While the first patch against this file looks okay now, this one inheri=
ts the
> > same problem (seems like not enought thinking about the code representa=
tion).
> >
> > Instead of rewritting half of the lines you just introduced (which is a=
lso a
> > bad practice), add a one-liner that assigns a field to the local variab=
le.
>
> So you want me to re-spin this again so that I use the local variable?

Yes.

> I understand what you're saying based on ease of review,

No, not only review. Here the main issue is ping-pong between patches.
If you know ahead that these lines should be changed, do it from the
start. But I understand the need to have separate changes for
logically different pieces. That's why

> but this
> is a simple patch

It doesn't matter how simple it is.

> and the change is very understandable, and the
> code is no more or less clear when using the local variable.

See above.

> >>                      goto err_pmruntime;


--=20
With Best Regards,
Andy Shevchenko
