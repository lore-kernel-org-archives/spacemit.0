Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD833C18E;
	Wed, 29 Jul 2026 17:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345630; cv=none; b=ItolE/GkWUkjDSPz38vINuVgB45XkSimZ11V2ExSP5Bx5IUizfANd4471QlXHMGaM38mOtb0WllK5VTGlB7/hjFXntUxJI8oFMOyWOzth/L1Db1fpCvalbjvKNPpc4ARejKrb233JjnfxlVMj+O5Gn3qN/awRt9XqkkwLZWt8rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345630; c=relaxed/simple;
	bh=XMMiTmUZGXJKCI9DY3EC2RFLBsbWb8oMtDrWgZaZFD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXO6YIXX1/nSheEHYJuwSBMR8M8+Xt4rixsvIbViB4fg4Ce+96hOSSBMAtG6EjBK2hFXcX4iWgHt8e9Hwejz1muTa75B0eugLt3ybvXmt15EUlpLSCb6MeThC8OTyIHRPjKsCtd74TAHwgyi3LtK9v8UUXM2+BVVxV4jh/jecyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RV0wWywd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RV0wWywd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A753B1F000E9;
	Wed, 29 Jul 2026 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345628;
	bh=6LmnnzmtLruyVMKB+f0uEMK6JgvjHc+y3ZREpchl5Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RV0wWywd1X4OPHJtdaaPb0FhKGMCVJdvDj+ycBLEvlAFiaqzMybzOe+wIsD6HnOzx
	 s20+tp50W+A6bJkyGuo1nlEOrmmqaatwTCm8WbFi25BERlqqXlbRnWJqlXC+vJJrgq
	 Z0ofCpzBPLrrtPxi8FsQCz3Q1oPZzeKNwU0/yGBmy7Hm5oB5Rt9FQzbMFaMuZbpuag
	 bJjLavjpzauGcznxqkEKnRCsHbwKCnQMjg6UkKjoFRKchovd9CN72ubPTLfumU+Y9j
	 0JC8HqPCizIx1xMvpnp6aiYo/SRDZmjMzx/6/F/t+GZw+zTSAypzxAkQ5Vk5pvJ45m
	 BNmmPF+LmIdFA==
Date: Wed, 29 Jul 2026 10:20:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v3] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
Message-ID: <amo2W_XZDiJ_2sLg@thelio>
References: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>

On Mon, Jul 27, 2026 at 01:08:44AM -0700, Troy Mitchell wrote:
> On RISC-V platforms where the entire physical memory (DRAM) resides
> above the 32-bit address space (i.e., above dma32_phys_limit), the
> current SWIOTLB initialization logic fails.
> 
> This patch addresses two interconnected issues on such platforms:
> 
> 1. Incorrect 32-bit DMA bounce assumption:
> The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
> that a 32-bit DMA bounce buffer is required simply because the maximum
> PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
> no memory exists below the limit to satisfy this allocation. Fix
> this by adding a check to ensure `memblock_start_of_DRAM()` is actually
> below the 32-bit limit before enforcing 32-bit SWIOTLB.
> 
> 2. kmalloc() bounce buffer allocation failure on non-coherent systems:
> For non-coherent DMA, kmalloc() buffers whose sizes are not
> cache-line-aligned still require bouncing, even if 32-bit DMA bouncing
> is skipped. Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to
> allocating from low memory, which fails completely when DRAM only exists
> in high memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator
> is permitted to allocate this bounce buffer from high memory.
> 
> With this patch, systems with non-coherent DMA and DRAM entirely above
> 4GB can successfully map the software IO TLB in high memory and boot
> normally.
> 
> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
> Changes in v3:
> - clarify when kmalloc() buffers require bouncing for non-coherent DMA
> - Link to v2: https://patch.msgid.link/20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev
> 
> Changes in v2:
> - add Anirudh's TB tag
> - Link to v1: https://lore.kernel.org/r/20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev

Maybe fixes tag should be added like this?

Fixes: dcb2743d1e70 ("riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required")

Aside from that, LGTM and resolves the issue for Linux running on the
X280 clusters in the Tenstorrent Blackhole.

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks,
Drew
