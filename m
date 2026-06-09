Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220C37206F
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021480; cv=none; b=JHRxV2raQxVHb3vIKi0jxG7ZgAAyMt0Us+4IWkx+geCKz6xYI35tpGAQmkZVYPU7j9QzBouMqbhDA6b0bJ8zLdQwC3ZatEBCgYFRjjOWoz2NOTU2YYsUAMTFrMJoZU5kW8emX8Uz4Iht9hCeEny+KhiSlvzBrvIw0Lalu5Z8XuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021480; c=relaxed/simple;
	bh=vajmwAHkYJpp+V9wdAFK39zdbCm8lW1fNKUSmD2mbDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q395QdhnNZbFKCeD9SURHZ9SQQEnkvd1zriU2Ralrx5e/L3MBj8Dhgf77saeZ68ILp2CF/KQc/MCKxBMx/WwFoxI6/hgTlzdsrvFQ/MoWnyGnBM7t8LaRRhSMjY8mZJist8PrTODpUa8w/er1HTGJlUd9xhWOsf5oqOyY9/2lqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=k8Ee/B3m; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="k8Ee/B3m"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-486560db81cso4464710b6e.0
        for <spacemit@lists.linux.dev>; Tue, 09 Jun 2026 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781021477; x=1781626277; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pq2jric+p38fa4KyXkbxPznlex9Z4eaGY3w5MG1zr2w=;
        b=k8Ee/B3mw8o071xmmIt7lZU0mZHchJCRDgM5KkKesnYmJkCwGv/IZRsOnam1IfBLvO
         pTU+DXcn6sdUvg2uTVf0RtzYrq9t016ynswcr493JUzEkPU0VIUiQ3kUH+MlEPs3UZ2O
         5Bd2OkipYPvMVGV7R11mf/spnEIlBy4ElA29KUJVO1UNc1E+bUxii3vzFatLDKPSe5qS
         z4L9jvSmg3mR8AtEV0Q45S0s/eE6d0u0tpK667/NpPOOD9iZvRoYy5HvTckUzQyYNOQI
         y8B/ulsFcOonnvZyjRpDqdydMSCGF7VMAXLzCCWDADwYuK0i0elIgPAmQwZziu4SwsQA
         PNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021477; x=1781626277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq2jric+p38fa4KyXkbxPznlex9Z4eaGY3w5MG1zr2w=;
        b=qjSlmR5x9UThbqBM3psyB0cMyzqGnIf1um8iNJi0lt79n0E62cIN7JyCggajUo+15+
         Z1vBZGA4M31ywciRyfEImgQzd1Itfb8YE5iwKHKyNquX8BYw3DF8wdjWn5Kpdv53ursC
         IIRfmH6JMq+yggoDUxAXsLCWh7056RuwRPtZZiKu/j4pQZfsvjA3xXkhlq/Nqhav2wus
         ICmMHBeQeszv2NpXt05ljM0fXEr7rL+dKDA34jsAZn7xXQJOV7OKiSeKD+rvugOjo5M8
         i2oFTGuh1aaiWzzTgpcLWdZHtrYlgyBOhb7zs8hmeTHwONXdBbJ5AVdWM+6VJOeDcXXJ
         CauA==
X-Forwarded-Encrypted: i=1; AFNElJ8tXx7PfLFuJ1TYiTisc9HlE/r7ZrmNHAXW8QJFHMqNuOLIkqcUrp5fZWi1E7b0rlfa9pb5S1Kciw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIt4zpM98gDpcA/tg8R9G8rlVV2Cde9cxqKsUtVY+B5UtW+WnP
	KTzKiXV2JHXuif0lziuIb7QWX6zw2W0Ad4rQVsIWNEaQMi1yK75030L+5kwhC3U66mg=
