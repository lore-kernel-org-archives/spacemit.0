Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616D3815F8
	for <spacemit@lists.linux.dev>; Sat,  9 May 2026 07:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778311115; cv=none; b=DF5FOygKUozfZZeoQXvHZy1bdZrNUm4qWe5JCMeyAJohrv7Wl0lZz0K87DaMs/jBwy/TOIjheSnhkDFclN/kHl91X1YVnRLDDDbc5D4YFlNseSA2Be804+dEwNhfCMxhABMX1L2Itq7IO1eaFC6i9twhyGaKi0htBIaMTMf8m74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778311115; c=relaxed/simple;
	bh=xP9IGBwVhUQ7mQgqFJuihWWQKtVqwhyqli0I6YiuDMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOU3EO/wiP+iWG3HTOZHVoPWv0hKJ91CAJSbFzkkHabnRlGICRGUJ0UTT23h36htewX1bCVaoFoRpizOgJi+jgQbE4LMoRYEwyM5mZDFUjZ2a4ghuBRthZKxn5WywbhBRx8ikVdWxpWy6tWpfQdhxW13rWkBHoAbUI3reRLLx6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfhyehnP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfhyehnP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82faf871346so1922922b3a.0
        for <spacemit@lists.linux.dev>; Sat, 09 May 2026 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778311113; x=1778915913; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skObjcn2ITTEAn6Yzrs7wNLXCgAg8sVMpOQ0WmRpnAE=;
        b=EfhyehnPAVYsXRPrxGP2AmA1uEG57N7q3PIUF7su76QtsjlO8F5UBAj6lSnBsoRtP1
         X0Ut3m5wc7ygpimnH4CXfbONi3aRuUwylIk+2gpK5KYN54wX/kwq5PG+QAPa12BQ8VCj
         51Fih+n5FJ7lAYmjYuM8ef9t7zxRsOwgoaHwfd3NCSfFZMJmmAiTULZKy5JfFutz0T76
         GLlaixbOszg7bIILHYxibh+teSJsxgPRBOUZ+Bn48BkX6gZ8j5yNciHwvH5fh7bsRkk5
         WDW4Qie3snF1TacDzPZtFsVuFO+RJaJk4rSA1Nvs4Y2iWA0tUmWHYO+SN6pgfqDGJEVx
         0RJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778311113; x=1778915913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skObjcn2ITTEAn6Yzrs7wNLXCgAg8sVMpOQ0WmRpnAE=;
        b=JpbRjpmtwLt0BJzUV/Cs00NDKQmK9AYRIYGKjAt/1X+6aRWqRUtGu3fsPukWoPbSe0
         /4jEJLEEuo4XgobLGwr8yal3NViTGZc9tAaCtOxPIl9AFaVHDC3G3tGSoWJDsxVekgVh
         w/HQgaYNQdZGiKoO6ubMiDhxXeCZnY8tqtlDec6ilgfjRPeoAJh2JRTUVy6+nLMfR0uA
         F+6nef7sl2rz16iz+Fj9B9DYR0wIOuSuuMOWmrltoH0enrpUxT04kH/4GHL0x7BFqqQ9
         i7a97igMXgT4yvhLT9xkHMNjsCA+MhmrFjM/PrNFjpQo0jv6TKmRDZz2x8S0xPIuzUei
         kPvg==
X-Forwarded-Encrypted: i=1; AFNElJ9TTnz1TGigllx8Ow2Hmat1bXHaxF7e6O0xQznwcYWzF7fzFd7/+6K7BqQKRuKlxknEyrEYcWl2wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO6h7ZsVyZovKPEnXfNDlnYEOsD6mn6dxiCl2n4eMLJK6+MPbm
	nkUxd3NGpccx15UkfWqBHVtP5HzyGwG8RaihMAsCbrjhAdwVTfhIgMC6
