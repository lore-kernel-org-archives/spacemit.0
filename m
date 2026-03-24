Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67703FE365
	for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363424; cv=pass; b=mXNedmVjqlKnuD/lg1hlLsLI2RbL1/tc29Acj3G/R+kuhv82jtlH3bULZZWx2D2Rikrzro0sEwWN1bt8xyvSc85ToPIxlcF7JQx8Qnl5CKS5CLOIM+s8oRcqaIYwyxGphDWmmnTc1Ghb9k54cCLxqIoqAoDNcSZpQ7StD5zH3qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363424; c=relaxed/simple;
	bh=cKuAMo+90hQl6jVZ4oV/u2GEU9U3JPEK51CdpHE/uPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLrSMy/jVeYAKvBGZKEHSINS3KTYLKUIspZhxbiORcGE7QljG9kPaNADa1xtMuQdGZ8yDr8IuqkUavGFDOkYsA41z3w/pEO5TdpZ4Egk8TcphR5mUHNHKQ2VQRxPi1bV8pY4jB9/hVvT0lAa12WY0wc/IGSAQXIhX1+0yVmujjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bYqo/+TF; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYqo/+TF"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so4601683e87.0
        for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 07:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774363420; cv=none;
        d=google.com; s=arc-20240605;
        b=BcakTKxEpqjEhTm+git/oOPuGt+F3l3ZtGixUbxg+v1D1ycnqVwov+wzk5Gxt2sZJW
         h/cmCKwh81TLi/HAvFhuVtDaB/0rcfLjCgEDgqX6c6PCF/KwWKLwHllG6CgdQEEa6S+Z
         HKgzCaY4egBEJZeKnR/PxsQis2rxkSbDczcw6pRxrc/gslmTtiTbZUx60VQvYnuEn5aF
         d4vaXSiVMC8dbUfAf2ilT4O0TIzpOzN1BtNnUz4w8+5hmA8kHsr9ESaR8QHuM4bWsKfa
         fRKbeAruokXpPhTSiQl85mW2TBCyN/6x1Bs6KJhDe4TKDVNLu2BJj7KiD2+/G1tL/iRm
         Ct6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        fh=pWWeSq/QgOPTGb3JkrHKB0S+iauMLq3F9uci9BICmKc=;
        b=N7+BOeWApOjHm92C5zG8JsSBRFq4f8hbSIUATM9QM7nkwiimyPluIepnQ1wU1DtCIX
         uVBUk8r6dcKOyB3cumI1fHNpSMXzs8EFMDNrHs3sfHCiv9gj6lUuJGNhYuq9keC5JIZ8
         rlYRBSG8Venk7dXoADNH7z+apfWyFVsDb3E5eCaSDgrXJ7KyieFYDk6eowi1IEElcI7M
         OXDTW1a7vvWh15M8HW+4MSsGtERC1FwrKyqozSjVgipHJD+26GHuOpzVeeMgHjRecNcY
         fQrP+i0deCFShuEt60U7yuEW3uk2rMV1l1q7EqYjkYkiaEDYWgC5W7bGZ8kkiYYJwdZH
         WywA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774363420; x=1774968220; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        b=bYqo/+TF2OX2dTk08iLG15+PsMPVfKmpCLdV6Z6fKWcjrz05xrEotMHv8RWmFTUtsi
         hmHN1Lp3BFUVR+kKPVQLzjg+QZG6MJ8oo4S79W+J/A4CXUtGTq+/Ec8s6bvNc3dHg3k3
         Zp5LeX7x+B2/WvfODfd+DEvRg4Zq/ciWwq1GBiVVK2ZwkWKpC1OBhy/po6JRL2hjDhmd
         q4hhDjshTsoAXU4Pnq76HNq34guJnBIHzrlTVIfHlU0UDNmWnoOw6K7K4Ayx1JcGzZm/
         M97rDqiXBtTnjWhsQRYUNYR5P8TzbyRGGH2MtrnB35EHkBiuqOH93Ny7A/UsuGN/Lr3U
         gRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363420; x=1774968220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        b=OR2YJzXlT/FGBs2ppbj5uPgtWitsGKeEDmNgj+y/7pIoPj3lL30cxqrQT+uQcd7eJg
         ZG43PMKbM+DlobTtQuqqNkrwe7ApiUgyD/FmLZQyR9qOtQ0EQTm0816wUjzsV9lY4J08
         BToKj3tSKvZX2HNTJLQbfyDB7WvOc7qVsgqAPdTv95kx3GilixLMUgcvApY+jqWWtu9A
         EbJR0dhyJvXWcYhnnqEnkWEPbihx+CzE11r3qjFSm1roGe5zJkdp5/2JjZVnnUmfMEHX
         6KcKXVupK3OWY66JX+BePRrxXOMMA0alL7pH9+Bhtq3lhENK0i3I4jVI/HlLzxPlsiWJ
         fMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTdhpr39HZ971CCDZxWJf3mXWxkZroI4j4MKeQgCgfqFDpLMTMurrRO2zcuhq6uIpJsp+zils2rg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFy6OdSUtW3xUC6P9ko0gHtTCA30+MdvMXSMXGdVQcMe3Irqnq
	6FGKUhzN79BNgQT/s6gLenl8K4su1MO4n9FHDFa0p747w74mvUWyhpOhMzPx/nFtcQJsEZuVPYa
	GDFYqODCJELxu4khZ6HSLdpN55pUhujDxWSoxWCkTyA==
