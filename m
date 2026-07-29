Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6E3955F5;
	Wed, 29 Jul 2026 17:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347180; cv=none; b=EsRh98+uuODJL31t1oWzgSHaDkEp2dDQWpO2En1+GUmgRkT5KoT/HSNCEVUUZLsxXduS/hK105BtEIeUuITuh3CypRc75p0zgghH7Sjcn4SzGO0hDqpmkouD3tIooh4jdskye/LDzzHW9+pAzO0qfUu/xo7H4de2+U+jnMQ+7qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347180; c=relaxed/simple;
	bh=J9d5AgOvb2GC7/9GAPOtQganKRMmPTEwV8zpFRnsm+M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Td6iDt5uiJYUWdnOKMK73y1Mar8RAqVsqkiA+pjafaDWgBhaYPWM6lSMMI7Bjyu8DvGFXNzMwc383aEjgJiNfVGF9ZmYcPFjJena/TGcK6oYOPhqpRJ+OrefVlh9+VkkNW5MubucpyWwPQODXwrnpPxGyoWPrH+XSOn+KVJx/Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfNmUtNJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfNmUtNJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DF01F000E9;
	Wed, 29 Jul 2026 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785347169;
	bh=j+KzCNqLy3yQ1eL2PsZviAGvITLUBt7YOwZ4tNjmMAQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CfNmUtNJ3MZg0Ge/qrtlWqVG/M33BQfXPeRo4HZM7k8kgihZpG0DzTq+GJUSylxdx
	 g2yZ4x/pcRI5tJ2EPfq1Sx8nmOoP1ZSHORa2swwi0n48ahIvsS1Xju1ih+nUoDr5EL
	 kXVEwVrzh5Wpyrw/WOC+FRevQIkIFPNnupm123GwdeOtjGZEJoExAWIRDfLnhPhAHB
	 cBo8MK0PWCds3qhpoduVNkareSZclZgTjZ1HvGgTXEbxjNJBYXa8MIb+GNLS2LsqRh
	 4/GjSjqR6hTqKkcdkGHve+sir2tXpgKnGHeoP0owSKBFYUZrZ+d3qGA8kiBfDMbYjD
	 OBTWEXfiyWypA==
Date: Wed, 29 Jul 2026 11:46:06 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    spacemit@lists.linux.dev, 
    Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v3] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
In-Reply-To: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>
Message-ID: <0189bbe2-2aab-4d1d-1424-f83f5d1fb007@kernel.org>
References: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Jul 2026, Troy Mitchell wrote:

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

Thanks, queued for v7.2-rc.


- Paul
