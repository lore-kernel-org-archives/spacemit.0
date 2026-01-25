Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCD91C84D0
	for <spacemit@lists.linux.dev>; Sun, 25 Jan 2026 04:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769314716; cv=pass; b=V4YDDxJrUeoXbu/pVG+lKzCCUCKiT/V9CxwCEl8SCzy9ODUbJdNaTAJ2IG9n9qjUCijaTeoumq6JLg60WjDQll9xa6B37WJPb8LQwvhyHWsStJ1Erxm2XHxjDvhqDo6MXslztNMdxKaxdhqsNlWinTmcyHfb1l3DaFu0jgzMIWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769314716; c=relaxed/simple;
	bh=iBs58lRv+CFAVUT3Ztjx1vffOsaNZMmPIYlH0Ymka2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vfu6stUzpwd9eeFj0mf7lwjqIKGRvYGAQym5oHsRYIGxZiIeHM7KpwnfNZEjix2Tcq3zqh5UzHyHoakvoEdencgPlZcmNz7J93H0hN9/YFnFoyOFlPJIIkujxi3mQ8RplwRPeFxv9V5pDp1ydt5GFQMZ8cl1r/lprnbpTyzh7mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XWETEQ8c; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XWETEQ8c"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79427f739b0so35053707b3.3
        for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 20:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769314714; cv=none;
        d=google.com; s=arc-20240605;
        b=Ke6Q5/2bavDdBp2TKb06r/xmkRnxs2PcKXsITibNrBdcNqo/oSKMs4sMjjzbHXI1hM
         CO/7OIHC+36GoxHd/fKjkZ/WClZN06GrleCuue7vARTMxWfQZXmi+0gOZOFqL4eU/M5v
         8Rj6OxxkMBTRqO8Mdes0YUlMb0YmG7SpLyg8KTOyLj5B8kt2jGkEJsNMmn8N6PyfJMys
         d64N5RxFx+HXGuwr4N8CoqAX6q/xRH7yicHpFwncmfAo97MKefkOUCw4Xx1nQEz1Kl6n
         MzfInFEIVXEm1/Q39Pzo3GOXzszRkVX/7hFTTmyV8Rk2J/zT5dhbRDr7VJRIsQHwMDwT
         OjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBs58lRv+CFAVUT3Ztjx1vffOsaNZMmPIYlH0Ymka2w=;
        fh=gJsnKHyN5EB5O1A3cMOkKnr8bYh2lYrcf55x3y7jbtY=;
        b=Mv5m8wlqgx9SXYsBC6yNWHIhnlvT4Eft4QcyIQD3xi3AA9RD/LIUVB7NX6thM+Tx+j
         AMveXZliO0O3ZFdi3nTOxaj+6JrbTOxErHzyX7ypdhCRagdgWEUsHvCHqC3u6hrgsYlk
         ie5ufvBx2iFPrERMVuUwcEXEJjH883TxBXJLb2FhoL7bdlH4933MLis1NDMOs1e/xzki
         psQ3dv54cWlRPoSgGWgCJQyl9eWcCkjMBRPN/MHM1140kNyNbrDn4ira44FuysA8De0X
         OZpa9IAxMaRs1OgsvwG16iBr7B95jf5wT7ZahR8Yy1kY4jyCtHfokQuxJ9vDC1ZSZ94O
         wYyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769314714; x=1769919514; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBs58lRv+CFAVUT3Ztjx1vffOsaNZMmPIYlH0Ymka2w=;
        b=XWETEQ8cksliKXJ5W5EjQ8VV5S94LfCwqF8ju8G4Kg450ZRDQpplflYWj32mGSfg2z
         w23ZIKRUyyD16f2CD7SDkXLcxHjrbvPW661Q+PO5S479PjutZ4lmrsgBU3fYAxNZ5Ih0
         lK3Hhr3jLoVZMydf4SYbKVvIQoS1WPD8zITSSbG7uCSz3PQJZlgmqahdeUNnAJ44U3qQ
         4mu2SNenbXZq9kN5cOt2WqXs+P3E+01RJhxGn2Ak9OaR6cLzbZK3AojQzjidttSOK+qv
         m55dBr4rRPS4KoqQfIobUqXp1+dy7YSDBp946U1Hb+3sNodeURER04rbxATONRlvR3OS
         j9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769314714; x=1769919514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBs58lRv+CFAVUT3Ztjx1vffOsaNZMmPIYlH0Ymka2w=;
        b=H3gwpkD6toqYIPCTg3wHExFPRqGq8as+qBzXBPbsmq5woLuVFJqQHcOUd0pxwlnaNy
         1Y7TB1WCJcwT78i0lGVy5RJensOancJp4OZ4kN88UqNXXW/nBPVtIIfJFDFnhqqWAUkQ
         z5lq7Z6DntAr3KVojNypORahSwZ7Z9O+tkdXgZKCkEpMR/EnQ/4VtVJVDRIYY/0KMZZQ
         s46q2gGXVk6qKJdOVzANvfPBGuikRQrYWVTWq5D/kC5+oDSiu9eU98R1lAaUtOrolOAP
         5fqYma3mMROlTdilSkouCp9PuB1Rzb9ADdZYL92+FDUhmzDSK/yOsoXfTqnHPZJEEqJQ
         iH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVFjVg+ksQvfVNw2AXdK5HkBtY2OZBGlIIxH31Ng+MFJaWKTQPAVCpl8HDFxjIYda97IkZqdwwkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwW200IHwR2VL59In6Y/uTRJRVJ+mJPcBy0yL75S4edSA1KcTPG
	d1IlpT4jDGmgHjE0J2dMiAnNmwB2dwHF8ZKtZx7+ZLdPIfBSKEQGUYgPJPAyptUpaeSeO6TdiCW
	KnVpiUBHq0cLOHMyQAOxQLPQRDl6k8eBXeaExqkWH0w==
