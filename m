Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4471D63E4;
	Tue, 25 Aug 2026 23:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787699248; cv=none; b=Tx/sKShAwqmMJ0uj2s16ojm6KTDrpvOVTTucEZpxqoJV0nyH3y3hLM9TkuLhkdxmdkfrKVV2lxOdguzhE6NUjsbVrYt7tBm7dC3drsdZjsAnSev+yu5GNNlfYxuldqVtyWm+7hwEzWfdwkOGsxpRWw/G/pnbjr7NeyUPyH2AMSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787699248; c=relaxed/simple;
	bh=evWoMKULBAHiuvaQIzVgeqhMMo+uevQAZ4vIK3t7WF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs32eqYwGph1bOAgEwY40BgJM5AtZjCm+XzJlwfmKXxjML5XM7QetHf4T3cFZ6l78FV3uJpmkET4CpZXFQ45eiOAMfO7xxkB9bWm89sft51i+RUreVO15AM3+fNL+k/s9lXt3yXNNb8WdQY1hMylQZiBriwGEwx16IMtHxYQ0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8+ZVnOC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8+ZVnOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AB91F000E9;
	Tue, 25 Aug 2026 23:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787699247;
	bh=1T+yqlLfjZvb7tE/yxSJSdtLanULbQSxCY7Q0MzmI+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b8+ZVnOCbBQxI1XWH6g96OTUS3SSgIkNzk2zPh+wdtROmGeIW2WEEpV2usbXzthg1
	 JMXrAEU/9jUyQ/0DImtguD17Sxr1w9elFP+WAkG6Ja5/XSri5B+xUwbbpYSGoW/X87
	 ERmbCq0z+XrDNwf7RHtsT4ifBthtQm1cltWMcRRSc7Kg66wmFtsv2bwsIQHf5RqYmt
	 VnX9OXTPpdsecFpXNig9/A53poNBjZT/sMaFF7QxoZXGbbZgvrL9/tKtk6PN3HJ3Xb
	 NUP+4ZdF7NC7yQb4CedTcaX4rUk3dW77KK0A5J9hDWuOTbj2ICoZpp/uOJi4kli2Sy
	 KDeVEPJBGPumw==
Date: Tue, 25 Aug 2026 23:07:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huang.ze@linux.dev>, Alex Elder <elder@riscstar.com>,
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] phy: spacemit: fix and enable the K1 USB 2.0 PHY
Message-ID: <20260825230724-GKF631715@kernel.org>
References: <20260825065007.69353-1-bbanelli@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>

Hi Bruno,

On 08:50 Tue 25 Aug     , Bruno Banelli wrote:
> v1 was a single patch adding "default ARCH_SPACEMIT" to
> PHY_SPACEMIT_K1_USB2.  Automated review pointed out two pre-existing
> Kconfig problems in the same entry, and that change makes them easier
> to hit: enabling the symbol by default means configurations that would
> previously have left it off will now build the driver.
> 
> So fix the dependencies first, then enable it by default.
> 
> Both were verified against the driver source: phy-k1-usb2.c calls
> devm_platform_ioremap_resource() and devm_regmap_init_mmio(), while the
> Kconfig entry has neither "depends on HAS_IOMEM" nor
> "select REGMAP_MMIO".  PHY_SPACEMIT_K1_PCIE, directly above it in the
> same file, already has the HAS_IOMEM dependency.
> 
> Tested on a Milk-V Jupiter (SpacemiT M1) running mainline 7.2: without
> patch 2/2 a "make defconfig" kernel has no USB at all, because
> dwc3-generic-plat cannot get its PHY.
> 
> v1: https://lore.kernel.org/linux-riscv/20260825052158.66367-1-bbanelli@gmail.com/
> 
> Changes in v2:
>  - new patch 1/2 adding "depends on HAS_IOMEM" and "select REGMAP_MMIO",
>    with a Fixes: tag
>  - no change to the patch now numbered 2/2
> 
Thanks for this v2
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
