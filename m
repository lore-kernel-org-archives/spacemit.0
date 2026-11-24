Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522644;
	b=cyVE8qJ3E14+mKmRBMqs3OX9u5IQ2gR69HZzuvjXitq7uiW77+e8en0EcUiuPGrojYhf
	 yOGNA3Y7aSq+fMaDdn8svmQpGe6jPIzyArbulu7cMlgrPcK7DkYRawYaWaQt8IIyM7AVZ
	 uho0YTX/kXowUtppW9R0Kik7E3iea88i29Ggl5ffdg4biv9pVNBVs1ERaLj6PSfsoXrf0
	 5Y7yEvDMX17Zd0Obex1ZPNhzFv9mwzFw6CTjWwzncj+8GdbRIaj+uJM2DmuSrHTwIOEB+
	 ZGVkYQJDBGr6E1zTBgop3EFNSbrF8O/z1qIRjlq8il6rkqrbErCAQMABiic0EIbYpXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522644;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ck6kiCUJ2Nnh4S9Lexj7ozDGtWc6otailWEPqpSNlOA=;
	b=1cP+DtCfSZiep6GQYn2aNWwHqfX8dsSPGacJQ2reNECdJWYs5dY8M0qcFaJ/OP9LD5TJ
	 tz/gXHyBXjjsH9dUY+qyofKIE0ebWeChrp6Wgr6SUx3caNkMqfnhdxbuTf5Hc9pn+YHbT
	 bwCKWtxiIqyyK/yzQQbPcJIxNfot7yBL8G2zY/ANuZXI5NtCU25FmULRBB7zj+R9kEJdF
	 a28Ev1KHWolgjs3yJJANJrd5q/1pg0SrAW/3fLQqUupj5YE54ABuDPG1671wrSUiuaDmH
	 0XQ0mi9QW+cHUBKZJZ1KZcceqnEQo2WAdEeRyn/kNWR3HhU54o/jt614bMbb+dw7jWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9HZe9Ar;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0A606A31E;
	Tue, 24 Nov 2026 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9HZe9Ar
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C369D1F000D0;
	Tue, 24 Nov 2026 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522644;
	bh=Ck6kiCUJ2Nnh4S9Lexj7ozDGtWc6otailWEPqpSNlOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J9HZe9ArwAdfTWLIwlK9s0zK1LcZwdcKQ4gsPQwYmKB9MTEZnzoAcJkBDQG8yUWfr
	 j9Bszdn+JpK5gIhYJNUlNaIedgsdA7F+G3cQrSy4jTjVHhIjNPpqTIN8MkLCBW7Lbb
	 C18yk3Sw6KZt2kRtXRiLBz6dPDzA2A7/9h9sZYp3/3XX4ZG8Mse7Eg6q87crDIGTZx
	 YZqsYb1CCQPsW+bJsgmB+9R6qZ6uYIeyqj7fjDCDauWDTGQNL8PvkKZ02adzrP0dPM
	 G42Q/0dpxz4cnGnBNzIvK3XYeTFxrSUFwIPTLKg+rtVP50w+oowInrBhFuBTCHGSxI
	 wRhTmi6GtBAsQ==
Date: Tue, 24 Nov 2026 12:17:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] riscv: dts: spacemit: k3-com260-ifx: Drop wrong SD
 card vmmc-supply
Message-ID: <20261124121721-GKK100890@kernel.org>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-1-138b39d74602@linux.spacemit.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-1-138b39d74602@linux.spacemit.com>


On 08:23 Thu 05 Nov     , Troy Mitchell wrote:
> The SD card VDD on the K3 CoM260 module comes from a fixed, always-on
> 3.3 V rail that software cannot control. ALDO4 of the P1 PMIC does not
> supply the card, so referencing it as vmmc-supply describes the wrong
> power wiring.
> 
> Drop the vmmc-supply property. It is optional for a card powered by a
> fixed supply, and the SDHCI core then uses the voltages advertised by
> the controller.
> 
> Fixes: 055044260e7a ("riscv: dts: spacemit: k3: Enable SD card support")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index fadcf28389be..6e295bc6f196 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -122,7 +122,6 @@ &sdhci0 {
>  	no-sdio;
>  	disable-wp;
>  	cap-sd-highspeed;
> -	vmmc-supply = <&aldo4>;
>  	vqmmc-supply = <&aldo1>;
>  	sd-uhs-sdr25;
>  	sd-uhs-sdr50;
> 
> -- 
> 2.56.0
> 

-- 
Yixun Lan (dlan)
