Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592167;
	b=QaTSOej2iDIq7JlxnIoqERPeLPAZc4BaMGQcPLauKjHAy9v3UXc7ggljWVaL2FwPdtl6
	 arwAlQBeDLm0O9q/hIZU1rgVLXItzRxs/WBZVBlf8h/BnShRonb7INFHX3J/JWCELpIBM
	 Lft38T4tEK0je5zp08RNeNPfF8kl+eOfM9kNA2CncC7WQ1iBlOQl6O5m2kJfaVvHjgfAA
	 p/B7xsLrw3KMx3O/KPPa6kAeGO+acl56hcWvxYFg0gXUK54MyoDYgNbsU5P/dahOaNjdV
	 PhJzI2TDkA4CM66PxblgCYUWXWKYEN9jCUkwBdbG1fDdmEgLUZ8kw61+1DgmzKuyGXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
	b=x2OsaeSWQX1pzE4OP0h/R8BbgxD4bWenbWzo/NJiNq0Ru8flWcn2SD26YZe1H8QM5ZlZ
	 xubQJvAB5JGSh51S32h3V2o+caRA1Hep9wlNsr5nBFTOnlCUV3B8M8ivBkKcLpppZ+zTB
	 s4vsWD3aPXmqnrEvH65XIIJft7GABS/qjXPvbVapLJ5TzjspxDrobko8UiuT8gltWvjFh
	 UBYMiHfx+R8DJw0EuJowCMUFnZ/QDDL0pVUIgOaDXp3eEuOFiWFTnLsU+w1OvJ/yt236F
	 Yc9bxjJ7BTvhamD3qRoPCd/huyfgIskNzYV0bB9nARj3Ap32+EuSHAobHk+v1P0DARw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lSjcvu84;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37026079D6A
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 17:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E37026079D6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lSjcvu84
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5067a2411bso241729366b.2
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 09:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592165; cv=none;
        d=google.com; s=arc-20260327;
        b=g7/zpf9oj3blH5Fv3cptw9oXoBrRBOiewgANUIHrhGuz3dJrvrA2NgRFxM6kruj2Zc
         O9yjH3K8CLpL7NyWWa3rbktYXpZb+eIzeywqBOv98Ef6YLOsYn2hoj882uHY0pAdTODd
         neTroRjK4MqCyoD3D4Whnb8WksnSGXhH1ZvEI+6H8Hlw2peA9XkxXG/CZUKh6fOm65hV
         z3fq21Immfh1lRpSSwefb/01AuIx76Y/An7raN2CHhgVEpY3df7HltvtmgpRZtXX7Dso
         QK1rJU2H2CK5TlhBTyRWJ1C/ap8PGznp8AK2yl5EWAFhK6GdcWV2xbeePWqOR9WAT150
         aIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        fh=K8i/6zZ2AZd6ycMqU5kZ6scvAUBuL3ljmNniHyHKsa4=;
        b=END0Rza6ymUdFoorZBWFAsv+ynsl5+t9+1NQV4tF9luY2ef2QRbl/JumMQyFKfrair
         UiMT6CwJVW1podwMg0zIavVpG/qMHy8j9AUyWTfnIbPOWGCRVprslXcHyq6hNkk0Px07
         zsboXlWyQAPRv4nosIPLn4K/8ZVZ0uLIla1iV4++li9wbAcmYa49ihUuRuXc5JjVKcC2
         YhlWrrMSSLV/bgnhm33q3Vcx9KFqINfqBfPj+9LQY6od4oFBnBBuWgeBhEJoBNpeA7ZJ
         ip3qf/Z1tk2QLWkI6bygJeyO7qvk4AcG7/dlfoDbW+3OYraGqbI9W0xly5f5kQoLKrbT
         8biw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794592165; x=1795196965; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        b=lSjcvu841kGtsqU4pMdBGaeorR52ND0dNfkp4roLfWiDhqUPWk/gO/r1VYhEVzFS3j
         PJzSzvdTeDXcOAsZxoOGa5tVXHNtjvmett67adOOOMrck9m3uguDB0hrakJ6huJwIEPw
         UbsVRRZ9N3iIMFEbbY/T/Kqrcm0GIIqJgLHrMRdKDKKTrZdqYa+ERJfaKB8aXnLQQWEg
         i0IqNXfqT/tbwI2nt5hrR9WyTKZn//BDJUHjkw8VMWrk1BSywajxTRJT8B4O3vECmdUv
         AR1Ae3R0jMl1cdKghbvC9NVUeUK0UtnOzNBaB2F0zDtrYL86bdZQPkC3ZZCBisIwHFx2
         EDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592165; x=1795196965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        b=JG+ZUESmZYnqJUuYQTX6L523thdn4iZoMT6+5IHAJtGt0QpCVwTs9EioD3h5jf/oOo
         29S61sCpUMAGchNQciv+xo+QDfh3EbI7AtRJZf8ag2kE19io8ube5KUbjHincH9UIumy
         cz/TXhiLxRNT9NNq/lddV4Agmb8FvnakeWHAd0MzN7AHL2DY5HbzW9kRT6JPF3LPwahS
         aKK6+6wO88GVT/64nAcUa6SAnkTT+KgoFfaa+7BE0jXuPbDtm1CIi+i12WN6E8XCuMtW
         H3b7ksCgcoCoVT/9+oSgIc0WNvHLsfsa2w6t0l4q8pifEc6rtd/w8BW8Un6GlFe96Isd
         dY8A==
