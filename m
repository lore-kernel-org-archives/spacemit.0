Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D032C187
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 00:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767056228; cv=none; b=GX5yZyUBZLYtIG4vk7FG9uX9q/4uA2ODBInNRwXt8sfkaj4LSlrXhx8qinyQH9d3pXFZuehj9at9RJW08YyjD26zrKvix8KQBOSkI/7X4hsEa78Ql6DyJ5ZDYuxVcQ7sJziRA1PK0rMf1Ytzi3CjlYlp/4hPysfSbsiWcC+SUBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767056228; c=relaxed/simple;
	bh=sE8b3IumfaKFKJQLuFVtn5oJy+2Nb8sWyrgWfQ95I8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clRFpw3CydXKUDP2UyUuRd8vhC8/Iu4hbdvF59GxCMjdMXn7NVG6wCs21zk3Zsg22Lh/WxCI7bsB0dPbHhwmQ6aysNPn6q0XemsDM6uhr/zZuLxeyDesJRWMIo7QKiUWRRyii43vXWp1GNuhdQwRpGMG0YB5JQJ/+uxBqVkKf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HQUAEzQG; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HQUAEzQG"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6442e2dd8bbso6626033d50.0
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 16:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767056225; x=1767661025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QaQUqBrCThJUkV4NZc52M6yJ8UuzgbQbqNLvgQLbZA=;
        b=HQUAEzQGs0sJ2afQoJGLFqfSKTzh1rksybUgaD6mmXNXqo0EHs5dBDUi7VienYtuPc
         2R0NxC0rTcWPQUP2wS2bDl18PWqR5HyFsCE9utXiwOUV0mMlSXJ5jaMyKNH608wITp4/
         f54+1NQnI8LdjVj9kJGH7B1tFpz66aOCjCbcS3Cm7ZH2BAcjYe5V9XeKvn2NNicaerb7
         1tk69sPo+VVH99fPeoVV0JuqL8qqXn5kwawvwwfqaKaxv0VprLTIGYStjS9h684CC5jX
         gyY/8hqECQpxQfwrOxPWyn7CmU2sNbpUXpMLKIZy71l6kk/i9Hd2mIBdTE5M3NGMD+sP
         jBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767056225; x=1767661025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2QaQUqBrCThJUkV4NZc52M6yJ8UuzgbQbqNLvgQLbZA=;
        b=WXZG0+Ml571rGAyh/G+JHzhvEpAlWU/Tq1AsyXyYJ5XZjTRoCutE+8wW7ZksIvdJat
         CD+E1Ct1g8Cz0Bm1PmEl8SCHsu+io1DJbg9YAa7ysrMxQCfyKO5Hd4Wtx4NNVUp0S/xU
         /5FwZuFpkw6imEB1nw9cB1vLdMevkwAu4MQVXJMQUmWiGUYNgYjNtBLsZ0Gpp70VH37K
         ytk8rsynEzd4wdQy5HMh3yBTCbKLPivwknt0Vi0HzB2DECkzWuOdNHIeO0ehJzoJg4/i
         KrM9fmroH8KDX86DTBd51KV1E/9L/ju1ve45iK+6C0NsvpYvGTsEdYMiHVpTHGlUYBEG
         5pjA==
X-Forwarded-Encrypted: i=1; AJvYcCWSfPZfW/xm2coYHMHVYBdoDJcehVqr++3x+dGL/XO1Kvpzf+jkyumBMWy8hzMd7VRpzWlceVbl2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkKGh048h7/eWReWqxIgv3aETqBjlZC76EDxrwa3IQUHSrb0nV
	LNq6CfkN9eXf3wWGeurLvOt4Y4q01FF7CX3sjLt+FuwSrSbV3SSD8K7y/+4XQsQ8qhtQFyMnqJX
	hhdBRzyRjmUOCOcqfAqz92ajqa1qUXLOWp++p6NKlMQ==
X-Gm-Gg: AY/fxX6YnppuQ9d6mutxcbTj2+vk/Z4LXzNVFUaKRAiEyqF4dwsw8iOsLU1Dv/hjAao
	bf4cYS8FBQOiIxRiQCOi8daAy9LfQepBTxPib2PJIGk2+ZtAvGaN12aegMdpuA6wVRbjUS0jVrm
	tUa8SvsSG8a4BlxC7xQZr785Wgf4HvC0m+QS0q23g2nHI8txXV1ls7dQlwuP4OlYv78nRrd4Lbe
	8Npg8ppCws+yQAtiR7ci+Jf6/TUoZ7QlqQElXUvDUPSGfXmDSY6zABZIueuSnCS4stF4xfF9E7Q
	SgQPqXQGgDo65uPhtrTYME8ReGY/Q7DX1jGt0WeATpTP
