Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90BF9C1
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 03:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761535351; cv=none; b=kokKoMfsW7iN3JKbYq+xD94TRm97/3N/00xHilil22QmQ5XIYuwjNuU3oy1uwjdX7CQ2c74kYnsAKdKoCX00wgXFk1kharzlkmO1CwNoNKw+DjoTnJhksaG20rDmXn5NvZVkNOaq88FzEQUfdeeATQ1NtQ4nMl1Ab4UWY2WqWJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761535351; c=relaxed/simple;
	bh=V6gLOPoyZC1Rrtb1DD9I54bfxiLa0quZq+9NVrkdgJg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7O8NtlzxiyOqCZpe061CtFUr0frA2ycNtqqTzgiMkug30gZqkNPhzFp+daWqtzWZYs3dp6zjuHe5XTl1jRQelHUmI412ah/b6wHaoeH6Y+opPn5Lf/2NdoZs+VIIXepATjH8WiWia/bshCoNCzEdgUEppRuoUdXn8yDU6RgRTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=E1OtxS5m; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="E1OtxS5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761535237;
	bh=56JGIU4CD1fsXCYSHVvyznt4gBt5NH3ahDq0LBsoufM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=E1OtxS5mVmZP77hAW9lJoGz1KJEGje0c7HoE+rZdbbzood82a2DwpSdFVd9iSox7o
	 sNF7BY60rvCS/+RMPE9MmQoQIO2gNfjIa8DC+myb0YDfEx/3iI8sRtyGDTZh7xGOhf
	 GOM0BaGPzkSKu8P68Ul5G2rHSn5wKOoKWfYTKO7k=
X-QQ-mid: esmtpgz11t1761535235t1790e053
X-QQ-Originating-IP: wU7tvrJ7wJKBNyTcA7+PgYwp28voDXOKAvCOskFI580=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 11:20:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2694975293500696196
EX-QQ-RecipientCnt: 13
Date: Mon, 27 Oct 2025 11:20:33 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026224424.1891541-2-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Odky5wNUcHo/ZJD1bp1skDoRPE43gdiWI7Pv7u+UVx6L6wXBnWFC8g3n
	7Q8RwA8NO16VKCg4/2XQwVWECFj2oOXrP+v/vRPglMUyYWBpsDHMZdxUbGcASuMTUb1bBuM
	Q5r7ECaMhcFQR3jiW7Fflktpp3fVpK85HoOhSphIuxe8p5M8ZlQpBHytK4StqKDA+i+WHDh
	wV+KUsXgiKQlFxI5MuUJ3nnVDO0slFx7z3cwMvXK93YO7jcmp1zZMPorKs8l5bIM51z9b6N
	9J9xCpC5ritCEfCIHCjmiUIAkR85xEsp1AqKOzJ/6vFoiSrv3uDg3BSsduxmoG1SS8K6VtU
	pOTaBMuSHYwe9u2EYBK5fIy1SVGDbSVFr1JBoOe2DnjZfFun1DIaMlliPfKAQIFQWoxAKTH
	Zbpo3t15w6T6LxqF7Z7thX1ZJiYbPhyIYGTD7RknfYGbQvEfoG0AolB5DosfUm5VM0eQO55
	kpBYOqHHeMhvodr+Aeq3MTiw5DgXVM8Ig6cdbuXF+DU5Q1TW3kU8QsN/1f4o4sQbEsNuxVz
	syxR8eqt9Fwc5RnHHWud6Txssod9PuVLtawA0QbRvAMu7WyGBosRid6QfoXSGvFuiVIdiPc
	nU32DIhQ2zR9ZA14l4t0GykCHHDxbiZw7G4Ruh7lsAUGYuTqKwjP7ngd+rxynczW72o4P6x
	Tey2Q5cab1ttYVvlj+qR4aeksQJAuPVoZ/5hcVn1wvP7NTnz9FhoPyjorUrbvjZfcT0ZdcC
	Vi5r/n9ARYxDp/+E9PMdzAVbGUqggpOYOfO6BxeX9gwp2ZXhrkN4dYMvI/mWRzO0n4GemLc
	tmyKCmStVAf0Xqx0ZmKpJM0KPaA0MUvGXYyYtwiENreVAM0cUrPenYnvMIR4dYB2SWZxrYl
	YkjbVxAufjRMXr4lSlNt0oIowVFWDZyOq6s126+gJYW6ziFcawiAC5RGMbQXqkLNgEhQBdc
	STcYB36OU4dQIJuPYe7dpikuGww4suizxmBN6/EiEZb2QEjbNGQp9CIdKGKAx21UclJs/jh
	jiQrjO00rOiEwbQ4Tv3g+VLTWdqBDOFVI27Num+l9lahKR/aUD1Ssg6/Z8bbg=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> chip, which is commonly paired with the SpacemiT K1 SoC.
