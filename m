Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99B2EFD89
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073668; cv=none; b=Zqi6Uzmfxh9R4IzRXTRkzS4Y9nFV5pvrwELKWBP/RZCOc3wBfFxggYDQpBSpmiua7kljd14CE40zk9SskD2iaOlfILCMzQ3BFjLISswwq7wz05SraGaEj5T68GYqzWb1gGkOMc0R8AlDbcNKmK5LcZyiVk0NxUZ577d9W2WB1uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073668; c=relaxed/simple;
	bh=8grarISrrran4HsmVRztqDZfJzOAy0nLtF3rxQKJvkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIEop8uvx4x3A0q5kEW7F3IEb4l7DA8JhmzUH0gAecav0WhEve9rI16S8BRkEAM9ptYr/oZkjUQXuaGhE5gZb5RoP3+iFDRtLU6V2QrEBZ3vrdwOB9w+qyz4qxnMTHzg1TyNCyofU2edTinndcx/6tYpvE1w2IVo80LOGR+SbMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=avm+WqjA; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="avm+WqjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755073570;
	bh=zJ0hZ2py5pjtVoXQv0PDAz0XznKZrLsvelnbnYWAbCk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=avm+WqjAeOe8vX+Nx9VA9fzl0v8H7vQ6jFdEe4/zHJXv+FDa1x0/CssHz2ffYplFX
	 WWMGwZFTIeZgEmjWhLaFs7/SmEn3bnaKiw2XFQRo93J8wBYiTIjCNzTCBUkza4FXLI
	 i3nEPFOmhWmBkMsYmWR4/jRGFahA4H/gjX95oMPY=
X-QQ-mid: zesmtpsz6t1755073566t0d2cf4d6
X-QQ-Originating-IP: ehoTC6TvF9jhdhuMPH9TGp/slVsmOkyosadz0faF+GE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 13 Aug 2025 16:26:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8202150046870958779
EX-QQ-RecipientCnt: 20
Date: Wed, 13 Aug 2025 16:26:04 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Guodong Xu <guodong@riscstar.com>, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Message-ID: <268633D49B18C3E7+aJxMHPhItPq9ioto@LT-Guozexi>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ND42uzdxTIzrasBiYskI7YFsfAFqaS6bMzVEAUdaGis6CKaY6PR2S6Cv
	9zoQ6VD3TN5bNZbUG0k+Ae96q5gg9gRK6lvQRnEQ6XlhZBU7HWa7Hw8mvi6QKNJUJ/ZK+/Y
	VXJN4pBvg+2qXQAFqD00wTCKZX9HpoqE/iNF08laTqkFwiTRJuxiSUFbb/LTGABVKN5k5il
	Q0JCurAvs/R8dsxVRVQg4WhLLwtjEpoxtET218BS/LQrRazWu79BDnzOsQz6kSda84awsGh
	DLzb9IgEmWPkw24wgAhjf7XUVm5nkC0IacV36MVGgzvUpap6hVftviksq/VySJ61Zdudbu4
	28NPYUFcG9kJW3aaLvIe9AlzhyZA3ERJelcamEIzE8fXWFNofofg5Ix0XFLlxfhLv9aT5by
	gcnw8ovTUUOPcsoXA8rGX24kC9w5M9YOuo6ZaxYqaO+DgFUHQ/R3WSiu6VkdzoWQmestTGH
	BmFThxxLfRUbjctR4z6g9PtxsTD9pWLFQRlkDw/aVDKNpvFnhgtitAEuSDiUrB4Q651RYMn
	L9hGLjjJZ58maYOocxMKHXj+vOiqAQnBctzNCHK7G2tmblW+4hHs4JXJYKaraU2x2FvFo8M
	RFOr/hYcQodYfd08V4yZ6Ee5oXLKRGhHLSinvsmZx3G5wWvmuV9qi4R1Wg3aiLX3UjL8JOa
	xYtTXCYLmlxJnSBZtER/OXUfLxs2yjVRNvDxR8Q2XWJ70pfO7BSD4tnVFOvLlyMrsmZuCwS
	hsQRGrlHtj33jq7cwo89MbFoLhrp2YBWcsoPldWo79TQyvRe3D3TgE+pwvCEabAko7KwAFB
	rsFh9OkNT4aQsv7d3K2I9loecpLDN7kCLwlTEbL4ip2L1fQstvb5O0ZhmkGnW0WWvmD3cWo
	qw7PQ7XKK0yquqTAdBDOofOQgYgKtwT6284eslAYIduyteXrsQMviPN9uVAGu1ErMav8MRN
	EpFnlSoFmQLNy4SJbvqov0NCXWxBNeQkSNYPoqyodK/ixLfKzlGa+NO3j++JEwJ3XIbV1QE
	975GbqXYugICPBdjRsZvIwHLlo2BtAklMwOJIioYhfb5OLpCcl9tyaZd0VA5TWoQuKtHg0/
	w==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Hi Guodong, thanks for your patches!

