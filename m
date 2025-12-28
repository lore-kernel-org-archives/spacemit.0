Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2575230274
	for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 04:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766895023; cv=none; b=Ah8upBhjZWd+8zt73WG3vWcup9L6yoySb7rxIyTpU5Z0FcTasMm1LPcofR1N2KVA1kQ/36gUC/umBmdn23u/MkA6WIHRHHbJafLz3NfDl3rdZ+tcaevd7koF6VmjI/ra0E/zdn9sF2LkRbp+3hCfLVbNSoX5j5xeImNcRFWehqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766895023; c=relaxed/simple;
	bh=Y1emrghzQ446cTazggAL2Ikr5dFt3P5nfDNPSdcs+zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRFaGbrxsxX1A2rybOjwzl52JrqF2q1IsATvM3ot8TdH8mk2TbreL+SldLTkzQOorVQ45C446p9kMldbkNNvEhwM/7te4ZRK6FPRugwoLaV1Xlev4wtTkScnhnBJRfKTG1fIGYOfCQqdgcwe+4NWRLuXxT59EXjIfJZPKmxi+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UW2Y0c6K; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UW2Y0c6K"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fc3572431so54349837b3.0
        for <spacemit@lists.linux.dev>; Sat, 27 Dec 2025 20:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766895020; x=1767499820; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYQTmOEvCTg5zOnjlVewjU7fn8vrfdfmiWmcD8PbMNc=;
        b=UW2Y0c6Kt+CJ39LysxvkYNadlfTE8iM0lEsA4tWnPsFoNM5G1gAlkw1TIvKa4FJMyj
         vcFi2J7MiPrzfP//qm+WNSrCn53+IuPuUznrtVmHw4CNs+dsEv9VrzacDGxTon0XgmjG
         +elnwcYoKWQegbK2eXNmuhSfuXKmFNV7u7Cp1WjLnDPTFd6GMBBmLK70dmMFoew8AhiZ
         y6x57y+mJ3fKW856bMRngZhi0ok2rW+S9jsBCJW1773FC4XHKH/OAKh04ijdD8c4dAoN
         rFkLr3w9DdV0uVX/Hz6uFl9pEcf1SPpiiZJiTK574hR4M7uj+X/EVc97+YapW8o0SbeJ
         Ykrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766895020; x=1767499820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KYQTmOEvCTg5zOnjlVewjU7fn8vrfdfmiWmcD8PbMNc=;
        b=Ud7U83446Ui/AHgLbaxFJ9DPNupmCBj4wX+5l9TNRkt9Jw96mv24+EqLYoaImBprwB
         UJJo2WDt1F6Lw0U+txWvxlimSia66apYZURk19jx0Y9WY+axm+zs8GAyqPgB0V9aShQL
         VRArfVRzYxD35+ZsMYAFWx1F6VWeqCqxNt88P4/TyW1F/hP3ilx7Nwl5ga7G12wdFHsU
         Wu496mMJg+kPiADhCcokeEMvhbEPojeqNrdQ88jk4WcKt+XgVgKt+mVBcW3SyeHs1rJJ
         imeYI7yd+Zf6wQigEWYswG//UpeqQxdw7ZZsMmJD5pteaiiXpSahL0/va4YpK5E/i1qr
         PWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFt9EaLBidcHOVmPdjrfUV7DdJqgoWi3aS1N79ufHer9XcLZVV05R5Mught5bVO5bXSvo4HYxePg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzM+LBIeAH1cO9KwFUnzB6o3YsH/I3yO9BY6BpLPcxq9o98RTlT
	8gwlHkSbxfTjkq02q4i4IvuCnP7kAO/MrFef6vCKwfzyi2/kKBiSVP05PLHwcUpTfI+OiY9NBX9
	C5/ZXMciLASwAv9tmGU/lqQ3HWDzIXlRtNRILsio9Cg==
