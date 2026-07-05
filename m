Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083D6374178
	for <spacemit@lists.linux.dev>; Sun,  5 Jul 2026 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783250580; cv=none; b=cEEfHAS3mr8XWGXLIBtWjL+UJ3qUEy/4Z8p7fMqsn4BUOxjRbIMDL9PotGzn0UO8G7W/TSORa+gRGFdwB9lVSOW0qD6MdU37fFIExqkUmpjv1PgA3bXA+DC1kJLqZKGPbaMwM6j5KpfRxbiz1vZR7gTCkijsEIQFbCOMyMEbRjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783250580; c=relaxed/simple;
	bh=9ihfPJWrXsFx42x/DvnAeOl++cQYozhIWwTp37iIRX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH/yTO/+VJK6kF/BEQQzMXmBvGBd6jcAIF13t1jYvlj2Ih77kF1win0w/sC5LgcDwnKiBKvU3vwWyB+S6UpmDo0AvXxMgIVLnFczgBevTyV5pAorqUNuuve7igl+9PC3h34MrZ+lh9P37zwj/X8JcpLWGWD1cwoXmKRa4QOVmbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgVFALFm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgVFALFm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c821a50615so16295845ad.0
        for <spacemit@lists.linux.dev>; Sun, 05 Jul 2026 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783250578; x=1783855378; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EP+ltuqOMcIt+xpZ8qdpKdZOFHQrgBBgO+zhJMTh/i8=;
        b=jgVFALFmvx0HWJCV9WG1uySOD3zhzVrb7II2RhFlBzK6RDExWTcRNkKRsfbqfs7jq7
         lfORMcRCaP5hU9NnFRJkH6WdpD/89UbJDJ0F1oZ0bxN1kbg+W3EfX/K1IDrKifMQ1ENO
         QnP5mrSUV1xzyw6jifotCNnMfFWTpYMDYULdEhlwiBVwQU5eI9wKdRx0LGJkHMUeBRna
         ljqHWfi2o+fZ1Nndskm6e+T8eLc31bpYAbBNM/Fe3rjAXSmV0A0K1R6fR7oQ3dPfuLjZ
         QwkIgTBMEbCEf7ybArY/UJxJxJ67mO8BQj47yvipuEo8ImlFCF4GsqyjyQnS5Kgt/3AY
         XcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783250578; x=1783855378;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EP+ltuqOMcIt+xpZ8qdpKdZOFHQrgBBgO+zhJMTh/i8=;
        b=VKeFGzQgnQ0cNINcICSYTG6qK+7Y4mkqCcOBSp6GbL8Dm7kLD/44e/AUYodz5qXh4L
         c1aAe1qMrYZgt/JkwiNjtrelkMhQ+ZaLCzexSmi3n6trp6W8opWtBRH8bFNsEk67N+qa
         4N8Bx2VMyIIzxqz+xch1LhqTg5GVcHSs/mptDWIgmYkO5FNNeQdAJrpp9+YR3NXgtOWB
         jAvvRUjw4ieZLORtLbcivXc9k2l1IxqK7sR0kMGPIHXe18jh/yUYdMPlGv/DQCnB0POJ
         4TLShan7gjdJvV8Sx8UBU2nkHRwzWvlG6/LOHpO6hunFbIXtqX4lDxcbqfxYqqXqyPpW
         UOnw==
X-Forwarded-Encrypted: i=1; AHgh+RoKe49VpAluSGdJkpMgS4IAAuSSrPBSPfXQOPf56FQaoGe/xXKqRRycFaJ4dv+xPh2EBK8vn2LNSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEhB+kmNRo4hHEoh5H7eWvyHGKo5nQuqhK8EY3iA7jFcSIymif
	PM7X54q7cZoLx8LLyTlXsxSHGjjSxDCMjh5ebDQrNc6V+gV1MIukAoPD
X-Gm-Gg: AfdE7cmgZI0iINV7afRQFaBaJ6PElyHOnJC0xEqidOSWcGSpHyoHVGcCP+jOIhTOlTL
	eJa2E0wB08OuFh+5FL/P1MixbSN6yPtA3qSHvTlmU+/khGn93kNyrAtPtkrsNF+WfmDepJrgY+o
	cKmBoosbBd5Hx0CEC0XzngsTJNNhd5HCQrFfdeMk/FHsGPvQyFbS+/rTN3tre9Wv7eia9XJj4w3
	gdLqpfDeTDSEdyBwssiEF79dsELxTRznBKclofU7PWlhN1RCDRSLmVzFuUaB//8JkbFo40vdv+2
	pkWmTADlX25vjpLWHHAdSn3CAisfEeX5R5D+py6EE2zXyRjSYTq49HdXc337nWr/JHAXzo06UiB
	cfTbgAnGsjXSB2DSH9Rmhmu/e8y8yCKKoMkZ4A2NHP+gSkCWG7tXENox3Y1DeOB8l
X-Received: by 2002:a17:902:ec87:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cbb9eb4b6emr63113945ad.25.1783250578209;
        Sun, 05 Jul 2026 04:22:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7893f0fsm32340485ad.75.2026.07.05.04.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 04:22:57 -0700 (PDT)
Date: Sun, 5 Jul 2026 19:22:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Randolph Lin <randolph@andestech.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <ako-AA8uHfocQHnP@inochi.infowork>
References: <20260703020003.485436-1-inochiama@gmail.com>
 <20260703020003.485436-6-inochiama@gmail.com>
 <20260705-versed-leech-of-glory-db5cfc@quoll>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-versed-leech-of-glory-db5cfc@quoll>

On Sun, Jul 05, 2026 at 11:37:15AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:00:01AM +0800, Inochi Amaoto wrote:
> >  required:
> >    - clocks
> >    - clock-names
> >    - resets
> >    - reset-names
> > -  - interrupts
> > -  - interrupt-names
> 
> Why?
> 

The K3 uses external MSI controller so it has no interrupt/interrupt-name.
But I do make a mistake here as I forgot to restore the required for the K1
in the allOf check. This will be fixed in the next version.

Regards,
Inochi

> >    - spacemit,apmu
> >  
> 
> Best regards,
> Krzysztof
> 
