Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8787840B6F0
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514057; cv=pass; b=aoE7T5HOh7E6BVBpfPxBbS7IdMZ+k/GHr4XHmO0LPNMNfp+nZ2JPIRHapvCZSWC7DyiI/NtEDCBRn3kdJSkSnbaGrnAVZlqNTO8oyW+scUhqMnCEDjzFbay6zwedyydDmadIA9kVvRHIM7tkz2HxquG+r0YXiE5lGnW/SKC4Lhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514057; c=relaxed/simple;
	bh=4pIi1AHFoV7bGajpZ/64rcrmUHojGu4W93E9mmQQP98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opXiAWU9VKcYQj/VJWQHe0eK+tM0gB1thnKHZhHRaWr8OzkEAPsQrLRUVDgRmlfVipFhFUNiFUQ9e6eAWlbJZnNhEJ6fleV2B3LWY2ZU1AZMp9yU5BnrcXf1nIPZYFl/Mn0A9QNjmiQIAMEUeZqAiu9bNZ+7W2F0YV47CNAq2wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LDdZb9LM; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LDdZb9LM"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8738c178dso3073884e87.1
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 08:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514054; cv=none;
        d=google.com; s=arc-20240605;
        b=avfMlTljWFhyVKGqiFitVeeH6a0Bs3LXm6SKVBGpD1U6fKUW3mYU6VFO3bLa46vYKY
         t2eAyjqLm+P8Px/ox0F/8EERd3vR7OqIRlIQdDN4I7v0aLZQqayfUVRRqEVvBSL9SWK7
         wwiS3PZlcDcPhVbnBItReR6pCzMt0RTnhxPVNpHfGh1OXT4+CEXalNxYu64B0NoHXP5z
         MUlDIjbnzjg55ONQDf1lSm/Je0PtnD5rHNMG4Suh/3Dtjm84QrcjRghLeBouNwsIsIQ8
         Dr5qJ16ngviXEEuKdpWIpmyZOTXHJeXXaMS3v3MtwviXCpMnxKGeGEhfF4v3EmdC5UQu
         VFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        fh=g/JQZiEXNt4CMYb9PP2vSyz0pEPbdAYeqoYZBmw4Qhs=;
        b=ao7WYjFO6ZwxDg+4zMakWZ1iqJ5+xbKpcim5Kd0OC1kDGqa4IyyEDNZNjX14eFyXYG
         rvPWCLzFJyRoZeAxx6k7l1enMsHSWEed0VISQ1t21Htwq3aA/f0MC/Ztn9nGd1bu23X8
         rpCUEk8jGMpgBS398AUzzge+//hsmHwkldE6A7t+JC4/BGgM/BV2oc46CPm8G5DhkXDJ
         SnXj9d7FTvYhP7tcpI5tkaZKKiGcWhDULYVistGzHyxA0MwoECHIPRYjsWk5jPWMIvyY
         Nstb4i5KX9DtvzLO/GRJ+sQEQk7lIn08HCRW1IdoNCLxuS68kKF0MZAhJ4LVvBHMK78J
         jwrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514054; x=1779118854; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        b=LDdZb9LM77PPzUW12eM4X9puMemDwSN8QmrvNsPxtQ6uB9GdpDl0xvfJB2g1D/3luW
         Oiw1K/4hkgI/NdTvq6yLCZGKeHiTYqvY1wdKUGqxXvHoYdDeJ/YoZL1DPYORXs8hpoJd
         f8l9rYyIODULf+AaTVlOueSkHSy3TrrU1C28ItUzbqN+ww2sABZ6PQD3TD9RBQbcea7a
         y251zmsYCuYZeip/6a+bSM/7BTmQLyWK+USdWxbJrntKbbg5/ty8GMSw48lN2bJcoJ6N
         ziiK9Gj6zCC4NVK/YFSXEQGGwG89FAWomBKNVPDobeq16z9bu9n6rmu6wdrJ0cCo3dN4
         ipsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514054; x=1779118854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        b=IFN4evlF79l7KLXR5bAyw962jvBgvQqqcr5JY9S8Se6SuESyvxtMwuos8bZ4oUndTN
         QlzTNPSXFjgGXL6AhMq2gUN9zN7oKH5VlJBgLuxNd23zkNk9omP8yIjqszFtucEaidhO
         49e8Pi1dKpW+/aISETlykgH9aXeyZDZYlWonpqnf2aM4uVoBxUpn6T3w7GreaY05mxzm
         bBZ0ygkct3q8nnNDGdMLTUX+y5NNwJ3de0zx1vzJvPnN7hLEIWTqjgLH0qBD5kC4jOEd
         IX/HEzm4ADKyt0wcKAzPdjWzicrcCyZPU4ie4+KxHYsfzSKzs7t5XGf2b8ZuqX85ZPJG
         3/kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EPxjuOaYv4+GR1oSEY7d9y/0C580N0lo3Y4Ffsw+jksGQ5hqjC4NzPqV3ICnGpWs8hccBmX1RKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2lMKcrpb0fP9S+/IW4V6QZwT8ZkJ36uM4wBaK2cN7ZFYpMWdd
	85gZ3sMrd51VvRjlJ84vdP8Ner5PyYorrYCwue0cM74Fx6MHVnY3EAUpE4KRjiCpLcYbqUBs6GS
	0paYYi3ZXR1cJXPmRvdRZCC6N7Qp0d1hLfLSGYY3kOA==
