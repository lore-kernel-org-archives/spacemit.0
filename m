Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187461F460D
	for <spacemit@lists.linux.dev>; Thu, 20 Feb 2025 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740058510; cv=none; b=saQFL30bhiM8qdOpSEBhYyRZ1FrywA1m58fi5sqLi9TTwUUjDsdn9Ao8HaA7dp6A1hjyhzLkfkAGwpAKQPomTjBPtZfXNLzjapCFgw4kGLXDIL1V78uY/HmTwYjuaXfDNIFlZ7BkrFa2yYQ3iy3fT45hPRZIakgqOjuHHDYP7CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740058510; c=relaxed/simple;
	bh=9PZ++y3xt3XHwa/mPIRCaXrYx4wweHqfcu/qZ0OszDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8nfFktwLAZiKiwlO4F6NHamawKV6wZn5x2N0/eonn5hnrTRteEBQQlBioPf4BDEyvmWNr+8Oy6gSKi4STyY1IEu+KZ8RjTBnQ6OKaGDYUQ4wwHv2KhwK3soFtH0ifCpLgYP1++UvJxsG4L592IM7t/Ftf2LPRfWsMNnZdIZUzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ldu9e3Jm; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ldu9e3Jm"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-546267ed92fso1144192e87.2
        for <spacemit@lists.linux.dev>; Thu, 20 Feb 2025 05:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740058505; x=1740663305; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu+yuuRtverNnfV7CEa2S+Jw6VzXTCpMdAi/bxfVQw4=;
        b=ldu9e3Jm2lNAS3wWOvo8G7QKl43a4rTF5oeQq1ESPBKn1zEFiWwqwISPOymZ/we6Eq
         PTf1XXNqsguMF10sTIC/W8seH88NcSs0wJLM1dmPwB5hSGWh0PTYnBmxBX0a5iskMCsZ
         hCfvg6PX4PnyypITT+hzawFsjroqpPwJ6ynH7S2kc82y33NMShZpjwtFj+oS2u5g8ejC
         Eshy8csk4OwIN/ISrtehPsI4GqnbTs8Qjyo+t0A6raxEgO1kiHStY0a2P2KOmJO4bHEX
         aglwLYW+CZX+eAHKaxKKyGhQpYbuSQFgDsbZvdFMVjG+lSiVfT2ET+EkiIxARBcoHu3U
         elGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058505; x=1740663305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cu+yuuRtverNnfV7CEa2S+Jw6VzXTCpMdAi/bxfVQw4=;
        b=Q/BJ1H3i4GNfP72xF0h1/Bjk8tD5pFwvoNVi8PgtF0SmhwmCUae49gKg8HAlek7bcm
         lCgUoMsgj6NLF7I7GiEFVdeMrQ3GsOKYiHSutGjaLZqgwwB1mEOvNHI0E3NzmbI9zZiu
         +W6hfiXwY6CTkhRfQ14STmyVnNAcDCdRo9UaYr5IQgd2tyq84GerOly3BlrlwsyhKxBa
         wss9ByEzJVCFoxhPzkCFDmLIA98COlpi4Kzn0shc6yXs//xhPT6LG8fs6KzBQkPgKP6d
         eg0A9v9aN1ciLoMra5c84GAA28xR0TwsCf9OyB/TNlOK7Wy32GzPa3McCWsLdR2dDZjY
         zt5A==
X-Forwarded-Encrypted: i=1; AJvYcCUnYeH2DgjSDaaYFTbnOkeOa3HLXzpEn3fSObAi20J7gn7PPPEWp2Z2qWoZXhYbTH6R/Xff4F2rLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkpXQNU1EFgq9LYyvIsaF1Ca7YX9w89HidrnJlwYl32qlcOMgi
	XNd1miF4PZmEwrRV/ibdrH0B7ntoIUqMUkjIz508z0OYBJunwjKvPJK3xeEakOZRLcV7IWjJJ3c
	FRK+JTumGb9eTczaA9VoRqhkzherN1r+rwo5cNQ==
