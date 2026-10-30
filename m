Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793328720;
	b=fp1KWJFPoffel5Mo91cTqADgZb082OqSWJRW0AZy0sAQ6W9Tq6H5gbBccljvuQk/Y8Hq
	 FxOKljczS/Df5NYPRaY9QVllv6jOxYq6ssjDgxXXa9PXzlEUTYR/lsJ4q59WuvmQ8eItC
	 V0RDqVasIkfx0WVD3dWoQoj4aIXa1XUQ7/woX7wiRrPL0ZIzplFrTXpzCfCbWsbHEqX1y
	 pK+z2+wkubcw4Bebo+I31mAq/Iys8wB0Xj8nyb7rlwg+VFvXbM3t4gu1gPyOM0j4SkFLS
	 ppSk/x/tE3m3+vDfzNzz9FxnsWa2GL3PBoFHIOXGMqVjoFSNJVo5JZYjJ5ZHYXx+zsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
	b=AdGIBmxw1QUVbXrc8WoJVL4gCyh9iMgHQITatFPsDWbtn+tygHnyYM/AQfBvfVqGPr41
	 nPR+QunhUxlrDouXzTepY033rIZeTlnfr/6DPMewcwlT5shU4610hh0CGpfsN7KmtbfG9
	 efSwMqJlDZTkNAFdb0SUeh8sLs3dthWViBookIGUvOIBJyfw83xaURGJmTDFkUwUnv//H
	 I9cB1OXAYP8GHpg2aCGCOSLkuAOFkahBf7o/tC2Stps1Jz+W0YudFrIC89YWpL22djLDl
	 M7krXlMeFR99yD6HLq06OBMM7OlLhp3Tar/4K3Pat62sjt7/I1gBZvesam/UveQG99A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b="S/n4UsFi";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BC5606A31A
	for <spacemit@lists.linux.dev>; Fri, 30 Oct 2026 02:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85BC5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=S/n4UsFi
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798eb0d13fso197368d50.0
        for <spacemit@lists.linux.dev>; Thu, 29 Oct 2026 19:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793328718; cv=none;
        d=google.com; s=arc-20260327;
        b=p6DeLZ5dHXwJkkN6K2EjlwPIkmcWcnh7u7xh1NoZOg3Z6hFsda/y0zayLLydAZbLXL
         P83qE1sYEeUwaVOGDtBONe3TrfCH9lc5MYCJOuh79A1K+v8+0QYvGwGd+YVMdZ0XA4mQ
         mrb3eiJ6zUJSJoa0bmm+J2qDThg5JoiFAHrijzUahsZVh4HsBSTHvAWKHFfb51n4Z4Ni
         YTEsh5q74zy5rLbWH4EIXsnz8DM2/W8yXAncQ/KxETPfYCsidEVRf+KXavwALGF5JzVx
         B9vcOJDkmvz4rLjYtT8WDAAC/nHSoxxm7BITDAAW33dFg+o0ml5XvfBHbYeWinzjgOys
         C9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        fh=Oi/uAuxC3cfPdfxSISVU24QZyB7VJpmUeGoqDmjllvg=;
        b=ctc4UXmHbz/rhmyrbSQ1CkAP2a0U05iUrcDzpvgdRnU2QuGOcP8261D1p+Bl6cmgox
         ER6lZfWArTerjfpf3nJbwB1FMToiG9TMwDqyjHCfm1EnvgiziDcB+Bz0nx8s2naIrBpK
         jGPvax/+vGI2Gk0mp6tuy8Xek5NQJy2/TtpdWIzoyLDLN3HhDrPxtefl71hzAM9iu/Ad
         eFS5tHjdoaZ7JGko1P6NP4Uqhh5y7ArOvSM8NOOxKFCLU/S3qTeKRGkU3L1fDuzF1hcY
         7ZOLWtIdPBRdf6BkaAlLX8VLtR5rOqP6hYfPHBEiCG0dr/rS4KF1xrQyF4LBGHd+la5x
         2oCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793328718; x=1793933518; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        b=S/n4UsFiJS7bm8n7NYaVsR5yA+fIdeWebfGQzXrLePEqi0+Toh6/sQzmimitCXOOK1
         Yqr5C7vIv8JqVNJ+aLVc2VcT6yxC2TViLlPRYRY4e70hXGTlSytNEoLqCVcHljSu0bVz
         Dfs4CTV49OHhYFof3qPxC2qdHb5r8TNldT6tE/SLkKjcZEgdbY6emH8wGsb6vH9FLhEM
         fo28DijXPgSpHkm8DbBq5HHSsL7HYexovG0pUl3HUPd9EMgBbDcjSoRvLkDGLgTKcDzX
         31FdvD53dmAP+P83abdIKsSacIe4HLdfZafKKv9f9fzMHEshbE9+T7iG0eFqfbTQGjd6
         ElCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793328718; x=1793933518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ie6ggWeYOiCrJGjTOYfEYsaxA6J/rInoUvNNm8ia7c=;
        b=QTCmIVavimBjyU3UGaTJ6dPPOi2zKH/Pm343wVqaBMJzHtydCgaMQ//a3kxqLOqZrX
         7QUZqU6lvYFxL+e1fbfVhWEiCW37c0EamNraiNC/m+AxFYC9ijQqAbzUX7wyfsgKQ0B2
         qpdHzLgDtVhQ+aJNpXm+Xdt6fDqHg9YIxv6QPNF8aSHy0ts6d3niL9DfZlN9gbp0iBo/
         TTWb3FWbTw8m31eA2lOaiGbSuGRjm0Gh0uwYCCd3R5hUy7j1Y/UBqdd+M3yXVNc8P2/W
         dK5pJKB/5OHsdFDvcNLKBv3MuN3BXktFtecatJ0uq4gd8iGbTh3cyQ47h+kNqyDE0GzX
         g0xw==
