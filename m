Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DC2D839D
	for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766925800; cv=none; b=iYKh+/Yw2jB4DZSO248ina2qhe1rIn2guS0q935d8VM87cdRAshL8zcB02BaNcdJNw/LiZFTGFL1SoZED/O9xqyVbSG5/nN2hjORzFNJCfFIRIFC3SEiLYjrZiw7Q0szvPCktlyY2OZALT7ZRgdskUFZKIBRpJUzxtkAD72oN6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766925800; c=relaxed/simple;
	bh=PDtPzIPdNVWEmGWJy4NYLWw9A8mjRLIe0eMacVvyCiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYdMRExhSCNpYabCzOO2JzQwfvy8VipiMKcQG9KUU/Gmz70uDk5sH/mT79o6T/SL9wkecQ+22BrsrbOOz4KM3SmVIX14nSrwpUvPBlNC39PmnEgyw8zV8V2hiNBohsnvQe8ICNOb1mpwP+A5KTTLQQYoquvcIA4r3PA7eqKfYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3IlGHQVq; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3IlGHQVq"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-644798bb299so6585220d50.3
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 04:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766925797; x=1767530597; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubXvmj1fUdXD8dToAHqKBaQMhIVravK57oAPfXT+X64=;
        b=3IlGHQVqcoMzShjgPnfhZz25MpU8We68HoJkSXZHjc+avYfsOuzY1mg2oIPvILFBPo
         rmox93VZ+ln3moOMl4fHscCGW8NyV+uD4o9jDO3N4RJz8qvwx5ZTJyD7vzSdequpuDEb
         iIP7ETTZRxDT9Ib2x4pCxcQyPpumucug4KMan7+6hlkL1FR9RtZ6WbSP3DfmzYVLW/Ap
         IPU/wNkTW+jwLsApLzN0LlSH4/0ZX8b9DLTxR+ryQZStgALGqO/YGbd21NNJNCczs4q8
         j3mXo/ocbaKkhGxCwrG56rimvnoDJU+w5VWL/PDXfT7elsGiBtIShP7yhClUNariklby
         PPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766925797; x=1767530597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubXvmj1fUdXD8dToAHqKBaQMhIVravK57oAPfXT+X64=;
        b=KdAqTjxHCK8t/3+fvtRyK/mrg8Hw5QswQHGYDuCEJ3LvRn88NklNv+1pyJONz5TE3y
         Y88qZUo4TnN8X93q1THT6H082XPgL6AShG+eoqK3nT7luG2T7Bgr0FszgxiMFs7k10zW
         0V+U0PxxEjRL0jQjHaqba6Cxl865b8vA/nqFyuhla0aHTNLXMbG+XH5QJ0lyqy6w5ICU
         l2SB2XgKQ++IqwpVBo0vZqxMtNT4ys7R68OI2fG3Oggd35PveNn1Gj/XphVV5GZz82xt
         aB1wtK504w2EuVBTYwnsVTa0q25M/B+XzWTGeBASyL0dldDIBHiCTLHuqKuu+d6JQgGF
         c0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCX5Ybl0KIoY9W8IurI3fTx5JkpWZrk9t4OM7nnKpcWbJ5nhpP2F2GRWdIb9Akxwqfm4bVJEuoJjxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5TsuFSAIGda3Gx4CWvqoQGr+KkkeKtZMpSI3107/PC2NbzGkI
	XKwEOVMO9grfCHFblVQ9wYfoH5aVvcyG024KlnXyh3gltllNqPFRG0YY8u73wg2ME0hQ5hr3B5Z
	kQb8BOEl9gNE05TmrJWwx8hpIqawg5GqWffMdafTy8w==
