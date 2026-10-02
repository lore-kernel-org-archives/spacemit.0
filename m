Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBCB3E2771
	for <spacemit@lists.linux.dev>; Fri,  2 Oct 2026 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967353; cv=pass; b=pUM/dRvVlQTtfpuFMr1GQ/rHk150JH0ATseKvcPlz2bj30nzipVD0VIY1WA3mezNLW1qcsgVzQYGeEEBKGXSEvWRRYj97PRb3gbHHY7Os0VXLlU7FWDTwXo3euPokOzox2G+8gIIwjVWylxAsoFWUJghtYuGwLQVRGk7qVbk6b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967353; c=relaxed/simple;
	bh=OR38zRZFAFpy4mOZaFXDsm6BWL0amMVzyna9ToNEKKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifgCXv95Stb5ZdwU7hSVsZvF+e4n3yR08Zn+ZWuedekD3cDU61ZyNTfsp3DIDzjQ1RJ1K+s4OTrmwpiUajt3zIhjqm+xkzsJoypmJ0iCMBjbAHqhW+qpw837FV5z6R+uavvngQRGGcSCSxT0/HdnLozi6WkI8lLCaFvyg8eiueQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+Wy1VqN; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+Wy1VqN"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so373865d50.2
        for <spacemit@lists.linux.dev>; Fri, 02 Oct 2026 11:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790967350; cv=none;
        d=google.com; s=arc-20260327;
        b=Lh4kpw9Rsw7mhrDBcBp10hliGlvR6ufPBGrva/xbGWpnyPMPNLMwESz1cREJ36L1zZ
         M/ZtpGEX2HhMLmaub6s8UkzQ3onsoGP2s0fnWSO3JZn+LP3pqQ2wDxeoVyMVrW0jtoVK
         8mhWWf/Czzi9xQ8f9hmGpuJL800LcShA4fBTMomfsejFL4gxvFj00ptG53j6tcFd95yl
         xwopRbX+eht3AfLc9RMEse6tPJew5bo2t4REa42kRY274+nnGbxpgG/fBBOf0X32r3yB
         pD4LwuvhcZXczb+8USunj3AoBRAx5EA+/6fbgUoa1eioBk7pvXsFhInSiw1/527ymTiI
         tShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        fh=5WVA463L3IKCj6l9x5U1Tvcro1gI7JjvsNdkvpE5Hto=;
        b=N9FLw8TjurSt2hprJ0CVjUKNXXd0ty58JSefbPII3q/mmkJzAW8L/+GR+dWP5bf6PR
         rGjJjHtDGSgEYYVNrUfzJQ4PAfXtbgBsYUw2p3m5AFpaiujpRSsULtkND+afw6zfUeRu
         kiceymbNRaQIOVE64163xJdxab0PiW2+4Hl5Wi4sMrIKR7ppZZDzVsP32HSX3mdKU8af
         UDm7cI1AUdou0HcCJ9ijJ1BnYesxdvn0O2u9Qekj+jQMxnabMUVAbKJmVHMLFiI56xzs
         Oaztss5mO2Uw+2na4RFJ/2bplpa7voi0ZccxT2eesme97yhzYHEYcpbLB+TAONljC5D6
         sCsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790967350; x=1791572150; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        b=G+Wy1VqNCe7hoS90/Mm5/ei+7XqbFq8nah/ym0XwFXtm0zPqWTCHC7JDtQtsvUF2V5
         zw5JMwwk6BLnl0zrzej/88LnE1ALw7dIc/+L6Gbqbu7IrGG9PtoQpz9IPH8vzQr2L1SV
         v7Bd9VsYy53vGHNgCGoUP7mk/aaJpAo4srvWFVtdAXAeOu5kAk7SO1qGz99ps/1bgtJN
         Qcv1honXLPvGbT9okmMTYsJ2gDccN7EQmcxYJdmh5lXb2COevMQbAGJ5INX+u1RqBWKq
         JHjf4GhNW1+2HYZ2cZIll0uyqTi3RlVK89fsM0G84HnMqLIWottt4Yh/m1IE2PQ3X0mH
         ZR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967350; x=1791572150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        b=CEN9qHNFJ3tvHvBbbE9+TKkC3iTxsN7E1CJukV6CiMnMrYLAJ9S5K6BjSru1NZ9Jlp
         tQpOrkZzsbXn0sR0uho5kfldorwWKJCDtZI4nP3KBDoXFFw+6teoLWZXy7Y/XU/go7GI
         MWZqYDH3GEx8LsqTRPNVsCL9X3p6MoBKTlLV1YoMkzhUEDirtM7N1n6pBJSUYcFhUt87
         B/XGEqMP8eI8ovqb6/KljUg4am9eZuRNQn4d7j9IX9VNEIdwOWAbLXKiF05l8L9awn6A
         Ijh26bihWPn0eCtlr6tjwK8E0gXT2HFAOeWdPzSp4UXvGiIDCyJ0t6tK+xm388EgwS30
         ihxg==
