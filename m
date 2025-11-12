Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41101990C7
	for <spacemit@lists.linux.dev>; Wed, 12 Nov 2025 06:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762929575; cv=none; b=haOiy8m5CYKpHFkwQhHBQ0KpKBustR9SYYwMASo9nhHdfi3zDXj8hrN9xIRc/I4AKRp0bb+qyBL7F8P0/EcC7kFRxWzMWIfUFetaIV2uas9OK2VOX0AYDKxnk2go8r6+wqLVWQ3oKzH40aCLAZ6Y7DqNXy7HbpEcOhxlGB04gIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762929575; c=relaxed/simple;
	bh=DTNCKMyHHN/yT9JDBGo00ulVv1uA6WMKBP5RBPVu5bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/d2tfedavxgnVfuJzgM0JQ1eHqSeJuPJ2nJkWpAvMxULr+Xqn0lPfpFRtVNGJxoJsDuEVhEMXgaetd76BYahJN2sTNM4FCDIgszuZ7lNPxbnDIJ1Lws2pOmTvK83EaHlh7hwofxSJL528lamKBafp1iAZNnxQavMilufCFOkx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D3A86340F28;
	Wed, 12 Nov 2025 06:39:32 +0000 (UTC)
Date: Wed, 12 Nov 2025 14:39:25 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4 0/2] riscv: spacemit: initial support for OrangePi R2S
Message-ID: <20251112063925-GYE1677982@gentoo.org>
References: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>

Hi Michael,

On 04:44 Wed 12 Nov     , michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> This adds initial support for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is identical in die
> and package to the SpacemiT K1 SoC [2].
> 
> What makes this board attractive is its 4 Ethernet ports
> (2 x Gigagit RGMII with an external Motorcomm YT8531C PHY,
> and 2 x 2.5 Gigabit Ethernet with RTL8125BG on an internal
> PCI Express bus), its small form factor and its attractive
> pricing like other OrangePi boards.
> 
> What is supported:
> - Serial console on serial UART
> - 8 GB eMMC
> - 2x Gigabit RGMII Ethernet ports
> 
> This patch series is based on Spacemit's Linux tree,
> "linux-for-next" branch [3]
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Link: https://github.com/spacemit-com/linux/commits/k1/dt-for-next [3]
> 
for the series

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
