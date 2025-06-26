Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A325179A
	for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924499; cv=none; b=SzDB/6vHikRqIdr1EpYNKUm16PMFLzUCYMaXtLUJCo//9xaMibMxZcJgG4H0Zd5ba+RLDMCcIp0XNj/QDJ5hcAPaCkF1ZKtQpah1Ejc+ilZqzAkfmvW8sRt812J6BGEJakEFwK4ypvt+Y5kX4E3Qe/ShX9lJs/O6A0aC0LVQF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924499; c=relaxed/simple;
	bh=2YyhV0xDa/mfv+T4PqnDspYddj+Y2lZEIYXlGvWlAos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwWPSFAxwICPESCSOIPDwBTWl8W4tkJTsl5jhHjkSG3fhUZSkTCJk9NzghiMfcP8N6/RLzn8zBSouCGso4G9tU7wRbn58GZTuh9AxhvS9qHQHzZ6aXdrHaaBfFE6kjjsW1WOCx4qxqN9+FDVCInDkKWjZWf7EZcTqlD0h2uPCFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Uf0u9eiV; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Uf0u9eiV"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e40e3f316so6265427b3.0
        for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 00:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750924496; x=1751529296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1dn70L9Gl0okqRnxfuMbiMavX+Tx3Hoii+vZ39ERk4=;
        b=Uf0u9eiVY4b4zKYLaI8LUJEaHIXdHpeSbmMx6NnRtgXszAmHZGoqYUXYet/4HbbrTG
         jLNLSqnSUNy4MrdTiSeQFiCVaGtFRUnXioxqmnrqQx0IQ2lYdV3k7w6Qa1/PqaPHtQbI
         k2n8oMKh7wmudn87gnwpsvnI+CJoZALJQtVTDhSB0biOMLsFaWQr3+SzQ9fZzZ2nlvAq
         Aj4ih+2yNzuynHhUYklwR63MwLaUxyJVz1JSuStXLr3SVLdL0Gna+RrJto/E5CdAWu8z
         9k/Q2TqWszfDl02iU9VKenOZamfEUABQvcHqA147wnXnSikhDimpc4Sxdn7CIGhVpcWk
         BeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924496; x=1751529296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1dn70L9Gl0okqRnxfuMbiMavX+Tx3Hoii+vZ39ERk4=;
        b=JcfU9ZFM+hhMrTiKUrsuXnDFBuzQKuKqv+mfletsPH9hK6YgECZb4w4xkAyPD+dyE+
         XZOyGug6FxpvgDfMrhSDjgy8ewR32rbuqSoe5j6FYUVAc844+1l9D7VP488kQ95wVt8q
         CcgDPo+QwYgH8INYgbRBwuC7P3MRjwaamdL4q/dr53S2uEEdcLwIi5HRBnZgiEDc9pA+
         EzZhe+qW6eNI2slYnCRMjLjZQxyhlRh83N9aN2ZSdxaj3YVEX0/TbfR3BeICu8gQdf4q
         eyuHUHDYZENnLcEUNJ4YoQ51f1+6EbptrLRp3fkP0TFsf3f+PonQbK1LnfnbzFmM7vXm
         VIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4xd58jE7VtlT/uP7ofh89oReZiDtzWtZfEyBVPE1VBHQPPAzallRyHntrBe9fgS9Fql/odoFIvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgZRv7HOQtWITTcsJ9R53XzvRIqJMKZtVkAueFupTxRVe5QhlQ
	tJXaFo9/hCBs/Jt2aTho+96+R59mjxuFoldlszOwvEhOixaabSKyJKUFSW13s14Mt+FinU9SdLC
	xsCchZLlExgDdpVB4ItBBQojV9KEtacVVv0e/+xE0QA==
X-Gm-Gg: ASbGncvGHM1WU4RgV7t/9uV6mree30paM8qO12LrPAY4RmMy09VurmvibSl63LJw0Dg
	JDktxrEhJ0xLtI8ab5fy8Jdzb1y/Hhdq1fzQbTcAf37KL9WA7/cDyBWrcytzs5FI/UF1SN7BeL7
	8dNnnwirdGTiQUIm/xrXr8JlXlypkr9f872+HdSi8wEV4=
X-Google-Smtp-Source: AGHT+IFC7YL8EIIVDJy1BW5Otvm9vL5iJJX+MLNQi9AgPU+F0jT+Q6hOqkXPvsv54gH4IrAoTdOn98vPQafvJJOUmGc=
X-Received: by 2002:a05:690c:4c04:b0:712:c14a:a36a with SMTP id
 00721157ae682-71406dd9041mr88924747b3.20.1750924496096; Thu, 26 Jun 2025
 00:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn> <20250623-k1-dma-buses-rfc-wip-v1-1-c0144082061f@iscas.ac.cn>
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-1-c0144082061f@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 26 Jun 2025 15:54:43 +0800
X-Gm-Features: Ac12FXyAYMUSOHBFtbXxToArhHLgz9bWR5U78R9veUVEDJrTHtLo4Yw0VDlqbVc
Message-ID: <CAH1PCMYbP1mV_bO8f94qTbjqwairV3LQ1r1=B1Rmuphs-6VjxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: Add DMA translation buses for K1
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

On Mon, Jun 23, 2025 at 6:04=E2=80=AFPM Vivian Wang <wangruikang@iscas.ac.c=
n> wrote:
>
> The SpacemiT K1 has various static translations of DMA accesses. Add
> these as simple-bus nodes with dma-ranges. Devices actually using these
> translations will be added to or moved inside the bus nodes in later
> patches.
>
> The bus names are assigned according to consensus with SpacemiT [1].
>
> Link: https://lore.kernel.org/r/CAH1PCMaC+imcMZCFYtRdmH6ge=3DdPgnANn_GqVf=
sGRS=3D+YhyJCw@mail.gmail.com [1]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 53 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 14097f1f6f447bd33ff3aaa07382d27ca8e59a48..99c76997b367f733c9dda2c30=
dd85817294ef9b7 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -571,5 +571,58 @@ sec_uart1: serial@f0612000 {
>                         reg-io-width =3D <4>;
>                         status =3D "reserved"; /* for TEE usage */
>                 };
> +
> +               camera-bus {
> +                       compatible =3D "simple-bus";
> +                       ranges;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> +                                    <0x0 0x80000000 0x1 0x00000000 0x1 0=
x80000000>;
> +               };
> +
> +               dma-bus {
> +                       compatible =3D "simple-bus";
> +                       ranges;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> +                                    <0x1 0x00000000 0x1 0x80000000 0x3 0=
x00000000>;
> +               };
> +
> +               multimedia-bus {
> +                       compatible =3D "simple-bus";
> +                       ranges;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> +                                    <0x0 0x80000000 0x1 0x00000000 0x3 0=
x80000000>;
> +               };
> +
> +               network-bus {
> +                       compatible =3D "simple-bus";
> +                       ranges;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> +                                    <0x0 0x80000000 0x1 0x00000000 0x0 0=
x80000000>;
> +               };
> +
> +               pcie-bus {
> +                       compatible =3D "simple-bus";
> +                       ranges;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> +                                    <0x0 0xb8000000 0x1 0x38000000 0x3 0=
x48000000>;
> +               };
> +
> +               storage-bus {
> +                       compatible =3D "simple-bus";
> +                       ranges;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>;
> +               };

This looks good to me.

Reviewed-by: Guodong Xu <guodong@riscstar.com>

>         };
>  };
>
> --
> 2.49.0
>
