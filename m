Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870750;
	b=1d5OVn92JKCobMgcvc8ci3IG+S7/bg58ADjjC7+5hTxg6Og3Tpr3vdo2MXAEfqUjEKPt
	 yEOb5LL7j2hXgDcaOuCE7ge0UUx8OwAVRSifnwSwMACqOQLCMpRF90O5Y6NcocOPxmAud
	 5ulAaQPqqGROOQMruVGebaYY+sOjKn6k8gZgD8wm105rX+8dyR0nR/hwe5e+EbFP7MWoh
	 qoyO43eosj5fQ1uJMT5YFF10WVLMG44/YMTUyY+bVqSH3lpJ9Ppgduj620rhfEybjwj4h
	 JPQmv1v+pr4W9V53yTe+zsKCDA+enWIxPHspJ2IkqwkGQCFmOn7GWfVn9Wb4kXJF6gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870750;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
	b=1TTEtD6gvd/KdVUc5JtxGxvP8agcisKoFJ6TFJBzrgT3YbR2Brn9nuu0QzsduvPX08Jl
	 4PfsfY8YJte/U000SlpZ/0UCOGFmPR6B9Ump6nfvBwAbx9MLxODboJCasOSSrOjcTfRBG
	 1G22acO8mIPZ5HRPYJynF3gmiDq3EXWlg1vPHB58cK3fu8M98PXPNjiIAGneZjSXkYxn7
	 3etPGVnql2C4Na9j1dGqa6C2BWiEHOhOR1CovMJ4alIUS+7niN45p3OHX3V5SJc7E10F/
	 4ogfZJ/8GllCUIpfaOQLxU2fni9GCuXwSSMB0UtteesacDpGRqLBxV80RMIeJzVErDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F353606A31B
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 09:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F353606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91e7c847aceso14736526d6.3
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 01:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870749; x=1794475549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
        b=Yf6kykjkBnrLEgjKBCtxCPg/NwFw0U0rUCwELL41W0/VibLe8NebXosJIXfT7UXy5/
         5BHzkCnHev/3ho5QRbDOEauLTHDeL7BaVqHVVX3WIrPxHfIDVIsuSG7rUO2MExY1LiM7
         ZctCpqKn6feyvxf0q4HIdBNqeKfcU8X6G8DXktNzLGDuJ9GISKcLWHGn32a1T+cnefSm
         3ICL9b2kVVBgHvr8mfZjn+1FcoiLIrXUlUsVbvDDGjf6Uz6o+qXfICHO92e9LbCEVHyZ
         wGSEEaqWPNUuLdOVkONhMHfT5+N4CevF9A87IB9yOObEysyE3D4kBfPnRZvD8bAn8VF/
         9ZlQ==
X-Forwarded-Encrypted: i=1; AKwUvBz17lmsj5F8cE48pEBe+EvZZZF41qXl40j5oP5Ljg29qzKjKh+pEbaKi0AxjEhijF2POPdRtsUmVA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+6JnH7cuxZKZk7q7MxCSZzA5nBvu6B0KKhwyiqlAQoyPc1OA4v
	+mBJ9yCHgFmAQ3848Dk1ayiUMcCyUwzfWJM/+uXg/SoW9c490D+voyUWbb6Dl+MIYDY=
X-Gm-Gg: AYBFou1mhhetuw6nr6XE91HGaNRKNR/A/GPg4k5ZNiacy2bVs04JF3pcXLuNsoLLTN9
	/IYZdSPy0F0kJdCTqNwLcBUIAxESEwhl8CY1grK51xJonjPRRGPT2HlvfBCPLOWfmCet3JinUui
	mS/aXmXd1h4TbL5fWDc/xTjEKwEYxqsJ00k0wdtstreKZRu1YYav6yhLMi9cfsNY/SWS3atYJu+
	sqp2e9aEHWRtAdKX+xmn1cKeFMkrTon91U5ZmNIC595WQDgpzulOCfcvhlw94e9oaB2nO1vZnn4
	a3zviL7EQ37hl7ISry/40nUnJApD63G4E14/8l8EJdf0PLPAG3uPzAOzG1Fhj8Hpydng6YmVHE6
	BBdDX/GmB2wTkQ2UqlyNDQ5Jdxb9jIGNjIsJp+aykMpuq4HAhkylH349uTnSRuti4D7kXaqU+rL
	Hw6em1f5gQ0AoNhnwV6O4EexAykQMvs8J3pykG6Y1ayick11vv4O3fBWnUE0tOnpC331Ur6GS/d
	Sf64lkIWwwAeO6p6ipmEXKy9er/wm6r1x6ofMzWNfLCoZrz+EcJBCSYodxhleHb21fu0TwC4DPd
	FoY6uwkTpJToTbbWNnH2XattWS91RH3TaH2sVr34hYM+QgjBvIRmWCsB3yZIyMZ8BPlrDQ==
X-Received: by 2002:a05:620a:2603:b0:939:fde0:a71b with SMTP id af79cd13be357-9442135c728mr3186009285a.0.1793870748728;
        Thu, 05 Nov 2026 01:25:48 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4691a76sm421414085a.4.2026.11.05.01.25.48
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:25:48 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-930c0f9c1b1so175271185a.1
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 01:25:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByeL7c8VpRyNa+ySlg97vE9/ZNBc44LanUTZsJGTYtgP/GNe+MLp9urEsvX7GHFzpqbpEh1KFCwUQ==@lists.linux.dev
X-Received: by 2002:a05:6102:e0b:b0:7cc:1045:610 with SMTP id
 ada2fe7eead31-7d072cc4a42mr6604019137.27.1793870415083; Thu, 05 Nov 2026
 01:20:15 -0800 (PST)
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
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
X-Gm-Features: AclHuK-9tAw2bAtaZucYUxK8rDds9GR808jJtyoj1R1Fxu-dNuDK-M2tP9yoLrk
Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
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

Hi Frank,

On Wed, 4 Nov 2026 at 16:30, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *

You have lost the "# Renesas related drivers" part from Wolfram's
review?
https://lore.kernel.org/all/auoQiuIm9FxdOrYl@shikoro/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
