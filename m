Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3065154EECA
	for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083536; cv=pass; b=mjdK7fS/RC2RY7NqPGrEcFAtN8Jo44gN8XIeyqq/3SqDE7QTEgNhkg3yJ/Q5ky7W0rG/OtCyEwaJ7DKmtaQ88LndiQ5nA9mEHM4Kr5C5H/TEpVr3dj6Lr0ze914uuPZM+t8k+sDviTM59mpuiNq9MNCFmlWpA9MYpk8191/S1KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083536; c=relaxed/simple;
	bh=4m7SBHHakRxvWRxrFM8W3RjKHQwaQaOVYLNHKqhxYcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIcgs+QBZcmBAjYOEGz2FRaJ5UoB9DYzOANq5tZwkdCwNx8VAn2qDOud+q3mVaJ6qd/B+fW9/wHvHriThzjWL/krjXfqbUd9c2KRu6KE7Y81BmjMMKyFEP/5/P1lfsXuUGC6cHsnvEr/pRhjJfxozJd9ZKxF4nJ/b4DONhozIiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbEIpm0s; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbEIpm0s"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ab432273c5so50058617b3.3
        for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 09:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083520; cv=none;
        d=google.com; s=arc-20260327;
        b=Tn6rd+P0d0bg/ckAs33Qq2CFoYyzPxTqXuTVb6Rvy9jYLCqeydguMtZtRE6EEJXRQS
         Aw+7hH1u82FjNrMllIVo9UDlK/0nlneU2sdF9i/Ef3b4UgVnyfcij5HxhHcmFMxdlKbu
         yvc/1RPj9h+G/YwsUsU/5vikFd+Gef4ra+w11RdLsOYWWqFm6cBLfcYVv01HhSjJsK5o
         uk8i1fkDcXRqISz9BvPoZcfjk34cSh0rAGVLo36usCGd5/a7RHrDnK4wVcMF18nRInYI
         CDcDoAw4zAu9eBC+RhzNWLvmV6s7TF15mF8l6JTlmt0sm37NuajrkRl3wrwVofCuVHE2
         Wtjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        fh=1ZSIKuEK+9H31VDSRPWHAwY0GdU1uixOjhxMaFJlrXY=;
        b=qnkmWB9nz3NSIgC5XcC/HTwQxxdeiG5ejx+XS4xaOcJAHvb0JjZuanLtXN+ZAGN1CW
         dgAQJigOuk0mxwClY6m6mx4Ghz9m4938UXJGBe9I95AK1gMgV//1B3ghJiPHnkgDcPbS
         twkwiZnQVz2pIDU30JkP9OSV+RRKAcLT1S7tU3CS64q7xpx+RnR6ziWxz9eMrI7uYiNV
         aPVfA1zf9mTPLdLqr2f0H2pT+8xFKYzuErncP6F8wYDO7PPFM14i8soYi6gMetlMmqw0
         kTytFm2vHi9iqhUHpcamZ58SGCjCzABSAOJoBMpY8INinyoPkrV6+4MTg2Ja9NXDtYTj
         c9Hg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083520; x=1792688320; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        b=XbEIpm0sFZ16QFLAcEt3agS5ARDpPkAnC95jt/K3YY12grGGD7pQF7qxcXquqbmBGp
         f/KDJ64Wp9F/BRkRSPb8m8HrwNOUeqkfs1l8YHOAuhAngiCnDU63BhrUEyR4GWWSawkg
         U+ocxdgUdozD0glPDBje1O1FUBmDpE6wuKBxfkle9QcIL3PLaUTfyRJQcdV+vn6wEQ/K
         9k3iuCTDe4alHHRw4UxzhRkw5da4CnMky78jXIbJpJ9Vum93bC1lSEmSucRtK9h15s7N
         j9oAlL3k6w5k8x4+9rtQhElmJDfLh9G+ALTdh4v9gaoECU+izNLVv5JyhdkwaTq1qsyW
         +65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083520; x=1792688320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        b=PXaaAZijTdWw9/vhl4HVgV86cTDw2aH54EYWR2EbaaaO1NFBL6xJ2tVACL39cqBIy7
         RMNxkXwIjM/2pyM32WzALwFUzj0LW+jhIBRysfpcuwFaiwgckUnprFxkZVm1HQIMk7t4
         ZmVDB8VxsR8DyWCGbHIrNhMYtTAt7MYAhrxM2RmsZXt4QtXXc3iq9R+4Q3UWWFP165lG
         TLpS2AduuPZr6pWqHDz/r2jcgmX4MNbRZhPS2FGAD0TSQoOG+G8QJUMCszStsdpDXsrZ
         FJ+oM8tiSLoY3PGmWT0RgXDWpBjWj+06xp+k3+y+33pKY0tHQryxvqFWXNfTfT0P9GHP
         D3Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwFSirGKqLyuPMd81/Zgm/WnMig3I7EgjzyVDnB28sfSoiVDn+pObAW3af8tQn8tZ5uzMk0zQ9DjQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIos77HUcyc9VbIJ+sOH+xGKtcdlbbAathNkbydD871wgzAzZEf
	TcZQ+e7G7II8hhLWXERIVcYq9ra0639tEolzxpzzRRBdzltSwT6oSfZFwuoJGPgY1RrYkI8Lzn4
	jzv7n2YchNp97XoCTN1WqQXvQzP12hnqBtIqK
