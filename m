Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4FA261B8A
	for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766925100; cv=none; b=miC3ZpCAIp0R4oQoM+rOPau/r3rd5g1IE1HPJys1NxNlfTkyJSvl3pLFVldUgioRU6rcZNXryrpraZBNijZbKQAA1t79zKkYsp+HbW0J6coC2EwIGhLeUimmbgHAa9+P6fb/jxMkgMO/jhYPYnZTmiXoEMG69uk5+f5/Uwj0LL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766925100; c=relaxed/simple;
	bh=qeloQNkgoFzHRf2+bvttT0CRSzCjlodfLarLpyHPNK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u86oeYRNv5qXV2VpXe+VUOKWA3Wk7FtDZf2ogZlXgKsKDXBTmh3wiz4q8Vmc//0gInaSl0iZXngayiY6kHCbNdLx0jFKtSm+mmo2l0n/y6BbsmiwKozGvBcHFM6w87A6cMzeydV6tWdNXnfF7cHHhxbINB1z5BP6PcYO6v5varM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=IfIztehu; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="IfIztehu"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64471fcdef0so6533478d50.1
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 04:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766925096; x=1767529896; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFUKZn4JEgcN7upzMO/UdzXH12MA1Fvm3drRZqBFE/g=;
        b=IfIztehuGaN15eyhrpJ/fnjy/obw/z21+MR/kteLC4x7VKd+oHe9XfI/lKaTVE8/D3
         6MLB8k83/JryIJIr4bNBUkrzpJa+D0BeJ9WZOmYObWowTOvCvmJKLDYd83tSr7nP2jMA
         Hmbdw4dbVUTJCZX/m2Nci0ofFrKtr82gtklNRDSJcO8Eus5ldJ0sI1IXaTkovvTb6AnP
         h5dq5JPTfjZdKXjYAtX6lVrxtVWjZCiaL7zXRX3No1/5sJJUBAe+GJLeTrOiGzqYBsbB
         udfdZQhlEKuXclMxm2Oaa45uSkTwiwxvQPUf1/GtnBo68ITdvK8glq71WpUuUi/ex4m0
         wQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766925096; x=1767529896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFUKZn4JEgcN7upzMO/UdzXH12MA1Fvm3drRZqBFE/g=;
        b=bfhIqO3LJqb3svUIqGY4784TgQesfvImb2T1KXNJUK2z9TWWF1Iyjlw3zrM89sJPzK
         A0I8clMDu3z4jjvcmhDK6OibwEIzXVKO1Ot/THKy9zryZA0yw4/vOJrg/DQMwaWmVVlS
         uYDLFGVY0ogNsEFWijePljGFn7Mi10I8k8wogRdnqfZFQ96YtWriOJqRp2S24fK7f5qb
         faf7/DFn1NR9lOWDbWbwbC4zqGuTlFtgGK3RlfEIAY3vkYRlpc4449dJpjPTl17lieOA
         0Iqof6B7vCrqGtsrRML8KSDcSFVRhN9fWcT9dqw9OFtn44o+54MnCi6smpLktwKqXDNS
         4zZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMLvWWs5XJGuMVKojEzMAExjzL4/eXrwPHnVAIH9UfO6/MNaG+WG7ZwDculxcgkX76VXTi6zB4Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1+VRGgMjEBfOWIKmmruLkJl2BJV2sax3f6ZSU+hXKnciU6P08
	nCELii6p5FbnZ9/BBaVqsPFuHrurMu7yrxcbd4+xmPof99aFTRP8tEon29x6biRdtYlMqU3R/cU
	R4kEekcRUVADwZAKhdnY1XFJI5rjMccgA5PlO8aeDaw==
X-Gm-Gg: AY/fxX4/B1zc8AAYuWr9BTzY9+GLsaRMdO0f5ERy8HLKKI4gLD339neCsnfe26/8CBB
	PqkyED2BYookD2KPWkeARoCl8XHIwPyuFGimU5pFFsbdLhRRKIblkMB3jiOl491/ZVUD9Vds7K3
	M8IW1/m1ZT4jSY+6FMJG0HpNIensbFKQBgNY8M99fKRiZwEAVR+CUNQyri6HW+WsNLVLQ1jeQ4O
	mTorMHtNcEPqCju8TUDpbOEEDSf0XdlOSDQFIhsINcwAsB66jPqU2ABaT7NsbCgIneH2fWnvXMg
	mBk6r7nVboAKlvEsfMH7zYGlPOGLUd957oJqZMCayqPf
X-Google-Smtp-Source: AGHT+IGzNeLi2mvtbJJSxEBXitpFJh8gimq1x4runQxUrx42Uz4iKaNci7NxYvfC5KuXG0hI1tM7gav+zCDbXUEmfic=
X-Received: by 2002:a05:690c:6705:b0:78d:7307:76a4 with SMTP id
 00721157ae682-78fb3f045a4mr526106307b3.11.1766925096099; Sun, 28 Dec 2025
 04:31:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com> <6925aa57-874c-479f-9f5b-f0fd6ede685b@riscstar.com>
In-Reply-To: <6925aa57-874c-479f-9f5b-f0fd6ede685b@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 20:31:24 +0800
X-Gm-Features: AQt7F2oYtYgUrqLg8Kz0ZEXIdh7PslchN-MDNsVvmqkVIj5_6sJ9gxOL_QcWcvs
Message-ID: <CAH1PCMauCHQ==Fyb1pHzWtkNOCnpRoJ_8KE0zJBC4B6X8TzweA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
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

