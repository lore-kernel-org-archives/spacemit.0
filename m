Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFD32E3701
	for <spacemit@lists.linux.dev>; Fri, 18 Jul 2025 03:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752809919; cv=none; b=EaG6LWQuUaopRAF/GR/Zcn2qUtssCWLjVGBnIMwR8yEDIn029u9IhlihyS3D11LZX5MipupBLobk3YfC4+b2+eY5g+DwwpMnbfGg0zhaMTVAmxiLfSovWXPlRMZktIzLPV0XuOizFLpsGUWSdx7ZHthwgjyfl3I79BSQyNBwi18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752809919; c=relaxed/simple;
	bh=XZSner3yVbM32DUEJkj9xjJcA8O/x7Q+Prb0damfS6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMVbCpEsExk9MFqsZtRLlj+XxcuwCYmI93q86J/hJt7CsctOjkFiZDjB9wGeljX6MTdG1h8CLCtNhYDejZ4gfpn13bMGh4XWTRoRQchrC8OkhzfKgWiKeyC6Iuw/GTCWdZEFtYYG13QFuBFpMYM4kkLNGBAXqb3O0YIA9Ng+dPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYmX149b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYmX149b"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so17318135e9.1
        for <spacemit@lists.linux.dev>; Thu, 17 Jul 2025 20:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752809915; x=1753414715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kVjnu4ZRPVskrhklztcS1q/76OOQ5xKy8zMuiq2fhc=;
        b=EYmX149bX3XebAK+KFd0RI4uNKkSHtuHxAinE8HAQRPGQa9ywuddJA4g1w/Vlvu29F
         pHGoYnZaRz2i3b9ueE8P7+d2JXkxUr665oUdwFGVjYa94M21o1/Wb8f5GMTQutCC4qcT
         qyeOqzURjDp2WwUjvgtl/fSKckQYnW9y70F82APZDrrel0u/cPJSU7mNf/6ZFyfY9q1A
         f7KU5D/WJY1cQGapuxrpUZuMRIMLjSLd5B8c6vVDVv5M4XmuXOyDJaUFm21PpTGgM320
         rFiohbdBt2TgDOoxAzEjWcDbKIax5nPg726r9ZlPgxesz58OaBL617I3r5Kg+ojW8/92
         f76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752809915; x=1753414715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kVjnu4ZRPVskrhklztcS1q/76OOQ5xKy8zMuiq2fhc=;
        b=UU+ppwX0/bo+cALfAu9LtfNXbTpueRmD/p12Ev+wGYHqzAsfVQ7Ad+r3b3yClSQRnd
         Y4D7BEh7ucm+GXJWD23LouLPZzusu9LYfZIp20tefgr0vYL+lG7L5ofWHzOSmwz9GQZc
         lqcLE2eP9Qeq51t/zcyrJETc4C8GOdyKZd+kgiNJHqKGFcmgFo2EGlfqjbERAEkgKk8X
         WlU6qa87lw8Rp0rv0M6PkaHHcxBLswTXDHbC1Ox8X77b62xbdjB3FfXnI5kwx9zK3J4A
         uIJ/IHSa3QqcWfj1j9eRaa/GEcSg81JlGqQqbvU6FtfHfDpLNjhIHChoX17FShO5/GLi
         PX7w==
X-Forwarded-Encrypted: i=1; AJvYcCXZPcpUWYr4y6hWT3uF0aEkuDg9vCBG4cDcYtQ2HImY/zhAD6hG6Khe9Gm2Q/mKNRboeBccY5J88g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeNdhRCOMiYPVZVw7fvjTE2h5ruQGMuwmotQbkb0FRg1Uqq3k6
	npeosEWrJKrZM0Z6RYV+Zmnrb+tuR+pu17VJjlZn4O7tKqd0/KZuPfnEbiLwB8O+dGOm9riIb91
	WdYBboRgVMP/iUlPJvhMXDe+4bX6FtCE=
X-Gm-Gg: ASbGncviVkDnzwYrfopIUoTnTtJLnSZZZKMzaq9zqTzfdEge3NQDEQhuD590MAxI7uW
	8UA8GUMtA+gYVrr2GAeObNvriuDeyO2ebt+4ylVONfuM8p64cXjOmERwa8VA6mhXmCm82WO5rCL
	KVmZFFSH49M36CRD313nmorTzw8OTUIGMhHr4HwFRC6RtjehR6XT9HLXtMK6OW8FA2vTcxGUj8M
	oE+Ckot
