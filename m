Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66661288514
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699869; cv=none; b=TjzUevFNnvU+uwq8nlGf00Vyy5o0HW++NhVw4wPWsrSbxlFk8xk0/8agAreEwXCV2/oe1z84WgDnfAtHIjgVHA45DF8xS5CQBAnTtIdOxHln9LoYvtVUMqsFWM+t7zL9EL5hSW7QSpWQvZfY1I1OQZBdKWxMDSjWDevOMq0yW5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699869; c=relaxed/simple;
	bh=CSh/OPgCewZMrxAGotXGAjNREHTmD2ri4RotS2E+6yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzVjRvZc1xYarNuzeyGPrFkx/R469p7zM4Nzw6IQTJ9k8OEufegk4OtNDR6qwdQ2Dr0xacVGg5TwX3v68Fhi9GH6j5BTFeusmsCr0se14n4Ru48+CrqXPiqcZU7+EH60hoapXQcK3B1rvbfFgj7hzrnmdZ+XGR5BHIfDt7a4wdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d55b97f358so6131223a34.3
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 00:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699867; x=1773304667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=;
        b=TEWv8TlZxZ6pX49S8y8daifiNYJJtWk1xKl2vzTA2pdnvOQUta0QayvmYPpmOzf4i4
         40ahstyu1sHwL7AY9AiFxejK1LGMpky+QjKY6LU66qFavS5n2Zf7Vzh6P6Gf9ncZ12gz
         Y1N339jFO4LZ5laty+pMIBJYHR2wHi+18I2S2B55x6q9KnhOgveJWpnxml2hokm6SViP
         pgU/5HjvO0S0CNxAH+shJeYXbZNtjv0QCqssx23rCs1vHt5bfOpCko5VOeoQkxWxl/Qf
         4Tawgt6RVftrBa+2yaplWPQTW6aYoqQq0swyBMCBJKjBf2X+d6REs9cthCJAwD8WcO/B
         m6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWK/0O0kGqkYhQs9jMbnhHtGifvukrbEstvqIF/Vx9w6PLwmZtoQuFHfpn6duVOfEsknMKfkjGkZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJDdrCy7IoiyFVimcjRyJVnOL6sZ44wQkroWlc9M8CbanGQJts
	F4CbR9udX+Sg6H3OszmGsKxv17SThROGbgbVjiVKI62H5iR0cAH3MKzVO0QYubDL
X-Gm-Gg: ATEYQzy38Jtfb/vTTEVLZMYB096uzaWCPjTf6ZIhsXph2vMUH3RgoF75i+mF/0uUWpY
	EN4RXuwn27xg2COVywz1YeqT6EMY499f6dR0TvQ55dmKGaRxgLDsbDcXKOMZ8yvhnWdQQchBjS8
	yNb8iZsgYYqiss6aFvvlZi+3PXyfF5vkKQ2UdXK9m9OZKcjI+w0y5NkxVihe0N4Y8Al36hXN/Vz
	5atnn/28okQYmlzB0VLG7KZhstBB5aTiK6Y1UpO1BF23GPeBr5Nk/TUwpdmeryx4W6/FeR99FIa
	wNgGdDYUtYyRyUAnrQkxI1zWz95JUB63k5AY6BsjXI3FdwUfvsO7vGJNPbCQ5TDNwdmOgCweeAJ
	QplHMnNo5pG2PMS9wk5ypSZrRW/AlGLwrwe5gza0kZEoEPLrNwDmCZ4wuRWTBSeGCChfKotcPjX
	KOitOBqM89NsOYCuN2IK+QPj0Us/b4fIzxjKVC5bOvDWUtAJMUTx5eJXv6The0s69zeepZa8c=
X-Received: by 2002:a05:6830:418c:b0:7d1:4f21:ff79 with SMTP id 46e09a7af769-7d6d13ad29fmr3315755a34.22.1772699867344;
        Thu, 05 Mar 2026 00:37:47 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586474d4csm19430222a34.9.2026.03.05.00.37.47
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:37:47 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40438e0cba6so1953169fac.1
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 00:37:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLGILsVIlI1c+MFNzWrF6unboNcjSoksy1N8fuxztp7y1n5AWeZP61+SRwna1KR8i6KrDRgKwr5w==@lists.linux.dev
X-Received: by 2002:a05:6102:2ac9:b0:5f7:24dc:3ac3 with SMTP id
 ada2fe7eead31-5ffaaa86250mr1899404137.7.1772699399463; Thu, 05 Mar 2026
 00:29:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
X-Gm-Features: AaiRm53mHozL13yvxji6rv0MKzaGvWxuhr7SWHD2SjBJ0VWNhqppZZeXezGpDhg
Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
Subject: Re: [PATCH phy-next 17/22] net: renesas: rswitch: include PHY
 provider header
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
	UNGLinuxDriver@microchip.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Michael Dege <michael.dege@renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> As a PHY consumer driver, the Renesas rswitch dereferences internal
> fields of struct phy, something which shouldn't be done, as that is
> going to be made an opaque pointer.
>
> It is quite clearly visible that the driver is tightly coupled with the
> drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
> on the Generic PHY subsystem.
>
> This was discussed before here:
> https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/
>
> but to summarize, it is generally expected that when a Generic PHY
> function is called, it takes effect immediately. When this doesn't
> happen, the PHY provider driver must change its implementation rather
> than the consumer be made to work around it. PHY providers which rely on
> a hardcoded call sequence in the consumer are just lazy and wrong.
>
> The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
> Add phy_power_{on,off}() calling"). Problem description:
> - Ethernet PHYs may change phydev->interface. When this happens, the
>   SerDes must learn of the new phydev->interface using phy_set_mode_ext().
> - drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
>   but this only caches the mode and submode into channel->phy_interface
>   and applies this to hardware during phy_power_on().
>
> The commit author decided to work around this at the consumer site, by
> power cycling the PHY for the configuration to take effect.
>
> This had a worse implication from an API perspective in subsequent
> commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
> It was observed that phy_power_on() and phy_power_off() calls need to be
> balanced, and so, the consumer decided to start looking at the struct
> phy :: power_count (the technical reason why I'm making this change).
>
> This is also wrong from an API perspective because
> - a consumer should only care about its own vote on the PHY power state.
>   If this is a multi-port submode like QSGMII, a single phy_power_off()
>   call will not actually turn the PHY off (nor should it).
> - the power_count is written under the &phy->mutex, but read unlocked
>   here.
>
> The rswitch and r8a779f0-ether-serdes drivers both need to be completely
> rethought in terms of Generic PHY API call sequence. There is no quick
> fix to apply. Just include the PHY provider API along with the consumer
> one, to keep working as before when struct phy will be made an opaque
> pointer to normal PHY consumers. But this is a bad offender (and it's
> not even a provider) so add a FIXME.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
