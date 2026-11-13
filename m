Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592125;
	b=DRpF75AwnERDdmvtKJiPTfCZTXXsLa1eYQZ8xOE+xY8bQgM274TpdYe7d4pVQuWcxyvi
	 zW4cXJHH5L504FQB+d3oHkSxuK0xsyEiqCd6nYyU+4El0Ue5CqAeRbKBNTy6xH5QUqInr
	 GxuUUtqSjme7t7cCaqZ8OAeAp4UG8LQZNGEtDZJebfrs1DoN0QU73Jh6g0lVCIH05hTwP
	 UgbgSSluzCRVVbp93HVpR87u95gG6feP2F5Zvsb+jsJqhj8Q0aGS/Dm/tYl1nURfcwWk2
	 Zo2c1DAMjoM8hwBZL6Z1jztUxBc2p9VAZNiu05s4xxddgMxz1QeV/6SIbVbpUce4Uww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oNynPIYr0dE3TxyMaeHySnLJJrKQN/vNpl2l1SdArA4=;
	b=OOlW/sdUnmLGc6VH35FRcbTVatLKYXOz99mDzGmaeEvjbAxwBy1IcVyrJ/v36zVxgUE0
	 dzkzHmnDvC2Bfrr/Kdnw5egMQMvu49gbDS4qAe+F6gjp52UvzWpFE4brkmSyw+6y9v4QB
	 dpz5Bk3rmzjHdAfWqKBvfkOagMVg3reVMYqM8yZDPTAddf9XOsTNXk/xzgLlxG2j2fCCV
	 Inz597rnm6W1e6/IotMRFPTLg/XfRVr6apWKeg8/jW8rMpEOr+3I1BDVzgEyg3lIiJRbe
	 /yt8C5bADP+mb5+IC8p0Uax+cP2D9Ae7TXAyl9pFf9K8ADShKTE97CyMyEvF9Y9MI2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAF4S1ac;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE89606B23A
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 17:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE89606B23A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAF4S1ac
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50933bdf4bso325638066b.1
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 09:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592123; cv=none;
        d=google.com; s=arc-20260327;
        b=UIhMQ3xgYCl5DB3Oug/dYZ5KHHkP6mwb/kro7r7/ZF/vlqwsgffO7fnWKIoBc/lxZ6
         bQ6KJpM9v4tCvrp3vxhjfw8KdNLdNttEzslOZfilU0O+pv+Xh7m+K6oVzPzHtQm46c9a
         dBhzocXyx+7N7epteZP7gnpRXgrtn5rm4L3ElwEJ9hMEB4F4lo8qrCBmXw8uqeh6o1sP
         /9P/yut7iwiknKM7DHmgpRy7uKl5tPxEHl7t2QNGoxhJGAhVANKDj4fkh/CuBgRtoOQu
         vl0D4RHTB1yD8U4/HpuuNhI2ibozE24ch82F8cMlwiVVLRfHgTVFCk+vcK1nAodB2HQl
         WKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oNynPIYr0dE3TxyMaeHySnLJJrKQN/vNpl2l1SdArA4=;
        fh=N73YUEpAX//4xJRZ2xfOaMYyvT5oThqZB9l+FqDA8Yo=;
        b=G/Z9qP5y3OTkAo1xY/+43F1rtG3S0ySk/aGKuFbV64ba6W72LCNtwMOTeZeIGVnc8F
         oWt1YE0ovAZYVyyoPBhclPlmiICZ00wh8IR1U6zL0SVmhc5d5fsfehcvh2WTwg3YWX/c
         b/7Hvoi2Km7xFhwPvwqxXNhcgCfsEV8IvgmHIQ5LMuYGWJ0nYDUgZ+90qa0mytzsi0dc
         OBdAEqEK8sXhuvTaAKBVJQnL297ErgeWg+yDbdAUecyv8DmkX/tfPguE05PsErUS0msy
         GOGaZNcTD08/Gw4JUrViyN3QcYw7yS7bZSNogKhb9entHgx8vmxD2cEuDjYnlvcFvn1y
         DI/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794592123; x=1795196923; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oNynPIYr0dE3TxyMaeHySnLJJrKQN/vNpl2l1SdArA4=;
        b=jAF4S1acp/PNP3yqNiapu2Cabt1o7Ekbe6Tl0pS6ORuitHLEIFfP4ig5DpZ6I5Q4a6
         K6EQNO/YqnfR9nevAZQEkgnw2RSQU+6eQ47FOum/fJGJVfOIs5xjiZOZ9PhQSczTpcTX
         S0bizAOcGbzNWVHnhmxutb01TurfteZ3vEZdVX7T9W43/g1rXciUmGp/6K+XyN4d6UJi
         b+pvfejq0S+Weo6U+0frOpxyelVWgzGPL4H8aL0TQCZ8X9qOzclaFjItSGaxIKZ25Fmw
         4CzHw+p9Pjgm9h0EGysplTHfQTrZBQn7RUsJkKF1wyGjhnLMbDSMeng8Epmrc3+rpYKE
         lVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592123; x=1795196923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNynPIYr0dE3TxyMaeHySnLJJrKQN/vNpl2l1SdArA4=;
        b=eYAxa65lqtMiEKj0saeZBx1qTmLkuJtSigboz0mjKNLCjY0FW8kLxpCTrW2D0nunUW
         lJA2DRs4cK9boKLfU1kAZWllwCK5wDVFBx7BCjAJl8CPHX7ObtbPSQlpQTp4C38rRzYo
         rpciz+kMD6cn485BwwKlYyPQ+eGGTUmhzqXrCpv+kr5l/mSRZvfL7MUsnS6L9AYOlkPo
         FKmSGwIQS3e61GF05Njj4kUv0+M55dBbzBqXUgJneFyOsc4goIkw1AA6F2v2ZG6kO9ky
         E7pQvhE06T/cHXeTKKSrV3vuweElAwSO5TQuWVQfSxQOmKnvNG8WwxZNc1PkmfTuojmt
         ix8A==
