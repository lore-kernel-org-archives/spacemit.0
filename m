Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562E280331;
	Wed, 29 Jul 2026 01:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289101; cv=none; b=rxqLNuDpQSkCOI/0jOlpeNFQsgz7cdqRmK7J146Wj6Jw+9y4QsP+hL0eifWAMyvQy01ilRwDWuLUfCnQ5wMEIUOfuVOoqSzEHpZ0W9okfvuPc/Tb8aJ0X0KUCh206J+o61xu257kVAkSvTv0BH+vtUJjB/r6QrXq30hiyHwynsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289101; c=relaxed/simple;
	bh=l9Ry2Gy4EGoib6C7MUK6IzIhce8/KBiNSPvA+uSCbXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3/YyHwL2yBLiNieM/JlNReqxHwNZTrP4j5g0uH4QB7ZyiqGAGCcqqMG+ZY2sBvRmEptmU7787MssZifvDPabCvoxL8hXnJb0UsOm4q/uP3h/1iLDQuUjwsTCTltfcL4LPnHdy69JhW78aEaM4efgHgLAXUVsETq/o/o7O5QWDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6RhXarU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6RhXarU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9750F1F000E9;
	Wed, 29 Jul 2026 01:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785289100;
	bh=BRBw5mkstOYAXEr0e2N2HIMEW5e9mnlMD5LgLX++0HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D6RhXarUTxl11IJnNeA2w++BJ6tMaQ4Aqoa/+UM+0zOC6o5BmOVsG9WcJuZIHlqqO
	 qgi7bohtVF3qJklGf4WAPrP/fw24lAEo03xZYnTOKMX5NnTTLQ1PzB/FSn86pkJaNJ
	 QVt1p/UzzuamE8Z21tA4jfa8VBUEQls9+Rpxof/YsxCnWbFuvCHnqhRDfhoRJ4/wAx
	 QChkPGwCj7a13JY677AjjqM6UFzTrGQqa1yUbao8XCcpKb+VSpw4JWgZdfS9uXkMRd
	 JMTbha7fqt5R9k3gAPLUWQ579CgTeURsuSfAhJiUh5LEsYSVze+nDR64KuMgX31SRc
	 KKWMEzWArwmsA==
Date: Wed, 29 Jul 2026 01:38:18 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Make dtschema recognize the
 etherent PHY correctly on K3 com260 board
Message-ID: <20260729013818-GKE77474@kernel.org>
References: <20260729012418.154652-1-inochiama@gmail.com>
 <20260729012418.154652-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729012418.154652-2-inochiama@gmail.com>


On 09:24 Wed 29 Jul     , Inochi Amaoto wrote:
> Since the previous commit does not change the phy node name,
> the dtschema can not recognize the type of the ethernet phy,
> so the following error is produced:
> 
> /arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> /arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', '
> reset-deassert-us', 'reset-gpios' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> 
> Change the nodename to make the dtschema can recognize the right
> PHY type.
> 
> Fixes: 9db839d52ccd ("riscv: dts: spacemit: Fix phy id check for the phy on com260 board")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Also, with my R-B
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
