Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20143D9041;
	Tue, 25 Aug 2026 22:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696874; cv=none; b=RkbXUb1uoNA5xUDd1FBxjWBMcb25b5JVRsdSyMeq5jB9oP/tlcXpZzbYBrPPP06zHMqXB7xbohWkJQPMnXemeL1/ymBFqSCAS8EU578U3+9PSiIrGpnoNckxhc2UgOdpKuBtxIT1l8gfQeQP9hOUpxTqykntRvMX101jt9ewxGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696874; c=relaxed/simple;
	bh=CAtT2kKYJt9xqWoxNLuxgQVFci716ZOZ/rwt2cVBCi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rStVRqL0MxzhlyvQ7IjA9xT8GOT2SifxvhtE/JoNAxFQsw3//t7TpZfWsZz+iq1T5J7elRCpnq49a1Tpum9FbvP3wYhUP1ItLChm9RjxdXFHQuVpwKYAugW/HHLEYWSHQDGVcuKN1lYAIPK5AfaaZHk69RDzpoUC7TbKHDQoEB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxLCwTlo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxLCwTlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FEF1F000E9;
	Tue, 25 Aug 2026 22:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787696872;
	bh=23zDuFbp1Nf4XV/PnWdKgzGKEz+YbDJhZVzaG+CUuVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YxLCwTlo0rpEB7nZlQubsGWLQTi57rYYTY3iZu6GHt0w8Gz8+7X27lU2mfC9Bi68J
	 Hy0oiNleAj1gxYtdYI8N6zq+THAdjiTRc14/81hrdkhv6R0BZzJBSdo3ykSGZf8T8Q
	 Bwslvb0eTkJTZ8X0EfAvCE1arDtgTrPr5RycdZygZK1x3AHi36gebHzkAoiiVW931q
	 Z+vLP+usQa4AQC/7d+NBXb5sQeqJjkINJbxLRJLrdBKv/i3Rg87xfqA6OOXfoV5LMq
	 MTxknVS/40HI9lPkxHAMIz9POmDoZ44WvBfJqzKH09Q/eCLAMgW41sUEdpRtImD2V1
	 SdnEfWwkXxkCw==
Date: Tue, 25 Aug 2026 22:27:50 +0000
From: Yixun Lan <dlan@kernel.org>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huang.ze@linux.dev>, Alex Elder <elder@riscstar.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: spacemit: enable K1 USB 2.0 PHY by default on
 ARCH_SPACEMIT
Message-ID: <20260825222750-GKB631715@kernel.org>
References: <20260825052158.66367-1-bbanelli@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825052158.66367-1-bbanelli@gmail.com>

Hi Bruno,

On 07:21 Tue 25 Aug     , Bruno Banelli wrote:
> PHY_SPACEMIT_K1_PCIE has "default ARCH_SPACEMIT", but
> PHY_SPACEMIT_K1_USB2, twelve lines below it in the same file, does not.
> Since the symbol is also absent from arch/riscv/configs/defconfig, a
> plain "make defconfig" build for a SpacemiT K1 board ends up with the
> USB 2.0 PHY driver disabled.
> 
> dwc3-generic-plat needs that PHY, so the result is a kernel with no
> working USB at all on boards such as the Milk-V Jupiter, where all four
> USB 3.0 type-A ports hang off the single dwc3 controller.
> 
> Give it the same default as its sibling.
> 
> Signed-off-by: Bruno Banelli <bbanelli@gmail.com>

Looks good to me
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
