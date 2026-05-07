Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DC73491C9
	for <spacemit@lists.linux.dev>; Thu,  7 May 2026 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142020; cv=pass; b=V969BvZ8pL9TX2eU3NCM0/YOdVHZZvsuDAFoWyvz/llPxgaKnjIDxp5Unfmbc32ftTwYdBC2m5Mh7ExaEiJEvaOzMyD7TA5NttaAOYqiP/wJ/RqVA1qbfgae3nM5VzHYdwQie/Bh4y/WQ5t5VVakv0txYVCq0PAaoba8Ct3E+KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142020; c=relaxed/simple;
	bh=wajiAQ3MdgD5qZ4qOwSJHk+gv8ufR8tUJYp4k5ntU6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFoxuyQsLEyZ+GWJ7mk/HU7uQi1Z5jfh8GOEkuxJAS7RuqRl2UzTfvC8hh68tUD1ngVvhUxhPdNUTHjWoRvcVGhgpoEybYcoViEIXx0eil7ILJGHkpFf1wUq5Y/x78PjCbjrIjLpdKD0yJj4xdTVjqxiFLmE65EhG1zJN4mwVsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Z5jTIeGi; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Z5jTIeGi"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6948da50eb5so305461eaf.1
        for <spacemit@lists.linux.dev>; Thu, 07 May 2026 01:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778142018; cv=none;
        d=google.com; s=arc-20240605;
        b=LLAylYWupJoobaCgnQxzVZctHaYwVwedWZrDSQCOkQOd92KFz4BUsxyMu+qwzhZOI0
         vTWLLOX9VE2AgvGh0V08lOQuWz1ia/LH9RM01LZYqcShKh+seazW0VP1B7EQQtnrsI79
         hThjTRUIYHOaflJbl+my4EdrMUCngDarT6Z4O4G6Mk25OpVcUUvZI+PLo/HXy+PgkjRX
         srHKNf/wcZd6nbB/vwJ4DUQTP6d+DJOoBnC3FiNesbjyfVXLLczenxqPjYK6FP8L7ERw
         /KiZ+T4EM+IQQBDl/v9Sx0H/dKXmpHSCbPMU5TLInW9+9x+o/m2P7RcsFkJZ2Wq8LJrE
         uhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        fh=dHCptr6FCVxZmlsxt8Z/WasLhQgK7LWKQrANjIHp/8E=;
        b=HgBM6Wlo2PdhDLkQA6zaQhH6DdoNyZyHLxIR8m63N/9hY4hHb4PzhN10WUKU+eyYEI
         D08p/dwDSRzd89rIObspA/IWZm/fbjipQ4ULJA84BtxoXQuhHe719YxXn6YBFw3WvcMz
         OUTneJtwfZpFqa3RDw0duN6ZUvfxMfHgZSl1AL+Erhhdwsx4RtF+QAl979xPAEVVxo/w
         Q+PmrwfvYDbi16FSsMTiepVj9/zTA5QzTcIe/IuGZ3sNu1ZsMaqfyrOJkK6Xr9+FVN3G
         HD/J83wzRueB9t+WfdiP1LaFNWYynn3+U+xEE7dFLCHXOfUudONfixyCglx6Pax8ngBj
         DJIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1778142018; x=1778746818; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        b=Z5jTIeGixW/KqaUcIS5bSyoS4nLXbt0xKxk7n++HCXN8s6tTpBmBuO/ItcxqbGNMo9
         p2vAQbejiiTuKfAVFnO41+Vm2RleckYi71z8EDIOAxPXEy8C1wag9fEMZg3G6+TTTVwN
         Cuk/rzsPIvb23QiZfT9mxlne5z1YlhS/xgmNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142018; x=1778746818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        b=hjgY0aDr0DhcPHR/kzQ79o6BZyVweiLskVlhhUiQVd2hayihf4Yu+I+1Pld88Owt7D
         cQNy6ByyUtO92fwvkSKxR8yiT8i6QRn0dmRVVBsqer9vkb7UvnikOIAqh4pRQNRrflo7
         XvOjqhN9k5rv4kXaY0Pu4ewlod5JaSy2aJ1jBsLJok4op27IOL2xdReBfAR30Qkx/mJH
         /XncVld0Dji0GAw+VUNzSFd0/vHwDlfDxEotkG2w3IXhZ5GbBYtZQxXc0qkqL9IDCRcj
         eon9t+3neH0/m3KjqnxCVVgI3nMRnO2Bfgp34HsJpo+lWaBbbHTRTZS68qYW6wufsoPD
         lY7g==
