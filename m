Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996456;
	b=hgGa3DmmVSdai7jGGLUMd2NuUUnSTOzdubJoJ++j304cnFzceWDkEJHwSTL5c+McKOjn
	 jBD8JuIO5JOhGHHkIYwHGXB8xTc10sQX1xjzISDrY619jMyn9Bmbc+TWHiyBccg1+6vuR
	 AQ96jx7P2L1nsgKlcRuUMkLBv9M0UF0zVBHEWmvRIJWsGmeNWJzIc6V869cHIUDi4Xtzd
	 IC7yh3CwHnHGGhmy5key/UpwziNFADutkDNoSoB22lA7Ud4sLXnsNKS984+BLqXzejAZY
	 XW1h4XwOaX0a6gFPnrvtvrx6JuDuIyi9kjd714OfhcWTCSNMjNvQ7f90JpL33wdcV/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996456;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sf2ef/DZzsnK1sMDSaxmFCha0DAq5bCsGRzR7EIIXpE=;
	b=qgS1qhaDeyWakC29wF8tw7tH6nDN1GpbnIvwB5PNwWm/uYr4Oxqf5r82J7Ay98+EoaC6
	 FZLXiBYYgSoRPt2YEr7Kj7bZBSzSyHWrNrH8vpiWtqUzcQ5ZlK8y9EaFDmwHEoBKEB3Y6
	 lWFq0DcNeaEOkazPMX3+uYaC4C5LcixhppM3/0zRVKIZhuHxfQLGsc10luTfEAmwrHem8
	 h/DJd8KLdgQLnIHy+VNtK0Az31Lxom+Qegt3EE4C2QzEXrswcAl+0+H+wNE+VNzcbqhXZ
	 EQEET9bAC4pM0kC9TK+aOaRbfwdf2s8xwUy9KwuijBtgBO492Ymz1LDFPKaFtp22bqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2QzbFoJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693F5606A337
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2QzbFoJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BCD1F0089E
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996456;
	bh=Sf2ef/DZzsnK1sMDSaxmFCha0DAq5bCsGRzR7EIIXpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d2QzbFoJFY+k8q9V/CGKaMctSrm9z6TSBfBrEjsKosoFas19a+BaErySppE4Ncgt2
	 +YSdxqUGJKw5Ow6BHQmZ0I0Ug7mKId8Hr0d34Dtn/ism8hNDrU1dMb81zn2rGg4keB
	 1Z5QdzO6tUdStZVyDbBk+gjvk1yWL0KOISnTmx5EVdT9jZSZut4WkMBxY2JsPLJUNg
	 dvrkhrUmgKESSnXvjOZUlz1jSYIsuRpL5f/yC03cqwDmO9+V6HuTUlWi+hVrWihCWx
	 9WNv7YMnr1sf7TR58+2c1ubP35MTMNjuajhXEep1RUviGWq5QuxI5Yx/X+Yl5d6r3G
	 XdrDIOXkQ1+oQ==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso605199f8f.3
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 02:07:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFKNIqh+wAPEwLxnq7v7gKoZwn5FNQzJKkRrjAIB5g3ED6lnKqo5oQyhmkQXINuBWzgXvxGrHaCrw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/TgM81eOFbuSusvCiEpXzSN4HBAG9SkKQIjYMYk07/ZDfYDoJg
	9QagJ6jYAWcwOOr1KOiDmDJpJOZmJj/ueJVlzCCfLfFPKKm9M05ETUKVJB58uwYNMBap7pf92P/
	W1AKmI0PYU+/0stv5q3QDrhXw3H3Yx+Q=
X-Received: by 2002:a05:6000:4812:b0:48d:ff06:c626 with SMTP id
 ffacd0b85a97d-4a63b6fc6d5mr4531220f8f.35.1794996454710; Wed, 18 Nov 2026
 02:07:34 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
In-Reply-To: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 18 Nov 2026 18:07:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+86jtp3Dw9pw8xf7zK=bU_txdGYjaJp+85H7WE_iKLA@mail.gmail.com>
X-Gm-Features: Aa3M54rjZmx21x9qbdtBeJSZpO91ThMWIbqg7YbcJXk95cJ0eYpg24g2amLowHU
Message-ID: <CAJF2gTQ+86jtp3Dw9pw8xf7zK=bU_txdGYjaJp+85H7WE_iKLA@mail.gmail.com>
Subject: Re: [PATCH] riscv: cpu: Fix incorrect cached machine IDs on secondary harts
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:05=E2=80=AFAM Peixin Xie
<peixin.xie@linux.spacemit.com> wrote:
>
> During early ISA-string parsing, the boot hart stores its mvendorid
> and marchid in riscv_cpuinfo. This happens before setup_per_cpu_areas(),
> which copies the static per-CPU data to each CPU's allocated area.
>
> When riscv_cpuinfo_starting() runs on the other harts, the copied IDs
> are already nonzero, so it skips reading their own IDs. As a result,
> secondary harts can retain the boot hart's IDs.
>
> Read mvendorid and marchid unconditionally on each hart, as already
> done for mimpid.
>
> Fixes: e482eab4d1eb ("riscv: cpufeature: Fix thead vector hwcap removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
> ---
>  arch/riscv/kernel/cpu.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index af84b97af3a1..64c0c83eff76 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -197,16 +197,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
>         struct riscv_cpuinfo *ci =3D this_cpu_ptr(&riscv_cpuinfo);
>
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> -       if (!ci->mvendorid)
> -               ci->mvendorid =3D sbi_spec_is_0_1() ? 0 : sbi_get_mvendor=
id();
> -       if (!ci->marchid)
> -               ci->marchid =3D sbi_spec_is_0_1() ? 0 : sbi_get_marchid()=
;
> +       ci->mvendorid =3D sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +       ci->marchid =3D sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
>         ci->mimpid =3D sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
>  #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> -       if (!ci->mvendorid)
> -               ci->mvendorid =3D csr_read(CSR_MVENDORID);
> -       if (!ci->marchid)
> -               ci->marchid =3D csr_read(CSR_MARCHID);
> +       ci->mvendorid =3D csr_read(CSR_MVENDORID);
> +       ci->marchid =3D csr_read(CSR_MARCHID);
>         ci->mimpid =3D csr_read(CSR_MIMPID);
>  #else
>         ci->mvendorid =3D 0;
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261118-riscv-marchid-fix-3ea3672d1e0e
>
> Best regards,
> --
> Peixin Xie <peixin.xie@linux.spacemit.com>
>
Hmm, it solved the problem on Big-little cores' SoC.

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
