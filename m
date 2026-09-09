Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6103E16B2
	for <spacemit@lists.linux.dev>; Wed,  9 Sep 2026 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940850; cv=none; b=BF8trSKTxrz6zdF+TfbqTG+pnDkKnAJm+Dd4TdMun4P5UUrXhyanCNTTyimF3Sdnp1M8h9LFwZIrQaCKm9CfoUzUwcxhIUeyAwLP7K45lTwG+KBfQsOF648aS6KI5IuuKjl8qEICMNm4Xnl+R6CWlhZJJtnbFqgNCORSH0mjl5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940850; c=relaxed/simple;
	bh=aN1MVkOCjwtOucEg+oqql9Bc/Rq8wSbHbAKKZ6P53QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D55mBEHWGgEEijaO34w4BM0I5lXJMBBLigWAwL0upCxJB/g9xxRyZ5oAr4mr6eGlvkMxDfi9xav0QMVdBi8B2XMSKpU453kUABBS400FOBccUUbB2JgJAbRPYejsuHI8ZXc5MDzCGUOPnfckj75gzCspe4bvybeQ/XEdjODJSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6/8NQ3p; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6/8NQ3p"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db3305f94fso44828745ad.0
        for <spacemit@lists.linux.dev>; Wed, 09 Sep 2026 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940848; x=1789545648; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KTUPUjrKl8uCmmUdksk98ps3euLofcTsZvaXovInbao=;
        b=B6/8NQ3pc9dRX6eM09UZ9u3iulYrcXPs3iwg8Fg4di8qslGMuS7wZ2Y01xKy8HAtQv
         QV3OXHlQRSNPoDIOo2k7nNu7guG2vCw27ZDdkn86iKhnzLK0OgnfGr8ZP8PcBG2BsCR7
         eIZX8g4zZkZG8eDZlwuADQ+cJ73sfK+OSB+Y/VJlDA/yuBlzUtivgcRKAq/oEYgISi4y
         YsEJi+gPJbDVVZZw/cNhGvbE08aTrGS82ilZyIQkqgoUEhvP+C8ANSK3Tu4GMcYbOnU1
         gUpHE46v7LqtGGHVJZ/k1ZuyleCDSSGi+G3UqjCBD/X3uc270zeNNv2jeHS7KOMqOVXu
         tFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940848; x=1789545648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTUPUjrKl8uCmmUdksk98ps3euLofcTsZvaXovInbao=;
        b=qLcbiCPP27xlkpIKkkjXq3ZTc3LNdUG5ah+kn84YOM9WYlfGAbTZHUOX1dsZPrmS5C
         2GZovPj0jHLoz4zq/PjQnn6HPsCgD2Qku1TtTamebW4t3/p6iUwd0/+2+Mq1BieBM7OI
         vClpI1+ns/zk5f94zLwJq0flLR7CoTpBIJKhc1SFKMkwNe9FcVq2KONXXIlW3W3j17R7
         IIGzUIwnKu5NdsYtTanoLy8fna+rNJaQHUvllz9/mCo7GZiyc5DPH+U0vrD/JFZyrlwm
         TUBv0PY6ayzsoejQXPw2ZrGMb+/xhhg8an7AmIXMQXZlhfeB59AD72ZNd7JCw5MABQ2R
         Gwtg==
X-Forwarded-Encrypted: i=1; AKwUvBxin7ogtvUbGbpgOomZky9+WTrGEUU7EEE8JG8IhBFHc2QeED6KmHV2AZZGi6ACXzsskd/8U4OnSQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kZ5PxiI9ncxP+x2SrB2SYsrs9RWrShwBhaN5qk2sOR/4E7UN2o
	CcrdAMMkfEDdcmcgR0tV0MKiPvBClxh8xAYQsjPVptznWF7t7Of74k6Q
X-Gm-Gg: AYBFou31NvQ7qNSQ0EpwtBR7pkz7Icxf8Y5VAHD9mzRs0kUwSmD4t3WWR/RQZ7PZEKb
	QqruHAy1IKEXPEiJnFjLCY6ZPOQ6ZX6vhIttQtygEJOmMsH5pHucQoex4pWohecc6XVaweNmzFz
	C7cfQh6zLaeFDqhxiZeatTFNV+3p0rhF0ZizwbDMsZ0pVqlY8OhA6I8Ms3i863Isl5qMMeJiG+I
	LHgQhrD2+zE3wv6cAHDbNzN7sqMCyOPFqNQamWolfre0nQ8sGGfZbWsA+RJn1WKb9wH5VEgZWJ0
	RflhbtPBJ8Jvmjgg59Kawi7UpOsmFkkDvH7q26vo1vNVOKa66rsL+X3HIRbe3/3xlBvPWUiNkr3
	CHjkpS08LR4K84XgNXwm0GrPjS6uoxbIsbJPZ3Gu8nB7H3u2PSs+nfddHAg0IyyZ7mdy1d3Kibl
	ueiuoq41bjt67z4Top37Z21W5qysYbO2hMzKYjd6FLoDbxnG0VlSETcasgI4+ld2MF/RAtF6l/1
	ZmEJdul
X-Received: by 2002:a17:902:f70f:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2db1225b297mr497594465ad.0.1788940847987;
        Wed, 09 Sep 2026 01:00:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db56c2a1f1sm37775965ad.78.2026.09.09.01.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:00:47 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:00:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
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
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <aqEQnkrPSKB-3fam@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
 <ap_jh_NAqHnIlZeu@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_jh_NAqHnIlZeu@ashevche-desk.local>

On Tue, Sep 08, 2026 at 01:29:27PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 may use multiple PHYs at the
> > same time. The feature is not supported by the current driver.
> > So extend the PHY definition to support multiple PHY handles.
> 
> ...
> 
> > +static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
> > +{
> > +	const struct k1_pcie_device_data *data = k1->data;
> > +	struct device *dev = k1->pci.dev;
> > +	int count;
> > +
> > +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> > +	if (count < 0)
> > +		return count;
> > +	if (count == 0 || count > data->max_phy_count)
> > +		return -EINVAL;
> 
> Elsewhere we distinguish count == 0 with -ENOENT.
> 

Is there is an example? I think it is suitable for its internal check 
to translate -ENOENT to count 0, because no phys property means no
phy. For a get helper with optional semantics. I think it is fine
to return 0.

Regards,
Inochi

> > +	k1->phy_count = count;
> > +
> > +	return 0;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
