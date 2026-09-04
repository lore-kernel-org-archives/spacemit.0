Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A48D4503E8
	for <spacemit@lists.linux.dev>; Fri,  4 Sep 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530139; cv=pass; b=X0cjQMwwoLC7cOn3kJjLHMbINhSZxP9+H/+KT3k4KqxkZDpR1915w4tzOyUeSPseGRkm0pCvonZF/YztrJi+iSgRdF5QK9rs8CSeFbrnE6AmVZx7RDJX+jrG45tF0nBagOJDT8K1PnfRxwYCPH/v6AkfajsO5nuW3dcw+qor7V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530139; c=relaxed/simple;
	bh=aYGTw43PGiruYrbCRK8lrDyOCcUgVMqsAo0cR/fDfeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwz05copn2EozITHlwsphONAsAFUidTUqDTFgGxPLACXpin8EROGypKBJnxyLqNgL1f9MZ8oKoFYdYeCQgoFsDx8tsriOzrwzaqXwCnj6WknbnoOjwtnAd9Cn2Cxn8BlkOoLK5E4Ec0LGImF7glWXu2jsCIpMVl7lFpZ5Bka33g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAKTW+Lp; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAKTW+Lp"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1317460a12.0
        for <spacemit@lists.linux.dev>; Fri, 04 Sep 2026 06:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788530134; cv=none;
        d=google.com; s=arc-20260327;
        b=ff28EKXZXE/PMSENwuRwcx3hwBqr9uWSqxPkMyMYFcT3H8pdsgcmPkpOGFUMO+7F5w
         RJgs4tHwOklTlfL19zXJ+V0kleZ9OsPq7rVIZvLrQaGIVuKULXXYX3yVndDMsBkbgFRW
         VMQcDS2URGr3y7lJQfn4njJBTLh7qTBHetAPQ0PQDZ+NjxZIvAnQdmalA/8JnuCHX+dC
         liONOOcCMkbPNwdBD/MmXI8iYUYHEgJKU5pyCZO8w352HoZrznsHniyoDNI1Le5C02wG
         MeKaWv3FCqJWQLRKl36nc1UeoL4R7KacTPKTbNrhWsX81HUr6OT8O2SUCTgxbLMbV7OD
         aaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        fh=syw+NCrNAZ6nNC+tjxPO1JeBDYOKxPG5BDxMf4oiY+4=;
        b=Cv01fqKX6kexcWjzd71e3Z5QnqcJEvq8Ks3nsHnwmxA/I3B3BpvKNVPdI1PJu8LgHQ
         SCr7kROufCFWUvY751xf0IZqG5oGPL1eB6YUolaRI42rZ+VYI1vKWDQIp1TxlyM6WKKs
         508XubjCLQF9MpH8y+z/RjjoDFC4IayzY8LAnWNKA80LtXuAyM0chpV5+N6NslRYabSG
         hRj9HUQUTzguiNcCuwKprrzgw9bgVenJCzObnQEtm+wLjbqkEdf4rHrs4WyNQoJLe2jS
         OpJqJDsdS5ZAgQ6ArXtXbuxK5AZI/sjgBLWw5uch8Zu6wa56p9kYl6YCL6LuJtf/ar+P
         gERg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530134; x=1789134934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=jAKTW+LpWdHT2jtAEkdeREeQFvDH9/RQ8wdZWuzZzXL96c7TA94peuX1Rs58pwAVXz
         Hu9PvkwfIy2UHiS8LcAUGHNTXWZnKM4KuOBiKy2kLRs6GQ9vi8TSsKrnma0pOe9uPbnw
         SMYsycn0f1pI6GjUkCYPNut6umPrBB69Bpmyb+F9/GNbxq09Qc5I6+fNUYqLbkaF2nOH
         pRmSXC8x6jofJp8VorShXvkwbnpihmnbhkI+OPBUPkSfSFjduS4hZcJbJNyCSOTi3MI7
         mmvsJ8NbZtbIkYSbzARuK1bGYc6zS39A5wRj5Yb0G38cRfWtwVCHQaCIKXIucvh6ih7v
         12PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530134; x=1789134934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=Zj39lgBAy2OtCsLO/gcdfhBJkDSarEikRECr63yICw70bHNIbPFlmJ3zSgHc8ogJ+k
         fSm6MRFnx297Eh10vCgN6OgbYx13Xc/e14FOoL54fj9dgRwCa2LoOSL/9ZlVqYvToHRD
         uZgeoj3QwubHAQ8xvRuotetNNWk9lZfCet7Dzp2RZ95nNg5z6a7nEVDZ8NjZ/kh49KTx
         pWzKq4X6mEYy7mI+FrAjkvLUxLtaaNV7QdAry0uIdQkLkTasuQRLXAJxzoMCkL7Gznck
         ck7VtU/JjQFVA75MgYpfas/30u7sc5V3/0kfOfyKvBpXeW0dSS4z8YXrrHHIXjAUAiC6
         NvwA==