X-Forwarded-Encrypted: i=1; AKwUvBxid/vhCau7MrJWZIBtnrLzRfxNRrZdtkb8Chp26BVpQEuMJ52SPTpLXoV8M3W3VGNlyvP/Ayp0yQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIum5tMlJ9h/tqUUvGRzTFV9nP23O4W5q4HEGzxkntO7y/XtNuE
	VcCsahOuJ0KJRHpmMBHmcfDiwOwS3rKBBKy+Q3kMkP5zJUt8fGIlT+Bnc2rza+uSJWwymGN1eXH
	K/1/12Jrnlr2KKDQIirgsZ/fkMoR0PieFPB3TrhVCPw==
X-Gm-Gg: AYBFou3Rn798sqqe7x37IugCNAQHlkmqScoG8nJ0PMH5N0ONazXkwHZVz8GZXZeXT8j
	XziWVWcW8Kl46FqNJ+T5XD/h5L6SxlBae7OQQ17qUcUrqLSDhP/6sPVKjr/0rXWDRd041gBJIKW
	5pRqNWc1VGXF7KOhJJ0QjiUr4HNhN61oVW1ss08n0tVGwHjXCsVR1s9L5JAHuN4pq5D8n1LMT1I
	v+Bt/OVhy3al/OxT41UC4li81WVjixNgEZgREQtqXmBlJgWlTbSye2DmQLtosX8lFHizhLmbuRn
	52ThyRFrdyNQIr2MtEuaBXpAcAUpcG1lfj+6pP2JMkI9CBflhBMbMSzROuenhdv1dQJcvlxIV3g
	wL+zQDoF7SOzQf+QVYpVxUmNZ12aOiYfMCWdQLpoQMrpFMNX8HiC9oyM2PorTgPOVfI+EVAY/Kn
	G18iwa2goBqUPM8GkEESquxxg=
X-Received: by 2002:a05:690e:454d:10b0:679:a353:7a7d with SMTP id
 956f58d0204a3-67ba4eeac55mr426041d50.53.1793328718349; Thu, 29 Oct 2026
 19:51:58 -0700 (PDT)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029162343.1896134-1-e@freeshell.de> <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
