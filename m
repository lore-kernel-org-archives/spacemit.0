Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E0E1A704B
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 02:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757559535; cv=none; b=u8FgfKeif7hsIQL+0fiAuTFB3lVg8mQEB7ss8QfQGdM3Yp5YU9j6Mqy61R+un4K0UjI/Zd8pvlbAkCwOa5KAvLyqbMM5rmSNL75fpTTzBH9Da5JcnSBSoNI3I8UjP0T5BsfBdLUCbGvULGd7EQ0SpQNSF7nXsxi4qyWd6EQDqJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757559535; c=relaxed/simple;
	bh=uVVIOjK0iB7TLpDTB5l8Jh0U+U7U4acZbxxyUpEblFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNVhf4QWIuqgHdPA82sM4elfUxsru2z9IACN0pSKBUr3DSGFlZoUjODWTCAB2gOWBnkyX23IuC8nA/VE8iNoBKnBXzp9WQjoWRgRYh4nMOh1nSDJGKrZF2XuithsEkl3xBbTEGCz1afVUJU+BrVxAWe0M/kqKkGUndPVX8TkZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [IPV6:240e:474:b942:3f59:6226:58b7:4db:46bd])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22684c28a;
	Thu, 11 Sep 2025 10:53:41 +0800 (GMT+08:00)
Date: Thu, 11 Sep 2025 10:53:41 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Frank Li <Frank.li@nxp.com>, Ze Huang <huang.ze@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ze Huang <huangze@whut.edu.cn>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aMI5tSq3e2MbFrlV@monica.localdomain>
References: <20250729-dwc3_generic-v7-0-5c791bba826f@linux.dev>
 <20250729-dwc3_generic-v7-1-5c791bba826f@linux.dev>
 <aMH5P3Xae0MCt6wu@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMH5P3Xae0MCt6wu@lizhi-Precision-Tower-5810>
X-HM-Tid: 0a9936b16c3d03a1kunm4e2ef7fb19acdd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkkZVkgZSk5MTUlMTkNDSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQU9MT0EZQk9JQUgdTkJBTUlJTUFOQxlMQU8fGUFPTRkfWVdZFhoPEh
	UdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQY+

On Wed, Sep 10, 2025 at 06:18:39PM -0400, Frank Li wrote:
> On Tue, Jul 29, 2025 at 12:33:55AM +0800, Ze Huang wrote:
> > Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> > in the SpacemiT K1 SoC. The controller is based on the Synopsys
> > DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> > DRD mode.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> 
> Ze Huang:
> 
>    I seen Krzysztof and Thinh Nguyen already acked this patches. Do you
> wait for greg pick it up or need respin?
> 
>    My one layerscape usb patch depend on this one!
> 
> Frank

Hi Frank,

I'll remove the PCIe reset in the update - since Alex's latest combo PHY
work now manages this functionality. The patch is otherwise in good shape though.

Look for the updated series from me before end of week.

Best,
Ze
