Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A74582F7
	for <spacemit@lists.linux.dev>; Wed,  9 Sep 2026 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940900; cv=none; b=J8XD/pGmsz1qWPmaXBpPX42FZwm2d0a0ycnQX+mb8UCpj3USzh+LUfdL8bhHd8hRBt13jiqF90i/aFnzNpSF4vjrWozwoeYjAf19eslZ0uq3kS9oukM/6tia+hO0RWYWTTZc+Gv3fe6mgG7EUv8LAwFsRREXfVzXcecQzR7lOjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940900; c=relaxed/simple;
	bh=BwkTq+kWcanD6pJH1odrel9/Fm5+LJ3h9fF3o0OWkg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnXf6mPwn+RTO3+BndllPe4I5imMQw4J9zZ8pWCj8tUDDmFDyDho7YVUzBG+4oM/Esl42sdpMLSRAsbZFt3WW8tOOnx2cV8XJXI7oRq19/7quQCjuiJWx5Im3gZaNNGUo839QWhdQzv23EWB2PSJ6/w1JytzLH1B7fRokOKdoMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7KPGFGS; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7KPGFGS"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3964e480f76so6451687a91.1
        for <spacemit@lists.linux.dev>; Wed, 09 Sep 2026 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940898; x=1789545698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f8CIem4P/Or0F4qZW5iNmZjHo/TZnFkGYTym/tguf0U=;
        b=m7KPGFGS3ZBk80MfAdgCNazWS4YHV6LSYV/C0gdWDdahZeN6na1WEu7JMw2U8CeDMC
         xGZA8OSzNjlhBb18UQSEgX5Fcy3a3o6Mu0cpP0zBkTAY7lbh/+FHDqioZJsTFy9RYdPS
         7JgYXAbkAivbReapgmAD7xX9ZHuk+mdoeKxeOicovUmg/uRxWMAJY+uA0SAY/Z3Hdj/8
         WhVNgqVEba3mMaxYQ6Z9P5ovHKxYN6e1f01KwotcDDAp6EhPtBdxF54sTR5caUA7/rmJ
         tjY65nB+vkajaR+vs9spfmGg+8AUjx5UgQsS7Ewyr/gb0IFBK+bUvBQbhiEqEq/XDnAi
         bPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940898; x=1789545698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8CIem4P/Or0F4qZW5iNmZjHo/TZnFkGYTym/tguf0U=;
        b=ObY+anii6YIxhL0OChP98fPf8fxHaUGeyfhEtk1iFk0/PN6JhleAzphpRQmxd87FNo
         bfqlkt33f43nAXJQXVJ7INdiujLg5GZ0P7LzMEMLnXCVMAnd79vt/dq8zI0TU6CdiX/M
         KzuFmdN/zV4q6E+P0Q6s28wqiuaYwlzfQxZg/vQZOxRoSoFOLn4/EPgi9agB1Sk6j65o
         XcWOxMzmGcNfOaKg0wSUSldn3O475+9zE/TmYhKEaCNnCL0dKo+yi2U/Kec/xvjTwSct
         XiEyh8T/OG1p5yoZztR0lFFckYZNTJE4iWlzAz0+NFPrYWn/4rwMiHlBGpNOH3g/hLry
         vDSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFRdqocP0W9Z5gkeF10gSobIC2/gmHlVP5ow520JSL5jzje2NI+Zjmt/UEgDBL11fzUV2TYuYyuA==@lists.linux.dev
X-Gm-Message-State: AFuF++nuklHmi//bTG7P51jc9ucXN3cwvEyylaFixN0dLfLDHjNJiiB1
	CdaekMs5Jv324ThLqAasimZ/Ya/j8z0eTnECqJsYjeh7fjMIGpYEUrnT
X-Gm-Gg: AYBFou2I9CXmzybmjbI8+idtaWeeZ9oUPNecgpxhx+vQR0qEa6+a5z8tCEMekVf1H7T
	mbHPj45zVJNjr3MuO5vZveHLp2GwgziAbDY4AqzVc7cpLYUeSjf2h/H+OM1pWtXQ8d9t/aSjSWv
	lsMttywMLFuQlaNiLPXux009pqg1V9ZzidodqLR0K+pitPh+TxIBfksTjAfY+b+yZKUvbai9HPz
	qbxMinPuMuPg1AxUxtttv7ZtUUHxdb46ZmJm2TfW/wS+uB1M3MN+dqDkaTciWWccVxACTSJLD3s
	pgecRQ16wbuoahS5qybTAQPYUU1+iv2M5q5tmPnjX8H7Kd9EtlmN1XgBxxzcoQUwcR9ZbDaL71y
	cEY2H4v5dN9pJfT8qqMXKc5sJmPHg1+b8nAB5BmDXayWYkvpEi4OJIFQXhqyEsON9OhLDc9OZ4d
	WXG1V+J58LPz9OINeVcnv7pXj85ButDUGHpD0FICkVrpRFrsh7yPpt5KV4CmuIgzu2iJTFhg==
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr47242447a91.8.1788940897733;
        Wed, 09 Sep 2026 01:01:37 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm38584020a91.16.2026.09.09.01.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:01:37 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:01:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <aqESLh8EO77U2nWQ@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-6-inochiama@gmail.com>
 <DL93W9G65JL4.SW643T11BP8O@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL93W9G65JL4.SW643T11BP8O@linux.spacemit.com>

On Mon, Sep 07, 2026 at 09:08:28PM +0800, Troy Mitchell wrote:
> On Mon, Sep 7, 2026 at 07:26:04PM +0800, Inochi Amaoto wrote:
> > @@ -14,26 +14,29 @@ description: >
> >    PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
> >    controller, and supports 256 MSIs.
> >  
> > -allOf:
> > -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > -
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-pcie
> > +    enum:
> > +      - spacemit,k1-pcie
> > +      - spacemit,k3-pcie
> >  
> 
> Please update the title and description to cover K3 as well. They still describe
> only K1.
> 
>                                             - Troy

Right, I forgot this. Thanks for the reminder.

Regards,
Inochi
