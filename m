Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FF638F658
	for <spacemit@lists.linux.dev>; Wed,  4 Mar 2026 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611855; cv=pass; b=b+/IFeqMWUbO6hMCf7jUZ6tvCwZJI50RFs6sFSxQZ3Lofiy7zMuFdsU6bhEXkTcnpGpkuAwEHrC6ec8aDwPiGIXrHPgITE1554Wzoqa4DwOONNqO6W9G9lEHNDKyp3yb2LYnrfyBp3RX/ie8pf0U+w87hrdh5/TBYorqrVGffJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611855; c=relaxed/simple;
	bh=pZPELEAX/XvgCd+EHGG39RWeEAKi/FXGHUEcYZlbyg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNLaNCIoXfGJexSfysV2806RqZGMpJS34808uczHzG4XhMZXPJOHmj44IUs2JRHQ/AbymN3To3w/sf1AF+wmwQ6cpqjy11kuYO7l4y4raypwzNilyuEt64MSbzFy+Vdb0IaIl3LNGSXbCC/fNMgOBj6R7ktlGLGdXsizv3zzoRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ea8x83XO; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ea8x83XO"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79800183233so90599207b3.1
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 00:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772611851; cv=none;
        d=google.com; s=arc-20240605;
        b=leCjZu0ijdVr4K6FroYOG9xJMrOopUfIv7trAvl7s7qYOJFlkrpUF7v6uiie5RjGY8
         KrTLhQYCOFxEInTN+qSFR/e8uvAvD17UefBzcFir3EVtJyJBNr1Nkjwa5zdZ57SBoFnb
         ifnSJK0gWcQfMWiRzdT/V8SLZMdxXioGIEyw8yDzoltTxTuMzOYCZsPETO46RfC2ZVCf
         QXBYZHWNTFKksU9uv+LYrPqwxwIZFKiyo0pwN0VZSZd+KOEFetcBR4PMBhZ0QhtH8CAZ
         9hE4eUNwGL+4Hcuk2dOePP1aJXUnGpsMpHvPN4ZYKwp/9XD8ohx+Ki52xM4DyIFZyc7v
         9sUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xGLcah51hQA85jyOrvUCy/8RViW2Ks3it80HDo6IDSc=;
        fh=WcK+EPZPn2mV4eW0YzPtxE45aCMfqz6bzQAQou7JFkE=;
        b=aNnF0Z62fs8CCe4DajXQ0elUNJ4WJFfDvILGK3u7zFTyyQr04iZROYX7a6PM0ZCYMT
         1gNk4JgIxbrq5gUX3As+gN8vYmth8Gvf+mvuTS5lEcGur+6EDb79oLRHtVoThBWgOZVP
         IuOoYS7nECqmKPEJjdfqURRgBd8EZsL0lk/xdsYOJf2Ckmp4Wb7YSp7fMMb5kFUAVi2D
         AxFf3VvI2xIT+FTpSQ+Qly9pLBFd6iIxQbPLez4B56UokXV5MSCGSFpEr9E3aOUNqVit
         WvGzW++5gIA6IG1SuBvcdwdczpslvky/Qw8UguGxM1n33QHBm6QM2g5UwPV7vDj8Ajqp
         Bm2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611851; x=1773216651; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGLcah51hQA85jyOrvUCy/8RViW2Ks3it80HDo6IDSc=;
        b=Ea8x83XOq1ptF7yv9pKKp/qwDDT5cMc2rZVzEkt4ZxH98/H9L3B1ZsFEWILof7o3Tm
         TyvyDPJoBIXCCKPSWlWA1nKpi+rLvcX0nQEiIRB1/6KSsrfEkSZ/RXaXuvJHN49LEWBE
         wWwCs/2aSHMxPB/ylrhqLlwT7YDaFlE78I53WS3D3FIBa6dinxZadtf7tbBxxhhSFxNv
         SyK71xt9H3hHc/uoU+xCaRS+ho2WTyBM+RCohfo81VisJ7/mIvzfi6pWeD/xgFHSCYeb
         pZ1HPQWS2KpcPdhniWa+4R75zm1nwyxjgxQ9xOQcvRvCBySoCMCAY8ch1zQbMOfZGjPF
         6o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611851; x=1773216651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGLcah51hQA85jyOrvUCy/8RViW2Ks3it80HDo6IDSc=;
        b=cVOUDOZwbthk2D2NcWFvHXwll7KsrhWcUspnbDlFQx5szoxdfr3qAvGYgObLPFz3wO
         3vO1tNRAehhu8pnGhEM/8I6M9Gvczvjjv5aRvH7Pkq89rb+MNkiG2UPvZGoEsBp46pVX
         zi4Wiw7UBHt8KQ9LcTA4oUZClAPrRWh337XntL1HwR5l+x2ubPAELDhE8sO+zg2nLZcQ
         ZN6kW+JxM1/EBTDVgmwZtXw8yd8rZP7ma4CIeeBzb06qbz45b2tEcwiDodK6faL1fvFe
         9pOzg/j2UVQBbwWgv79V5j+2gaveFUzcLbqG8ifmq8KiHamXhX2aSGY+SRwKgc8NTKtD
         WKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVppwgNu+LGPuBjNescn1GuTHh/vQZMa1G9LNY5ObGF1u8WwEj+1lagOOpWAJbsuONr/i0USc/Upg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZJcSuVsfh3LQJPgiOAyuX8BoVyeXwNO8ivysxt+uJZpScgxK1
	x1GQoD5CZ/clgcSmic9GSiCCxL5FgwNMBen5KcBVgNADndTIFsdbxY+1XZO3dpP7Ikatxu+6KDQ
	3dMJFD16XDLHzDuauGOkLd13bFE6Iwjw=
