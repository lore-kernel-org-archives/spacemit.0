Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF69291C36
	for <spacemit@lists.linux.dev>; Tue, 24 Jun 2025 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767686; cv=none; b=WDy/G/2HSqVg6xTTvbjjFmKRb+VMoZF4FLP2g4BJ5Zbw5AlGrHNggkzkfmxQ/2VwEm3kV38BV4lMMcA1tAgeIJUOUU50upS87JNZb2zfptWk6FAEJodH9tOLQEnzs+cbePtFfsamqfcnbhWqbAoTK/p60gNa/02zr/NmG5OS020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767686; c=relaxed/simple;
	bh=lgI8rPf/30CT9dejJ5LxKgvQMKLxnvAGZzdJaKmX/H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJ3DFL0LVU3IgCxW92m1N1hyGiPvTgXhodHUMMK+7W6Vpx4soapmIc0zd4+dFxe8W3OFv9difqaYl/YQ6aNVrRnFQg3UKvgE00XO+QX1IJnsSQFA1nXFvG0dv7ajqHnSN0nk4iwPCovliPWhubUb1wSnTm2BoutYpyJJSa2bbW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kxg8Kbyz; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kxg8Kbyz"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7086dcab64bso45615527b3.1
        for <spacemit@lists.linux.dev>; Tue, 24 Jun 2025 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750767684; x=1751372484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdt6FPscbYSKb9tt2vK8+IJrClb5NOhYOEtuhJW4Z+s=;
        b=kxg8KbyzZ8DW3qpceYzY1TzmWgODPAK4o3Yj7TzfFkniKjv8Nmjvv/USmZyk7g7Drw
         npWcYEvSvubJe/rzvIH565U8FRBmaL3/k1rqLW+CCMgVDMIC2HvOkwW40KbFbJ5IcfRW
         9eToYQnnEI/ffFvcRh4gEcyGaSBKpe/B3FS2M4ctyI/fdwuYxXZy2PuL4qMaSQB0rmkw
         DXqROpsCZvziZ0bx4ZPH5pEjR0NGeXHHNjOavZb9EFohRkS0se3PhMcBM+BWiFRLelpu
         AmV+XAkajDQO0/QptAqV18hdh0suR7UExNgZoVhtWcgUYIBtGZID/RpHVUWr0dD5Wk/Q
         1qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767684; x=1751372484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdt6FPscbYSKb9tt2vK8+IJrClb5NOhYOEtuhJW4Z+s=;
        b=j10RoSAjKHjytQ0wEijlQ4/4b7qm1Zb6UEmrLM0xDTQ+Ih2PKHuVFhBMmKTqMByPeU
         hnB6FCEuqiif7pESc9OzBbWxzuXmXN1uDhVcmojqLGghGPJ2DwnPEBnOosczafQfBgiA
         m2s6QvA7b7S0dEOULclM3et6xQTYoLFIxtGtJx2gRtDj2pGLr+WAut52+4C2bhCqGTfU
         Sd/btphHLlPcaYPR/U4prEISqOiHXLgC/QcMwJYE+qQSOCElzAOcLfrTHA2ystNqQvgn
         /T11CauV90wKyKlxE3Zr1186us65cWqHLJfCiQi3NKogplG+0gdj17WCs0M4JoxWaHuk
         q2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWH4IhJ+kX0jHzxBiJIhxKRU/DcfKGs/6wDXqvJENqwQKIPrZhCoQbRLPCk37BpRR3V6ey08NDO5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfOuNfo/s0nyJrzxRYkG8aXTBNruh1p1l6ZeIsoRq9lbUzgrmh
	YhCfHLIroMrfyHYtBnYkGCN4k98D3QD9qD5F2xiSWodAuLdaIT3lx95FslEVLcYdTpm5KAvbGFc
	U2a3f1PpPuETMKy+PS+Cs8h+M28FNTvkPywdPFaF0Lg==
X-Gm-Gg: ASbGncvW3qOOMz1ZNwzXXbYcksSmYCDm0m3qjY0D5POnBter9dKHT8whNsfLdhp1w6L
	yMTommx1ugWQvy+hUQQNF09qHVuqBCOiozLtRVm4TegN8Q0txA2naMZjctDRqgS455VDgw41wDa
	ZKBQsGTOQvs+Y27IIQSJ7GWZ/AJ1QWRmaZH3U6kL+osXGy/nhK
