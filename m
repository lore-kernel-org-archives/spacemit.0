Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792925016;
	b=GTZmz7Klh8MjLibanpyX1OYwsYSH0t/G5S4e/f1HiUZ8tMw/zoqGWNQALKErxPQIw4rl
	 4eHVzWEFAfDXOxHywHNj54a70TiSj5tvYZUovyV9sEJ0Z8SY75nF7m+dLNyx/yhsw6W+R
	 RN4fIyOFoe1spKfX3mQhVsjL7vPImEWPldBy2UHAQy8dGCsFWVYGJMR9sIacOKdxEFxGi
	 Jhs92lx55H4KG2d1dDDuECRSXHCp/2FRbpS80wJaqB6WCn6Aqws4zxlgq6MSG98Yeoebg
	 8ksKnfq94ThzCPeLS2yKF/iAyG7CURs+R29KSpL0+4ixH8lIgo7r5P+SUeC+LuqqUSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
	b=kjwv+hzFICI93JHqj4CiqTKxqyN9miu1u6zD83r567U01M2wvErdBDqi0HXnEaZ6rdLd
	 5GhNqnH9ud1C+d1bUjQKR+cMP0UTWOUG+/jh0JNhyRkHW+PCsSBqI8wiRB64CXR/u7SRd
	 Bk5a3AO7wN0LPybWk1dOeSqbBWse1DKsAFHhr/p2S7Qith6LRrTrpUuJ7G0hUZ8/tFi1F
	 GtuMx9d25S0S+ds9MsfENguR3dRs+ahQxzWVn0uD7m2EZexA1GVcRw9RDhiaZCRyb+wcR
	 c6zoIell1e7Y+pJPv5jPx5fb8NvK82rDGj4Odd+lhOiSm9Ok1h+Mte8uYAFQlmSTixw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S7GjemVM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CFB606A320
	for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 10:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CFB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S7GjemVM
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2996072a12.0
        for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 03:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792925014; cv=none;
        d=google.com; s=arc-20260327;
        b=nwXIMT/x9xtEw2Cc6s5qqBoGDBwlU1Xc7T9jTWY3q+kIStMkuGCUspzag18Nnm6hlw
         +bdGu3vEi6pHMuOBiBK147Q4jxYtayNwRiORt1is5LW7xjGvDtFZ03xCvGpawGtngnQD
         dVTMAgHq87kkfFzbwsfDhC5oRdzf2fj4gJL7BD4mvld4LYILvO3sHjOC0sSD0gz+cQSn
         KwPlzrzJIOURRUm3izToZdJS9glOeHWIj+lkIuwXfXr2+DCEoVLb5rxybpcgoqInaomJ
         81rIgkF2FBAooxaJuUzz9Xy1gwBKXCcVGaEttf/s8EuXDUIq2DTrA3jvlyqIaBkTQo42
         Kgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        fh=2YCpqbzi1oaukiPaCjDUMehtL8barIWYdP00Zuz6skA=;
        b=HhoxvS95vw/vVsr9GqW27MO9tPmrwkJhzJAmMYF5raVHK6p+1pp70MvrRKsGdPO32F
         7bq7awj+3n+jO6wVNWPMFIBVcnVnnwPw2TlZY8snSskpI40iuL76nxGQPzCpdJj4ZX1j
         jKSkrBsuV0gVvtBhmlu9YxDWztK7VQJFJpH6gE+ySWoktrgak8tRdOy5ud1O4rukj0Kj
         09n2MQZA5gaH58iHOWCTesiT9FiSj5Zwco3rUP4dEJIpnMX0EYvhEBTvK9lydClEcSuF
         aIttROhNdFFMuympK3NzaM73oofL2ZfFKKx5XfCTn+FPldRvdk+9/GRDhLalObUaAtZD
         D/sA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792925014; x=1793529814; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        b=S7GjemVMMFpbNTP6LIe0E6MbRAb3u0dgy0bxC+TmFafZe8IheSn+vdUK4zz/Vcs1gS
         y9BWHUhAhcYEmx4+g8x6RqjXq0l+rAYR5CrSqQG/K6eNyNsB6JNLHtgWvF8lOFUndrxt
         BePVgbdoHS+qtDgOMLjDRi/gsACt1Bt02L0TvTOjKc5EH3FTV13SoEt7WpL+Q+9EyUnt
         OH/KsLm5TtVeVJOWJclTKmA7J+6n2eP8F9d/so07sWugUfstksPocPYnFJwZE4qQLDp6
         b4MxJ7BBl5PDpZbnI69XBABAow8u71KDJ1bJN9vVbDQWwbeCzl9odWuUidd/CIENtUGe
         LAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792925014; x=1793529814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        b=vyq4c4Ly4c+ogM7LFTazGpevI4EoJ3/JQ7qaWfMK778XzPGZ9ys1lD6oMEva8IC8H3
         VR9HvTncZee6xdLDsC6/gSzsZTAh/bPQ0tZQL3icIsqctEd/NZqlfr4QhOckPLAxjZr0
         aC0aPEakECgVLQzoizWaJQ67leZy0f68ikjXQEuV0yyhBvJ7S/AOzHkVCmMBNHRpNXrd
         ezVy7m7JbhIGmTD1Dmyp5K6di/SyJ/Q3T+xtz74k6GNhmB1O8YOdy5kOx0hXHnqMJuvR
         bFpZwvun8wl2tb/6qu8jjfz+CC+/olLuCoG0vlCQOeMtXvXWBtZ9qIl3UwlIVO6bE/a4
         2SAQ==
