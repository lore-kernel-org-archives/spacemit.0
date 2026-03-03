Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22F22192FA
	for <spacemit@lists.linux.dev>; Tue,  3 Mar 2026 01:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500057; cv=none; b=jITdF8P81vhwp2H/wWyFE7hSXVPHO9is4/vTJE6M0B0rz7GAOqRl0hHYULXLAk8WM9JQ1W9+91bU+aTqdNVE3BvM8IOSNQAcqPuJ1jXJDdxMY8n0HrPKCycumK66NhzwFjvC6oBMZjKgu0ORz9AxoIEHvyH28pmiKaEC1Ygvc4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500057; c=relaxed/simple;
	bh=WG/CCCMPf++INnbCtqPPU9okZXL2wSwLvCkTTgXeBP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IslOq8SkC6M0vEul7oCeeoP8F0VvJrEY0tXz5YvWYmKfwdU/qUYATbqzUG5GlmfG7cukmI4FTvaM2Mjdb8syHsOjfDWNJggCTjdpDN8NxRNjClSJvIPdU8Kqdkhq/BVCR/UXByIif+48icNN0rikAKBBi4PIbUtk9dpuuuRx3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJttq7rY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJttq7rY"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae4988e039so12601755ad.1
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 17:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500056; x=1773104856; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=;
        b=XJttq7rYcXzq3f58WMPDdWfOZErryxA2kTtl+MWfod6DHYPWIAppOGr+H/dB5l0FUF
         OPu2o7atapBaHcnqk71MYelxbD83wleZLG3g4qBQoDqcE7n6UdqL7Yt4z178CfJe/zqM
         rV7CzKg/qW2mo7Uza48TbDnY/wkNmUz+dOfFF0lZe1+xlCm19/hRyQ1LrYpHSmxiChc5
         8CbDyN4zIMwxst965YFa6tXQ/T9Rb9d9uPkUctuuLISRdKjIy4m56djlkX5KhvxkbZRo
         xZqw5M7nUZmcNfxIDiK9U0UpHr0Mv5qxDj/7qCmU77/k5ss1q5cROD63+k9UtEEyqwss
         +f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500056; x=1773104856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=;
        b=QqCfdtD3im33nnexgVw2zJchEFn6UXuGA/P9FP5g7l7xYBuso1zKfRguyiZ6+VBEXw
         wqWcYWVrQyAlsEJwxHhwtBbydAIgkcuUxmsWUMMJEBV5c8zqFhAGTAf3/AxRo4SDdh7A
         SXYnLssryXVLedYbM9gk/6rREBwPW0vLqaeCXs7rFUIYy1J+hE4nGGrj6n7qnWO9+iUG
         CKK5vysdCCWtJprLJqDqnCdLBXJsyELJUqrfiA5zMb+8CNsXufKlbtBp1ikIxsXbpDTr
         0ESsE82/yzfr09wrZ6i6bgHqEl5Z6wHYd7UoSy2yxCSAFEA76ac8SZGP0jZcw6txOMjN
         d7dw==
X-Forwarded-Encrypted: i=1; AJvYcCXKFnb/jBn9Oj52fRbdTBabLfTTga9D2wAroNN8X01LZO0xh+uXciqspUfWFB1TI5HjDPwYSnJLBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcZ/b1lGaGNrWETdXoyUal42B85j5OTKh67w9ORlt8KgTaH2nm
	L3qxKXgiA6mGur2U/LxjduJEk08NXkPpCS7Q8ZvEZvSrKDnZ5hYHBGtQ
X-Gm-Gg: ATEYQzxOh8DyEB7sOZtQu5Szofpugt30RvW6mEEJsPk/H3wpM1giJ5gH8sr6J0jJvSK
	c7YjSm3y0z3LNgxGR33TAroHzhgEMR2Jw8FbC04djxixCz7rhD0cA7hBu6cgQmkF0iuqTQNWgXl
	rlOzsCwhBEajHkR4auN0ogvGsN4QjgVrYb/0Q738pJec46yIgJy8Of2ISZnMzeF2QPQt+Xu53t7
	BUs+Nf6iBE6rAiv+XkIrKqwYruY4NmzlEPaniRbJxCXAa/u8B8ePkT27tl9NSQsejQNiZ4dWdPu
	ubSdv4nxZzQhBjRdBUii5dx05ZBn/w474qlFEvYSX8wXrbW/a+BQ/GtogIwfX/lf0qlEEiGTe5M
	uVH6cPruAm64mskb3+QL/DWDTLTskTDpicBrrq8A3yRjnoHhXuGB7hsCERhEaijdu96HPDbJg2e
	+rqFgk/mOJT3efFiHrs4s33w==
X-Received: by 2002:a17:903:4765:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2ae60c60e17mr3650915ad.5.1772500056123;
        Mon, 02 Mar 2026 17:07:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6fe4f3sm146608315ad.91.2026.03.02.17.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:35 -0800 (PST)
Date: Tue, 3 Mar 2026 09:07:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aaY0KeKuFwM-5wuS@inochi.infowork>
References: <20260227075718.2243818-1-inochiama@gmail.com>
 <20260227075718.2243818-4-inochiama@gmail.com>
 <20260228131845.70421792@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228131845.70421792@kernel.org>

On Sat, Feb 28, 2026 at 01:18:45PM -0800, Jakub Kicinski wrote:
> On Fri, 27 Feb 2026 15:57:17 +0800 Inochi Amaoto wrote:
> > The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
> > MAC (version 5.40a), with the following special points:
> > 1. The rate of the tx clock line is auto changed when the mac speed
> >    rate is changed, and no need for changing the input tx clock.
> > 2. This controller require a extra syscon device to configure the
> >    interface type, enable wake up interrupt and delay configuration
> >    if needed.
> 
> checkpatch says:
> 
> ERROR: "foo* bar" should be "foo *bar"
> #110: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:45:
> +static int spacemit_dwmac_set_delay(struct spacmit_dwmac* dwmac,
> 
> ERROR: "foo* bar" should be "foo *bar"
> #148: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:83:
> +static int spacemit_dwmac_fix_delay(struct spacmit_dwmac* dwmac,
> 
> WARNING: line length of 99 exceeds 80 columns
> #243: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:178:
> +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
> -- 
> pw-bot: cr

Thanks, I have updated a new version.

Regards,
Inochi
