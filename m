Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE603D3489
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498054; cv=none; b=j4u92BP+B476927CEeeWPEY7zi466BDt6R/CDYxlY/RbrQ9DFLYlm59mhNAtdvbPl9Y9t4x3UkpaRGyCq+CYaymEO9U3uy8/YCv9sAvBbZObA8J1tmJDG3ueBBHiGu6dnEupmOywQTLDDGvepEjWjtPlTnJMhEZmXisXH825H3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498054; c=relaxed/simple;
	bh=RFVzaFNUJbNJvOAruDNOXBDJqYqVmAKMFg8L7IhuIv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKfWEOBQZ1nxRb9Cs9GUQ4bIYT2h4b8ib8bhslusypuVyu0ekyffUDPxuHygVOeQ8E3Vn8s4ie22FzXMXuQtcDVS0OH4gjj2Exzjdfq0Z8P4IUlOjQU47LKjue4dySI/IBLKBXwdHqGDLeJHAFWTgF8Gca/lsuD/g12z0mNNA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eUHTSmWt; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eUHTSmWt"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88a26ce6619so9004226d6.3
        for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 09:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768498050; x=1769102850; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiKJ849xhUg0B5j5HLWz1UsKpOTFhEdl4ZZuo9C0n8U=;
        b=eUHTSmWtpp/jdE0sSoc0MFb/IGlGA13yvLKYJAf1XEFSLdkd+gfMCikogV5GuNH+kQ
         s3L9QH49WgVo9w+o242FsoWODvstjtbpNYihl6MuhCSo0IBcnKKbSB5yPvdIjj6RA9Hj
         67OquDMCK2RCjgPNANyYNMZUHAwbLdi3IDu/bhVYUZQRgmsnP0qOW4ZyRQQhSIKGOv8M
         IBi+6ni7z4pu4ujZtNmYidRghrk9EnIQhuy1ws9F1JUc9cbbY4Vcc593rt/q5a1umMI9
         w3hz+df/caPG5PaDkrshFxC6GAEdxlx2BMrZa7jh8MxUr+4Etg9QmXwXMWWVdq+4XyTW
         CsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768498050; x=1769102850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiKJ849xhUg0B5j5HLWz1UsKpOTFhEdl4ZZuo9C0n8U=;
        b=JnJeHWDwtIpLUq5ZUK2Ne50aWWi0yuRlC+uYAO61VpkqNtsLIDlXXoJ8C58EaccPso
         uKT3OrcC/Czpvlv4jLrNI/D4O9jbB1s7xrY+ha6dfrZwLfV9qjMAq1k8EAarPjARdoxI
         bkHu/gGjACKzFBZFElrXBBf8HO1XcAWnbKn/whw06+QUPOJ+Uq2KlplgBL8IbdGnp2zw
         uCCGSQhn4GPXDWjeTFhsBBlGkqVtQrBuLddx1YJvLz8B4CymVv+eP0iFbrqqME5EVBAW
         zOQwe9pYSVP+9HewCwRFh0S6Xh6JlsTMNPVI8Ju99mczrluK3LHRkEqFRyJh/GsSLp0y
         OkaA==
X-Forwarded-Encrypted: i=1; AJvYcCW9kqgeRti5AAMpK3erVb723nlpbQo8ixpARWb01aeEtdI2oFKBhhcYLl6l5/l1DHVL8J7xLxk9lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZJg+IsUZXiTAdi6UHnXI8b35saeCUsYSCs8cBd0EESvMd5Gum
	UE/79YVSMlaHq6I0B0Utixm56vbhGXznBFMIvphhZLvp1H3oh1co8o2ygiciip73+iY=
X-Gm-Gg: AY/fxX53ihSdlmFUlquEipxwOQmShasn0Jwlr/ilDDOBadq8Hra3k+ihrTwVQuPri6p
	3bzpMkrXOicTgxFQMPEVBIwbnAHyLieN6KbnlFW8e8Rml1R6ERGsaltizbIIkD3qjfdvgAJxuOa
	Lj0Qv22n6j7/69UxrAz6sbMrjub9V3B9DTe46ji2kgbAiXxCIkRNF8B9r4GEwTVMTVJAtNhSO5o
	Y4+ISRx07KPvCLrGf9B3XJkh0cVIspfYVk98pcIW6AUnq1MfW31Jp/V8lobtF5mUYKaXEEp3NST
	1KX/+7L2wYUYsmbDr7QlS9eanvB/S/6y7OOqAQYhUT136vqJnPPnm7FIHlSELbtYOXpyKAEhx3k
	h0tc3E/+ibIW9qTilpXn5yAB7m44klPGn64f2hVhkV9+9p1hYajU0V6Tfe2FpUymhlDBLq6LeSB
	b3oPGyVqGiEh/T9jTYFj3JHDhGHzahPVczQT4TzP8C7BScMnxMJJt92D76s/VSD1o=
