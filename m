Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569123;
	b=Eb4K01CFwD7hbxg/4wZ/lCSfowOA0eh/sUUztKpFCcgekzRfEA2hgGqh5rw8Vh5np9/f
	 56g7CmMJlvrpuhq2+v78vn3Ism7YVgc666eUafnwHkY5kd1pDYGzC0Lc6rrrJl+BeiCFT
	 2c9iBqwJsv7x0rmpHlKNMf4ZEJQ5u9v10oGIH6wgz6c5E1AWYZ2XmWHmWmXX4g4qYWX7L
	 R3k57K2G7p0W6CyoZPqs6fk0v11262hHH17i+2VzGHbShrkZwijSMdYqQT0sCKL+CXdPA
	 7Yc9oSV0p2QgxLe+BQE1TqltMOMGXxhHxvigpRVuzoT86pSELfiLtHc9GkiP9ePaiSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
	b=Sgx66ga7OajL5xQo+hx32aKUuc9dSw56ycovWONeCpc9LzqP8JcJ6/w1MFCkeKvvpsBO
	 zj1b20K+nuJJ0B1iECAOzcIZCs7iOl2osTvxruhgxCmKViyhlzTcr0negexdmmmI5h8Yj
	 tmymRC4ugiD0r+nF5Qsb/yINGcLNfaoAQNxcId/QeeRffdgIDPOyfVFM90N8K6sSHlrxq
	 wCuwEGRdJR+c6VpThP/bv2SAlfvfADYqSVbDwLBFFw78ijM4bQHQOjtQmkO51q0ukMnZB
	 zVlwEUrnPaXNVPfBOpnYEKkDcCjPhgLTMbLKP7tBD9f2BVNZ7cRHtGzrBkP0XMcUJKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LTqLB0lz;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5300E606A319
	for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 07:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5300E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LTqLB0lz
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso138335b3a.2
        for <spacemit@lists.linux.dev>; Wed, 21 Oct 2026 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569122; x=1793173922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
        b=LTqLB0lzZQSevA2yfQd8eE2KWBMSOLF41sLgNwM1V5t/4p1JkbSYCCXlzxoI8sAZKB
         EBASss9l5tuLcl5jeonrKk1KKug/WfpfJ38xYUmaRn4t4BP9q7B8MtWn13HESYsPzyTt
         YHvEApqwJGfPaWYJ/oqo3A1iKuvfDHyDo8Mnyro3YWGXz2suo2JvZ7t02RxRxQTadrxK
         ChZ93t3jYU7fg/p9a/t94cFZYpabt3ysIl2l96D2t8JnFvw9KA81pwomTivnjc3o6Qo5
         cx4ciav+1roEIROaRKcNdlNDmHAXmO40yFU5+LNqDVXxGl8Z0b2aDkp/DYRaeVyiJTau
         fbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569122; x=1793173922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqrxv5Q2RTtnjt7+05qzteet1T1PNZiaTDIMGMTA4x4=;
        b=H8Wiaw/tipOl0rJxMJxaO1db1l/5DlH+0GYjF7NJ3P4+2M1hpSlEzJyey/ghnO14SI
         fpXGjtEcjvywLo3LQKLI4/KZaY+OMuII8slRWGZNTQzJ+X2tDC6eB/kWl4/i7+DHWo9O
         VNmLreokIFtpUEpBNHmGquExGIKxjQ7uefKHkxA3sUVtpYV5jNi1kLG2r3L1ORZZ7wxB
         qC5qQP+feOI1oSt9gEKo/HsgMKXmwDqlEQuXZxFqnHZ+zGgYMaIBUOKHww2ORGonTDon
         +jTsNdtg4fYZ/reEPw3dknl3EdxOPGYAx130Jip4AD70ScZedL3hGs4onojxC4yeiQtx
         DbAA==
X-Forwarded-Encrypted: i=1; AKwUvByUyxW47s4+GkqWtJCBBycKAFWzTMpqtVJIqUBwfDgZ2OBA5JJ5+2LAuW85mDeDPXOvrwZmPa502Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYIzgS3/3cqRgQdBva0qHm6jV/3WkH2a970nWCZXdk2bOZ4k6nAq
	UD6+WYVI8YyhVn7luSdtOZzkQPpk1/92mDzBRQ0/NFGMAyZl9z4LkKo7
