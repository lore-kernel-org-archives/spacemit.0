Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65031380FC5
	for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083453; cv=pass; b=la8tLS8RR4nni3MDDCN9QvkmulUryliPqpIumI8UqGCaioCl+VjFS9MxS52j8nwLL8b0Nhur7AmlvXCDG6w1V48+fspIspf20XvQ9ul+uoD3RwjYLPebQhj0HClNV5MwXrNYB9RmgnCzAPsS2J8QAH5BFKybN6rMcE0WGMaQEl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083453; c=relaxed/simple;
	bh=Wcbn2GcvtLQUEORhzyW6dd22VWzNNL8fogxMLhwJTug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/D8Wp9XtBB1V9T7eeOZ7cybuvhBenwWa9zL5KmKKcIV8gY7CrCxKNIuKOUOF7EG9UfuYvjS/7mBS8wp5temgUDfoC9ctgn9FO2/XWlpiLOCz5z57o2/rAUQus923QOS/kxTdX9Zshnbv4+9TmegvACQMRqCSUuKkW+wJCILfMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPNJCIXD; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPNJCIXD"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-885cf67963eso46736237b3.0
        for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 09:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083433; cv=none;
        d=google.com; s=arc-20260327;
        b=QavqW8OHNKK3XCTp7WGnUh36s0IUplveyuB5zz6+vPZLb8kGeMB9h4CyZc5rRZkvGh
         UK9192YSLUVGi+3icNU2WqMidOrbjK97/AApcuShmJOZDdwOTahLg/oVcxE50SVcLWnU
         Jh0ZY8F8XURnEJa45eYhHmPqEJVlIkGXSws/sifA4D9+y74TNf/uLj9bRmhtgO7lF1u9
         Jmt7Luwgk+sAhfzsQ9MYDwRWWpTjvOhMh84wPYj3UEHS6YHUMRRnUmUdnN8CGzEs+I9Z
         sgXjNfCZVIHzqVa9gC9YfZhfpIhk1ptkYdllmTmCGgDFNcBY2irOGhRCg07EtmUll3H1
         jXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        fh=S19inRQFi/Uc0Gdzj529wMeJb0ElZaYxNCJDGw58t5A=;
        b=Z35p0stqGVIaJK2paH8DsBJUAhH4EPOTWmkzit1nQSdFRcxFnKni0gcBxwfETNSSnN
         m8CSDtMNa1Gyk50N/B5Ap5QdeagrLvOoE/z8fpS/Tf6ScXkjLrVwHXUCMQ8Jpj8QUjg0
         JktZelaWoQTxEdKfLFGZpU71/2YNxqcgddjcf4IJ4R1aLx73/8nEZop9O0IkMLdR/sdd
         MTA09airl7sB2D6tFIBVgS2tSyK41DjH+zw+VaurOmR6YyzRL7TlLHS6Ohb1tgYC3ipC
         UfTJudYH9R4sp1d+L+59pKp0wngCTaUGzjq/3mo5s4X+bkFP74MBMs+m2hXAL8B6wdw4
         LnkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083433; x=1792688233; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        b=QPNJCIXDqXwhLOTqf+bmNQHKKbsR+86FHSpAtwfSlrYL5dXJTTxvWMlb0U9KCRvwfw
         aaCphVrPpA8j0cIpmgI5ZrA/JS+AsVj1bdGJrf3DDv7GZ1+tw7Eyq453jKwHR37yLCnt
         de3ouEYxL8BRhSyun+zrEa+WU8BEDYCcc4Qu9gc9t8s4cSI3vU9iO0ocV8DV0IeS7Jdy
         H3QHJ4BNXesZN32HlvZB/iywJTxestJFroqj+xwDNs2CRE+5Qgdgm6kTMuQPGdMUkB+h
         LlT8v8guGn2FH90+zWdrRYf1QaUSvvDyRiXqEyJm8HjLby8uDyNM2jJ7bGZwhBsZd12Q
         amRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083433; x=1792688233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        b=Hb2AokDtIJMxqQnypW8Jf8SPh3rXSH4yhRkyOkTLP9ByYpMlpTSmR1o1yJi3I/93GJ
         FxHFoHidQB35UddXocbJrUSlxNpnh7QIYi01fUfDeSWNNFRu7f4WdRV2i/Dq04X54P24
         Uzmz5bMjvdwvF7uMH0MeRLS9WVoB6bZ5h6ZKkYuEeE88mso9bnHO5bIMM/EaRYh/5gHe
         PfpSW8CXdNM+Jynp779p2oBxytZW9DsDG3DxBijysTXV+oFRAONtTjh7co9wpm/dMEuU
         OBj3RVez7MeNf+nAPwROmtcD/C3J5leBacSRMmQpkFmuQCALp/Qx7o5VjddMjtQaOXy8
         r57w==