X-Forwarded-Encrypted: i=1; AFNElJ+g6cjisRE6rSGdf8MKg1PhzCXu3rFThLhpM/pokZ6Q0oBPmpmzLze0ErDUL9ZmqgrJJtqjh0SarQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvjz9X69I1/rt2assWyzzGD5QmJL1qLPjMmAUT+1Lj6thF92Kk
	LytbK30ZyWzwgb8qGIvX50OxBKowjhXvHurJYMyZM57XATa6hqc2Vxu5p2wuR25oVXUolhMtyaz
	IlHcKPUVTMuPIvSMaRcvU41g1ya/kM6wvruc8DdgNKQ==
X-Gm-Gg: AeBDiesb7K8FDgjIS0pdz12QozO3vvfGHuHumbKCZRA+oYspRnxwVOu1Zaq5itUC3/i
	kZMuibRXx7zAgIsLTH9siJC0joUOmB1Y8wXh0t9AaB9BmgWW9J+IYuWqkNpPdJRMTr1zwihQsH0
	ZJJzc6Tcc78VLC5gnqFmSwhUmRzgDY00FP6tuelt+2/71fjUkWxjLKpU/gFdGrwrChtoBUxuX4x
	Et+PJOfNb8UOIdrvSj5V5uk2TynnAycvvG+OJZ1D7iPtc8kG1jitIqZt233FsHc5TS3dC2kW2kh
	zABtYAesoq1ShFUJnKTJorAdIdM1MdcKmCfmevZBdo6vkOG9D24=
X-Received: by 2002:a4a:e60a:0:b0:684:5e35:6091 with SMTP id
 006d021491bc7-699ab62b9fbmr808519eaf.26.1778142017994; Thu, 07 May 2026
 01:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com> <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
From: Margherita Milani <margherita.milani@amarulasolutions.com>
Date: Thu, 7 May 2026 10:20:06 +0200
X-Gm-Features: AVHnY4L7xr25tCAps8SxEp-5ZjcE9EGySyy8fEWRsxHZhWT1U2K2LtQjEajPjlU
Message-ID: <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good morning Iker,

> Add complete SD card controller support with UHS high-speed modes.
>
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes


Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>

However I noticed it only works when CONFIG_I2C_K1 is enabled.
Michael Opdenacker told me it's necessary to enable the regulators
used by the mmc controller.
Should we add the dependency between CONFIG_MMC_SDHCI_OF_K1 and
CONFIG_I2C_K1? (Unless some boards don't have these dependency?)
Thank you for your patchset which was really nice!

--=20
Margherita Milani
Embedded Software Engineer
M. +39 334 758 9111
margherita.milani@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via le Canevare 30, 31100, Treviso, Veneto, IT
T. +39 (0)42 243 5310
info@amarulasolutions.com
www.amarulasolutions.com

On Mon, Apr 13, 2026 at 10:05=E2=80=AFAM Iker Pedrosa <ikerpedrosam@gmail.c=
om> wrote:
>
> Add complete SD card controller support with UHS high-speed modes.
>
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
>
> This enables full SD card functionality including high-speed UHS modes
> for improved performance.
>
> Suggested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 +++++++++++++++++++=
+++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5790d927b93d..a7d88564630f 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -220,7 +220,7 @@ buck3_1v8: buck3 {
>                                 regulator-always-on;
>                         };
>
> -                       buck4 {
> +                       buck4: buck4 {
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <3300000>;
>                                 regulator-ramp-delay =3D <5000>;
> @@ -241,7 +241,7 @@ buck6 {
>                                 regulator-always-on;
>                         };
>
> -                       aldo1 {
> +                       aldo1: aldo1 {
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <3400000>;
>                                 regulator-boot-on;
> @@ -367,3 +367,23 @@ hub_3_0: hub@2 {
>                 reset-gpios =3D <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>         };
>  };
> +
> +&sdhci0 {
> +       pinctrl-names =3D "default", "uhs";
> +       pinctrl-0 =3D <&mmc1_cfg>;
> +       pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +       bus-width =3D <4>;
> +       cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +       cd-inverted;
> +       broken-cd;
> +       no-mmc;
> +       no-sdio;
> +       disable-wp;
> +       cap-sd-highspeed;
> +       vmmc-supply =3D <&buck4>;
> +       vqmmc-supply =3D <&aldo1>;
> +       sd-uhs-sdr25;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
> +       status =3D "okay";
> +};
>
> --
> 2.53.0
>
>


--=20
Margherita Milani
Embedded Software Engineer
M. +39 334 758 9111
margherita.milani@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via le Canevare 30, 31100, Treviso, Veneto, IT
T. +39 (0)42 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
