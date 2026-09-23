Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78944363C53
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 01:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128196; cv=none; b=Iav05Jq8Yl9BBS0yfmC9R0d2OlAdh6d6jJg1MdrkcQQ/DCu+7IM4CyubPKbdtFilh5pKGW9erC6am1B0UNi2hp6ebePbVlWNxz+tmT3QPeLLMB1j6FtFLKolWA/AwqKFVwAfOz6u0qiBxzMO1wu+jAK8moUsdVagp7mJJfJMLyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128196; c=relaxed/simple;
	bh=sctJ8pRpBUC39phZYvLZAiXxKt0bFvx0/SjCeTNKZ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U97yG1eUlJ8ZK1VB/Rp0/aFn+xQzLBPESqv9kBQ+oajVraFCw5Al7XhSI7AmjubuyzPte4NXGtgdbOG1y/rcZVZXBEKSKvGIn4UiqM9CHixBX2tiKZTHo7StmJgF434U7rehBZIJuJTkSCizpgEpfQrDtMmipOAdrXw8YUAQZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aT9Isakl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aT9Isakl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so176857a91.1
        for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 18:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128195; x=1790732995; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnnWTyMk5d70Hpz57ZOyyh2guKXo+Z5k9pvOlpmwiYo=;
        b=aT9IsaklFlIAaol+iVjW1HEtsm0DunMeXh/ijayN908UewMiuqEqQi0p7YHHyslpMp
         RUngZIJX11A7YwD8I0/nVonmKcWulE0DV1q5bgdbOHNe7p+GSv6ML1Uqh+RwzsaKxDtO
         W4uVvmklmvm9nhFNDYw4CD3igpZPDbGmAl1irH2LwXuu5fx+2ylqeKJWXPS9kaVrMVnO
         h9dkx7P0J9jmpH0OYjigeOA3DAl9ZSFONupdplTAFi7RubjSh0YfJtQqEBnrt7Fo+6mC
         JYlIB5XiMYqhygyItWTxodFIDHB6JIi0nN06a79YgmgSNpXHs50Ok5eRxXUcVdYqWVvK
         KKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128195; x=1790732995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnnWTyMk5d70Hpz57ZOyyh2guKXo+Z5k9pvOlpmwiYo=;
        b=ApWDFfq7DPPA8IWdprnNK+oOcq778IxDwJLUaM5kuTJ2b3OuefkJhGwRMyY9ojt/q4
         ohY4NkNG5tM2K88E+N7xs1+PmvxqdqMM/dSKGGCWw+LdtherbGdfQl8yTimH5ncOUXlc
         Rt0d9nrA5OEia15Y++q49i0mkb+Hfp4nWNIrmxFzHEinnQW3kt8jCAfNdrPHu+DzUDwV
         u/biN+VifWtHjSU0Qqa2XjqraonhU2uuhlifSnlkhX/JMqbs5UMcPsG5G+L54h3PPbKE
         Om4kPjJpYKSXhJ0ZAd+rtKa5s03+FwvH/2SPLrjbgpoiFp/0z+xvdapcjjLpAsltse7r
         yL4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKjv4Tr4OzYz8YycBTnQ0A+J1BngB5IIwjErCgFtpT/6uWclq76d3DvYoo7d5V8takXHf4eIFATw==@lists.linux.dev
X-Gm-Message-State: AFuF++nkxjdHIy2akhhjHzDbNd0OU31U1lVABKWjBQ4wWJG1d3rHHLUG
	JiYL0aKOfVFxWVg3hOtGkj9bMCO3Zz0rmVLTQMZdmQclygI6fGz5hxMK
X-Gm-Gg: AYBFou0ynE+nkRXXozUEwaJouF7SpdJrkZdLK/ZXhM+8FtCODrjlfoqX0xlAPMtO3VP
	EfQo2xkiDZQv0AeuTdtkKo7TptuUuxSkQKQFWfbvtNrNlK9+VteTToo8zqZ2zyo/jM9nHP5FWb2
	cq6lE9uPeFD+r5pI2Cg+XOI9S6n4odjH04SaJ/rdCTxIznqF9d7UPNBX2SOwDcWY5SePQsTGqBg
	bbh86TrjrslVmQvWRfSaJ6RqB7ZagTfyU/j/3JDmwws7Frp61d6k/UtkaF+STCzvmdrb2NmIrYF
	Bwc7fKYAwyVwTDeCqkbqGyZXzuB/f7f2yT8mBKEseRklgqtnHdyIdOu1Sht5b4gZqxqgHKA5gNu
	xu9VCgVPipqwvJlS1l6DQS8kMoe+mN9BYWUGgVObIopsAj1syqX+fU5OyyRx0PBohdzoOETe9F5
	po9tMe88eSDgseElhjj3g7BaC1eOIgMuALKW8u7HTx0ZBub/x3vBeYIoyTRameyp88+g+S
X-Received: by 2002:a17:90b:4cc3:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a07e61658fmr750266a91.38.1790128194871;
        Tue, 22 Sep 2026 18:49:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm1915180a91.4.2026.09.22.18.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:49:54 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:49:00 +0800
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
Message-ID: <arMvZNEUhAQYa--o@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
 <ap_jh_NAqHnIlZeu@ashevche-desk.local>
 <aqEQnkrPSKB-3fam@inochi.infowork>
 <aqFst9QH9YTFlY3X@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqFst9QH9YTFlY3X@ashevche-desk.local>

On Wed, Sep 09, 2026 at 05:27:03PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 09, 2026 at 04:00:15PM +0800, Inochi Amaoto wrote:
> > On Tue, Sep 08, 2026 at 01:29:27PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> 
> > > > +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> > > > +	if (count < 0)
> > > > +		return count;
> > > > +	if (count == 0 || count > data->max_phy_count)
> > > > +		return -EINVAL;
> > > 
> > > Elsewhere we distinguish count == 0 with -ENOENT.
> > 
> > Is there is an example? I think it is suitable for its internal check 
> > to translate -ENOENT to count 0, because no phys property means no
> > phy. For a get helper with optional semantics. I think it is fine
> > to return 0.
> 
> This the brief list of what I roughly grepped with word "count" in the name.
> 
> gpiod_count()
> of_hte_req_count()
> i2c_acpi_resource_count()
> ice_sriov_set_msix_vec_count()
> reset_control_get_count()
> 

As the respond in the phy bulk data patchset, devm_of_phy_bulk_get_all()
should follow the optional semantics. So I think return 0 is a good
choice. Anyway, I have added the zero value check in the driver.

Regards,
Inochi
