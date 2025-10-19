Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D245134AB
	for <spacemit@lists.linux.dev>; Sun, 19 Oct 2025 20:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760907228; cv=none; b=rrP8hcaz960vjJLfa4DISwGW0d9eGaPv6rv/J9aY8YomHC8UfnICZHaHZSD1cVtarrR0wVsMllHw6Ktcs3Deonu0go7nWR5jYaJaN1rA/klRrKg3kZpXpwN6//Gp0OQXX8iTrtxDXKoLe5NndbrLHIp5MY7Du1Y+cknVyd7Cs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760907228; c=relaxed/simple;
	bh=O2zfE4vf4ah1dibiRpvsd3NnhgM9Vr10uy3t41JeKRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ht3YDROBRRV769ONjv28acA8+JlJzxmpK2uq5sVNlLFSz8F6iJ7JAsUsJuda91DUtkqdVrLvo6chFR2qR8ZEXjvbDyNdz4+dVT0si98MiOAFk9KIfdHC8+gxbkTz2b+0Up5jp++odyNgatFQgbCRGyYKR/B7SFAaShJYBqQVHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EURviJdm; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EURviJdm"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-784826b775aso13768007b3.2
        for <spacemit@lists.linux.dev>; Sun, 19 Oct 2025 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760907225; x=1761512025; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bLIclD2aF84lUbWy0CIM8XnSXp6AC1BEWNN7dbQyLN4=;
        b=EURviJdmyGloGE0W5leccyjIJzzV26k7WmgJ86jdoTQZV+MKjZk8MZDVYp6CPaC2jD
         Jm28anUeggg0L6lRgU5iT0rYbhGUf1nHZnEzfbobzV8weD9Wd6yl1K1aKq9Us0DMQ+A6
         LRPs0CC8XXp7X1WLyUe3QS7mOil/x6TG1wOnyMqJ8oyBq4u8R2RMZBKGoAfYNlo/ljRY
         UUno/EEscWzFq85TX2OjMRQG757yHhesAgGMmwcyfCAKM5yv3bXoR6SyGiGhxLtwsOu2
         KEGmC/cZW7SPvC/4DGBolAIq7JtI0pKJTKoQHyP/+zkTK+uFY2Rd/JFcx51U52jWtfUv
         j1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760907225; x=1761512025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLIclD2aF84lUbWy0CIM8XnSXp6AC1BEWNN7dbQyLN4=;
        b=UFbCMLVbNIQMcw/HxMeM/1UT26JrGvkYUj9+VOzAzYKu1fowSQ9udHwV0DmrvOKUiV
         14HRCDFuaS2DmTEY4+sKRE3F9F6u4U+RXKXQz1A2Pj7x6OitzANLJg0XT0wmjRRj6nED
         FUisSPRs1SGCVsPXX3QHXQhRa7sQXtM6RlnTIonJjZ5nVeoibAwynAk66Wjfwne5nJvK
         qvcwVq74L8KqSWImwaisif12caGB6yMT1KlRVk9twQqgyB4apCcczW0r6uUtgh1fCogW
         aI+2Qj9UAGiX2DNgGDvCPHN/K8/L4w0weACiNuogUbTjIHDaom9h8q0fWlZB7Uq1EHr7
         x+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWoJDKnxr26jK/xDf1blQZ2kUFXSSkLogNMK3REB0RUEQtTIG4ZFWsMp6PXNzCQsDLQpWrjRnvzfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRYCP1pStnwMrnCUJgVhlmp1+ePpZbJQ2QLLDodeZYEI1FtjkR
	F5jZgMlQALMEb42iw+rcuuy1fzZhG/bPUGmsia32Q9XmmEQ6gtvbOO2Vxfo4mN4cdkoB/xafSdL
	Jm0g79fzDOfD7zDZcHqO3Z2KZDNd5lak=
X-Gm-Gg: ASbGncuOdXqXxtJdzEW0bVOrZzF4vcRg1wRH+2yQIrzq28HkRkfhTMeosMIVvCweaNu
	KyIJYjxffEMND6ftd57FrFDjTVh/F8vOqSSQZfZOxmoU/I3tUPMKvGVOs+TAbP1X3nSndnNT/I4
	b2HjbvbtmpxaZRKuZUISe3fr7o3v7J6ZDTKfVKmRwFHU/eAUbqCMgTu+u1PSvm7WfFvzYmljiWk
	xvkUnJPFOC+BbrfCV36XfJnBNSG+Jdd1V9Uuy19/uQTeXFRtan/aLORGzuMce9ZVPlstqP4l5NS
	ftIa
X-Google-Smtp-Source: AGHT+IG+VnVg4eeqtni24th+c8XSTz9bZ4o+eo5ggxBTkXyndw/uiD4XSbKqdvbqo7rPEXjxfr8g73d/jXS/Qyg3a7c=
X-Received: by 2002:a05:690e:4091:b0:63e:3c2a:c33a with SMTP id
 956f58d0204a3-63e3c2ad83fmr192995d50.12.1760907225531; Sun, 19 Oct 2025
 13:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251019191519.3898095-1-aurelien@aurel32.net> <20251019191519.3898095-2-aurelien@aurel32.net>
In-Reply-To: <20251019191519.3898095-2-aurelien@aurel32.net>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Sun, 19 Oct 2025 22:53:34 +0200
X-Gm-Features: AS18NWC8mas1vOpzBcYTdN6WQn4JlQUKb553pLiF9PjWnggz16K-ukTapFmx2g8
Message-ID: <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Oct 2025 at 22:34, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> chip, which is commonly paired with the SpacemiT K1 SoC.
>
> The SpacemiT P1 support is implemented as a MFD driver, so the access is
> done directly through the regmap interface. Reboot or poweroff is
> triggered by setting a specific bit in a control register, which is
> automatically cleared by the hardware afterwards.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> v2:
>  - Rebase onto v6.18-rc1
>  - Use dev_err_probe() to simplify the code
>  - Fix indentation of patch 1
>  - Collect Acked-by and Tested-by
>
>  drivers/power/reset/Kconfig              |  9 +++
>  drivers/power/reset/Makefile             |  1 +
>  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
>
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 8248895ca9038..063202923d95d 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
>         help
>           Reboot support for the KEYSTONE SoCs.
>
> +config POWER_RESET_SPACEMIT_P1
> +       bool "SpacemiT P1 poweroff and reset driver"

The driver code looks to be written to work as a module, but here it
says "bool" not "tristate".

> +       depends on ARCH_SPACEMIT || COMPILE_TEST
> +       select MFD_SPACEMIT_P1
> +       default ARCH_SPACEMIT

If it does work as a module I'd prefer "default m" here.

/Emil
