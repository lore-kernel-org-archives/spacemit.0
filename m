Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669A517A2FC
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766970524; cv=none; b=UfAFI2dX0YOvJxCFWV1h9qIeHPj4K4uCiB2of/JERN4CKOB1TZi1yFMZkBKwCM1zsbxqymGbLHoP+xVxzjyzEGT2s+dK7/SKZs8sAHQMQ0RKN+x7uDjjSmLhk1dEr8KnfK8nLeoTAirbbHl4892ubzSs1e3lz6CynRdy7Fnn+hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766970524; c=relaxed/simple;
	bh=f8xb7f7Wc6cleIreUIT0R3KFYnTxJ7Zn4E5sKYJ6J/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EaX8/uGiduIxDaCl+tqwQU6OBciRXgxpG5HpGoRGhhdEBvZKvibYgla7CHnzjaYkYA6bgw12JzTj3+wsjukngUT3WvWfjgYdj63JbR74VITYfkvRvV26aatifc+0y3z4FiloH1YeeGcV1KplpBoxUUgDjKG/DE6+IpNQIUwNhII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EwUN+2hF; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EwUN+2hF"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78c696717dbso70183127b3.1
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 17:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766970521; x=1767575321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UE85kVGf+q8GmraHlXZAv1blLIu7cHa4ZcemBTV+hE=;
        b=EwUN+2hF6sUB5v6Kf/LrUxswcEXcyel2ea34kfSiEMlBAPLQEEWThtlnZjubkkyZL1
         KGV77cysRYUxZc5ZJpZJlHYGMtZHTo9idLpY2VtnePuUW6T/bIqoRhzDBxEF3R40akDy
         Ld/RfpRE7iGsfvfNsPVrXjv/Bpj5v7dJoMkkzj7x3ahvioV+S8lMATfNrUl+bach9YcM
         BDuFalHZS5dPPgBP7u7HgkslCoVPVpyhkMo2KnNTCE6L0JiVYMkZYDqi3EMhVtZrPiQp
         wfGCRK9o+1NeV714Ag7P+elmY/4I0u/V7hXPu5UFpOQCaVpRdRMbGa4FA7aSD5Ao8oa1
         QHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766970521; x=1767575321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1UE85kVGf+q8GmraHlXZAv1blLIu7cHa4ZcemBTV+hE=;
        b=QXABoZIqI03kbZsGCbhRBTOL56lylAiBZ2Z8qQ/nMZMiN4OlY75dNBcSzMgPy5STHH
         9O4mOHIS93mTYjHHuMHoIflW82CgIK5Z/pfNOD3pkUJQFYfVkCnhkbHXmjwpzPxW8+Tw
         uvdIBJqvLZvrT1Z8aYXuYt8Kgc6H/zVM1ejmgSBfjR+z+52MM8fvxEM+ZCv7FriUE8o1
         Bi8u62mxZTQ4LMC1cl/hqtu0qGfHT/GbeQm+D8tSrI9LTJiYsKEB4wIEZAKx+ofx85PW
         1bWcORGdVv9chzcxhWYGlKFdIW2txW0gVOb6pxlDG3X2eQN/S+VJbna/lCepv7CMGBtS
         MOiw==
X-Forwarded-Encrypted: i=1; AJvYcCVGUxfgrDQcyoKMvXqwi4IM4DbtEfi5mdOQcbP9tdjbthKNHnaJkLyHqn6s7JtkdxQKjVYudWwokA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyreDTgWx1S9djsauGmFBhcK8+Nmp1pG5Hp9xf2omN4/B4ru4nx
	/DtwIIoAB2IJm/nulMi3oLnxpShklHIlBMcoYqofhIL5KSMuk9NeVqVcP639HMlmz6x455KYjal
	wyVb3uE+NaaUL1JPKDVqGzcPVv67L9VvQ0HqjWjDXaw==
