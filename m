Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098E3ED5D6
	for <spacemit@lists.linux.dev>; Fri,  4 Sep 2026 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510495; cv=none; b=TyiZjjIzD1gjlVeOAK/2MnwAcj9lCDfgscEkLUsXCnl3js9mHZjZRBzcgk6TNBYukO33VKZPRn5+tMtPcbHKw9oAYF/HiqkXUIMgxzxwFavjCLhCNEMzasOvdo0F7+rXnKrgCIj3Lb6/D1bvn2kWA/TpeGxd+03l0RrICVU9e14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510495; c=relaxed/simple;
	bh=vAduMceZ5WykF9AxLntA2mjBC+eC1Z+b3m9MMdygFJA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iZGRngcAm2eqw2JHqpnPerc5FrYZfDdxJ3a8wnJBFiEv8dMapci9uWtLg0keiHmMkOtLJun3U+RNWo163hPLeEF/OcCJ/PLXdkQxvcQhd/DYBscjPytrhbXkeDjkSTeXleZGtuaDhO7Sjtd4IlwFfSQ9yOrG/ydPenJXOJRQ4tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H9NL+UcK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H9NL+UcK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so5895075e9.1
        for <spacemit@lists.linux.dev>; Fri, 04 Sep 2026 01:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788510486; x=1789115286; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vAduMceZ5WykF9AxLntA2mjBC+eC1Z+b3m9MMdygFJA=;
        b=H9NL+UcKQtfkwDx75rfgUVZKMp8NtWDgFOt8N/JZew7vuFb/Nz7C9ewkmiQhECMShK
         5vDxfJ33X51iEGi77VuMlSvwde9HTCj70FJd9P4+12lO21wNymGSgA3z678LBkEya4aE
         b4UmYgUPCOdBpF3MvElWPJYfAZxiauVKJu8f1OUZwOEW+XOChz73rdfVoSwf5xNpEJjC
         Fsss91x8AmB4omDWgAQlZ8qdRlqvgDmXDJ68p9287HLpFYkIC8RNunToN7Pbe38FHuRN
         Cls9XdIG1iq4Px9JK1GLF0ijBLjIWBCMCdyzlvgp29PxNLnv0jihMq6LUt95dORoUasO
         jJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510486; x=1789115286;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vAduMceZ5WykF9AxLntA2mjBC+eC1Z+b3m9MMdygFJA=;
        b=j9SAgMLupJTLz8hWMhNF1Slr2L7d/xmUOFyM1mIrW3i6LHwn9MSIpAucvIdJMYHkF2
         NHJx+t2RMdzeQz+9T3sQ+kF6kZAuuH0ZAhIOO1fAKHp/e5KzCA5tkpw6n6gmUyi8m+r9
         4ZMObZIZZ3K75MOnz92dHYdYbIpfh4JowaeEUhKRanqnqm2lpDPDLLBVXWGX5pk1avyQ
         /NJax0Vw2rv06xOVAMLuVmSR17mEp896Rxp1Fww76qmDlOAf0MjRC/yG/vp8BMASRxgj
         EBRdEHXSFaMFF5bEC7M7Pr+++0jB4zIT26Bp27mvNePo8JP347M66rGWQ5oTCcx57buo
         dpHw==
X-Forwarded-Encrypted: i=1; AKwUvBxMiQjDWKq/CoNCAEtvLVHSSO7THnFpX57u3cj+qis4MmfxHaa4tUKhPSCCSwiZYoCPFobuPfk25A==@lists.linux.dev
X-Gm-Message-State: AFuF++mZV+G/sWzLyaSwq7lRHrGPSQB8EpV3yBWVPuPzkxzEILyeg1JN
	YHJVq0zO694JAjrAPTayOI2s6JLevpduh3IjFZfvH0yB8NWa3focH3z5a9CuEUXyRJA=
X-Gm-Gg: AYBFou2cW8utTTOQDqR7xs5Bkn21l4I5LYPljYcfchd5QI6O8glU0rgaQU5pjvLwIpj
	InnyjDhdManUvm6IFrdYGAzisXPcAqiLp25J9qYU3Z/4HKXXD7p9hOW4cnVqE7Yxg8vXrjGpw54
	XmGybsNW7VAYQtT6TUO5CGzIPjAgwzS8iOQI3GU1umYXjKZ8DqsVC7632tmkoehznbF5C9R4Hej
	n1jQIuF1GvTFbOcmDbvZFz0N1EdWDh17EcIbeVBafToTLxnZEjjamMr75xrlLoOq1vwHTChm8VS
	NXmSW7ZDlyyLd9Bz2rWyz411lCuMD97LSNJXdUnLzW/xkzvXy72rwPH6DchXn6S1BkNplAL/opj
	9YdCTWQP57kzrvvWPsGsAczwveIigRfMvyNC8KltzYLERt5S8l4x6/TtDrV6/vpaWgrNGdSdtJL
	VVcwbXAO5Q2sPZCF+F45yHPEa84xCYRbUMV3mjWvkuL8g+2HwefsYMhgvr
X-Received: by 2002:a05:600c:3511:b0:49c:fa20:cc01 with SMTP id 5b1f17b1804b1-49cfa20ccddmr25588125e9.24.1788510485753;
        Fri, 04 Sep 2026 01:28:05 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm68845625e9.2.2026.09.04.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 04 Sep 2026 10:27:58 +0200
Message-Id: <DL6E1V8AMI2X.EQQ009BX5AZ6@baylibre.com>
Cc: <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH net-next 05/33] can: m_can: Remove comma after
 sentinel-entry in match-table
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
 <mailhol@kernel.org>, <msp@baylibre.com>, <florian.fainelli@broadcom.com>,
 <jonas.gorski@gmail.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <kurt@linutronix.de>, <hauke@hauke-m.de>,
 <chester.a.unal@arinc9.com>, <daniel@makrotopia.org>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <ansuelsmth@gmail.com>, <linusw@kernel.org>, <luizluca@gmail.com>,
 <alvin.sipraga@analog.com>, <clement.leger@bootlin.com>,
 <justin.chen@broadcom.com>, <dlan@kernel.org>, <rogerq@kernel.org>,
 <hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <rjui@broadcom.com>,
 <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
 <opendmb@gmail.com>, <andrei.botila@oss.nxp.com>,
 <wangruikang@iscas.ac.cn>, <amadeus@jmu.edu.cn>, <kees@kernel.org>,
 <tmshlvck@gmail.com>, <c-vankar@ti.com>, <horms@kernel.org>,
 <vadim.fedorenko@linux.dev>, <daniel.zahka@gmail.com>,
 <nora.schiffer@ew.tq-group.com>, <v-singh1@ti.com>, <oss@vassilevski.com>,
 <haokexin@gmail.com>, <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
 <lgs201920130244@gmail.com>, "Kendall Willis" <k-willis@ti.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904043724.2955444-6-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-6-s-vadapalli@ti.com>

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 4, 2026 at 6:36 AM CEST, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Acked-by: Markus Schneider-Pargmann <msp@baylibre.com>

+Kendall

Note that this and another series by Kendall will probably have a
conflict as both change the compatibles:
https://lore.kernel.org/all/20260902-temp-v4-0-3896f7d16ce8@ti.com/

Best
Markus

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapqBDhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNU
DgD+NDmEsw57cLpzBEOHVv/Nk1EkJHkfkEl6somoL6FeZhQA/igsPy7rmcarz6Ym
lEV7ixhaA3JU6LQo0KOc3yMdNwIE
=DaCZ
-----END PGP SIGNATURE-----

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c--
