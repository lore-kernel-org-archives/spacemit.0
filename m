Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428F5463B64
	for <spacemit@lists.linux.dev>; Wed,  9 Sep 2026 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940867; cv=none; b=O0MuEU69C9hj/tgpSjsPbvWgN6kKeJpwVSHl2EI5aYgpFnrol1oytzXgob/sT5kb0IDLM/yP/AEenfrYEtE05zZ6ItkuBVOwK4IZ91lQxhjTcE7rrXIlxliqy+Aa/B/hqxVfofCvvAoL4PS3g+TkPv33vVSZSQ52TAj7SjM4N4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940867; c=relaxed/simple;
	bh=DOagFB3gfTzdfAu4ufX/3C2X1fRMpO74SBtnAgKij6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBryt4BgS7e8103NYcjgmYsmPJWfpRkWPQVPGu3Ex3A5FgG61R3rBs4aLBAngzdDetNKw1Lr5Mo1yUfKFEhzES5TIoI5bQroyPUAIJjvwrXhzN98+XoHn+MaAaRoKDfA0o3QWhhzNBos858LSuUNSHLg3qrb62xHhBIpzxj0ayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbinU6Zm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbinU6Zm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dd020a2e44so2164945ad.1
        for <spacemit@lists.linux.dev>; Wed, 09 Sep 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940865; x=1789545665; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qknjfqhsbIT0khBlZrKXrrNMX6l5W5qybKPm+PV6LpA=;
        b=rbinU6Zm9auZO0SVor3HrCm80ExZ+9DHIPkvn6WfQxYwJZT2iwjiP3P7fRGj7BCsMM
         PckSUjuu/pcxnDLa0f0qRhZ8xcrd+ZOBKseWNyDrrtGDrRzFIWI48I5DhMvTi46l+VrG
         JM9QKSIb0pgMwrUNGPsxJAH7WpwKk5PYcX2H+b7TWt3cX+x/2yuEFLZmcVu6/XmdHZRG
         kATsTKataPccuOUK0F9s8bkLRe+VzvWHZgU6SEE30bdXgi+t1/ZaTPdnaMES075DjgIb
         /YrI3ZnNhEFfv1sRHg1633s0KUmubhdzr80Zh4Em6p4FSkkqyLbfqJhMFUNMEpXLMxUa
         3xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940865; x=1789545665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qknjfqhsbIT0khBlZrKXrrNMX6l5W5qybKPm+PV6LpA=;
        b=miSNrQI6bvDkYiyCFHzHzUUZJVmWQZTNCUynnI3tQRHWMMkjcwdOCU4kRve1km5o+1
         qZ0ZK7NolxHVQvxrTHPKHK5NSeMBog5mJuLcl3FjdEDndsycPczFC+cNAO3yEuQEyJu/
         /vmx+VmhX0Snc8GNhL4LXxoFEO0NUvjC3UuZIyojkr8K6iAe7YHHDJD2JGgUVWSMHcbO
         2ZOhyCw2LRia/3F+X38lWka/fI4sx87zqq6WMjaYOcA5WzDT5W2Cqcr1rHRY9hnR26zL
         fQD3kNNXRUIMagUUBQ2afAka+24akrFGUWpcjWsR/W7CZj43Qf1wnWH7QIXRkS+CsvdU
         DlYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYLtYnn4t4BIuEV1dYHFx/I61cah3W+BoPe6rJfCB76ik3cgIymS44I3P4HlGcCAAYLum4pIJhZQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lDACnTspjXg1gK9FtIvIzt5/L8evBU9zpojAVIhTPyvHX8F2/L
	WRrmMYEulvXOBtlSINQl2K94yv9BJ4rjNN9wE1ymr54AI8TcnxbDmTgh
X-Gm-Gg: AYBFou3e/uGTKhotIoe5LLUjTnfWYt11jrd3ha4FB7dU0nG2zxK6vhY7DzF5qfy8VRw
	2YkLLf03WArN9eJQClha3g3vicXM4io5K/aZ7BKVWp7LbWt2FWoItbIjeWrcmuGpkUdl6aL/3Gr
	750SWeZ01MmSSfeMj1WIXso8E7MbAgbSjcTAxgn7VSBJ5lxhdgYHN6dViK82yJ5JkQqhH8TmMfN
	BMGaI7iy1geKWQKjEm62bBRBoVjr87sRfrUZ3KXVBbfihokMkgTLxYKfyAzflHS6qPCs03FfYxo
	grtN6UuOBAXg26t9sBX9I4NT3IBYAuT/0RUxLM0MYsjhiU0pF5aM5STWzDkFeKZeJoLSdDeX5Ak
	G3brwLDUtOh27heiZhpiu3JBqkxx7D5iNHtEY84JQ3Zwws8/4WG0l8Kg6KlgcCPeQkIP5rxarj5
	Td/uVoCUgoXfVQ9hCsHADtn2zoS6HO3KPM7gd3Xg5Uw0LJmDXQpYbpDY0FsoLrIvL4RcEiWg==
X-Received: by 2002:a17:902:ed8b:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2db126d8fc2mr319851615ad.12.1788940865429;
        Wed, 09 Sep 2026 01:01:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14aec084sm66832155ad.84.2026.09.09.01.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:01:05 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:00:33 +0800
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
Subject: Re: [PATCH v5 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <aqESGs3_BxOd4PYg@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-2-inochiama@gmail.com>
 <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>

On Tue, Sep 08, 2026 at 01:26:44PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 07, 2026 at 07:26:00PM +0800, Inochi Amaoto wrote:
> > To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> > data to handle the K1 specific logic and make room for the incoming
> > logic for K3.
> 
> ...
> 
> >  static int k1_pcie_probe(struct platform_device *pdev)
> >  {
> > +	const struct k1_pcie_device_data *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct k1_pcie *k1;
> >  	int ret;
> >  
> > +	data = device_get_match_data(dev);
> > +	if (!data)
> > +		return -ENODEV;
> 
> It's better to use -ENODATA which will help to distinguish from other ENODEV
> cases (which are more often to happen).
> 

OK, thanks

> >  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
> >  	if (!k1)
> >  		return -ENOMEM;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
