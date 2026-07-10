Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F239EF23
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670848; cv=none; b=iRt6DLwIgfT0cqpE0v0Br2hoqnIv8r1/u6SSdCb8FBHBWOGhIRW5rNTDqbhShtWCBMHsHsU0CXjiOwDDOG/GNww0fP8Rca8f5ZCnqXpcn4XEaIl8I1FG/fvslcv9KAfsKVLDFJzJYjUTIfGrTqPpC+dXddBrACIgXbZUTPUIBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670848; c=relaxed/simple;
	bh=mSbZIZTtDLUKMqLM4SJXPxGgeFGM+l932pt1k5vRiOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCnaRLuIyPPVkHWAMZYbpzMlKxx+zE/0lS3iU/ox+78q2aXNMRJHdoJRlrUFItxKeZsscPvVvMPTZhqM/vhITU5ZNL2c8MVQ7umfPz6Zkw2Wa1ifq9tXFMiZT2exyQZ1/CC1NgY8DTwsa/QRkhHrJmrP68mSrZVs/eTaTR3+rLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=STAExp1+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="STAExp1+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-470174001a0so429603f8f.0
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783670845; x=1784275645; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSbZIZTtDLUKMqLM4SJXPxGgeFGM+l932pt1k5vRiOM=;
        b=STAExp1+CIwDLOzywIiX8kyeqCDdjJ4w4ExIZHJY0ZaVCKqGCfkuuLvihN8w/Vsnhc
         z6VnsABoA7qjNfsUyRTBFUXNa4NrWuBnTN3Q9C6v8jJlqNT1gtZb1q9XS7htzy1P5hFb
         3HbAFQTtOOVsVMExqhyiMDAouR/6Cv1xzm9tNYL9vGBXb9U7C8cf7DSr+ChWsERsUs0D
         cHeMxPCCb6muixvbdGYdCL/kYoWwWKklAIbUls1bpk8mJeLuf/2UVdNuLuiYKxId4dKB
         6PDITDPzeA9h/OZstRTTe2Bke9uYnFMiZYo1jFMNf2gSrWoaFOaz81Y/GYvKfmTzbqfW
         5JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670845; x=1784275645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSbZIZTtDLUKMqLM4SJXPxGgeFGM+l932pt1k5vRiOM=;
        b=XaLvyT0W15UMWW+CS0JQdPcoQNP2/94UuRKAVIgE2FNASIvX49MFflo0lJFO2cElNA
         XqPkvb2ZSNxhxrctJL/HV5QnLubYA1yJihAXhVzLoAxWFH90H40V5oCDVIv+k8c6Qfk0
         oOKCLxPTdRGq3SSqXI3CvJpxWdqzHpkwOYBUGpa+FIEGec+kHLeS9Hxtz9Mi0scYlbQE
         WLWefUvbS1ksTOTTkzhTd7vDQhH5LIfQd7v17NS73/TAW6bw4i90eCoCaGvp2bAXEPBG
         sV0jnGowDRc87eqaN0czetmjf26EO2UBbxDSHNDs2SZt25M/7NWAvmTEkRagz4i88yui
         SJUg==
X-Forwarded-Encrypted: i=1; AHgh+Rrv4ITnl0mNOI9RTSku1G5kwtRM7oaywAnfCHQXLVDKfAq5Ou6wkUtKaJ2DQu7dqkw+khMpA4tDtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQkXJzfdfIojx7lMjMpaRpqQVvPxZmDne4WBxWIV5gnd1YEvRu
	5qkFNIRsa75e/SapoPkesSYRby2MTNxj+yJbR3/KId7YviJhktoUxYV5ovvAZPdGFYM=
X-Gm-Gg: AfdE7cmEgUhUollfPyVlOqw+G+TM3WJhblPGJgECNpdkzqMOOb8iB0W6al71PLJ2TBq
	E96nE9UbcfIft1anDQS7uHXUQMlzzFXTvxetlS7dtUsL+kxBXpnLVLP0u3/CE7gdxsUOCOgRKxi
	2sLK+C+pkn44iQjq/V6a63xxgBeTwH1TWTQ5sNqxjCkYXEr2kJZqe2DZeY9KbHG6yV8dSBD4WAT
	I0IZkV5Qus91oYwFMNMp3NvOsDlwhKzxUOOCahCtmEX2StWbHJk/dhom7q3FJS/kdXwPCpaQfj9
	koB2IaNOHzfO3rs6H6eU+IiNbf3PR5MVJhWLG2fUsDROtVcaim7Y2uu6X4KrEnCZaW8lcdUxHyx
	N5zzUlmP6YBW+xNTiz8FGrK1cOjJTL8aG5+eVCN0f3JaX0KKk5GqWJP60wY6gWD+A4yNqcAk7y7
	7znhXgM2TOm7N7NlfIYZaMBLJUbbQpT7S7rbLfuaZV/m5LMAHZNmztdC1XkxoACRTbAvvBj05Bb
	L6y
X-Received: by 2002:a05:6000:2f81:b0:475:f0f0:9ed0 with SMTP id ffacd0b85a97d-47df081bb63mr11161402f8f.59.1783670845331;
        Fri, 10 Jul 2026 01:07:25 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039bcdasm60375423f8f.21.2026.07.10.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:07:24 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:07:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Lubomir Rintel <lkundrak@v3.sk>, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
Message-ID: <alCn7yq5ltsRAP5j@monoceros>
References: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tb4hvlljts43piz"
Content-Disposition: inline
In-Reply-To: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>


--5tb4hvlljts43piz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
MIME-Version: 1.0

Hello,

On Sun, Jul 05, 2026 at 10:39:08AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The SoCs that this driver actually works on all imply OF already. (ARM
> selects USE_OF unless some archs are enabled that cannot be selected
> together with ARCH_PXA or ARCH_MMP, ARM64 and RISCV select OF.)
>=20
> With OF known to be enabled a few conditionals in the driver can be
> simplified.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> while doing a treewide cleanup I wondered if these conditionals are
> relevant at all. A bit of research found they are not. We will get over
> losing compile coverage for COMPILE_TEST && !OF.

I applied this patch to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

for the next merge window.

Best regards
Uwe

--5tb4hvlljts43piz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQqDkACgkQj4D7WH0S
/k7m5Af9EqKXVKajJznf7LCaNjAtLjnYKXogyd5DJe9y4h12iiQ4E0L16zTpUquA
+d8H4y6WBqv5Sw/V1kHyXR4nva8Hjse/yb9oVj9PzSCs/bfseheHbPyKGgJ635V+
N0YEJAYFE9cyv9h1EFpkpJ0lr7jgjTfv/j/XGZ/jaX1o637SKwlYRu/UCVghyU9U
ddbPgQuE1VdQeFwHn71waBzEf1Pa4xboL1VKpqAxVJYl5YWYmyLhyG24Jy45VSzI
1RfIyMrMfBpcjhp7W74SmhrlceCWG4ihxmgGOOb+eDtQ8k2YRo9eT6Z1vc9efPFq
Pi3mXdk0vITyiipLDathqGOmy46Yuw==
=5MWJ
-----END PGP SIGNATURE-----

--5tb4hvlljts43piz--
