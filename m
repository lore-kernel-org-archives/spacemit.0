Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F570284662
	for <spacemit@lists.linux.dev>; Sun,  1 Feb 2026 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769945479; cv=none; b=Mskzzc6ZLz4cTK81DGIePgcDZOqQ5I7S1OTAtzYaIEUnyfWEXIv0jteLXi2NfE8TLeGWnVQjaIXqhdDT84HdfNKqWW6Kalm9tjpALFiAD7iXxBtoR0jgb0XYl/qNjNQgSEtobD7nylQL/XgDpxSEvVZW5HsCxMAlbW6V8oOgPgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769945479; c=relaxed/simple;
	bh=6zdgiU7dUhNBPHXid6NrDxruFhCcWV1jYYqd+5EI8mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktyxU9hbSru4mXYoRYFxPgHImO0GFXOZbxf/mz1bukllOv/bX/Fhfe2w5FTATKDSkHpe31yIWHKV9di3hrtoxfECx3Xbc/VYFmSm7m+EpDt9jXBeIZ9U/WdKfyt+F3wWSrduL0d/oBYJuom1SV3Nlh28u66nhyIovsJxPvc0o/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 64436341EE4;
	Sun, 01 Feb 2026 11:31:15 +0000 (UTC)
Date: Sun, 1 Feb 2026 19:31:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 2/7] riscv: dts: spacemit: Define fixed regulators for
 OrangePi RV2
Message-ID: <20260201113110-GYB109598@gentoo.org>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
 <c5799da08242f8aa1a77f144ab0273d68af1841f.1769895215.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5799da08242f8aa1a77f144ab0273d68af1841f.1769895215.git.gaohan@iscas.ac.cn>

Hi Han,

On 05:38 Sun 01 Feb     , Han Gao wrote:
> Define the DC power input and the 4v power as fixed regulator supplies.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 93880ba7bdfe..bd1e45e95e38 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -23,6 +23,25 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	reg_dc_in: dc-in-12v {
this is copy & paste.. per discussion with Chukun, I'd suggest to add
'regulator-' prefix, see

https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn

> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_vcc_4v: vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)