X-Gm-Gg: AYBFou34gO2zDWZYY45ZJq1agPVaOY7gihMBV97RDN2RbKEWrMpDNmOZJvUgp2EE99b
	OpA4P6sb/Ze1/kLQr3tQyRAlOUmRY1ewu6soOvft05BR+dd/grPgZksjrpyLhDPjp7Bi8PKpY80
	QpholA51Mz+EvP5fEDyz6lfTZm8CfRYfhcoy+7b5PzpxaW8Hk5rJjSoy36YG3Z3r9+TtO0UN8pB
	Qqtgkh1TgM7okIUsli/i7frURahGankBS+Aare6Pv4HiqqriGFwPeudaA0VLhKCweFABef9urNJ
	WmNUIdJqbBfHeWjAJbrBqQ3o/3MYaJRfG5HEVywPcqAxnO1KCaByEvet
X-Received: by 2002:a05:690c:4006:b0:8a9:9f40:24e0 with SMTP id
 00721157ae682-8b07edc853bmr64426667b3.14.1792083519586; Thu, 15 Oct 2026
 09:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org> <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 18:58:00 +0200
X-Gm-Features: AclHuK9x9oH7LPEYYVfq-eVNh1cOyJug_mdtxh9957qtgQ6Mf8exPEfJOQrJddw
Message-ID: <CABdCQ=OFZw+DnejaF4DothYGX=u=pTEgc3Gru09En7ApWHpCLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: spacemit: register pm domain auxiliary driver
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alex Elder <elder@riscstar.com>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested on OrangePi RV2.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El jue, 8 oct 2026 a las 4:58, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3:
>
> The APMU (Application Subsystem Power Management Unit) register region
> block contains the pm domain management capabilities, introduce a pm_name
> member inside CCU data to register a pm domain device via the auxiliary
> bus if that is needed - if pm_name is null, no device is registered.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu-k1.c     | 1 +
>  drivers/clk/spacemit/ccu-k3.c     | 1 +
>  drivers/clk/spacemit/ccu_common.c | 4 ++++
>  drivers/clk/spacemit/ccu_common.h | 1 +
>  4 files changed, 7 insertions(+)
>
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.=
c
> index dee14d25f75d..9e2727521916 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -972,6 +972,7 @@ static struct clk_hw *k1_ccu_apmu_hws[] =3D {
>
>  static const struct spacemit_ccu_data k1_ccu_apmu_data =3D {
>         .reset_name     =3D "k1-apmu-reset",
> +       .pm_name        =3D "k1-apmu-pmdomain",
>         .hws            =3D k1_ccu_apmu_hws,
>         .num            =3D ARRAY_SIZE(k1_ccu_apmu_hws),
>  };
> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.=
c
> index 92b930d5ff30..e895d3ee6a28 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -1449,6 +1449,7 @@ static struct clk_hw *k3_ccu_apmu_hws[] =3D {
>
>  static const struct spacemit_ccu_data k3_ccu_apmu_data =3D {
>         .reset_name     =3D "k3-apmu-reset",
> +       .pm_name        =3D "k3-apmu-pmdomain",
>         .hws            =3D k3_ccu_apmu_hws,
>         .num            =3D ARRAY_SIZE(k3_ccu_apmu_hws),
>  };
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu=
_common.c
> index 56f3d081857e..38577fb7776a 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -169,6 +169,10 @@ int spacemit_ccu_probe(struct platform_device *pdev,=
 const char *compat)
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register resets=
\n");
>
> +       ret =3D spacemit_ccu_aux_register(dev, base_regmap, data->pm_name=
);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to register pm dom=
ain\n");
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
> diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu=
_common.h
> index 8691698e007d..221a92117b94 100644
> --- a/drivers/clk/spacemit/ccu_common.h
> +++ b/drivers/clk/spacemit/ccu_common.h
> @@ -41,6 +41,7 @@ static inline struct ccu_common *hw_to_ccu_common(struc=
t clk_hw *hw)
>
>  struct spacemit_ccu_data {
>         const char *reset_name;
> +       const char *pm_name;
>         struct clk_hw **hws;
>         size_t num;
>  };
>
> --
> 2.56.0
>
