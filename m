Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD8354ADB
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 18:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082220; cv=pass; b=qX5yLzeefc6u9vP41vJMyAsTT4ytayNPXisG+nbbKMaec940bgs4wrtubIagRwSF9v4zswdBiN/88OWTMfH4SyKKOBwTnUEDLgLIs8oupiha81eSFgJxDF9HoY0o25tdi1lzZk+oOAomBbSuZHSG7eFAO5VDKDVqQU8AMtvu5SI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082220; c=relaxed/simple;
	bh=fOVP/fNnR8syWhjc4RBhgcfX6wYbCNnDL9RyXcatRsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPynUX3tyVSYWHFZwY21PH7EcRU6Id53ui/6k/KQXhosCzleqCk1Urt8ZD8wdIWvTx1Gs9vL1SEAKVXj9cIRTXn0GQB9tfyjZvB6YMisXl50iL4JPm/xqA2ZzWa8EmG2dKBLk/dDO2PODM6aZawP/EGicWAm5lBHW6AZfpsjD18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrbqRgHx; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrbqRgHx"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9431300833so491357266b.0
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 11:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773082216; cv=none;
        d=google.com; s=arc-20240605;
        b=X2uNlcj5Ry5cU6c6x+O59s00PdtTG0omSadG1fHCtBXy8WAXXRYTTtusWAwI1e1lfZ
         c/HBJWsEk/5AFn41ErMU55aYHg8xQIPVIePgmY3K5mIHkKENT2TCDLFgbA32QY8A64O1
         eCP68r/T4RoGdsTDEI1E+JOOqZcI17VrmG+LS1SHDRTK5fyqERoMj1itZAf8t8bkKJIa
         L11dxXeGMkDw0S5v0HG212+YXS9K52ncDINNOnaAzNl91NeaGQqzya5iICrzuYwlaMBC
         /C+a+bh+k5Wi+AqPCpIUsDgk/3Ts1i2+MFaLjTn4QhHCJi6idAMovhkoj01zx190ssat
         F68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bowSy7YAPucdHblTmCmhKZ/mGr5O8DBdosAVAbymDGo=;
        fh=ynZ6Gj2/HwE++q4xfGAw1Y0+gzhi4jnB3DPvOWflsRE=;
        b=GZdnX8O5JyShbbBROraA7nFVjypC7wifjsWn6B4pLRGBjiYR6CLFKeSR2CgMZ4ELgS
         qfGXzD+9fNzs5aZxeh1w4aAE02ex15ADy6JIcXmUVQ1wU4lRmcrNA/WAvEHTKI7fggEX
         D5hz0ZGyHo/hLhXdabaVY3ZPAo/EWxn2pyTySiUTY7VOfcudtveB/DbMA1Hx1bZuUHK9
         kN+NEKaJ4kku/c3+L5ekHyT10vmS5cTGHsAYxAoLxov99xh4ZZIRiRdGMg/DdXMSCZ9k
         pyLxxFpVwe+bcmFzB5mwJZG31/k5qS4NbLSo/alY2lzLjNMeyoa8FcUVma1yKtFq9uXJ
         SuPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773082216; x=1773687016; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bowSy7YAPucdHblTmCmhKZ/mGr5O8DBdosAVAbymDGo=;
        b=mrbqRgHxmyTe64VknvqkiYQrJr0+ci4HPuy+rpW01+XdMHYLl+jQxnoqiUSTmZOAYD
         OSSS2m4cM8BZEBW/nXkCdozV2dbm3x0K4nIv9PXCO45eZaVwWoYAKBbugciGQQ19U8OB
         asd4cNwURpwBdpaVpD3wKvUaspFFsel0jS1E0u9IF7n2Z0M01bhEupY9DFwUo6frrXjM
         SuuNownko42PqO1LaxO8kE9alE5U6Z7FoMCzaFm7uINeFC8H9vAoRC+9l16Vrg4PI2f1
         eT2KqhAIJ1n9xOC4Ph7GHR9PzZe1C29QpP5NFtivG49q3EEeZVpB7tqFCvde6OIhcDDb
         hLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773082216; x=1773687016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bowSy7YAPucdHblTmCmhKZ/mGr5O8DBdosAVAbymDGo=;
        b=EvRxKg6SZj7veHApWHDJ/P+y9oRJHB09VjYPWxF5jEGbKsw0VI+iarety58WIYq5OB
         vSeASTzl0MvLD4SsLKQpyS0cXYu1qTTFss4lv8BlXoFwaNKYhmtD+sd48Oh7z8biq5Pz
         8s+91KvaDxUHWjAK0gtaoqp7MpSbxw3iiiIUIeGkfZT4iQDu5Y8XExAMKKzaBea3kqRx
         IKxTdArQHNBQmqFL4sz39QNW7MIHErE84EIUyLyZ6+Z98Bzm2jDB7sspL5BjZ3lhdrmX
         srFT7WfPu67jyuc4SG2Si14REm+P90k25Nf5CA1nLQcFjsTrGXUOyKQ3GlNoGt+Ykgkj
         VHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxoVcKxK6D5w/EQqoY3ouq9m6XMx8kpA/f8AbQ76+9qMN/vsqW9BO3yaMR4OEzBsElUe5ICFiK4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX6/8TLdqcEWU3NtpXW5KGLB8o+66tTaOEbfqc2Vt8rfOdURob
	sHbcCBPxN8DwE1BOEFFHqabIR4G3o/NRlATxXgYJcHUtt13nHbFdIcc6GpgmG8o+IEpy+EyAn19
	Dp/F8KYsEjcV3Djg4crPvyyNx5O4MrjM=
