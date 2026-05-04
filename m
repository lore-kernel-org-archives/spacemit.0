Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80E397E89
	for <spacemit@lists.linux.dev>; Mon,  4 May 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890077; cv=none; b=RNy+aWv1uLQ9Cq7qumEFW0LoIM1oo1+T1IbIZ4tQl9RDobHUntMXiuoGjV8NUmj2XCvoaIXABkewyMWawd1Dk/DNlu+kdBpoBn+ixOlA6BrsUrN28sUtjYt/zSzGzl1SPhYgXa5w0DXN21YNR7rtX9L+Vytg0aYUbd7JASE8n84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890077; c=relaxed/simple;
	bh=Qpc9cSZIQ6XgIpUBdj/WRMIntrqVQ+95EOrd1XUDUos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjYMlgVYLrrBTM9MDQ1ZETBfw8UT7Hej0GWTScmEvc6lAfmjF123CXcvUsRVAsy9wbENFfhrZO4xLiZolzlPShzul7hMLAAsZ3UXRscgq5Gz0r/flnAkuKqBCXRqNcLRLX7nKs/Cr8LhQUFlF8CiJPn8ZWI26UH5W9+uf6PoavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZGqKSOK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZGqKSOK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so1662935b3a.3
        for <spacemit@lists.linux.dev>; Mon, 04 May 2026 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777890075; x=1778494875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AzJI2062NMt5980YtQqfww16vShKlaQt7llmD/pl5fY=;
        b=JZGqKSOK0IPfk+Q46dYm1LxKNGyr6w3zOWF4RBkUl4REVMRiXPL6jvA6MahdII1J0t
         BFx1wrRTyWE+EWMacG/qZwrZGxLu+CKklygnDfS2Tplw4yuEgSjywXN5twZLS4OzNz92
         MGTJ3O2LUkhJw8j1adm0W++aGeC36XuFCGqbTaRoDkxIsx9aI4VwrulGvQalyYwY4GNS
         AhBvDXK++mqwn2cwUiCpX8gnLOpNnF1NFfdeYeoWSYtqTt4IuYCsjM46eEL3rrDZNIMo
         co9+WYRbYAlXqLxN4XSqLoTg7LfS8z17iUEg6QAoElqZKsAYYgC+iCVQLTjvpJUCo6h1
         MDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890075; x=1778494875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzJI2062NMt5980YtQqfww16vShKlaQt7llmD/pl5fY=;
        b=JOSzPDR/8Z8G6RnT09KZVVA9VnBbt9qA6yqx2GyYZEwjF2/n+CRFkmfQXcJpkK+kNw
         jvaUXopPWadl/3C5Df2aU8xVr4CPjAcY2bHdlIYJHHv9T25rpMNXUbUNQYn67bsbFcVL
         do6DFE+xHWHKw0E3M7PgCtCKalbfEYCzDgRT4dUdr/J/zMyijRYohaUKtSQH4q0fk2hM
         ZSXyFn2CZQbEd6Hl+UMvPaTUMQx9GjdhHx2TcWpaiBoVT+tqlvFVp9owMJGZoxgxQZLK
         mxUONwLgJSAZACuWJhXSjshPC6yx7/iWNr+FVNcowpcQBiovqSFaycGdtOnpnUHHfD62
         Ha4w==
X-Forwarded-Encrypted: i=1; AFNElJ8lhpgLNt1KGarj/rlo72yBDYxH4NfiHgbWjlbro9pVUsotr3zt7huaRQr9SjZdmTNQKY76lvIzFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YypIxvNLyBtWrFzjlP+0Ml/OAOQXsJpHIOYvJy6qA1zXT3i6ZxO
	bHsH4vyPdGJmI0R3ohyg7B1vvlpbo32MdtauW0UkgLOGPYw5jh3HrV9h
