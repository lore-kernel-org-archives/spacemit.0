Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51DC3ACEED
	for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773414425; cv=pass; b=koCdp5LOwVXed9ELH/w+aCiRaqt5ZhwJzKEi+0W+J+g/eHAVTiOaWTOaMoJHPNUG1l36JsnDZMXfeXQvHut5cNw16bzRm3RrfUFiuQ8ffyEDhTBo+TQE9VWm0UrZjne2o0KTQmUYY2Sl8FBRZx8h9c9LRaMrlhwdZX1UlPyFnLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773414425; c=relaxed/simple;
	bh=oGY2ctpj9ghSA/kNXN45JoI3buaXV929HHTybkJA4UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+2o6qU5LppAZvphFTKHSalXAH6lpDraenq1oFfxWyHvfXUZ0h6Dwp2oP1upu5EZ9RQWdc2rRcvKgtfPjoVrjlrVS4sh/td0/OM11sTJYC2LkVPDQ7TwjipREbT628naeI2WZYwzfjUiEdGlRhWejXowsgS2EcLSMunQSQfUv0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGnhsx6J; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGnhsx6J"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fc4425b6bso24069277b3.1
        for <spacemit@lists.linux.dev>; Fri, 13 Mar 2026 08:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773414421; cv=none;
        d=google.com; s=arc-20240605;
        b=dZh87KgcoiAteZobuXoh1ypG67uZVOUeYqs2kag1FgGndjP1iCa3YB9grDLRzBV1rb
         6xgIquVxqNSmmnUFUEKHclj7q3a9crLxkDdbZIeoH3WeekaWyMuKKotoxjLBQkJpFxDo
         XAJZD2GTEUcwWQ5wC1GNOwn2RmTSPyTXIm6vnzVz/gbkAVHtE86O0zhcbg9WOqgYrsaT
         n+OjCa+vDsMSkHT/5BA65wZoqUf0i0pM+kXAaCr4Mo8qDH43U92VArZN1B/ms5nWt3ul
         0eQsOFqYNGIHudmfHl/ND3EpOHsUiGGLBkY0daXo7ImMqcII9lhBKJUPBhht8/q/5YY0
         f9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bwl3bu6QXSYK5p9OS9Lki1nNQiVBfsiIDBhWlq7lhck=;
        fh=0eBNUNHhNYQqxnSsdihX97FzdWscaCWUVf8v2H3ycs8=;
        b=QUlvS0t3ZtL/C17KTffu9BpUZCP1wNSN8VMTmHJrYZhBOMe3k9ue8G+RFQXWXpW9jb
         oZzVTu/6MCXsO/JVb1ToCD5I3hA4E4oCzu5S2+K2oxQpQQcIY6ONEbcNdL8GGvpjMOCZ
         YHwXKcIKRoM5c+FCBGnP24xJIMYnln+6xjWwQ7TmO7r1eDk397nXApZArCMLuHAGUFrB
         R6HN/MYWfL57/cuJaDwbH0CBCJ/ErN0kAr8TccgrBuxUlTAcx3fmGt8eHKKqf0iK6mCg
         3oLknq7knPrrbrYrWnI73uch5oYxAFGyTekPQoiYA5BTlfMOeA2Q4KBocXavNNgToFy+
         npRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773414421; x=1774019221; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bwl3bu6QXSYK5p9OS9Lki1nNQiVBfsiIDBhWlq7lhck=;
        b=UGnhsx6JYaM4dnqsHL/Q8JdJ7RM62luc9iHTIQGyH3M9Kmy0aCsVpvrT0HP/aFRu0m
         VHJFPxV5/fQWqlSU8cM8BQ4UmCMaFfsVvzrDl+4IkxaOTAHLNDOkhFQZVmqKMPVU73Xz
         GZtsN6GIneC8Q+M5eLLyMBtWEVcYor8pw2aRwgyifRKU4qz2hICT0EMy2RIpUGgJIXAN
         nvvQDas7UjT8Q98U+YSeczwv0vbAlBlfuI6/tC9QzB2WwlKxrS+a2pLEHRQEdEvuoKY9
         XhdonvCsIr18HzYNLD4iHR03fpr0OjikYj8LRenq5hl3redTQBlLyir2X56xJuCLGdsX
         2iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773414421; x=1774019221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bwl3bu6QXSYK5p9OS9Lki1nNQiVBfsiIDBhWlq7lhck=;
        b=cXHu+GbUisJL0VN82dLcPv0TMhC/BvJowMR85szZ+Fza7TIMulbrDMw6JU3gF1Z8XA
         r3vuc/KVeTRc0iKjDnLF+tXjY8l3Nf9GeclfZPDwdzICoIbB1kuOy2GiKFEXRu5NGHAJ
         F+DHfOn11NEUp6dIRCBO4tsNuDqwcM7MxtiTd9GBceJFw5dO3V3BuyoPCUjL+6/cFwjx
         Gv+/lKAywjxxI00kOUeBE/hAmAxBRiK7ziIu2M7ekHPRQBxL/FbRIK5fhLP3SzmIKZuo
         R8iEgRMIo5vmauDWflT00aM3baJ4cniF7UEYenUHQnAgB+Je2tj+mhAeqsClVvoIT7Il
         BNqA==
