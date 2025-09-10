Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5030B50C
	for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489358; cv=none; b=uvv3VMl5EIILdpRLl+9yIOx42fLaCm2gvnNjSX7HrrK3mpViJE9HGkrpDpTbb38QdaoQ3GXL916dkHsGibKCE3dCQo6rJDwbjV94sLgESdHH9psEb3hW5vbcNuDxUJNyYiLCxLucHOzBtMd/wGLIiumcoDUrt+H7JqcYTqH9GRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489358; c=relaxed/simple;
	bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDcXFoJSHxL3gY4e7YHHGH2iXKif5kNtwYE+YnQD5wgE2jSID/kTHpROMHtUwiumqmk8qEE5A5rwHzuoixkt5Pc0wxwC/RmbdR+oaT8NICXoGCwc5NcfrpDmfKnOi0ZYxVh1eDVpDmpdVRXlhoNWcSRj6Rd2SYwc3DiCVNhEN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XtRtkGx6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XtRtkGx6"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f98e7782bso483186e87.0
        for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489352; x=1758094152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=XtRtkGx6Jj9sJaIf4gLFtZ4F9W9Oc+5CLMbOsBuU0IBL0LcEkqr+WIeM76WqgZAQoA
         CESZDRgx2kAxwZoJ1uede2jlw5CnYU1AhyxIwpR4bXeeCoHYod4V+CIytJRBEiMJSG8L
         OWZTOHHj56D5KqlXNqJ2tpposqJOsz3j4hOsxgzYDT3Or0ccG/j9TiK6KmFQ/6oUVVJd
         YYgl8lUBSHWz1YotFp19xBgXC3Z8Q1pxM2tItoEFcGK3BKvdutDnDj+a6QfPwY86ujOk
         M4uhVnkcoQ5rIuX8dtsne7XILGCwrjc3s6vgX1glKiOkDRqW6mznMB3N6govqlX9VL+p
         yRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489352; x=1758094152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=VPAQKptMVWY7bJIPJhQeFwE4uSXeh4s0sUPqV4UnsgNijL9pN/KuSs2qB06+TWUexf
         kF52Jog2Ka9ymL62Gd/+bm4UiN2OsEBtuClZa0vncWBXvkUiT+jmb1AmfDQvVlRxwR2T
         AdLeh1p9d8flU2JGqXRnm4DohVJoltKOrxTs0DsnrRDmd34PF9aeVneAJtpvqUhWBJBh
         grmJmf61vkBZ1HNDGzTJGqd5EkQc2YIO9oMVyAW59r+xEguwYUfXNJmzS84fST6hy8ui
         3swYQfv6hpbUwJ+O5Rd5rVFQ80mQKYPOOGSUGMCjr6uRBrQ1lykYxxq5QzpS9yhh4i1Z
         tk3A==
X-Forwarded-Encrypted: i=1; AJvYcCXr3BGWMEWExKwdyCcJIy3+xNMwAQeBuz77zkI96MHP3626bvDloMAh0zLadPFMS/fxuxcjOQkpdg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0azwS7N1o9/8yUntN9SapbfBaMPrhh7hIPtmx9Oe4RR96wBQI
	3i4QB90p2phbSp8HSrQGovAY+49NMiXnFUfp1TcupF59Uk5eJfhEmCgvdx+qzTqQvEaxRpbOhGe
	3/8bPH2h/p7gNCz3lSOCkKLF85U6xDehLAlVl9Ww7jQ==
X-Gm-Gg: ASbGnctcBdr/8VSYmnSzurLy9aCFvTeIAM9LAVlp6lKJw1/wX+NXSSIWSSzzWTh21To
	ZnrGPh+qft541kQGVI5WgZ79g0GXSGUwppuOyqLgM2+ScKmy5w7hg8jKFQI6GOL4g/9FYnGx2Jn
	kN+c7hkrp3NtPRm2LKZiGvNVk38DHqOAhoLlbrLeBb/BsEomBWKiNTcvMLllxXfs4gzcF0MMKs8
	+Cb+yKhS219zNTp1h9p0QfzI2g9BRGibF26Phs=
X-Google-Smtp-Source: AGHT+IEqPJ9kigcz2GLj3mP+JOGINamypRE0PiCaaHlUwxbs7HlrGNQFZsWt9jHWryRE9N3BOTU+Nqgodo1ymFIXUx4=
X-Received: by 2002:a05:6512:3c93:b0:55f:552c:f731 with SMTP id
 2adb3069b0e04-56099453ef8mr6704484e87.7.1757489351780; Wed, 10 Sep 2025
 00:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org> <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
In-Reply-To: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:28:59 +0200
X-Gm-Features: Ac12FXylJ9GUUlvsjAHDZW0ZjH7_XucWxGNpk3CSzJ659744jxYcf8C0LoVlvQM
Message-ID: <CAMRc=Md1kLjELc48-fvjsgpZH+t+kE00v0uMDztubooM_AJ2oQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
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

On Wed, Sep 10, 2025 at 9:19=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 10, 2025 at 10:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> In case you want to take it
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Otherwise I can take it via my tree and then PR to you.
>

I would prefer to apply the whole series directly, this way the
conversion will be done in one go.

Bart
