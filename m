Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2960392B61
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084592; cv=none; b=cFUeM3ZCKBPNQ6OCP4Sihj16VxpuVhbjGTcXbu6xjdkaJV45RyhKMkuAD3lKX5KIhlZwb3Ym4C9TNQc8JGPQFei0mUGYT514TqxsVSX9uKdFzRGWze/UxuzYD47HiTU1rDzstR7s1yIGDxN1LS89mbdIknbqeTcnw8C56+N+JWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084592; c=relaxed/simple;
	bh=AEXK4Uo79H93u4Zg/6ykx8c4qSUS2DgD3vMxYcWlTso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+95yp+taGidBW3m67IogRQCDFAUpYd+v8A+QGSbmnviN1XvSVYNo/abVjof3pVQ9I6jhsvMhUgzwrBLWJlWXqZNKb9Sm4Yv+CrarSYWdiRwDtqfAlolJy3p3jN9zZjNDv3g6phGpju2izpdgMUctb4Lzju7jjbBgIGvRJwhYYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9116E341A11;
	Thu, 22 Jan 2026 12:23:09 +0000 (UTC)
Date: Thu, 22 Jan 2026 20:23:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260122122305-GYD63789@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com>

Hi Guodong,

On 17:43 Thu 22 Jan     , Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
> 
While checking schematics/docs, I found the SWIN/SWOUT are not
described in the dt-binding? is this intentional? I have no problem
if you plan to implement it separately later, just curious to ask..

In Bananapi F3/Jupiter board, it's used as LCD_VCC5V0 out

> This allows different boards to describe their actual
> power tree connections in devicetree rather than hardcoding supply
> relationships in the driver.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> index c6593ac6ef6adb72fc48af570dc13fc9edf77ccb..abdc93b9a67b1872c8fe6955abd950622a0b69e8 100644
> --- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -27,8 +27,41 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  vin-supply:
> -    description: Input supply phandle.
> +  vin1-supply:
> +    description:
> +      Power supply for BUCK1. Required if BUCK1 is defined.
> +
> +  vin2-supply:
> +    description:
> +      Power supply for BUCK2. Required if BUCK2 is defined.
> +
> +  vin3-supply:
> +    description:
> +      Power supply for BUCK3. Required if BUCK3 is defined.
> +
> +  vin4-supply:
> +    description:
> +      Power supply for BUCK4. Required if BUCK4 is defined.
> +
> +  vin5-supply:
> +    description:
> +      Power supply for BUCK5. Required if BUCK5 is defined.
> +
> +  vin6-supply:
> +    description:
> +      Power supply for BUCK6. Required if BUCK6 is defined.
> +
> +  aldoin-supply:
> +    description:
> +      Power supply for ALDO1-4. Required if any are defined.
> +
> +  dldoin1-supply:
> +    description:
> +      Power supply for DLDO1-4. Required if any are defined.
> +
> +  dldoin2-supply:
> +    description:
> +      Power supply for DLDO5-7. Required if any are defined.
>  
>    regulators:
>      type: object
> @@ -50,6 +83,15 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> +    / {
> +        reg_vcc_5v: regulator-vcc-5v {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vcc_5v";
> +            regulator-min-microvolt = <5000000>;
> +            regulator-max-microvolt = <5000000>;
> +        };
> +    };
> +
>      i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
> @@ -58,6 +100,10 @@ examples:
>              compatible = "spacemit,p1";
>              reg = <0x41>;
>              interrupts = <64>;
> +            vin1-supply = <&reg_vcc_5v>;
> +            vin5-supply = <&reg_vcc_5v>;
> +            aldoin-supply = <&reg_vcc_5v>;
> +            dldoin1-supply = <&buck5>;
>  
>              regulators {
>                  buck1 {
> @@ -68,6 +114,14 @@ examples:
>                      regulator-always-on;
>                  };
>  
> +                buck5: buck5 {
> +                    regulator-name = "buck5";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3450000>;
> +                    regulator-ramp-delay = <5000>;
> +                    regulator-always-on;
> +                };
> +
>                  aldo1 {
>                      regulator-name = "aldo1";
>                      regulator-min-microvolt = <500000>;
> 
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