X-Google-Smtp-Source: AGHT+IELv6Eaj7bGZf5I98pEzsmbm6s1vyuZK2HmDfNsscBzikAW0+BcPmINlO4LtIhh/nN1Iyn6Ts9tnAFZv7DRzcg=
X-Received: by 2002:a05:600c:450f:b0:453:1e14:6387 with SMTP id
 5b1f17b1804b1-4562e3cad06mr78336625e9.32.1752809914957; Thu, 17 Jul 2025
 20:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com>
In-Reply-To: <20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Thu, 17 Jul 2025 23:37:59 -0400
X-Gm-Features: Ac12FXw3tcLluwuU4fs6VIlHtZDcSRFnzMMvxMtn1S4JkspGxTu1GcRKTEH9Nr8
Message-ID: <CAJFTR8RGT0JFcsSODEgyWgJYKj6QhWa7=5Tm9_6U4Pkv56X=-g@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: spacemit: configure ILCR for accurate SCL frequency
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 9:08=E2=80=AFPM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> master mode operations is determined by the ILCR (I2C Load Count Register=
).
> Previously, the driver relied on the hardware's reset default
> values for this register.
>
> The hardware's default ILCR values (SLV=3D0x156, FLV=3D0x5d) yield SCL
> frequencies lower than intended. For example, with the default
> 31.5 MHz input clock, these default settings result in an SCL
> frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> and approximately 338 kHz (fast mode) when targeting 400 kHz.
> These frequencies are below the 100 kHz/400 kHz nominal speeds.
>
> This patch integrates the SCL frequency management into
> the Common Clock Framework (CCF). Specifically, the ILCR register,
> which acts as a frequency divider for the SCL clock, is now registered
> as a managed clock (scl_clk) within the CCF.
>
> This patch also cleans up unnecessary whitespace
> in the included header files.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v2:
> - Align line breaks.
> - Check `lv` in `clk_set_rate` function.
> - Force fast mode when SCL frequency is illegal or unavailable.
> - Change "linux/bits.h" to <linux/bits.h>
> - Kconfig: Add dependency on CCF.
> ---
>  drivers/i2c/busses/Kconfig  |   2 +-
>  drivers/i2c/busses/i2c-k1.c | 180 ++++++++++++++++++++++++++++++++++++++=
++----
>  2 files changed, 167 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index c8d115b58e449b59a38339b439190dcb0e332965..1382b6c257fa4ba4cf5098d68=
4c1bbd5e2636fd4 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -797,7 +797,7 @@ config I2C_JZ4780
>  config I2C_K1
>         tristate "SpacemiT K1 I2C adapter"
>         depends on ARCH_SPACEMIT || COMPILE_TEST
> -       depends on OF
> +       depends on OF && COMMON_CLK
>         help
>           This option enables support for the I2C interface on the Spacem=
iT K1
>           platform.
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index b68a21fff0b56b59fe2032ccb7ca6953423aad32..3a6aeea245b56a3c3e63bb67b=
623495a6bec848b 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -3,17 +3,20 @@
>   * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
>   */
>
> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR            0x0            /* Control register */
>  #define SPACEMIT_ISR            0x4            /* Status register */
>  #define SPACEMIT_IDBR           0xc            /* Data buffer register *=
/
> +#define SPACEMIT_ILCR           0x10           /* Load Count Register */
>  #define SPACEMIT_IBMR           0x1c           /* Bus monitor register *=
/
>
>  /* SPACEMIT_ICR register fields */
> @@ -80,6 +83,19 @@
>  #define SPACEMIT_BMR_SDA         BIT(0)                /* SDA line level=
 */
>  #define SPACEMIT_BMR_SCL         BIT(1)                /* SCL line level=
 */