Hi, Alex

On Sat, Dec 27, 2025 at 5:28=E2=80=AFAM Alex Elder <elder@riscstar.com> wro=
te:
>
> On 12/22/25 7:04 AM, Guodong Xu wrote:
> > Add descriptions for five new extensions: Ssccptr, Sscounterenw, Sstval=
a,
> > Sstvecd, and Ssu64xl. These extensions are ratified in RISC-V Profiles
> > Version 1.0 (commit b1d806605f87 "Updated to ratified state.").
> >
> > They are introduced as new extension names for existing features and
> > regulate implementation details for RISC-V Profile compliance. Accordin=
g
> > to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, their
> > requirement status are:
> >
> >   - Ssccptr: Mandatory in RVA20S64, RVA22S64, RVA23S64
> >   - Sscounterenw: Mandatory in RVA22S64, RVA23S64
> >   - Sstvala: Mandatory in RVA20S64, RVA22S64, RVA23S64
> >   - Sstvecd: Mandatory in RVA20S64, RVA22S64, RVA23S64
> >   - Ssu64xl: Optional in RVA20S64, RVA22S64; Mandatory in RVA23S64
>
> Again, I did not verify your statements about where these are
> optional and mandatory, but I assume they're correct.

Thanks for the review.

As mentioned in my response to patch 8, the requirement status for these
extensions is clearly defined in the RISC-V Profiles specification(s) which
I mentioned above.

I have verified these details against the official document to ensure
accuracy.

The extension descriptions are included in the commit message to provide
necessary background information.

>
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2: New patch.
> > ---
> >   .../devicetree/bindings/riscv/extensions.yaml      | 32 +++++++++++++=
+++++++++
> >   1 file changed, 32 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index a6b9d7e3edf86ecfb117ba72e295ef097bdc9831..ed7a88c0ab3b7dc7ad4a4d2=
fd300d6fb33ef050c 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -160,12 +160,26 @@ properties:
> >               behavioural changes to interrupts as frozen at commit ccb=
ddab
> >               ("Merge pull request #42 from riscv/jhauser-2023-RC4") of=
 riscv-aia.
> >
> > +        - const: ssccptr
> > +          description: |
> > +            The standard Ssccptr extension for main memory (cacheabili=
ty and
> > +            coherence) hardware page-table reads, as ratified in RISC-=
V
> > +            Profiles Version 1.0, with commit b1d806605f87 ("Updated t=
o
> > +            ratified state.")
> > +
> >           - const: sscofpmf
> >             description: |
> >               The standard Sscofpmf supervisor-level extension for coun=
t overflow
> >               and mode-based filtering as ratified at commit 01d1df0 ("=
Add ability
> >               to manually trigger workflow. (#2)") of riscv-count-overf=
low.
> >
> > +        - const: sscounterenw
> > +          description: |
> > +            The standard Sscounterenw extension for support writable e=
nables
> > +            in scounteren for any supported counter, as ratified in RI=
SC-V

Here, I used the abbreviated version. See below.

> > +            Profiles Version 1.0, with commit b1d806605f87 ("Updated t=
o
> > +            ratified state.")
>
> Maybe you should just copy the text from the RVA23 specification
> for all of these.  So something like:
>
>    For any hpmcounter that is not read-only zero, the corresponding
>    bit in scounteren must be writable.  This was ratified in the
>    RISC-V Profiles specification version 1.0, with commit ...
>

As you noticed, the RVA23 Profile v1.0 provides two versions of explanation
for Sscounterenw:
"Sscounterenw: For any hpmcounter that is not read-only zero, the correspon=
ding
bit in scounteren must be writable"
"Sscounterenw: Support writeable enables for any supported counter"

BR,
Guodong Xu

> > +
> >           - const: ssnpm
> >             description: |
> >               The standard Ssnpm extension for next-mode pointer maskin=
g as
> > @@ -178,6 +192,24 @@ properties:
> >               ratified at commit 3f9ed34 ("Add ability to manually trig=
ger
> >               workflow. (#2)") of riscv-time-compare.
> >
> > +        - const: sstvala
> > +          description: |
> > +            The standard Sstvala extension for stval provides all need=
ed values
> > +            as ratified in RISC-V Profiles Version 1.0, with commit b1=
d806605f87
> > +            ("Updated to ratified state.")
>
> Or alternative to the full text in the spec, you could copy over
> the abbreviated description listed in the glossary at the end
> instead.  Something like:
>
>    stval provides all needed values.  This was ratified in...
>
>                                         -Alex
>
> > +
> > +        - const: sstvecd
> > +          description: |
> > +            The standard Sstvecd extension for stvec supports Direct m=
ode as
> > +            ratified in RISC-V Profiles Version 1.0, with commit b1d80=
6605f87
> > +            ("Updated to ratified state.")
> > +
> > +        - const: ssu64xl
> > +          description: |
> > +            The standard Ssu64xl extension for UXLEN=3D64 must be supp=
orted, as
> > +            ratified in RISC-V Profiles Version 1.0, with commit b1d80=
6605f87
> > +            ("Updated to ratified state.")
> > +
> >           - const: svade
> >             description: |
> >               The standard Svade supervisor-level extension for SW-mana=
ged PTE A/D
> >
>
