Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC9261586
	for <spacemit@lists.linux.dev>; Tue,  8 Apr 2025 07:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097044; cv=none; b=EiVtkRP7S4bjqgK5U5wYB6N0MQTnUARIOBlVq+OpDG+5HkF22MyNMYRYIx3rwvcSmgs/sWThA0dn3kRh2Q4nmPxFFBf9d8wSDjvY1rshOBJgv1he20fqrzC/kEFWDOkNvcJbUr6nXDBEJAGyHuPqJ5GBAMMdEpxKA8Gg+srmKWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097044; c=relaxed/simple;
	bh=iTDpusoco6Y+4k6a2+IWTCtigaSRBwJqfYGPmGoeLII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvAJZIKUwLzpRA+dJiTY+PieIkwb7iWjTuTXiPZCFwL38AbHVqUm1tDndyyKQXzT0D6rm7oStgjVsEGH2qXH5H9HEP2nPYWpt9D6wJFNGFNccdqUIQ73EQQ743WoJnebb4qQeaNz7vpFT0IDAxZtF67l8bguLIqFBBMQSCAnl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51eb18130f9so2795366e0c.3
        for <spacemit@lists.linux.dev>; Tue, 08 Apr 2025 00:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097041; x=1744701841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=710dm2DYp+gy41dXZbNWGaKY57T4AIMJf61TXzyo8AQ=;
        b=d7wEvSIv3V2m2hdJv9/5X3e1IdhtySwBmxS4VPqC5VQfr8n9ddISyTNkKWXepdVTj2
         AlLCvElz4vrwBzZs+I/k87Zg2/7dUodoB8f4AsFi31TNCU5b20Pa497NEeIu0SAmc21F
         KEIKtEnqok0U7JfYJ2Cg2f3CiCy8BgXjrpmW5WnFqpijtbGzJutLgUsk1pnOUueZoEvM
         Qh7nTSxipDjjKZnaCPAu/zUv+DuURqoIRSz/kWSOnSoIBfvzVTvuopvSLZT+wYBGOMlK
         aKuFefo4Kc941awMjPWLcSVo4HFxzaL+ZHFOqkv5rLBlkHEpbocM0ZuUdteJgMWt2khv
         Ra1w==
X-Forwarded-Encrypted: i=1; AJvYcCVdIdrNX4yufUi4UbtmVIcfG8feckCzJJK/b08fFc4GPfpBGBVtJoSM6HJUOzhsxD2JbS3DRPo9zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJHO99K+07bG44MP6XAPLRZJzE7U8q/U7XT0awW0LsMPy3x6Uc
	QRY1Fl4FhWA6/7l/IOQ3LKoeRvn/dsKxYpMFiyhexr7x9+ZLT7ui2ihPZocL
X-Gm-Gg: ASbGnctg/g4N7qM67Keq4icqlYZyMn+M34+TeQ5jlUjZ4W1+0Nhk8twmgVk66rB9YET
	9TgVmvZHAP2T8A6v5iB9S5FjLr+mneEImtv7C1fnmyTUNNEN4Ulk0bBYX/WyCOi2J1bmz1oNGBD
	2LgVgyNy80FEcpQCqYFFNsN3yLFPldIpy9jjpcaZZYIQ3Hw3Wh5PYxZLDv6bIFnYJasMHG4js2F
	q1YaPGB1RgfyL5ZHInJYU3XRbMcbQafEGs+Ktm6KJ8y8EKh4mNwDMcm5MwA9H371ip8QhoaqLZO
	twGB9dknhMgHSYglSTSldaSBcVOLQ/YvfHBXoMFYyYrbBRo8b/gRJMPbLTU2dTJj5gVb070Ezhk
	JPEpjUgs=
X-Google-Smtp-Source: AGHT+IFLK0e3Q7sLMxQFgIkeXceV9kVm2MS5Z2TTmXsBSWISzj0H5O2tqTrABvvtjbertsos0enR7A==
X-Received: by 2002:a05:6122:a09:b0:520:42d3:91c1 with SMTP id 71dfb90a1353d-527645a5e5dmr10942707e0c.10.1744097040675;
        Tue, 08 Apr 2025 00:24:00 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5279b66c8b5sm271036e0c.37.2025.04.08.00.24.00
        for <spacemit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:24:00 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso2418279241.3
        for <spacemit@lists.linux.dev>; Tue, 08 Apr 2025 00:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPpfaFyMMUFJWnvV5dqqycJjy8ktaJfNLFzioevvmQl5YM9jnxYjqt+pKiIZd4bFx/S714LbN95Q==@lists.linux.dev
X-Received: by 2002:a05:6102:38c8:b0:4bb:c490:7d6c with SMTP id
 ada2fe7eead31-4c8553ba032mr12630312137.9.1744097040243; Tue, 08 Apr 2025
 00:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 09:23:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8ES618Hr+6xq-p11S573HcFKdRrz8sUc685yDa=cDGA@mail.gmail.com>
X-Gm-Features: ATxdqUGYGVzv3sgPFJoJZKKUaDCZ3SrbEz5zs3DshQWEXWWo_KwIHTOtR51_N8M
Message-ID: <CAMuHMdX8ES618Hr+6xq-p11S573HcFKdRrz8sUc685yDa=cDGA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: irq: support describing three-cell interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC devicetree

The first patch was already applied as commit 0a02e1f4a54ace74
("irqdomain: Support three-cell scheme interrupts") in irqchip/irq/core.

On Tue, 25 Mar 2025 at 23:08, Yixun Lan <dlan@gentoo.org> wrote:
> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:
>
>     gpios = <&gpio instance offset flags>;
>
> It also result describing interrupts in three-cell as this in DT:
>
>     node {
>             interrupt-parent = <&gpio>;
>             interrupts = <instance hwirq irqflag>;
>     }
>
> This series try to extend describing interrupts with three-cell scheme.
>
> The first patch will add capability for parsing irq number and flag
> from last two cells which eventually will support the three-cells
> interrupt, the second patch support finding irqdomain according to
> interrupt instance index.
>
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v3:
> - explicitly introduce *_twothreecell() to support 3 cell interrupt
> - Link to v2: https://lore.kernel.org/r/20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org
>
> Changes in v2:
> - introduce generic irq_domain_translate_cells(), other inline cells function
> - hide the OF-specific things into gpiolib-of.c|h
> - Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org
>
> ---
> Yixun Lan (2):
>       irqdomain: support three-cell scheme interrupts
>       gpiolib: support parsing gpio three-cell interrupts scheme
>
>  drivers/gpio/gpiolib-of.c |  8 +++++++
>  drivers/gpio/gpiolib-of.h |  6 +++++
>  drivers/gpio/gpiolib.c    | 22 +++++++++++++++----
>  include/linux/irqdomain.h | 20 ++++++++---------
>  kernel/irq/irqdomain.c    | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 98 insertions(+), 14 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
> prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
> prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
> prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7
>
> Best regards,
> --
> Yixun Lan

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
