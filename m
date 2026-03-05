Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D0340D90
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699709; cv=none; b=bjGab1yUClYJdWXB7zHjbJYIOt4M72k6OLJ7o8PzJV84Y8ycqh4wUdjBXIlFENNVTwqihTKp+JJafDcldB7vKqe/isGb0E7F99yljn3A5hYETFSzLBlmtTXGOra9xeeCPWaF644irhWQavvpsNDus+8Hbkh/RI1Gx+Onxje/qiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699709; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PlNxxwAdkfg00V2rb7TyiT4r2paEoqPsIlE1M2lD7DGAzHWQt271WkZmxgquGpr4nNFiMOpz5YJHmkA7rbNUyMntnIljl8Zi64rs8f4ZxFb/7dld4MH4C6j/EylESWVQWXrMmvmumYjNfKi1icUEFrDyhiKWw7/mm6XoIrEd+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d18a9d2b1aso7679506a34.2
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 00:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699707; x=1773304507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=tEkYRweMNGEnsvCCzmvyMq5qlkTXlLPFxHXWVNogTiN98xiL59ulcaIDWsZd9TS+iw
         YXhYgh/Ei3k4lWdjDNDQnGirbGgunF4SvsvaUMh8lyRRP4LsrzqB6VyOegWCJIHToA0U
         p0wT+2FZrxkj7ifAwS8SwFEZeEI4YG6950UGu0Ps/vxCqFoxUXRbaJn19FAqIVAXYgNd
         HuQa/rd1Jq5uIgDkEgq02/YIP/82hY9j8BHsAoeQMu3rFdELB+UR2AbYHGIC1R8x2I2K
         CHjNBiM6d3tKUSiiG4jRYnD/8YyzIcyB1RLBomxVsz7HD01ccKJbLJFt6AJ9eqxI3+eF
         l/CA==
X-Forwarded-Encrypted: i=1; AJvYcCX3l8Lj6YdGma8p7bF6Yr5OkzN+meZOBo3xkHaH7+zM24SxDX+DTQpEeY4GHwa7oPhPI3qBkTIvIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwTyh2rvZaQVD84R72GpghbQkKCro3L/gRw0uf/EClt2PO0Bkk
	R2D3ZVIwfLB9sB7pVbniYaL0UArGR19p+EvkdZAPkwLUH6d7u8oKqlfG0RSp9pS5
X-Gm-Gg: ATEYQzx4C1XF0Dv5zKpq3RsqbCe6Tmsp0kZ91OR9BQOvBQkMxU9//DHTzf+IHHmfZYQ
	aa79d3Ny6NL8NbonVgvtdYNdrd9nvzqIYeZB0djE0STYRiI29wvkqcveP6uq9MiIX+QXTK4ZN86
	qZGM6yv4rXuFFmeQ2LHE3UpOb1VHDk99iULPVwBVWHMilq00oxM45BUtHGdjXs+hH4RWeZ+dD4n
	rI4A8XFSVm7TB6g65h2UT3iklthmokS+GclQQvpr6dfICC/QkGXbR7zMvbw1BbbV+Uj/QdNSA2Q
	uaLztvkeJESadykCNEZVQFT7e703Qr7SDbXh+mX8NdRp7RPcOKvrA83hD+VJAmuQdhu7jVBksAu
	5VFzwV8zG+QahPa/eBWJMo3kfPlzjMtuWsBUkDmp0gGOyfzq1FHR9f//VOnGdi/ZbnRFt/Pi4jh
	Kkpye1yRmwID+RfpmeDs3Cmva75LKE6v4UeVlTKFpUVfb4bw0STkLV+8UKgyD0
X-Received: by 2002:a05:6830:71a8:b0:771:5ae2:fce0 with SMTP id 46e09a7af769-7d6d139f00dmr3128696a34.20.1772699707123;
        Thu, 05 Mar 2026 00:35:07 -0800 (PST)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644eeb5sm17550236a34.1.2026.03.05.00.35.06
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:35:06 -0800 (PST)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40f387a688dso2258961fac.0
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 00:35:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3Fn859rD/L/xPp5Rwkk26oSJ2r1yxLr+hoRlZfyJiSOTR7/upbNpPYLwwPl17lAVZcgRRPpvlNw==@lists.linux.dev
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
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
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
