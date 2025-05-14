Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD61FF7B0
	for <spacemit@lists.linux.dev>; Wed, 14 May 2025 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207330; cv=none; b=lFI6LJJe+p4D2peRKyDEdSS6V7WAf6Q5s0tZOG69gH0hgjYm6r5Jn/7Z5O/8MnVeHVsOQ4De/F4ECL6F97sFFjL+IJnr0mnwvzlCM20QtwZuK+7UWtT6YFnhel+Zgkbrsy0WbJe2W7Z5xAReW854C9n3ZYGE+IZJ0k0EdUvywRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207330; c=relaxed/simple;
	bh=xsIXzxcogPEj7WI1OQx1l9ITv7ODZeAyB0f4aMhmg0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q0D4ZltuL4+1nKI1d8V2IT4QMJB7J7K21m4KgM3Y4m+U60mEXJytSPD7J7PaEg/8plR/EO+uCaY/otjiBGexCnQ9q43OgOnNd7xNH8Mn4mkX37dpHcgxyLsXHjhY/GYs7NJf+qTLrgaKWNMw0O1Q+lTcnQlmgvt9cZAhFFRwJFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YQm+SPmT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YQm+SPmT"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad212f4030aso953700866b.2
        for <spacemit@lists.linux.dev>; Wed, 14 May 2025 00:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747207327; x=1747812127; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcbw5sLrHE1qbiw4ucHwavhVf9qACz67c1w54poiYio=;
        b=YQm+SPmTFIsssl0k4thN3rhzUKZf7zGFmvwbDKwwRaFEgglOS27vezjZWUjnzevTRg
         tI7r1dSCZMpFT5pkpgbp69D/gUACOr2RGmjxkwYSuh/RdZiAI8YeqbwdvmlvgNFlcdmT
         ahZ+4OV/wsVB0natx/o2obaW+MaghMRiCm9clhpZMHKq4zTlwfaRkca/0XYmpzCfssUP
         074diaHI68Z0E8y3poAJt3LzDbQsCFayCujmIqpkuZ/XeejhJSW+v0rM/dr6BxCd54mo
         tdMar6YySn0BPDym0ACUtQk3PIr8uwy1MPFp+coO5O+zPa0fr261ipCtZum+34GpYmX9
         ZVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207327; x=1747812127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcbw5sLrHE1qbiw4ucHwavhVf9qACz67c1w54poiYio=;
        b=kArImrNi4U9ixd8zxeOZjlp0BhBJ2b5+a79LCcE2mKFoEg5SnEUjJ52yeu36yrp6iv
         I63q+AUCg0CIf4jQxj5GuGlpgNKV2RrLMmXAlXjVgQhKVUuh2SymcA85chuJmVDYFZbI
         QsiSvRQ5qDugsAn2H9DKpRX9hpz4LHJM9g4FRAEh+2jH3dWd8JjUFiP5EwQhL1wX9FPx
         oqKs1HTWj2xmPNdM/aXo7cL9lg7cXilMemuvvEsfP+U1fvs4VbxyR1IHPAwuKJ2pLig7
         SMOVxNW6usiSdngPkZWBLa0GGsIB+6u/NQNDx95bn0viVPB+BMm/IE01UnTBmakGPc68
         XNRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqkpU/RHxjyIvXpxwIw0pH1DMo+SBOp20yi3gcl7DPSkarjfpkEje04mAdgdmg4v5A5aq5RXlm+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfGeYQVQiePf0u5BTAfMOtyywtPAtyilHUPUpN4oCRkyjcLy2W
	EC2rVN/RcWtA7xTHtmL9BdAaS6ZkggPnF1SkJalKASD0rWjH0jBSeIqbMKVjHneF9dGfArU4rvu
	tWOVJKFWxW34XtQ2PBDcnmgTOXEs0oMFmOrzwSA==
X-Gm-Gg: ASbGncszme1MfEhVMMyaFy8ptNCXcSLe4CJDPhJFnCrc5SGHUOeuYt6bfR1k7Lm0kXw
	D1gALdVNlRDOcsBSNXGTFe4VtYWWlFOYxClJZ+0IYTTb8Wg40nX9C7Hh/lDvQ77Syd6K89eN6Nv
	y8nwtPA38cJzGOd+2MsPngdSDidbl3TbU=
X-Google-Smtp-Source: AGHT+IHqsMqx3BaDCWn45qMLaOEYvPW7XUqjv7SdJvzZ3hWp+AKyoxb4KrcmHMVJwGZocnpesHw3un4CM8pfyBJnatc=
X-Received: by 2002:a17:907:7f94:b0:acb:b1be:4873 with SMTP id
 a640c23a62f3a-ad4f70f6129mr261521866b.2.1747207326486; Wed, 14 May 2025
 00:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 14 May 2025 15:21:53 +0800