>
> +#define SPACEMIT_LCR_LV_STANDARD_SHIFT         0
> +#define SPACEMIT_LCR_LV_FAST_SHIFT             9
> +#define SPACEMIT_LCR_LV_STANDARD_WIDTH         9
> +#define SPACEMIT_LCR_LV_FAST_WIDTH             9
> +#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE     GENMASK(SPACEMIT_LCR_LV_S=
TANDARD_WIDTH - 1, 0)
> +#define SPACEMIT_LCR_LV_FAST_MAX_VALUE         GENMASK(SPACEMIT_LCR_LV_F=
AST_WIDTH - 1, 0)
> +#define SPACEMIT_LCR_LV_STANDARD_MASK          GENMASK(SPACEMIT_LCR_LV_S=
TANDARD_SHIFT +\
> +                                               SPACEMIT_LCR_LV_STANDARD_=
WIDTH - 1,\
> +                                               SPACEMIT_LCR_LV_STANDARD_=
SHIFT)
> +#define SPACEMIT_LCR_LV_FAST_MASK              GENMASK(SPACEMIT_LCR_LV_F=
AST_SHIFT +\
> +                                               SPACEMIT_LCR_LV_FAST_WIDT=
H - 1,\
> +                                               SPACEMIT_LCR_LV_FAST_SHIF=
T)
> +
>  /* i2c bus recover timeout: us */
>  #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT          100000
>
> @@ -95,11 +111,20 @@ enum spacemit_i2c_state {
>         SPACEMIT_STATE_WRITE,
>  };
>
> +enum spacemit_i2c_mode {
> +       SPACEMIT_MODE_STANDARD,
> +       SPACEMIT_MODE_FAST
> +};
> +
>  /* i2c-spacemit driver's main struct */
>  struct spacemit_i2c_dev {
>         struct device *dev;
>         struct i2c_adapter adapt;
>
> +       struct clk_hw scl_clk_hw;
> +       struct clk *scl_clk;
> +       enum spacemit_i2c_mode mode;
> +
>         /* hardware resources */
>         void __iomem *base;
>         int irq;
> @@ -120,6 +145,88 @@ struct spacemit_i2c_dev {
>         u32 status;
>  };
>
> +static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
> +{
> +       struct spacemit_i2c_dev *i2c =3D data;
> +
> +       clk_disable_unprepare(i2c->scl_clk);
> +}
> +
> +static void spacemit_i2c_scl_clk_exclusive_put(void *data)
> +{
> +       struct spacemit_i2c_dev *i2c =3D data;
> +
> +       clk_rate_exclusive_put(i2c->scl_clk);
> +}
> +
> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long ra=
te,
> +                                    unsigned long parent_rate)
> +{
> +       struct spacemit_i2c_dev *i2c =3D container_of(hw, struct spacemit=
_i2c_dev, scl_clk_hw);
> +       u32 lv, lcr, mask, shift, max_lv;
> +
> +       lv =3D DIV_ROUND_UP(parent_rate, rate);
> +
> +       if (i2c->mode =3D=3D SPACEMIT_MODE_STANDARD) {
> +               mask =3D SPACEMIT_LCR_LV_STANDARD_MASK;
> +               shift =3D SPACEMIT_LCR_LV_STANDARD_SHIFT;
> +               max_lv =3D SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
> +       } else if (i2c->mode =3D=3D SPACEMIT_MODE_FAST) {
> +               mask =3D SPACEMIT_LCR_LV_FAST_MASK;
> +               shift =3D SPACEMIT_LCR_LV_FAST_SHIFT;
> +               max_lv =3D SPACEMIT_LCR_LV_FAST_MAX_VALUE;
> +       }
> +
> +       if (!lv || lv > max_lv) {
> +               dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
> +               return -EINVAL;
> +       }
> +
> +       lcr =3D readl(i2c->base + SPACEMIT_ILCR);
> +       lcr &=3D ~mask;
> +       lcr |=3D lv << shift;
> +       writel(lcr, i2c->base + SPACEMIT_ILCR);
> +
> +       return 0;
> +}
> +
> +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long=
 rate,
> +                                       unsigned long *parent_rate)
> +{
> +       u32 lv, freq;
> +
> +       lv =3D DIV_ROUND_UP(*parent_rate, rate);
> +       freq =3D DIV_ROUND_UP(*parent_rate, lv);
> +
> +       return freq;
> +}
> +
> +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> +                                                 unsigned long parent_ra=
te)
> +{
> +       struct spacemit_i2c_dev *i2c =3D container_of(hw, struct spacemit=
_i2c_dev, scl_clk_hw);
> +       u32 lcr, lv =3D 0;
> +
> +       lcr =3D readl(i2c->base + SPACEMIT_ILCR);
> +
> +       if (i2c->mode =3D=3D SPACEMIT_MODE_STANDARD)
> +               lv =3D (lcr >> SPACEMIT_LCR_LV_STANDARD_SHIFT) &
> +                    GENMASK(SPACEMIT_LCR_LV_STANDARD_WIDTH - 1, 0);
> +       else if (i2c->mode =3D=3D SPACEMIT_MODE_FAST)
> +               lv =3D (lcr >> SPACEMIT_LCR_LV_FAST_SHIFT) &
> +                    GENMASK(SPACEMIT_LCR_LV_FAST_WIDTH - 1, 0);

GENMASK(SPACEMIT_LCR_LV_FAST_WIDTH - 1, 0); and  SPACEMIT_LCR_LV_FAST_MAX_V=
ALUE
happen to be the same value; can we use that and rename it to MASK? Or
better yet, use FIELD_GET here.

> +       else
> +               return 0;
> +
> +       return DIV_ROUND_UP(parent_rate, lv);
> +}
> +
> +static const struct clk_ops spacemit_i2c_clk_ops =3D {
> +       .set_rate =3D spacemit_i2c_clk_set_rate,
> +       .round_rate =3D spacemit_i2c_clk_round_rate,
> +       .recalc_rate =3D spacemit_i2c_clk_recalc_rate,
> +};
> +
>  static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
>  {
>         u32 val;
> @@ -138,6 +245,27 @@ static void spacemit_i2c_disable(struct spacemit_i2c=
_dev *i2c)
>         writel(val, i2c->base + SPACEMIT_ICR);
>  }
>
> +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev=
 *i2c,
