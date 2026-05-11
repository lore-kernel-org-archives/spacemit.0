Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498B3A7850
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486540; cv=pass; b=cOLDuvdVfWDhpBnK2iMH0dqaHWQDAY/rc9Wc75mJp41xP7PgRSlIt0bVZEgxF4BRNd7EyAvKMUQv95yS2VNhpBxR5zOEYn2IFLoLr2UEyB6sQBE7yIyf7p9ecCDqgVZ8mOxlCzZv+j1YoNHZnT7aVl917nX1/tmtem9p83YG5bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486540; c=relaxed/simple;
	bh=hAvNwN3LdfvaDvVGl1LPpgogRMQ+ezfmubbeLc9ID7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gvtwno4eX+pFRnaxxk97PGZUZOunnNt7LcOkCB6WSMnSvSZ8xg1vdxyhY/ZHZMyxlyQk/fq2rl+lgbBQ+3UlSIhyhgZr91YZYL9mZ78bBfZw80cXLFS/+jHEgMPG2Q9JK1oKVFRmIoxTlkUJYoIM+oPZHdhOII0OXaGVInQXe98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCfX0qLr; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCfX0qLr"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65c7a459105so4373409d50.0
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 01:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778486530; cv=none;
        d=google.com; s=arc-20240605;
        b=bp9aBl8QC1O1jVrz+3RuPpzOLMpFx5Bwb6WaCMZ9DFXPB6vaJoDz2b5eyfnfXt/CfQ
         4gctx8NRFDjZsna7F8fc4WpAz3+QIdOrIIBLcIQReJRHn2KI8D8SeE7/Hndtnt61P6s5
         yBzdU7aoIemEl7MHcIfpFma5vYX483L9agDzEqY7lEwWu9nkXq9DV/YEHO1aRA5AfwY/
         AqjMKkGSZEVoW9U7jsertYj3Xca6E5CJkaUws+moJeyEiGdJC6r671GTW1sn7uvnhBcI
         hdClEXAf2MDCmlAg/fkdVzGIR1cbz/0xlQI8VtWqkV8JF/nVUeugEOiVjl3qXwzFgwai
         D0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        fh=TDAld+PzvNxuFWy/xTfl4pmY02nL1t3HRNM7qxeVPs4=;
        b=ZjOJi7iTEXGc2sEI5RM0GPWKxZeYJGLuThvdxQMvVGeN461NWYV6dkNRjZh+TymX+q
         ldG0o6I1sGzszx/d7evxRJZ4D6u8epW9rGk4GRIHzFs0Aecf0/e2n53VWJVFbamnK7Fd
         MUML2W8O5sG1WebuQ86+KQIInpuLb4fTAjMicjTYoMYrQ8GoPZHjk5SSCxspGvuu6RWq
         XgGrCzeUkLpIBsFXF6MHXxRTLdjAugjlFQpnXN6xa4PwNUvxNrPGzmSsxb0bIRWdXsIO
         rz2F0qZi3W64afmTZ1tSO7H0r3mf61T6a2b0jY/uGuTuO8w4l7KbaC1rFgIDz/HLLkxu
         Fexw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486530; x=1779091330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        b=ZCfX0qLrVlv890MpuhbcuBoHpB/J3woObUqA9uI1Vmbm6W6/Hb7BJKWMwC77BzUV1Q
         lbcWYhjnmvtA0iZNaNMTlCw+WocO/uoeBIAFMqlQbJB5nluY+jD0K0MQSOYsKSwL3LpW
         pKRh6gddoZHJDXESIgUuLUY3eoCS1Xh7sGjOl+xsPNfGtFkHjIL0x0tF9szYLf2xt6aU
         089PO1044nH5qAirmaghOShb1us42pIc4DkoCM+drzB+0XwumUbR+GfgQMpbotWb4sWF
         kVW49lUJqXlkvdDaPmDIix1SVXULJgKa8y2o1N/qZPt7HcOYcLwnbQOgSffd3zUGoSxG
         5OrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486530; x=1779091330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        b=CIq4E1R7HLEcf5mB0BblMVzdJ+uzvN6pT3szwT1UmG702EmC5eZMdA/DN1XK2kAqIt
         qPPcNBciQgaHC9XOCGVQJ5/7tz8W5nYyKxfkbEzklXSa6sWbUgpKuMsCBxlnMrjj+0af
         PNVrUbZJW9OmNrzcfLo+r61dxDGZRAQbiled4MkGAcY8lvZB8JL27on7NCoffGbQL79+
         ebImejBUhR341XjvFkjjGa8gJQau4dBst2J8tBDm8lxUENy/esU0b2l07OsaBurpB+eh
         EjEubv6yUxsDFTLRS3Bm9SlPFqwz1QHZHjXOFd7TlkbjeWQ5F6Kq3HdsnnoBCXa2ddcL
         eQSw==
