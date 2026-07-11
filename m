Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7D1A0BF3
	for <spacemit@lists.linux.dev>; Sat, 11 Jul 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783754416; cv=none; b=Y9ozrSZQxNqvMH+WSqcpvt1SkA5gxDczQ2PcCubVnjSqKtS+QUeEjIi/0ufislDcLBQECE8BYBCOhzp5VR5tPOvlInGJNEuI70b+pOiZ+4xT/DBCaCrVfQbH3aU+DVFg5UajOxc/C9fkVAkNUUxPGoKsOVVOKPNcB63xMnR6mSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783754416; c=relaxed/simple;
	bh=5/IVMg7m+YUeqqaYrkeep9Y4dUU+S0uzEjToK5eYRHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7Pj/qM+ujaM+CuHLrFkCBbIKGffVeQjWqD+2UNFNSjuvKgKhS2hAVlWR77KhwdjKsxUzaR7aTsvsA8/ALREbOIogIZE2VLr0lRejUkgHoqwDAU3qLwm+WmXCmT5kGtDeTCTrWBkJxw2Ae9KQkLCVVSgGXlJ6ZFaUJnErXN1ELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=iQSoRTtQ; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="iQSoRTtQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1783754367;
	bh=ngWbz8DrOWdmcWpLkZogRY7ab+fCnSeo75BW8o2EQes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iQSoRTtQZRu/nW1sc6xNC538QoXSWRk9gIIv9Cp3eRJ9B2AIb+II9nmI2QYNYcGJZ
	 nATa6FvHJO86pldUgN2951/HhzAw6O5l3h2RKu6gsWvoNdDC3kWLt74trNQL3w4/6j
	 dWhG/bcZ2VxuQYPlkBBILuPsCrOpjDHlgXprU4Y6B/BU/vcxuoZs7eOPeOnIY8Taap
	 lRk09eUVROo+3p0S91KVd0UaQrz9IH/c5fzz4IGXvbHC15fBfWuflAtwfd+owb5cXB
	 ZpAxTcMkpOFhpeeaVAUdTKVFkwwJoZtrS9hBPjC9zwaJtoNL8Wg46WFlAnDfSVA6zC
	 mDgdgi/kjvA6g==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id DFDCCB2215A9;
	Sat, 11 Jul 2026 09:19:24 +0200 (CEST)
Message-ID: <65498313-582e-4891-9468-a38a76cb4626@freeshell.de>
Date: Sat, 11 Jul 2026 00:19:15 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260710063314.1030249-1-inochiama@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Inochi,

On 7/9/26 23:33, Inochi Amaoto wrote:
> RTL8211F require at least 50ms deassert to guarantee the register
> access, 10ms is only enough for the PHY reset.
> 
> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index 1eb5abbc61f9..b2a7d2d0d3a8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -200,7 +200,7 @@ phy0: phy@1 {
>  			reg = <1>;
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <10000>;
> -			reset-deassert-us = <10000>;
> +			reset-deassert-us = <50000>;
>  		};
>  	};
>  };

applying this as vendor pre-installed u-boot runtime command modifying
Fdt as...

load usb 0:1 $fdt_addr_r
/debian-installer/device-tree-custom/spacemit/k3-pico-itx.dtb
load usb 0:1 $kernel_addr_r /debian-installer/riscv64/linux-custom
load usb 0:1 $ramdisk_addr_r /debian-installer/riscv64/initrd-custom.gz
fdt addr $fdt_addr_r
fdt resize
fdt rm /soc/ethernet@cac80000/mdio/phy@1 reset-deassert-us
fdt set /soc/ethernet@cac80000/mdio/phy@1 reset-deassert-us <50000>
env set bootargs 'initrd='$ramdisk_addr_r',0x'$filesize'
console=ttyS0,115200'
ping 127.0.0.1; bootefi $kernel_addr_r $fdt_addr_r

...before booting 7.2-rc2 and debian-installer initrd is successful to
allow debian-installer hardware probe to continue with the network
device, on Sipeed K3 Pico ITX. I don't know if that is a full fix for
the problem I observed with rmmod/modprobe cycle of network module but
at least it is resolving this trouble observed from debian-installer
usage with K3 Pico ITX.

Non-functional values are 10000 25000 30000 35000 39000 39750 39700
39600 39585 39581.
Functioning values are 39582 39583 39580 39575 39550 39500 40000 50000.

For this particular hardware I have thus observed an exact minimum
required delay value of 39582.

Tested-by: E Shattow <e@freeshell.de>
