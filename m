Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741DF13AA2D
	for <spacemit@lists.linux.dev>; Mon, 18 May 2026 01:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779067129; cv=none; b=erEvUCZ1kw4dAtz3vFJhDifilBkLlGLh363FRyZPjUXSV3HPk62P/3muECootbpXdDTS3tr7ZuLfXM1b+/yYXJ2g0Gf8IUyuRjekrN1sBvC2+JJgQ/j13bGLv8/qSVIUcCwgt4rBY7TFMoXZqnBEavUEII1oSx6Ixl4YsR5KiUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779067129; c=relaxed/simple;
	bh=xv0S31PtwdmpQPHw0Fc3vOyQu5vNsfiZECnu7ZDWm6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvW8GL+fg7t3R3TiEQl3eaFdQvSkdqODu9qsVDajgUNm/ly+7mVe75L3Y3CyKn+D6mFvDNznjuALG3zCIq6fjVYKtIMwUrKV0EtwUXNeWkNzFOunOO+BvBQocIpPptFwtp5pdP+vKJu/t9Nbfox9obhVcnkJTb6xtdcrlqT6jYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4fBgBUv; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4fBgBUv"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-838d0b7c950so1163958b3a.3
        for <spacemit@lists.linux.dev>; Sun, 17 May 2026 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779067128; x=1779671928; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrkXl/tb+VJX1ZNHX4vVsA7L7lm6KoE09cNj85XuTpU=;
        b=F4fBgBUv4a7cRiA+FQHrD8yOkwZilDmmjFNP8CBjMLZEHUUcIF3ygTQqnCm522Br8T
         7SA71vHb3OspZfcYRXuSHw8XI1Vv9a6MhesDbEhWDbl+uEOwYyDe/FSFAXy9o8YObgT7
         AUemn+kAprbld4+1FeYyNLq2iPZ8gRGT0lVCuh2fmOIW+2hZBFDRac4srKEiJfR0sup6
         xDkLHso55ajDX3R9w9W4ed8xeGetBns0jgrd9QouruVv/v5Dq7MVUYAz380mVnDdhXE5
         Zc2165K7UICD+gnJfZlYReEanLDqqZJtRCfnTjJeKzaL0M1l7ucRTBTtQHbVcQdq2Z5/
         BQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779067128; x=1779671928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrkXl/tb+VJX1ZNHX4vVsA7L7lm6KoE09cNj85XuTpU=;
        b=tHsG2gOQ9E6D+dgaoaUnW9kOhy7mxH1hW/0bgftLyiv9+VMcaG/SkPrxpZ4GmpvIDS
         Lz3wqaRT8Bow0oobdoYJ/T5gigYk/QqVf+ZeXGmboaZRP9L4ad/Av0V0EUjmb+BvASKm
         LYuYtq3ZWO1w2immlf0EAugUUBRKsAjSIXqDqETeFiKQ/SaukiliRSSyIkS4Vr83ydIa
         5RWpRMseUvzICKAmrCFfB1Ff272NUK5GmVFe69BNlqegMZgbXuEbYEtQGzHC/EhszLn/
         KRupeHDagmVqB6/OjkttN5obhWQ/XcpJ3+3QJoAvzZ6bYioYoSw5P/TFCPb/RoO9gtIb
         6bOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OT1oyNSAEu6DQ3n20CAFevj1KQnydsmRPhr97KJ5FV/PSd+6potL4s9pFUIvcamkPfpKy5tujSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrOdGfyWlgqmwpHSjXd90ACat0DIQq9LqibIpxLuXCWsxtARSZ
	d1Qosi1IKpiu0ZD5dHj2GgeiwNGlPvLwfGXpJvSJROewyR8qMJRJnZaS
X-Gm-Gg: Acq92OE6LK/jO5RFHcusBdBGkXX9L/Rm0smjjzhub+2jD+6qVdHxqZRduNMJfhGKnQk
	GWc5S1l1XUGe38vOcj0jajxZzL/3AIBgt0ffwTyynWNwqV/ksAByshl70P9cS5ZPJilE9TSg3GC
	ZRNCHgh7Q56gFturjQSNhpFEuHAIcij53mj4WFewNUWvD6OMgpt5Qx3Pn3wLk1oYch1JvmkapE/
	avJ/ZeRzmVsBKZEwm2XedlwtZXyqBIuNfborV/HApkQ8fagpZN6JS/Z+lyoPNLNvxh6JV7qoCwJ
	R+6JYwoHJsMHRHXcXUZ4okHg8aqPJfwgO3JhUMmgG6yQ/7cc7/HfXFs40LouKVCqfJ3zdMNZBA5
	5cDnSbXviAT3sZuyGrAgCAIyX3BWQK2kPIXD0cMOJ64kdFqkeKG0UBTefjTUQ5F8A4crJRomVuq
	V5FMEgvOtXPq6b1oRkMbI7+Tg=
X-Received: by 2002:a05:6a00:2908:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-83f33f166f9mr13591304b3a.46.1779067127790;
        Sun, 17 May 2026 18:18:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11922977b3a.19.2026.05.17.18.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 18:18:47 -0700 (PDT)
Date: Mon, 18 May 2026 09:18:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
	Alex Elder <elder@riscstar.com>, Nam Cao <namcao@linutronix.de>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Randolph Lin <randolph@andestech.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <agpogZp46N_1B0ps@inochi.infowork>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-3-inochiama@gmail.com>
 <agl3TJrvJMtEpHyl@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agl3TJrvJMtEpHyl@ashevche-desk.local>

On Sun, May 17, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> On Sun, May 17, 2026 at 09:48:37AM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 may use multiple PHYs at the
> > same time. The feature is not support by the current driver.
> > So extend the PHY definition to support multiple PHY handles.
> 
> ...
> 
> > +	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);
> 
> Hmm... What's the point in having _array(1) ? devm_kmalloc() should suffice.
> 


Yes, you are right, I forgot it is "struct phy *", so the devm_kmalloc()
is enough, will fix in the next version.

Regards,
Inochi

> > +	if (!k1->phy)
> > +		return -ENOMEM;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
