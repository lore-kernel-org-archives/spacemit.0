Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C873254A3
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430319; cv=pass; b=nC/k2Jq1vijg7X24xm+LEo8AwJ+VE/w1IIFmY+mkykoOR042QlI3cQm1OzTDiJI5/i4PglH1ExvpvVeyAZZp9cBvKwsz82rbMFYFbnbyTO8725tSvTkAMMP+3xTFY7gks6mE0ETjZ6Kh4MutTZsuXtfbKbeXXUFFH9l2fNu/6g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430319; c=relaxed/simple;
	bh=CzH2L90oDviaxpM6iegzPKOroAvojQj4rVCQGSbfpPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLPGR/JVTVCiH5dywtRTkRiv7nCylCRXFqJM20tVTbCfY/dbV2xN0Th8ElRlFedgQ6kVzHKm4aguOl59tMCsfSRqDBX8sNgeXOxL7HjJIfFn6B8KcqsCkGrILCp165ayg5PS3pAEcCOFIjtj3wky87gdIGRcBJajKojk6r34i2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=oZ2AGbeZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="oZ2AGbeZ"
ARC-Seal: i=1; a=rsa-sha256; t=1772430301; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iJV09sVvTU//EsXmapK0FDyYtRslQQIkfptJurLd5UyrNRSiXErFphZmJPeqxJATUYd3n7W4kDcaSpOEkALn2OiF3Vm3mtLED+Iq7qSfxjozAAPI+LJ+nXwrE0VVD5C6QxKdtpPMSiC+vF+afTSYY17fYOlKDuV4Gjn+hVbWElI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772430301; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dkLu1MbirnpvkwlAero9ma0VtHlErVyBHAblSr7Sw+g=; 
	b=OBLmHivIrIFN0srXzXQa8uyd/uQDdzuMEF1pThZD8qjl+mIsSxDjFA8uTpZ/NY8q4ZuMmO2SHiN/B0dhufOR1YqdAFGQgZHHwzqGEhBUgqiuLKcALi9KOmEzbfVfTD1OIO5eGw1ThTlzWFeA41q5/ItKfyy1S4ekjC/wz6fNMvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772430301;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=dkLu1MbirnpvkwlAero9ma0VtHlErVyBHAblSr7Sw+g=;
	b=oZ2AGbeZpr5Nac0Ng9jKcrRusUGop2fz4LNNkaPaUBRlu7XZ3iUgUNfpqya+zACB
	tzTmgpEQ46WThJTtU6pu9+ncl04HUt5OigOAjGtu/VNv0kKM5sDKROlB1HWE5iXI8ny
	ZOw+RPTpa19AJfAd90mjBDKwk4NcYE6/BfhNce0U=
Received: by mx.zohomail.com with SMTPS id 1772430298458120.59011214029829;
	Sun, 1 Mar 2026 21:44:58 -0800 (PST)
Date: Mon, 2 Mar 2026 05:44:50 +0000
From: Yao Zi <me@ziyao.cc>
To: Chukun Pan <amadeus@jmu.edu.cn>, dlan@kernel.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	conor@kernel.org, devicetree@vger.kernel.org, elder@riscstar.com,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Message-ID: <aaUj0tmD74VmQoG5@pie>
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
X-ZohoMailClient: External

On Mon, Mar 02, 2026 at 11:05:11AM +0800, Chukun Pan wrote:
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
> But do we really need this pcie_port (PCIe bridge)?

This schema is required to be taken during review of the PCIe driver[1],
and it should be the future way to handle Root Port specific properties
through pwctrl-slot driver instead of the host driver.

> The PCIe bridge node (pcie@0) was treated as a platform device, but it
> did not define the interrupts property, which resulted in the following
> warning: `[    2.897980] irq: no irq domain found for pcie@0 !`
> 
> Would it be better to submit a patch to remove this pcie_port?

Thus I don't think it's a good idea. We should go back and investigate
a proper fix for the irq domain problem.

> ```
> -       ret = k1_pcie_parse_port(k1);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "failed to parse root port\n");
> +       k1->phy = devm_phy_get(dev, "pcie-phy");
> +       if (IS_ERR(k1->phy))
> +               return dev_err_probe(dev, PTR_ERR(k1->phy), "missing PHY\n");
> ```
> 
> I have tested this change and it works.
> 
> Thanks,
> Chukun

Best regards,
Yao Zi

[1]: https://lore.kernel.org/linux-pci/u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe/