X-Gm-Features: AX0GCFscwF3i-VATg9tXixD2-TDlOGgy-oyXk_jgaiYVherKFdQgiFo0yj7WIAw
Message-ID: <CAH1PCMai91WjooaF8HzY=rJWpFT4Drnx7fcs4+NCsLT4pGEKUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, conor+dt@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, alex@ghiti.fr, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, drew@pdp7.com, Inochi Amaoto <inochiama@gmail.com>, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	heikki.krogerus@linux.intel.com
Cc: Alex Elder <elder@riscstar.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, All

On Tue, Apr 29, 2025 at 4:51=E2=80=AFPM Guodong Xu <guodong@riscstar.com> w=
rote:
>
> This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA driver
> and updates related device tree bindings. The changes enable PWM
> functionality on the K1 platform through driver enhancements,
> configuration updates, and device tree additions.
>

Gentle ping, any comments or concerns on this patchset?
Any feedback would be greatly appreciated.

Thanks in advance!
Best regards,
Guodong

> Functionality has been verified on the Banana Pi BPI-F3 board using PWM14=
,
> configured as a pwm-backlight. Per community feedback, the actual
> pwm-backlight node is not included in this patchset but can be found in
> patch 7 of the v1 series, with modification of pwms property to 4-cell
> format to match updated binding (#pwm-cells =3D <3>) since v3.
>
> +               pwms =3D <&pwm14 0 2000 0>;
>
> This patchset is based on [spacemit/for-next]
>   base: https://github.com/spacemit-com/linux for-next
>
> Plus the following dependencies:
> 1. Clock controller driver, posted by Heylen Chu (v8), with most of it ha=
s
>    been accepted:
> https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
> 2. Reset controller driver, posted by Alex Elder (v5):
> https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com/
>
> Major differences between v3 and v2:
>  - Patch 1:
>     - Added: Reviewed-by: Rob Herring (Arm) <robh@kernel.org> # v2.
>     - When compatible string contains "spacemit,k1-pwm",
>       #pwm-cells must be 3.
>  - Patch 2:
>     - Dropped the addition of a reset_control field to struct pxa_pwm_chi=
p.
>     - Using a local variable in pwm_probe() instead.
>  - Patch 3:
>     - In k1.dtsi, changed #pwm-cells =3D <1> to <3>.
>
> Major differences between v2 and v1:
>  - Dropped the addition of spacemit,k1-pwm as a compatible string in the
>    PWM_PXA driver; instead, it now falls back to marvell,pxa910-pwm.
>  - Removed pinctrl settings for all PWM nodes (pwm0-pwm14); only the
>    pwm14_1 configuration is included in this version.
>  - Changed PWM_PXA from built-in to a loadable module (=3Dm) in the
>    riscv defconfig.
>
> v2 consists of the following patches:
> Patch 1: Add spacemit,k1-pwm compatible string (with fallback to
>            marvell,pxa910-pwm) and support optional resets property.
> Patch 2: Add reset controller support to the PWM_PXA driver.
> Patch 3: Add device tree nodes for all 20 PWM instances on K1.
> Patch 4: Add pinctrl settings for PWM14.
> Patch 5: Add ARCH_SPACEMIT dependency to the PWM_PXA Kconfig entry.
> Patch 6: Enable PWM and PWM_PXA in riscv defconfig for SpacemiT K1.
>
> v2:
> https://lore.kernel.org/all/20250420070251.378950-1-guodong@riscstar.com/
>
> v1:
> https://lore.kernel.org/all/20250411131423.3802611-1-guodong@riscstar.com=
/
>
> Best regards,
> Guodong Xu
>
> Guodong Xu (6):
>   dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
>   pwm: pxa: add optional reset control
>   riscv: dts: spacemit: add PWM support for K1 SoC
>   riscv: dts: spacemit: add pwm14_1 pinctrl setting
>   pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
>   riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
>
>  .../bindings/pwm/marvell,pxa-pwm.yaml         |  35 +++-
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 180 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |   2 +
>  drivers/pwm/Kconfig                           |   2 +-
>  drivers/pwm/pwm-pxa.c                         |   7 +
>  6 files changed, 225 insertions(+), 8 deletions(-)
>
>
> base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
> prerequisite-patch-id: a5d2fb43fd88525fa6c8ee767c31adfee87f1012
> prerequisite-patch-id: 8a8d0eefd0b4423d87f3c093b451a0fa60622ec4
> prerequisite-patch-id: 30f92f93e5b3577bde61424303f21c709a715ec5
> prerequisite-patch-id: d774b8281b5c6a822445365ee94925e1ab6c7a93
> prerequisite-patch-id: 54a4f5d065eb9f212fd99efec6e7e06abbb9bad8
> prerequisite-patch-id: 93962be60d1b58a98d947edf51b4af9edf513785
> prerequisite-patch-id: 5f53f8bf16fb067628092daebc4831293261aa01
> --
> 2.43.0
>
