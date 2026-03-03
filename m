Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F749358384
	for <spacemit@lists.linux.dev>; Tue,  3 Mar 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545901; cv=pass; b=Uh+SXH6wsYxDFA3YntRMt9V+nInQLzzfeOCq/k6l0Psdqrr7zN6QDV8DYn663iS+caIA03eR8MSUE7BL2nj5OFo6Dfc0iDnKUXuccCXKlVUMAAahw+eRWnsLery51ih3yeRYysfNnpBeZH0dGP0SM+QJ0juEnvQGjQkLaoVdJeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545901; c=relaxed/simple;
	bh=mjmj1erYg/zPkh28cbgKmeKfsU11/6Ku7tNZPAtZaFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBzWn/l+5/mksYNnguvaDaFbRhIqkO9etGsmWCX+vlSwYryEJkUhMZj4YmVlIKQsNc5weOjvzSIvuq3k1fqJgoUBkzAn+cqPBxgDOVArlyCbfcwcHT0UnJn0EMx9qzu9DynqNJJUBnOZOXD9i88wDL8MwfvMmfVrfSKCd5gsi2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUumLKTA; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUumLKTA"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ca09f2170so5727101d50.1
        for <spacemit@lists.linux.dev>; Tue, 03 Mar 2026 05:51:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772545897; cv=none;
        d=google.com; s=arc-20240605;
        b=Vj/d3vkqjRLWcq0YxcdxzzYwFHwnq/MmCR0GfqirFINU4Ga01FHpGI/q8fJ0VUwgF/
         ArvYr7SK178dUEvNqGr3i9bNtzMHXrXE3E9YY+nCrn+H3k7wTk2ogn744laDWWpjXky6
         Xv1B5RJtHvirqGGg6NUMZyRnRtKBej7XGJ8/+G5kVmOB+GpDLhuauYAxzaJYFL+eD5Gd
         XVtep8y7oxTUBS+GYFXvBrRskEUuHKJfrtEaFmCApEX4ENe1MZNvYozkRurj7NAp5PM7
         EGCYXe/ZoplNxk6vtK1hGmL5aqUG7poeS1ysUYzDbDInvKzJ3oayp0ZzaHTo5+jFZEXl
         WToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZn4gqDyUQYxhmDFWGYkcAn3/Qr9cauEsxLXdsoN45c=;
        fh=4udNHLHUqd2e+4mSQAKXTJx4PVzOn9BrocdkAQLdqPM=;
        b=VxtMQcNealMcsQxXQ9smXjf3utKwHjXBQ/dfNPBePRLgvv9UJcueB6ghjxXCoAt8hL
         8bQqPRvenXHBiiN97MxZjckiLxeKtkrp+WzjDjrab5aI7cmAH60u5/ni0eAl3NbTIVBg
         NSzHxUPV/CaTX9XvfcVIyNpDwJmGsV6y4wbl0VM5t+wwelWNh6fr+wqkuJBYWioHI8bL
         IAuTsUdtukELa0qUmkShZZ4i91iQs7gyAIVB3DuO4uC7fMAE6JwdzQVO/DUk4i8hhsPj
         wAEEjsu9XPCkmswNuY4NnL9+X69Af/pVTKPVkTvjWX/iME3FTj1buH38rOa+nRRXb3yI
         mpkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772545897; x=1773150697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZn4gqDyUQYxhmDFWGYkcAn3/Qr9cauEsxLXdsoN45c=;
        b=RUumLKTAMVHwLQweu1VuFOqzia/X3O9A97PeCKcj7ZpzEvBsU89jO/el2SpYHCjrIz
         5qeMaZqepM3oBy43SbQTNwaNIhX47uVkpfdulIpXSdBPyXc/vPedeHAMxeXHFgupO2NB
         m72QsucAWbDSrLAmfws62tLDJWJ0AOtAZWOKWxnAcw9t8DUC4cD18uSnA21eDFgyKraw
         URaJW+RHVIEkathqsn+YrbDq9ysyLcU9VYK7mMHDWqwsD4P3nxEhM0URqEP9/vkSmhKc
         xpEhMpNiZAFMtrw51x4Wl1kkZAzR/A09qc90ZSmx6ciEfbphqoVJMa1NbFcPvcfBaVkC
         v3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545897; x=1773150697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZn4gqDyUQYxhmDFWGYkcAn3/Qr9cauEsxLXdsoN45c=;
        b=ZHsXvpuafg98D5dKZiFN5ktZKGlJP0hC9j3AdYOsKVxUcF5nUrHFH+YncQ2kQaRRbm
         4g5VA8E1kzNnphjk2ZdI7TPWuB8zGZF6Jr5NQxitlijZ4uuMlwRRGGZJHY98uCRznPtC
         o/+85MGPFu+6lcV4tvQWibGVZig4dN5ruX/poY4EwPwR3cMSWaDeui+4KOpkWQMU7wnw
         2c2lYwsscdDDMIzkd53o2egW4bHHYZkqwdqFd1OZNfdxGsxiTccA7mIoW+M2+zvgQmN1
         S6EzDR9ojSktLmNw6VDD8HvY2yNkWeK69X6gNF0n36V0zOVuK/BEd2ZEZVuiqCfQO7zH
         Bh0g==
X-Forwarded-Encrypted: i=1; AJvYcCX+SEMbnnFJmKGekdWg8zR09j/FwXCKfekQONPjn5kYU/qSemj5qVTHSO5Yo/XJn/GF3XpPSkHqjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNz57USBqYvW9aqQ6m7S3a1zHONcMyxky1LJxat9pVjYkBk/dF
	KDeZCfZfX537ayQ3H6eayD67VQBwxKD/q+7H6HF6eWSSLXvg1N4ATR+c9EoOJCGNslJNgj/qxkM
	eVO2plowQMDplm8mEY85rlrpm40AfkY0=