X-Gm-Gg: AY/fxX5v+0gbCCT7drSHUHBM2EPJVL4NDmT+/jE6RWFBAXuMRKLavOBYLDzMXXdQuKc
	F/p7U/t97HzA943GiXUe6IKTUgqlvGVysmDlKjfHCa27cuxVhfHdfPp+xmnIYeUtxo28gd7kE/K
	3WgzdOWSQ2srFOco5R5NH7y5yiDFBkq/hlqnntHGc0vj0dbJrS3B7miYI6L2F8ZNBoEx6dxfEBp
	6/g/lXvGBr4BveGxT06btjjgPyusZEIZ9pZos39fKiM7olvSB3wQpArOwtrgL3slC3AFqu2xyVa
	8OSlmWhyPjhiyJGI+MRoYECbzfQKdXHzbn6RcoFMx7nL
X-Google-Smtp-Source: AGHT+IG46NgK9y9QKj8oQ8QLJqV80dKpRxBpeGdjhI1dUkzBHEWrcHPtUyhN7J/JFcbtIolhCAlFSf0270uhaTRZVe0=
X-Received: by 2002:a05:690e:1919:b0:63f:b0a3:73fb with SMTP id
 956f58d0204a3-6466a832133mr22415150d50.17.1766895019753; Sat, 27 Dec 2025
 20:10:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com> <8851c155-300a-4241-a5be-5163ba54e47c@riscstar.com>
In-Reply-To: <8851c155-300a-4241-a5be-5163ba54e47c@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 12:10:08 +0800
X-Gm-Features: AQt7F2rx_Lmf-wfT-QuPD0GazjJ02G8YJfuGPFq6fzyh00GF4d5M4vFgbdHaNfM
Message-ID: <CAH1PCMatKR4rHuBdw0fih5P8naE=KU4Vp5-KNjeDeO-LsEe81g@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
To: Alex Elder <elder@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Alex, Conor

On Sat, Dec 27, 2025 at 5:28=E2=80=AFAM Alex Elder <elder@riscstar.com> wro=
te:
>
> On 12/22/25 7:04 AM, Guodong Xu wrote:
> > Add descriptions for four extensions: Za64rs, Ziccamoa, Ziccif, and
> > Zicclsm. These extensions are ratified in RISC-V Profiles Version 1.0
> > (commit b1d806605f87 "Updated to ratified state.").
>
> I think stating the RISC-V profiles commit ID here (in the commit
> header) is good.
>
> I do *not* think it's necessary to include it in the descriptions
> for the extensions, below, but I seem to be late to the party in
> expressing this opinion...
>
> That commit ID is related to this repository:
>    https://github.com/riscv/riscv-profiles.git
>
> I have a few other comments below but generally I think what you
> did looks good.  I have one overall question though.
>
> > They are introduced as new extension names for existing features and
> > regulate implementation details for RISC-V Profile compliance. Accordin=
g
> > to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, they are

Thank you for the review.

Together with the filenames, I also listed the Version numbers.

These are officially released versions of profile documents. I mean they
won't be changed without modifying the version number.

> > mandatory for the following profiles:
> >
> >   - za64rs: Mandatory in RVA22U64, RVA23U64
> >   - ziccamoa: Mandatory in RVA20U64, RVA22U64, RVA23U64
> >   - ziccif: Mandatory in RVA20U64, RVA22U64, RVA23U64
> >   - zicclsm: Mandatory in RVA20U64, RVA22U64, RVA23U64
>
> I did not verify your statements about where these are
> optional and mandatory, but I assume they're correct.

Yes they are correct. As far as what stated in the two profile documents.

>
> > Since Ziccamoa depends on the 'A' extension, add a schema check to
> > enforce this dependency.
>
> All of these extensions are related to atomic operations, right?
> Don't *all* of them (not just Ziccamoa) depend on the A extension?


Za64rs and Zicclsm: no, they are not 'A'. They are cache related.

Ziccrse and Ziccamoa: yes, they are 'A' related.

Ziccrse specifies the main memory must support "RsrvEventual", which is one
(totally there are four) of the support level for Load-Reserved/
Store-Conditional (LR/SC) atomic instructions.

And in RVA profiles, two named features (exts) are added:
Ziccrse: which further define the level of LR/SC operations being supported=
.
Ziccamoa: which further define the level of AMOs instructions being support=
ed.


