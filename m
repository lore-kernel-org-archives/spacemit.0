Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9002D7DCE
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783835059; cv=none; b=hwVb+8gd7Jc9gXo/FZnv5aHDpFdEbVELQTu+W5GTGeR7d8/1KNJpEAb8jnPX+7ocWMUN95XMZHFkGovnhJImtaAAp9nfUq1gHdf0ttBCGAY5zPJxqDFG1YSoznhw4q9+XOnIa11P8hBNRIJiOb6quO6dA4SzbJbWTeUodh3lzuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783835059; c=relaxed/simple;
	bh=IaU5AQLMyj4VZ3NhJA/7Pd/ODMHBYTuf7q8H473n99g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExgSWScWFGScUxh0td6kuytf+MZYGx/yAYy2udhyfEfCNnnYcirbtO0vWekQyKsZvy0QXyScOAcdwta8Jxw+YPzrO+Z9hMqzXVLphzpjPiHqZOmh1pPAHEZK8HwKyqaKK5xNRaEVoJI6rPK6y/nLH1h++CKNB6e4EQsJuIi2WkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCUHKjCh; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCUHKjCh"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38175907a56so2512815a91.0
        for <spacemit@lists.linux.dev>; Sat, 11 Jul 2026 22:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783835057; x=1784439857; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHBOsAK2LL1+dFyhqlDju8abtbkr9TbGvS+9b0ZjGQ4=;
        b=nCUHKjCh+VF0BWzL073X2UEjjihCO2FvUq7cV98oH3eq+2HbnY14J70/wCfUq3XQHA
         ECSPmfJhAz2hr26zirwr/nA2tcSNl67t9AqKw8BE0f/tH/NlWKy5xSvipazdyCgaS4un
         +/4uIxgbcV2P0PpdFfPdikDewu9XXSXKUMHajdFs9yOBFWSgQqGdGj/aG95SAS5fFI90
         Y5N9pVyAyEgc4wIwD/3Of5icz2cgPX3aMOX/ptP06B+YlOvS1PGJHeSUMluiRE7IJC/z
         CqphJYvF7msWr5IP9kC+M+ar6eJfNPfg0qx5BeQIlBhz+lWfZHxNi4WCg7Q5PEm9D4N6
         GiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835057; x=1784439857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHBOsAK2LL1+dFyhqlDju8abtbkr9TbGvS+9b0ZjGQ4=;
        b=I6P0WIr/yEXy/GlhdmHf18rwlYbIHOsOe/DZ6RdEJqf2u5XHBPiL6Y1uf7gwi/4K9r
         tdv6JlqHAa2JVA1BpFsa7gbBJvsoQau1NWRFAml/qpeqVe077LqiXTmMAd4vy6JSRv+E
         498kW4vtXFFTlEx/0nvMChQeOVZkYlVYUPKWBA7xcXJBixk8uCvqRnFwwfRbeePrEx1d
         I7rvepAVWaWCxA+v3lcQiJLnaWhcT09ZbEDICPuV3VJmdFFg4ZQ+AMIVEGoB613S/xOM
         PxLtohew4k3VpuvfgFyCgxr5UeJqP9GcL2ngwBpHHcKGi4n9d4h/Xb9WQhOUcNghiZoz
         6fuw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/qsfpqEvdw432TWiWJ1j/L2dZkq2O1fm7of8vWUkCNXvC3yTUY3r7CNPMkH7b7XY0FKoMf0ip7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPd/8hv4x0Q8y8QRliYaUN4cWque7V/zpQHTZttKCzgtmcxDsX
	cY7EATlhBuqmkqmCC80f6G4czi3sMDp8S2FHn1UNdPDpE5FontQpK7TN
X-Gm-Gg: AfdE7ckDN9lx6k318HXqpkf9KvBXfUjX1luT6QQR9HVsyyIJsuldDcwxFMn/B/XZTNL
	GTOHdwf4CDWCAQg2UQ79z+VWqwyynYHmVfAJWV2j9c5bL9LZAEL8Egr7jwOMLXFZaTf+i9aFYVs
	dQEeSsaQpbEz02ddZlxTGS7B3Fz36ATxvGYngf+n6JJ8Zme+VYdgJBnqhdxi85s3f2qNtYre9l8
	Y9Zf5mPaIQbYE4fGzJTWbG/0FTucslZ8e99ftYU0WZXIbCghZ+NscWKPMtNPR1BG8Xt2UOF7i7w
	yQu1vstu3AUKJrkJa2PZHtSRs2BPzzHVkFT0Mv1aK9gSbD4i10qEweLghOym+Xb4o9N3NLQnrmc
	MCEL4RNguPDHhE6oOEblpAC7Pa2BdBmHSD02vkaLzf0sJkvVHszuvNvUhuT9DdFob