X-Gm-Gg: ATEYQzwCr59z2SRehUBlz///o88ogorLu8dVbags3JkM1EJJcWXcH/OR336sp9Lvr8J
	jjiX9gD0jLcgJpOWXLGOBnmfmvnRFOb6Rjvatieh3ANPp1DDfCNbAV5Ay2IPVZlVkgMOVFWoZNG
	a4/Jognrd+hWPzs1V2/J7xcPfuvhcktp7JIJNDD/ruqE1IE6qxKcNdlqCHxO4u9DGSNHkGOODBA
	ANuVdhUxQIJVUN9Q5i8NB2e0zhD6bbdKZ3T4RThl1wDjG8KL855ac7hFsZSjpRaRObMu5iJMjWa
	0lL7pJTD
X-Received: by 2002:a05:690e:90:b0:649:4997:3e94 with SMTP id
 956f58d0204a3-64cc20833c8mr10119824d50.12.1772545897333; Tue, 03 Mar 2026
 05:51:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
 <20260302-crewman-faster-9fd00b62e30c@spud> <20260302223803-GKB289813@kernel.org>
In-Reply-To: <20260302223803-GKB289813@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 3 Mar 2026 14:51:25 +0100
X-Gm-Features: AaiRm52NZmZiw1yUUKvM0Min02zDkPktW8qIv-Jsblu1CXoYU1NePFrvk318i6c
Message-ID: <CABdCQ=Nd9ZW6OBnAiuki=2+DhVraW19bh_m8=LLQGUKN8TkEdQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: mmc: spacemit,sdhci: add AIB voltage
 switching registers
To: Yixun Lan <dlan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 2 mar 2026 a las 23:38, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3=
:
>
> Hi Iker, Conor,
>
> On 18:25 Mon 02 Mar     , Conor Dooley wrote:
> > On Mon, Mar 02, 2026 at 04:13:22PM +0100, Iker Pedrosa wrote:
> > > Add SpacemiT K1 AIB register properties for UHS voltage switching
> > > support:
> > >
> > > - spacemit,aib-mmc1-io-reg: AIB MMC1 IO register address for voltage
> > >   switching
> > > - spacemit,apbc-asfar-reg: APBC ASFAR register address for AIB access
> > > - spacemit,apbc-assar-reg: APBC ASSAR register address for AIB access
> > >
> > > These properties enable the driver to perform voltage switching betwe=
en
> > > 3.3V and 1.8V required for UHS SD card modes.
> > >
> > > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++=
++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yam=
l b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > > index 13d9382058fbc1c12be1024d1c550f04a825673c..4d6590aa8262009b6e569=
7a04b45cf3736c0fa42 100644
> > > --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > > @@ -32,6 +32,18 @@ properties:
> > >        - const: core
> > >        - const: io
> > >
> > > +  spacemit,aib-mmc1-io-reg:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: AIB MMC1 IO register address for voltage switching
> > > +
> > > +  spacemit,apbc-asfar-reg:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: APBC ASFAR register address for AIB access
> > > +
> > > +  spacemit,apbc-assar-reg:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: APBC ASSAR register address for AIB access
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -50,4 +62,7 @@ examples:
> > >        interrupt-parent =3D <&plic>;
> > >        clocks =3D <&clk_apmu 10>, <&clk_apmu 13>;
> > >        clock-names =3D "core", "io";
> > > +      spacemit,aib-mmc1-io-reg =3D <0xd401e81c>;
> >
> > This looks very very wrong to me. This is part of the pinctrl
> > reservation:
> >               pinctrl: pinctrl@d401e000 {
> >                       compatible =3D "spacemit,k1-pinctrl";
> >                       reg =3D <0x0 0xd401e000 0x0 0x1000>;
> >                       clocks =3D <&syscon_apbc CLK_AIB>,
> >                                <&syscon_apbc CLK_AIB_BUS>;
> >                       clock-names =3D "func", "bus";
> >                       spacemit,apbc =3D <&syscon_apbc>;
> >               };
> > so if you need to change something here, you need to do it via pinctrl.
> >
> > > +      spacemit,apbc-asfar-reg =3D <0xd4015050>;
> > > +      spacemit,apbc-assar-reg =3D <0xd4015054>;
> >
> > These two are the apbc syscon:
> >               syscon_apbc: system-controller@d4015000 {
> >                       compatible =3D "spacemit,k1-syscon-apbc";
> >                       reg =3D <0x0 0xd4015000 0x0 0x1000>;
> >                       clocks =3D <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>=
,
> >                                <&vctcxo_24m>;
> >                       clock-names =3D "osc", "vctcxo_1m", "vctcxo_3m",
> >                                     "vctcxo_24m";
> >                       #clock-cells =3D <1>;
> >                       #reset-cells =3D <1>;
> >               };
> > so add a phandle to the syscon (like the pinctrl currently has) and
> > access these via its regmap. What you've got here is a non-runner,
> > sorry.
>
> We've gained this support in pinctrl which already accepted in mainline,
> it's done as Conor suggested here, so you can drop these properties along
> with the patch [5/10], see
>
> https://lore.kernel.org/all/20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6b=
cb46146e53@linux.spacemit.com/

Thanks for the pointer! I missed that these had already landed in
mainline. I'll rebase the series, drop the redundant properties and
patch [5/10], and send a v2 shortly.

>
> > pw-bot: changes-requested
> >
> > Thanks,
> > Conor.
>
>
>
> --
> Yixun Lan (dlan)