> +                                                struct clk *parent)
> +{
> +       struct clk_init_data init;
> +       char name[32];
> +
> +       snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
> +
> +       init.name =3D name;
> +       init.ops =3D &spacemit_i2c_clk_ops;
> +       init.parent_data =3D (struct clk_parent_data[]) {
> +               { .fw_name =3D "func" },

Is "func" a placeholder? Can we name it i2c_scl_clk?

Thanks,
Jesse Taube

> +       };
> +       init.num_parents =3D 1;
> +       init.flags =3D 0;
> +
> +       i2c->scl_clk_hw.init =3D &init;
> +
> +       return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
> +}
> +
>  static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
>  {
>         writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> @@ -224,7 +352,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev=
 *i2c)
>          */
>         val |=3D SPACEMIT_CR_DRFIE;
>
> -       if (i2c->clock_freq =3D=3D SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +       if (i2c->mode =3D=3D SPACEMIT_MODE_FAST)
>                 val |=3D SPACEMIT_CR_MODE_FAST;
>
>         /* disable response to general call */
> @@ -519,14 +647,15 @@ static int spacemit_i2c_probe(struct platform_devic=
e *pdev)
>                 dev_warn(dev, "failed to read clock-frequency property: %=
d\n", ret);
>
>         /* For now, this driver doesn't support high-speed. */
> -       if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_M=
ODE_FREQ) {
> -               dev_warn(dev, "unsupported clock frequency %u; using %u\n=
",
> -                        i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ=
);
> +       if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> +           i2c->clock_freq <=3D SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> +               i2c->mode =3D SPACEMIT_MODE_FAST;
> +       } else if (i2c->clock_freq && i2c->clock_freq <=3D SPACEMIT_I2C_M=
AX_STANDARD_MODE_FREQ) {
> +               i2c->mode =3D SPACEMIT_MODE_STANDARD;
> +       } else {
> +               dev_warn(i2c->dev, "invalid clock-frequency, using fast m=
ode");
> +               i2c->mode =3D SPACEMIT_MODE_FAST;
>                 i2c->clock_freq =3D SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> -       } else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ)=
 {
> -               dev_warn(dev, "unsupported clock frequency %u; using %u\n=
",
> -                        i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE=
_FREQ);
> -               i2c->clock_freq =3D SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
>         }
>
>         i2c->dev =3D &pdev->dev;
> @@ -548,10 +677,33 @@ static int spacemit_i2c_probe(struct platform_devic=
e *pdev)
>         if (IS_ERR(clk))
>                 return dev_err_probe(dev, PTR_ERR(clk), "failed to enable=
 func clock");
>
> +       i2c->scl_clk =3D spacemit_i2c_register_scl_clk(i2c, clk);
> +       if (IS_ERR(i2c->scl_clk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
> +                                    "failed to register scl clock\n");
> +
>         clk =3D devm_clk_get_enabled(dev, "bus");
>         if (IS_ERR(clk))
>                 return dev_err_probe(dev, PTR_ERR(clk), "failed to enable=
 bus clock");
>
> +       ret =3D clk_set_rate_exclusive(i2c->scl_clk, i2c->clock_freq);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "failed to set excl=
usive rate for SCL clock");
> +
> +       ret =3D devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_exclus=
ive_put, i2c);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                               "failed to register cleanup action for ex=
clusive SCL clock rate");
> +
> +       ret =3D clk_prepare_enable(i2c->scl_clk);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "failed to prepare =
and enable clock");
> +
> +       ret =3D devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disabl=
e_unprepare, i2c);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                               "failed to register cleanup action for cl=
k disable and unprepare");
> +
>         spacemit_i2c_reset(i2c);
>
>         i2c_set_adapdata(&i2c->adapt, i2c);
>
> ---
> base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
> change-id: 20250709-k1-i2c-ilcr-ea347e0850a4
>
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