X-Forwarded-Encrypted: i=1; AJvYcCXxvhGNVOTrKTp2kDfEk7HP82s5wZ/GoG6yTLPAu+CdGD+iMOrT9QkSYwCOEqHqln+oQA+vSJKjwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOTLLXCvbi3IBe8FVFYH3y+3lIViXTJjAyCDsPxhkA429d6ZLd
	bLVfPbNFf3vy76xFH+e6a0F66q01Jgmv9Kl5n5FXRWlIODN49JYV/pd8GDP3tWcMYC5WmLdogID
	UYuj5tAxmi4TTmdaxLUzHaELpc46Wd8s=
X-Gm-Gg: ATEYQzy4KEuQ7wnxg/QlY5V80Ut+E0GSq7u0ebw6WesAhpzZZXu3Dms/BArjggO65i+
	sPoD26DPoMshqoCsED4wjR9mbSXbEoUhpHP3zxErtbJ/tNgXDUIivSLGHlajMq5zSxLlKZIjpBt
	gND6qxMn/axfrk1nIqWLKfztHWuCqyCMNPlAb6HXgPTo0axPuwTVishiQTn+skvFxE7LFtI7BlM
	BQeYdam4cvyNDsWSEwmJ19uDLtNg92kqAOLci9BvRxfNT8GiST5RRXZGH2gh3ab2PT8xcsRvhnC
	fIdQlzXBMXXYVGflOw==
X-Received: by 2002:a05:690c:4a08:b0:798:7322:b676 with SMTP id
 00721157ae682-79a1c0cf4d8mr40164837b3.20.1773414421451; Fri, 13 Mar 2026
 08:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
 <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com> <20260313001940-GKA407679@kernel.org>
 <CABdCQ=Mv-3X8KE1WOWKVTmq+POgJczsL-qFdAyp5qzM6=0s28A@mail.gmail.com> <20260313111108-GKM302167@kernel.org>
In-Reply-To: <20260313111108-GKM302167@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 13 Mar 2026 16:06:49 +0100
X-Gm-Features: AaiRm52ZDS_Bl9kTuuFRUA2s_aJbBWslNAWTIUfq3zQrzhaCgdDVn7wblDGcbW8
Message-ID: <CABdCQ=O9PEXWrPnofK56tGc_KT64PF3QtFGNr-r2Kx_-3Zzi0A@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
 and power infrastructure
To: Yixun Lan <dlan@kernel.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 13 mar 2026 a las 12:11, Yixun Lan (<dlan@kernel.org>) escribi=C3=
=B3:
>
> Hi Iker,
>
> On 10:42 Fri 13 Mar     , Iker Pedrosa wrote:
> > El vie, 13 mar 2026 a las 1:19, Yixun Lan (<dlan@kernel.org>) escribi=
=C3=B3:
> > >
> > > Hi Trevor, Iker,
> > >
> > > On 14:27 Wed 11 Mar     , Trevor Gamblin wrote:
> > > > Hi,
> > > >
> > > > On 2026-03-09 07:40, Iker Pedrosa wrote:
> > > > > Add Spacemit P1 PMIC configuration and board power infrastructure=
 for
> > > > > voltage regulation support.
> > > > >
> > > > > - Add board power regulators (12V input, 4V rail)
> > > > > - Enable I2C8 for PMIC communication
> > > > > - Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
> > > > > - Set up regulator constraints for SD card operation
> > > > >
> > > > > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > > > > ---
> > > > >   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 +++++++++=
+++++++++++++++
> > > > >   1 file changed, 48 insertions(+)
> > > > >
> > > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/a=
rch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > > > index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f=
5d7eeaaa0afb4e86425ae36 100644
> > > > > --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > > > +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > > > > @@ -19,6 +19,25 @@ aliases {
> > > > >             ethernet1 =3D &eth1;
> > > > >     };
> > > > >
> > > > > +   reg_dc_in: dc-in-12v {
> > > > > +           compatible =3D "regulator-fixed";
> > > > > +           regulator-name =3D "dc_in_12v";
> > > > > +           regulator-min-microvolt =3D <12000000>;
> > > > > +           regulator-max-microvolt =3D <12000000>;
> > > > > +           regulator-boot-on;
> > > > > +           regulator-always-on;
> > > > > +   };
> > > > > +
> > > > Is this the correct voltage? I don't see a 12V rail in the RV2's
> > > > datasheet, and the board's specifications only indicate a 5V USB-C =
input.
> > >
> > > Right, this should be fixed. Please note Han submitted one version of=
 basic DT for rv2
> > > which I think that series will go in first
> > >
> > > https://lore.kernel.org/r/20260310161853.3900605-1-gaohan@iscas.ac.cn
> > >
> >
> > I'm fine with that. Do we have an estimate of when these changes will
> > land? I'm fine with rebasing once those are merged, but I'd like to
> > continue with the review for the remaining changes in this patch
> > series and I'm unsure on how to proceed.
> >
> For that changes, likely will target v7.1 merge window
>
> You can continue with current version, once that happen, you can rebase .=
.

Ok, that sounds good to me

>
> --
> Yixun Lan (dlan)
