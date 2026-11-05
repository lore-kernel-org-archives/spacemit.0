Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871872;
	b=5XBj292mQqc+fT31bKNEoBUyreyY5Ig9we91gMyeGiW4+6qkiaRw6jklhTGwyaJby7e4
	 8ZuZqdE/D4+J5u9qCgmNcxhPYMamGmDkFNVFjD7x1OfQv0R+9JhQB38IHn4sSqOlYpbbS
	 2/PttUEYUwnp7/Ta24RSViCVm2X3HA3fz513ynLrZccSSh/X/QAfAjDqpgSq98VdGobbR
	 W9KG2X0THGycv6xqYFDClsoF1VAP9Y8XFMnWpuZ3DPb5AxMLuIauEAh9ZmjIFLXq1Dr4+
	 aGzo6NQvUK/wuQCfsdzsteoNorF9KafPmhH9ohdtYlliQwh4vwJjO7V9QtsswH+kOcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871872;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
	b=2fSjptBvRJYvfy09VhH/bITJ4yvDiLEr61u5ccIto1/6LOGsewsRb+j3r+D5emST4/+q
	 l+t349tzoCfLe0WIjDUAnUyJ6+5jL5aUK81d0OgWVrvufHRbd73vilR9vIoazYBjSejhc
	 7UEcEWHu7bZ0DRtPuqp/MJpjDbEcxeA8RLo2fMsuis+ThL+TXsEx/uqecNV8fMa97VXH4
	 /vlu3+UNTwAsZfaGJvvDb33oViwGDe2cVTThbZLWK91e9vERWduxsPgoRwyi+4IxuGILm
	 54q3TgnwGY4LGYz48NPL17vUF1f3676uF8ifTXQ7rWN2P6UZIkchpL9epoOl6MWzYHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DFC606A31B
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 09:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DFC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso876284a91.2
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 01:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871872; x=1794476672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
        b=J4A+HuOkw+zSRLEGR17ojY1s7GaIvmZapgW3bTM9kILeafofcRfFhjzO3Gwoin7ELG
         BXgmoWaTkkHPmgmpVTU+DraXPAALeRPcmbKX60vOIs+WMAqEBuuErQmNz6UyNrneNkIh
         4yCFqNVvasHkax/HlUaL91kbv00MdmSQbrV1+MMjfwjo15ITG2irxQSbUMCiNQafKSbF
         ylP3hCATKzG/lfNY5/P8uOJnn3wGkYKxulOYYzgiTM2T2OsXzwvpWnIzmwxDYnVP97sV
         fiLu1cIuS8kdWX/uF26Bl5XfhUWdYK2j9R1CSYL/VBrkk/3Sg2MhROjmnzOSOBKs1Fjg
         va1A==
X-Forwarded-Encrypted: i=1; AKwUvBwqR7Z29+s5b9C5KBaDRYKEExh0KlVl0qVUwz/nh3CY83W79FGnCPb0e2TrxSD6SqNOM+yQo356fQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/JXnazuM017q+RMO00dGKHoYoJ2e7Z39b61awnedC56qwMpvNc
	r3/QYyC62D5bG+hvZExJmxHJoaTjjUS1ewU8I/CJobBcbrTvGWrTq1aefZR0YIflQSA=
