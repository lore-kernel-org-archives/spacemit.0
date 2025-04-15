Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1EE10F2
	for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702351; cv=none; b=Uwv8SJkyhlFS0BWEfO2MvZA56ed9EmNZFh6LB3SDRk1GN6RoftBBuSWKd9/zO8Gr1vxPcrX22IYifjeVm59fe1jZHK8yz9PE24M+sELuHfxOdi0PI/VdY/Rvb7OzsbN98WimvfaIoLEZcnvckckjFr7ks3neg7jF9OwIfbTfDs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702351; c=relaxed/simple;
	bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLDOXdYKQ9f3SvkkK8D2p3Tm9Dtm0FOn0LojeDK0+sJyQ+ZznD+1b057jHxuciBnbxAOms1huwNRPcqrhcalZAXqrQIR0hqUEGETKZMKZLvNhKPYB4g30IyQS2OvPuXsstMLZdBp7is1ZRfOHan+3r65cmjAWCBIkDK7L6C9Jao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABPrtvxl; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABPrtvxl"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso22624001fa.2
        for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702348; x=1745307148; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
        b=ABPrtvxlO3n3sHJIsgLgjnIBD2KXZKzt+EVWVaReU72LtpAeIWcrJ03+kzc3aWPm7C
         VGgxkhaC6SBeWV+XlHPLN3kPjw1KWJe4qTqa5qHkeFSsz2k+xJRIi9J6chcdZYDkDOyo
         P5cZkF+1smDOic89rWZUYUyupORKl3ytQLAlp/1Rh3iAkf0UTK6UoGd3IIbqZWwD9ggY
         rLp+Z/6pz1meqeN4qSGagNzikCFUpcJASBiwRfRwF6beWHcqtWMUiiLjGzLgyGT8eYcp
         BVP12P1tLOieEDxqWv0245OXbCugNN8gCloXlTvm1ng6Yp/ihzj4jYeigqGoP7dJWSNm
         T6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702348; x=1745307148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
        b=L99jySTYJsTvmIGS7Xqah7dWHcF8FlN0wIDwvJ3mwduRB9AA6UfRxHhD/tHIT7Gwoc
         0890BFbCS3BRVCS68kIquS3GxZXpsdxArsXqut09LiGZf9+g9N9nI9Ab/FCXwOz6thvf
         VF/djw6zGuqLMlBZrRj2U7IvmPpTfKS0yLhu5iM8fr8D0QE1Wug4qnyUxba/P8q5Yd57
         tl4YKPA4W80vpT7F4EG34mNumuHAKTt8mVfF3tqtPzzuQVmRkGPfpKLqoSOm647YoSGB
         he8ynnXneqngRJlwQ8GIdwHcAYfY+upKlTJWMeWbfGKQsJzd9xWmGfDQl2O8gC63XId5
         Mdxw==
X-Forwarded-Encrypted: i=1; AJvYcCVM8Z90i3gFXsuvEi8MxsGhzvy403o2CJWJG7ml6vyRbvBzNy48K5ncWIWp6OXRJ05NTA7anBuggw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuQ5WoHUJjePdeEIPLzIHVVMvEvF21eIYfRcJ54ALRTPizZh9C
	IXRx0MQhcsZtFBkmMjysmIQ6oytrbRw7Piyohxq9QkmFD92/3OeSw81m0ryicyO325E0v8ZfhHu
	rEbmiIPGep6Yo0Lja56uo3XlDaGFIOsFEJnOrEg==
X-Gm-Gg: ASbGncthdNwYzvfZjQ9rHS6edhkO0RRLkk5a1RlnVxZziuJi9ADQ/2Ddod93A5xoZfv
	9z8Y5IXkTUDmvcYpQRwPWDwgvX6qWqVnLPuNkPUM/z2YIwNUtmfSb9oJ/aHGKWHlzhU0QgHoMt0
	8nroLxUhLxZWI8O2qAcdPEVT9DZ58JluOy
X-Google-Smtp-Source: AGHT+IG5h8f4JUB78zhRjxaIrh0H1nzCuXUYX+YRVBh0UXEwBIrUvsqlLX3M1mFXVx5pHR23X5R+19Gz8uYR3GSdZ8M=
X-Received: by 2002:a05:651c:1607:b0:30b:d022:2fd4 with SMTP id
 38308e7fff4ca-31049a7d074mr52085991fa.30.1744702348175; Tue, 15 Apr 2025
 00:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:32:16 +0200
X-Gm-Features: ATxdqUG7_L4ll5R2NvuDSJ1DXWDqWrMJi8NcaoVkYOT_klHadc44zetWzT1zRS0
Message-ID: <CACRpkdZW0Y8rBux0KcvbnDH92oP=6oco68L79VX2a=uc+2VhmQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: irq: support describing three-cell interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Tue, Mar 25, 2025 at 11:07=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:

Sorry for replying so late, I was a bit busy.

I'm very happy with how this threecell IRQ support ended up,
and thanks a lot for driving the infrastructure for it!

Yours,
Linus Walleij
