Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98A352FDC
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757431586; cv=none; b=D4ITmg9Ih27Vn1mMiLKqYvp/5s2+wTXLlQgRVixHXgcPblQR/IwLVacULnN4/V5SnrtnxSrxxxrpeWEPUPOktpkyN7jF3unY32vNQzgYH1MEmRdZTNf/qfQq/ZE99pS0CqGfZ4H4vKTPL5lXzvk2QU+ptyarrKLU+3pkcMmUXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757431586; c=relaxed/simple;
	bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHaz+ZUz3xyMCBpJHzNyGdUwtviJIN3y0XNBpGkTJEZSc5RPfUF2+xX7m0PLndzUBw0Smnkz1KKuTMEw9uvnIqjGmDlFlbAF32HXfnNtDUm4oDR1MgjjoB7mqpdZ94ecYNShw8X/Adc+WNtTwblO3lenUYyvpqYEoF9N7jhW/7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/V8tck7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/V8tck7"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6188b6f501cso7397913a12.2
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757431583; x=1758036383; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
        b=T/V8tck7IXU632Is5E2Hxl2NSX2lJSv2OJenJ5KMIE5mTRYhOTAKgcks24l+E6F2Sj
         kO8ZgtXCsl8o6fJr7ZXJm4U4sntNhMwlVb0eLOfFOrZcfONoLi7Vnz83kBu1CJF2JV7i
         rBaNkyY06TMcSWOPm11oOiR1ReDuCy13CXZlaL7JJuyjTsJA9FgaOEqDPM1lYVy3QLrn
         uoUoifrMTcchmWCbTrpXjJRV+7Y8zUA+eLNU7/hcubC8h/HP6Pghoo66NsssrcN9NLUZ
         0q2svr2i+XUDoi3Z5uHZEgCJQXoA/SnItVZj3JHUEa4VyKklVrNj7cj54c6ep7IBKPXN
         5+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757431583; x=1758036383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
        b=vebLOvJjV14a6kMQ2ZG1A/kZbVj7ZteoicecsYVORhkyGxd5wvvoloxcEK6jHdG6RI
         dXuaOhIvsZOldzLX2J2ZqSbvftNWC34hP1h3QUEre0j+oJ59Cwy5OG5dALfCa5PoWn7V
         aHp0jdGt1CZ34njhBJJvDJhVJdG1dcNWCLnXZiqNbgVsR1Mtsmhx7A3q7exn4iIZqjUf
         M6Vipk+9+w2EIbfthURQMPB51emvpFK+XJpGLVt/6H/L4BnZzUoWa7VuzkPgiwgoPgwx
         ObW+y5oS+q5zxmoHmPRlZBnRrv4ttkoF3Dm/JdIopnLlgGB+89BCiuoFcUYqEqkBEgSh
         eOsg==
X-Forwarded-Encrypted: i=1; AJvYcCW2wIe/Lu4rf1Xbyq8PW8Ay80dHxJ2ROjHP2Hs2lQtQ1TPmAiuoTVKEmF67XpebnBO6XHAawurAgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZAXYHTwGQ/aptsihFqKuXRCNiKzGLj0tnnzkr3RXu0qcZLVzU
	VPc3dg5q8+4kV7pWxI5SKrTgIagX3shyGjcCoGDCMUVV8bJ0JdXEb7ghh84QaheV8kxcCy+Lmds
	SBE5ikgKw15IR5MjU8mqHpB98NWaqUTU=
X-Gm-Gg: ASbGncvIYolemaijVL+Y3SadLAXRAIHeu8hkLkGhkvH/ybI39B+nwkMYnqwCyrtC030
	rW4NFJDRemNJMp4560tmapAFprY9OYjCrMp01g9UQ8jsIxxgHwECRG+itAe1K/ws2lhaKHlxv1/
	t02tMAldhxH/VPWNOamTVA2AL7teakGDeqbHP6o3ZuBDazCy73G5dV5MeJz1abVSljpFkWVzhAa
	sYprJ5HXQ==
X-Google-Smtp-Source: AGHT+IGZg15DrtF72G9h9dyt21xSsowFAKz71cJqtEpccOZC9aRv/EPnYIUJriaKNXq/eDdw8hEDX9pZ4E1DPi0ePuo=
X-Received: by 2002:a17:907:8687:b0:b04:5200:5ebe with SMTP id
 a640c23a62f3a-b04b173704cmr1239828766b.54.1757431582431; Tue, 09 Sep 2025
 08:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
 <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
In-Reply-To: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:25:45 +0300
X-Gm-Features: Ac12FXzLAWj8jy-m4m9ZPXb_pPgfqX2JAuL57q-duTifXdjD_POsau2MIQgkxqI
Message-ID: <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 6:15=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:

...

> > > > > TBH, I think those 6 all made the same mistake, i.e. thinking of =
the compound
> > > > > literal as a cast. Which is not!
> > > >
> > > > What do you suggest?
> > >
> > > Write it in less odd way :-)
> > >
> > > foo =3D (struct bar) { ... };
> >
> > I don't get your reasoning. typeof() itself is well established in the
> > kernel and doesn't
> >
> > foo =3D (struct bar){ ... };
> >
> > evaluate to the same thing as
> >
> > foo =3D (typeof(foo)){ ... };
> >
> > ? Isn't it still the same compound literal?
>
> It makes it so, but typeof() usually is used for casts and not for
> compound literals. That's (usage typeof() for compound literals) what
> I am against in this case.

FWIW, brief googling showed that nobody (okay, I haven't found yet
reddit/SO/GCC or LLVM documentation) uses typeof() for compound
literals. So, this makes me feel right, that the form of typeof() is
weird and works due to unknown reasons. Any pointers to the
documentation you read about it?

> > > > And are we not allowed to use C99 features now anyway?
> > >
> > > It's fine, it's not about the C standard number.

E.g., https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Compound-Literals.html
(8.1.0 is the same).


--=20
With Best Regards,
Andy Shevchenko