X-Gm-Gg: AYBFou0Aly7i863ehrrsZH5Z7F2NEBS9GNzUdf+yFR8PjnvJDScVvzlDXasp9H1cSY/
	xTM8qa+DgcrigxrcKBVt/RnEGtNmrpWWbqk4DuzyYsm8/Bkxg+z6gxK8joHH/4Pynr08dOxb0wv
	9ffCbMgGemURba4GAfH7LACLQy6S24NZayEHVPBHGP7rDvbv2uqJt0iW8gltIbTPBn2erGUhjRI
	ZWpkr/d7J+qUiJtRkHHo2tDHaeA7hg7LLUBnfAfe7smAkBAn6y57WJohXB7Puh/0iMA0Nx7DYZt
	UrHcSGRcNNR9pBAtAJM9uVLw0cd5brLMEme4dXMAFrNjno5bzV1jeCecIdbWolbPppa707JjLq4
	yeU6KIDEYVwGgrsS2Nupfhu8qF1j0mkQJsMiH0yph6SloHDE6deVR6LiB4FTZklkQ49uNNhyS7B
	1Xt9oUfKoJ94A8D5jsgyUy3jnOvRtKLKjBxnXK/XOiwKZEq6lCu82is33AypXJrT5tb069jruvi
	LCJ0lIc0VmSCQjlh+3mvIYgPr7lLoecMp5AqreXmMRYZsFiPF2whEHtWN1rRnTx+K8sFevm+3dw
	TXlZ7OGQhiWw5KKoSJ9iy8Iuzjf4bsQd7Wgv3t6j/XyM+MF1prXw98LW56lbMaMbbfBvRweL6Cu
	JAPdyTvXaPw==
X-Received: by 2002:a17:90b:4b02:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ae89574e29mr16729957a91.8.1793871871559;
        Thu, 05 Nov 2026 01:44:31 -0800 (PST)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com. [74.125.82.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32678ecsm3334150a91.9.2026.11.05.01.44.30
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:44:30 -0800 (PST)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2af4c8d00so320335c88.0
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 01:44:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy+lc1c8U7QxNRLOj/sGJNiFvjFuJAnowtkMzw8qTlRdsot+Q2kj/9sv1f3/vcjraNAG3NlS6JN8g==@lists.linux.dev
X-Received: by 2002:a05:6102:3711:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d072695e4emr7033715137.14.1793870187629; Thu, 05 Nov 2026
 01:16:27 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org> <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
 <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org> <auxF9RT5aljXkfh7@ashevche-desk.local>
 <auxGdYgJvjq9EBu6@ashevche-desk.local>
In-Reply-To: <auxGdYgJvjq9EBu6@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:16:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
X-Gm-Features: AclHuK9751j09IKd6_4EIkqyFvn0FA5bsvqOYkEgIDax6KzLeXviQYPveqzIsxk
Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Konstantin Ryabitsev <mricon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 10:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Nov 05, 2026 at 11:01:55AM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 12:02:21AM +0100, Krzysztof Kozlowski wrote:
> > > On 04/11/2026 21:44, Andy Shevchenko wrote:
> > > >> Andy,
> > > >> These three lines look correct.
> > > >>
> > > >> LGTM:
> > > >>
> > > >> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > As
> > > >
> > > >   Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi
> > > >
> > > > Note, it's in your power to ask the author to split out what you maintain
> > > > to a separate change. So, it's your choice what to do, Ack the full patch,
> > > > give a partial Rb, ask for a split, ignore reviewing (often means silent
> > > > agreement when maintainer just applies that kind of a patch)
> > >
> > > The "# note" after the tag solves the problem partially, if people were
> > > actually using it. Solves people looking at the Git commit and being
> > > mislead by partial review applying to entire commit. Does not solve
> > > credits, because Rb for three lines is not the same as for 100.
> > >
> > > From v1 of this patch, four people (Alain, Lab, Troy, Kunihiko) did not
> > > use it even though reviewing only part. Only Wolfram, so 20% of partial
> > > reviews, used that syntax. Without that syntax, b4 will pick up Rb tag
> > > like it was for entire commit.
> > >
> > > So I do repeat - if one does not want to use that syntax, then just Ack,
> > > instead of creating false impression of reviewing everything.
> >
> > +Konstantin, then we need to teach `b4` not to break that or convert it to
> > something like
> >
> >   [FirstName: reviewed only ...]
> >   Reviewed-by: FirstName LastName <...>
>
> And Ack is not the same as Rb, when I *reviewed* patch, I have *reviewed* it,
> even if it was partial one.

Exactly.

Ab means I won't take it through my tree, please take it through a
different tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