X-Gm-Gg: AY/fxX6zjFsCbvF3kMfI+KHgllMW236AiFZW9e00RfWG1ZLzJdBKlTxr5n8zlDBjic0
	Sa0hj3Dh5PCZ8y4+C0cZmKL2S/RbMQnUvQzK4HBt3Msgy3N5GknPHO7n2FIztWgphNjpiF0TGOP
	+jRyO5K4F4YsFkT+9jbsLSQAHCi+2Nx3W1AsdnddJa4FdAWfBk477ooE+bYBnL7z1xe4fXEC4ym
	bwst+6RKftp3B7tJMiPYwzKHJVTgdCPDBg7kZj6M/o2lm2T68YsZ0OWnato5EUwP2PiLpmh1YTi
	axLVAypBQnRO5c4D8rXG7aQao+WUJxn5A5vp/RT4bUm3
X-Google-Smtp-Source: AGHT+IHppMMkEW6WFB0HEo0ifxTYnk4oEPsIke/IUQFq16jbr9MVRxACLruWnHcI0AyOA5DYLrW7GjdWONuaMWC32sY=
X-Received: by 2002:a05:690e:1402:b0:644:60d9:867a with SMTP id
 956f58d0204a3-6466a8e7f1amr19754124d50.95.1766925796931; Sun, 28 Dec 2025
 04:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-10-3af3f3cd0f8a@riscstar.com> <0253c25d-f5fd-46f1-b4d3-ec56909d5eac@riscstar.com>
In-Reply-To: <0253c25d-f5fd-46f1-b4d3-ec56909d5eac@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 20:43:02 +0800
X-Gm-Features: AQt7F2qXu9cqHVEnLlLdWdHISUhUuV8HhHEXXaEigmu6Qha30-fVIyENTL3svVE
Message-ID: <CAH1PCMa0NqZGQAknRZppVWUEBzKDE7tcega7bsT187+=wc-_YQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] dt-bindings: riscv: Add Sha and its comprised extensions
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
> > Add descriptions for the Sha extension and the seven extensions it
> > comprises: Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstve=
cd,
> > and Ssstateen.
> >
> > Sha is ratified in the RVA23 Profiles Version 1.0 (commit 0273f3c921b6
> > "rva23/rvb23 ratified") as a new profile-defined extension that capture=
s
> > the full set of features that are mandated to be supported along with
> > the H extension.
> >
> > Extensions Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstve=
cd,
> > and Ssstateen are ratified in the RISC-V Profiles Version 1.0 (commit
> > b1d806605f87 "Updated to ratified state").
> >
> > The requirement status for Sha and its comprised extension in RISC-V
> > Profiles are:
> >   - Sha: Mandatory in RVA23S64
> >   - H: Optional in RVA22S64; Mandatory in RVA23S64
> >   - Shcounterenw: Optional in RVA22S64; Mandatory in RVA23S64
> >   - Shgatpa: Optional in RVA22S64; Mandatory in RVA23S64
> >   - Shtvala: Optional in RVA22S64; Mandatory in RVA23S64
> >   - Shvsatpa: Optional in RVA22S64; Mandatory in RVA23S64
> >   - Shvstvala: Optional in RVA22S64; Mandatory in RVA23S64
> >   - Shvstvecd: Optional in RVA22S64; Mandatory in RVA23S64
> >   - Ssstateen: Optional in RVA22S64; Mandatory in RVA23S64
> >
> > Add schema checks to enforce that Sha implies the presence of all its
> > comprised extensions.
>
> Like patch 7 in your series, I *think* what you're doing
> in trying to imply the presence of these other extensions
> is actually requiring all those extensions to be present
> *in addition* to just "Sha".  I don't think that's what
> we want.

I tend to think this schema check block should be removed. Conor expressed
similar design logic in his comments to my Patch 7/13 of v2 series.

If there is no objection, I will remove it.

BR,
Guodong


>
>                                         -Alex
>
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2: New patch.
> > ---
> >   .../devicetree/bindings/riscv/extensions.yaml      | 79 +++++++++++++=
+++++++++
> >   1 file changed, 79 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index ed7a88c0ab3b7dc7ad4a4d2fd300d6fb33ef050c..1066b7e65dab89704dbac44=
9db4aa5605c95b9d3 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -128,6 +128,57 @@ properties:
> >               version of the privileged ISA specification.
> >
> >           # multi-letter extensions, sorted alphanumerically
> > +        - const: sha
> > +          description: |
> > +            The standard Sha extension for augmented hypervisor extens=
ion as
> > +            ratified in RVA23 Profiles Version 1.0, with commit 0273f3=
c921b6
> > +            ("rva23/rvb23 ratified").
> > +
> > +            Sha captures the full set of features that are mandated to=
 be