X-Received: by 2002:a17:90b:5903:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38dc834de8fmr3876818a91.15.1783835057412;
        Sat, 11 Jul 2026 22:44:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11280409sm1900696a91.0.2026.07.11.22.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:44:17 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:43:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <alMpUW6902TC5T4a@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-6-inochiama@gmail.com>
 <58948c74-0990-449e-8eee-88cbb38db7e7@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58948c74-0990-449e-8eee-88cbb38db7e7@riscstar.com>

On Fri, Jul 10, 2026 at 11:01:38AM -0500, Alex Elder wrote:
> On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> > Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> > This controller is almost a standard Synopsys DesignWare PCIe IP,
> > with some extra link and reset state control.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> This looks OK to me.  What I see is that K3 does not require
> the interrupts and interrupt-names properties, allows up to
> six PHYs (not just one), and adds a dbi2 register that is not
> used by K1.
> 
> I might have missed it, but I don't see where the dbi2 register
> is used by the K3 code you have added.  In pcie-designware.c,
> I see that if no "dbi2" resource is found, memory at offset
> 4096 from the "dbi" base is used.  Does that apply for K3?
> If so, maybe there's no need to define dbi2.
> 
> 					-Alex
> 

Weird, I have found the following logic in dw_pcie_get_resources()
of pcie-designware.c

```
	/* DBI2 is mainly useful for the endpoint controller */
	if (!pci->dbi_base2) {
		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi2");
		if (res) {
			pci->dbi_base2 = devm_pci_remap_cfg_resource(pci->dev, res);
			if (IS_ERR(pci->dbi_base2))
				return PTR_ERR(pci->dbi_base2);
		} else {
			pci->dbi_base2 = pci->dbi_base + SZ_4K;
		}
	}
```

Regards,
Inochi

> > ---
> >   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 50 ++++++++++++++++---
> >   1 file changed, 43 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> > index c4c00b5fcdc0..54817d6fd9af 100644
> > --- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> > +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> > @@ -14,26 +14,29 @@ description: >
> >     PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
> >     controller, and supports 256 MSIs.
> > -allOf:
> > -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > -
> >   properties:
> >     compatible:
> > -    const: spacemit,k1-pcie
> > +    enum:
> > +      - spacemit,k1-pcie
> > +      - spacemit,k3-pcie
> >     reg:
> > +    minItems: 4
> >       items:
> >         - description: DesignWare PCIe registers
> >         - description: ATU address space
> >         - description: PCIe configuration space
> >         - description: Link control registers
> > +      - description: Data Bus Interface (DBI) shadow registers.
> >     reg-names:
> > +    minItems: 4
> >       items:
> >         - const: dbi
> >         - const: atu
> >         - const: config
> >         - const: link
> > +      - const: dbi2
> >     clocks:
> >       items:
> > @@ -66,6 +69,8 @@ properties:
> >     interrupt-names:
> >       const: msi
> > +  msi-parent: true
> > +
> >     spacemit,apmu:
> >       $ref: /schemas/types.yaml#/definitions/phandle-array
> >       description:
> > @@ -84,7 +89,8 @@ patternProperties:
> >       properties:
> >         phys:
> > -        maxItems: 1
> > +        minItems: 1
> > +        maxItems: 6
> >         vpcie3v3-supply:
> >           description:
> > @@ -96,13 +102,43 @@ patternProperties:
> >       unevaluatedProperties: false
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: spacemit,k1-pcie
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 4
> > +
> > +        reg-names:
> > +          maxItems: 4
> > +
> > +      patternProperties:
> > +        '^pcie@':
> > +          properties:
> > +            phys:
> > +              maxItems: 1
> > +
> > +      required:
> > +        - interrupts
> > +        - interrupt-names
> > +    else:
> > +      properties:
> > +        reg:
> > +          minItems: 5
> > +
> > +        reg-names:
> > +          minItems: 5
> > +
> >   required:
> >     - clocks
> >     - clock-names
> >     - resets
> >     - reset-names
> > -  - interrupts
> > -  - interrupt-names
> >     - spacemit,apmu
> >   unevaluatedProperties: false
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
