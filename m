Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6043B4B8
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699305; cv=none; b=t92SLMAgv4DkBSUmmcLWWa8dP6lganCUsneNuiq6qSn2RgHXU7xz+ebW1Gy4cGB+i8ephWU4asIIQENdHm9g3DC0VJ+K9AdgXyfor6VMWnSL6SE5deagTPS43CX68WoUbBYIDjpRXFBZWDkcf+BpQxPit/eC32x6Q36zn59VIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699305; c=relaxed/simple;
	bh=FpvBMFOBjGbtex0F2E85sDkJ0mHA1kFz8fwtEFKL9Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMiKe7vVj5BcbBcXUZQzc8C91AW/DvCQk+YrsahaW8GdGcqSrPn4VPo6hZJDqCdJYo5L2K0SaV2VmRPPyQc+J6H9dctvs99SmlTzUdAgrNkb7urWO2XbrfYo5stXGzgH+rdJqEndXbIoUARccmgNRseV4kG7ugPs9KFMcjo3wSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=R0/Al1Wb; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="R0/Al1Wb"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c21495722so5123241cf.3
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699302; x=1784304102; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xplki/WjnUaATCo6uGj8PBglmca7aRIHrcSArfmWE/8=;
        b=R0/Al1Wb7x0mDmT48W0eN5A6fJX2x4CP7rIvbY79AfELjkT5n6ACJg0/RSNHx1BFHt
         TDeYFLDVSmpXqRWuWP7tBDd03MQN+fM6sTtYj54TDulXZxS+iMn++OhhZd6EM+8/jBrT
         pNKPjIBZ9a8Bn8nDBel+p4nCRj/Yjmf30RvMljlFwaJRH+4ewrQjQXmP6Z6YiZu/g3ME
         u7+UjLeznGiwe++E2Qf0xmQj9kosadRoGMB9bNoxfFUd/aUT0kw5C7h89Gs6PJAQAVYs
         Np76snG1+mRKGSU1rb40hp1SzidNxRXeyscVQlYYa5AFanNW29+4LyecfXBK1TNHyJah
         E6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699302; x=1784304102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xplki/WjnUaATCo6uGj8PBglmca7aRIHrcSArfmWE/8=;
        b=nPD1D+d02vX+p8dp1o5cAK5KrR3Pnunoio2In1LFfd45Ff1LxjGxViVjaNiLXi8q/3
         XGXH9OfZCiMkXDYXgZSCdjJO7gyX+vqNcA9yMeDv/KeRGtzA4aR3LHMB/vluvokwmrMH
         kJaQ73cXilsFi5m03WAW0D8corBHjMn5uX/id3CKnwBx1/Hpj+LFewlVOhx/uJa7basf
         U3hzxg9NcRF5tXosAhBcNdh6Ozc6m0KUMN/xGVF7M/VNzDj9BPHNDxwHtDlNh2X6zfeX
         Kem2A8bh/dyZE7EZ76tffhdFzkAqpH6cyzEWK5Pwyts9mzKPCy4grpShdwgn0jHD8qdf
         FnWg==
X-Forwarded-Encrypted: i=1; AHgh+RredqogScOtj2gDAbd52ngrA8ZrMUOf2bBzZKuBXaNFsNF2ZmlkX9hg6npwwCMsdDWpQemL1DE1Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YziYC2gd8oYmMyKctIQFUxSbSw5NG4IsmB0/pv5KLthBO9vHtpP
	/xd3YsCQIlALkJcZhae72iAX19vfdltcL7PIIcdjj6GECPYGXsih5X5rGKvD3vJvDgc=