We already know that "A" =3D Zaamo + Zalrsc;

In summary, the dependencies among these extensions are:
Ziccrse -> Zalrsc -> A;
Ziccamoa -> Zaamo -> A;

> Furthermore, the A extension is already mandated by RVA23U64, so
> is it really necessary to add this logic?

Hi, Conor

What do you think? I am kind of agree with Alex to remove the schema
checking logic.

Leaving the dependency check to riscv/cpufeature.c, let the .validate call
do the job. If you agree, I can remove the schema checking logic on Ziccamo=
a
and A in my next version.

Btw, cpufeature.c validate() deserves another patch/patchset.
I'll be happy to add that if we reach a consensus here.

>
>
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2: New patch.
> > ---
> >   .../devicetree/bindings/riscv/extensions.yaml      | 34 +++++++++++++=
+++++++++
> >   1 file changed, 34 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 385e1deb23996d294e7662693f1257f910a6e129..a6b9d7e3edf86ecfb117ba7=
2e295ef097bdc9831 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -237,6 +237,12 @@ properties:
> >               as ratified at commit 4a69197e5617 ("Update to ratified s=
tate") of
> >               riscv-svvptc.
> >
> > +        - const: za64rs
> > +          description:
> > +            The standard Za64rs extension for reservation set size of =
at most
> > +            64 bytes, as ratified in RISC-V Profiles Version 1.0, with=
 commit
> > +            b1d806605f87 ("Updated to ratified state.")
>
> The more complete description says:
>
>      Reservation sets are contiguous, naturally aligned, and a maximum
>      of 64 bytes.
>
> But as I read on (below) I suppose using the more succinct description
> from the glossary might be best, forcing people who care to go look

That is exactly what I am doing.

> at the reference documents.
>
> > +
> >           - const: zaamo
> >             description: |
> >               The standard Zaamo extension for atomic memory operations=
 as
> > @@ -378,6 +384,27 @@ properties:
> >               in commit 64074bc ("Update version numbers for Zfh/Zfinx"=
) of
> >               riscv-isa-manual.
> >
> > +        - const: ziccamoa
> > +          description:
> > +            The standard Ziccamoa extension for main memory (cacheabil=
ity and
> > +            coherence) must support all atomics in A, as ratified in R=
ISC-V
> > +            Profiles Version 1.0, with commit b1d806605f87 ("Updated t=
o
> > +            ratified state.")
>
> Similar comment here (but also with a similar caveat):
>

I am using what the RVA23 Profile defines:
"Ziccamoa: Main memory supports all atomics in A"

I prefer to keep it as is.

BR,
Guodong

>    Main memory regions with both the cacheability and coherence PMAs
>    must support all atomics in A.
>
> And I might say "the A extension", but maybe that's a bad idea.
>
> > +
> > +        - const: ziccif
> > +          description:
> > +            The standard Ziccif extension for main memory (cacheabilit=
y and
> > +            coherence) instruction fetch atomicity, as ratified in RIS=
C-V
> > +            Profiles Version 1.0, with commit b1d806605f87 ("Updated t=
o
> > +            ratified state.")
> > +
> > +        - const: zicclsm
> > +          description:
> > +            The standard Zicclsm extension for main memory (cacheabili=
ty and
> > +            coherence) must support misaligned loads and stores, as ra=
tified
> > +            in RISC-V Profiles Version 1.0, with commit b1d806605f87 (=
"Updated
> > +            to ratified state.")
> > +
> >           - const: ziccrse
> >             description:
> >               The standard Ziccrse extension which provides forward pro=
gress
> > @@ -795,6 +822,13 @@ properties:
> >           then:
> >             contains:
> >               const: f
> > +      # Ziccamoa depends on A
>
> Maybe more than just depends on the A extension.
>
>                                         -Alex
>
> > +      - if:
> > +          contains:
> > +            const: ziccamoa
> > +        then:
> > +          contains:
> > +            const: a
> >         # Zvfbfmin depends on V or Zve32f
> >         - if:
> >             contains:
> >
>
