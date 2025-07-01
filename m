Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD0F223327
	for <spacemit@lists.linux.dev>; Tue,  1 Jul 2025 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359734; cv=none; b=nhkjT/B0BB7xNjz8GSk8pO8g6RylcTG9RmLnH8ONt1H4WQF/+4pLx+abZbKVGMtd9G59rUZfzW4W5AkKd5E7rWS1Qm3Pbl2aw7rxc48BWckedCD1ZNHNjvWeaN2Srp2Rd7NtNfZsv+QBXYJuXWqlSjR4a8Io3iA6Iw75RBP1KKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359734; c=relaxed/simple;
	bh=DGBHFGIQFj3DI57v/KergKc6+HMEaz+DP4HpyZ/MxtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CW5+AqVb5dfqsh8cejjAJSHZzxWd6YYGjWcokO3U7TUaRTvJrwq5wQUNR3P+H+KGdJqFddfDbiPVM9Qa7O2X5O9RQEjimDHU1hyrfH+JKsBjcZ3F9fscX2AnlHa5Jbt+SeVyANC6GnPwa2b5QiqHOL2fApikvJscySObZZPlOqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QpVxWArT; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QpVxWArT"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e4b1acf41so24728267b3.3
        for <spacemit@lists.linux.dev>; Tue, 01 Jul 2025 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751359732; x=1751964532; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ham4MleQtpYSqIWPo8fq/MuoFtt+t8Ya59SZXOm39+s=;
        b=QpVxWArTPIsw2s/YAQNZ5uEkJBxyaV4T+wRCwtX6h63wbiZ9nkBvvWr0vSe1B+vCSU
         2vC2UNTgfPmk6baxUfKmaRVflICpirvHKaOpv/m69/JI1pTsM+fI0wWT83WvOvUFs/sa
         LlGJDeMKBh0ERKW46PlbiNjgZeARR5D1AyZ5duALx3FqOUIu/KXIR6Pq+mcTiZziLcQ0
         4ffh708tWKmEorwgkk1bmdliEsqAewXDAod6JtSb/ZvbCC04JdIr2EQJlPzrUsiv8oHF
         kTiJTLA6LyBUoydwshOxJRDuuFxsqTN8ml3PbqEz0po1UwZ0cMd+fBPPpNgyFylv4Hud
         +hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359732; x=1751964532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ham4MleQtpYSqIWPo8fq/MuoFtt+t8Ya59SZXOm39+s=;
        b=c/jSa4SO0+DZ2r2+2ju9KmZ7U4ceuHmrc1ZZo3svSFVXOB3L763vUZm/2Atovk176u
         JCC97FXX0hG/RmClbgqSeWHJGmjfEfEq4EAh08IeAOXbYn3b7tg98GqLWVST1/0qtQPU
         PFCR6Jga53j0DvGxzISs5v3F8rEZBkyBa4x6E5OmCzVl/YBTrrAG13yesIARVQYLHJ1D
         GPGAGA6s15o9e0W+Yz1+wWNdajgs/tqNIUWS1wKgUWGMpvAtKF8fAxFOiyunL3CCId5I
         TLMa6LYnWUnmHuaPKcZufK61Wrftj6Tzazd0vWKEgIjpeNufS1MsWRDydVPWcBiy1j+A
         UNgg==
X-Forwarded-Encrypted: i=1; AJvYcCXawKySpJQkVLQURsL2elyNU4VtkOrqjb7MvwujbEF80VZKSy2JLZaQbU366kUZ4qY6sAD2ECSlPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxO4cY8TN0zzgOiNidliMjfhqlrCRP1Xhqjau9B7As+xECvMGVn
	5bh1iFqeHftRT1jOfCkC0Hb88hXmM2+sFmIlyHIDohhjjTPjglDgjXlwEGJoXCGEkW4ag5JLJZE
	/rYjtiZK0j2GGH0R1hQ5XoH+oIpXu0rLmaR5LxB9V4w==
X-Gm-Gg: ASbGncvtw6Ex17CSZLU3CAERJR4vOT0XUTZ7ZdEVnxlzXIl9KGDRKVgdwq+K+W4iJxV
	b2zrpjYw4K5TGWWi3gdGVfxuFLkexW01bpWM2hJbhliENRChFDTKOWBxO5oR9kPlcCe1yqVbZ+q
	XgGLK7oomRjZa3UBAjvpYaMtTTF61yNa936cvLpV0qgqNnyC1m
X-Google-Smtp-Source: AGHT+IExwbxuXz67r7i2U0Hj9e39nnEuFRzklLDURAXbWXk0DV903xSBiVjsaBHg1u3FdNeBklfefUYYXWQaY3P289M=
X-Received: by 2002:a05:690c:45ca:b0:70e:29af:844a with SMTP id
 00721157ae682-71517196047mr247551697b3.18.1751359731954; Tue, 01 Jul 2025
 01:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com> <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org>
In-Reply-To: <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 16:48:41 +0800
X-Gm-Features: Ac12FXzG_24euqC2ksqQUMdli-9vCkce_uhDVNzQHQHTjfNnkSCnW6ua-Xfs0vo
Message-ID: <CAH1PCMa2dB1fefzGgo-kKfgAdou_KaDSvTDsvYPjsGKODHETCA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/07/2025 07:37, Guodong Xu wrote:
> > Enable the PDMA0 on the SpacemiT K1-based Banana Pi F3 and Milkv Jupite=
r
> > boards by setting its status to "okay".
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2: added pdma0 enablement on Milkv Jupiter
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
> >  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/ris=
cv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..39133450e07f2cb9cb2247d=
c0284851f8c55031b 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -45,3 +45,7 @@ &uart0 {
> >       pinctrl-0 =3D <&uart0_2_cfg>;
> >       status =3D "okay";
> >  };
> > +
> > +&pdma0 {
>
>
> Does not look like placed according to DTS coding style. What sort of
> ordering Spacemit follows?
>

Agreed. We should establish a consistent ordering rule for SpacemiT board
DTS files. According to the coding style documentation, there are two
acceptable approaches for ordering node references in board DTS files:

"When extending nodes in the board DTS via &label, the entries shall be
ordered either alpha-numerically or by keeping the order from DTSI, where
the choice depends on the subarchitecture."

Refer to Documentation/devicetree/bindings/dts-coding-style.rst

My preference would be alphabetical ordering for easy maintainability. Howe=
ver,
I'd like to hear Yixun's perspective on this before we standardize the
approach across both board DTS files, BPI-F3 and MilkV Juptier.

Thanks.
Guodong

>
>
> Best regards,
> Krzysztof
