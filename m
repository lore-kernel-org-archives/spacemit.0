Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34FF2C11DE;
	Tue, 31 Mar 2026 06:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937027; cv=none; b=NOT76+pI0UOk7Pg3GwHcsQfDiZpDKjN5AKC1Bk7d572RV+bh72Z7uNgYZZyNLYVYej9CLN8M16XDBGW1qEDuF4llhewUxiBhy17DPJb77exVT1VQxz0pfJrBx4pBakLx6FdW6yfrlnRPM4bds1/x9IPcS152upqaoNnPpQm9/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937027; c=relaxed/simple;
	bh=DXSCh/jt76xc1rZLMYsNc8cyKsm9+s2g5NNKgBvpYbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gf6ffhQ1HFYfzrHNJXFk/nBus50fcrkqPIcDFExuPZmN3COdnlymE4D2rbJNwmo3z5WiiUTGFahK9kt4lj4RTbXjfZykFqk9aGeTC81nyFli/2TMYjXcxsR4EW7+Y4J6q9sszmPtmvcWI/PmYsUNqgX1rZyGEwVSgpc48mf8EPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmLZTzvd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmLZTzvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD93C19423;
	Tue, 31 Mar 2026 06:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774937027;
	bh=DXSCh/jt76xc1rZLMYsNc8cyKsm9+s2g5NNKgBvpYbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmLZTzvdl1kjBuXUptV4s7PGvqZdu35s3e6KAIomjM4oF/acc23PjKYQgmIcojvFf
	 TEaq/LW0uZeJmVwQHHb5Sl7bXhF3no5hbBLKMmu7Gabu9CmbMUTaNI3Vf/TNdDaEXx
	 tRyNdZcCcveV4eRIIEF9+WFD/Cn9NQOUi6XQJiaOzbsVCWYZFKQcH7qV2mNtY7Ji54
	 MSjBIB6onOh5MX6GJ+RHgH1Tcp5RTLiBHWzaOkpPwMFPtcadQwcX+HX29fiFBOIJQg
	 Eh4IHwap67aMCBJmn/LsyLY1HINi7J3kG5zEuSFqio74V6e9zaNGv9NCumyN0rALLp
	 FT5V+0Lgc9jcQ==
Date: Tue, 31 Mar 2026 14:03:44 +0800
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add
 deepcomputing,fml13v05
Message-ID: <20260331060344-GKA976850@kernel.org>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034539.67167-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331034539.67167-1-sandie.cao@deepcomputing.io>

Hi Sandie,
On 11:45 Tue 31 Mar     , Sandie Cao wrote:
> From: sandiecao <sandie.cao@deepcomputing.io>

Can you use more formal format for your name? which,
Sandie Cao <sandie.cao@deepcomputing.io>

> 
> Document the compatible string for the Deepcomputing fml13v05.
> It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
> Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.
> 
> Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
same here
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index b958b94a924d..af8030242bdc 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -29,6 +29,7 @@ properties:
>            - const: spacemit,k1
>        - items:
>            - enum:
> +              - deepcomputing,fml13v05
>                - spacemit,k3-pico-itx
>            - const: spacemit,k3
>  
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)