> > +            supported along with the H extension. Sha comprises the fo=
llowing
> > +            extensions: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, S=
hvstvala,
> > +            Shvstvecd, and Ssstateen.
> > +
> > +        - const: shcounterenw
> > +          description: |
> > +            The standard Shcounterenw extension for support writable e=
nables
> > +            in hcounteren for any supported counter, as ratified in RI=
SC-V
> > +            Profiles Version 1.0, with commit b1d806605f87 ("Updated t=
o
> > +            ratified state.")
> > +
> > +        - const: shgatpa
> > +          description: |
> > +            The standard Shgatpa extension indicates that for each sup=
ported
> > +            virtual memory scheme SvNN supported in satp, the correspo=
nding
> > +            hgatp SvNNx4 mode must be supported. The hgatp mode Bare m=
ust
> > +            also be supported. It is ratified in RISC-V Profiles Versi=
on 1.0,
> > +            with commit b1d806605f87 ("Updated to ratified state.")
> > +
> > +        - const: shtvala
> > +          description: |
> > +            The standard Shtvala extension for htval be written with t=
he
> > +            faulting guest physical address in all circumstances permi=
tted by
> > +            the ISA. It is ratified in RISC-V Profiles Version 1.0, wi=
th
> > +            commit b1d806605f87 ("Updated to ratified state.")
> > +
> > +        - const: shvsatpa
> > +          description: |
> > +            The standard Shvsatpa extension for vsatp supporting all t=
ranslation
> > +            modes supported in satp, as ratified in RISC-V Profiles Ve=
rsion 1.0,
> > +            with commit b1d806605f87 ("Updated to ratified state.")
> > +
> > +        - const: shvstvala
> > +          description: |
> > +            The standard Shvstvala extension for vstval provides all n=
eeded
> > +            values as ratified in RISC-V Profiles Version 1.0, with co=
mmit
> > +            b1d806605f87 ("Updated to ratified state.")
> > +
> > +        - const: shvstvecd
> > +          description: |
> > +            The standard Shvstvecd extension for vstvec supporting Dir=
ect mode,
> > +            as ratified in RISC-V Profiles Version 1.0, with commit b1=
d806605f87
> > +            ("Updated to ratified state.")
> > +
> >           - const: smaia
> >             description: |
> >               The standard Smaia supervisor-level extension for the adv=
anced
> > @@ -186,6 +237,12 @@ properties:
> >               ratified at commit d70011dde6c2 ("Update to ratified stat=
e")
> >               of riscv-j-extension.
> >
> > +        - const: ssstateen
> > +          description: |
> > +            The standard Ssstateen extension for supervisor-mode view =
of the
> > +            state-enable extension, as ratified in RISC-V Profiles Ver=
sion 1.0,
> > +            with commit b1d806605f87 ("Updated to ratified state.")
> > +
> >           - const: sstc
> >             description: |
> >               The standard Sstc supervisor-level extension for time com=
pare as
> > @@ -813,6 +870,28 @@ properties:
> >                   const: zbb
> >               - contains:
> >                   const: zbs
> > +      # sha comprises the following extensions
> > +      - if:
> > +          contains:
> > +            const: sha
> > +        then:
> > +          allOf:
> > +            - contains:
> > +                const: h
> > +            - contains:
> > +                const: shcounterenw
> > +            - contains:
> > +                const: shgatpa
> > +            - contains:
> > +                const: shtvala
> > +            - contains:
> > +                const: shvsatpa
> > +            - contains:
> > +                const: shvstvala
> > +            - contains:
> > +                const: shvstvecd
> > +            - contains:
> > +                const: ssstateen
> >         # Zcb depends on Zca
> >         - if:
> >             contains:
> >
>
