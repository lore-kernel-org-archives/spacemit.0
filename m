Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C743B3E8
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699287; cv=none; b=QI8OI42UopYnM0Scf2ieM80HnX6N23xPySvpS8sSxtBgLXqwuA6k4e/5azj0J5eXl3Fs7Ua4AYmSAdrqx9CPqJggTv/BSz6uRLW8y5aurIwZZi2th/yhwg5hJVdU6Ajrz/NHB3A43Xdc1ASODU/qYrfj8XolllQMmND5rrhv9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699287; c=relaxed/simple;
	bh=uLPdwznAA16rRBewYyJb6MPaGc4jA+si+tOg5Gq5fas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHy+wGB00icaxvbLOzIyB8c6Vf6RqZJlhxgugEJ0f7lTxMN8yolYXNG3Pjjn2u7uqnsnwxCKecvYyPJYEcjmKwen3s9Ift1iFuysPeLaIHDwfkV1dZZkqpdS9dAAWA3czS784TjKqVz171SyXogVOLyiZz5UwKqBA/PK5dX9z7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=j4SRLG3r; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="j4SRLG3r"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81e8e83ff89so394337b3.0
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699281; x=1784304081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hTfHUanZhIXs0ZjukXO0cd1RP2eKmvIle5TeFGqJ2E=;
        b=j4SRLG3rOY22JaMZ4kU/tWAcUPVNvIKxL6oZWyAwst43w/Kl7wBqGh90UFZE0xIYjB
         lm4yRuIbIJdlZkYA+5DyotJ5stELAa9g2MOTadtInpDKE/UO6HqstJNQzdEx2QnfnrhN
         8ykX1qMIA9N5Q+lMR9CcZYA3G8fx7eyUQQmZhdMbZbFofad5/s5LzVIyjJPAo1v2z3Kx
         WS95VlfcNVLQt4Gkvd5SIRDHnKUYeBqgey3kiKYIxhMJ9m8qAdlQarN32b4o29Ou43J5
         clByM0OsphZ0LaDWoPEGqoZuiTcJfKUmQaCSNDAKmBYplReN5scJy1PezpaBo/kq3lMD
         IUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699281; x=1784304081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hTfHUanZhIXs0ZjukXO0cd1RP2eKmvIle5TeFGqJ2E=;
        b=SsFfzKdCm7lDxJYppUYIYfWl4GcVKFa53HeXuJW73JvMQ9dBcvyNfmc3vGWKfhLpJ7
         HgsHqGZ/mTLAOeziSVBOubThwe2ANw0JMSbbA+6+9uTqW9S4+nfc6cj7FABmffZLtkJf
         i8Hjq+mI/w+41WXEVs9CzQYCKmc0yP7y7/IHYQ5zZ+oHUD2blx+brsukl6BMiQJN4Xs4
         JFZoXIdaCgQf94HittzAUDQjgeAsMKedLGtznIuFFkIrZ+VUwBJ2PX5uzTsLrEiY/qeO
         E0rZIFcoZ1T6Mlb7LXQ0HyBnb0MMObKJgNRLCnfjho5CbsMS/RPHv8xeuEaXyD/Zn3TO
         SWMA==
X-Forwarded-Encrypted: i=1; AHgh+RrahdsQvETHo75eAd49rhYWDxzMMyYQrni2f0G+pCU22idxIOxaZ/N5mzpQP9zCkiOoOrMu92VtLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIpwzZLCYIPPQMkpdP4JXHmrNjYmj84ySJ4D2dKTPCdSPEQ/Xn
	VBtHFmzdsDIaX7PwwU80A9Y/4EbDNm3En1VQQ/KEBsTSpTi5xaMFaLVSz27/IEgu7Qs=
