Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43BE3914F4
	for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372104; cv=pass; b=LKFmZbCnuS7+TDKUJpp6LyfjTL78e6fiMm3UTlJ5Q2WPMwDXpbRur0bHQ6J+FPnPIXfjQ0hrnHxe2TjJ8B/ZSOD6WTo/BNatk1/GEgBGcoXAQ395ehBp5RdEA6ovBovEGSuDJC4IWpT4zlJpDSIe0GW/HTllk4xK8fnxQXJ5S9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372104; c=relaxed/simple;
	bh=oez9X9T7SSS1IgzkoqM6yD7VrW8TgS7l91smZUvHSC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syZA1DfqUWM9eoILI706QngbVumQn/LV8wiSE5TrR983wMw2FFU20lfBUyTcHG5HCe6eMDnYc1zBAj37yC0zQK6FllfX931y6oco2lO+QtRVxDRi5dr3EXgdJtsezOUyFbhn0Xz5lyfIH8mLcSAe+NUh1j+lQ1NhTqrOdsM85oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=iDX/j8WO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="iDX/j8WO"
ARC-Seal: i=1; a=rsa-sha256; t=1774372085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MYHkYxhl1kzsmMPu+YSWcmmrZLgIFDepwqCYYTJVmnWBBiOSPXoeNy7/5b6gDQStizKS9VNvUz0zjveuguJXJy48VYplJsPVWgklwVT/ZTpA7Xgj25ODq6uSVtM48MaZPDcGlI8RdTVY/+QFb4VMHF70YGAHtj0MY8bpOPx1zBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774372085; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yis1W3CG/QCQD456WDjoHGPyDG1Mp4/onsEgXHy2b14=; 
	b=T5telFO8kWN0M5y2Oyx5U4Te9xi+q909DUtU0a0LNq9Jo5NvPuhd+Whw4dmsIv6ifHjE2ljzkysofhhV/fumQjCJeMFo/9UgZPlkCkty3OXEiNo+/3NRF5Mq40ONsdLlD33U+d2ckXkefX5tGrRseF/TxjjK+mcoDEoi7hJQ0lQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774372085;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=yis1W3CG/QCQD456WDjoHGPyDG1Mp4/onsEgXHy2b14=;
	b=iDX/j8WOlY/iWQX7G/cLaG8bbz1UIdDs5XuFY4SgibTZIcUKEEuV2I2ZwrebApkN
	HoT00F82R+5XhE8SrHQp+xK0kIyp2RpaGW8cHuycHMacYW5H65pxZUolcj8VYEwT4UC
	kT62Rtc39TNjWUTBsLoSunrHGoVql1JyUy1aw0j8=
Received: by mx.zohomail.com with SMTPS id 1774372083024696.6013806809772;
	Tue, 24 Mar 2026 10:08:03 -0700 (PDT)
Date: Tue, 24 Mar 2026 17:07:51 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on
 Milk-V Jupiter
Message-ID: <acLE5xnEBoCtW4Vw@pie>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
 <20260324090220-GKA739629@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324090220-GKA739629@kernel.org>
X-ZohoMailClient: External

On Tue, Mar 24, 2026 at 05:02:20PM +0800, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 21:28 Sun 22 Mar     , Aurelien Jarno wrote:
> > Add the QSPI controller node for the Milk-V Jupiter board and describe
> > the attached SPI NOR flash (GD25Q64E).
> > 
> > The flash supports a frequency up to 133MHz (80 MHz for reads), and the
> > SoC supports a frequency up to 104 MHz. However tests have shown that
> > the flash is not reliably detected above 26.5 MHz, consistent with
> > frequency used in the vendor kernel. Therefore, use this frequency.
> > 
> ..
> > The m25p,fast-read properties is taken from the vendor kernel.
> > 
> So long as this is verified and works fine on board?
> 
> > Add a corresponding flash partition layout, matching the layout and the
> > names used in the vendor U-Boot.
> > 
> ..
> > Also add the bootph-pre-ram property to make the device tree usable by
> > early firmware/bootloaders without modification, as U-Boot is stored on
> > this NOR flash.
> Is the dtb file actually used by U-Boot? I'd highly doubt about this,
> if not the case or has not been tested, I'd suggest then not to add
> this property..

Currently no, but it would be a bogus if we could do it at introduction
of the device, if it's really necessary in pre-DRAM stages of
bootloaders, e.g. U-Boot SPL. This would reduce the duplicated work of
downstream projects if they decide to switch to Linux upstream
devicetree.

As SpacemiT K1 supports booting from flash, the description of flash
nodes are likely useful for pre-DRAM bootloaders.

> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Best regards,
Yao Zi