X-Gm-Gg: AeBDieveMEXPhxMRurWcxV29rXBGsf53Qy7c7FC9ea6WozeeF3mmHT3E/p/vCZzXvhJ
	3VmtKZb80kGDfnMVMXf4KbIQoNYqR9ifFUnQA3ZMLlR09HRgvkzOf+YxH4olxX9omb1cGQdjqWS
	JGgBp8bN87H0BwJLhk62m2vi/Kf9Wq1PNmYe02xwnu9m/tmAC2xBcbVY1ZdCq4ttla7Fq05xpj4
	/GT8wS8ociC03zM9wM9Zp7q+6ZFAN/Ba/uo8im+s57C0DCtXNoaVjt84lkjQj4xs+5n+2Jp+YLJ
	9v6U2WcRpUOGqL7dVv1JXrsqWtftOWV8X5dNL9vc86QFFtXPwlh5kRGF6FtK3JlDw3kbt/NpmsU
	1gyYDPiOXyq0hRBrw0IaHFH5j5FIGvOx1hOXpB6zs8xjWG/COp5jKpypeGRBNngrw3SpVDeOGAL
	1TzzLnOsEjlPzLn9HBEy2KaLxvcHV6626QH0aZ0u/BTm3H
X-Received: by 2002:a05:6a00:340f:b0:835:4291:6975 with SMTP id d2e1a72fcca58-835429173d9mr5262314b3a.39.1777890075240;
        Mon, 04 May 2026 03:21:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm4335636b3a.9.2026.05.04.03.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:21:14 -0700 (PDT)
Date: Mon, 4 May 2026 18:20:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ze Huang <huang.ze@linux.dev>, 
	Alex Elder <elder@riscstar.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy
 support
Message-ID: <afhx6C2EvDbMJc92@inochi.infowork>
References: <20260430022843.1090138-1-inochiama@gmail.com>
 <20260430022843.1090138-2-inochiama@gmail.com>
 <20260504-logical-nice-python-1e1f43@quoll>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-logical-nice-python-1e1f43@quoll>

On Mon, May 04, 2026 at 11:54:11AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 10:28:40AM +0800, Inochi Amaoto wrote:
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-comb-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#phy-cells":
> > +    const: 2
> > +    description:
> > +      The first one is phy id, the second one is phy type.
> 
> You could mention here the defines representing supported phy types.
> 

OK.

> > +
> > +  spacemit,apb-spare:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to APB SPARE system controller interface, used for
> > +      PHY calibration.
> > +
> > +  spacemit,apmu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle of APMU syscon
> > +          - description: configuration of the PHY lanes
> > +    description: |
> > +      Phandle to control PHY mux configuration. The configuration
> > +      is described as follows:
> > +      bit 4: 0 - PCIe A x8 mode, 1 - PCIe lane share mode
> > +      bit 3: 0 - PCIe A x4 mode, 1 - PCIe A x2 and PCIe B x2 mode
> > +      bit 2: 0 - PCIe C lane 0 is PCIe mode , 1 - USB mode
> > +      bit 1: 0 - PCIe C lane 1 is PCIe mode , 1 - USB mode
> > +      bit 0: 0 - PCIe D lane is PCIe mode , 1 - USB mode
> 
> I assume this device k3-comb-phy handles phys for PCIe A, B, C and D?
> 

In fact it handles phys for PCIe A-E. The mux for the phy of PCIe E 
(the id is 5) is controlled by bit 4. If the comb PHY is in shared
mode, the PCIe E always got one lane.

I think it is good to add a public link for this configuration, but
Spacemit has no opened any document for this publicly....

> > +
> > +      The bit[3:0] is only valid when bit 4 is 1.
> > +
> > +required:
> > +  - compatible
> 
> reg required.
> 

It is fine for me

> > +  - "#phy-cells"
> > +  - spacemit,apb-spare
> > +  - spacemit,apmu
> > +
> > +additionalProperties: false
> 
> Best regards,
> Krzysztof
> 

Regards,
Inochi
