Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA73191D8
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093749; cv=pass; b=cw0Xmlr7WxHUdgsoRFnps4aMbiDE3Kf/xDBWy/E5+RIqFu/jWYiL8VkHZufuzOtkQzwwP005kCeIj7c6wTnzH/1bow7rVOsG+b7/I0+yJf4zkP90ygXZcXnnHaVk5FBdiaTCsotVzsqjOu7xlk/F3XH+aLBjI+jSXBCUCykyvbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093749; c=relaxed/simple;
	bh=JPDh6iyZpRU8+eQaa9r236YqbwqZPCWxtTGDrKz3Wic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/a7pfhEs30LUU2Wke0sTq23+O9OvDvqEn/V/36BwhLOFW/SlyKpW64rStfmH/ps6ZTx51zU+Asela3qXPoKgBGtviRNrY1iRK/Gz7MkmZ3R6mxXR3KAKcTgt8UB+p68UNp0WVFvOV8X70iPTtk5xzeDzaagE1OSwKdTrRrD7sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=B1b9D2T9; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="B1b9D2T9"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7927b1620ddso16141197b3.0
        for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 06:55:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769093746; cv=none;
        d=google.com; s=arc-20240605;
        b=IpYZRUqRO/PCkUH+Lnotj9iwqQf3AVgyPAzogVfIw/2MAIpPR3uJk/eZOZfnLLZ5gF
         t8bdJ43FFUYNKosl2dzbQZ2Yp8G8qurDiCp0KQzX48udO+n6pQYWOICQFE2MRS8eh508
         iSqYhK1pFVoeHpEC7ut3VOQb9j3w0dFR9fPUz5/qAwELq20j8cql9zxYFBEBzY+Vdfno
         XQCGuzUbu02x+OuP4VxjFVIUttn4IrIlSOv1lpQyEl4vx0lNd9KtgThk5nM/J39dIauY
         GQwD8LIBj75uQM/4l02aLhUdkPAIBpyk181fsnHVDf4pgE1Yj0RRD7sQ9rLwhZf3X5ud
         k9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNlrb79F8npK3m2Hl07L9rICov5a44ljv+REaE6QtO4=;
        fh=1iexJJ0gC8teQJIAglOy88dj5vBLfi2PcLBRJxEMfj0=;
        b=aDebQ5pRosEcKgp+i8XLFmJaBBeWfwFDk3gCMsYIzmUD4ezHdWpU/axrcgDLggWW+O
         iFB48cl0whVbjxbnC33pKUWH+cCQB+kb0cEZsLc4pwB5dVlGXVC6PzZPi6hKylETrxGE
         5/Y4aBr4mApB999fPuSfKb7/HeQ5Ob289TZJ9VXLLRJCvIqYZlXVs+0f4MkTigKw1q4Y
         Aq9mv1kAiAWDN267EzLz8M0X+9wlRmuPIyqpVtUxROOoMTALlpDnWYSIQKWejkFBH81d
         Kv2n/G39TeRCc9iS7nSZNfNxlcfy2GpsrXvLbVYte4vuapwZOp/cdD1hGa45b6tquZuJ
         2BrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769093746; x=1769698546; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNlrb79F8npK3m2Hl07L9rICov5a44ljv+REaE6QtO4=;
        b=B1b9D2T9he4mKDDFexkQFvMWf0hH9CZ3pVIerwbZ8UPfLL3JBdVK2ukFSE8URdWI3o
         c8tqckmH8fX4khmWsHjji1seYTfqC/qKOXkGapWW2Hj4ktztFVG2xLOAAO1XOX8d0F+w
         XMU6DUr2wTZDLzaS1fnToBzw1FctgDoTeeTPTtAT4l9npWgiOCDLnm9v0JiNCW2OsGFB
         QwcPpzAOcKcss02OcuJlV3A7MvMJwmylgLe8dMR0aBIa33QxsSxPQG9b1suhapZJC7lv
         y/9eqVlyPs3YyLiqcfLYBer6Yh+Cin6wBwi5SvkPUGZiZe9W83HmYBdwIWIXd6KwifJ7
         Dj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093746; x=1769698546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNlrb79F8npK3m2Hl07L9rICov5a44ljv+REaE6QtO4=;
        b=oS+/sSZA/9p3hSjgx3H+0ptsNNnvw6Ic6WRAAzVlZ13bO4l/PXKo1gNLCU/S+SNetS
         kd3ovImBN+/r5++xsC9hkEhFa61GTpGhN5LzohvtNEE2xBNNlEj8wstLMgKTtPO5POlj
         B0XfLjjbholX/cnW5fIFT5Ryxya/KiiIAVkcqJTcbTB5vRKvjNZ0Q5fC205HjUBfUqPh
         QuE+AIVi932A85LRn8/wCCqUlq18y8C3S4awnwy4NLdn/jOwPXPGt2ZXNa8B2q1FdBMu
         iBgRrv2zKpEHdT/hIAt02Q41V64dhm+Zy/yLJE63aSh3dlszngQ8Rz20MgI5ge+qL7/1
         W6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcvg3/ZtfDD3g4qYZfeXZXYGp52yRKgx0TbXm7tAE3yfF7wWLcWmrRJcFatuNFNT5psej9vpicXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBGJagHhDe+HGR0ypU+eCEKQbvWpJsEGtvlXILjaEqiAdJsb/U
	HYXxGap92xnP6080Gpq05rcjiUh0mYnYaI/B0DTnq3e7nHL/nyH/tTFpxnv/5RsPK9aL3G+rshC
	d3v1k1fOkqq7sqEehWT9rddMR9ZIBpNLVp8r6FZTBjA==