X-Google-Smtp-Source: AGHT+IGtgvmkjxjySHzrMKMzf7ydD2MyhqhUqgAeNk1vTThMPHHyGCMfOECW0tMt6TrETjysrldkzMADoeZ+r5ghL4Q=
X-Received: by 2002:a05:690e:1509:b0:63f:b9b3:9c3 with SMTP id
 956f58d0204a3-6466a899e88mr23263087d50.31.1767056225455; Mon, 29 Dec 2025
 16:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com> <8851c155-300a-4241-a5be-5163ba54e47c@riscstar.com>
 <CAH1PCMatKR4rHuBdw0fih5P8naE=KU4Vp5-KNjeDeO-LsEe81g@mail.gmail.com> <50559ab9-c537-4796-9538-495bf3d14069@riscstar.com>
In-Reply-To: <50559ab9-c537-4796-9538-495bf3d14069@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 30 Dec 2025 08:56:54 +0800
X-Gm-Features: AQt7F2r30p17rJXlEGFv4xhSDXFsf2rOy_LSxq4J2RPG4AjiELxrr4KTvSbpnj0
Message-ID: <CAH1PCMYX8RSy6pdUwANycxzjX_sfrnvjOFVysAFMFsv2Q8P3jw@mail.gmail.com>
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

On Mon, Dec 29, 2025 at 7:50=E2=80=AFAM Alex Elder <elder@riscstar.com> wro=
te:
>
> On 12/27/25 10:10 PM, Guodong Xu wrote:
> > Hi, Alex, Conor
> >
> > On Sat, Dec 27, 2025 at 5:28=E2=80=AFAM Alex Elder <elder@riscstar.com>=
 wrote:
> >>
> >> On 12/22/25 7:04 AM, Guodong Xu wrote:
> >>> Add descriptions for four extensions: Za64rs, Ziccamoa, Ziccif, and
> >>> Zicclsm. These extensions are ratified in RISC-V Profiles Version 1.0
> >>> (commit b1d806605f87 "Updated to ratified state.").
> >>
> >> I think stating the RISC-V profiles commit ID here (in the commit
> >> header) is good.
> >>
> >> I do *not* think it's necessary to include it in the descriptions
> >> for the extensions, below, but I seem to be late to the party in
> >> expressing this opinion...
> >>
> >> That commit ID is related to this repository:
> >>     https://github.com/riscv/riscv-profiles.git
> >>
> >> I have a few other comments below but generally I think what you
> >> did looks good.  I have one overall question though.
> >>
> >>> They are introduced as new extension names for existing features and
> >>> regulate implementation details for RISC-V Profile compliance. Accord=
ing
> >>> to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, they a=
re
> >
> > Thank you for the review.
> >
> > Together with the filenames, I also listed the Version numbers.
> >
> > These are officially released versions of profile documents. I mean the=
y
> > won't be changed without modifying the version number.
> >
> >>> mandatory for the following profiles:
> >>>
> >>>    - za64rs: Mandatory in RVA22U64, RVA23U64
> >>>    - ziccamoa: Mandatory in RVA20U64, RVA22U64, RVA23U64
> >>>    - ziccif: Mandatory in RVA20U64, RVA22U64, RVA23U64
> >>>    - zicclsm: Mandatory in RVA20U64, RVA22U64, RVA23U64
> >>
> >> I did not verify your statements about where these are
> >> optional and mandatory, but I assume they're correct.
> >
> > Yes they are correct. As far as what stated in the two profile document=
s.
> >
> >>
> >>> Since Ziccamoa depends on the 'A' extension, add a schema check to
> >>> enforce this dependency.
> >>
> >> All of these extensions are related to atomic operations, right?
> >> Don't *all* of them (not just Ziccamoa) depend on the A extension?
> >
> >
> > Za64rs and Zicclsm: no, they are not 'A'. They are cache related.
>
> Isn't a Za64rs reservation set related to atomic operations,
> though?  They are related to load-reserved/store conditional
> instructions, which are introduced in the atomic instructions
> section.

Yes, you are right. Let me update the relationship:
Za64rs defines a hard's reservation set implementation detail.

It is consumed by two extensions: Zalrsc and Zawrs.

Za64rs -> Zalrsc -> A
Za64rs -> Zawrs -> Zalrsc -> A

I would say maybe all these relationships deserve to be validated in
cpufeature.c (so far, they are not.)

BR,
Guodong Xu

>
> I was mistaken about Zicclsm, that's related to unaligned
> accesses, but does not apply to atomic operations.
>
> > Ziccrse and Ziccamoa: yes, they are 'A' related.
> >
> > Ziccrse specifies the main memory must support "RsrvEventual", which is=
 one
