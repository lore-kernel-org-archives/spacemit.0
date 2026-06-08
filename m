Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DC228314C
	for <spacemit@lists.linux.dev>; Mon,  8 Jun 2026 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881733; cv=none; b=CFHJ6otqNuY6k8i5MQXobbJcWRyAE5/m+wv/Te+xwJVXY4ny1lF7NtoQ/RBZGDUTUqEKjjLUYHUNe8gdbfGQmH/Ssky7t9W9kGzjqwS3Vj0KL4OHNdprg35HjwDBVbJtI81w7JS8KoP265IgxeL7Li2n+K5akw7mTaxunwxYKbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881733; c=relaxed/simple;
	bh=PbSvqMhVr6e7+GrmcxvpNhuF3dSAdV4agmcx5JiYVvM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ywk69mLj/qASuepBaCV+SWhvw3hrecD78ViYXKVRHOZ1njTikJz4L4nnWtGeEfskOWe8iEHu9fchQlx3lheL2sftp4s1x3MWkfibrMsNUTm8EijEJe8DPZl2prCHvrTUO0/U7HGECdQGN5TtvTfnWavSPmKlIXpZjI9MF/pWUmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CA+q6FXi; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CA+q6FXi"
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780881730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96KtDTogFLQcqNpJ1tNB2dZyyE30C3Sd5kqsXZAmqvk=;
	b=CA+q6FXiJFlJAxwgb+M1iN4Q+TVJsUXxoBZRyopR7hwZcOc7SQyXN8B5NlVhkT7RbEh1ry
	z11kILWKwNcfojiY0pF3yBPlAmPa1ooIQ6YoCJWJzSIIEHk3C3eIX7fL8J8T3yoHBcrwIh
	GExbygnctX0vFikpM6tUMerHxPlsHzQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:22:03 +0800
Message-Id: <DJ39VTKU26KY.108UFYXIALHBC@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Anirudh Srinivasan"
 <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
In-Reply-To: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 29, 2026 at 7:41 PM CST, Troy Mitchell wrote:
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
> For non-coherent hardware, a bounce buffer is still mandatory for
> cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
> Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to allocating
> from low memory, which fails completely when DRAM only exists in high
> memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator is
> permitted to allocate this alignment buffer from high memory.
>
> With this patch, systems with non-coherent DMA and DRAM entirely above
> 4GB can successfully map the software IO TLB in high memory and boot
> normally.
>
> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
Just a gentle ping on this series.=20

Please let me know if anyone has any feedback or if there is anything=20
I should update.

                                  - Troy
