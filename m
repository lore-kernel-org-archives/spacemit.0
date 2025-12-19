Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0771532863A
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146752; cv=none; b=XbCRRNacIgkKPYary/FfyAskbqYfJBcgdrgJByXPhOg575ANP1DFn3cG1O8xEM5XAvG3RtvMxYBbTQv0uv3yHyr0ywavENdrKSoUD029PZqUhfp0aPqZBjrxALGQ8LUcrwyxC2MXNxmm8jviBHc+09i4vp4x9tg/J5n1sSeWjTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146752; c=relaxed/simple;
	bh=oKq6aL7d4EFtNYjveKmf5F4EQih2qPejJvSHa0JzOh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qukWN6gJApbQJOD+XCFUmQTMmzq4vuZdMi94C5cadlGVNupuQ7uUDVi/2w5b+/hHRsI6RL5vN9dJ73xF28O4kzTvsHUrJe0R6fiuRLy2GyQ/bYSZ1+ZoutBg90750pGEWQTvpyA6NK/dQV4LXziQufelp/DMbh4GzcQYvOmNTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E3D7E34101D;
	Fri, 19 Dec 2025 12:19:09 +0000 (UTC)
Date: Fri, 19 Dec 2025 20:19:01 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, ziyao@disroot.org,
	aurelien@aurel32.net, johannes@erdfelt.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
Message-ID: <20251219121901-GYB1958363@gentoo.org>
References: <20251218151235.454997-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>

Hi Vinod,
 Could you take a look of this series? I suppose patch 1-3 should go via
the generic phy tree, for patch 3, it's already got Neil's R-y [1] which
Alex should collect the tag..
 the Changelog for previous versions are also dropped.. which is bad

Link: https://lore.kernel.org/all/ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org/ [1]

On 09:12 Thu 18 Dec     , Alex Elder wrote:
> This series introduces a PHY driver to support PCIe on the SpacemiT K1
> SoC.  The PCIe controller implementation is derived from a Synopsys
> DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
> PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
> lane, and the other two ports each have two lanes.  All PCIe ports
> operate at 5 GT/second.
> 
> The PCIe PHYs must be configured using a value that can only be
> determined using the combo PHY, operating in PCIe mode.  To allow
> that PHY to be used for USB, the needed calibration step is performed
> by the PHY driver automatically at probe time.  Once this step is done,
> the PHY can be used for either PCIe or USB.
> 
> The PCIe controller driver that was included in earlier versions of
> this series has already been accepted upstream:
>   a812b09a6b599 ("dt-bindings: pci: spacemit: Introduce PCIe host
> 		  controller")
>   ff64e078e45fa ("PCI: spacemit: Add SpacemiT PCIe host driver")
> However this series still includes devicetree patches to enable the
> PCIe controller (along with the PHYs).
> 
> The patches that remain in version 7 of this series are unchanged;
> they are simply rebased on top of Linux v6.19-rc1.  The first two
> patches are the DT bindings for the PCIe and combo PCIe/USB PHY.
> The third is the PHY driver, and the last two are devicetree updates
> to enable the PCIe controller and PHYs.
> 
> 					-Alex
> 
> Alex Elder (5):
>   dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
>   dt-bindings: phy: spacemit: Introduce PCIe PHY
>   phy: spacemit: Introduce PCIe/combo PHY
>   riscv: dts: spacemit: Add a PCIe regulator
>   riscv: dts: spacemit: PCIe and PHY-related updates
> 
anyway, for this series, I've also tested on bananapi with nvme card, so

Tested-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
