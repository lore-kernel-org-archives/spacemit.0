Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22B9318B9C;
	Fri, 27 Mar 2026 02:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577450; cv=none; b=BB06iudiQI7+EutPzAWsau0aiZvufNiOXKoMf77gpYw2S3owfvPvVhcjQq46dE8AUEi+v8F2Fs/HJYbPktADre9jyKJ88qK0M2aG/UsKUEAhOCZ/ikHyjGCxpz7nj3gE6wyIvby05nPhXuNpR9VOmedYvCslmUKhMU1LJSOHJ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577450; c=relaxed/simple;
	bh=g3K/wWR4NJgBsH5J5owDkOKJHzgOmJR8mhDzRqhQRlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQvX15k8ThoDhk5S1fqUSeolJp1kHSurO4qUpBjw+Q6X/n1FfktiXxmhd5cKnfn+ZdGsoKcluBgrx5+eQgV53J620UM1onuazBDMdhSDhLxUeTv+dKWHmlFf1rzhPRHl3KqiyBEDYWQdLnmN9EDiDvMbXul1OBM/yVjeHLD2OVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+0AvfXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+0AvfXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1880AC116C6;
	Fri, 27 Mar 2026 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774577450;
	bh=g3K/wWR4NJgBsH5J5owDkOKJHzgOmJR8mhDzRqhQRlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+0AvfXJQ6wsU8AVVMeQihLkNJKViufO0RgrxoYG9/YJ9cNylayM4J9E9vLJlp/7G
	 z7Dp1Hf0aRXHTw9OUsCuOj6maWFRK1ooNJC87LbMLXtGs8l6RBz9LmkowKM/DYLlkg
	 rpmn/B7Yo9iZRmD58V75xiXGHDtGBFHPbTNXlmiAnBQMh0tHLPPYs0IiI/uNtXShz0
	 eF5r8DnDH2Es2lcn0JnD62AtIhkJC0w3WQOEkCRwqmV3tricHfPIkD/Y7alpAiN8Qe
	 k0UTFhmv/WYGeEKo32kxCRu0C5thztFX1pyri5h/4pNRtA6ycsDqCHMw+Fys649jDT
	 Uw5aAcRuelX8A==
Date: Fri, 27 Mar 2026 10:10:48 +0800
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 0/6] riscv: dts: spacemit: enable more devices on
 Milk-V Jupiter
Message-ID: <20260327021048-GKA881551@kernel.org>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>

Hi Aurelien,

On 19:35 Thu 26 Mar     , Aurelien Jarno wrote:
> This patchset improves support of the Milk-V Jupiter board by enabling
> more devices. Most notably the NOR flash (useful for upgrading the
> bootloader), the USB 3 ports and the PCIe ports.
> 
> It was inspired by the Banana Pi F3 device tree file. It is based
> against the k1/dt-for-next branch and does not have any other
> dependency.
> 
> 
> Changes between version 1 and version 2:
>  - Collect Reviewed-by:
>  - Remove bootph-pre-ram property from SPI NOR flash
>  - Mention that the fast read opcodes is marked as supported in the SPI NOR flash datasheet
>  - Fix typo in the description of patch 6
> 
> Version 1 of this series is available here:
>   https://lore.kernel.org/lkml/20260322203356.2206927-1-aurelien@aurel32.net
> 
> 
> Aurelien Jarno (6):
>   riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
>   riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
>   riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
>   riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
>   riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
>   riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

For the series

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
