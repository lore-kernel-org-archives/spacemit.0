Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E4A1DA23
	for <spacemit@lists.linux.dev>; Fri, 15 Aug 2025 00:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217621; cv=none; b=Mb1DMOGZpWJ79r2TlXvrM5nYUzzv/2iMk38Tgbm8SBRqlwXac8uYbZs0ZylaJLg/LG61d/lY6tFnLQWCYFYhDuvPHGZO7dRkN2xlMXtJbgaYYJse2AEsr8TOOKYeuQjxv4A01eDDl1kwelweLyxd0LPxc00gDIrsxMSAA+qs2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217621; c=relaxed/simple;
	bh=zqCXdHxKTeKB9ROaf4knn6ibcDXe7aVLUkOaaUaIpUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOg8wAcesiGOmNZzhWkaI+OYI5F9u/eSpjJv90HjtQ+26Ugwvl9zVa8Fuu3LwnaWSFMIU1Rvo044qEE58TNejDThDpUA62wTd7MiHXMdd1piv51D6Q+LTEzMK61EwOeinTVh0LZJXJW4o1v3v6e/NyMK+OAWk34iAs6zKbdLBSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=h4wf7F4m; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="h4wf7F4m"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e931cdba209so1549477276.3
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 17:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755217619; x=1755822419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chtqaOACUmcKvoVs4ArIxzTVDCSfAD6YVqxbH3Chc5Y=;
        b=h4wf7F4mWPlxLxxcbdjPaoBlgL+VzSDJySwfbBoxg1OdsW1+TNMVP4Y8UM5TgATX1u
         gCYEFCyq9sRqV+j2VxZtldNd3RIIKIh1oN4x2JBuo0DnEf2yWajZJLzspN1y1Jp0Qb4q
         bFtpIWqebvLwXSkH7FbNtLzlICTRc9nbVzko5qDanoipE5xOKghZATrVi4guywMltx2c
         NtJdNzBrdW6vt1gFw86VadI+tE3V3sZqt2zeHec4pq2r/uoGOhT6jifzxooLx7kJq5b6
         /QxhwXIIUzq/nXM9Jd4rArPPXBwaWTYVhLIHVVN5ruRJfGLc8xRXmwzd3wMaQYLnvl43
         TKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217619; x=1755822419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chtqaOACUmcKvoVs4ArIxzTVDCSfAD6YVqxbH3Chc5Y=;
        b=Ff3D/SRoxqOHBXJqd89IV5PDMBgjFeCVbgg0q3uOxYEeSj9cjEXEWXoHppvODanqWU
         wb2roYOZo5GnSlREF2oPKh10/YMCE+O5VKj4lKEtm9Uc9pSHlqd+xrfaL2Mo8pJXDix0
         Tj4rH7tTrn/RjHobeSXWQabwPGf4KzZO0BnWQKbpNQjY/KsZObc85+LYHgTmB7BWNhjn
         VaOz/F8ZQY3BM6qHzm1BKOJli2vcmCBrDZ4G3wM9B1cutQBXttUa9FyUB4yNJb+BXkZc
         koW1muaFMnL0zrJYSkUd+DnfWbrXjFScRmRNSa+XHCJsFdpXYbnbJswOfmQk1W8TW210
         IztA==
X-Forwarded-Encrypted: i=1; AJvYcCUPrUDUFy6PtDxm6lRxbhpqWRJnTm54AbAWyCjB5zrFGJ0K74VgqVyhFvjtspcRX4JFhkFyuezCLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeIybJu+HjQmSJc5jT0i+BEjGIQtgWt5hlcSxS0OMdiXKVYbrU
	SCyIJRIDIWUCZ0Er19WGNBm/zQ/WsNxGNI4tDt5hcyriQynZN4JXhHh1IVw46Oj6Ly2gs5l4vJC
	GZfkkgtxjjhvMkiQxWzHACMuSvtFaIWrP0BOtgZ4MwQ==
X-Gm-Gg: ASbGncu9Pq8i7oFETsxGrNNmFHZpPl9XlCYqrO9a16wmcSlrPHZih6XlIKJqtfhDUz6
	zOOp3MUAhi4fUz6Y2K8Pze5QvY9iJAMJpjKjIN9V8cai+2/+uCC1/+wJabfEUfXvthIELBJZZ8K
	w4Jxl9H2dTJBOZWPSC5lJWjYhKB3x3xntKz4L9srV6RdQjTORPztJOGjhgBP0kL/MAWIqa/QOo/
	Vtz1QaQ
X-Google-Smtp-Source: AGHT+IFyC6XchyD488oOCFrdXunJc7qGIapZSIGWdcX99KZIq/zeH1vE8qmFombtGx4qUvJV13AHJXqkXJEjvfp+pqA=
X-Received: by 2002:a05:6902:2b8b:b0:e90:637a:cb36 with SMTP id
 3f1490d57ef6-e933235e5e4mr362916276.6.1755217618710; Thu, 14 Aug 2025
 17:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-6-8b0f5cd71595@riscstar.com> <20250724121916-GYA748228@gentoo>
In-Reply-To: <20250724121916-GYA748228@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 08:26:47 +0800
X-Gm-Features: Ac12FXyMVuK9-KHf4Hpw5gXtsQxmq2I0BGB7NnpjNngaho2sXqjxjvKEDgl5mV0
Message-ID: <CAH1PCMZejR5AxmJC1mRi7KSAXEtOQzfSD99G8+0PFbbASJxW-A@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 8:19=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 17:39 Mon 14 Jul     , Guodong Xu wrote:
> > Add PDMA0 dma-controller node under dma_bus for SpacemiT K1 SoC.
> >
> > The PDMA0 node is marked as disabled by default, allowing board-specifi=
c
> > device trees to enable it as needed.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v3:
> > - adjust pdma0 position, ordering by device address
> > - update properties according to the newly created schema binding
> > v2:
> > - Updated the compatible string.
> > - Rebased. Part of the changes in v1 is now in this patchset:
> >    - "riscv: dts: spacemit: Add DMA translation buses for K1"
> >    - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1=
-0-c0144082061f@iscas.ac.cn/
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts=
/spacemit/k1.dtsi
> > index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..46dc002af947893cc2c234e=
e61e63c371cd966ca 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -660,6 +660,17 @@ dma-bus {
> >                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> >                                    <0x1 0x00000000 0x1 0x80000000 0x3 0=
x00000000>;
> >
> > +                     pdma0: dma-controller@d4000000 {
> does K1 has more than one pdma controller? No? as I checked..
> so, I'd suggest simply naming it as 'pdma' - which clear the confusion
> that there will be more than one pdma nodes..
>

Thanks Yixun. I will name it 'pdma'.

> > +                             compatible =3D "spacemit,k1-pdma";
> > +                             reg =3D <0x0 0xd4000000 0x0 0x4000>;
> ..
> > +                             interrupts =3D <72>;
> for consistency in this dtsi file, I'd suggest moving "interrupts" after =
"clocks",
> or even after "resets"? leave "clocks & resets" together..
>

That makes sense. Will do.

Thanks.
Guodong


> > +                             clocks =3D <&syscon_apmu CLK_DMA>;
> > +                             resets =3D <&syscon_apmu RESET_DMA>;
> > +                             dma-channels =3D <16>;
> > +                             #dma-cells=3D <1>;
> > +                             status =3D "disabled";
> > +                     };
> > +
> >                       uart0: serial@d4017000 {
> >                               compatible =3D "spacemit,k1-uart",
> >                                            "intel,xscale-uart";
> >
> > --
> > 2.43.0
> >
>
> --
> Yixun Lan (dlan)