X-Gm-Gg: AfdE7ckjH15hDmzNqOP5sKklqKpaKX6LODLNYztSEbVKAWO7TPW9n5op0mpG+x2hIW+
	8Rmtw4gnJs3TeIWQ/jLq2x0j+Sv3YE1FaV6yYm0ImbCGX4jJx29zuiiwaTVyQVGwPU5LJEpLCZV
	VH3o5EDt7Vg3hc+Sdvmh/NvDZrJzilhlXYNr94vW+ibxyXesWKuPsn8V1fSur3sWnM+CWvUHdef
	4jDaDsUJPdwpsQaUPLphUxrOuFvBdxrCo87ERCVd8oXggDwacv31Dbaj0y1Ppg/w7rcbvkoV5Yi
	tanP7Rp1ZYzzcXHZoFl4RZ8tVFBUixIEHxX9ROSxU5EsWCmc03gMiNI2wu8NCbehUZEBLwqh3ng
	uc4N0ZlaJfiIFr33GR0bzabKZNK9ob9ELxCuWe6IhmLCS07Sz1XpgBiuTW9ZeRY0Z0QCzoTcYS0
	W6kkb6xSr/kv5sw+pHr8B/wnY=
X-Received: by 2002:a05:690c:6384:b0:81e:8112:c5c9 with SMTP id 00721157ae682-81e8112ef15mr20197907b3.3.1783699280936;
        Fri, 10 Jul 2026 09:01:20 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9036e27f765sm8965376d6.11.2026.07.10.09.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:20 -0700 (PDT)
Message-ID: <338687f9-e80e-40e8-b14e-1218e61e4e0c@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:16 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] PCI: spacemit-k1: Add device data support
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
 <20260709040027.958400-2-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-2-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> data to handle the K1 specific logic and make room for the incoming
> logic for K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

I have two suggestions/questions, but I think this looks
good overall (please add the space that Andy suggested).

If you drop the data field in the k1_pcie structure you
can keep this tag:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
>   1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index be20a520255b..f6ae8ff3589a 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -49,8 +49,17 @@
>   #define PCIE_CONTROL_LOGIC			0x0004
>   #define PCIE_SOFT_RESET			BIT(0)
>   
> +struct k1_pcie;
> +
> +struct k1_pcie_device_data {
> +	const struct dw_pcie_host_ops *host_ops;
> +	const struct dw_pcie_ops *ops;
> +	int (*parse_port)(struct k1_pcie *k1);
> +};
> +
>   struct k1_pcie {
>   	struct dw_pcie pci;
> +	const struct k1_pcie_device_data *data;

Is it strictly necessary to keep a copy of the data
pointer in the k1_pcie structure?

It can be convenient to do so if you reuse the fields
in that structure rather than duplicating them, but
often the constant platform data is meant only for
initialization, and never needed after that.

>   	struct phy *phy;
>   	void __iomem *link;
>   	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> @@ -278,14 +287,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
>   
>   static int k1_pcie_probe(struct platform_device *pdev)
>   {
> +	const struct k1_pcie_device_data *data;
>   	struct device *dev = &pdev->dev;
>   	struct k1_pcie *k1;
>   	int ret;
>   
> +	data = device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +
>   	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
>   	if (!k1)
>   		return -ENOMEM;
>   
> +	k1->data = data;
> +
>   	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
>   						       SYSCON_APMU, 1,
>   						       &k1->pmu_off);
> @@ -299,11 +315,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
>   				     "failed to map \"link\" registers\n");
>   
>   	k1->pci.dev = dev;
> -	k1->pci.ops = &k1_pcie_ops;
> +	k1->pci.ops = data->ops;
>   	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
>   	dw_pcie_cap_set(&k1->pci, REQ_RES);
>   
> -	k1->pci.pp.ops = &k1_pcie_host_ops;
> +	k1->pci.pp.ops = data->host_ops;
>   
>   	/* Hold the PHY in reset until we start the link */
>   	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> @@ -320,7 +336,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, k1);
>   
> -	ret = k1_pcie_parse_port(k1);
> +	ret = data->parse_port(k1);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to parse root port\n");
>   
> @@ -338,8 +354,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
>   	dw_pcie_host_deinit(&k1->pci.pp);
>   }
>   
> +static const struct k1_pcie_device_data k1_pcie_device_data = {
> +	.host_ops	= &k1_pcie_host_ops,
> +	.ops		= &k1_pcie_ops,
> +	.parse_port	= k1_pcie_parse_port,
> +};
> +
>   static const struct of_device_id k1_pcie_of_match_table[] = {
> -	{ .compatible = "spacemit,k1-pcie", },
> +	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},

In addition to the missing space that Andy mentioned,
adding a comma means the line won't need to change
when you add another entry to the array.

>   	{ }
>   };
>   

