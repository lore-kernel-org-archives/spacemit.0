Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A909634
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 03:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303988; cv=none; b=qWPCc90kjxggCiCLaWXLFcoSnR/oe8fzqZe7fB3Nt0iem6H3cLnY8DGynxlt7cRIWZ4DgX86WG3Xli/pYOuVerqq88t7paRISeVpBsLhVOR2nnUJVP8wZBHRGL2SRDcrELTaFnSG6WRoSOMtjj48sBSbteuKN1jraQdtZYE6R3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303988; c=relaxed/simple;
	bh=o1cKqqrl3WcFN3B0siBCxSoKZjsWO26WSrvEnr5m2so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nc0ZSLXpQ5yEKor/6HmAubDn8OPDY/xjwBCLsw4MZB7ECXd+Yftuv2Pu13ulsOJDY2Kj7p58UZr44yY/5ZkV2XQVWFItkRGTiWzcr3AoOfhs/3zLR7/PsB8T7QFEUTgO4VByydxWPkMrQsmAXH8whnr5Gi7Bd1oMZZtwg2I+BZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2sSPsgOu; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2sSPsgOu"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e812fc35985so322050276.0
        for <spacemit@lists.linux.dev>; Wed, 18 Jun 2025 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750303985; x=1750908785; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60xy8wKrKO+1t7u1ffpNKlJu/zpqbkDRJr1SZgFpJWI=;
        b=2sSPsgOuxZB0gCs/gNUtOi9H9MpmZHCcMwkzc8cLgSmV1Be3Yac4Bg/3NC5L95uNct
         mreHh51z2uJf3/NLSMFZweJ/Zd5gkmM1yfQU2F5Is5Tyu4/kgHeI0ZfGl+ksydAthh7s
         LKBDxrXRjPvV+DoK8f/On1/OL9DClyGNZ7WWqBkViH2YyGWFL2Gsd5OPXjyX/sCntMPJ
         X+1MKf3Hll4ajHEP7PtUsQFTS9We24HdewN6hwj0OHHR+y0NkMNZnr6C7/Lksflf2N1m
         hrcCrYUKptwSCns9O1hnCzcfufVmZptH9sBGVPc9l2FKX8WUFFkGulPvHceEWmSjkUWp
         6Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750303985; x=1750908785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60xy8wKrKO+1t7u1ffpNKlJu/zpqbkDRJr1SZgFpJWI=;
        b=miKucqMNsHgtQSdXfzjfwoy7/bwrrJOYPUGWPzFTQgveGKfCOIRx6y0q51YeKoFiLr
         YsNVBoonAr7LEUv0SQiD+jG1aNxOzpYHOqmyuEiINNXwppC7nbRszCzme9qGruPhm6X4
         dmDeYVab0uikic0p2inIA61m3fztIGWhJYd8XFhu78RK+8hMU6GP18uqO4Un8bd00IZG
         qZPinjoc7YRrJ0C8ESkBoT6/ixtjmoiCLGHJFh4SQXMxJRh3R7Xmib2D6dYgf8xCvJ36
         7kbf4jVy8pVRHMSGc8CxeTyxGp5CDX5gECmJ9WZ8uBnahY2w94hOxaaWVZXHnkK8lLkq
         dloQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP3eKWDLYuHp0jqA7Q2Z9ASFaBCwmXlo/CBLkYczGOxCgoAiZN1Ni8Ce+1VfoBzaK2skDstj/qfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVYLBCSGgyQX2hQp+3Pg+np+Z9C57428Qc1sRjfthxUAZr8iHj
	DHyKtn8eFtbeDT+6D/fvU0UcWAGn+ihO1VaYWnmW+pYy3vX9wthbKDvfOH9OJei8tWXBy9hJoJu
	vVv0+Q1hgkRrH7YMUBhY+YKbcDkMq6K/4pfC7YURpJw==
X-Gm-Gg: ASbGncslHdC6vGE3HS7GmYuFJ3wobnNXAyEeF3ACK4K/C9becD/FgBuRwypeHBYetni
	WraRtUYT0bgxSSZEYp+Qmvu4Xoza+3CjjMaBlGCtf0lYSILxLY9ckmNIQsMLbBhR4uJWTD/GT/X
	BN6tHbuLQc56N1BkOcRUmoX+wy31RzEhBgZdFgwg+CrA==
X-Google-Smtp-Source: AGHT+IGcgeMo27lTgaDy9bbMAdcQR1xe3fMVRu8/9DI/Df3XMM3eOfwyhPsLvfFCCnJDn+wQXZA6c6yxRggua+A+pZ4=
X-Received: by 2002:a05:690c:3501:b0:70a:36b2:8f94 with SMTP id
 00721157ae682-7117544b8a1mr301360657b3.18.1750303985204; Wed, 18 Jun 2025
 20:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <221b0b7c-1879-4944-b9c4-cfb9fad9ae91@ghiti.fr> <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
In-Reply-To: <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 11:32:54 +0800
X-Gm-Features: AX0GCFtELZSRZqubW6lHS8cOASUCtzDo1F3xvWoK2w2WWudZIiFtQ6t7sUz4_vI
Message-ID: <CAH1PCMYR2L8TeuveA-XTorQE70wmJVA1Vbt3Qhz0864Vr206PQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, dlan@gentoo.org, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 2:57=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com>=
 wrote:
>
> On Thu, 12 Jun 2025 06:12:09 PDT (-0700), Alexandre Ghiti wrote:
> > On 6/12/25 11:32, Yixun Lan wrote:
> >> Hi Alexandre,
> >>
> >> On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
> >>> Hi Yixun,
> >>>
> >>> On 6/11/25 16:56, Yixun Lan wrote:
> >>>> Changes to defconfig should be always updated via 'make
> >>>> savedefconfig', run this command to make it aligned again.
> >>>>
> >>>> This will ease the effort of reviewing changes of defconfig
> >>>> in the future.
> >>>>
> >>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >>>> ---
> >>>> Update PDMA config bring in unnecessary changes[1], let's fix
> >>>> it by run savedefconfig first.
> >>>
> >>> It would be easier if this patch was part of the PDMA series since th=
e
> >>> last patch will depend on it: @Guodong can you integrate this patch t=
o
> >>> your next revision of your patchset?
> >>>
> >> I'd rather make this patch independent, as nothing strongly ralated wi=
th PDMA,
> >> and it probably would take several rounds for PDMA patch to be settled=
 down..
>
> Ya, I agree.
>
> >> Besides, there is no problem for PDMA patch to depend on this patch if
> >> needed (easy to use b4 to handle this..)
>
> Yep, something like "b4 shazam -lts --merge --merge-base 958097bdf88"
> should do it on the merge side -- and maybe you don't even need the
> merge base, if all the b4 send side stuff picks it up right.
>
> >> The idea here is to get this patch merged as early as possible, as it'=
s
> >> quite straightforward, and other people may have similar problem inste=
ad
> >> of PDMA here
> >
> >
> > Ok makes sense, so let's Guodong deal with that then.
>
> (for some reason this isn't showing up in patchwork)
>
> I'm going to merge it as a single patch into for-next.  It'll loop

Sounds good. Thank you.
I will rebase, (or have it as a prerequisite in v2 of my PDMA
patchset).

Guodong

> through the tester, but things look in good shape so it shouldn't take
> too long.  This way there's a stable hash people can base stuff off,
> rather than waiting for some other patch set.
>
> >
> > Thanks,
> >
> > Alex
> >
> >
> >>
> >>> Thanks,
> >>>
> >>> Alex
> >>>
