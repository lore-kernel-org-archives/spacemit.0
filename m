Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16437D10F
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462922; cv=none; b=L/m0MdKrlmo1wTPTGZJqLNKp0fXtN4ww4asNiVIb2mamzhdHd+xx+1v5RFF0/UE+qHSbToLX/RCrrWOhrtR1ZsyskG50lUduhKSzBSUQt0TQLzNTSlgouxdlCUM7xQniDJZbn1jwlAZ6PyuXDv8Z2D3CNj+N3QFGSgAuoju4dWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462922; c=relaxed/simple;
	bh=bafFysWjidk0j+U1lcIQcads9zqSwlOazz/9oT8sonU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ta4zoSNarww4WQ1onmTSnBMUWGSOtGmXQCbTMFJKVTYz5Xa0nNmG2QdF1tyi2DFrc+RT4CrOsa1shbxsqblf14gAtX7Btm2FVfk9h4o5NcBedpSy43YMEHa6nTrfKpZ+Ut5MRVjWNuTNX/JAEYs4ciGMKwwR2hO5dZeyzNGyLU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZLR7iZj0; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZLR7iZj0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777462918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GPJm3sEDi+yLYep1uNFqjUTb7xnUW7h1YI4IHlBEE9A=;
	b=ZLR7iZj0K26awfhmiYwMY3jdzXEftXbwJFufCUNokyxv4pIyc6TiQTnQEVakZ7DYPBpwG2
	AkoYGLj8iW3zFPpvpzJpYlcrakM93D+Q7oPYQTjvt4ZtHOLeU2qtvgzWcKFoqycspGv2C1
	Cpc4pCrRved5ORSL5f4QenNdJpE+je4=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 29 Apr 2026 19:41:54 +0800
Subject: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems with
 DRAM above 4GB
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NSw6CMBCGr0Jm7ZhO0ZK48h6GhbRTmYQU02LFk
 N7dygFcfv9zg8RROMGl2SByliRzqKAPDdjxHh6M4iqDVtqotiX0smKUZDOmt8zLNKDxZHV1O3I
 EtfeMXEP75q2vPEpa5vjZLzL91H9rmZCwOzl3ZjOw8nSdJLzWo+MMfSnlC7cVeRuyAAAA
X-Change-ID: 20260331-fix-riscv-swiotlb-6f1c226071d1
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777462914; l=3691;
 i=troy.mitchell@linux.dev; s=20250710; h=from:subject:message-id;
 bh=bafFysWjidk0j+U1lcIQcads9zqSwlOazz/9oT8sonU=;
 b=cWivkeobwrrx4WGc+ZozF2JfvEG2T7f/k1HBRicjJ325UNdffUI5K6iD6iSYdOEMfh0mfE5bg
 KCxOVX7qCJkCEm8qWAOQNTmrQq2N7JDk91TMG8rV+v7Y/CKP0wapOJO
X-Developer-Key: i=troy.mitchell@linux.dev; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-Migadu-Flow: FLOW_OUT

On RISC-V platforms where the entire physical memory (DRAM) resides
above the 32-bit address space (i.e., above dma32_phys_limit), the
current SWIOTLB initialization logic fails.

This patch addresses two interconnected issues on such platforms:

1. Incorrect 32-bit DMA bounce assumption:
The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
that a 32-bit DMA bounce buffer is required simply because the maximum
PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
no memory exists below the limit to satisfy this allocation. Fix
this by adding a check to ensure `memblock_start_of_DRAM()` is actually
below the 32-bit limit before enforcing 32-bit SWIOTLB.

2. kmalloc() bounce buffer allocation failure on non-coherent systems:
For non-coherent hardware, a bounce buffer is still mandatory for
cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to allocating
from low memory, which fails completely when DRAM only exists in high
memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator is
permitted to allocate this alignment buffer from high memory.

With this patch, systems with non-coherent DMA and DRAM entirely above
4GB can successfully map the software IO TLB in high memory and boot
normally.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Changes in v2:
- add Anirudh's TB tag
- Link to v1: https://lore.kernel.org/r/20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev

To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/mm/init.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..3244e4fba89c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -168,7 +168,9 @@ static void print_vm_layout(void) { }
 
 void __init arch_mm_preinit(void)
 {
-	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit);
+	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit) &&
+		       memblock_start_of_DRAM() < dma32_phys_limit;
+	unsigned int swiotlb_flags = SWIOTLB_VERBOSE;
 #ifdef CONFIG_FLATMEM
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
@@ -176,17 +178,21 @@ void __init arch_mm_preinit(void)
 	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
 	    dma_cache_alignment != 1) {
 		/*
-		 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
-		 * buffer per 1GB of RAM for kmalloc() bouncing on
-		 * non-coherent platforms.
+		 * No 32-bit DMA bouncing needed (either all DRAM is within
+		 * the 32-bit limit, or it all starts above it), but
+		 * non-coherent hardware still requires cache-line-aligned
+		 * bounce buffers for kmalloc().  Use SWIOTLB_ANY so that the
+		 * buffer can be allocated from high memory when DRAM starts
+		 * above dma32_phys_limit.  Allocate ~1 MB per 1 GB of RAM.
 		 */
 		unsigned long size =
 			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
 		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
 		swiotlb = true;
+		swiotlb_flags |= SWIOTLB_ANY;
 	}
 
-	swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
+	swiotlb_init(swiotlb, swiotlb_flags);
 
 	print_vm_layout();
 }

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260331-fix-riscv-swiotlb-6f1c226071d1

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>

