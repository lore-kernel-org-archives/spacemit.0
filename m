Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD80B36F904;
	Wed, 13 May 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659354; cv=none; b=N8yRDh7Smrz/IdS1Wsazca+3Rgd/Sp4LbHP/M9062B5o4ql2GG0xNx2L4JzneegVF7Y1ZWnnTXqV6H1OXu37+TZPR1vLC/9veMyAQzAElp2KqwLTcJORqLnfqQQ5UN2WiyDxfzIxK2KLcja0Lb8rpFY6beHCRsbN1QXbkW2W5uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659354; c=relaxed/simple;
	bh=LJ+OZyd1KVqzqQx0da6hI3yv+DimVEexTWPbxsJi33Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOHRuHU1bK5C2K3fDHKcISafYT95cGHViYj2FPC9PgpuYVkT0aCTMezkBJ/ny392llUMygldwwewa+uZAJoClQTHPEYj+ZT2YOW+t50Lw8A0YSaMcUvKIk8gsAYpiqg1mh3oQEAmPdHXKakAGRtt1qJ7pOeQk6M8kdpTSoihPtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qj7+jGEp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qj7+jGEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BEFC2BCB7;
	Wed, 13 May 2026 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778659354;
	bh=LJ+OZyd1KVqzqQx0da6hI3yv+DimVEexTWPbxsJi33Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qj7+jGEpuj4CoThb4qZRIfcDLV0hkXt0EX9NQUpYWjAzsxvDvOSmgB6MD14YNlSsG
	 oEO1l34Bq4X9nW6U1dmdkrTMl/R2Gy4Eom0NAlpEGy+wCA/p7LtEwkzzM1vNPnL8WN
	 TCtcwr5b2vMXrerRXp/b44N/icVNVZpqRv4Wysmc6ZmO7RSJIn8F6vy7C0QsKbTqVr
	 w2uDGfzBtQZKmAfBMYFtmTJrek4Q3wQYIvTPaLknQeTrZMXBoAPpHLHp9oFP8tCrbk
	 cHaMPKXB/JXOv2U+luKbEu02L/xZEHt4Gt6Zfi0AD9SgGR7r34aizYSKTQJ0RLTYS/
	 2cHm0Jz7A+UzQ==
Date: Wed, 13 May 2026 08:02:32 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
Message-ID: <20260513080232-GKA3644607@kernel.org>
References: <20260513071958.29574-1-a.heider@gmail.com>
 <20260513071958.29574-2-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513071958.29574-2-a.heider@gmail.com>

Hi Andre,

On 09:19 Wed 13 May     , Andre Heider wrote:
> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
> for the board's power infrastructure and voltage regulation support.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>
> ---
>  .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 29e333b670cf0..e0b585c50014b 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -17,6 +17,7 @@ / {
>  	aliases {
>  		ethernet0 = &eth0;
>  		serial0 = &uart0;
> +		i2c8 = &i2c8;
>  	};
>  
>  	chosen {
> @@ -33,6 +34,15 @@ led1 {
>  			default-state = "on";
>  		};
>  	};
> +
..
> +	reg_vcc_4v0: regulator-vcc-4v0 {
I prefer to keep this name same as other boards, so let's change it
to reg_vcc_4v ..

> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC4V0";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>  };

-- 
Yixun Lan (dlan)
