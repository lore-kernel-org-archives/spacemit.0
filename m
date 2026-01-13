Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518882C3749
	for <spacemit@lists.linux.dev>; Tue, 13 Jan 2026 02:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768272285; cv=none; b=qbsx6NM7B3Mc38+WxpBlaIhfVmVcgeQgnwZ8ON5wE4dl79cu311q5AvlZ2/+ZgmiHmXxm+So6jceApO3jsWgQ3l2KdpCUJ8KDnBiBFuKMUgtNpuzmd1fPIPTWKZ/WH/RLbE2DpBftPTbapQELA0PEdK4f8sz9qjZ+PCGEIv2bQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768272285; c=relaxed/simple;
	bh=AXpazA6SgKTW1vhNzpqG3QrGSTso7uVz9zzI2iC/vyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SH/9EOURd9GBWU/hbvm+p37RShICiHz15NcSFEG0XweiivMEUhEkdoKIIJzBcVAK28uu1HdWIVbGMwq37NNboKUTnq60mqMDSFVUZepiVSh8jeu73SBd6k5BK4C+7QklWAXnxCkgTF/fj0ZkWk4QLTsLzMS8pt/v78BgM3TTmD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EF46ebHv; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EF46ebHv"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7927261a3acso26895277b3.0
        for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 18:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768272283; x=1768877083; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXpazA6SgKTW1vhNzpqG3QrGSTso7uVz9zzI2iC/vyg=;
        b=EF46ebHvzI7aDD5n/gJqvPy6nc4lvTjgS1J8iq3AXx9EXWpD5TQmufSMokqbQAy71k
         FDZ7I1j7CsDOtHvjAjM3NOihMM1y7ydSKl0OWPFXPjyxm6VVoTngJSV4oM95c4SO3Fn5
         /aEHggKitfMAuWm3LrLDnZjq4X5pX/7uKE2uSaH19Tz3jr4z1DTUnrnzzvM71YITqOs7
         bSgv0ViPO98WE98+JE0/74NkEqJF7ZYQ/UZk+rP5t/vMoB/ma7Yv0SyrCzB0unepCtpf
         MRlgDi19PlNVNjwhfPGwZhVFGvwPz0ZOvM3s3n9O2S5Cb46GZDFlSSwDtAOxk0dR+WvR
         jJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768272283; x=1768877083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AXpazA6SgKTW1vhNzpqG3QrGSTso7uVz9zzI2iC/vyg=;
        b=TeW6/aLJOLY0mn39sS9Qpl6CwxOTWPNz5J8Q9C6d8/dOUaQ8qAexjXjSjYrdOGfkSh
         FJ1j2EsRM1kt3JtYij00995FNG2eAt1FEzMUALiAdUB6EJcCkb5Y7rQLCUFxkIb033cr
         I1vbW6x3eOJGiZLEDm7nRaiN7kYUEELUZGNqqMTq61dtl9Cls9JD1JV8rmKS5YEZ3Xoi
         AGAoANy1k0g7QueY86WIGYRwgaPMT4Lp8RjUqFnAiemofLhtCpcgD7MYTkQQonV6Pkwd
         9rTWSEilN5143QzXp0cIS8Th4Le5bpsuIq2qqyfMYH5ipIbqcCh02LdByT0nsFLKR7OU
         9nEA==
X-Forwarded-Encrypted: i=1; AJvYcCUBabvZR2/aJ8jUJCH1o48yR8zh3p8d/dcvh62jQuuD6EzeyRy6SAHgMd1RCXnILkv11tK2IViCJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZZjV7Eu4LQInc9mvD94j+kY3ADpcDOL31CQRffJ8/ibeG0S31
	V7DPg5UY3ixr1A7Dma9b4GYOo2ZqUU7UKt4aa1cW8DnE0RRl/0mM8hNXUPhGIwGW0zTYqKEwbJc
	srYNaSP9trFzJe1mLOBQSSQwlIKmrq3LWAx93QJ9VJA==