X-Gm-Gg: ATEYQzwfSIof4kFV3knJHxA6uobnrcTqHA4Qeyhcn5vX8RoVUtbTxd2Z2pIKegCeMc+
	P2BQfawW6anyTowShbESYDjg0iWtxoYIYEgXYLiaTbKUiS0OPIpvgCoIXcTRnk9GljvB41cx64A
	FHEQRzg2s4j7BHIPPcayYnELPdsEA2du+ilVwDuTRnSnf+5m+cEtIpN2ibP4SHRvX2vWWQm9YPz
	sMxu2k3ls3p/29OegOjJ0AGulI9XPtLdTC9p6xi/XIsU4W46cDmNkvqxT5iG92YdwsVZWB2kzqt
	uYn4YQ==
X-Received: by 2002:a17:907:6ea6:b0:b93:c5a9:a5e9 with SMTP id
 a640c23a62f3a-b942db854e8mr585699366b.4.1773082216119; Mon, 09 Mar 2026
 11:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 10 Mar 2026 00:19:58 +0530
X-Gm-Features: AaiRm51K4xV8rPWNxLGo_P3SgtaWeN6UkUVkJtFc0B8zhHQGEqIMu2rC6apEjTo
Message-ID: <CANAwSgRcatU3BQrsd11kA-nj_xos_Oa_47p0P_K+RYrB6QtfXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Iker,

On Mon, 9 Mar 2026 at 17:11, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
>
> This series enables complete SD card support for the Spacemit K1-based
> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> high-performance SD card operation.
>
> Background
>
> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> currently lacks basic SD controller configuration, SDHCI driver
> enhancements for voltage switching and tuning, and power management
> infrastructure.
>
> Implementation
>
> The series enables SD card support through coordinated layers:
>
> - Hardware infrastructure (patches 1-2): Device tree bindings for voltage
> switching hardware and essential clock infrastructure.
> - SDHCI driver enhancements (patches 3-7): Regulator framework
> integration, pinctrl state switching for voltage domains, AIB register
> programming, and comprehensive SDR tuning support for reliable UHS
> operation.
> - SoC and board integration (patches 8-10): Complete K1 SoC controller
> definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
> with full UHS support.
>
> This transforms the OrangePi RV2 from having no SD card support to full
> UHS-I capability, enabling high-performance storage up to 208MHz.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Changes in v2:
> - Removed custom AIB voltage switching code per maintainer feedback. The
>   existing pinctrl driver already handles AIB voltage switching
>   automatically via power-source property changes during UHS mode
>   transitions. This eliminates code duplication.
> - Squashed regulator and pinctrl commits into single voltage switching
>   implementation.
> - Moved voltage switching callback from dynamic probe assignment to
>   static sdhci_ops declaration. Removed redundant SDHCI core call since
>   the framework handles standard voltage switching automatically.
> - Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
>   conditional for SD/SDIO cards only. This follows vendor driver pattern
>   of differentiating SD and eMMC card handling.
> - Include no-mmc property for SD card.
> - Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com
>

Thanks. Please include my tested with the SpacemiT Banna F3

Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

> ---
> Iker Pedrosa (7):
>       mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>       mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
>       mmc: sdhci-of-k1: add SDR tuning infrastructure
>       mmc: sdhci-of-k1: add comprehensive SDR tuning support
>       riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>       riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
>       riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 ++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
>  drivers/mmc/host/sdhci-of-k1.c                   | 252 +++++++++++++++++++++++
>  4 files changed, 372 insertions(+)
> ---
> base-commit: ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
> change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
>
> Best regards,
> --
> Iker Pedrosa <ikerpedrosam@gmail.com>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
