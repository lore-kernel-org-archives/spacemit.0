Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793816940;
	b=nWubi6R2mXLsW7nTNG1NHpypscAbD24DNO0ooUWf+rrq2CwBta0VzisYr+eNqw8PkVnw
	 vF/q0f9M6Gl2O0BM5kmHvp+w7e8ByhEfnxi4mcWWTGPNgFLuiRaraVKAxgxRpoVgn6aV+
	 xUiw3J85bTJgDWlRCEYtyBBhzwXlCM6AypfXH0z66v7qm/hvTAd/uEc9zlii0EIwBXdWd
	 IYglxGVzlT8k8ybYIW4KCvc+LQqCijn7sdAqi7NJqoydn82q4nF1JmC1lQtc6tv6WoZ5U
	 zHDM7ivE2zkXGfrBK/A7z1l0zaD8qC5Yv/FkLMDb/T3UHK+UE+z/kQB9lpRV2247kAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
	b=qYnToy9BayYutaBUistQBdng3SVTbcJ9UAbVBD8amL6qQhpswJzgSeURJNDBs4xOfDTJ
	 DEscAKjphtD5+v6UtMUZpk6lRX57sgcQ0by1gsX5S6G+PNX/4pAiuQ7uEnaO34+GdBaBQ
	 3PhrqH4vXg0DZQnnyfqQeLg2SJ9EUQ0YVlFxYnHJ/yFPcpS6ae/ol9g0kQr71toVCC7C2
	 +vsnUyVt3YZdbMLoXXqNH+rqMXjbd/zQ28kwkFQ9UIREtRR3UQvawHXQhJR0wcI8spGwC
	 pBthBBhbFehSfIvVxd0/mGEbyYS1Dez9jIZNbYnkdu8Oa3yXledzlVhpWgHZC7EuKPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WExCkqYO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5EC606A337
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 18:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A5EC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WExCkqYO
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be7b9abc8so903261d50.0
        for <spacemit@lists.linux.dev>; Wed, 04 Nov 2026 10:29:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793816939; cv=none;
        d=google.com; s=arc-20260327;
        b=Olqtai8lGp1ipJmF/BkkdX74KIz/N8sG1kqMZdnySV4m/N51NJMcUJhfw7Zc8pB+Gr
         jxyPHtMm/wQXbqoORrd2kWo8fiWyPJXNeAOOWiSc5Fh9AUbhNMWqtz+tfshzFGUvCyhd
         Iuwgq9vQ/t/jeo1uV3F0SgkHIMjgWpd6CrHCse4AA0OM6t2BYBVreRQzzclmkTmMs7jZ
         qIlCLJQWgVD5i6I8GDXPzMbCOjXa5zy2RsNNTU1GhyRNM9tGDA6e8BIVV2jxzodNeoCt
         3C2ecUnVuv0XOymVrK6rt8fNUzD1mEzZLy+mUPe6w2+C1Q55PW/fu72m1id9gABvB7zy
         B4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        fh=HTS0YsmY5ol0t9PUHDHcCjKLlsLB8/MLChyTIjbeCPQ=;
        b=Bosap8cd3gmkUtMnQKCPeI3m+0NGxyxxe5fU6f/ytp3KMifnT+vPQ9dnN1ENmU/VSb
         PvRFyMkQvf4lAlekzBE7ZsZ7ceDMZOVAg6IceCMeRBXzp5ryv7AS04sGlMNpdtAiYrCc
         MrId6VkvwWwELdkDP9MJLmuCTIfFWkoI2E5u8pL+1wi7cLcyX0n2spaRESUK4wSUsJt8
         MHD+gJeL5t2OtO04agNogZDDC1Pac21UF1swcyjG+bhDDBwgHbs8hShNQJplnfQ72SP+
         XX9blGW7wH13O5eIKdpTDIw00HLitNe2wpb1/gRojKD4e255cSVvxzcub60YD7ulc+qh
         GqVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816939; x=1794421739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        b=WExCkqYOn2xrD7kLAa25AAsmOREqEEPzbeifSz4mdGr2rBfrG34icbDx3q9MpRphvD
         LqVw6Q8Of18RMRXJwbpk2rUQreBsrso2Xwe34lwR+LERp+g1AQ8oNziU++mtn3pN2xbj
         DEait7lLSkfU+fOjUuEnmMWxD+PJt6spYWV89lc15TGbRmhbcFsAZdTi6dxyhMUzPhfF
         3Yz12G1JQDCsT7BncIGsw0boMql3b5IupAdCMuUYObr1mkvu4bMz02nXT2MLGhFUbr8n
         ogQF/JmBlvCE5nKXDWvzZbjyaEY1y7FjtddZQZMqRWnTy5oK29Pz6JpOGJWfU8XODwup
         /Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816939; x=1794421739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        b=uvA6GeKWU7DZN/cbH5rqyPaZFswwAlfaGhPrSlK+x3ywWKYBVbLsxtEtXFvoVpqBu0
         ieQE5ULSa1QF0G8axc/V5abblr6fgg/Ns34ru7E3mIrmhyBdCurHSFO4POHODfD4krsG
         0BAhi0hFwENFqzgV8g5NnCMyLS9PTuLc8RdMD5zrFF96hnQb7h5j33m/bH1T7rGuAuyC
         XTq27MNEsxDbntHhMO7CnHqoB8woPTGWE+xt1s9n3NAwRaJOP5U1sl9jyenPDY3M1+0D
         epo4OMzuN8tyxbpl9QLSneAU0S6ny/LHC28JDBMiFPVHwemRxb0g93LNljckw2PXG76p
         35DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb+Iaj9siLvRS44nBs0xI7RE5nk2QE1Cu2s+l4DEPYjV1weHqwRaFFvK8xO3nDfe+U4lAu0wBqMQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZZqkbWpbBL/DNX59nQI6E/gtGCZVpRuq7Xz1xHWqB5HldmpeU
	nUNN+iSQtwzCvG4OFNRvVSQQ5XAS90kkLrK7Ut3O71aTuzeARSSO26biFyoSwvMMkNLGo+1Ch67
	NTFGPiCkSxLOguSLzoSWNw1+hAZdcBQA=
