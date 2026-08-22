Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F6482D4
	for <spacemit@lists.linux.dev>; Sat, 22 Aug 2026 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787365042; cv=none; b=SZ4mIBXrUoqxBxmI65oUzxXeS5AZV9fk72QNG/Yp1nPI04nD8K5ym+ADvocjVwjpVB75cMy6o7AH38dDJ2Ty20uc/zcQ13t/VWgw8VcyZzHzsc1r6TRRWGH7fTuvXY8m+1RWsVMaJS+ixQ9/ePjqn+YMl7sTAhVlPtMC3qlLGRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787365042; c=relaxed/simple;
	bh=qc2anr7nuQF/LqCHg9nhqL04YcXIusix9EyDPOqm5RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObFGEQfwwO/9ulmQtjsxwJcshiZT2HTWchgKdq3mtOqgW3G366a/kjwi7uCCO6kx7745O3lE6GqODdaKlNpzFTS/xyML4Zz7qf4jDdp94bRk61z1eWlV5U60H7xLXe5UAM+NAGzo4bsbWCmxMSW1vu9WYkiPCaiJUnDIUfRnsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDu7yu5x; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDu7yu5x"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1743707a91.1
        for <spacemit@lists.linux.dev>; Fri, 21 Aug 2026 19:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787365040; x=1787969840; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PxFsvPnSSLfiQZIwj6VRATAaTC/AW3c6fVX+c2YbXM=;
        b=YDu7yu5xC6btqS6rM9p/wtgUcvt+k6Rw+mC00EoS1QLqnTqXjipTPnIftw2AnHovOg
         HrJZNG8Ujn5uFns7KD7BI+FdpccOtKcv39xh9W1h78H3y2sN5SCss1XmwFXLaOh4uRuo
         Gaqs530bLIOqxwpum6VVsbZXVCz6B8aDVuqpKRDyWU1dAlFjYQ62uesUDITt4LWFfXfe
         P9jS8C0yFRPV/4KVSXK4kx5MrmjDnHx4s3TpLoxjJdunZZPJvP5E/76T0V/qx6P43i/k
         tWEOXqv/oryRz0Taanb0jXyUjZrepgYaKPMIQgsjU4z/rVcY/XnzyBcIIefDBTLAfgLF
         IFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787365040; x=1787969840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PxFsvPnSSLfiQZIwj6VRATAaTC/AW3c6fVX+c2YbXM=;
        b=O5zeavHLkOVBk5ytoM6JNIriflBLnELTNeUzgMQh8U0EK/6qqlfCyQPA4wVkmOhXa8
         SdAXqk/bqZP+fG2eyd53EIvRDDlb3IBkkzKCP0eBbbd+kGTqTJzkMZwgjJ0qexRl6NYT
         QtKxus38x1kVQnJMYibtC7SodgRP0Xj+ZqukfVOfKzN0jAYiREMgvvw/tJAo80jTvc+M
         BWAGAAFfrFoTUEp6AlkovQ3b7W5bkQMGZntPmGXTe73YiWoeeDW+/m/YcANLH0gh43AA
         Ak/WHhmQ2ZYsoKYt3IlOOYCFOX3uXPoiSRHdHjzka+BxcsnmooPEBErBkj6j5VMCwW00
         kpfA==
X-Forwarded-Encrypted: i=1; AHgh+RpacRHPMR3G9pGy72qQyPV2YDhc7Um2Gs+n6IA/eNYbu/0833MFhyuLzimDWuR9DFAoS0p5R2EThw==@lists.linux.dev
X-Gm-Message-State: AFuF++ll7Tp5/xh52sYY0sxSBHh+6Ff5WTKWOJI+vC4wuQrGLmfTsSVC
	e39v6dE0cjnBIpcMVmCKCg4kovn95J8aOKtfLhbp2u2LriZ+lT6fYFkC
X-Gm-Gg: AR+sD12u+N5s2cZs1Dv4/89Hv/TxzElDgJ04LdyEn8DKcXxhM+1Z0R1pr4YuIcjvJFd
	dTWGiITN3I+7J51uSmZeWIC9Q+9opnxmioXu0PpEB4jkrqyAEBLiXofB8fIJug10bZbAZanlA3L
	glFsnNmtZZO3lMvJJVFNnr6cpnqOAc9kxcTLV1mFhtD/1a/N32nxTiahtbptlP8luS7WwvAxdpf
	+1IQw5OpSf9FEAhsPGyuBxNzgvoc87PmvZdwAMh+h/cUrejNZcgib1PSPTWYEj4yjfAxDQndLAf
	gHdD5NpBb6aooU48u9g3Zxq8twrJ0LzzzGABphbLEX/0qr6sgo3Kkims7LhvePsvC5EQ9Zj/xJU
	mP2Y78IAP49BNxqIf8deUR0uX/ujvGq67RWyndMwPe9Gm9OFZ3zno7GaxCLnzflGrFtlbnO7dqO
	su9dnbnGrTVneV5t+0IXL2d/ttzCFI05SPEjtzU//tCcT5Efvf11C7q4NnDy9vfjq3VXUeFA==
X-Received: by 2002:a17:90b:5790:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395deecf08fmr5441511a91.7.1787365040304;
        Fri, 21 Aug 2026 19:17:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49b406bsm961123a91.8.2026.08.21.19.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:17:19 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:17:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <aokGbT7XTCbxUQzl@inochi.infowork>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
 <20260819162115.2252812-2-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819162115.2252812-2-aurelien@aurel32.net>

On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> either be used for PCIe or USB3, depending on its configuration
> (spacemit,apmu). This configuration is defined at the board level, and
> assigning a phy line to a USB3 controller while it is configured as PCIe
> results in an "Invalid PHY mode" error.
> 
> Move the USB3 phy at the board level, the as it is done for the
> submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> there is one phy per USB controller.
> 
> [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> 
> Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> Cc: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b084a35aa00e..171bd2f40aa6 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -328,5 +328,8 @@ &usb3d_u2phy {
>  };
>  
>  &usb3d {
> +	phys = <&usb3d_u2phy>,
> +	       <&combophy 4 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index c3f2dce0969c..3e24054d2084 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
>  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
>  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
>  			reset-names = "ahb", "vcc", "phy";

> -			phys = <&usb3d_u2phy>,
> -			       <&combophy 4 PHY_TYPE_USB3>;
> -			phy-names = "usb2-phy", "usb3-phy";
> +			phys = <&usb3d_u2phy>;
> +			phy-names = "usb2-phy";

I suggest removing this completely as we can not determine the
phy we used. I think it is suitable for setting this in board
file only

Regards,
Inochi

>  			phy_type = "utmi";
>  			snps,dis_enblslpm_quirk;
>  			snps,dis_u2_susphy_quirk;
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
