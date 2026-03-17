Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51719385525
	for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778991; cv=none; b=UUEkCq4xxfQ1zMw9411m/UiA8RW7DDZLmMi8XxOmW9swuoo12S21uN7dFtKXvWEdhAHSHmXwQS6Nfi3F4lmCqIULzAC3wq/m6ondvIK/gSDVuxhonxEoKnU/jPtjt1rTqn7GnoJPm3Nel/7WmLanMCciAxuH6NEyEKhICREsPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778991; c=relaxed/simple;
	bh=1Tvow8X4Db0N1osozsscW2uTEW7kegN9/O8TPDZlMdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8Wwc+OGfYZab9lOX8g2a6gOCAowWcWO3+h9z4/LYKM/9X4waIYlOx1gnmStrt9zbGrYVAScF82gsS/FXdYLagxjgpUp1fIpjZDR0CrYg84o4eswK00A1EvxRt3W+p4nyAhNEyM/3CVvaklzmFSIwO8fadfqNs4GjU3IAPhafb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=j1ulWg45; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="j1ulWg45"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd73c4a827so534785a.3
        for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 13:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773778987; x=1774383787; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QyiDZ5RSYUOfAeS5ZUUKET2WqUdsSAGFaGllFAZ7XM=;
        b=j1ulWg45DnEC+MTZm8HPWIReK/F5P60J/S0Y1V7TrivqZIBzFohE2wxsI1vdl6ZHSd
         Owo2Ok0MRW6M/wm2uHkxcRduJswu0HjbV/qhIgBoPYtCnCNLT7n85TSUbVTrDc39liFB
         VyHwqb0zpR6rBHDyNO/OO10xbvty5NtSJXr0CA01sgXbs5oVGrOcd+iCUWxyIxvMg8E5
         P5Ggqb/3U3UjifqHpetr2zZIbJ3tGQ37ljBsRogrNEsdJVPUg6GZnnIwY8x/RReQinjU
         pIvJD2ko5jQ0es1UhvAr8Gsj+fHiQeU0mB0ZUpIASKcVr9/JfBzXTFjpgW+qVm7e3M1M
         TNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778987; x=1774383787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QyiDZ5RSYUOfAeS5ZUUKET2WqUdsSAGFaGllFAZ7XM=;
        b=IdcJO7L7C8Ee0snorVZBCE8yHIBA1xSaiWB08pnpDnFml3bDOPV2bOJ1STmAbLxKNe
         cTCYYCwmq/pIZpie+EnLPtIzC/H7b5xl5xHTbqFKRiQBBkqo+UGvMikt74f3CmS3Smf3
         /vbCwS5/fxKyWyumqahALUV0UZLwEgrindLIK0x6y7RnuuVjlxK9+JL+wjL7aXwRfT57
         VSHEo4AD4NZ/Q0xRtdznYyjHeWtPCOSlRzjg2sa96WqAgf4ynGLakosAdKzfkIATSiSy
         sTys85vq2aRAdcYHzH6AdjSs42T53k+ht3FpJmDL+CLRs1jlntZvW4m3TsSmdQk2S6l+
         dg6w==
X-Forwarded-Encrypted: i=1; AJvYcCVI//iSXKNv2Aw+SOUhbTlx118/zLc239QvAdExgkPgSMdh5ysVeF5jOz7hZ2BveCWAkMN8CaVsNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOFd0pPSYAKUMeWBOluvpGn9mDcuOGtrONp37ILOP8yJl0oM07
	v6S+OLoDUE3YqXB1mnJw7kC8cdx5or6HPFLrxZxzUR1I2v8e597ZaXpb1T9vOSeOixQ=
