Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54480263F5D;
	Mon, 29 Dec 2025 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767039305; cv=none; b=dJswK0+Z05Pee+VzrGRWGWkoI91ACNg4/OXe7Hv7UCNkSUqASGkwHpZJNJFw8ZwDPB/NXfkvzQvDO6IgqW0mRIFSD8kbLfH820MJ7TDShEynt1bRrQFJ457rNljqnKRBNs/jMYy9Dbbu+XTJQh9RVY1NffPBtc0uem5y1uDjnxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767039305; c=relaxed/simple;
	bh=JqNKdSEsfYzpSlMWy7gS9prPALVh3jPgoUHA9oC0hT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH2Ye53x6WkfprJN5Bt6mc8Izuo1l2WFQsRh3yPuYvnX/lMuft0wRi9R3IB4yxdi5VEw0+DfWrJukwFWCZH8fa6sakuawxYJW/HyZWzMRdzTlVOEaLD5RLGr9eafdB/oAnbgxBqiuXsBQdGvnDrxQxnCf4u9nsEVmuCicXourOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=Zp4437af; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Zp4437af"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ehhD4wbRH7wTUpUt/VpjfWrT/bv2UxVguaxZJATB154=; b=Zp4437afYBpglBIfsU9Cu7FhPk
	GOGNSR+oUYd6yiPvLfJUI977dPzBKtmKDt3Qw2RdwgwVHDJk0zOADkDXiwYB+cXfvImJr3n5mgDEC
	vcoVLWkkifPkpoJMWJR2NgtekkCiM7NH1gYa6uHAAMkABkip9XREI2FqPa/scESAOtjSXgdN4wWcI
	VmFckGOq8jSUxWwsbEWlxUeh0SWDzaagBfT/IKb65LcpxXdjX6gHDri3SRrrQJk4SlhUO/AIH5Qi4
	+jJu0IfV3yTVpkMNt82k5RxUSwqpPNEpQYAun05CiSBULG1Ow3yLrakboKUl2KzdlBPK80I30vfJP
	yyH31Wrg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaJdk-00000003dMJ-0mmb;
	Mon, 29 Dec 2025 21:14:52 +0100
Date: Mon, 29 Dec 2025 21:14:51 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Ze Huang <huang.ze@linux.dev>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
Subject: Re: [PATCH v6 0/2] Add USB2.0 PHY support for SpacemiT K1
Message-ID: <aVLhO9hAZBBNUEnP@aurel32.net>
Mail-Followup-To: Ze Huang <huang.ze@linux.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
References: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-10-17 22:49, Ze Huang wrote:
> This patch series introduces support for the USB2.0 PHY on the SpacemiT
> K1 SoC. The implementation has been tested on the Milk-V Jupiter and
> BananaPi-f3.
> 
> K1 includes three USB ports as follows[1]:
> - A USB2.0 OTG Port
> - A USB2.0 Host Only Port
> - A USB3.0 Port with a USB2.0 DRD interface
> 
> Each of these ports is connected to a USB2.0 PHY responsible for USB2
> transmission.
> 
> This series is based on 6.18-rc1.
> 
> Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
> Changes in v6:
> - phy: spacemit: k1-usb2-phy:
>   - Fix clock API usage and ensure proper clock disabling in error paths.
>   - Refactor Register Definitions: Replace address/number-based macros with
>     feature-based names
> - Link to v5: https://lore.kernel.org/all/20250527-b4-k1-usb3-phy-v2-v5-3-2d366b0af999@whut.edu.cn
> 
> Changes in v5:
> - phy driver for usb2:
>   - convert readl/writel to regmap
>   - fix typo: sentinal -> sentinel
> - Link to v4: https://lore.kernel.org/r/20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn
> 
> Changes in v4:
> - combphy driver:
>   - add in-code comments to indicate that PCIe mode is not yet supported.
>   - replace custom spacemit_reg_update() with standard regmap API.
>   - drop spacemit_combphy_wait_ready helper function as only used once.
>   - Fix PHY init timeout handling: ensure proper error reporting when PLL
>     lock fails during USB3 PHY initialization
> - Link to v3: https://lore.kernel.org/r/20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn
> 
> Changes in v3:
> - improve commit message, provide more info about phy hardware
> - drop superfluous local variable in `spacemit_combphy_wait_ready`
> - replace devm_reset_control_get with devm_reset_control_get_exclusive
> - Link to v2: https://lore.kernel.org/r/20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn
> 
> Changes in v2:
> - combphy dt-bindings:
>   - fix reg-names
>   - describe reg
>   - describe #phy-cells argument
> - drop stale ".owner" in driver struct
> - add support for usb lfps_thres in combphy
> - fix Kconfig depends on
> - Link to v1: https://lore.kernel.org/all/20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn
> 
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> 
> ---
> Ze Huang (2):
>       dt-bindings: phy: spacemit: add K1 USB2 PHY
>       phy: spacemit: support K1 USB2.0 PHY controller
> 
>  .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  40 +++++
>  drivers/phy/Kconfig                                |   1 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/spacemit/Kconfig                       |  13 ++
>  drivers/phy/spacemit/Makefile                      |   2 +
>  drivers/phy/spacemit/phy-k1-usb2.c                 | 200 +++++++++++++++++++++
>  6 files changed, 257 insertions(+)
> ---
> base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
> change-id: 20251017-k1-usb2phy-a53ed4ea51b0

The whole series is:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