X-Gm-Gg: Acq92OGr9MDnWQFr56BY5j5/cEqg18RhIVyQLu/ub4qdCreJOQyXfWC80WCmNX+E0TQ
	kjX4DSc+G589gN/WO/3Osr/thBOscLD8rQEausTquo+1Dqo5JXr9aowursUM7zir+yGSegZ042q
	H5C028e5QhRGSUSLtFLuKOfhsRuz7f5aYfbZxp+duS4OFzNRudIn1PGGStAFSRiNUD3VfdzFVQd
	WrQteUOqCM4yelF8fx7OxzwU/6bmslY8/JFZfAykguecN5WIV+BGm4Yvdl3CLB97Gq/1aH/pgne
	WoiuoSMD5YbFsjHHydYMz5cjN5OWNhkHRJSKm9MegH5riRw3EiOzszuGzqhQtNrTdhyYXN9P/S+
	P82DSsI+G37yQ4AyZ6TYTBWjrnORW/hwOs1/jYKS//QyFb/eoNPJajk0gYdouhodE5IhmzgIJlT
	ArxmNXZYhRgXOa/BGzoNk48xffEkblwgci4g==
X-Received: by 2002:a05:6808:180c:b0:479:db65:8dbc with SMTP id 5614622812f47-486f01d5030mr2399484b6e.30.1781021477577;
        Tue, 09 Jun 2026 09:11:17 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b91f944sm16430240b6e.9.2026.06.09.09.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:11:17 -0700 (PDT)
Message-ID: <433e917b-16e3-4744-a614-6372ef22825c@riscstar.com>
Date: Tue, 9 Jun 2026 11:11:14 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Nam Cao <namcao@linutronix.de>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Randolph Lin <randolph@andestech.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-3-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260517014841.254085-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 8:48 PM, Inochi Amaoto wrote:
> The PCIe controller on Spacemit K3 may use multiple PHYs at the
> same time. The feature is not support by the current driver.
> So extend the PHY definition to support multiple PHY handles.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 1b519d49dcc0..7f6f1df31cd8 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -51,7 +51,8 @@
>   
>   struct k1_pcie {
>   	struct dw_pcie pci;
> -	struct phy *phy;
> +	struct phy **phy;

I haven't looked further at this series yet, but do you have
any interest in making this a flexible array of pointers
(counted_by(phy_count))?

> +	int phy_count;
>   	void __iomem *link;
>   	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
>   	u32 pmu_off;
> @@ -171,7 +172,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>   	 */
>   	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
>   
> -	ret = phy_init(k1->phy);
> +	ret = phy_init(k1->phy[0]);

If you're going to have an array you should probably put in place
a loop to initialize all phy_count elements of the array here
(as is done for phy_exit(), below).

>   	if (ret) {
>   		k1_pcie_disable_resources(k1);
>   
> @@ -191,12 +192,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>   	struct k1_pcie *k1 = to_k1_pcie(pci);
> +	int i;
>   
>   	/* Assert fundamental reset (drive PERST# low) */
>   	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>   			PCIE_RC_PERST);
>   
> -	phy_exit(k1->phy);
> +	for (i = 0; i < k1->phy_count; i++)
> +		phy_exit(k1->phy[i]);
>   
>   	k1_pcie_disable_resources(k1);
>   }
> @@ -277,7 +280,12 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
>   	if (IS_ERR(phy))
>   		return PTR_ERR(phy);

Andy said something different about this.

But it seems to me you are intentionally allocating an
*array* of PHY pointers, which happens to have only one entry.
But your objective is that you want to allocate an array of
them so you can support more than just one PHY, right?

> -	k1->phy = phy;
> +	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);

Probably should use the kzalloc variant.

> +	if (!k1->phy)
> +		return -ENOMEM;
> +
> +	k1->phy[0] = phy;

I think what's wrong is the above assignment.

If you are truly allocating an array of PHY *pointers*,
then you need to also allocate the phy structure that
each entry in the array points to.

The above assignment is erroneously assigning the first entry in the
array to point to the array, and not a new entry.

					-Alex


> +	k1->phy_count = 1;
>   
>   	return 0;
>   }