X-Gm-Gg: ATEYQzwOjc9zexG2203X9zxDzL8S8nxBbduOgFzfDnEJXneNUntJKC0F1Ga3XK5FoQ8
	nN3qX7l0DNc5MxBtzAZdw/DFAh91eOKvc5kNW6IKXxYw4x7izrWPLxUBXRjqgpmPluFcja+b3R3
	7NznOD6cSPfPajRL1vah8Nt4jZr6+qwWFladucqDFLKT1pP8FTnem7Drq1My3uNwjViXB4gxQy0
	u4PS7uXJ/IYkNgWs0o2s0ondofGrAhK6Ar7VCfMBU2ZjnBF2BuPdzfInW2ymcDq6GLsOUnTrKiy
	HG55n+r8ZxMFlKvQGg7OoKMho0cy++nk2HMjkGJXhnv0Gzl6AXUUfhHxabUJs73tfCPbOC7fg7g
	IEorp4NFCcWYIOFLKaJBZX8/fWqe3QU9BAa/62yD70heew6ok8W9mAAxqrdd5z7pGvjiNY1Mxv+
	7z5C5oCh2CXe48mnaizhjuEtKwRVkQT3/OGGBWnwzc44yeblkx806agU67FiRe6SguiSqN1uWZY
	oFc
X-Received: by 2002:a05:620a:bc5:b0:8cd:b90f:fc1e with SMTP id af79cd13be357-8cfad3df061mr133791185a.70.1773778987159;
        Tue, 17 Mar 2026 13:23:07 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfacdeb785sm57993585a.16.2026.03.17.13.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:23:05 -0700 (PDT)
Message-ID: <b3e1dfe6-b16a-44ed-82c4-b9140c91dd44@baylibre.com>
Date: Tue, 17 Mar 2026 16:23:03 -0400
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-03-16 10:03, Iker Pedrosa wrote:
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

Hi,

For all patches except 7/7 (k1-bananapi-f3):

Tested-by: Trevor Gamblin <tgamblin@baylibre.com>

>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Changes in v3:
> - Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
>    add reset support" patch.
> - Squash tuning infrastructure and implementation patches (3 and 4)
>    together to form complete functionality and avoid unused function
>    warnings.
> - Reduce code nesting: implemented an early return sanity check in
>    spacemit_sdhci_voltage_switch() to reduce indentation and improve
>    logic flow.
> - Refactor pinctrl initialization: moved pinctrl resource acquisition
>    and state lookup into a dedicated helper function,
>    spacemit_sdhci_get_pins().
> - Use generic regulator node names (buck4, aldo1) instead of
>    device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that
>    these PMIC outputs serve multiple devices.
> - Remove dead code handling 3.3V voltage switching from
>    spacemit_sdhci_voltage_switch().
> - Optimize tuning algorithm to use single-pass window detection instead
>    of storing results in array, reducing memory usage and complexity.
> - Remove unnecessary card detect check in execute_tuning() - rely on MMC
>    core.
> - Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
>    tuning support.
> - Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
>    following the same pattern as OrangePi RV2.
> - Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com
>
> Changes in v2:
> - Removed custom AIB voltage switching code per maintainer feedback. The
>    existing pinctrl driver already handles AIB voltage switching
>    automatically via power-source property changes during UHS mode
>    transitions. This eliminates code duplication.
> - Squashed regulator and pinctrl commits into single voltage switching
>    implementation.
> - Moved voltage switching callback from dynamic probe assignment to
>    static sdhci_ops declaration. Removed redundant SDHCI core call since
>    the framework handles standard voltage switching automatically.
> - Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
>    conditional for SD/SDIO cards only. This follows vendor driver pattern
>    of differentiating SD and eMMC card handling.
> - Include no-mmc property for SD card.
> - Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com
>
> ---
> Iker Pedrosa (7):
>        mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>        mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
>        mmc: sdhci-of-k1: add comprehensive SDR tuning support
>        riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>        riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
>        riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>        riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  |  23 ++-
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 +++++++
>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
>   arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
>   drivers/mmc/host/sdhci-of-k1.c                   | 243 +++++++++++++++++++++++
>   5 files changed, 384 insertions(+), 2 deletions(-)
> ---
> base-commit: f38f518dda1f1decc7a39556fe3231b0d1b84e1e
> change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
>
> Best regards,