I have tested it using i2s and dma-tetst.

Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

                - Troy

On Mon, Jul 14, 2025 at 05:39:27PM +0800, Guodong Xu wrote:
> This patchset adds support for SpacemiT K1 PDMA controller to the existing
> mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
> but extends it with 64-bit addressing capabilities through LPAE (Long
> Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
> DSADRH and DTADRH).
> 
> In v3, the major change is creating a separate yaml binding schema for
> SpacemiT K1 PDMA, per Krzysztof's suggestion. By doing this, the binding
> schema got simplified a lot. Deprecated property (ie. #dma-channels) and
> unused values for backward compatibility (#dma-cells const 2) can be
> removed.
> 
> Other changes involve placing pdma0 node in k1.dtsi and in board specific
> dts files with proper ordering.
> 
> The patchset has been tested on BananaPi F3 board.
> 
> This patchset is based on SpacemiT linux (for-next) [1] with Patch 8
> depending on:
> - riscv: defconfig: run savedefconfig to reorder it
>     It has been merged into riscv/linux.git (for-next)
>     Link: https://git.kernel.org/riscv/c/d958097bdf88
> 
> [1] https://github.com/spacemit-com/linux.git (for-next)
> 
> All of these patches are available here:
> https://github.com/docularxu/linux/tree/working_dma_0714_v3
> 
> Changes in v3:
> - Created separated yaml binding for Spacemit K1 PDMA controller
> - Updated pdma0 node properties according to the new yaml binding
> - Put pdma0 node in k1.dtsi according to its device address
> - Put pdma0 node in board dts files according to alphabetic order
> 
> Link to v2:
> https://lore.kernel.org/r/20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com
> 
> Changes in v2:
> - Tag the series as "damengine".
> - Used more specific compatible string "spacemit,k1-pdma"
> - Enhanced DT bindings with conditional constraints:
>    - clocks/resets properties only required for SpacemiT K1
>    - #dma-cells set to 2 for marvell,pdma-1.0 and spacemit,k1-pdma
>    - #dma-cells set to 1 for other variants
> - Split mmp_pdma driver changes per maintainer feedback:
>    - First patch (4/8) adds ops abstraction layer and 32-bit support
>    - Second patch (5/8) adds K1-specific 64-bit support
> - Merged Kconfig changes into the dmaengine: mmp_pdma driver patch (5/8)
> - Enabled pdma0 on both BPI-F3 and Milk-V Jupiter
> 
> Link to v1:
> https://lore.kernel.org/all/20250611125723.181711-1-guodong@riscstar.com/
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> Guodong Xu (8):
>       dt-bindings: dma: Add SpacemiT K1 PDMA controller
>       dmaengine: mmp_pdma: Add optional clock support
>       dmaengine: mmp_pdma: Add optional reset controller support
>       dmaengine: mmp_pdma: Add operations structure for controller abstraction
>       dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
>       riscv: dts: spacemit: Add PDMA0 node for K1 SoC
>       riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3 and Milkv Jupiter
>       riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC
> 
>  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  68 +++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  11 +
>  arch/riscv/configs/defconfig                       |   1 +
>  drivers/dma/Kconfig                                |   2 +-
>  drivers/dma/mmp_pdma.c                             | 281 ++++++++++++++++++---
>  7 files changed, 339 insertions(+), 32 deletions(-)
> ---
> base-commit: 6be7a5a768aafcb07d177bd2ae36ab84e4e0acde
> change-id: 20250701-working_dma_0701_v2-7d2cf506aad7
> prerequisite-change-id: 20250611-01-riscv-defconfig-7f90f73d283d:v1
> prerequisite-patch-id: 53bda77e089023a09152a7d5403e1a738355c5d3
> 
> Best regards,
> -- 
> Guodong Xu <guodong@riscstar.com>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