X-Gm-Gg: AY/fxX6qI1IT4i8dEESwT+jSrPRsf0/O/uKhZC4UqLHf+eB5WXi6R26PsixfY2rEV6u
	9cn1l4xU0Sj/f0IOBH6Y6uZVX7hEw+ggys6+Dif8g7EsQjPsoYkLz7SX78FD3qbjYfS+x+X3x3Y
	iI0FO5Jsew5Obq2TFyn+AraT6GaffXWeJAoK6yd4+GYgTMuSXhEcnngcxQN6IWOj+efmfBF02Bz
	hYy4Ns5RAy5wQ0PCd+4k6XEjwPGdFibZujKRKDYmWU/AayUrtKIR6ux+QF8tnneEuaLe+yP7hYq
	bpi+09qssVT0k9A3osHrDgdPG3HYPsiFAAEcLg==
X-Google-Smtp-Source: AGHT+IHj3ypPU/NNMfpdHkNAGLFnFzOTMM7fMEliuRPTtrZJWbtlqHPi8+SGGYOwkosOTrtDx//q+fuT7Iu+SWMNFCA=
X-Received: by 2002:a05:690e:14c7:b0:641:f5bc:6991 with SMTP id
 956f58d0204a3-64716c6e1admr15279346d50.77.1768272283353; Mon, 12 Jan 2026
 18:44:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-6-d492f3a30ffa@riscstar.com> <20260112-veal-retaliate-7cf9a2981aaf@spud>
In-Reply-To: <20260112-veal-retaliate-7cf9a2981aaf@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 10:44:31 +0800
X-Gm-Features: AZwV_Qgw5WUVzIip-0vximPTfFaT5zWrcbo35d-VZT71kic6QgdIU7i9b69aOEs
Message-ID: <CAH1PCMYgGVm1uJMjoxVkOMvPeRLsvybi7PW9k3sWyj3ij8c4Vg@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] dt-bindings: riscv: Add B ISA extension description
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

On Tue, Jan 13, 2026 at 5:41=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Jan 10, 2026 at 01:18:18PM +0800, Guodong Xu wrote:
> > Add description of the single-letter B extension for Bit Manipulation.
> > B is mandatory for RVA23U64.
> >
> > The B extension is ratified in the 20240411 version of the unprivileged
> > ISA specification. According to the ratified spec, the B standard
> > extension comprises instructions provided by the Zba, Zbb, and Zbs
> > extensions.
> >
> > Add two-way dependency check to enforce that B implies Zba/Zbb/Zbs; and
> > when Zba/Zbb/Zbs (all of them) are specified, then B must be added too.
> >
> > The reason why B/Zba/Zbb/Zbs must coexist at the same time is that
> > unlike other single-letter extensions, B was ratified (Apr/2024) much
> > later than its component extensions Zba/Zbb/Zbs (Jun/2021).
> >
> > When "b" is specified, zba/zbb/zbs must be present to ensure
> > backward compatibility with existing software and kernels that only
> > look for the explicit component strings.
> >
> > When all three components zba/zbb/zbs are specified, "b" should also be
> > present. Making "b" mandatory when all three components are present.
>
> > Existing devicetrees with zba/zbb/zbs but without "b" will generate
> > warnings that can be fixed in follow-up patches.
>
> Are you going to send these fixup patches for other devicetrees? The
> majority appear to be other spacemit devices.

Yes, I will. My check shows that these three dtsi files need to be updated =
to
include the newly ratified "b" extension:

arch/riscv/boot/dts/anlogic/dr1v90.dtsi
arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
arch/riscv/boot/dts/spacemit/k1.dtsi

I will start a follow up patch to update these dtsi files. Basically, addin=
g
"b" into both the "riscv,isa-extensions" and "riscv,isa" (when available)
fields.

Thank you for your review.

Best regards,
Guodong Xu