X-Forwarded-Encrypted: i=1; AKwUvByn0zTngwpXbGUtW7U0HbmF/zAwMSn6i9C6CDHb/bj9RaCn1MvJeeDVfIO9j2bsMtAp3iigXVsXlw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIJbYMwK8ZaX7A8q63TeRaWGcEWOVqe2GKsR5ZIpTin0M0+8goh
	ZRIp8peKdWirkW2VN/Tk0qfRWYiQr/3kdw6/aBxd7tvAODxdNLPEZhpOaxlDUWL1UTDisEXHhXD
	h7ivdQLeY526D1vx0PzG7vIimtT4Sp+I=
X-Gm-Gg: AYBFou1JGE26qzTsQ8yXx3JYjOnoV2aMRk7eGgCJtkk2XjL579pbk3Tm56qQEqc6WJu
	58IiXUH7NXe3nHvv+ADubaEFg9ZS27QIqbQUn1rdKokZcdTc9X9MYB2LsTSIYyMoVzJrdNSt/N6
	rpt3A3x4dBeDVohzCOrIunHezLAEa+yGbURMs4Rxgn0I/OC2jHGWNa5Ib80/z2lYdLbAMttFT6v
	MD/R4+fAkP5tz+v8XGA/XekDxQm5cy9GrMIdA97RLkPkvstG8bx4Tf5au0LjIh1bIJ3DCb8p4ob
	6bvwaAgc8OST7szm+W2xDCyICbo0HL2381plbWdWWS8OmxEL5q6B+Etn
X-Received: by 2002:a05:690e:1243:b0:677:b7e7:f68 with SMTP id
 956f58d0204a3-677b7e71be5mr813923d50.108.1790967349727; Fri, 02 Oct 2026
 11:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org> <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
In-Reply-To: <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 2 Oct 2026 20:54:00 +0200
X-Gm-Features: AclHuK9ruP21ynPDiadHS4oYScZ4A0eIuHPpImnDhttohXSuBO4BfsPMVhy9WRo
Message-ID: <CABdCQ=OUTASG8JDBqnJAPJ5aTDUC-BQzCVcw0r=cxrb8CPUO2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 18 sept 2026 a las 7:49, Yixun Lan (<dlan@kernel.org>) escribi=C3=
=B3:
> [...]
> diff --git a/drivers/pmdomain/spacemit/pm_domains.c b/drivers/pmdomain/sp=
acemit/pm_domains.c
> new file mode 100644
> index 000000000000..d563e4e4e232
> --- /dev/null
> +++ b/drivers/pmdomain/spacemit/pm_domains.c
> [...]
> +static struct spacemit_pmu *gpmu;

Would it make sense to embed the 'struct spacemit_pmu' pointer directly int=
o
'struct spacemit_pm_domain'? Other generic Power Domain drivers (Rockchip,
QCOM, Renesas) use this pattern to keep domain callbacks self-contained and
ready for multi-instance SoCs

> [...]
> +static int spacemit_pd_power_on(struct generic_pm_domain *domain)
> +{
> [...]
> + regmap_read(gpmu->regmap, APMU_POWER_STATUS_REG, &val);

Please check the return value of regmap_read()

> [...]
> + if (ret < 0) {
> + dev_err(&domain->dev, "power-off domain: %d, error\n", spd->pm_index);

Typo: should this say "power-on domain" since this is inside
spacemit_pd_power_on()?

> [...]
> +static bool spacemit_pm_get_state(struct spacemit_pmu *pmu,
> +  struct spacemit_pm_domain *pd)
> +{
> + const struct spacemit_pm_domain_param *p =3D pd->param;
> + u32 reg, bit;
> +
> + regmap_read(pmu->regmap, APMU_POWER_STATUS_REG, &reg);

Please check the return value here as well

> + bit =3D p->use_hw ? BIT(pd->param->bit_hw_pwr_stat) :
> +  BIT(pd->param->bit_pwr_stat);

Since 'p' is initialized to 'pd->param' above, you can use 'p->bit_hw_pwr_s=
tat'
and 'p->bit_pwr_stat' directly here