X-Gm-Gg: AYBFou0vV48xxh7bkiWhRGJe9REP7555Zx/tBAGDrKSUXlxiEI20fJihVQHTdPqzAfa
	SJsyplwkQCjIkekQCVBEwh6r+QzbxjrPfueIFNwq8xKUOGpXCAt02MekJXMc/WWSH8G5Ih4cpaZ
	gIMKAuCyzQtv7M4QvkaXcy4HiyfccpEj3BS2PxVd+0CfFANl4SUcU4ocTgqGk9ZNlNkWdJCpCvL
	7UVCmr3oyDPIxwNmyQA3HK8Hlv5Te6tOv2pVYkc5kL+q1H/TDX/O0K9w7ZrThB0akbLAbkDRyPe
	fGchLHpxvKV20MGadVJg3s04cmUEUuEDp5UhjDC4eJwM7VRAh04afJO26FC5h+8HmykEOn5LDUH
	J/GlTiaYnIfmgNBQ57kuia/DNOBH3T9A0BOUCIQ93xQYaZAbfD6dCjgTvTWo=
X-Received: by 2002:a05:690e:1c1c:b0:679:9340:acb6 with SMTP id
 956f58d0204a3-67baff093ddmr11231324d50.98.1793816939248; Wed, 04 Nov 2026
 10:28:59 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Nov 2026 19:28:00 +0100
X-Gm-Features: AclHuK8q2ZYeS6p9RTAqL2gmNJFu_7rEVvUOjm2KNLVXYzJFGgWF-O5cRxqiuAQ
Message-ID: <CABdCQ=NH2NDYVXvBFoM0k-Gn9XB=F5FX_y+uNomjTCb0TtpqFg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

El mar, 3 nov 2026 a las 11:02, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
>
> +static int spacemit_timer_probe(struct platform_device *pdev)
> [...]
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;

Consider using dev_err_probe() here for consistency with the rest of
the function.

> [...]
> +       rate =3D clk_get_rate(func);
> +       if (rate < 32768 || rate > U32_MAX)
> +               return dev_err_probe(dev, -EINVAL, "Invalid timer rate: %=
lu\n", rate);

32768 looks like a magic number. I'd recommend you to add a comment
above explaining the clock rate bounds.

> [...]
> +       timer->sync_us =3D DIV_ROUND_UP(3 * USEC_PER_SEC, rate);

3 also looks line a magic number that could have an explanation. I'd
suggest you to add a macro with a proper name to have it properly
documented.

> +static const struct of_device_id spacemit_timer_match[] =3D {
> +       { .compatible =3D "spacemit,k1-timer" },
> +       { }
> +};

The device tree bindings support both spacemit,k1-timer and
spacemit,k3-timer, but the driver's of_match_table only lists K1. You
should add K3 to the list.