X-Gm-Gg: AZuq6aKoT8F7b2ZXGq2B72V/8AW9noURPz53YnjE/356vPWkuuiJ4qPIJD3hNME673b
	1QQZnfaon8gbAxCSKv9ePVZgyKOYzXdmFg0e8pH8+6LcSIGeB8kByXrqfWd8IVmzm18FoffGDPG
	wTyDioz0ECVC93wLY4a9tGuDyzDPSHSPR408OKQCRUZmMJDjv3VpWE5EdN435yIfBcoobbx+ivF
	u1Kyafkdb8yN7zEMzekzZSAzEG3VW4CDyfhJcGpSp1YbJ9NczCezMX7TB6emDiHCwMzXZKpbhnD
	wb2F0Foaq5UecSrvVtqCSrG6+g+75ViAvoKy8Jn5CANk
X-Received: by 2002:a05:690c:f13:b0:794:e13:6cb4 with SMTP id
 00721157ae682-7942a867a86mr25319347b3.24.1769093745796; Thu, 22 Jan 2026
 06:55:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org> <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
 <20260122121223-GYC63789@gentoo.org>
In-Reply-To: <20260122121223-GYC63789@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 22:55:34 +0800
X-Gm-Features: AZwV_QiJGaLsEOdeugS76EcbcaDtGi-z5pG6_55yk_bVABlnd5tqHNMAicmasHQ
Message-ID: <CAH1PCMaRqXHBZQLY02DY=C1rorMc2DZzzE2ziADofWoAQW8Mzg@mail.gmail.com>
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Yixun Lan <dlan@gentoo.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 8:12=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Mark,
>
> On 11:27 Thu 22 Jan     , Mark Brown wrote:
> > On Thu, Jan 22, 2026 at 06:11:22PM +0800, Yixun Lan wrote:
> > > On 17:43 Thu 22 Jan     , Guodong Xu wrote:
> >
> > > > Patch 1, n_voltages is corrected to match hardware register widths,=
 as the
> > > > previous values prevented regulators from reaching higher operation=
al
> > > > voltages (e.g., 3.3V on LDOs).
> >
> > > This patch bring system-wide change that not only affect Bananapi F3.=
.
> >
> > > Please also provide fix for other boards, I think you may not be able
> > > to test all boards, but make sure the patches are available, so peopl=
e
> > > who interested can test, P.S I can help on milkv jupiter board
> >
> > Patch 1 looks like it should be OK as is?
> then with patch 3, and for other boards (milkv jupiter), should have simi=
lar
> DT fix as patch 4..

There is no "spacemit,p1" node in other k1 boards (milkv jupiter).

Best regards,
Guodong Xu

>
> --
> Yixun Lan (dlan)