X-Forwarded-Encrypted: i=1; AL+hErFkettPUagyBgAeXs7Vp8QPMDYiN1eX8mCihC/MNQUUn3iAwSxw4DPV6ooYWbqai+ecC2iXSHa1AQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Nox5cOPnBOurF2Sf14NL3OyOiYxjQPE0cnPoSO3bOwFZJ6IJ+
	9e+OmVp31z8y5ZF9cD2DgD8dJ6/y20uT1ejjN+Zqv+WdWzr2RmsYu331GGjrszS/ZuWgMsRkbsl
	tNvKt5ebY61xuSLkwdmPb887NFNtCgrw=
X-Gm-Gg: AYBFou2FxPPBA15jy4cqarvYbuDRnY4j+UScdvXdJBy2Kc27UZeuCnYN3GpQnXaqmaX
	yHRbb2UgJE/LPtaefHJN/7bRKFLot4PTCIP27U5JitJN3x/X/jtXfx9CShlEkwiOfD7eWExtyVV
	M+0xoMmDqa6xZeDXoKZ0CdokSOGEcftmJITckuLLWjbdMmNyBSfmvndMvlXjwA9X7c4E1cCXhnm
	vaaeQLRXmVvUU65QNIRjE/halmYDBNwVuH5KeG9zETe54NfENe0GMADoHoN9GK2lcY9dre41aAt
	Bdd2w0KA6T4IH0DpU3WlIbyYfK+Yx3+vSQMyGqMN5ZF80J/ujigMvzilCRCGdfg204nN+mhoUxk
	1pvBZxF4R2LgZIrMPc1FRu64p9VT7DPrQHxbiyCcy4bPfRap3U/P6J9pGOOrrgscTp5hRe5MBfY
	7v22S1gXg1b32rI4HGBBC9dg==
