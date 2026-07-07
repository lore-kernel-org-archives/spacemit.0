Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47830E0E9;
	Tue,  7 Jul 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411006; cv=none; b=UPmUSwsGjWa27JNyk4xcZHMNWuZ9H5UfTypGG1TiUtGMGN4WhDOXm7vQOPc7ZfUMk7y4dvvBJaHWpS2g6VxTnIPO2Gy7xPTSJ68JkPPoXTCwyZSifs1jscm697tQExsuHsWQKTCs0ucUqoOzechHrH/1AxI4Ze5wfj4L97th3kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411006; c=relaxed/simple;
	bh=t45HS3VqzLs2gZdMxEqbLZ8AZAO09G1Hi91tXQsUgyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evtztG6fFqd7AoxPrivwl5H3rzynKIyCF7t71ARm7XXs/xoyg1fFGJaeNw9wn8swDoW6CqUOkVIFdLWs+D13hZHi/1DRL39SpT1B3Mx/Sog7FhL1QpoXRR//1t0MHVbwxkeNFWZA0rEyeErvJ2sKbRZSGzxXyE5h0FE+r5zdFCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9bjJadL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9bjJadL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245F11F000E9;
	Tue,  7 Jul 2026 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411005;
	bh=qaJDMFyR+9jLQSxF03msoSIkTshFmDA4EhMhCDFnmjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A9bjJadLxG7fn5qzOI2Qt9OPM+U3hP3p5LM/75sg6b45yzGpoyX8tnEdXaOuB4HRh
	 /bwASg9dpZ5oFrf+ISXo4aN3d3Z9jl070OUQMmTjx10FdBHbb6nueTTppRJelqTRBN
	 A7PJopGnCYOuFPjxQQTgbWlSzbytw0HVdLLLN6N3DGcs+kO6TK0uM75Z4E3o0zTH8O
	 hznV7A8UruoBehq1CXMx92z33Q3Lr5YDSwaK9KLxSZLwZayKvIYX32AkQ26YuCBKU4
	 U44d6P9KWlHlzB4i6z8s/MiB75PZPiu7Jr8RPAZAS8hCVHGJ8+AGs7NLVZm7Gvm+mS
	 3+GlhJSgmoziQ==
Date: Tue, 7 Jul 2026 07:56:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: improve RTL8211F PHY
 configuration on K3 Pico-ITX board
Message-ID: <20260707075642-GKG35811@kernel.org>
References: <20260623204431.498700-1-aurelien@aurel32.net>
 <20260623204431.498700-6-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623204431.498700-6-aurelien@aurel32.net>

Hi Aurelien,

On 22:43 Tue 23 Jun     , Aurelien Jarno wrote:
> Vendor kernel enabled ALDPS (Advanced Link Down Power Saving) on the
> RTL8211F PHY to save power when link down.
for ALDPS, tested here do noticed it will configure RTL8211F PHY's
 RTL8211F_PHYCR1 register via rtl8211f_config_aldps()

And plug out then in the cable, the network(eth0) will come back and still
works fine, although I have no power consumption meter to test, but I think
 it deserves:

Tested-by: Yixun Lan <dlan@kernel.org>

> 
> Vendor kernel also disabled the 125MHz clkout clock signal, and indeed
> the schematics confirms that it only goes to a test point (TP14), so
> let's do the same.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index bf64b6c6f867f..e12d798b48a49 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -234,6 +234,8 @@ phy0: phy@1 {
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <10000>;
>  			reset-deassert-us = <10000>;
> +			realtek,aldps-enable;
> +			realtek,clkout-disable;
>  		};
>  	};
>  };
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)