X-Forwarded-Encrypted: i=1; AKwUvByVWQhGw9+0YB0V0jT1zJuf5AxomnpUiPCoMaLnvql2VZ9dcj+JEa4iN0/kYF7sWku9FsDCevejDw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIDFWVQ+qyKhCYTwsrMXgBopa9Ait6Pj88B/drQ5gV/CNNwr8Y+
	bXXvo7TG0NZS/MjO3whsx2gA7GYKRgyr+2nZnV7c574+irtwv61xjyWHv6pl/x4flfXB0jN1Gbp
	0Vxogaj2Hxvy4G1pkqiLwECf7GZLRKfo=
X-Gm-Gg: AYBFou0EBKrhpz0FuaLVEmhBimGquyPo+ggxSuPo2nfkSWJBo8OSHjGNu7lrzsjsOEF
	5U0WD6XUnYpnBXkqgql2oVOPA6ZhhO8lclppQMkK5qX+dtedLwht/KVfFi9+Uhai1zCgSyl2qkL
	a1moh3dNRvLZh/QsGBICrSe0nXZemu3yO8W3D4U/K7dEiFnVQGCDXPIS9LYYWfJlb5C0jSlQOo7
	qs8xyslHUyjagSbi/zf7wDOx1DN/109uHgSKDCQROT0WeIhhQSUsbjO4qLKl34jFtiv99BV3tQv
	SsU2ppAHgxJd94eLqI65eaPlaiNl34rD7Z9pWdT4nkVZeEUA5GvyKCQwkc2y4VP+qqHrviS9Vws
	QEGf3wkAr2BTV4CI8IiwezHdBVwetyVdtpGQ=
X-Received: by 2002:a05:6402:270c:b0:6b2:20b:aed4 with SMTP id
 4fb4d7f45d1cf-6b4430199aamr5305867a12.38.1792925013523; Sun, 25 Oct 2026
 03:43:33 -0700 (PDT)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com>
In-Reply-To: <20261024092558.143621-2-alan.tseng.cs@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 25 Oct 2026 16:13:16 +0530
X-Gm-Features: AclHuK-kOeWVKlgsWorJqSjEZdHZLjS8gQzZJLPBLsv2jCYHjrUYgUabSVC5ZyA
Message-ID: <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, E Shattow <e@freeshell.de>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hung-Chun,

On Sat, 24 Oct 2026 at 14:57, Hung-Chun Tseng <alan.tseng.cs@gmail.com> wrote:
>
> The K1 BootROM loads the next boot stage from SD, eMMC or SPI NOR into
> SRAM, and that stage brings up DRAM. To do so it needs the fixed clocks,
> the clock and reset controllers, the console UART, the boot media
> controllers (sdhci0, eMMC and QSPI), and two I2C buses that every K1
> board wires the same way: i2c2 to the EEPROM that holds the DRAM
> configuration, and i2c8 to the PMIC that supplies the SoC.
>
> Mark these nodes bootph-pre-ram, the phase that sets up SDRAM.
>
> Reviewed-by: E Shattow <e@freeshell.de>
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>

Thanks for these changes. It helped me a lot.

Could you update the pinctrl and GPIO configurations, including all
necessary pin
assignments, to bring up the SD card, PCIe, and Ethernet nodes?

Please ensure that the required bootph-pre-ram properties are applied
to the relevant
pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
SPL initialization.

Additionally, could you update the regulator-name properties for
vdd_core, vdd_1v8,
and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
to locate and enable the corresponding regulators during early boot.

I am verifying the changes against the existing U-Boot board device
tree and configuration to ensure
that SD card, eMMC, PCIe, and Ethernet initialization work correctly.

Thanks
-Anand
