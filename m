Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D411624C5;
	Mon, 20 Jul 2026 00:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784508926; cv=none; b=HRcEupSN0VNIQ/sQkUwhmtcu+yR4EZQyOcUQdsoNPCMaeFsqctesnzZdhzRLb1ANAJnBlrvCZJqk+pGiIflvK68HU8mOuuoTNmNJ2T5ryXTB4jxNGP4QgA4JccHD/wpHXS/7vXLa98hpb2c3Dy7/zL7EErXdWu22ZwmtvihK/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784508926; c=relaxed/simple;
	bh=mtLmkDnoKQq4lAugeI4zBYGpzynIwRxN65WgPpsBjbg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rlyhoAVXn0kFNWPumkQ1ZEJvAsviJHVY3BnucFP0kCebidc3JZd8odXFJvyM3RPkmHjYh+9lfm664MPsrTOhoU0Dhm3r3GFnNRm3+leBzgcCJHzUPcfbw5Ux8YLk6hRtZv5IDOpXiwvLPnEb7vVa1VheHB7X9PcOTPGbpaLHwu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/hsmzbi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/hsmzbi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB59D1F000E9;
	Mon, 20 Jul 2026 00:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784508924;
	bh=6FORciyG6Vd4Eh6Cevu68EC2EKSfE2RGPv8J07wCaTA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=e/hsmzbibPlGivlD9v+Mn7imFbMKMaa3xGlB/qZpnnbnoMPul+Dlu7jSG6MkT4G7y
	 YFXVNsJwE6/VTCRupTJjJDXFvyHDyjOyzoLZ3I1iN9w1YG3ASPrApbgT5URN6rC5fA
	 5Jn3hy/dliwZkv3ZqhWtlAryrQUOBMAwAeuFlPf4xh33lcTmUfcScw0AbnlYJNco4P
	 zp49SfMXAnIqgv58DC5W8vjOPtAHpUO++dD566Q4okE22aA3+PyEDx0mU/bOPRkVfT
	 zKo1DZ8rVWp0jKQWaKdp1DTPW1uRxlG/t3Ax6zura7HmtqdSAPcp0AE99wqC0tmOfX
	 8qDglgVXBjb+w==
Date: Sun, 19 Jul 2026 18:55:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
    Troy Mitchell <troy.mitchell@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    spacemit@lists.linux.dev
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
In-Reply-To: <k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng>
Message-ID: <57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev> <k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Troy, Anirudh,

a few questions - 

On Tue, 14 Jul 2026, Anirudh Srinivasan wrote:

> On Wed, Apr 29, 2026 at 07:41:54PM +0800, Troy Mitchell wrote:
> > On RISC-V platforms where the entire physical memory (DRAM) resides
> > above the 32-bit address space (i.e., above dma32_phys_limit), the
> > current SWIOTLB initialization logic fails.

Is this primarily for the SpacemiT K3?  Or are there other 
platforms that this fixes?

> > This patch addresses two interconnected issues on such platforms:
> > 
> > 1. Incorrect 32-bit DMA bounce assumption:
> > The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
> > that a 32-bit DMA bounce buffer is required simply because the maximum
> > PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
> > no memory exists below the limit to satisfy this allocation. Fix
> > this by adding a check to ensure `memblock_start_of_DRAM()` is actually
> > below the 32-bit limit before enforcing 32-bit SWIOTLB.
> > 
> > 2. kmalloc() bounce buffer allocation failure on non-coherent systems:
> > For non-coherent hardware, a bounce buffer is still mandatory for
> > cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.

I'm not sure I'm parsing this correctly.  Shouldn't this read "for 
*non*-cache-aligned kmalloc()" ?  Or am I missing the point?


- Paul
