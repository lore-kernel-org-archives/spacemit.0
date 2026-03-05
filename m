Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D73264F5
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696739; cv=none; b=LmjpPYmQa8m6dBC+Gi6OzknieS3P+la3uizoknKK29gt2nnJxWHgv6j5CCheAL3WOmjk/SWoiFg8RixLTdPOChbt+lZ95Kltt9P2yWzVqWXnqKJ87tEu+9UXcyDkvzGrtm/E3flAjevuGUsBp34jdHDOn7Wu2Nx0JGcNTIW+fxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696739; c=relaxed/simple;
	bh=1VrdyW7eBzn3eIzcJ/qwIsXSzypVzRQDxfUgekinKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=phQYWiny3W+iipB/GPY4D+oV7qPIQswmG6PEPDQizSA9ym9Yynwlq5PIDKZ8mX3+T2H7v7ByNcoqipY2hO3VjZEG21bU7jy5EdFo8XNFFS3dzojCrgsdwHJWpFUnjZDnP4kVlisWg54COWvMeIUoByMNEn9GNj9HVEWK3d4uYzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56af41d1e0bso154031e0c.1
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 23:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772696737; x=1773301537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=K9JMF62et/dNkIb3mZbLEGS/9DRKDtiDJ9NH5MqD/lABkIcPz4P8EmkDmJzNz9SPHt
         PSySpEIcBnMbsriBzNFzUudlTWg26nBOoUJ9uFFeRFG0T7Gh+IEGdj610NsTwbnyeZru
         sUsRczaqpxnYR9rYsXHgGqNaUCqOAw2ctcupDe5NL+npNEzfX8bMEyItZETaxVaPciDE
         33DqfWEIQ//MBrMlXGVDw8Bxk96VkSSTtp6GQfNfmxXWs1IygvRuLD+ZD3t4B8BnQfBu
         W4QWT7Dz0BtTKTICIbFewqR+pUJy+tR3t7khu9cQFSNU/sPMM3UQ5tQFx9CUddl65w5g
         qaZg==
X-Forwarded-Encrypted: i=1; AJvYcCVloVCxskKYYbLuXA59jWrfR1MG6tWZJVyF8KKrp4xIVD+51thy258JP0UFOlF8qn88p4+twViTBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzP0bN9CxSNyU7HVZZUoWmnby9y4uAi+MS6+JB7DHrKvqjIKJlA
	mu8msbFoJLRrSlTTV+udQhkgbMmzXOwsnauR6NH3mgW0sdXiBZoHZfZi5jOYT3TB
X-Gm-Gg: ATEYQzzBWxow29wNgbS8zmI+1eKXKhV8JhCdP70dX8DQkYt8k9h8OFOsYWhdG8NWyet
	yvDVOBfZ6t8fG4uoB8cYJnY0mT0iME8MaQyJsId827TXVpzTYwcBjh5SE3vAvZ+EKrLD1Mwyotw
	cPxZEhxVoykV/XeqRsDHGBkrPHPZvFa9OBudEfC8thjMJcCI0lYFG9a4mdiPIDwpbVl4QN2cSAe
	XH4+Pe3tRpFbOpP264YmAxTxYFNhxTiqxcUjKUmC3z16XBIhN9jz6IjM0fLtJf7NNoVrpJI1B3K
	JOtQwHNekI1ivWeRGJv8cLx63HCOofYCp4xOPbDX8UaZP9C6KiHsIiNDPREiRkbqrG0gJG1PBEe
	iHjutNzt4pORd/6oTq4lDrwRR6fVgGEpaojlat4Cuy6kyDyq16P+/sSgtZ7bhYYrih4H0440k/P
	wHcmUIjHeqc82Lbo/wyYU6oFDSnytcvucnR94w9QDpLetmaBA5ybCWHm8OdDZB
X-Received: by 2002:a05:6122:400b:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-56ae77b2a57mr2160325e0c.15.1772696736878;
        Wed, 04 Mar 2026 23:45:36 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c1cesm25889590e0c.1.2026.03.04.23.45.34
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:45:35 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94dd2d71231so2303858241.0
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 23:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJ+8yLGgh1ztxQc2okPLg9P/pI5kUz3cAW3NLGVwg5d6Ab+cXjFdXzsorGJLZZmiX/y2dyNuUudg==@lists.linux.dev
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
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
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