X-Forwarded-Encrypted: i=1; AKwUvBwLzYtNeTrOuLYoPNYjuNn1ug3XXv3PYeEjA7FpG6t7CkPFKgCWVSczEH0ZhVfrt/ZjWbUoPhPRSA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLqkCcN8pJXz3hUfvP6qD6QSEXI0cWvHs4d9c5b8DSIe4YyqvVY
	7b14etxGHNkwxH4QglwK8n/CCf6xVMsnIbctOef0IBTDraMCpNQ8uXBkKGWoHommKLL4uwN9YLa
	0PCnXAJWI1E3mks/TS9ty7QETvvldy7Y=
X-Gm-Gg: AYBFou2xdKA4+U+cFHH98Nj9nlLrkHOID1N4+sl/btPlIrmQrDkfNV5VzKjnx4WWDWY
	lvvtONbC1OVh15zCTm+8NfPZStviCHQu88pRoJRfZaBL07n+TWQ0eX5vWRTw2mFJVwCgZsnYE7O
	bNhM+v2tGm15LqdvBRzjIO4wjoFx+WSrs7P4f9AHajrL49sECF6MCAmMv2XesRTHUjZGxEEWqbp
	m4sm9YAxN3Varon9ya8ajbYJwuXkGPbXV6r7j7P+d4q4hR4JN9lZNhChojuJSyW/hahzn1brLGj
	6PF6DZQ4QDrP/f2Ls+YPRBRfCkVwJrfvyX/J+SbBFjMsmiRiW41pd32w
X-Received: by 2002:a05:690c:fd1:b0:8b0:dc44:9258 with SMTP id
 00721157ae682-8b0dc44944amr6439537b3.10.1792083432951; Thu, 15 Oct 2026
 09:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org> <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 18:57:00 +0200
X-Gm-Features: AclHuK_UaTV6-y66kPO6og4udDg5dfC89mcLvyhiRip0upObtlxnkinWliLQi1M
Message-ID: <CABdCQ=P3bTmc=DX9zG6ELV=zsTmzDFsZyWhLCWnSwSeHP101og@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: spacemit: rename to generic ccu aux register function
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
> block not only provides clock and reset support, but also the pm domain
> management capabilities, so function of aux registration is being renamed
> to a more generic one, in order to prepare for future addition of pm
> domain driver.
>
> No functional change is introduced therefore.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu_common.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu=
_common.c
> index 8696bb9cba2d..56f3d081857e 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -79,16 +79,16 @@ static void spacemit_adev_unregister(void *data)
>         auxiliary_device_uninit(adev);
>  }
>
> -static int spacemit_ccu_reset_register(struct device *dev,
> +static int spacemit_ccu_aux_register(struct device *dev,
>                                        struct regmap *regmap,
> -                                      const char *reset_name)
> +                                      const char *name)
>  {
>         struct spacemit_ccu_adev *cadev;
>         struct auxiliary_device *adev;
>         int ret;
>
> -       /* Nothing to do if the CCU does not implement a reset controller=
 */
> -       if (!reset_name)
> +       /* Nothing to do if the CCU does not implement a reset/pm control=
ler */
> +       if (!name)
>                 return 0;
>
>         cadev =3D kzalloc_obj(*cadev);
> @@ -98,7 +98,7 @@ static int spacemit_ccu_reset_register(struct device *d=
ev,
>         cadev->regmap =3D regmap;
>
>         adev =3D &cadev->adev;
> -       adev->name =3D reset_name;
> +       adev->name =3D name;
>         adev->dev.parent =3D dev;
>         adev->dev.release =3D spacemit_cadev_release;
>         adev->dev.of_node =3D dev->of_node;
> @@ -165,7 +165,7 @@ int spacemit_ccu_probe(struct platform_device *pdev, =
const char *compat)
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register clocks=
\n");
>
> -       ret =3D spacemit_ccu_reset_register(dev, base_regmap, data->reset=
_name);
> +       ret =3D spacemit_ccu_aux_register(dev, base_regmap, data->reset_n=
ame);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register resets=
\n");
>
>
> --
> 2.56.0
>