X-Received: by 2002:a17:907:d01:b0:c2d:d4dd:8d0 with SMTP id
 a640c23a62f3a-c507c3c72b7mr625099266b.16.1794592123102; Fri, 13 Nov 2026
 09:48:43 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113132435.434615-1-alitariq45892@gmail.com> <20261113132435.434615-2-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-2-alitariq45892@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 13 Nov 2026 22:48:29 +0500
X-Gm-Features: AclHuK8Pe1ThNtetEqiSLcWfitdjibDvU0d4btaBsFE8aUM2ODczptrv0nOcYxs
Message-ID: <CADqcGBk==F5ncuWFCec5NKfgqpO1O2sSWVeHY1h-F9MjdbouQQ@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: spacemit: Fix TX timeout work deadlocking
 on itself
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Tomas Hlavacek <tmshlvck@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, leitao@debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Traced the paths: the work and every emac_stop() caller serialize on
RTNL, the stale-work case is covered by the !netif_running() check,
and disable_work_sync() before rtnl_lock() in suspend avoids waiting
on the work while holding the lock. Looks correct to me.

Nit: please add "Cc: stable@vger.kernel.org", the Fixes: commit is
already released.

Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>

On Fri, Nov 13, 2026 at 6:28=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com>=
 wrote:
>
> emac_tx_timeout_task() takes RTNL and calls dev_close(), which ends up
> waiting for the work itself. The function call hierarchy is as follows
>
> emac_tx_timeout_task()
>     dev_close()
>       emac_stop()
>         emac_down()
>           cancel_work_sync(&priv->tx_timeout_task)
>
> The work never finishes and keeps RTNL held, so after a TX timeout
> everything that needs RTNL hangs.
>
> Remove cancel_work_sync() from emac_down(). Disable the work in
> emac_suspend() instead, and enable it again in emac_resume(). emac_remove=
()
> runs before the devm-managed unregister_netdev(), so use
> disable_work_sync() there to stop the work from being queued again.
>
> Found by code inspection. Not reproduced on hardware. Tested on Orange
> Pi RV2 (SpacemiT K1) with suspend/resume cycles and kselftest, with
> lockdep enabled.
>
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Reported-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Closes: https://lore.kernel.org/all/DMO74K2MG3D7.15UUOU1O66K6N@linux.spac=
emit.com/
> Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
>  drivers/net/ethernet/spacemit/k1_emac.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethern=
et/spacemit/k1_emac.c
> index 71a80838bffd..51edc95f54c8 100644
> --- a/drivers/net/ethernet/spacemit/k1_emac.c
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -1732,7 +1732,6 @@ static int emac_down(struct emac_priv *priv)
>         napi_disable(&priv->napi);
>
>         timer_delete_sync(&priv->txtimer);
> -       cancel_work_sync(&priv->tx_timeout_task);
>
>         timer_delete_sync(&priv->stats_timer);
>
> @@ -2010,8 +2009,9 @@ static void emac_remove(struct platform_device *pde=
v)
>  {
>         struct emac_priv *priv =3D platform_get_drvdata(pdev);
>
> +       disable_work_sync(&priv->tx_timeout_task);
> +
>         timer_shutdown_sync(&priv->txtimer);
> -       cancel_work_sync(&priv->tx_timeout_task);
>
>         timer_shutdown_sync(&priv->stats_timer);
>
> @@ -2024,6 +2024,8 @@ static int emac_resume(struct device *dev)
>         struct net_device *ndev =3D priv->ndev;
>         int ret;
>
> +       enable_work(&priv->tx_timeout_task);
> +
>         ret =3D clk_prepare_enable(priv->bus_clk);
>         if (ret < 0) {
>                 dev_err(dev, "Failed to enable bus clock: %d\n", ret);
> @@ -2051,6 +2053,8 @@ static int emac_suspend(struct device *dev)
>         struct emac_priv *priv =3D dev_get_drvdata(dev);
>         struct net_device *ndev =3D priv->ndev;
>
> +       disable_work_sync(&priv->tx_timeout_task);
> +
>         if (!ndev || !netif_running(ndev)) {
>                 clk_disable_unprepare(priv->bus_clk);
>                 return 0;
> --
> 2.34.1
>
