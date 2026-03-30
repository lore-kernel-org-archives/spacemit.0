Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692A11C5F27;
	Mon, 30 Mar 2026 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774830676; cv=none; b=sww2BpsCBvGOh+HwArdMpoT2eT2Ye8pXzTHJbkbiEFTkPvOWzYJHTAXhvLe5wqcCQuZKYBojBobWuP/XYgbJByp63tvCxLZQ7esWGUfY15VRhIR39PrZ0oA7fBMbT5Hvkml/L3UJrtRfwyLtgAygzA9DxgXeyxnmrKczcvTiSbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774830676; c=relaxed/simple;
	bh=vVykGeSajuTeLK4oYD2kGFulo5W4fx4EY0TEtNRZSqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSf/DfCYyJp4NjKqTOb6a9dhpQwKxr+Nb6va1RyImTTOfwC5uRbjcMusqOpWPCLgT0+MaPFo5L8BvzUPad4ZfDps44Sm1FtWzJUhGc/e7umJBdmgPKiuk7z1/N+MIg2fK4LQJBhifqweXAmrhHhjkOtEvmkEYgBYgTEhIBJdgIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bU0RQXe5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bU0RQXe5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BD1C116C6;
	Mon, 30 Mar 2026 00:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774830675;
	bh=vVykGeSajuTeLK4oYD2kGFulo5W4fx4EY0TEtNRZSqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bU0RQXe5KXMGSJrYwmARtlmlPmDVoFhLWYAJqg6A/z/+AQ0iW3yn6AzIVSFQZx8rv
	 D2IAei3ytQb16YPRmuUdWSP0Kz6F8uYORMQI40g3EWzuVtYImhqAdGFqwkk20xe/43
	 oV80i/asXxqxnuv6HQgo5Zmdt3idSO61pbFK/KaM36Dyiyf8XF6YHl4GJ5MmXOtOut
	 VkC5Meo1PfHJkrZrHvtDwwZy0DJFJCdomr1p0Mu1AUHheRYK7P4VasPp+LiRU8rwNs
	 D8quzZLt9bdt4+mGWksOjd18w19T0SIkD75EPGNZAAymUSCV5kyYAthi+xXxLrWfEf
	 +BXKrDhAPfDXw==
Date: Mon, 30 Mar 2026 08:31:13 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: dts: spacemit: Define the P1 PMIC
 regulators for OrangePi RV2
Message-ID: <20260330003113-GKA960072@kernel.org>
References: <cover.1774803532.git.gaohan@iscas.ac.cn>
 <492e0bea0fb84f49f4bead3dc3d563b13d98df11.1774803532.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <492e0bea0fb84f49f4bead3dc3d563b13d98df11.1774803532.git.gaohan@iscas.ac.cn>

Hi Han,

On 01:05 Mon 30 Mar     , Han Gao wrote:
> Define the DC power input and the 4v power as fixed regulator supplies.
> 
> Define the SpacemiT P1 PMIC voltage regulators and their constraints.
> 
..
> The power management hardware design on the OrangePi RV2 is identical to
> the Banana Pi BPI-F3, so the DT Nodes were taken from k1-bananapi-f3.dts.
I'd suggest to drop above comment, it's vague and even not a direct reason..

> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 93880ba7bdfe..1b1b27bc95d8 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -23,6 +23,25 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
..
> +	reg_dc_in: regulator-vcc-in-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
This regulator can be dropped, it's not used by *device*, take a look at Krzysztof's comment

https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org

-- 
Yixun Lan (dlan)