X-Forwarded-Encrypted: i=1; AKwUvByNPrutWkWwWkA5bQNkbujSxDmtSmfszDG/lJQcc6M328nO+H8eaWD+rdCC5t4GOv7r8+cRESyEow==@lists.linux.dev
X-Gm-Message-State: AFuF++kMgzwrkpHbguPsFJ3gJZSOSp/tTKRYu91TFCqynBuFy3qOdEwb
	Jd+DlfAGF0/FYsKgwUcx3zDr5hhQdwUUyIzI7tRh4d8ba2VgbkQVUfKMFs0FobFsoolrqVIQ2wC
	qPiIu5M5P9BlaJFOLjQuIadjadGABo4U=
X-Gm-Gg: AYBFou2iUEUyuDmqxFYeUfVxS3X7BEPzvQkrPUvGc/qLWlkIfM5URyNRd79dPn0uRFv
	K2k8Ucr79O++bO5IGsbBBQvpS+l1nqxYitKlznF8SSwco6MjjSWccNkeEtvvlfG3NqxTEKy0FqS
	mCYxuTLjPebX3WCmr77USmF2jyQDkRjP56YcliXRoJTvZM+NFV1pmWEDSiCEgfCC4qpF15IPUuJ
	Gij2vlKmnNvVhr8bwq7keXhd/JqaLd0fdlISfIImDWF47Y6G1dpy1TZF5W3VERpYWGp9QYzxO+N
	a8toR974NO9O3+g86cnEDkNBplpMi+bNuGKN4GT4Fk/aSB/4QedrCepzYpJd
X-Received: by 2002:a17:907:720f:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c260c8c21d3mr311924666b.8.1788530134042; Fri, 04 Sep 2026
 06:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-21-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-21-s-vadapalli@ti.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 4 Sep 2026 10:55:19 -0300
X-Gm-Features: AcwNN1WkMLBcSKjjx-549nVRZ1ZETkJHm5sDyQYa7o61EdbIDExabOintEMeFfo
Message-ID: <CAJq09z44PfcEKsoH9eP+c5rxmzQ52hQO33k8sO-e6po1bpE6rQ@mail.gmail.com>
Subject: Re: [PATCH net-next 20/33] net: dsa: realtek: rtl8365mb: Remove comma
 after sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, alvin.sipraga@analog.com, clement.leger@bootlin.com, 
	justin.chen@broadcom.com, dlan@kernel.org, rogerq@kernel.org, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	opendmb@gmail.com, andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, 
	amadeus@jmu.edu.cn, kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, 
	horms@kernel.org, vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 4 de set. de 2026 =C3=A0s 01:39, Siddharth Vadapalli
<s-vadapalli@ti.com> escreveu:
>
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/net/dsa/realtek/rtl8365mb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/r=
ealtek/rtl8365mb_main.c
> index 4c305756116c..f8220d832e46 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -3352,7 +3352,7 @@ const struct realtek_variant rtl8365mb_variant =3D =
{
>
>  static const struct of_device_id rtl8365mb_of_match[] =3D {
>         { .compatible =3D "realtek,rtl8365mb", .data =3D &rtl8365mb_varia=
nt, },
> -       { /* sentinel */ },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rtl8365mb_of_match);
>
> --
> 2.51.1
>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
