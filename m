Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5967238FB9
	for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924711; cv=none; b=LdnjjkPMNp+I3LBrlnI0GCLF3BkZlvlBAtO1ER7E6hASPZ3XklnzgpRJWOBd1n7biCKy9w2WJykODIy//nRSTnlV/NQIF5wxTMcmO3AewS8dKnHT2gBKpGLq8Q6uygcdXLw9uDDrHLnKVaVySE6HOoi1m86PtBoPn/xRB+Yirg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924711; c=relaxed/simple;
	bh=U956XuvvizaJ2RMiBSnvmF0Rf8XG8VxMKnFJYt86iug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dX/3GVkwMeRyw0MA2xm/74ezpTMYswkwLqfiPZYnQAlCZUvvrnAxbw7aRvcM9uEeXnW79I0+nRBfi4j193+qa3dNq2ybBBA1la4yCEY4uAgTrcGHYzURuSv8ST/DvqxA9pSChDaw+I0w3lgkFb+VwetJBmYQ4NX4c5wvO+yh2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QSFzHT5C; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QSFzHT5C"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70a57a8ffc3so7866557b3.0
        for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750924708; x=1751529508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ/4DEN1eZvLVjrRd2IQhI+AZUokpaevmaxAHJOdK2Y=;
        b=QSFzHT5COf+cWxzXpWI88C4M1KBIsqP6AnBY8VJZeVIpemSICsMbaYRX0ee6qS949o
         5hcolz+36nG698o6oKz9tcwxmzsn+3PnwUtIfRgPRws1e9c6A6IBmB6tQp93C21nlLQR
         KZk0f/2WB/pAyspOiKZXTRNVny/1gNdbSfj1SliKMRrIs57mmu1a+o9pd/Z4LxlO4xim
         We1NZBBOSjFYhmYDdVxkMwnF/txW7TV7/811Sh7v5ZqTBfTsH+yqZtmnHO75RZjQSNRL
         JI2sISxKxBjQhpiNNs2CKC8kiL/Vm/8aS6MHDzWMzDmiJHdnTVMfdynYTpqV00D9P5RT
         c5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924708; x=1751529508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ/4DEN1eZvLVjrRd2IQhI+AZUokpaevmaxAHJOdK2Y=;
        b=l8KzoqH+gQkQckVEPT3lKeQEQ4g818DgeMG1BCKAIRlUHtEpQ1tGOrCUPBhGAp7SJK
         LmZ0zwclWkbiowkcfIHQ9qgArPSNBlHyk5IvQ5XwqSK2ldF6arh1K/tmUNs3FkQ6A1Zv
         7BpFigdirKk6pdyA4c5MF4z3mw1nsVgxPzW8VnrJjBynMluP2LWvFL1mHycr7QFe7Exg
         FpIunEuL1HLRcmt/ca4l1xhRrOHy/JAqTp8jrSGNeLj7qWsaY42ce4ruAIkQjOjPmt56
         c/qMBCHQt/q2h5Q0/cetx1ZB3DSDlq+/cyUmacs4HlkbgthDWnPOmvODPNwGJMOiHAk+
         Xz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5PgkU8CF4C5TGBNqrviG9j5WX8ZKja7w+7uyqGYpQKnxdpH8SiCytGKWG+7HnbFDW9YO4DukGoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSXJy8mr5RF8gEiUxHjojA1rv79MaCSSSKOHZmQurvWQZWrnRe
	2vU3DecetWl5e5cgrovI2Zp3nXQRGYX6t3hZS5s2zi/aUlIm3nRoh7i6jKFiAx3W2WVVgoT6Zzd
	kWAjeivKlpFSjmIouu+9fgQAgOwF19uBD+aTFmOfUMg==
X-Gm-Gg: ASbGncuTafoJZDLHMOuaUfwIka9txnBJjsNE4T2FwAE6ZopBx3aJJo/kCWNQ2qNeZ0m
	ZE2Ft2iDX1NzzqJPSedN0tFn6mOHO1Brb2OTXkJmTEuCQbeQa+cX9y5mpL9ssM3jHMI65nCePFC
	JA4mNG7C1534KqF92RRhDvd2JkOLvPgFgSZZO05xFdd2Y=
X-Google-Smtp-Source: AGHT+IEzDH0NRWqzIEote+KhgyU/fDNmW2VP0PKdVNT2yILrISQmmaVeujNnwl/coWmd3McvdKX6qUuA9VblGYbEEvI=
X-Received: by 2002:a05:690c:3391:b0:70e:2a0c:bc5 with SMTP id
 00721157ae682-71406e1ba1fmr85608977b3.38.1750924708356; Thu, 26 Jun 2025
 00:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
 <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
 <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com> <965d5dca-72b0-47da-bd9d-efeca16db826@iscas.ac.cn>
In-Reply-To: <965d5dca-72b0-47da-bd9d-efeca16db826@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 26 Jun 2025 15:58:17 +0800
X-Gm-Features: Ac12FXzAOZiKHwn50uOUxMMWJ46pZGPTTL9IzHlqGbLf3HaSvxr5iudx5ZkTgoQ
Message-ID: <CAH1PCMZp9pr3SKYroyDfY-p5X=ojY5ZPt8_m7xXLejEzH07QOA@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <uwu@dram.page>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:21=E2=80=AFAM Vivian Wang <wangruikang@iscas.ac.=
cn> wrote:
>
> On 6/24/25 20:21, Guodong Xu wrote:
> > On Mon, Jun 23, 2025 at 6:04=E2=80=AFPM Vivian Wang <wangruikang@iscas.=
ac.cn> wrote:
> >> UART devices in Spacemit K1 use dma-bus DMA translations. Move these
> >> nodes under dma-bus to reflect this fact.
> ...
> >>
> >> -               sec_uart1: serial@f0612000 {
> >> -                       compatible =3D "spacemit,k1-uart", "intel,xsca=
le-uart";
> >> -                       reg =3D <0x0 0xf0612000 0x0 0x100>;
> >> -                       interrupts =3D <43>;
> >> -                       clock-frequency =3D <14857000>;
> >> -                       reg-shift =3D <2>;
> >> -                       reg-io-width =3D <4>;
> >> -                       status =3D "reserved"; /* for TEE usage */
> >> -               };
> >> -
> > Are you sure sec_uart1 should be placed under the dma_bus? Please doubl=
e
> > check. If sec_uart1 and other peripherals supported by the secure DMA
> > (base address: 0xF0600000) share the same address mapping as dma_bus, a=
nd
> > if they can be accessed by the linux kernel in some cases (as saying
> > 'reserved'), then that makes sense. If not, better not move them.
>
> Hi Guodong,
>
> I have confirmed with SpacemiT that sec_uart1 uses dram_range4, a.k.a.
> dma-bus, which is same as the rest of the UARTs.
>
> Also, sec_uart1 is usable in e.g. Linux, but only if no TEE is in use.
> Using status =3D "reserved" is the safe choice here. Platforms that do no=
t
> run a TEE (or anything similar that would disable access to the
> 0xf000_0000 to 0xffff_ffff range) and wishing to enable use of sec_uart1
> can change the status to "okay".
>

Ok, with that confirmed, I'd say this patch looks good to me.

Reviewed-by: Guodong Xu <guodong@riscstar.com>

Thanks.

> Vivian "dramforever" Wang
>