> > (totally there are four) of the support level for Load-Reserved/
> > Store-Conditional (LR/SC) atomic instructions.
> >
> > And in RVA profiles, two named features (exts) are added:
> > Ziccrse: which further define the level of LR/SC operations being suppo=
rted.
> > Ziccamoa: which further define the level of AMOs instructions being sup=
ported.
> >
> >
> > We already know that "A" =3D Zaamo + Zalrsc;
> >
> > In summary, the dependencies among these extensions are:
> > Ziccrse -> Zalrsc -> A;
> > Ziccamoa -> Zaamo -> A;
> >
> >> Furthermore, the A extension is already mandated by RVA23U64, so
> >> is it really necessary to add this logic?
> >
> > Hi, Conor
> >
> > What do you think? I am kind of agree with Alex to remove the schema
> > checking logic.
> >
> > Leaving the dependency check to riscv/cpufeature.c, let the .validate c=
all
> > do the job. If you agree, I can remove the schema checking logic on Zic=
camoa
> > and A in my next version.
>
> Yes I think this is a better way to handle it.  Conor?
>
> > Btw, cpufeature.c validate() deserves another patch/patchset.
> > I'll be happy to add that if we reach a consensus here.
>
> Yes I think you should do this once there is concensus.
>
>
>
> >
> >>
> >>
> >>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> >>> ---
> >>> v2: New patch.
> >>> ---
> >>>    .../devicetree/bindings/riscv/extensions.yaml      | 34 ++++++++++=
++++++++++++
> >>>    1 file changed, 34 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> index 385e1deb23996d294e7662693f1257f910a6e129..a6b9d7e3edf86ecfb117b=
a72e295ef097bdc9831 100644
> >>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> @@ -237,6 +237,12 @@ properties:
> >>>                as ratified at commit 4a69197e5617 ("Update to ratifie=
d state") of
> >>>                riscv-svvptc.
> >>>
> >>> +        - const: za64rs
> >>> +          description:
> >>> +            The standard Za64rs extension for reservation set size o=
f at most
> >>> +            64 bytes, as ratified in RISC-V Profiles Version 1.0, wi=
th commit
> >>> +            b1d806605f87 ("Updated to ratified state.")
> >>
> >> The more complete description says:
> >>
> >>       Reservation sets are contiguous, naturally aligned, and a maximu=
m
> >>       of 64 bytes.
> >>
> >> But as I read on (below) I suppose using the more succinct description
> >> from the glossary might be best, forcing people who care to go look
> >
> > That is exactly what I am doing.
> >
> >> at the reference documents.
> >>
> >>> +
> >>>            - const: zaamo
> >>>              description: |
> >>>                The standard Zaamo extension for atomic memory operati=
ons as
> >>> @@ -378,6 +384,27 @@ properties:
> >>>                in commit 64074bc ("Update version numbers for Zfh/Zfi=
nx") of
> >>>                riscv-isa-manual.
> >>>
> >>> +        - const: ziccamoa
> >>> +          description:
> >>> +            The standard Ziccamoa extension for main memory (cacheab=
ility and
> >>> +            coherence) must support all atomics in A, as ratified in=
 RISC-V
> >>> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated=
 to
> >>> +            ratified state.")
> >>
> >> Similar comment here (but also with a similar caveat):
> >>
> >
> > I am using what the RVA23 Profile defines:
> > "Ziccamoa: Main memory supports all atomics in A"
> >
> > I prefer to keep it as is.
>
> That's fine.  I don't think I felt strongly about any of the things
> I said about the exact wording used here.
>
> Thanks.
>
>                                         -Alex
>
> > BR,
> > Guodong
> >
> >>     Main memory regions with both the cacheability and coherence PMAs
> >>     must support all atomics in A.
> >>
> >> And I might say "the A extension", but maybe that's a bad idea.
> >>
> >>> +
> >>> +        - const: ziccif
> >>> +          description:
> >>> +            The standard Ziccif extension for main memory (cacheabil=
ity and
> >>> +            coherence) instruction fetch atomicity, as ratified in R=
ISC-V
> >>> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated=
 to
> >>> +            ratified state.")
> >>> +
> >>> +        - const: zicclsm
> >>> +          description:
> >>> +            The standard Zicclsm extension for main memory (cacheabi=
lity and
> >>> +            coherence) must support misaligned loads and stores, as =
ratified
> >>> +            in RISC-V Profiles Version 1.0, with commit b1d806605f87=
 ("Updated
> >>> +            to ratified state.")
> >>> +
> >>>            - const: ziccrse
> >>>              description:
> >>>                The standard Ziccrse extension which provides forward =
progress
> >>> @@ -795,6 +822,13 @@ properties:
> >>>            then:
> >>>              contains:
> >>>                const: f
> >>> +      # Ziccamoa depends on A
> >>
> >> Maybe more than just depends on the A extension.
> >>
> >>                                          -Alex
> >>
> >>> +      - if:
> >>> +          contains:
> >>> +            const: ziccamoa
> >>> +        then:
> >>> +          contains:
> >>> +            const: a
> >>>          # Zvfbfmin depends on V or Zve32f
> >>>          - if:
> >>>              contains:
> >>>
> >>
>
