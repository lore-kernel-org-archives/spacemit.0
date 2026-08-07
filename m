Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FDE4519BF
	for <spacemit@lists.linux.dev>; Fri,  7 Aug 2026 06:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085628; cv=none; b=I2TRBQUe1OfpH/l5+7RnMyVOjWRjPEED5JmrKFf15QNfMhRGFJvj/wTd4gdL61VhyPQDbotv62hTmxQ98CWQd+sYvxnMiDZU72MHSJzEQWW3dsZBOgMkG6Qy/Uf4cw5jcpGGDr74k//kEb+JsSvf6BIYjb+jXf6EHFyQyay2tks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085628; c=relaxed/simple;
	bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXnB5x4z+JIMWek6YM0BrB5IDbbcVAa2XEq9A0rs2LWuLrsGh233EI41KGjSH9JE5i4F9DeWZ082DeHgQcCt6C3XsVGUyJw1FGdXofHKH28X1yQ9/qgj3eRVociy5o0yZxHOkizwD/SQRP7oXoDM5gyEZZt9/jBCmpki34c3HWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Y9xSd/vO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Y9xSd/vO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4957eefd361so22336005e9.1
        for <spacemit@lists.linux.dev>; Thu, 06 Aug 2026 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786085625; x=1786690425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
        b=Y9xSd/vOU9hh3a1vdXfaLr8cDCZ8lNUhfO/BJzTA69vUb2ddkML3KrLWm0oAo0RpBk
         x/iJ457mfZK+0yeGBjZJeNlzZBcOXIgFezQagBfrdJYev8AKZgMNcbuJ0IFYUUoBO7c5
         nXulsNSRpjUH13FOjqLGmfQJIeh/vYsp1g7ffClqLsEfnuncIfeBiG34ChkxbdO2e0gr
         QPLCj/6lTYC+erPruKNVvHdwNMjiX7/14qJNndEMl/c9fE1MhmfzJLr8UFcqB0eCQfCd
         Oco0sA2kaGY/OJEy+pK0GseSwEWQvM+ClyS/5Vf51qcX+c+gnUEuMP0XhTlDIojA8zpJ
         ITqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085625; x=1786690425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
        b=cUZ9O8UMeCIXII5F8DK21znnvbOBn0+XwyalVXG6v1krecNHkbHkEzWeXxDTdXOw5L
         7la27IrUFLfN7+FfV9aLxGbg0b4GJs51uhGiaegfERuqBHznsIdxS0SxI5X/075FzFY4
         XFjJbxTwl81U1ONHL//kiELffb881ZuoSgJZchHZv4UlLBH7WARyGMZ/gqVs/MfuseId
         rNJ4R97LCWuyoth5Rohf9qu6tYLOy6Hkrb9JR+GCYTVs1IMITf5nY/6/9eCprUVbmCPl
         2ff45aWdQs5bu4d9Oj0HEuBcstGe2fgh7BkjDv1fJIJrdbytXdRTBVXFEJyVi4bO/lwi
         H/GA==
X-Forwarded-Encrypted: i=1; AHgh+Rpm4YWqoRgSdnC9QDlLYzryGTCQPCpvBPsMwZWIoPL2E9DR3mtnFkoRAd+JU9AcpI0Oas19sRXHdg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yymb3u2x/V6e/3R/Ou13uan3ZUgsUbcZAR8UgAUF71AgPta1Nic
	lgcyFx1akAlGQjM4NKYISB7c1l2pyUZ90WeYirT5eV/tqAPLe+IgeB+cmPdBHznf4vQ=
X-Gm-Gg: AR+sD13J9YOKbTuEy6EegCEkG/mNvCV58Mpdo2FAQ2W6X8TW4KgUIFU4++66b3YQvIP
	BwtvmawM1Oeb/RZQ4TaxymCXHEdY8wpLzrzUjMAhY1jYmHJ1InMMeI+E/IMEpPDTUxIeb8nYQUn
	BUZyKJl1m/k4zdbghsfwsxE+Si6i7WR6w5G257fQ46iCt7E+ZYsMRNrOmLC29Q8XJ9TMexOT7ak
	ANk92QZX9DbQWjcX/0bx+BTwAKdixISTodrFupDXYSW1M+vBtnwCvzB7VExv5gIVHzB+3wUgK2C
	cgrpuoW0jyXzc4eX10osYAQz7A+s+ruMrxVU962OOHEdgohdMD/y/WpWzkVbCCH1r9jzEAlWQ2L
	H0v5DmGtrzYr5v5mpHAR+ESp6O7BcARyRQdWS8oUpjEs0pl8JGoo0DcL6rYcrfqSZuvnoXe09UH
	5V3wulFQppNX5ep3fsTFEg6e5HyZ9SUjRCLtuBbbIFkbqAyfVapcwjtD8da+7N7mDCW23iW9FVn
	pKsLsdFkMsJfO7Hi03YduTAh0TkFv5+4PL/hU7ACppsyMSHheH4
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr16392445e9.7.1786085625549;
        Thu, 06 Aug 2026 23:53:45 -0700 (PDT)
Received: from localhost (p200300f65f017104bf0aa590e17c3201.dip0.t-ipconnect.de. [2003:f6:5f01:7104:bf0a:a590:e17c:3201])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995422016fsm98840415e9.8.2026.08.06.23.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:44 -0700 (PDT)
Date: Fri, 7 Aug 2026 08:53:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Cody Kang <codykang.hk@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
Message-ID: <anWAmitXSFRUw1W2@monoceros>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-5-f22a10a52867@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjrvltbz7ftd6xiv"
Content-Disposition: inline
In-Reply-To: <20260724-k3-display-v1-5-f22a10a52867@gmail.com>


--pjrvltbz7ftd6xiv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
MIME-Version: 1.0

Hello,

On Fri, Jul 24, 2026 at 11:16:37PM -0400, Cody Kang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please drop the include for <linux/mod_devicetable.h>,
<linux/platform_device.h> already provides of_device_id.

Thanks
Uwe

--pjrvltbz7ftd6xiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp1gPUACgkQj4D7WH0S
/k5t1Af+IUdmJ1rwWz3XTKVvTnkiumXy+BBJlthTfpRB3pFeiGILfF6fTXLHen+q
HI5KuCh4tnAo/jb3zLCDqO0RRmh14m5WlEgbMnFB9NGgBsbmj77K/WjLo2asTvFN
zTn9nrSjAtcmoJs0h4hIB3zaaueCYiWTGq8S2lIKH5D3xMUy61+006h2s5Dtrzlc
fHv743vCRkGoaGQWxHvpsgkx8Sp7WXEwZQyMaRvSggG2FiskKlV5pyM35siiJuAA
re4sCShFRtGFOhGjKK+mM7y8skzgBNqDocWT4sYp0QYeW6w8nwNHyKh3KUN//afs
1fDWRTlDMEJQqbI9K3OToPHbVguUIA==
=glOr
-----END PGP SIGNATURE-----

--pjrvltbz7ftd6xiv--
