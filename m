Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64C147D954
	for <spacemit@lists.linux.dev>; Wed, 29 Jul 2026 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328605; cv=none; b=eMLKRpgUH8SZJnvjBN+V81yXX0rHq/OfeHZ0Zekg5ibY0XYk/YItWh4pPsQOs71kUrdgDXgRRXmsvrKecJdzp+LVHjy6v0lrCJvEMOwz4sUD5Vf3Y3Ru4DZKiOoypWkFU4iEW6WQlXi8zK4A3+BajcFyFqGZuvujMFFoHin28Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328605; c=relaxed/simple;
	bh=xGyW1zCh+rLKiJ62hDLL4FkHUX+Lqecc47aUXSHCSkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYBmCUDDG/ud9DINsyh+mAtqyrySUtglomhmcoQBTnNaDSRPOX2DLqEA5ZKIGqaUh7cXX8fRfSBEh1Z1Daw4QMa/cRoSn0JTn9gTz+ZitkWCY4sLLyJTttFURYciYHqETMQgvxKupcovpHUSSAcLstX8VLIYwVQv221i4410QdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RxEpQxwQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RxEpQxwQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49557167508so7791705e9.1
        for <spacemit@lists.linux.dev>; Wed, 29 Jul 2026 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328593; x=1785933393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xGyW1zCh+rLKiJ62hDLL4FkHUX+Lqecc47aUXSHCSkw=;
        b=RxEpQxwQcxgeXJUQKxtdKbvreT9QJHcqKkIl/kIbKaLQsMvP631+k5KznOMMmAO+AT
         j5LtUT9F2HitOOVTvqmDRPjkxAvSvG7OKXN1e99eVNGeXTQsjtH+x+7yM6bZpDPbgYga
         RFY1c29OsZsaoJM0OEJjPocrd/ipkLnqP5xZM5rP1yC8SYsOu8VEs0OMhC7Oy15D/EiN
         8fLyDss9yZkWfQWJ+vu0OJDPvDaQyMZa7rT4heir+HZQtLNQ3+AUx7oy/hlMfyprgFsI
         M32aBPqJy+2VfBT42RRsu6wYf2CEDP7psVAQYPHlvVgFMZXwvyhL/wc+iPaTxcJQvvDP
         svZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328593; x=1785933393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGyW1zCh+rLKiJ62hDLL4FkHUX+Lqecc47aUXSHCSkw=;
        b=ZfsWCWrDxrMPElrE9WoYg+BdawlttYKJ9D7h3p7dVo9PNEE4zerqQzmLUhUeHZtkF7
         LsG1wULsb+WslGfr+MJpiM80x4mrDpAptQB4sFyBQ1ZYPWsk2LtVoG3zdlbBLK4lpf8q
         7xclcvqlamQDRr/VGa4t6oPIHMQQbUCRPeFcBGRZ8EMaOKr8itLRDGpI0xL/9Us+/OF3
         Kh5tEDtdtEwaN3MCJ4KzbMtaNVqoYhpNSioBraFSWlEKuvcIHs6XVUwWseQMUnFdrkUb
         42MXDrZ9x34SGJ5pZRmQfCz+QfIm0vl+6nyrMBZZL0qc5xNa2SVxCe7UVLhiJhNhrxVC
         y0xw==
X-Forwarded-Encrypted: i=1; AHgh+RqcZuAuhwZlVNz82+x76BogGHXu2pdSdzRJLZHjGM89vQRhyFiYFZ+k7DVlc3C2cov7hQMcNlDkNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZW7gQ6NQ4RRT9w8/+CLf0FcoRrw0wNBtR1JMXQASMTeVLxEQ2
	8/B5xyaU7+2xlinaj28IUrE/Hbtitnp+N0MeAcN/7GsN4R9YagUZ/CPf4m/xCKFF4KI=
X-Gm-Gg: AR+sD13uaQuMETqiwsdZYnxS2+1pCLVOWRY3khyh4IBijOhqPoktXNIzqh5HeaoBT0o
	hML5mJGAPfp98cO58JQWAQLfK30tgixCYVyMuA1cYSEQngdsVOrbXkJu32gbGrpkiThmRdygwV1
	48HgTFcDxl9qQyujFiDcVAJwAMrUAi4RBohHQ8vFPO/suhI5CQwdKh+h8c11q3PMnp+RKuJTHKt
	BV4BwbsvjaYnTh4LKeEzOkr5CkzhB7S/QUQ9STuPsI2h7fRxhabGcqRvnv3KXrsvEfIEI3bRQvK
	xBvDjsf620XcahjacF1pd4AndLXr3pthWCUhGpnz5M9YrCBq50dDLQGO9Uxj9ASlMcWH4qn2iih
	oxdlO0583Vo4JUU7pFmjAqIRhQzRnIfYh9onx6pIRXnTfGrj2c9Tan7a4EIoba/+Dxg78DR1bzl
	JM1oy+mwPw+3hOsMMEKK+j+gPTGk4CqeOFPh9rYN4KrPbMGUES2QVR3l4JwNfMH2zTgZ+GdjniT
	IwxQgn9GTXQIVqrgFYOECTYrb1VviHByilRkHlVJhidky5sZRk=
X-Received: by 2002:a05:600c:3153:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-496c6428a29mr80996735e9.9.1785328593413;
        Wed, 29 Jul 2026 05:36:33 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-496c45b1c76sm146982725e9.6.2026.07.29.05.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:36:32 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:36:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: codykang.hk@gmail.com
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
Subject: Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY
 driver
Message-ID: <amnzTxDYtSBojHdY@monoceros>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="db2zigiccrbrx7pn"
Content-Disposition: inline
In-Reply-To: <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>


--db2zigiccrbrx7pn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY
 driver
MIME-Version: 1.0

Hello,

On Sat, Jul 25, 2026 at 12:51:14AM -0400, Cody Kang via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id
is available and <linux/mod_devicetable.h> will go away soon.

So please drop the latter #include.

Best regards
Uwe


--db2zigiccrbrx7pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp88sACgkQj4D7WH0S
/k6T8gf8DMOwEtZaYC8vvvJqKWATzitxIn2z2YqgDVlNFzaZEYTG61pFLh/KTds+
sl2cVZmTi8idTg/Of+KXRfO2hxAkSW3C5UbNd60pd0VY+mQSfW0RGGroYO+tusRx
A6NwUHW15ZrpIuAsbkKepIhd0YmoiVA9SimCLHX85RxW8RuuPoKWsaur8Jv/j+Pz
dp+m3Lfaj8gG8J21Rdy8YTgKJ8GMpjOVpViSpsqQIROd5gqkOUepPpTGc8Cc+Pr9
haGqNLM86F9sZOA5aL8HEpYGHDo3Q6hGRmDiUm3CBaNwalgdp6qGUEKWGBjRoi/4
tgGD4NlIoAze3OTkKRb3ysqj3/8Xng==
=c0aq
-----END PGP SIGNATURE-----

--db2zigiccrbrx7pn--