> 
> The SpacemiT P1 support is implemented as a MFD driver, so the access is
> done directly through the regmap interface. Reboot or poweroff is
> triggered by setting a specific bit in a control register, which is
> automatically cleared by the hardware afterwards.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
> v2:
>  - Replace the "select" by a "depends on"
>  - Remove outdated Reviewed-by
> 
>  drivers/power/reset/Kconfig              |  9 +++
>  drivers/power/reset/Makefile             |  1 +
>  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> 
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 8248895ca9038..61c16f3d5abc7 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
>  	help
>  	  Reboot support for the KEYSTONE SoCs.
>  
> +config POWER_RESET_SPACEMIT_P1
> +	tristate "SpacemiT P1 poweroff and reset driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on MFD_SPACEMIT_P1
> +	default m
default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
I believe that reboot and shutdown are actually essential functionalities,
so it might make more sense: default ARCH_SPACEMIT?

                                      - Troy
> +	help
> +	  This driver supports power-off and reset operations for the SpacemiT
> +	  P1 PMIC.
> +
>  config POWER_RESET_SYSCON
>  	bool "Generic SYSCON regmap reset driver"
>  	depends on OF
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index 51da87e05ce76..0e4ae6f6b5c55 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_POWER_RESET_LTC2952) += ltc2952-poweroff.o
>  obj-$(CONFIG_POWER_RESET_QNAP) += qnap-poweroff.o
>  obj-$(CONFIG_POWER_RESET_REGULATOR) += regulator-poweroff.o
>  obj-$(CONFIG_POWER_RESET_RESTART) += restart-poweroff.o
> +obj-$(CONFIG_POWER_RESET_SPACEMIT_P1) += spacemit-p1-reboot.o
>  obj-$(CONFIG_POWER_RESET_ST) += st-poweroff.o
>  obj-$(CONFIG_POWER_RESET_TH1520_AON) += th1520-aon-reboot.o
>  obj-$(CONFIG_POWER_RESET_TORADEX_EC) += tdx-ec-poweroff.o
> diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
> new file mode 100644
> index 0000000000000..9ec3d1fff8f3d
> --- /dev/null
> +++ b/drivers/power/reset/spacemit-p1-reboot.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 by Aurelien Jarno
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reboot.h>
> +
> +/* Power Control Register 2 */
> +#define PWR_CTRL2		0x7e
> +#define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
> +#define PWR_CTRL2_RST		BIT(1)	/* Reset request */
> +
> +static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
> +{
> +	struct regmap *regmap = data->cb_data;
> +	int ret;
> +
> +	/* Put the PMIC into shutdown state */
> +	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_SHUTDOWN);
> +	if (ret) {
> +		dev_err(data->dev, "shutdown failed: %d\n", ret);
> +		return notifier_from_errno(ret);
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int spacemit_p1_restart_handler(struct sys_off_data *data)
> +{
> +	struct regmap *regmap = data->cb_data;
> +	int ret;
> +
> +	/* Put the PMIC into reset state */
> +	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_RST);
> +	if (ret) {
> +		dev_err(data->dev, "restart failed: %d\n", ret);
> +		return notifier_from_errno(ret);
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int spacemit_p1_reboot_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler,
> +					      regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register power off handler\n");
> +
> +	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler,
> +					    regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register restart handler\n");
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
> +	{ "spacemit-p1-reboot", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
> +
> +static struct platform_driver spacemit_p1_reboot_driver = {
> +	.driver = {
> +		.name = "spacemit-p1-reboot",
> +	},
> +	.probe = spacemit_p1_reboot_probe,
> +	.id_table = spacemit_p1_reboot_id_table,
> +};
> +module_platform_driver(spacemit_p1_reboot_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 reboot/poweroff driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.47.2
> 
> 
