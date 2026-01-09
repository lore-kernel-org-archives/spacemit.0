Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A72264A9
	for <spacemit@lists.linux.dev>; Fri,  9 Jan 2026 03:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767929781; cv=none; b=Bc7rh1lomCCWBHimbANpEFWrNALVMrrJtlkq6jrzjR3NGrSHDZ93xV4/QDZJ7ixR67LRmBRp/+MztaaRdWFTN6Nzz1ADGNhHUcVfQL5tBlyFc+MRM3AY5a+mADB3DDEB03eAygTNAqtfyUBxuBKSPPs5ZIBGRC9fTLU2ks+QbYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767929781; c=relaxed/simple;
	bh=FmiPVm20EjIBSZCWVBDc7+WVSm3LfaIZiGarWvPDInk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WepYoNYq+2E/Ad1ZAo0nhBK3qzCmFQ1sMSYsoq1CxAgKNO29uDUcqwEow9PAQmmpb4jLOp72/goeUysJ927EzjZKD5gAeyPHs0iIs7dCIGbjDd7N5IN0ueDjejftFR8jIhOMAUAYiHYEgswdTEnhnPmV1LAQ53Iadc7LrN646H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8FA63341F35;
	Fri, 09 Jan 2026 03:36:18 +0000 (UTC)
Date: Fri, 9 Jan 2026 11:36:08 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 05/11] dt-bindings: riscv: spacemit: add K3 and
 Pico-ITX board bindings
Message-ID: <20260109033608-GYA3681@gentoo.org>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
 <20260108-k3-basic-dt-v3-5-ed99eb4c3ad3@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-k3-basic-dt-v3-5-ed99eb4c3ad3@riscstar.com>

Hi Guodong,

On 20:25 Thu 08 Jan     , Guodong Xu wrote:
> Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
> which is a 2.5-inch single-board computer.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: No change.
> v2: Use one-blank-space between name and email address.
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index 9c49482002f768cd0cc59be6db02659a43fa31ce..fe62971c9d1f4a7470eabc0e84e8a747f84baf0d 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -9,6 +9,7 @@ title: SpacemiT SoC-based boards
>  maintainers:
>    - Yangyu Chen <cyy@cyyself.name>
>    - Yixun Lan <dlan@gentoo.org>
> +  - Guodong Xu <guodong@riscstar.com>
>  
sort by alphabet letter of first name?

>  description:
>    SpacemiT SoC-based boards
> @@ -26,6 +27,9 @@ properties:
>                - xunlong,orangepi-r2s
>                - xunlong,orangepi-rv2
>            - const: spacemit,k1
> +      - items:
..
> +          - const: spacemit,k3-pico-itx
if DT mainainer has no objection, I'd suggest to change to enum
	     - enum:
                 - spacemit,k3-pico-itx

although single enum is effectively equivalent to const, but easy for
adding more boards in future (no change to previous code)..

> +          - const: spacemit,k3
>  
>  additionalProperties: true
>  
> 
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