X-Gm-Gg: ATEYQzxOv6NomXPBBxwrdNmOrwDdzjGcDqIcuzHsuH6xy6INxCjvskkfCL4p8icN5nO
	OLIH2ZpXlSBWzMU+ftpQtMhY2whKA5E6lj1Nd9EvLDMCfjcRHcfHSrI0iqUPyszTA8xtLGvZdnx
	KMbFxaWaGYFRYQZk0+cGTTy4RUQ9UqavM69B1TU6S36t/GO6eEslrxkrVPVLamLMT5QQY8m0AcA
	jCkUMvOW9j6nPbFUKYXVU+ITkhz/aaKIJhmdu5x1SqBRvO5cDVd6p7Lofng2+phrghNwZEbASQr
	is2d07fL
X-Received: by 2002:a05:690c:9a90:b0:794:c283:5fb8 with SMTP id
 00721157ae682-798bb44f72cmr33135687b3.25.1772611850798; Wed, 04 Mar 2026
 00:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
 <20260302-crewman-faster-9fd00b62e30c@spud> <20260302223803-GKB289813@kernel.org>
 <CABdCQ=Nd9ZW6OBnAiuki=2+DhVraW19bh_m8=LLQGUKN8TkEdQ@mail.gmail.com> <20260303222800-GKC289813@kernel.org>
In-Reply-To: <20260303222800-GKC289813@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Mar 2026 09:10:39 +0100
X-Gm-Features: AaiRm53WZ82ezbm0-nMVrOL-p2i2zBrqno2q7oSRqZHnhzqczyjmu4JOpaAlYaQ
Message-ID: <CABdCQ=OxA4RM+3Kqjim9QPUQD3xBkAjUTD+ObC5Cmux1Mx1UpQ@mail.gmail.com>
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

El mar, 3 mar 2026 a las 23:28, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3=
:
>
> Hi Iker,
>
> On 14:51 Tue 03 Mar     , Iker Pedrosa wrote:
> > El lun, 2 mar 2026 a las 23:38, Yixun Lan (<dlan@kernel.org>) escribi=
=C3=B3:
> >
> > Thanks for the pointer! I missed that these had already landed in
> > mainline. I'll rebase the series, drop the redundant properties and
> > patch [5/10], and send a v2 shortly.
> >
> Please wait a little bit longer before sending next version, give me or
> other people more time for reviewing, as a quick test, this series will
> break emmc driver as tested on bananapi-f3 board, I suspect it's probably
> duo to clock related issue, but want to confirm later..

Thanks for the heads-up. I'll wait for your further review and the
results of your clock tests on the bananapi-f3.

>
> Btw, I was also preparing sd part driver, mainly target K3 SoC, but since
> they are mostly same IP, the driver can be shared..

I'm also interested in the K3 SoC integration. Since it's the same IP,
it makes sense to have a unified driver. Please let me know your
thoughts on the best way to coordinate our efforts.

>
> --
> Yixun Lan (dlan)