X-Gm-Gg: Acq92OHgbWMlAF1Qv3UCx2Vj9cNQuxaPaaJuOiUtGBEifAsUXkp+wIJuicacHb+U7gi
	1zGvxvb0KKOcnt5F//BAtFL6pTffC9GPbNtfrxGMgs3NikTOfXEvCiJn0Diqftiy8NFJcMaLCbg
	/aSemjGjnPexWemOFLIKEyiBdYyua9ab6nrWNCbb0roZBibffvqXT6V0m4MI93KMGPBqtyotDUg
	GJN0wpD1GQDGqGNiLINKQ7he0TIcd+cbfSAz7fftU9EIJ24XYN05L6efQhJ0djw/+99Yar9SLJF
	ra4aZNoW
X-Received: by 2002:a05:6512:3f23:b0:5a8:638d:6f53 with SMTP id
 2adb3069b0e04-5a887adaa88mr8185426e87.6.1778514053531; Mon, 11 May 2026
 08:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:40:08 +0200
X-Gm-Features: AVHnY4JG6GcAfGL3v7qotS87Q75eVy2s5uXmoBdyZ6OB2U_NOcV2oCmKoBt3Rb8
Message-ID: <CAPDyKFruD93LdDp3yuttXgzSjJKSrswRxMOqD6KP0UO3VzvZBQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/8] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Anand Moon <linux.amoon@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Vincent Legoll <legoll@online.fr>, 
	Margherita Milani <margherita.milani@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 10:54, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
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
> Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Changes in v9:
> - Rebased on top of "for-next" to include required infrastructure:
>   * P1 PMIC regulator definitions (commit c02c047b925c).
>   * GPIO pull-up/pull-down configuration support.
> - Updated BananaPi F3 SD card detect configuration to use GPIO pull-up
>   instead of "broken-cd" workaround:
>   * cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> - Link to v8: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com

Patch 1 to 4 applied for next, thanks!

Kind regards
Uffe


>
> Changes in v8:
> - Resending the series as v8. The v7 submission failed due to an SMTP
>   error during transit, which resulted in a broken thread on the mailing
>   list.
> - No functional changes from v7.
> - Link to v7: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com
>
> Changes in v7:
> - Remove sdhci-common.yaml reference from DT binding.
> - Link to v6: https://lore.kernel.org/r/20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com
>
> Changes in v6:
> - Add pinctrl support for voltage switching. Document optional
>   pinctrl-names property supporting "default" and "uhs" pinctrl states
>   for coordinating pin configuration changes during UHS-I voltage
>   switching.
> - Update pinctrl state naming from "state_uhs" to "uhs" to match DT
>   binding naming convention.
> - Fix MMC drive strength values based on vendor kernel investigation.
>   Correct 3.3V operation from 7mA to 19mA and 1.8V UHS operation from
>   13mA to 42mA to match proven vendor implementation.
> - Link to v5: https://lore.kernel.org/r/20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com
>
> Changes in v5:
> - Document optional pinctrl-names property supporting "default" and
>   "state_uhs" pinctrl states for coordinating pin configuration changes
>   during UHS-I voltage switching.
> - Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com
>
> Changes in v4:
> - Revert to start_signal_voltage_switch() approach for bidirectional
>   voltage switching: replace voltage_switch() callback with
>   start_signal_voltage_switch() to properly handle both 3.3V and 1.8V
>   signal voltage directions.
> - Fix DC input voltage specification: corrected the main power supply
>   from 12V to 5V to match the OrangePi RV2 board specifications. The
>   board uses a 5V USB-C input connector, not a 12V rail as previously
>   specified in the device tree.
> - k1-bananapi-f3.dts: add `broken-cd` property to work around card
>   detection. Using `broken-cd` disables hotplug detection but keeps SD
>   card functionality working without additional dependencies.
> - Add SD card support for Muse Pi Pro board (contributed by Trevor
>   Gamblin): enable SD card support with UHS-I capabilities following the
>   same pattern as OrangePi RV2, including dual pinctrl states, PMIC
>   power supplies, and card detection.
> - Link to v3: https://lore.kernel.org/r/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com
>
> Changes in v3:
> - Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
>   add reset support" patch.
> - Squash tuning infrastructure and implementation patches (3 and 4)
>   together to form complete functionality and avoid unused function
>   warnings.
> - Reduce code nesting: implemented an early return sanity check in
>   spacemit_sdhci_voltage_switch() to reduce indentation and improve
>   logic flow.
> - Refactor pinctrl initialization: moved pinctrl resource acquisition
>   and state lookup into a dedicated helper function,
>   spacemit_sdhci_get_pins().
> - Use generic regulator node names (buck4, aldo1) instead of
>   device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that
>   these PMIC outputs serve multiple devices.
> - Remove dead code handling 3.3V voltage switching from
>   spacemit_sdhci_voltage_switch().
> - Optimize tuning algorithm to use single-pass window detection instead
>   of storing results in array, reducing memory usage and complexity.
> - Remove unnecessary card detect check in execute_tuning() - rely on MMC
>   core.
> - Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
>   tuning support.
> - Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
>   following the same pattern as OrangePi RV2.
> - Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com
>
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
> ---
> Iker Pedrosa (7):
>       dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
>       mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>       mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
>       mmc: sdhci-of-k1: add comprehensive SDR tuning support
>       riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>       riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>       riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>
> Trevor Gamblin (1):
>       riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
>
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 ++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  22 +-
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  21 +-
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
>  drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
>  7 files changed, 431 insertions(+), 3 deletions(-)
> ---
> base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
> change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
>
> Best regards,
> --
> Iker Pedrosa <ikerpedrosam@gmail.com>
>
