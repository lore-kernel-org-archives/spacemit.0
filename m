Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A52EDD57
	for <spacemit@lists.linux.dev>; Tue, 23 Dec 2025 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472692; cv=none; b=NrNAEOxMza7WfpNb2Zg3No2uSqcNIpoSLGWwTpisaroZT8Mnf0XgLsg6F2v2Xm8l4P0nhGD127QbZSPOPLAFW64nof+P3Qi6sqo/SaQlq1t97xopZ/yCXT6s+2YprgWMWWwX4hQTslvyADjPw5zpxcIODMRh96rJVGNrUOOI2PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472692; c=relaxed/simple;
	bh=zt7PxC9jqMRhgXBwX/AGR71iW50yOWx32szhdVWQqNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJOQa4VbPS1ZmlC+zkGdDaHiCvMo7Ld4+WUmc/w99vFv7uxrW+4VosZqZCyARAcP31S4LZg90CTWqTqWpYxHr5mPuHao6kR8Q3BvxLB9qInVQkhWWnyLJYE8UXlVKXI+xHW4sCt6MOto96L3qNEBz8C64NSOQRzPbQAd+g2gUU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PKJh2UOS; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PKJh2UOS"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-787da30c53dso45582987b3.0
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 22:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766472690; x=1767077490; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdzU5XgvSiFIGPVn5c2s3iuFzcmxAWxfG2aXYw1L7PU=;
        b=PKJh2UOSriocpEZQVAi/FNrm36tFEhibvdaBuMys1x63pw7xzO60x14ocAIbw64wy2
         q1qZWTuekY5NH9rUS+TcKLK2lLui3tGyYI3YDZAl76eGZiw0UI0CdO5HNa8TtRGZEVss
         5HbUtkCl5QPmKBEX0iZfIp5GRjC5ZixGlh1FiVkHiUoWOb8q2yaVtu2jERIHH1McE7QU
         OzlmBFdvP+sxJNhXUCi39VDcUux+9xkXJIlqGZCN59GuCXKPPkswXdh0tcYmbTWtVitb
         48DCc4bTTQy6oDogAOtAFYbEmGQOq9aNOQamMmrv34c6Wid7wktw5WRy6higUaQIs5Cs
         v7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766472690; x=1767077490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KdzU5XgvSiFIGPVn5c2s3iuFzcmxAWxfG2aXYw1L7PU=;
        b=dQuRbiheR00CS7wtc18dmLelQUlDkmYKxeDQyGedyeS5qLMTtHUzAzYaiDqrHm9Flt
         nCZrEh+H5guO6yHqfO46QMT2DBQhDYNyns+L+e1pHi0Mxvg4FrdgxHT2yjb9xu9aMhVx
         ASkkH2C67rDHhiV1spgpfW9gny+tsZif3N/2xyM0Bua40VbjU/QK5bsu2OqlSvMNFYg3
         5hTVrSlJN/Zvi7JAf+rJ/7qVQBCjSYf7O41iYeZePvyWKGaU7FBK2qmOQYx199wWbcpQ
         TXUrPewIbpoGroxNdJ09b3JZTll1H1MRq0RcBrKNMQyxMxQnUk+3f6tXqPB6lTgFEVP2
         Mxeg==
X-Forwarded-Encrypted: i=1; AJvYcCVhzjuO1uAJOr4vIQlxrJA7U1pdU/6nObxPMCojp4ln5/fNciAr1bD3k4G+m1oh7JhnUEdo7r4ung==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGGLLrqzLZEeFpbf+XuO8b/KX+sP5uwwHvcqhV+Nr8E5QTKQDO
	BugibW6TcqbC/6qqZ2sJ9BhQhBS6ZKOS0Amb2BN6Eg9bpvD6OPjCC6S1IO53uuLOBaOvlAI2Ys2
	AedjYREU36PwIPDLO7KTYJuZvh88mC61TET6FABpRdQ==
