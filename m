Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167E2264B0
	for <spacemit@lists.linux.dev>; Sat,  4 Apr 2026 02:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775268274; cv=none; b=FrPtN6Nq50qYrjp4hNs5FU0Wi/kgn2lBPm84kPQ3FOJfWETT9a5q3dAZHML2EkTIUiOf9FY57UYwEzJzoUiZbKlBSLNzquEiMtB9+c73XvkI/Xrmio/UwVq1jB3dCc5xIXyaVGMuj+B5L86sgD4kU+u/a/1KCdGn14LMpuzOPFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775268274; c=relaxed/simple;
	bh=Stf1OK+UYwC4E5fstcRMlG1761VOQPvcXXwCwiZEX70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPCxGQabEB46ALUxec8PrOAzL3lJSgWR297HUN2BmpmDdefgK43PHNG++OgEpl1Me6YY8q/CQ9y4Dnewp4UxU+bBpL6Yn/4ZiJXu63khHy7+fCndMzmUAStn8UAJhqWGg5oQD+kn8t/DEl728pTIITpBhGvoWe+hvrvUsE98ya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=RaqW/+C9; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="RaqW/+C9"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dbcd92eda5so104570a34.2
        for <spacemit@lists.linux.dev>; Fri, 03 Apr 2026 19:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1775268270; x=1775873070; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QFX1dhDieBRaAm9qJ2639rNkR3TjfczoXLEWvV+mu0Y=;
        b=RaqW/+C9J3x+C47rYc3rm/E8XqFSwtQFQSGPHK2b80UjwyJcT5d41pnjPwT1eV5rIG
         0bm1FFafJnmRGFdyioxe+rW2rfMbHKstA9udI4RVvVTzlMYvZ7R+j6eawa0BU91ec4th
         ORKb/luRy9+QM3W2W9MtgyWA4KT6i121z7Yw49WDvZenShHgsEP80kVTp91I3rltTy7i
         gK4cln1CHha4ArMVmv3azFNgy1vq8OmnqcdyafNAkf315rXvAJutaKwwinuRBjxDhP3I
         aLYn1hZaQocc2VB8Sm7RzSTh9xNrcvowx4xncPcDUIhMgG4LFnaPR6AiC0IDbdvZ5XZZ
         HF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775268270; x=1775873070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFX1dhDieBRaAm9qJ2639rNkR3TjfczoXLEWvV+mu0Y=;
        b=lKN8YYfd2HOQ3ZiAWIFXgwlvTz0eB/jRe7bF3uP5HFpiXm/h/Jr4bEkfXowiYRxpEs
         A8ONabzJvS8s33V6Kj+8QSj/1V1Z82J0oRqzbEdadMO/zquPVPZ53DhY9ruLNw0Xa45P
         4itf+BQO1yYHOuWPrAtQmJ1q1qjY/mpzOIQQybJrNQJxx/qIgJAPtGn6wS6800XXipT6
         QqvtBWQZUVF4VSmHhoJZ9K2nlEK4G5DeUbCAxuKycEriKsVL79WfFA1ePjvdY9LZWBlS
         Ic8n5A3vth/yTHFAmntyRU3LKayZR6nYlaNqHVqz/l5b9YH78XvVypf9Hq9KvOuTUaS2
         EBfg==
X-Forwarded-Encrypted: i=1; AJvYcCVHwbc3IV3MJ3jMrTlIR9bgRLbWYGO5Ei4RvGSsfbGm4qABDo08ICWKNLKHSfUfF9F9Gpz5k1LbJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqF+tyYxbRYbikZrFnQMph7sNpMy7nYdUe0SrWWQX65XisjCeT
	AOCgJZT0iK/Tm1o8dXs04/AlfLkPYbYIrcIt8BWKfUuqgOG3CxqEw4HvxNI3akSMq4E=
X-Gm-Gg: ATEYQzwCOeDmHVn6GedozzG6mMNGaGZeHfaOE5wyQ+hXIgyz/BCGzBf82ygiw3ywU1K
	aVgciU5fesCHSKHoUT8F7MTwdMuTWfCJ1GIRd9ERiAgk4zQIfRsLyRroR5IZZENf3A2Tymx3XCu
	YIG9L7dpx39tkHGQMRPiEj8G8ivUs4z73K/ZEOcCCnhvBAHdJQbFWymELbZPzvNwrW2hSppXHR8
	Z6y+3tuJeyaFOLY0BBa9IH7ABe9npgm2CJejl77r1N6+wmIXbyoQS0MJtPPSGDSAD6HBgDJZxKf
	GwUuBUJh8mYiE76rrMXOeZXqZpKDJwv/uZJA46fK970qAvmiXBql6gjGL2+kmcBqPEqarMXHGxV
	Z8dnKmi6SEtfselfAboBDf/37OtibA29oWVi383EfAD/yKvqfjcdC7Y2DxsHWCVRs2SzTEmdDzG
	eNnsf/fLtJyTL9TNgb+gVgGw1jb2mGTJ1+C3aPPwOIVH2CaHPo0gIMRXVTy9Gw5mVGte4Z
X-Received: by 2002:a05:6820:2006:b0:67c:250c:ac4c with SMTP id 006d021491bc7-6821fe6157amr2712135eaf.31.1775268270140;
        Fri, 03 Apr 2026 19:04:30 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:a819:2018:a04a:68a9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6822987630bsm2274434eaf.4.2026.04.03.19.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 19:04:29 -0700 (PDT)
Date: Fri, 3 Apr 2026 21:04:06 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: mm: fix SWIOTLB initialization for systems with
 DRAM above 4GB
Message-ID: <adBxljN4t0ZIIvGQ@toolbox>
References: <20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev>

On Tue, Mar 31, 2026 at 03:37:22PM +0800, Troy Mitchell wrote:
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
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/mm/init.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Tested on Tenstorrent Blackhole, which doesn't have any memory < 4GB.
With this patch, these lines no longer appear during boot

[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 67108864 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 33554432 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 16777216 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 8388608 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 4194304 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 2097152 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 1048576 bytes tlb structure

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Regards
Anirudh Srinivasan