X-Forwarded-Encrypted: i=1; AFNElJ8aHbYRFs2F1a9JT9y/fLpa1J8UaRAEDU66FOeKkvnOTRk5dnBGDTKBgIG6ohnwEZby4rIrba9LAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YydnDU/56ffBqjspiy++TQ4AJpF7sxr/8AiMNp21/9Tw9OrzdJP
	eGL87lkl4B3b5HAvtK6hQatuMsk3xyiNTAGBB0bHBVmfg+qwBKHkjwHhJ435hloHCBivc4BNgq2
	gGLHNFsT3P2I90JW8zIdbbZruQKUO3N4=
X-Gm-Gg: Acq92OHt4fUnzMbZapWR0+qejnWefKxxVysND9+hUiiDJDW6R++X7hmN4j7f0K/zoco
	gNJ9gJmn/qDs0bwLLfVm9lpfPJSzzQCoYgmV6DjxvbPkBBHgyF1GQPY20Jxqm/q24qI0HTDYHjl
	J83EQuxAQAlycLkDBDBJYFybYR4zermEMJyuBjVhP8cGlfl1/odOPxuG3ptTpisSSrwR/Fbqpu5
	PYqtKma+x7YMtJIM3conEN3YKDb+OLYyR6LB2k7RrxaaBTRk/6PTRV94LMZgH8qj8ZJfwuyGo4C
	KpIowbhe
X-Received: by 2002:a05:690e:1905:b0:65c:6ffb:3038 with SMTP id
 956f58d0204a3-65d7e822e64mr13587707d50.17.1778486529994; Mon, 11 May 2026
 01:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
 <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
 <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
 <DICDTHYTPDSP.210EBVHTQ6966@linux.dev> <20260508225341-GKB3590877@kernel.org> <20260508231051-GKC3590877@kernel.org>
In-Reply-To: <20260508231051-GKC3590877@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:01:58 +0200
X-Gm-Features: AVHnY4Jd8hC8nSk1elUyO1V0E_fXdX8QCiSMcWMOA11otgjNrlNzYjy97ZtHNls
Message-ID: <CABdCQ=NFuW-XBK2zrw2TUFrEg0Q1Wf3_qS28zT3v-Hfud8mkew@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
To: Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
	Margherita Milani <margherita.milani@amarulasolutions.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El s=C3=A1b, 9 may 2026 a las 1:10, Yixun Lan (<dlan@kernel.org>) escribi=
=C3=B3:
>
>
> On 22:53 Fri 08 May     , Yixun Lan wrote:
> > Hi Iker, Troy,
> >
> ..
> > I would object to add CONFIG_I2C_K1 as hard dependency, the reason is
> > that the spacemit sdhci driver (sdhci-of-k1.c) has no used i2c
> > api/function, it's just need I2C function via an indirect requirement,
> > which sdhci -> regulator(p1) -> i2c, besides, from the hardware design
> > perspective, it just happens that K1 use P1(via I2C) as PMIC, it's
> > totally possible(even in theory) to use other PMIC as power supply
> > control which may not be I2C interface (maybe use SPI, for example)
> >
> > If we want to solve this more gracefully, I'm in favor to add explict
> > option enabled in defconfig..
> >
> or I think it's better we do this way..
>
> +++ b/drivers/i2c/busses/Kconfig
> @@ -794,6 +794,7 @@ config I2C_K1
>         tristate "SpacemiT K1 I2C adapter"
>         depends on ARCH_SPACEMIT || COMPILE_TEST
>         depends on OF
> +       default ARCH_SPACEMIT

Thank you all for the feedback! I agree that enabling I2C_K1 by
default makes sense for the user experience.

To keep this patchset focused and avoid cross-subsystem complexity,
I'll send the I2C default configuration change as a separate patch to
the I2C maintainers after this series lands.

This way we can get the SD card support merged without delays while
still solving the dependency issue properly.

>
>
> --
> Yixun Lan (dlan)