X-Gm-Gg: AZuq6aLh9JpiCKViIkMRGNmoGGvtS9nOfDy2dpazdtBwCWxuHl22vMMOE4HeudQTsZ2
	yS7r3UhdbRQMpkG/BHAslL67KVeh7QtRZGOLAsRl0W2L9lEEjACB0zajZ+vtLumRlpKRGScxU9e
	ZIM3TeRX9ONKR3wOOG7AxZ8Q/N/kPSC9iNvYuCWcX+M7b2dyorZe0dVMLGQwHPBiggP9vtcJDKP
	LMohiOD4U393Mg8Cd7CzKn3fHwctBDcWFWnxAhVWODimYCB9a2eiqGQ6xafu5Au4bbapBTtGNzx
	4zbcnwkm9I164c9ByF+RxRBz2GClZAY0LwB+vaXKz8Z2
X-Received: by 2002:a05:690c:34c1:b0:794:ba4:37ab with SMTP id
 00721157ae682-7945aa0d1d5mr4627237b3.60.1769314714172; Sat, 24 Jan 2026
 20:18:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com> <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
In-Reply-To: <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 25 Jan 2026 12:18:23 +0800
X-Gm-Features: AZwV_QjGxwCPzpLtYSF4QmRJP_WFZqaZPqsFostohF7SoLsMOdNcX8p86IQQwtU
Message-ID: <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 2:25=E2=80=AFPM Vivian Wang <wangruikang@iscas.ac.c=
n> wrote:
>
>
> On 1/24/26 08:20, Guodong Xu wrote:
> > [...]
> >
> > Note: Patch 3 introduces a bisect breakage by transitioning to
> > pin-specific supply names. Probe failures will occur on existing boards
> > until Patch 4 updates the corresponding DTS file.
>
> Ouch, that's not a bisect breakage, that's an *ABI breakage*. And AFAICT
> this is still not okay in 2026,
> see Documentation/devicetree/bindings/ABI.rst
>
> So the bindings would need to be changed to accept both the new and old w=
ay.

Ideally yes. However, considering this ABI change's actual effect, the two
K1 boards (BPI-F3 and Jupiter) in the kernel get their power settings
from boot firmware as well, and the types of peripherals enabled in the .dt=
s
files are very limited, the probe failure of the pmic regulator doesn't
affect much. So, I think this breakage is acceptable.

>
> Driver-wise, at a cursory look from someone not familiar with the
> regulator stuff, maybe we can make it compatible with old DTS by adding
> the new names as aliases ({devm_,}regulator_register_supply_alias?) as
> "vin" or "buck5", if we see the old vin-supply definitions?
>

We can do that of course. My hesitation is, however, it makes the driver ta=
ke
extra code which may not be needed once all .dts files have been updated. T=
he
driver code will be left there forever.

BR,
Guodong Xu
