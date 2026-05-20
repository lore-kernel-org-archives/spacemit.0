Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EE0371CEC;
	Wed, 20 May 2026 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264727; cv=none; b=cI/85m+fZminhZhM3fq6TrZFQxypv/QZJkeM9Lbo9cZRXwbslbVEmCj28f1mm7G3078AqVWU6Mx+WG+2IzCDS15rLceZ3dDuyvsOI+D/GscfehYPG88GgKyGeQRkWkkgAIGdCHDhCiVChdd123dbJJxJYFy2s2t+2BTCEzG91JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264727; c=relaxed/simple;
	bh=Xd4FCm+IbsvuPAHqALoMNoQAnc0M3QxUm54pTXP1DyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5JstkwSbnOhmVvuEa9JszIHuCkaknuemCSXFamy/lkKb1E+mCeJCp5aydKJTUHqC2T9bEkkC+5InyLDlvDvoWAA1PuCojG/rA6bSvMNJ0OAJ6Qfg0YzOvfYS8JpkVFokY8BcQysZFBQPjxSYH7Kxeyw4eDHE19ApF1g4pyDnvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3pFs3B+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3pFs3B+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77591F000E9;
	Wed, 20 May 2026 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264725;
	bh=p5jXKIXsDEpFifcmEEE6Bq+aFMDhGYXdAe/Ul0Di0wA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W3pFs3B+ttoH87zVNnXdVdSwOdN5ztY024RDDllGWHv/9eLtBDOHGrtiLSuk7P/f5
	 pgHNfUSzeBsVt2sm3VuUFEw6cjUlrVe1Ud5oT17GMK28B1KWv2y8Ph97lTXBj2aKDz
	 eOyn8Ig7PvmcL+zG87pEz1hIXLz3PuVhr36eUpmcAaLiN6p1vbuJrX4OY+hWOZPv2h
	 La8vO8xBbOn7YRBBfbUgRdy8MhIFWmt7Xz2vGivr5vP/d0mTIywdM9gxt91TasO24g
	 sm/7CLPSVoZ7BTVllwe86EYj391OAIjBRNOmPHA/4n6GpR5BWxTv2ZgWTLO1c3AB75
	 tAfaw9skiERHg==
Date: Wed, 20 May 2026 08:12:03 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: enable USB3 on OrangePi R2S
Message-ID: <20260520081203-GKB3708537@kernel.org>
References: <20260518100030.2354606-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518100030.2354606-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 18:00 Mon 18 May     , Chukun Pan wrote:
> Enable the DWC3 USB3.0 controller and its associated PHY on the
> OrangePi R2S. The USB regulator provides VBUS for USB2 and USB3
> ports, but the USB2 ports are handled by a separate controller.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> v2: Remove vin-supply for the vcc5v0_usb regulator.
> ---
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index de75f6aac740..1ecc40749e5a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -21,6 +21,19 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0";
>  	};
> +
> +	vcc5v0_usb: regulator-vcc5v0-usb {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
> +		regulator-name = "vcc5v0_usb";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +};
> +
> +&combo_phy {
> +	status = "okay";
>  };
>  
>  &emmc {
> @@ -90,3 +103,13 @@ &uart0 {
>  	pinctrl-0 = <&uart0_2_cfg>;
>  	status = "okay";
>  };
> +
> +&usbphy2 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3 {
> +	dr_mode = "host";
> +	vbus-supply = <&vcc5v0_usb>;
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

-- 
Yixun Lan (dlan)
