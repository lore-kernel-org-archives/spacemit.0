Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083281A314F
	for <spacemit@lists.linux.dev>; Sun, 28 Sep 2025 05:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759035964; cv=none; b=m0vjraXr18h3dGb29sR+fW7KF0WCUipX55zhDt43VqlhCzU2298Ruahv62M6ZjT74wcDX4xilS5C17WnMZIiPVgDTSqsf8CVIALH88DuRInZ9D8VbqS4kfERuORZOGdSmPTYQmHEeDJ1V9wTlOBZXapEipUyL1EAN75wKfJ/UvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759035964; c=relaxed/simple;
	bh=l/e9KvT7z/Px8NoEhYsOcdJTTCJ+9kM1JQKZeBfvuxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exR25VQCtYBlqKXdjW6YQx3PhZpQrfOIBSviOufJ2H1ZC0DH8bNwvCCEtKIvgPBUngLvDOZtIHxEJ2fhrPWne5UZE6tzmiUOAr6IEv9P/OeEi4e/Hrhq77ZNov4weisq6qbsFMteFi/Jm5TfFbJrS+IRooz7iKjOhGDjN2vOtGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.54] (unknown [98.97.27.29])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 2BEE9B22019D;
	Sun, 28 Sep 2025 07:05:56 +0200 (CEST)
Message-ID: <beacb546-e4c4-43db-8f4c-97ea3cb55b43@freeshell.de>
Date: Sat, 27 Sep 2025 22:05:54 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MusePi Pro board device
 tree
To: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/27/25 21:16, Troy Mitchell wrote:
> From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Add initial device tree support for the MusePi Pro board [1].
> The board is using the SpacemiT K1/M1 SoC.
> 
> The device tree is adapted from the SpacemiT vendor tree [2].
> 
> This minimal device tree enables booting into a serial console with UART
> output and a blinking LED.
> 
> Link:
> https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_MUSE-Pi-Pro.dts [2]
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/Makefile          |  1 +
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 40 ++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 152832644870624d8fd77684ef33addb42b0baf3..76b98096e2a46c3192651d6d66af7742f740c635 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -2,3 +2,4 @@
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..3791186ce47b88887eab4321dcd7035668e7f02d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> + * Copyright (C) 2025 Troy Mitchell <troy.mitchell@linux.spacemit.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "k1.dtsi"
> +#include "k1-pinctrl.dtsi"
> +
> +/ {
> +	model = "MusePi Pro";
> +	compatible = "spacemit,musepi-pro", "spacemit,k1";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +

> +		led1 {
> +			label = "sys-led";
> +			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +			default-state = "on";

Can you explain how you decided to sort this?  I think the documentation
examples needs updating but it is unclear to me.

> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_2_cfg>;
> +	status = "okay";
> +};
> 

Best regards,

-E Shattow