X-Received: by 2002:a05:6214:1243:b0:892:65bb:124b with SMTP id 6a1803df08f44-8942ddf4171mr2103946d6.70.1768498049994;
        Thu, 15 Jan 2026 09:27:29 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a9e5d1sm452354985a.18.2026.01.15.09.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:27:29 -0800 (PST)
Message-ID: <80161b42-c665-4fe8-bc7c-845ca44bc723@riscstar.com>
Date: Thu, 15 Jan 2026 11:27:28 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] reset: spacemit: Extract common K1 reset code
To: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Haylen Chu <heylenay@4d2.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-3-457df235efe9@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-3-457df235efe9@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/26 8:22 AM, Guodong Xu wrote:
> Extract the common reset controller code from the K1 driver into
> separate reset-spacemit-common.{c,h} files to prepare for additional
> SpacemiT SoCs that share the same reset controller architecture.
> 
> The common code includes handlers for reset assert and deassert
> operations and probing for auxiliary bus devices.
> 
> Changes during extraction:
> - Module ownership: Use dev->driver->owner instead of THIS_MODULE in
>    spacemit_reset_controller_register() to correctly reference the
>    calling driver's module.
> - Rename spacemit_reset_ids to spacemit_k1_reset_ids.
> - Define new namespace "RESET_SPACEMIT" for the exported common
>    functions (spacemit_reset_probe) and update K1 driver to import it.
> 
> This prepares for additional SpacemiT SoCs (K3) that share the same reset
> controller architecture.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

This looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2: Use dev->driver->owner for the reset controller owner instead of
>      THIS_MODULE to fix the module reference counting issue pointed out
>      by Krzysztof Kozlowski.
> ---
>   drivers/reset/spacemit/Kconfig                 |  17 +++-
>   drivers/reset/spacemit/Makefile                |   2 +
>   drivers/reset/spacemit/reset-spacemit-common.c |  77 ++++++++++++++++++
>   drivers/reset/spacemit/reset-spacemit-common.h |  42 ++++++++++
>   drivers/reset/spacemit/reset-spacemit-k1.c     | 107 +++----------------------
>   5 files changed, 144 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> index 552884e8b72afeb05cdb9b6565ad8e7fd32f990b..56a4858b30e136296e1f9c85b7b13ccee91fe7b4 100644
> --- a/drivers/reset/spacemit/Kconfig
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -1,10 +1,20 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -config RESET_SPACEMIT_K1
> -	tristate "SpacemiT K1 reset driver"
> +menu "Reset support for SpacemiT platforms"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on SPACEMIT_K1_CCU
> +
> +config RESET_SPACEMIT_COMMON
> +	tristate
>   	select AUXILIARY_BUS
> +	help
> +	  Common reset controller infrastructure for SpacemiT SoCs.
> +	  This provides shared code and helper functions used by
> +	  reset drivers for various SpacemiT SoC families.
> +
> +config RESET_SPACEMIT_K1
> +	tristate "Support for SpacemiT K1 SoC"
> +	depends on SPACEMIT_K1_CCU
> +	select RESET_SPACEMIT_COMMON
>   	default SPACEMIT_K1_CCU
>   	help
>   	  Support for reset controller in SpacemiT K1 SoC.
> @@ -12,3 +22,4 @@ config RESET_SPACEMIT_K1
>   	  unit (CCU) driver to provide reset control functionality
>   	  for various peripherals and subsystems in the SoC.
>   
> +endmenu
> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> index de7e358c74fd7b0fac3ec2c18d985331af64fcbb..fecda9f211b24a54707b3f425b9325be1f2f7738 100644
> --- a/drivers/reset/spacemit/Makefile
> +++ b/drivers/reset/spacemit/Makefile
> @@ -1,3 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
> +
>   obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
>   
> diff --git a/drivers/reset/spacemit/reset-spacemit-common.c b/drivers/reset/spacemit/reset-spacemit-common.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0626633a5e7db6e31be4ed36505b15291eb186b1
> --- /dev/null
> +++ b/drivers/reset/spacemit/reset-spacemit-common.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* SpacemiT reset controller driver - common implementation */
> +
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +
> +#include <soc/spacemit/ccu.h>
> +
> +#include "reset-spacemit-common.h"
> +
> +static int spacemit_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
> +{
> +	struct ccu_reset_controller *controller;
> +	const struct ccu_reset_data *data;
> +	u32 mask;
> +	u32 val;
> +
> +	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
> +	data = &controller->data->reset_data[id];
> +	mask = data->assert_mask | data->deassert_mask;
> +	val = assert ? data->assert_mask : data->deassert_mask;
> +
> +	return regmap_update_bits(controller->regmap, data->offset, mask, val);
> +}
> +
> +static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, true);
> +}
> +
> +static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops spacemit_reset_control_ops = {
> +	.assert		= spacemit_reset_assert,
> +	.deassert	= spacemit_reset_deassert,
> +};
> +
> +static int spacemit_reset_controller_register(struct device *dev,
> +					      struct ccu_reset_controller *controller)
> +{
> +	struct reset_controller_dev *rcdev = &controller->rcdev;
> +
> +	rcdev->ops = &spacemit_reset_control_ops;
> +	rcdev->owner = dev->driver->owner;
> +	rcdev->of_node = dev->of_node;
> +	rcdev->nr_resets = controller->data->count;
> +
> +	return devm_reset_controller_register(dev, &controller->rcdev);
> +}
> +
> +int spacemit_reset_probe(struct auxiliary_device *adev,
> +			 const struct auxiliary_device_id *id)
> +{
> +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
> +	struct ccu_reset_controller *controller;
> +	struct device *dev = &adev->dev;
> +
> +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> +	if (!controller)
> +		return -ENOMEM;
> +	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
> +	controller->regmap = rdev->regmap;
> +
> +	return spacemit_reset_controller_register(dev, controller);
> +}
> +EXPORT_SYMBOL_NS_GPL(spacemit_reset_probe, "RESET_SPACEMIT");
> +
> +MODULE_DESCRIPTION("SpacemiT reset controller driver - common code");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/reset/spacemit/reset-spacemit-common.h b/drivers/reset/spacemit/reset-spacemit-common.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ffaf2f86eb39df72b079095b3f5da3622e132c8d
> --- /dev/null
> +++ b/drivers/reset/spacemit/reset-spacemit-common.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SpacemiT reset controller driver - common definitions
> + */
> +
> +#ifndef _RESET_SPACEMIT_COMMON_H_
> +#define _RESET_SPACEMIT_COMMON_H_
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/types.h>
> +
> +struct ccu_reset_data {
> +	u32 offset;
> +	u32 assert_mask;
> +	u32 deassert_mask;
> +};
> +
> +struct ccu_reset_controller_data {
> +	const struct ccu_reset_data *reset_data;	/* array */
> +	size_t count;
> +};
> +
> +struct ccu_reset_controller {
> +	struct reset_controller_dev rcdev;
> +	const struct ccu_reset_controller_data *data;
> +	struct regmap *regmap;
> +};
> +
> +#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
> +	{							\
> +		.offset		= (_offset),			\
> +		.assert_mask	= (_assert_mask),		\
> +		.deassert_mask	= (_deassert_mask),		\
> +	}
> +
> +/* Common probe function */
> +int spacemit_reset_probe(struct auxiliary_device *adev,
> +			 const struct auxiliary_device_id *id);
> +
> +#endif /* _RESET_SPACEMIT_COMMON_H_ */
> diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
> index cc7fd1f8750d422f3d8f96367ae259f38418c44b..8f3b5329ea5f627ab454e15bf485b155c9f48ca5 100644
> --- a/drivers/reset/spacemit/reset-spacemit-k1.c
> +++ b/drivers/reset/spacemit/reset-spacemit-k1.c
> @@ -1,41 +1,13 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
> -/* SpacemiT reset controller driver */
> +/* SpacemiT K1 reset controller driver */
>   
> -#include <linux/auxiliary_bus.h>
> -#include <linux/container_of.h>
> -#include <linux/device.h>
>   #include <linux/module.h>
> -#include <linux/regmap.h>
> -#include <linux/reset-controller.h>
> -#include <linux/types.h>
>   
> -#include <soc/spacemit/k1-syscon.h>
>   #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +#include <soc/spacemit/k1-syscon.h>
>   
> -struct ccu_reset_data {
> -	u32 offset;
> -	u32 assert_mask;
> -	u32 deassert_mask;
> -};
> -
> -struct ccu_reset_controller_data {
> -	const struct ccu_reset_data *reset_data;	/* array */
> -	size_t count;
> -};
> -
> -struct ccu_reset_controller {
> -	struct reset_controller_dev rcdev;
> -	const struct ccu_reset_controller_data *data;
> -	struct regmap *regmap;
> -};
> -
> -#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
> -	{							\
> -		.offset		= (_offset),			\
> -		.assert_mask	= (_assert_mask),		\
> -		.deassert_mask	= (_deassert_mask),		\
> -	}
> +#include "reset-spacemit-common.h"
>   
>   static const struct ccu_reset_data k1_mpmu_resets[] = {
>   	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
> @@ -214,91 +186,30 @@ static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
>   	.count		= ARRAY_SIZE(k1_apbc2_resets),
>   };
>   
> -static int spacemit_reset_update(struct reset_controller_dev *rcdev,
> -				 unsigned long id, bool assert)
> -{
> -	struct ccu_reset_controller *controller;
> -	const struct ccu_reset_data *data;
> -	u32 mask;
> -	u32 val;
> -
> -	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
> -	data = &controller->data->reset_data[id];
> -	mask = data->assert_mask | data->deassert_mask;
> -	val = assert ? data->assert_mask : data->deassert_mask;
> -
> -	return regmap_update_bits(controller->regmap, data->offset, mask, val);
> -}
> -
> -static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
> -				 unsigned long id)
> -{
> -	return spacemit_reset_update(rcdev, id, true);
> -}
> -
> -static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
> -				   unsigned long id)
> -{
> -	return spacemit_reset_update(rcdev, id, false);
> -}
> -
> -static const struct reset_control_ops spacemit_reset_control_ops = {
> -	.assert		= spacemit_reset_assert,
> -	.deassert	= spacemit_reset_deassert,
> -};
> -
> -static int spacemit_reset_controller_register(struct device *dev,
> -					      struct ccu_reset_controller *controller)
> -{
> -	struct reset_controller_dev *rcdev = &controller->rcdev;
> -
> -	rcdev->ops = &spacemit_reset_control_ops;
> -	rcdev->owner = THIS_MODULE;
> -	rcdev->of_node = dev->of_node;
> -	rcdev->nr_resets = controller->data->count;
> -
> -	return devm_reset_controller_register(dev, &controller->rcdev);
> -}
> -
> -static int spacemit_reset_probe(struct auxiliary_device *adev,
> -				const struct auxiliary_device_id *id)
> -{
> -	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
> -	struct ccu_reset_controller *controller;
> -	struct device *dev = &adev->dev;
> -
> -	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> -	if (!controller)
> -		return -ENOMEM;
> -	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
> -	controller->regmap = rdev->regmap;
> -
> -	return spacemit_reset_controller_register(dev, controller);
> -}
> -
>   #define K1_AUX_DEV_ID(_unit) \
>   	{ \
>   		.name = "spacemit_ccu.k1-" #_unit "-reset", \
>   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>   	}
>   
> -static const struct auxiliary_device_id spacemit_reset_ids[] = {
> +static const struct auxiliary_device_id spacemit_k1_reset_ids[] = {
>   	K1_AUX_DEV_ID(mpmu),
>   	K1_AUX_DEV_ID(apbc),
>   	K1_AUX_DEV_ID(apmu),
>   	K1_AUX_DEV_ID(rcpu),
>   	K1_AUX_DEV_ID(rcpu2),
>   	K1_AUX_DEV_ID(apbc2),
> -	{ },
> +	{ /* sentinel */ }
>   };
> -MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
> +MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
>   
>   static struct auxiliary_driver spacemit_k1_reset_driver = {
>   	.probe          = spacemit_reset_probe,
> -	.id_table       = spacemit_reset_ids,
> +	.id_table       = spacemit_k1_reset_ids,
>   };
>   module_auxiliary_driver(spacemit_k1_reset_driver);
>   
> +MODULE_IMPORT_NS("RESET_SPACEMIT");
>   MODULE_AUTHOR("Alex Elder <elder@kernel.org>");
> -MODULE_DESCRIPTION("SpacemiT reset controller driver");
> +MODULE_DESCRIPTION("SpacemiT K1 reset controller driver");
>   MODULE_LICENSE("GPL");
> 