X-Forwarded-Encrypted: i=1; AL+hErGTpUDyRyiuOX+e1KwYtOBta7d3yzeAU8/ZrtwOUrM+FTEZAzMiW+HKAlkrRhV9njkY9oWAGwKY6w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9DW1ifFFHMBqG6ESb+dL19krtaKHblafAerRANvWX3C5mUXX5E
	vvd+0Kf5abaAThj76imNlsX80tI6OaDXIAsJ8B0AIpoWG4S3WhrykMBIUNyMgdVXsasYnFA58X3
	P1jjND44lS/82+lmXTHd49hchMiomAtw=
X-Gm-Gg: AYBFou1QcXIn+n2zFWGhDucF2QoaWZzPbBnFEgWaw/xCIGyPmQKiPcaxLlIqoQGLd4R
	Tu1B5JkRZBq5x5QDlYEMKrI3A49bhAErifcqElzZrLEOxh3O8NPSdhkoEXh0tKb5ydk3EywdRDa
	VzPoUnTEs3YFPLeke75ZrQ/qTtKJZ87fzuvLNGKFReTxMwX6Mjy03gPLdDdDfhxryJDqRw0DGxR
	llyoUNrUcN9R6lN1RrczK9JGhlRyWzArOSDT2fz2VGttBVkUIOzQKa/OyMZ7CocA3ftcL0R+KYy
	qQSC0BgawBbyJCBeHFLe0LtSzgVnPGsqX9HM/MKVToUcRPRVzh+nUB2wsrN03N2e99kdddsfAn+
	GA29gWe+bTgwriTTJXLxmR8xGMGlF4j5uZKSwRTy+5tNpPDXvCPhqOsONbxniTggXrac7a8mH8r
	5YnBDJqQWmO3HlTnbU11AaMQ==
X-Received: by 2002:a17:907:ea8e:b0:c50:9439:bffe with SMTP id
 a640c23a62f3a-c509684d717mr313677166b.47.1794592165236; Fri, 13 Nov 2026
 09:49:25 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113132435.434615-1-alitariq45892@gmail.com> <20261113132435.434615-3-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-3-alitariq45892@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 13 Nov 2026 22:49:13 +0500
X-Gm-Features: AclHuK9vLFuFj8StJfQb0gQfm2zMdlEC8vjTlUvEUXwD7gdAHCOcMYM38gGZrFA
Message-ID: <CADqcGBmdLC9jaK4HSECeSO=DtyZ3t-aoaBRUYV2cEQRBPOwuow@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: spacemit: Hold RTNL lock in emac_resume()
 and emac_suspend()
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

Taking RTNL before the netif_running() checks is the important part
of v2, otherwise the check would race with a concurrent close.
Depends on patch 1, as noted.

Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>

On Fri, Nov 13, 2026 at 6:28=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com>=
 wrote:
>
> The emac_resume() calls the emac_open() and emac_suspend() calls
> emac_stop() functions directly without holding the lock through
> rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
> with rtnl_dereference(). But since no lock is being held,
> rtnl_dereference throws a suspicious RCU usage on
> Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.
>
> WARNING: suspicious RCU usage
> drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() =
usage!
> Call Trace:
> phy_detach_internal+0x490/0x5f2
> phy_disconnect+0x90/0xc0
> emac_stop+0x114/0x626
> emac_suspend+0xac/0x126
> platform_pm_suspend+0x72/0xe4
>
> Take RTNL in emac_suspend() and emac_resume() before the netif_running()
> checks, so the interface can't be opened or closed between the check and
> emac_stop() or emac_open().
>
> Found by CI suspend tests on Orange Pi RV2 (SpacemiT K1). Tested on the
> same board with lockdep enabled: 12 suspend/resume cycles without the
> warning, and kselftest with no new failures.
>
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
> Changes in v2:
> - Moved the rtnl_lock() before the 'running' flag check
> Warning Log: https://kernelci.cloud-v.co/scheduler/job/549#L2168
> Fixed Log: https://kernelci.cloud-v.co/scheduler/job/589
> ---
>  drivers/net/ethernet/spacemit/k1_emac.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethern=
et/spacemit/k1_emac.c
> index 51edc95f54c8..d07d8a1aa5ee 100644
> --- a/drivers/net/ethernet/spacemit/k1_emac.c
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -2031,11 +2031,16 @@ static int emac_resume(struct device *dev)
>                 dev_err(dev, "Failed to enable bus clock: %d\n", ret);
>                 return ret;
>         }
> +       rtnl_lock();
>
> -       if (!netif_running(ndev))
> +       if (!netif_running(ndev)) {
> +               rtnl_unlock();
>                 return 0;
> +       }
>
>         ret =3D emac_open(ndev);
> +       rtnl_unlock();
> +
>         if (ret) {
>                 clk_disable_unprepare(priv->bus_clk);
>                 return ret;
> @@ -2055,12 +2060,16 @@ static int emac_suspend(struct device *dev)
>
>         disable_work_sync(&priv->tx_timeout_task);
>
> +       rtnl_lock();
> +
>         if (!ndev || !netif_running(ndev)) {
> +               rtnl_unlock();
>                 clk_disable_unprepare(priv->bus_clk);
>                 return 0;
>         }
>
>         emac_stop(ndev);
> +       rtnl_unlock();
>
>         clk_disable_unprepare(priv->bus_clk);
>         netif_device_detach(ndev);
> --
> 2.34.1
>