X-Gm-Gg: Acq92OGML4TKnk0AsivKZCVWUfegXB5OlIiOjwB5430zXGEIHI2QbMy7qAyhT2YKOqI
	ToM9ro5h7MRCuqwNbof6SYyJO6KJbft8r2ikgvtotBoVijpKMquSNYjFdT/Wue/CcEXUg9isdka
	GTXdZH1xb+MHG8Mx0uwG+3+t/zO2m4ZIyGlilhiL8TegGiGlKcUlRhVTHQdQRtUpWxWDKLNwd40
	iGz9uvfWv5opRLoPwMExJ8JaJCiRKTWfAi3tLv+Gc1wzfLxfNYA2oKoeHlkX9TI3VtxHV2g+pYv
	YCAgdnhyv4tYJ05iAshAdcoVt054QKQEU23yyuQk1Y8u3TYwhfwog2HOHTrfIsQO0f8WQ2raQxv
	SOQ55oK88eloFf6Hww8daroPbJOhmmFpP+P8lrwg7wwVIun9CmKSAWyPsBhjOktBguVrgxz8b0h
	oyaNJJmaTiLC6d2SHxS/cZtCJw6t3mNe+bTw==
X-Received: by 2002:a05:6a00:2442:b0:835:443e:4be2 with SMTP id d2e1a72fcca58-83a5badbebcmr16047333b3a.2.1778311112968;
        Sat, 09 May 2026 00:18:32 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf36sm17667656b3a.41.2026.05.09.00.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 00:18:32 -0700 (PDT)
Date: Sat, 9 May 2026 15:18:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: pci: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <af7exVxVnDYagA7D@inochi.infowork>
References: <20260502101319.2364052-1-inochiama@gmail.com>
 <20260502101319.2364052-5-inochiama@gmail.com>
 <20260507191302.GA2284447-robh@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507191302.GA2284447-robh@kernel.org>

On Thu, May 07, 2026 at 02:13:02PM -0500, Rob Herring wrote:
> On Sat, May 02, 2026 at 06:13:17PM +0800, Inochi Amaoto wrote:
> > Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> > This controller is almost a standard Synopsys Designware PCIe IP,
> > with some extra link and reset state control.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/pci/spacemit,k3-pcie-host.yaml   | 142 ++++++++++++++++++
> >  1 file changed, 142 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > new file mode 100644
> > index 000000000000..be2641526b19
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > @@ -0,0 +1,142 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K3 PCI Express Host Controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +description:
> > +  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
> > +  DesignWare PCIe IP.  The controller uses the external MSI interrupt
> > +  controller.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-pcie
> > +
> > +  reg:
> > +    items:
> > +      - description: DesignWare PCIe registers
> > +      - description: Data Bus Interface (DBI) shadow registers
> > +      - description: ATU address space
> > +      - description: PCIe configuration space
> > +      - description: Link control registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: dbi2
> > +      - const: atu
> > +      - const: config
> > +      - const: link
> > +
> > +  clocks:
> > +    items:
> > +      - description: DWC PCIe Data Bus Interface (DBI) clock
> > +      - description: DWC PCIe application AXI-bus master interface clock
> > +      - description: DWC PCIe application AXI-bus slave interface clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: dbi
> > +      - const: mstr
> > +      - const: slv
> > +
> > +  resets:
> > +    items:
> > +      - description: DWC PCIe Data Bus Interface (DBI) reset
> > +      - description: DWC PCIe application AXI-bus master interface reset
> > +      - description: DWC PCIe application AXI-bus slave interface reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: dbi
> > +      - const: mstr
> > +      - const: slv
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Interrupt used for port state
> > +
> > +  interrupt-names:
> > +    const: app
> > +
> > +  msi-parent: true
> > +
> > +  phys:
> > +    minItems: 1
> > +    maxItems: 6
> 
> You have to define what each entry is. I assume this is 1 per lane 
> though I thought only a power of 2 number of lanes was valid.
> 

In fact it is not 1 per lane, the PCIe accept lanes from the Comb PHY,
and the phy can provide 1 lane or 2 lanes according to the PHY MUX. 
In detail,
- PHY 0,1 is 2 lanes
- PHY 2,3,4,5 is 1 lane.

So the max number of the phys is 6 with 8 lanes.

Maybe need a description link to the phy mux configuration?

Regards,
Inochi