X-Gm-Gg: ATEYQzydBCl7hnlYksXdbX8DxnGQmIwIvpAD0Z/epkO1WvLUlwQrtzaGt8DLO8Z1MgF
	B5bMRj5VmOAJPHuDUFxbsbKpJ0H6pCjLX+RjFO+qvhGIWtB2xIQ2IxH5NLY0izrQGs4xZ36qjU5
	Uuu/TTJYdbYgZPJdyoCW7DkYkdhTD/yYMMKIgfyRLHtMdP6npVKqkiHo2NM/w4h7vTyDzcRlIsy
	Z7EGpfLKqdmwffqZcKrYVtSWNpZMzHYtuiSrhODioGXXCtHvuy5XGZ6CBOrOBuFQnJRAb8+H9kW
	hXvY2YU3eO1qHgSCuxk=
X-Received: by 2002:a05:6512:3d19:b0:5a1:ea0:afa8 with SMTP id
 2adb3069b0e04-5a285b5dbf3mr5614955e87.40.1774363419882; Tue, 24 Mar 2026
 07:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com> <20260323-orangepi-sd-card-uhs-v4-2-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-2-567c9775fd0e@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 15:43:03 +0100
X-Gm-Features: AQROBzCfUpt1ZwyBkuHwcMICLYcYLjpRhE9JmTUslsPEwhDJl3mjCswU4lxnLwg
Message-ID: <CAPDyKFqirdKWZmxO15B6MvH75zsQgiwM-6Ux0PiCuxZsfNBUfA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Mar 2026 at 11:19, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
>
> Add voltage switching infrastructure for UHS-I modes by integrating both
> regulator framework (for supply voltage control) and pinctrl state
> switching (for pin drive strength optimization).
>
> - Add regulator supply parsing and voltage switching callback
> - Add optional pinctrl state switching between "default" (3.3V) and
>   "state_uhs" (1.8V) configurations
> - Enable coordinated voltage and pin configuration changes for UHS modes
>
> This provides complete voltage switching support while maintaining
> backward compatibility when pinctrl states are not defined.

Adding pinctrl support like this should require an update to the DT binding.

Please fold in a patch that precedes the $subject patch and ensure the
DT maintainers are cced on it.

>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>

Kind regards
Uffe