X-Gm-Gg: ASbGncusZJgkXsJNg1LV+uFod67FHD7KZ5wMg9JH3XKjvlhN1Pl3VD/bg00S0v8tpDX
	PsmOm8+yEA/52HMzERe1yNDXyDrEwxCplaz4Q9RwIYeGazE3iAgC7Rnevhg84Xaq6Sieywmdqlc
	EHLlKAkHk5e5evdPVgXJjqJVFWUC8=
X-Google-Smtp-Source: AGHT+IFJ3Y0moWRQsY2c8tqZCGFfDGCfNZYg34cHr9rCFua7sjfN15bz8zN0aW1pb87hBmfMAH6ugfaI4rvnWWeRZuw=
X-Received: by 2002:a05:6512:3996:b0:545:6ee:8391 with SMTP id
 2adb3069b0e04-5452fe264b1mr6949747e87.2.1740058505047; Thu, 20 Feb 2025
 05:35:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org> <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 14:34:54 +0100
X-Gm-Features: AWEUYZmF4BW8tczWJtj_gkZTWJQ3mFxBW1aKBgpwMeBwR0_JdkXbdA_CKp09ykM
Message-ID: <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, failing, or both edge type trigger.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/Kconfig            |   8 +
>  drivers/gpio/Makefile           |   1 +
>  drivers/gpio/gpio-spacemit-k1.c | 376 ++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 385 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index add5ad29a673c09082a913cb2404073b2034af48..eaae729eec00a3d6d2b83769a=
ed3e2b0ca9927e5 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -655,6 +655,14 @@ config GPIO_SNPS_CREG
>           where only several fields in register belong to GPIO lines and
>           each GPIO line owns a field with different length and on/off va=
lue.
>
> +config GPIO_SPACEMIT_K1
> +       bool "SPACEMIT K1 GPIO support"
> +       depends on ARCH_SPACEMIT || COMPILE_TEST
> +       depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say yes here to support the SpacemiT's K1 GPIO device.
> +
>  config GPIO_SPEAR_SPICS
>         bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>         depends on PLAT_SPEAR
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index af3ba4d81b583842893ea69e677fbe2abf31bc7b..6709ce511a0cf10310a94521c=
85a2d382dcfa696 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_SIOX)                     +=3D gpio=
-siox.o
>  obj-$(CONFIG_GPIO_SL28CPLD)            +=3D gpio-sl28cpld.o
>  obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) +=3D gpio-sloppy-logic-analyzer=
.o
>  obj-$(CONFIG_GPIO_SODAVILLE)           +=3D gpio-sodaville.o
> +obj-$(CONFIG_GPIO_SPACEMIT_K1)         +=3D gpio-spacemit-k1.o
>  obj-$(CONFIG_GPIO_SPEAR_SPICS)         +=3D gpio-spear-spics.o
>  obj-$(CONFIG_GPIO_SPRD)                        +=3D gpio-sprd.o
>  obj-$(CONFIG_GPIO_STMPE)               +=3D gpio-stmpe.o
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit=
-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f72511b5ab8f8f0b1d1c9e89d=
2f9ca07b623a866
> --- /dev/null
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/property.h>
> +#include <linux/seq_file.h>
> +#include <linux/module.h>
> +

Please order includes alphabetically.

> +#include "gpiolib.h"
> +
> +/* register offset */
> +/* GPIO port level register */
> +#define GPLR           0x00
> +/* GPIO port direction register - R/W */
> +#define GPDR           0x0c
> +/* GPIO port set register - W */
> +#define GPSR           0x18
> +/* GPIO port clear register - W */
> +#define GPCR           0x24
> +/* GPIO port rising edge register R/W */
> +#define GRER           0x30
> +/* GPIO port falling edge register R/W */
> +#define GFER           0x3c
> +/* GPIO edge detect status register - R/W1C */
> +#define GEDR           0x48
> +/*  GPIO (set) direction register - W */
> +#define GSDR           0x54
> +/* GPIO (clear) direction register - W */
> +#define GCDR           0x60
> +/* GPIO (set) rising edge detect enable register - W */
> +#define GSRER          0x6c
> +/* GPIO (clear) rising edge detect enable register - W */
> +#define GCRER          0x78
> +/* GPIO (set) falling edge detect enable register - W */
> +#define GSFER          0x84
> +/* GPIO (clear) falling edge detect enable register - W */
> +#define GCFER          0x90
> +/* GPIO interrupt mask register, 0 disable, 1 enable - R/W */
> +#define GAPMASK                0x9c
> +
> +#define NR_BANKS               4
> +#define NR_GPIOS_PER_BANK      32
> +