X-Gm-Gg: AY/fxX4SN4+gDggG9US5utCO9VFTNuGK13uOFso+PWQc6GlUunupG5Sz9aXtXaMmQbW
	T2rCHUWzsMoLwaM4H+iugSRDX4+8ky/VuerfnCZvstjq0id9gDhPWiB/MkKyQhVWu+q0GvPChW+
	Mo0Cijg8/wx6rRlimr/tZmTjQD8lfpJ9Tn1C/90WpWmP1Cwi4IkvPNiCh1gcNwaZTWuWDpkVOiG
	Fh3OUpLjeIPyr16XpY14vJyYvn+GJ01CNZXOZtdPJh+TaX36Qw+oJ1Y/UBPBku6ZxYoTdNJLLNu
	HTN1Ff4shjUBiA/0co6D/x30bp7iY2BHObhidQrNITlp
X-Google-Smtp-Source: AGHT+IGlhu2CzzIyPT/4Xs4SuTdCSDyVQF/LBTPCx5u8EgG/qGO3ektOwcMaY7F0RocF4UkJ/Asz5Nn328g1rSwFXmQ=
X-Received: by 2002:a05:690c:6186:b0:78f:a615:2739 with SMTP id
 00721157ae682-78fb418785cmr210976517b3.55.1766970521358; Sun, 28 Dec 2025
 17:08:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com> <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
 <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com> <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
 <5979c8ef-b0fa-40c8-944d-96e226fbcbe8@riscstar.com>
In-Reply-To: <5979c8ef-b0fa-40c8-944d-96e226fbcbe8@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 29 Dec 2025 09:08:30 +0800
X-Gm-Features: AQt7F2pCBTgDDH1FNzfMutsdekE-nmpYuROoap71sR-N9Z3O3k31kEU3EyBRcKQ
Message-ID: <CAH1PCMZkQ11-Uk5GnyetLkNLOuO3gs2o0WPWHrFMWVH9R6s8mQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension description
To: Alex Elder <elder@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Andrew Jones <ajones@ventanamicro.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 7:50=E2=80=AFAM Alex Elder <elder@riscstar.com> wro=
te:
>
> On 12/27/25 8:51 PM, Guodong Xu wrote:
> >> That's what I understand it to mean, anyway.
> >>     https://github.com/riscv/riscv-b
> >>
> >> There's no point in supporting "b" in devicetree to represent
> >> the others if it also requires the others to be present.
> >>
> >> I think that, instead, "b", "zba", "zbb", and "zbs" should all
> >> be allowed.
> >>
> >> I might even go further and harden the requirement, saying that
> >> if you specify "b" you should*not* specify "zba", "zbb", or "zbs".
> > Historical reasons here. "b" came too late. The chip vendors have publi=
shed
> > cores with "zba", "zbb", and "zbs"already.
> >
> > That's a migration bridge to require "b" must be listed
> > together with the other three.
>
> Are you saying "b" has already been included with "zba", "zbb", and
> "zbs" in an existing DTS file?


The risc-v ratification timeline is:
"b" was ratified in Apr/2024, which is about 2 years later than its
components zba/zbb/zbs (these were ratified in Jun/2021).

I can do this in linux kernel, writing a dts file which contains only "b",
but no zba/zbb/zbs. The linux kernel can correctly extend "b" to zba/zbb/zb=
s.
ps: after I or somebody adds the logic into cpufeature.c.

However, the problem is with the older software who reuse kernel's DTS file=
s,
and recognizes only 'zba/zbb/zbs'. (If you search in the riscv/boot/dts,
you will notice a lot platforms supports zba/zbb/zbs.)

When there is only "b", these older software may just disable the features
related to 'zba/zbb/zbs', because when they developed their feature,
"b" doesn't exist yet.

Hopefully I explained the logic clear this time.

BR,
Guodong

>
> What I'm suggesting is that (unless someone has already done this in
> a DTS file), there is no reason to require "b" *and* the other three.
> You should allow either "b" *or* all of the other three, not both.
> That would support older platforms as well as newer ones that use
> the more concise "b" only.
>
>                                         -Alex
