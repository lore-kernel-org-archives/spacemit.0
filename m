Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB2351C2E;
	Wed, 20 May 2026 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265277; cv=none; b=Ws4UfwyH/l+HCLIz5K8FvkE3nh1KwV10WjD44y4a54Cw/xYb25023/7dB7VyqMe0/sypptdqwN/YRnRTY28s99/0IE1TeMx0r9dUJ3ZEAcdo0WykPlXepor8yu88ZuYHI6sAFjL6pHCCewApp/7mvTSSwWcPG7ZNzgXqWJA3o40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265277; c=relaxed/simple;
	bh=SpnVTrdCw4sV7tR53B1L5ddp+RIehJ6MqGOdXClbhUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZysavtJTYuTdOwADu5WoJbEVBUrg4FvlWVWwFB/qW3MA6HaJRr/5LMeK4ZPhWrjMqyLqsxF7RyGWVWfsCx+0yJuhwvds10TuxO6v5FDdDBVsRcF2L56aezwjWZxpnCz/zSu2J0eoWeXpebDujwDQ2TFoElybrJ+6M/4Q7evS1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUbvHMcy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUbvHMcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20691F000E9;
	Wed, 20 May 2026 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779265276;
	bh=Po3Z5+mOkTPLwxcG4O1YIvwMOZN8HACWf+P1iZYwYdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UUbvHMcyacHh2278Tx93WTf0EVpJu0QoLk3ddNYshHlawJfwzsM3vKUKzCEp6oYAE
	 Qa39lSKeUiQuAYbWRx+GEwwPbRH2OjBJelDAF9P+gBQRgIAUSGDSGCN2WPxGLLbYM3
	 2Atlx5f8tObEi0xhjyk4WaU8acipCKE0pTsPk2d2P9Q8WFbdq1/2lSQ3e4VzzT8qrz
	 G7IiRS3hFIPpMiA9BMSXV0w+3Zbycx7OG7JcWrSqdbkcPayn+/pywkfA3N3mhH64UC
	 Ym4IqA/eatExsTRQVzbEXA/MWeB7LqioV8TAd4NERCajtoeHrsRgDFetSflx3dhbj5
	 Y0NanhEn3GEcQ==
Date: Wed, 20 May 2026 08:21:12 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 0/5] riscv: dts: spacemit: improve Milk-V Jupiter
 device tree
Message-ID: <20260520082112-GKA3717228@kernel.org>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>

Hi Aurelien, 

On 06:12 Tue 19 May     , Aurelien Jarno wrote:
> This patchset updates the Milk-V Jupiter device tree to align with the
> changes recently done for other SpacemiT K1 based boards, including
> enabling SD card support.
> 
> Changes in v2:
> - Rebase on linux-next, which includes the SD card support series for
>   the K1 SoC
> - Mark the eMMC as non-removable
> - Add patch to fix uboot partition offset
> - Link to v1: https://lore.kernel.org/linux-riscv/20260514160356.1642075-1-aurelien@aurel32.net/
> 
Looks good to me, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

> Aurelien Jarno (5):
>   riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
>   riscv: dts: spacemit: sort aliases on Milk-V Jupiter
>   riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
>   riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
>   riscv: dts: spacemit: fix uboot partition offset on Milk-V Jupiter
> 
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)
