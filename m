Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2CF2BDC3D
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 03:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765942723; cv=none; b=kj7UVwxtc7vfrncwftnjpeYrbefaTIzdPJD6plCKoe8aZYDg8ox11kW38GgOQPpv80O7VVLO+YLLnzLwTpstF6rOuHOfQ2r8PfbhYY0vJS4GVA589Elgg1l4DJGsTTUbpJFEkr8RHeAxKMF3zvALTp8TBfelxcTt9JSTYhGVeXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765942723; c=relaxed/simple;
	bh=W2Q0HgCNapgVc0CETYI43MiykhR8+/4vfvNL82lfLCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEcfQDViw5FhPIqJDJskT9AlNRRZvfPknrbCakBUAaetUggfgu4htvV06+T6OvzqtXacRWEBeevnmRFs+ctef8b+eRRis1iW4NylT8Th6rDP4Cd4RZvA2SEtkJOpO62NAdulvrME18/F+fkQVBRL7+iqiEfYbopARkgLJPDYSSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ggkU4mk9; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ggkU4mk9"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-787d5555274so54635447b3.1
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 19:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765942720; x=1766547520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TH6F5a+vmttqLO62jmTQVj+LKt91ZrffUns0UWLXns=;
        b=ggkU4mk9cc2G2y/SBFBL1i0skYE9oUPCHf8JB/Yyg8QBRD6tPYKDqVFnZV4fb+w1NG
         M0RfC8bAGsKgWmuzuIUYsfNwEu9MFQ2oWlit7SlmmWJU3BncYHSsCQbleX671DMB1QTL
         1eb2Q3H/Imi6axuLkx4CkKkwI9OSz4EawTkWl4sZfeSC5laLcd7M1KEyaFDHLFvL2dP3
         d2Mo/GfvPnOQbSFrRAUKj9a/hmaZP4D70X5bjFybAqLV50u+qNM+PU9r8v+mfd5MmIAL
         kZCfU0252YvhUSl1NwVZXAkvcGnIlr63iWWrsWWHCwb7us0g/OWzMI9l6RSrSnjPlYc9
         ctJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765942720; x=1766547520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7TH6F5a+vmttqLO62jmTQVj+LKt91ZrffUns0UWLXns=;
        b=Q5stL4o2WH0P0/TTVVfOruRLj6+QCuAYXRVz7d1K16R2fdZDHkicN174riqunHoRya
         Kt50gtUD89AuC7LR0BJi7g8hUwb8HlgvyXnhYAZhoVrDpX1rgEJ6mcq4eOQ0DYrWOO2S
         EVMEuPzOtU7/C7gj6k2wgsS9vSDKrmWYpuvGwBIe3TecsXPww7O/Sv5f9u1/1ZKl9hn2
         77V3jOBC90RzbKg4iGzXjYgny7QYCjH4N3gseY4EPmVz4caDQVR1pVhUrazdJGe1Bm6u
         4K+vYOpSQ1sGGFq2zHE4DbUVgW6xD+taezgfxydy9verp+mgv9M6PKnwhSlF14JtH9MZ
         wFug==
X-Forwarded-Encrypted: i=1; AJvYcCXVzxwvmv+b+hmBBwJMdaJBMbsCdWz0yFZffkqFrMtp7rdDXChYzrxs/lhKZgsEpil4UNCh9pnIhg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk0cQe3iD5d7I8mphNctuP1KDrc33Pt+5evNfyZqPc823Qf9bb
	t4P3XEzUV5mnhJq5CZV7jNj5L44pq1WIW9IsdKkAY22a5OVJkUX6XVY41heMctW0Z8n4zFiHwBp
	L++ig7uKml92XNaeol5FbULWDcr8T7pdZ+CSghArcGg==
X-Gm-Gg: AY/fxX6xmSzAuBcvvyM13jtoDuzPrHRizFOLz3AUy/6smeXAojpcpnFZlyHXXL/WBSy
	zktFKk69j4lQY++9J0l29ScVqOuDLu1ECKC8Djq9ODlLYZQ3dvs01josKtPCv/2RqKYFe5Pw91L
	cPCTC3y2Vs+GnSmmkQwn8/kBpif9kesBglXaeJteqDdWuRC7NacRRaZkGiZzyERIQJROreAgI2l
	rA10iL4DDlSpJqg7P551M0tI0FoowyWOanTJNOchaXQeMU9xE9S0E86Lq/X6itB3h0bKUxWsxFy
	im3eKGujc9OVeReunZQ1wjP7akcYTkRyUxozorSwvQtwTp4X5HF0VG4=
X-Google-Smtp-Source: AGHT+IGa7io/fWTaKLPtHu4hL2REwdTwIrx+nIg3I9tnzS6/9scQa0HmxED/Tl79m0mGkX+RuCXaoxmwdtXcYdb4V4k=
X-Received: by 2002:a05:690c:6c8d:b0:787:ef99:1e82 with SMTP id
 00721157ae682-78e66e50910mr129319847b3.38.1765942720296; Tue, 16 Dec 2025
 19:38:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com> <20251216151602-GYB1937017@gentoo.org>
In-Reply-To: <20251216151602-GYB1937017@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 11:38:28 +0800
X-Gm-Features: AQt7F2pID3WWQ9Vri5EMfO_v0JvS2MCRf6LsnJZs9APTGewWq7PKaU-MP0eF9bU
Message-ID: <CAH1PCMZ7rA50ns6EFfX2BcouVYX6L+mYkUSYeGjp+fPNLc62gA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 11:16=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 21:32 Tue 16 Dec     , Guodong Xu wrote:
> > Add compatible string for the SpacemiT X100 (RVA23 compliant) core.
> >
> > Link: https://www.spacemit.com/en/spacemit-x100-core/
> it would be better if you can put more description into commit message
> as I don't trust the link too much, it may vanish or change in the future=
?..

Thanks Yixun for the feedback.
I understand your concerns. I will expand the commit message with more
information about X100 core features so we don't rely solely on the link.

>
> besides, if I remember correctly, there are still few optional
> extensions that not supported by x100, it's worth to list here to
> let community know..

I would prefer not to list the unsupported optional extensions explicitly.
Basically there are two reasons. Since the RISC-V specification includes a
vast number of optional extensions, and they are categorized in four groups
(localized options, develpment options, expansion options, and transitory
options), listing everything not supported would be quite lengthy IMHO.
Secondly, looking at previous commits for other RISC-V CPUs, it doesn't see=
m
to be the convention to list unsupported extensions.

I will expand the commit message to state X100 supports all _mandatory_
extensions per defined by the RVA23 profile.

I hope this approach is acceptable.

BR,
Guodong

>
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docume=
ntation/devicetree/bindings/riscv/cpus.yaml
> > index d733c0bd534fb63ed7c0eada97c42832431f1fc1..cce87092dc7749f49066154=
d9a256af6c7b6c19f 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -62,6 +62,7 @@ properties:
> >                - sifive,u74
> >                - sifive,u74-mc
> >                - spacemit,x60
> > +              - spacemit,x100
> >                - thead,c906
> >                - thead,c908
> >                - thead,c910
> >
> > --
> > 2.43.0
> >
>
> --
> Yixun Lan (dlan)
