Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D6E43901C
	for <spacemit@lists.linux.dev>; Fri, 29 May 2026 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080569; cv=none; b=SxJgTtqHAEv89VtbLai7g0rswSqswAFRDh+gR0YhaPeZTG9RIwFhJHHAZigpjDWurABn19OpUmDPoTDnO2JAgk3cRAuRAqlrr+dVfAyXwDstpzhg0O0ldtiwFwIPQex+1nWiLMqvJoCZXKfJN3f/1iiQxd0p12PHDiW2KJFaiSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080569; c=relaxed/simple;
	bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLyeGvXBpZ2Z4iTIFFN3D9l5sJhgXL3jcipM32+VVsF95hxHcH8oWmvwhlYS3ecYreV6dMgS+FeTOoh81MotDHG1JAaPVyMIzyneMjoaGs/9qsR+duRhsZMDmDfpd5q7zy872e+cMlVBwRcTrRBziiA4MfLniDkLjk8mvTrgndw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PD1+0bk/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PD1+0bk/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ed18d8a1bso2904743f8f.0
        for <spacemit@lists.linux.dev>; Fri, 29 May 2026 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780080565; x=1780685365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
        b=PD1+0bk/ZAOkeLnTZm/VFpzdhb2+bN6p07JJytdACkgE+R1GQsBxNrzkeYSRPF0oUT
         kkVo5+ugCO9q0bRbSQNithxkrxOdRIn+WoC36gXBmqMJ/xy4FHJYWJh3fRWTBC3kRAqQ
         e4c5wNttTJuPk9cz6Gl/73mxhQe47gPar6ay2XVi2+VcWc0OlgO7SaGAd1VW3J2C4kHA
         Nxm8zFK14FwNp4goZGE+LH2iYeriZ92BhMKMEtfjZwdKLr6dzmEx583VL/2BP9cGMnxk
         bfAjqwldVN7aB4fSE8Lj62l7VSTqfqimz3y1mC192oR4gIlR30r+tnlAbAHpgUbyESP+
         sEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080565; x=1780685365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
        b=rI1byQOi2DTIz//nGsBkO2yUkdyTYJSinQ7IxRUoe9e0u/tES4JsqUrf26SS7Lk2ku
         8j61nogm8wpNZrGz1YWyNeNt1iKucLad3DtQWuk/r3Lg4Ul+cORfmykHx3fRmQs1VBN0
         ndW5Z06l1JKGTr/sjH5adzDysGsvR/SreOrCZoV7E4IUbD6P4DeJWLG9cElHz24zfvwk
         qBqxQVIztX7eaCOdjKSxMHoVp386QkI+oRGqoBuXFhW2eYhJ5XBYW5ANX5lKkt6Z5Gyi
         vNIxYOUmrTQM1wB7i+hP0VFgV47KGnt9v3hdVQ8cHOZPaOFM+uAFls3qKWga1enrK7ci
         vSfg==
X-Forwarded-Encrypted: i=1; AFNElJ8cJayJY4zt21axI5PfdquSeKZzNf+zWj7mPQbmkjxVKJhKUPSdycBGveyTbG5HCYV3sCTemBSfsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXAexmo2isXDH19cR5rSKzJHe2On0F5sUPTnzWx5RCo2a20RnK
	ERY2/zleLihDuQtMGxyJ91w+cOjHuxio34neiNpZ0bm5u7cPpCvvM0s9/kSzHBwFb4M=
X-Gm-Gg: Acq92OHgkSLNywnFxzZUgqdK/VWw/xKHdxRZSbBXgAXjWGp1GxyTD0ZTapmdRCWZYH7
	IdiPeNlnoCzDM3uFit+vqBsVTzqZP0VvuSIa7BFHcYoskEUc3YIXyFOt32dVC3Fa3VYltivImwk
	4JcSoqt9qjNBO7zEOHy8r4jjwPPBhZqoOm6BelROh4c0sIwP0x/VOKoDpkYrXX3BcZWYSCaF8Zv
	CVbVzdEkf6VBfL3PXyt9u5sr9iQaMbQkGGH4roAlDzwtE7HoMLBE5G5DsT1v+Zzx5odG+v3TbX/
	XAkofqyYtb48DDezFrvoEvqZ0a2Mj1vH3xZ5E16ASQIZAkKd7D1gSPWNbbUWxRwkIajZ1ed1hh1
	hbMi1Lc1pfdbOkwGIHVpcCOjmd9claEAbTSuDnZokMaogO96lu6M0iuPGB7FH9B2Jn82wO6mMMF
	8YZNCaDi2rC7/hT0khHzIDlRn3Xp3cgjSMWK1/PQw=
X-Received: by 2002:adf:e609:0:b0:43e:aa88:f1a1 with SMTP id ffacd0b85a97d-45ef6b92502mr1248001f8f.30.1780080564532;
        Fri, 29 May 2026 11:49:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef34b47eesm6096276f8f.9.2026.05.29.11.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 11:49:23 -0700 (PDT)
Date: Fri, 29 May 2026 20:49:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Amit Sunil Dhamne <amitsd@google.com>, Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
Message-ID: <ahnev6lMK5tiUybP@monoceros>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
 <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzwfvojoqum2whq2"
Content-Disposition: inline
In-Reply-To: <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>


--pzwfvojoqum2whq2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

Hello Joshua,

On Fri, May 29, 2026 at 07:29:08AM -0400, Joshua Peisach wrote:
> For macsmc-power,
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

Thanks!

> (I'm not sure if one can "Review-by" a specific section of a singular
> patch, but also the other changes in the patch look fine to me, so
> consider it reviewed as well.)

I think what you did is quite usual. The restriction doesn't make it
into git history this way though. Another usual idiom that can be found
often in git-log is:

Reviewed-by_ Joshua Peisach <jpeisach@ubuntu.com> # macsmc-power

(intentionally added did s/:/_/ to not make tools pick up this line).

Best regards
Uwe


--pzwfvojoqum2whq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoZ368ACgkQj4D7WH0S
/k7D9wf+K/Kbjth006e5cY3RbjoS8K9jW3NQ01G+VBxY+lHExj1dG+49FF1HI8kt
qfulP3y/YdWSh2JA4Iu/NK5mHfXtx3IWR9T8IuNyDfXpEJECZipp2WG77R9slfko
t4zpckQ+iaOMoUDYB7CB93ltVHaeYHp3Y079Vm1cylL5z2/tessr8YqNr+o5lP/l
c/36Uyh8+f0J9Vm+OEsK5r4lyPA9YxyotfCCx4qbxxAjgGbQUW+rj6MZgm5AGfmK
rcXLESM1abNV6atU3liVQQQhtTPw4t6YXGDZVfGZbyMLtuZTrVZKCQF24odWnbJ6
juiDjaO5lCkS75qD+EK1IeT4tTF/hw==
=+SnX
-----END PGP SIGNATURE-----

--pzwfvojoqum2whq2--