X-Gm-Gg: AY/fxX7iZIv5ORofcc7b35BVyYA+NbpYa+Vq0j2gDklHdLKmnrQMiTpzK+apXkdDNoJ
	D+jpRDt/q46m5qKBSysSmzbYvYjQFUzyV3lb+ATQ6p40c1wD/tk5J2WRHtsOEJBxYKYaKmwL89/
	MwgHNUPYIWqXcvxhbilKUqgXpGT6Cvx0tjR+4nCFjyjAjob/2x1hQQ3H0eoUgzsBtg+L7NVl5jE
	9p62k5gAadrkzXGgjwz+WKHbaeB3Divxacg5rd6dS09BRJr4JnPWlUoBvpm8Y4IuYXPjIUFRFns
	7cbP607wGu4smhvM5Pd9yKmsqotGpmDzdIDSCboGA6up
X-Google-Smtp-Source: AGHT+IGmNL6n/ktYY2P21hGRyNmyBz5VgQU71rfGMPE6y6iiO2YzF6JGopeHStmIJhtnYXIbFejF+LdxNejU6VCR4HE=
X-Received: by 2002:a05:690c:6f92:b0:786:4860:21fd with SMTP id
 00721157ae682-78fb41326bdmr118736627b3.39.1766472689846; Mon, 22 Dec 2025
 22:51:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com> <20251222-stitch-preachy-3fab87fd6f0f@spud>
In-Reply-To: <20251222-stitch-preachy-3fab87fd6f0f@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 23 Dec 2025 14:51:17 +0800
X-Gm-Features: AQt7F2qxl92KhTNHz3KM52pS5CS3ViVH81hlxdbPGwD2ui8M3XvqUbTJbg__Zy0
Message-ID: <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
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

Hi, Conor

On Tue, Dec 23, 2025 at 5:17=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Dec 22, 2025 at 09:04:17PM +0800, Guodong Xu wrote:
> > Add description of the single-letter "B" extennsion for Bit Manipulatio=
n.
> > B is mandatory for RVA23U64.
> >
> > The B extension is ratified in the 20240411 version of the unprivileged
> > ISA specification. According to the ratified spec, "the B standard
> > extension comprises instructions provided by the Zba, Zbb, and Zbs
> > extensions.
> >
> > Hence add a schema check rule to enforce that B implies Zba, Zbb and Zb=
s.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2: New patch.
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml         | 19 +++++++++++=
++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 565cb2cbb49b552959392810a9b731b43346a594..385e1deb23996d294e76626=
93f1257f910a6e129 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -109,6 +109,13 @@ properties:
> >              The standard C extension for compressed instructions, as r=
atified in
> >              the 20191213 version of the unprivileged ISA specification=
.
> >
> > +        - const: b
> > +          description:
> > +            The standard B extension for bit manipulation instructions=
, as
> > +            ratified in the 20240411 version of the unprivileged ISA
> > +            specification. The B standard extension comprises instruct=
ions
> > +            provided by the Zba, Zbb, and Zbs extensions.
> > +
> >          - const: v
> >            description:
> >              The standard V extension for vector operations, as ratifie=
d
> > @@ -735,6 +742,18 @@ properties:
> >          then:
> >            contains:
> >              const: f
> > +      # b comprises the following extensions
> > +      - if:
> > +          contains:
> > +            const: b
>
> What's the value in adding b, if it depends on having all 3 of the
> components defined individually too? Currently all "superset" types of
> extensions are permitted without their component parts also being defined=
,
> this doesn't follow convention and therefore needs to be explained.
>
> You obviously need this construct because the kernel does not understand
> "b", and even if you added support for interpreting "b" to the kernel
> this is probably still needed to make sure the ABI is maintained for
> anything importing a devicetree from the kernel.

Yes, exactly. Unlike other single-letter extensions, "b" was ratified
(Apr/2024) much later than its components zba/zbb/zbs (Jun/2021).
Existing software and the kernel already expect these explicit component
strings, so enforcing this dependency ensures cores declaring "b" will
also be correctly understood by older software that only looks for
zba/zbb/zbs.

I will update the commit message in v3 to clearly explain this reasoning.
Does it sound good to you?

Thank you for the review.

BR,
Guodong Xu

>
> > +        then:
> > +          allOf:
> > +            - contains:
> > +                const: zba
> > +            - contains:
> > +                const: zbb
> > +            - contains:
> > +                const: zbs
> >        # Zcb depends on Zca
> >        - if:
> >            contains:
> >
> > --
> > 2.43.0
> >