X-Gm-Gg: AfdE7cmYjw6XteoUv9/MqnH1qj29KJ6lcCSBIn/v2iyngXtb0qErrBrQ6Ae1iloL2Sj
	8S2E54d2xxWzOzwSRW5Ae4ZUB2BSQSuy21jjLBBPYnGmgtmZ3rp9ZWjWJ43hwJmT8CRMica6xTh
	rvyoMfLV+13s2ZCoSgbfG0iK8JsoZWeOLszPunzPhvoT+KZhkk2XKVrQc9HHjwdxZXy+0DlBNmj
	xvKePnD0h/voDBSEUgtdLvJaKYwZg7H+fSAXfxOnMDBrrO316u7BWyAX+VOZhrhx5AAb+vztbbX
	2yvAGBMfN21nE9vfxsexJ4CADmD9omZ249+AUgiNDRnaf4oN06q0fl6Q9XD4KNSdkV6CcBaoJPQ
	n7elz8zePCFQvQEMRbFzMM0V8Slo4e1yS5JATTxDr7aJUwHf9txEboAl2EKVHBejV+kDzTYMhqE
	524xaYXCzcHFln
X-Received: by 2002:a05:622a:2c6:b0:516:df62:bdd2 with SMTP id d75a77b69052e-51c8b3c65f5mr122904381cf.55.1783699301497;
        Fri, 10 Jul 2026 09:01:41 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf5f61csm18644921cf.22.2026.07.10.09.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:40 -0700 (PDT)
Message-ID: <58948c74-0990-449e-8eee-88cbb38db7e7@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:38 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-6-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-6-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> This controller is almost a standard Synopsys DesignWare PCIe IP,
> with some extra link and reset state control.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

This looks OK to me.  What I see is that K3 does not require
the interrupts and interrupt-names properties, allows up to
six PHYs (not just one), and adds a dbi2 register that is not
used by K1.

I might have missed it, but I don't see where the dbi2 register
is used by the K3 code you have added.  In pcie-designware.c,
I see that if no "dbi2" resource is found, memory at offset
4096 from the "dbi" base is used.  Does that apply for K3?
If so, maybe there's no need to define dbi2.

					-Alex

> ---
>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 50 ++++++++++++++++---
>   1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> index c4c00b5fcdc0..54817d6fd9af 100644
> --- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> @@ -14,26 +14,29 @@ description: >
>     PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
>     controller, and supports 256 MSIs.
>   
> -allOf:
> -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> -
>   properties:
>     compatible:
> -    const: spacemit,k1-pcie
> +    enum:
> +      - spacemit,k1-pcie
> +      - spacemit,k3-pcie
>   
>     reg:
> +    minItems: 4
>       items:
>         - description: DesignWare PCIe registers
>         - description: ATU address space
>         - description: PCIe configuration space
>         - description: Link control registers
> +      - description: Data Bus Interface (DBI) shadow registers.
>   
>     reg-names:
> +    minItems: 4
>       items:
>         - const: dbi
>         - const: atu
>         - const: config
>         - const: link
> +      - const: dbi2
>   
>     clocks:
>       items:
> @@ -66,6 +69,8 @@ properties:
>     interrupt-names:
>       const: msi
>   
> +  msi-parent: true
> +
>     spacemit,apmu:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       description:
> @@ -84,7 +89,8 @@ patternProperties:
>   
>       properties:
>         phys:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 6
>   
>         vpcie3v3-supply:
>           description:
> @@ -96,13 +102,43 @@ patternProperties:
>   
>       unevaluatedProperties: false
>   
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: spacemit,k1-pcie
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 4
> +
> +        reg-names:
> +          maxItems: 4
> +
> +      patternProperties:
> +        '^pcie@':
> +          properties:
> +            phys:
> +              maxItems: 1
> +
> +      required:
> +        - interrupts
> +        - interrupt-names
> +    else:
> +      properties:
> +        reg:
> +          minItems: 5
> +
> +        reg-names:
> +          minItems: 5
> +
>   required:
>     - clocks
>     - clock-names
>     - resets
>     - reset-names
> -  - interrupts
> -  - interrupt-names
>     - spacemit,apmu
>   
>   unevaluatedProperties: false

