Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3534F255
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783835160; cv=none; b=MSKFNgRER/OM2SHxlHLs9FJJdxmtCwsHQdW9wfGnBCj1tl7+3h4bodr4uxhvlgIWDEWgb1158oHQKcNILLbBz/Q+DYM5GsaVVW9sBIEeKjmn2Acny0KK6gdsrYhNaC48Zzml5zR9qV5pRVgqnzTWfQUAdfcYqVB/LBTT2fskjEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783835160; c=relaxed/simple;
	bh=NO1wVHhYcEvuN+Lhqd6k/I8yI3Bz4oGZnZ8lkUJdfvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e62kEHGWd8N3tV56hkgm3X0BqJarVJzs97/P6bEYsp9WtwKe82dZnoPfOpn0y2EUbfxG1NwlJ+mwA87JTMngIfvK21Bd5owZ8KbaIgoJCZie50JzVHJ58vzA60SPcaH9Ibio8HO6pxJH2WbmuTtfGlxaATi3MQgbehTGtE/WKZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j32sgAem; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j32sgAem"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2863858a91.1
        for <spacemit@lists.linux.dev>; Sat, 11 Jul 2026 22:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783835158; x=1784439958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5T9DanspdTbxdaM1wq6G9SRiLHrncHsKrVHDW8gIgM=;
        b=j32sgAeminxjECscYP2REjyIAJ27daW1DR0zIb5YJ/kjo8oYlhsKudFZZTf+GzYtG+
         7cSBFzj2j9DSBBqH09zc+Rh7lrYvueK7jjWJyTVtZEk9ft+r37VjzkNRFxZ0EQXccaR9
         JRlOgNiwmmPjgMq3s1pL6BWY+K3L4ZUoLmZJiHcr6q/fB7NKA0AU3pN+kvoZonLCeAE0
         4eufd+XZWij2BR6o3AQsj1qpvCTqXePiEjuc5zAoHYD9jpJkyMMwGWGp6TDdhUBy51UX
         tH4PLekGYbRdHUkRBHFFeIFOpLjwSJjjvt62RvTG0n+IVN0pDxD/UIle+B/otecM20MW
         lniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835158; x=1784439958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5T9DanspdTbxdaM1wq6G9SRiLHrncHsKrVHDW8gIgM=;
        b=DzivMvK2h6GoKXeufHMNJfhbgG5mlIUIy832Gr/EyZPtsDs/CQLzWAfKCFVRaTkn5q
         K/dE2mVNeArvvQXfmK2b6E+MRTUlfZrO3B7xKGvLjJHPKLg0paYVsAhKr0QvZuOB8mN9
         yWNi2GJU1VJ76sjlDI7xrDR/F1D36d0/0z05NoYLSyRc8tl6bH4dWu3oJ0IefXSNTYwC
         83N000GfdN8y2lxT7diHbTkbpqNw6pIDpkFo9w8mSKgZodXRDQmjE5+tQZG0/8mQpO1W
         zomAyRO3kpqhNsqShalzzhXO4kNSCa93lxcsxXA2Ku5+o7g18KGZ7Sgpx2qhcIdxV951
         /WjA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo/gCOFzhN7EW6JcS1oWp/2pYlWEoqp4DwYnjWtcW+oj/5Y5dYOAdyF7fY+Ik6wMeiqqC8R+H16w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzP6UQfS06xYCX6t7a/jAK7/pg5aWWqs13vzmN1z8lioB+5pXGG
	5+0+kF5KWYUskEUSsoi2DR8nzvabP5rWrbLfAR5wsxv+1S7TN4Uq6VSW
X-Gm-Gg: AfdE7cn0tcCPYi5/7itxpfQP+t6h4bD8KSUWgA0TSwUtJKkBGcaSR6OQT+YyFYjmWIZ
	ZM4tAt34WVVzmr3etTcfmzNyMZasHbr4r2jMYxK1LPkb/eahfDiuwrTTtgKbhtlWtMahBXg1N0B
	E1slnI46b5iVWgONLbjwxEr/T0qmDU/Cxf9U4PAM+TGMn8rMWsfyN9pU3jK0iYwUqdvKn94Ai2L
	s8EuiWhfAMM00r7N6oY96J/3sLjUWTiKLpI1RLGOCiweb43bVIIxpnCpmzpXwCNJwjx0usPGglg
	BQTmmnMg28XHP/Ic3BTmkt6unXCz6WC7J4BwaO7kuQRwjgmVxF5IsLIzPgdaLl8Fi6/OQwapyQ8
	jERniz9HW1wfxfGNUzc3kWpSvEBObLS+s6DX1s/Vv39PFYUgO9CCdwk1DZQWFi2FT
X-Received: by 2002:a17:90b:4a43:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-38dc773bf14mr5210607a91.26.1783835158527;
        Sat, 11 Jul 2026 22:45:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11b82d32sm1866372a91.0.2026.07.11.22.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:45:58 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:45:15 +0800
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
	Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <alMpuGY3z1DTmqez@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-7-inochiama@gmail.com>
 <ak9L7k-_aivk1_Uu@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9L7k-_aivk1_Uu@ashevche-desk.local>

On Thu, Jul 09, 2026 at 10:21:18AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 12:00:26PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> ...
> 
> > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> > +	usleep_range(1000, 2000);
> 
> fsleep(1 * USEC_PER_MSEC)
> 
> > +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> 
> If PCIE_T_PVPERL_MS is too small, msleep() maybe not a good choice,
> perhaps
> 
> fsleep(PCIE_T_PVPERL_MS * USEC_PER_MSEC)
> 
> ...
> 
> > +	val = u32_replace_bits(val, BIT(7),
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> 
> It's perfectly a single line.
> 
> ...
> 
> >  static const struct of_device_id k1_pcie_of_match_table[] = {
> >  	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> > +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
> 
> Missed space.
> 
> >  	{ }
> >  };
> 
> I don't see (and haven't checked) the context, do you have
> MODULE_DEVICE_TABLE() for this?
> 

IIRC there is already a patch for adding this, so I won't add
MODULE_DEVICE_TABLE there.

I will take other advice, thanks.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Regards,
Inochi