X-Google-Smtp-Source: AGHT+IGJixjtqEgMzZmY1PuXA7TtT2lF0deavjre5HoqZIOUmxc9xSAXksOeVZSq/6UOOdGkP5nDZV2XSdYMjHT43+k=
X-Received: by 2002:a05:690c:931c:10b0:70d:fd2a:1457 with SMTP id
 00721157ae682-712c638321emr172100147b3.1.1750767683727; Tue, 24 Jun 2025
 05:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn> <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 24 Jun 2025 20:21:11 +0800
X-Gm-Features: AX0GCFvU1ePVl3bPsH_HTEhAPE0vAqbMLg9fVZOyMh7JoiSSyJXSXSqwp3WTd6M
Message-ID: <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com>
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

On Mon, Jun 23, 2025 at 6:04=E2=80=AFPM Vivian Wang <wangruikang@iscas.ac.c=
n> wrote:
>
> UART devices in Spacemit K1 use dma-bus DMA translations. Move these
> nodes under dma-bus to reflect this fact.
>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 246 ++++++++++++++++++-----------=
------
>  1 file changed, 128 insertions(+), 118 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 99c76997b367f733c9dda2c30dd85817294ef9b7..0d41694699851e672a833601b=
62c2b2ad3daae79 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -357,114 +357,6 @@ syscon_apbc: system-controller@d4015000 {
>                         #reset-cells =3D <1>;
>                 };
>
> -               uart0: serial@d4017000 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017000 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART0>,
> -                                <&syscon_apbc CLK_UART0_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <42>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart2: serial@d4017100 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017100 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART2>,
> -                                <&syscon_apbc CLK_UART2_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <44>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart3: serial@d4017200 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017200 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART3>,
> -                                <&syscon_apbc CLK_UART3_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <45>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart4: serial@d4017300 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017300 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART4>,
> -                                <&syscon_apbc CLK_UART4_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <46>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart5: serial@d4017400 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017400 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART5>,
> -                                <&syscon_apbc CLK_UART5_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <47>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart6: serial@d4017500 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017500 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART6>,
> -                                <&syscon_apbc CLK_UART6_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <48>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart7: serial@d4017600 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017600 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART7>,
> -                                <&syscon_apbc CLK_UART7_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <49>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart8: serial@d4017700 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017700 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART8>,
> -                                <&syscon_apbc CLK_UART8_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <50>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
> -               uart9: serial@d4017800 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xd4017800 0x0 0x100>;
> -                       clocks =3D <&syscon_apbc CLK_UART9>,
> -                                <&syscon_apbc CLK_UART9_BUS>;
> -                       clock-names =3D "core", "bus";
> -                       interrupts =3D <51>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "disabled";
> -               };
> -
>                 gpio: gpio@d4019000 {
>                         compatible =3D "spacemit,k1-gpio";
>                         reg =3D <0x0 0xd4019000 0x0 0x100>;
> @@ -562,16 +454,6 @@ clint: timer@e4000000 {
>                                               <&cpu7_intc 3>, <&cpu7_intc=
 7>;
>                 };
>
> -               sec_uart1: serial@f0612000 {
> -                       compatible =3D "spacemit,k1-uart", "intel,xscale-=
uart";
> -                       reg =3D <0x0 0xf0612000 0x0 0x100>;
> -                       interrupts =3D <43>;
> -                       clock-frequency =3D <14857000>;
> -                       reg-shift =3D <2>;
> -                       reg-io-width =3D <4>;
> -                       status =3D "reserved"; /* for TEE usage */
> -               };
> -

Are you sure sec_uart1 should be placed under the dma_bus? Please double
check. If sec_uart1 and other peripherals supported by the secure DMA
(base address: 0xF0600000) share the same address mapping as dma_bus, and
if they can be accessed by the linux kernel in some cases (as saying
'reserved'), then that makes sense. If not, better not move them.

--
Guodong
