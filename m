Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9714633B6F9
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146824; cv=none; b=VJBjsR8nQGqayy3/1fZ8IJWNmxk46QvQs5TQfeHojunUBXnyCcFYtEPwhXLl+EycB1Y9i0JWvf737cvvINEeLlOv0jrxRjIR4VuCkpuxVLZgn/IQ21SoUQv/0MqnkO5O+dqHp6WMY2Sfjn8sES+9PiO1ToqhvXSLt2knw+7dWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146824; c=relaxed/simple;
	bh=U24exTQdNnR0zLnwpf0rMiGqP4RPK7P7n+8aYdLgbRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=revBNXvwQtBu2vxFlzPPQ5Kx5sEbejbICc6OdMEMnUrtHyzNud23lt5FIB0UYcXkuSZRr9bsg7kw/NNLJ2T02JXYJtnEEteGh5CIbh5ZJbc2I53QTOXzOeTrvUwVlwQRKMhK5xsGD/KJrVyZjYTyxzDJHqMj+/ijwtRilXgOX/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 78C9A340BDE;
	Fri, 19 Dec 2025 12:20:22 +0000 (UTC)
Date: Fri, 19 Dec 2025 20:20:18 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/5] riscv: dts: spacemit: Add a PCIe regulator
Message-ID: <20251219122018-GYC1958363@gentoo.org>
References: <20251218151235.454997-1-elder@riscstar.com>
 <20251218151235.454997-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151235.454997-5-elder@riscstar.com>


On 09:12 Thu 18 Dec     , Alex Elder wrote:
> Define a 3.3v fixed voltage regulator to be used by PCIe on the
> Banana Pi BPI-F3.  On this platform, this regulator is always on.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 02f218a16318e..71f48454ba47c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -33,6 +33,14 @@ led1 {
>  		};
>  	};
>  
> +	pcie_vcc_3v3: pcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_VCC3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
>  	reg_dc_in: dc-in-12v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "dc_in_12v";
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)
