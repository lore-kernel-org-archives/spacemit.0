Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78672D2486
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697188; cv=none; b=TCzfDsGCLE2vxrPGtWlgeEmKWfOEQKba441JHZM1pKdcDN/uhdJmxHIfb3l2wREZT/DdqTL31EODfXwrWNaAx0nYMCGnA8lc73u3BEjdp0ZcZPVcPOFsfPjKqsHAimU0LG6dOU11ZAi5eV3d8Bf1luYPTFcBkpQkpeXgZp+Snzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697188; c=relaxed/simple;
	bh=urVD1xPdaF3hV5GqXqVqTidMinFWi7P2lc2J0G3o7gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YvqSuxUHxBHjICn5YdeiLSC0+xJr8sGWD4+Z8/G9xZ9R9OjyzskcT71ZU2bsRPYUuu22su6bEIMLFEahp9FhbSspoob1ACvv9lnr3unRBrvsoec1KMOmIZZRDUv8GALjKmo9+rmsk/B+Opz6NRMZVwLFC+7Tcw6+7cZ3Mn4T4sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4648447c899so4861710b6e.0
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 23:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697187; x=1773301987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=aVwkNhXZ9lMAlxtKyu6N2g4Wk/7sNbJFIgLYJSxf3h2LtQn925BM9vDXx+ks2icjNk
         pueeLhBNt8yHWZjp9a7Avb+5Fpwk0yvLwZqf3W7AF/3hGMOS0hCR8+SCJC8MUgg7dhnj
         8mDlMCRCQKH2+hcqLFbCEe/aVaqLCAH90s394DNMesF+l+Jq5+uWLN6CwQrXXqVXAdNf
         3Yk92cRxY6mUpvQ1ZBAzD23k/nu2y6LK5pp+E734y4k3hM5M+a54nwc2YjsG0O4Mmmm8
         m/isgfMt2Q29PlD/hjfHF42nx6U4807qqzLS9PeZHkn3BFBlCUNAhmMUaTnKVrdNFOe4
         fc3w==
X-Forwarded-Encrypted: i=1; AJvYcCXchYTcelU7TrOlcTU67Lo9rBFlKJDp5sCW+AcpzsJooLexzPstuqZXGKUOyGvs330qzrGpSa4BTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaGn19Df5OrBMsH+eJUt1OzxJGX3vpciflRBwIJXUrt5mBWjZt
	MMZzpiigf75AwoyOx2edfDUIcjIpTCHFcsAB1MeSrcDsk5Y/gbgqlQaHFTmpePcf
X-Gm-Gg: ATEYQzzDToIbZYnoo/H/nkx9exGEMYkUy7ZCmMrR3Rv+bzOPqZXfp/TpcILBr+TBzvj
	tWR18H444vbFazS6Rbnt7KZkU65i1EhUR9MnyDPFjuefcZl6W4h0i7Htbc/FCPVljl8O79PsTmE
	Dhhczs7Hg2Nodx5kmmqedyNx/nu/rkWTuYh2IoS/4DnWk6PjyJWS2vyLC5QD4hbL5pPZTqa1Pvm
	MamFwcH9bVvZxB3KEnC4B4+xmuLXcKuaq+lpeVOoe6h7ZldkIigbK5mjjLYD059arzlh0P29ztg
	QyObD+U2pHpmlYFLNU5mt7jHUXlX0BXQjaZD2L47++Umyk0xdwIGoElfbpXEmBOCW1XihKdp6vz
	jhGCn7hufFXG/eAx9VVXgVO6VILexisjqHZC+cUCyxuznx0QI71Lh5xy/gm6CQoeQoIDtqnu9vu
	qF8qovxbUTCo0PcjhGiCJG5lJ/VsBKOlo5QTJFmOa35TBOEBsffHA5ensPopLf
X-Received: by 2002:a05:6808:bd4:b0:450:420:64c7 with SMTP id 5614622812f47-4651a930c25mr2762496b6e.0.1772697186639;
        Wed, 04 Mar 2026 23:53:06 -0800 (PST)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb352592sm12840300b6e.1.2026.03.04.23.53.05
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:53:06 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-66f3e7d9eccso5056751eaf.1
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 23:53:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3/NyWqIAdjvMPKfh1D4rf7CcDo7P6NV/A1DEOQskyGm+SqYeE30bSMaqAPMnHyafZFvb5fyca7w==@lists.linux.dev
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
