Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9F3B0AFC
	for <spacemit@lists.linux.dev>; Thu, 30 Apr 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550824; cv=none; b=CtH5YXHq7gFSYNvdQfofJq6u/1+dtbSvSIlq9beWF444Cc845Pzj5xhkH2KXFTdFc2diuebC+sFoiRc6tLGTp/G+AJGqECT+dS6lz5TtxIKaOPsw2B3vTuEs5YpUEAkJ+D00MdrV8isM50Hax9vOnkRdo9+JgiipEfy/wTQBmLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550824; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaizF7YQvwRF38zKiM+1F9defNwTI7v0TSUJyQPOLl4XDDIQPOc3QVhZ58qJGNcWAnFZVJHhyQfR22ETIdWtvpHWvHxEbap55tfNCSL5+pMLaxs4HK6uRWXxP57xI81yx3VJjr3gfACXz898npmX0cjcEPBd9DW7pHz0PBvU/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dcdd1b492eso900965a34.1
        for <spacemit@lists.linux.dev>; Thu, 30 Apr 2026 05:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550822; x=1778155622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=kcv2D3Gqq6kBM/VkHUYWmZalVbjW42WG44cQ2F0nDVyv9IBUiT1QxseblzvNMPVA3X
         sCAZWQlvb6wA29mLNQizmjbgznX8SNXVHhbgkOOLJSfGav+zOCNYVQrPG1jmewxdzR20
         R1jT4KiwgTvcutI2/J+Dd6WwF0hr0Lvx2uiZzdU5J+2zbKBzbIVOyy1QaX23+SG5BUsM
         FAYlesRGqIq6pUcyGU8SnUd30gFC2a4d5JcSEuVYedj2O4nfhaTEFd+89KrA+LoSeP2/
         bIGw7SJJN9Z9Uo2KcfVjlNyyRiRzEVEfHJDgUZMIc6weZ9EW8vvZiKMHWvU0U/uYX9sE
         FtCw==
X-Forwarded-Encrypted: i=1; AFNElJ8xlkm+XORc1d4hRg0GQ4y96KtgAVPuz76oHvJ7Xp8yw3I3SfPlt7uTbsv1L58yZLe19ApVlXurpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFK2+GEiaxYGbHyDbcVjNoFo4Q4fqAtt8xiHtxr0zyHu4w3Oxi
	ZfrA9PhhZtzaFySB6l99K9GTWLnwYZa3X+UlfqdXpeheUrUrteNTQ9C6rImvBhCO9iw=
X-Gm-Gg: AeBDieukDGXfE7PY+f5uFGHXyBp6FxIKWwuRicNaiTHgv0HvWBTXvb8trePWgNuvGgd
	wprMCHRgss/0C62XR9ED4NWzJZyvYnkPHyPm9QkOIGIpJua0DXGSFOc4Vk4ZApICxGvnQ5WblQA
	/6TXLPrb2ub0pdtQu4h/jltpM2VkYDtvliB+u8t49+SCNYid4pDjKKNWO/hH3fMsLLxfsG5XzKh
	A9p8pFUmcTsxFD4NU5P2bkK9Dy8jY5VMWoPOeGwRCL64FmyZzqj0Ag0GfbKYPHi5/iPd0Ntdebh
	MPWUGuW51TVbuX/7IV0VRmRpMxDONqu793jSH1pzUiJe2Pw+l78pw8o6pEkMPaQjQs/rEAf199O
	ylAsJrD50kqxiaMrcwiETXHA4uDuSgLDZ8mg0JGX2IKdqPWSRnyeTagM06PHtDrq4onERPsgVFo
	GoELVvsHJwh07vXj+p95HhRbHeg6WwKdDh9HAHJcsZ1U4hvUtZnTNqxYY9+WcVo1wnNxwikyE=
X-Received: by 2002:a05:6830:7086:10b0:7dc:807:d1f3 with SMTP id 46e09a7af769-7debe3119ecmr519055a34.7.1777550821922;
        Thu, 30 Apr 2026 05:07:01 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deab7cfc5esm3290130a34.5.2026.04.30.05.07.01
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:07:01 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-42321c8b8f5so675524fac.1
        for <spacemit@lists.linux.dev>; Thu, 30 Apr 2026 05:07:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87TzOhchXfcVQqWTfYh2UQKLmuAQ8ULe4K8F17MKhAb1rRPZftYPTKCp2UR6gorZ+bvUvWse6yIA==@lists.linux.dev
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
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
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
