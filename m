Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200FC2BD0B;
	Thu, 19 Mar 2026 04:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892901; cv=none; b=j4r8KhgudJSDgBPL03K4g9PoMSu4wSO3/CciUyqA1A6IKW7R/GUu9HHlApSFkwV5rOuwRRj+7WK0lHGZCp/Zf0ZwaFgds7JHb3IkG+DZYyc0TPjqkocRp4OaBf5DDJ+VOggsPTt029Xrq3diXgRGPz0JayzQuUp21nKgE84qISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892901; c=relaxed/simple;
	bh=cqnRxuUoj77h+g56oMH45SceAVbIRUHI0ZJ0eFYIqmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0NM/lLNQxNvrzbECG8e3jNLw/SY5DyLQEpwZfKUTi8G4aoD7qpnMP8Kj1sNH5JVk5kron/lDkePiXxnNBKNlfgxNqmzW/kpr8T4YpkjqTrjLf0VQhoNVjlDuNLDoZtD+ZJCd0w6PcgcMjGQv49c0SSn+dh4dbRvnegwl6uXBk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJt1BQUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJt1BQUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D46C19425;
	Thu, 19 Mar 2026 04:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773892900;
	bh=cqnRxuUoj77h+g56oMH45SceAVbIRUHI0ZJ0eFYIqmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJt1BQUg6eH7gat6EK2Kaj1qoBH0DhLGKczphglhTiSaxrcHflewnn60yRbXrxSuw
	 ZeTCjTmSL7vZO2Zoh1BPCS9Ku979eHwT56fcskealop7XzuYawQ2h5IwSEKMA0j1sS
	 dUFPhjdMKGM8O+cCbvaAO5UO5W8x/qYLU/QfkfV/fQaCHilTEWBB0tguN49FxPfOMd
	 IqE19TbLoYN9H28KR+HnfzTGj8+6ETGMLYaO23OyY/UBdbFpC3OY7X+UcwKJIli5Vp
	 9NJeTr8d3mWY7eOlQqCcObWa0jTICesh+jV3XWnhFVGoZZeVbcanIcuyP7uFwvEj3h
	 9tBrfkkJom+QQ==
Date: Thu, 19 Mar 2026 12:01:38 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: reorder phy nodes for K1
Message-ID: <20260319040138-GKA497893@kernel.org>
References: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318100000.3934516-1-amadeus@jmu.edu.cn>

Hi Chukun, 

On 18:00 Wed 18 Mar     , Chukun Pan wrote:
> Reorder the PHY nodes of USB and PCIe to the correct positions based on
> the register address. This improves the readability and maintainability
> of the DT. No functional change is introduced by this reordering.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 108 +++++++++++++--------------
>  1 file changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index d2015201f8e5..f0bad6855c97 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -359,6 +359,60 @@ syscon_rcpu2: system-controller@c0888000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		usbphy2: phy@c0a30000 {
> +			compatible = "spacemit,k1-usb2-phy";
> +			reg = <0x0 0xc0a30000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_USB30>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		combo_phy: phy@c0b10000 {
> +			compatible = "spacemit,k1-combo-phy";
> +			reg = <0x0 0xc0b10000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>,
> +				 <&syscon_apmu CLK_PCIE0_DBI>,
> +				 <&syscon_apmu CLK_PCIE0_MASTER>,
> +				 <&syscon_apmu CLK_PCIE0_SLAVE>;
> +			clock-names = "refclk",
> +				      "dbi",
> +				      "mstr",
> +				      "slv";
> +			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
> +				 <&syscon_apmu RESET_PCIE0_DBI>,
> +				 <&syscon_apmu RESET_PCIE0_MASTER>,
> +				 <&syscon_apmu RESET_PCIE0_SLAVE>;
> +			reset-names = "phy",
> +				      "dbi",
> +				      "mstr",
> +				      "slv";
> +			#phy-cells = <1>;
> +			spacemit,apmu = <&syscon_apmu>;
> +			status = "disabled";
> +		};
> +
> +		pcie1_phy: phy@c0c10000 {
> +			compatible = "spacemit,k1-pcie-phy";
> +			reg = <0x0 0xc0c10000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			clock-names = "refclk";
> +			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
> +			reset-names = "phy";
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		pcie2_phy: phy@c0d10000 {
> +			compatible = "spacemit,k1-pcie-phy";
> +			reg = <0x0 0xc0d10000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			clock-names = "refclk";
> +			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
> +			reset-names = "phy";
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@d4010800 {
>  			compatible = "spacemit,k1-i2c";
>  			reg = <0x0 0xd4010800 0x0 0x38>;
> @@ -429,60 +483,6 @@ i2c5: i2c@d4013800 {
>  			status = "disabled";
>  		};
>  
> -		usbphy2: phy@c0a30000 {
> -			compatible = "spacemit,k1-usb2-phy";
> -			reg = <0x0 0xc0a30000 0x0 0x200>;
> -			clocks = <&syscon_apmu CLK_USB30>;
> -			#phy-cells = <0>;
> -			status = "disabled";
> -		};
> -
> -		combo_phy: phy@c0b10000 {
> -			compatible = "spacemit,k1-combo-phy";
> -			reg = <0x0 0xc0b10000 0x0 0x1000>;
> -			clocks = <&vctcxo_24m>,
> -				 <&syscon_apmu CLK_PCIE0_DBI>,
> -				 <&syscon_apmu CLK_PCIE0_MASTER>,
> -				 <&syscon_apmu CLK_PCIE0_SLAVE>;
> -			clock-names = "refclk",
> -				      "dbi",
> -				      "mstr",
> -				      "slv";
> -			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
> -				 <&syscon_apmu RESET_PCIE0_DBI>,
> -				 <&syscon_apmu RESET_PCIE0_MASTER>,
> -				 <&syscon_apmu RESET_PCIE0_SLAVE>;
> -			reset-names = "phy",
> -				      "dbi",
> -				      "mstr",
> -				      "slv";
> -			#phy-cells = <1>;
> -			spacemit,apmu = <&syscon_apmu>;
> -			status = "disabled";
> -		};
> -
> -		pcie1_phy: phy@c0c10000 {
> -			compatible = "spacemit,k1-pcie-phy";
> -			reg = <0x0 0xc0c10000 0x0 0x1000>;
> -			clocks = <&vctcxo_24m>;
> -			clock-names = "refclk";
> -			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
> -			reset-names = "phy";
> -			#phy-cells = <0>;
> -			status = "disabled";
> -		};
> -
> -		pcie2_phy: phy@c0d10000 {
> -			compatible = "spacemit,k1-pcie-phy";
> -			reg = <0x0 0xc0d10000 0x0 0x1000>;
> -			clocks = <&vctcxo_24m>;
> -			clock-names = "refclk";
> -			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
> -			reset-names = "phy";
> -			#phy-cells = <0>;
> -			status = "disabled";
> -		};
> -
>  		syscon_apbc: system-controller@d4015000 {
>  			compatible = "spacemit,k1-syscon-apbc";
>  			reg = <0x0 0xd4015000 0x0 0x1000>;
> -- 
> 2.34.1
> 
> 

-- 
Yixun Lan (dlan)
