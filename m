Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6433D75B2;
	Tue, 31 Mar 2026 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947569; cv=none; b=eCsN7i1hDEfNFKubE/FZRGjT3nKj3TC+s4ljBfbInJ82tFWxIqC+ryUjqDg79lDPRnXBcTg0WCeNZeE5PTF2O27qDqu0LnQ736EDsBTssinKq3UnCJv1OV9YqGgZs3yIDaB5G4tabTCJB5R6+SZD6cO+VV03E2lrQGGu9v5GqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947569; c=relaxed/simple;
	bh=UEHMh340GjMDCxS3W8eMpmo3ANyUtjeKXah84mLvkAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrMYKT99E5ES5dHSfUH+SuYn9r5TGI2JHpxaUD6+Dup19glWrCIilzUr8yViFFLnldkNeRpz3I8AIfRmDz2j6zEyGW8SUEerOL3iToHH768AqJW1HtGFz+m0rcYPIsGVZms280csTXPyu6i0tTzdhIrpzr7BNi3CdOUFnANUb3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtPxsrCO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtPxsrCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2ADC2BCB0;
	Tue, 31 Mar 2026 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774947569;
	bh=UEHMh340GjMDCxS3W8eMpmo3ANyUtjeKXah84mLvkAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtPxsrCOLGXQRJ4k3+VG7iWp9SoWGImeuyZKVF7PUX/KPD9z3r3zbpdfBhFu1O1G8
	 7xIphfhH1UtGhfCt/VTjqC+kHZBurQSatTE2CkCPOihvhXHEx/LSXWXW9RtCHk20N5
	 z70At07CbyQYqEBCHTk9X5HN/ENt7sxVL+X0t1GAl+56bzRgRTZSLgzMSwLV7nCr+t
	 qZv89kQSDRLcAakjxs0jZZ94AY1aqgtcOX1MqUvHKKNOiaL55rn+ni9APXMktZlMQb
	 J77IzECvHVB0uMFKkvANI2rew4XyvNmf7S1KRvO+FDtfpbpKN6MQHomu6+j5yG1o3m
	 mNF0yQrTojiVw==
Date: Tue, 31 Mar 2026 16:59:25 +0800
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
Message-ID: <20260331085925-GKB976850@kernel.org>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034616.67183-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331034616.67183-1-sandie.cao@deepcomputing.io>

Hi Sandie, 

On 11:46 Tue 31 Mar     , Sandie Cao wrote:
> From: sandiecao <sandie.cao@deepcomputing.io>
> 
> The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
> SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
> which has (Framework) SKU FRANHQ0001.
> 
> The FML13V05 board features:
> - SpacemiT K3 RISC-V SoC
> - LPDDR5 16GB or 32GB
> - eMMC 32GB ~128GB (Optional)
> - UFS 3.1 256G (Optional)
> - QSPI Flash
> - MicroSD Slot
> - PCIe-based Wi-Fi
> - 4 USB-C Ports
>  - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>  - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>  - Port 3 & 4: USB 3.2 Gen 1
> 
> This minimal device tree enables booting into a serial console with UART
> output.
> 
> Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
should put your own signed-off at the end.

> ---
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 28 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> 
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 7e2b87702571..acb993c452ba 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> new file mode 100644
> index 000000000000..2343ae3acc2d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 DeepComputing (HK) Limited
should cover current year, which is 2026 now..

> + */
> +
> +#include "k3.dtsi"
> +
> +/ {
> +	model = "DeepComputing FML13V05";
> +	compatible = "deepcomputing,fml13v05", "spacemit,k3";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	memory@100000000 {
> +		device_type = "memory";
> +		reg = <0x1 0x00000000 0x4 0x00000000>;
> +	};
> +};
> +
> +&uart0 {
Can you also add pinctrl data explicitly?

> +	status = "okay";
> +};
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)