Please use a common prefix for all symbols, even for defines. Use
SPACEMIT_GCFER, etc.

> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_=
bank, gc)
> +
> +struct spacemit_gpio;
> +
> +struct spacemit_gpio_bank {
> +       struct gpio_chip                gc;
> +       struct spacemit_gpio            *sg;
> +       void __iomem                    *base;
> +       u32                             index;
> +       u32                             irq_mask;
> +       u32                             irq_rising_edge;
> +       u32                             irq_falling_edge;
> +};
> +
> +struct spacemit_gpio {
> +       struct  device                  *dev;
> +       struct  spacemit_gpio_bank      sgb[NR_BANKS];
> +};

Please don't use tabs in struct definitions.

> +
> +static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> +{
> +       struct spacemit_gpio_bank *gb =3D dev_id;
> +       unsigned long pending;
> +       u32 n, gedr;
> +
> +       gedr =3D readl(gb->base + GEDR);
> +       if (!gedr)
> +               return IRQ_NONE;
> +       writel(gedr, gb->base + GEDR);
> +
> +       gedr =3D gedr & gb->irq_mask;
> +       if (!gedr)
> +               return IRQ_NONE;
> +
> +       pending =3D gedr;
> +       for_each_set_bit(n, &pending, BITS_PER_LONG)
> +               handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n))=
;
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void spacemit_gpio_irq_ack(struct irq_data *d)
> +{
> +       struct spacemit_gpio_bank *gb =3D irq_data_get_irq_chip_data(d);
> +
> +       writel(BIT(irqd_to_hwirq(d)), gb->base + GEDR);
> +}
> +
> +static void spacemit_gpio_irq_mask(struct irq_data *d)
> +{
> +       struct spacemit_gpio_bank *gb =3D irq_data_get_irq_chip_data(d);
> +       u32 bit =3D BIT(irqd_to_hwirq(d));
> +
> +       gb->irq_mask &=3D ~bit;
> +
> +       if (bit & gb->irq_rising_edge)
> +               writel(bit, gb->base + GCRER);
> +
> +       if (bit & gb->irq_falling_edge)
> +               writel(bit, gb->base + GCFER);
> +}
> +
> +static void spacemit_gpio_irq_unmask(struct irq_data *d)
> +{
> +       struct spacemit_gpio_bank *gb =3D irq_data_get_irq_chip_data(d);
> +       u32 bit =3D BIT(irqd_to_hwirq(d));
> +
> +       gb->irq_mask |=3D bit;
> +
> +       if (bit & gb->irq_rising_edge)
> +               writel(bit,  gb->base + GSRER);
> +
> +       if (bit & gb->irq_falling_edge)
> +               writel(bit, gb->base + GSFER);
> +}
> +
> +static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int t=
ype)
> +{
> +       struct spacemit_gpio_bank *gb =3D irq_data_get_irq_chip_data(d);
> +       u32 bit =3D BIT(irqd_to_hwirq(d));
> +
> +       if (type & IRQ_TYPE_EDGE_RISING) {
> +               gb->irq_rising_edge |=3D bit;
> +               writel(bit, gb->base + GSRER);
> +       } else {
> +               gb->irq_rising_edge &=3D ~bit;
> +               writel(bit, gb->base + GCRER);
> +       }
> +
> +       if (type & IRQ_TYPE_EDGE_FALLING) {
> +               gb->irq_falling_edge |=3D bit;
> +               writel(bit, gb->base + GSFER);
> +       } else {
> +               gb->irq_falling_edge &=3D ~bit;
> +               writel(bit, gb->base + GCFER);
> +       }
> +
> +       return 0;
> +}
> +
> +static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct s=
eq_file *p)
> +{
> +       struct spacemit_gpio_bank *gb =3D irq_data_get_irq_chip_data(data=
);
> +
> +       seq_printf(p, "%s-%d", dev_name(gb->gc.parent), gb->index);
> +}
> +
> +static struct irq_chip spacemit_gpio_chip =3D {
> +       .name           =3D "k1-gpio-irqchip",
> +       .irq_ack        =3D spacemit_gpio_irq_ack,
> +       .irq_mask       =3D spacemit_gpio_irq_mask,
> +       .irq_unmask     =3D spacemit_gpio_irq_unmask,
> +       .irq_set_type   =3D spacemit_gpio_irq_set_type,
> +       .irq_print_chip =3D spacemit_gpio_irq_print_chip,
> +       .flags          =3D IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static int spacemit_gpio_xlate(struct gpio_chip *gc,
> +                              const struct of_phandle_args *gpiospec, u3=
2 *flags)
> +{
> +       struct spacemit_gpio_bank *gb =3D gpiochip_get_data(gc);
> +       struct spacemit_gpio *sg =3D gb->sg;
> +

Stray newline.

> +       int i;
> +
> +       if (gc->of_gpio_n_cells !=3D 3)
> +               return -EINVAL;
> +
> +       if (gpiospec->args_count < gc->of_gpio_n_cells)
> +               return -EINVAL;
> +
> +       i =3D gpiospec->args[0];
> +       if (i >=3D NR_BANKS)
> +               return -EINVAL;
> +
> +       if (gc !=3D &sg->sgb[i].gc)
> +               return -EINVAL;
> +
> +       if (gpiospec->args[1] >=3D gc->ngpio)
> +               return -EINVAL;
> +
> +       if (flags)
> +               *flags =3D gpiospec->args[2];
> +
> +       return gpiospec->args[1];
> +}
> +
> +static int spacemit_add_pin_range(struct gpio_chip *gc)
> +{
> +       struct spacemit_gpio_bank *gb;
> +       struct of_phandle_args pinspec;
> +       struct pinctrl_dev *pctldev;
> +       struct device_node *np;
> +       int ret, trim;
> +
> +       np =3D dev_of_node(&gc->gpiodev->dev);
> +       if (!np)
> +               return 0;
> +
> +       gb =3D to_spacemit_gpio_bank(gc);
> +
> +       ret =3D of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +                                              gb->index, &pinspec);
> +       if (ret)
> +               return ret;
> +
> +       pctldev =3D of_pinctrl_get(pinspec.np);
> +       of_node_put(pinspec.np);
> +       if (!pctldev)
> +               return -EPROBE_DEFER;
> +
> +       /* Ignore ranges outside of this GPIO chip */
> +       if (pinspec.args[0] >=3D (gc->offset + gc->ngpio))
> +               return -EINVAL;
> +
> +       if (pinspec.args[0] + pinspec.args[2] <=3D gc->offset)
> +               return -EINVAL;
> +
> +       if (!pinspec.args[2])
> +               return -EINVAL;
> +
> +       /* Trim the range to fit this GPIO chip */
> +       if (gc->offset > pinspec.args[0]) {
> +               trim =3D gc->offset - pinspec.args[0];
> +               pinspec.args[2] -=3D trim;
> +               pinspec.args[1] +=3D trim;
> +               pinspec.args[0] =3D 0;
> +       } else {
> +               pinspec.args[0] -=3D gc->offset;
> +       }
> +       if ((pinspec.args[0] + pinspec.args[2]) > gc->ngpio)
> +               pinspec.args[2] =3D gc->ngpio - pinspec.args[0];
> +
> +       ret =3D gpiochip_add_pin_range(gc,
> +                                    pinctrl_dev_get_devname(pctldev),
> +                                    pinspec.args[0],
> +                                    pinspec.args[1],
> +                                    pinspec.args[2]);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
> +                                 void __iomem *regs,
> +                                 int index, int irq)
> +{
> +       struct spacemit_gpio_bank *gb =3D &sg->sgb[index];
> +       struct gpio_chip *gc =3D &gb->gc;
> +       struct device *dev =3D sg->dev;
> +       struct gpio_irq_chip *girq;
> +       void __iomem *dat, *set, *clr, *dirin, *dirout;
> +       int ret, bank_base[] =3D { 0x0, 0x4, 0x8, 0x100 };
> +
> +       gb->index =3D index;
> +       gb->base =3D regs + bank_base[index];
> +
> +       dat     =3D gb->base + GPLR;
> +       set     =3D gb->base + GPSR;
> +       clr     =3D gb->base + GPCR;
> +       dirin   =3D gb->base + GCDR;
> +       dirout  =3D gb->base + GSDR;
> +
> +       /* This registers 32 GPIO lines per bank */
> +       ret =3D bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
> +                        BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_RE=
G_DIR);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to init gpio chip\=
n");
> +
> +       gb->sg =3D sg;
> +
> +       gc->label               =3D dev_name(dev);
> +       gc->request             =3D gpiochip_generic_request;
> +       gc->free                =3D gpiochip_generic_free;
> +       gc->ngpio               =3D NR_GPIOS_PER_BANK;
> +       gc->base                =3D -1;
> +
> +#ifdef CONFIG_OF_GPIO
> +       gc->of_xlate            =3D spacemit_gpio_xlate;
> +       gc->of_add_pin_range    =3D spacemit_add_pin_range;
> +       gc->of_gpio_n_cells     =3D 3;
> +#endif
> +
> +       girq                    =3D &gc->irq;
> +       girq->threaded          =3D true;
> +       girq->handler           =3D handle_simple_irq;
> +
> +       gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
> +
> +       /* Clear Edge Detection Settings */
> +       writel(0x0, gb->base + GRER);
> +       writel(0x0, gb->base + GFER);
> +       /* Clear and Disable Interrupt */
> +       writel(0xffffffff, gb->base + GCFER);
> +       writel(0xffffffff, gb->base + GCRER);
> +       writel(0, gb->base + GAPMASK);
> +
> +       ret =3D devm_request_threaded_irq(dev, irq, NULL,
> +                                       spacemit_gpio_irq_handler,
> +                                       IRQF_ONESHOT | IRQF_SHARED,
> +                                       gb->gc.label, gb);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "failed to register IRQ\n"=
);
> +
> +       ret =3D devm_gpiochip_add_data(dev, gc, gb);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "failed to add gpio chip\n=
");
> +
> +       /* Eable Interrupt */

Enable.

> +       writel(0xffffffff, gb->base + GAPMASK);
> +
> +       return 0;
> +}
> +
> +static int spacemit_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct spacemit_gpio *sg;
> +       struct resource *res;
> +       void __iomem *regs;
> +       int i, irq, ret;
> +
> +       sg =3D devm_kzalloc(dev, sizeof(*sg), GFP_KERNEL);
> +       if (!sg)
> +               return -ENOMEM;
> +
> +       regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
> +       sg->dev =3D dev;
> +
> +       for (i =3D 0; i < NR_BANKS; i++) {
> +               ret =3D spacemit_gpio_add_bank(sg, regs, i, irq);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id spacemit_gpio_dt_ids[] =3D {
> +       { .compatible =3D "spacemit,k1-gpio" },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver spacemit_gpio_driver =3D {
> +       .probe          =3D spacemit_gpio_probe,
> +       .driver         =3D {
> +               .name   =3D "k1-gpio",
> +               .of_match_table =3D spacemit_gpio_dt_ids,
> +       },
> +};
> +module_platform_driver(spacemit_gpio_driver);
> +
> +MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
> +MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
> +MODULE_LICENSE("GPL");
>
> --
> 2.48.1
>

Bart