In-Reply-To: <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 29 Oct 2026 21:51:46 -0500
X-Gm-Features: AclHuK_jwkWhvW67oyVz3_xpn9l6bwLOir-RRbNmugfkCBr6eaFqkHpPNMfZ2UY
Message-ID: <CAEev2e9aYewWgOjxSq6ShaLpj6SaYjxQq+C-L1zX2vHyWH81HA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and
 maplic to okay
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: E Shattow <e@freeshell.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

On Thu, Oct 29, 2026 at 9:04=E2=80=AFPM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> Hi E,
>
> On Thu Oct 29, 2026 at 9:23 AM -0700, E Shattow wrote:
> > Change the "reserved" status of mimsic and maplic to "okay". There is
> > an mainline OpenSBI user of this and setting status okay resolves the
> > stall of Linux when probing peripherals at boot.
>
> Thanks for bringing this here. I still think status =3D "reserved" in
> k3.dtsi is the right description.
>
> (To clarify the Acked-by I gave on the U-Boot thread: it was for
> carrying the override in spacemit-k3-u-boot.dtsi, not for changing
> the kernel DT)
>
> > @@ -1452,7 +1452,7 @@ mimsic: interrupt-controller@f1000000 {
> >                       msi-controller;
> >                       riscv,hart-index-bits =3D <4>;
> >                       riscv,num-ids =3D <511>;
> > -                     status =3D "reserved";
> > +                     status =3D "okay";
> >               };
> >
> >               maplic: interrupt-controller@f1800000 {
> > @@ -1464,7 +1464,7 @@ maplic: interrupt-controller@f1800000 {
> >                       riscv,children =3D <&saplic>;
> >                       riscv,delegation =3D <&saplic 1 512>;
> >                       riscv,num-sources =3D <512>;
> > -                     status =3D "reserved";
> > +                     status =3D "okay";
> >               };
> > Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 =
SoC")
> I don't think this is a bug in the kernel DT either.
>
> This was also discussed when k3.dtsi was reviewed [1]. The DTB built
> from the kernel tree is often loaded directly by the bootloader (e.g.
> from /boot) instead of the FDT that OpenSBI has already fixed up. With
> "okay" there, Linux would probe the M-level IMSIC/APLIC and take an
> access fault. The compromise back then was to keep them out of the
> kernel's view in k3.dtsi ("disabled" at first, "reserved" since v5)
> and enable them for the firmware build in -u-boot.dtsi, which is
> exactly what your U-Boot patch does.
>
> (Also replacing Guodong's address with his current one in Cc.)
>
> [1] https://lore.kernel.org/all/77f9a001-7f0a-4c29-abcb-501e875da117@sifi=
ve.com/

Linux will skip probing the M-IMSIC because of this piece of code in
imsic_get_parent_hartid. It returns -EINVAL unless it sees interrupt
ID 9.

    /*
     * Skip interrupts other than external interrupts for
     * current privilege level.
     */
    if (parent.args[0] !=3D RV_IRQ_EXT)
        return -EINVAL;

I see this in the logs

[    0.000000] riscv-imsic: interrupt-controller@a0000000: no parent
irqs available
[    0.000000] riscv-imsic: interrupt-controller@a0000000: failed to
setup state (error -22)
[    0.000000] OF: of_irq_init: Failed to init
/soc/interrupt-controller@a0000000 ((____ptrval____)), parent
(____ptrval____)
[    0.000000] riscv-imsic: interrupt-controller@a4000000: providing
IPIs using interrupt 1

(a0 is m-imsic, a4 is s-imsic)

[   10.727605] platform cc000000.interrupt-controller: deferred probe
pending: platform: supplier a0000000.interrupt-controller not ready

The M-APLIC probe is deferred, because the M-IMSIC wasn't probed and
there is a dependency in the DT for it.

This shouldn't cause access faults as far as I can tell.

One would have to implement a dt fixup in u-boot like Heinrich
mentions in that thread to solve this.

>
> --
> Troy Mitchell