X-Gm-Gg: AYBFou1DQ1j0PLPS8l9/eMHUAIoilpggov9C7ugT0+DbXe01wGG1rDj3B2hkoJgYNp7
	gI4cqTMTxQ8bwxkgNOlFZRqfOxh8tCUiDi2e1bj21WXcG7EonyOzF+scbxND6BWNaEH8s3Zff0m
	/yWQkrQ4jaJRIB4EHsdPut2cq0bF3sSzzm9gavVsiB5d3atqNfO+Oh7CzMtfzkqPUBhkiuxSGI2
	UOynvCoX2Ta7bzUPYnZ6ISjzj90gOokjV0tVFm6/x35JFl6NdPWxETI/kx1AW/8IpKkcbeyvu2m
	WiDDEx4Dipur29Kdbg+0/xkXf0+it/UxwRnQXACV/FLbVqoA2VffzZw3ZHfBLFa+rTm4yJYybuk
	8PgDhRzKkjiSQZXqhkUdB3JeVEcTimnJBruJ/w78yMM5PULtemM5DrepvUh4AkTa0qeSaKthLIM
	AkEqxtIpJ7VA3IjIp08KNxqDBKynUu7VkIWNSUtzX1/OL/btWpk4PiSv7gGjC85qXOit8JgGsOa
	HRMKSN8oSjvOgLqQyqhon3IJ2WfJf5vo00La8YWL+/zc4j11Exccg==
X-Received: by 2002:a05:6a00:a90b:b0:89e:a122:fa28 with SMTP id d2e1a72fcca58-8a089e1f48dmr1074589b3a.12.1792569121569;
        Wed, 21 Oct 2026 00:52:01 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fb005sm548529b3a.49.2026.10.21.00.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:52:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:51:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Vidya Sagar <vidyas@nvidia.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <athuYJjPMkrecGm3@inochi.infowork>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019164108.GA2177470@bhelgaas>

On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> > To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> > data to handle the K1 specific logic and make room for the incoming
> > logic for K3.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index 0564c46e2f48..ab2953ad8f56 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -45,8 +45,17 @@
> >  #define PCIE_CONTROL_LOGIC			0x0004
> >  #define PCIE_SOFT_RESET			BIT(0)
> >  
> > +struct k1_pcie;
> > +
> > +struct k1_pcie_device_data {
> > +	const struct dw_pcie_host_ops *host_ops;
> > +	const struct dw_pcie_ops *ops;
> > +	int (*parse_port)(struct k1_pcie *k1);
> > +};
> 
> Does the "const" here add anything useful?  This patch suggests maybe
> not:
> 
>   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> 

I am not sure whether the compiler can make use it.
And I have not seen any explaination for why no reason
for that. It is good to have a clarification.

Regards,
Inochi


> > +
> >  struct k1_pcie {
> >  	struct dw_pcie pci;
> > +	const struct k1_pcie_device_data *data;
> >  	struct phy *phy;
> >  	void __iomem *link;
> >  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> > @@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> >  
> >  static int k1_pcie_probe(struct platform_device *pdev)
> >  {
> > +	const struct k1_pcie_device_data *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct k1_pcie *k1;
> >  	int ret;
> >  
> > +	data = device_get_match_data(dev);
> > +	if (!data)
> > +		return -ENODATA;
> > +
> >  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
> >  	if (!k1)
> >  		return -ENOMEM;
> >  
> > +	k1->data = data;
> > +
> >  	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
> >  						       SYSCON_APMU, 1,
> >  						       &k1->pmu_off);
> > @@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
> >  				     "failed to map \"link\" registers\n");
> >  
> >  	k1->pci.dev = dev;
> > -	k1->pci.ops = &k1_pcie_ops;
> > +	k1->pci.ops = data->ops;
> >  	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
> >  	dw_pcie_cap_set(&k1->pci, REQ_RES);
> >  
> > -	k1->pci.pp.ops = &k1_pcie_host_ops;
> > +	k1->pci.pp.ops = data->host_ops;
> >  
> >  	/* Hold the PHY in reset until we start the link */
> >  	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> > @@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, k1);
> >  
> > -	ret = k1_pcie_parse_port(k1);
> > +	ret = data->parse_port(k1);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to parse root port\n");
> >  
> > @@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
> >  	dw_pcie_host_deinit(&k1->pci.pp);
> >  }
> >  
> > +static const struct k1_pcie_device_data k1_pcie_device_data = {
> > +	.host_ops	= &k1_pcie_host_ops,
> > +	.ops		= &k1_pcie_ops,
> > +	.parse_port	= k1_pcie_parse_port,
> > +};
> > +
> >  static const struct of_device_id k1_pcie_of_match_table[] = {
> > -	{ .compatible = "spacemit,k1-pcie", },
> > +	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
> > -- 
> > 2.55.0
> > 
