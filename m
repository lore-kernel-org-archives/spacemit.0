Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CE63C2E
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 03:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772422629; cv=none; b=m81VG9eFbgbsYU2cyIWHy3ZWDlezyKkZPS6lYjnmPM2sMbm9ZH8cRbICA2ask7rgtkB0CCt+3WTgetr8mLnpVkq0FTrNnuQiuuerz9y+txDmjzH6sLsp577C6JSpapjlmxxTlI4M1HP/swt4SC+uwyYahAFwSJrpakpq3vGO0pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772422629; c=relaxed/simple;
	bh=HlZEZBChSkWIZ0yIr2y0mGvtNu3LDcGkglPa507TXoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQHwSjlnaW77aH0DyrFjVIoeKeEJCCBEZlugjnzWKQHdtf5SiUrI30SZIqZ1pW5XlnqsSxDhxRmW5tf0n49jdEzzFUjNjrFxCD8FSfih3k+io26QSd6ZwTgS36HZS3FWJiB/iJdZUUXQ2dhcFTBDZKsRI3eMSLUntE8LtHQfMZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 84C1D341E6C;
	Mon, 02 Mar 2026 03:37:06 +0000 (UTC)
Date: Mon, 2 Mar 2026 11:36:55 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: dlan@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, conor@kernel.org, devicetree@vger.kernel.org,
	elder@riscstar.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Message-ID: <20260302033655-GYA288339@gentoo.org>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
 <20260302030511.30566-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302030511.30566-1-amadeus@jmu.edu.cn>

Hi Chukun,

Sorry, I missed your mail due recent problem of my client..
On 11:05 Mon 02 Mar     , Chukun Pan wrote:
> Hi,
> 
> > &pcie1_port {
> >  	phys = <&pcie1_phy>;
> > +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> >  };
> > 
> >  &pcie1 {
> > @@ -320,6 +321,7 @@ &pcie2_phy {
> > 
> >  &pcie2_port {
> >  	phys = <&pcie2_phy>;
> > +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> >  };
> 
> ```
> &pcie1 {
> 	vpcie3v3-supply = <&pcie_vcc_3v3>;
> 	status = "okay";
> };
> ```
> 
> According to DT binding, the vpcie3v3-supply of the &pciex node should
> be moved to the &pciex_port node. This is simply a duplication of the
> property.
> 
I have confidence that pcie port need to add a regulator to provide 
supply for devices..

But, I'm not sure whether it's ok to remove regulator from &pciex node,
it's possibly a 'yes' answer, but to convince me, I'd like to see a real
test case to prove it: e.g, power supply for pciex is actually off before 
the driver initialization, then run regular procedure as it should, if
all works fine

Btw, different drivers request same regulator is ok, and is quite normal,
can't draw a conclusion that it's a duplication, as they may be used for
different reasons

> But do we really need this pcie_port (PCIe bridge)?
> 
> The PCIe bridge node (pcie@0) was treated as a platform device, but it
> did not define the interrupts property, which resulted in the following
> warning: `[    2.897980] irq: no irq domain found for pcie@0 !`
> 
> Would it be better to submit a patch to remove this pcie_port?
> 
> ```
> -       ret = k1_pcie_parse_port(k1);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "failed to parse root port\n");
> +       k1->phy = devm_phy_get(dev, "pcie-phy");
> +       if (IS_ERR(k1->phy))
> +               return dev_err_probe(dev, PTR_ERR(k1->phy), "missing PHY\n");
> ```

I've not really looked at this, and not an expert on this area, so will
leave this to Alex or PCIe maintainers..

> I have tested this change and it works.
> 
> Thanks,
> Chukun
> 

-- 
Yixun Lan (dlan)
