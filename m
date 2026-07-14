Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913EE47DD6B
	for <spacemit@lists.linux.dev>; Tue, 14 Jul 2026 15:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043464; cv=none; b=c7TSeQ7YgRTwpiQgM9Jj7HU05DF/lU2lfxXwTAsvHhCITbm8GeQvZU9nO/bUCGG6glIpUOlRgm3jegUGaW9+5/e33FSkvinzXGE1+Qmk4IhNP0I4fIVyKpjF2yqMkHzcXBrkQElCSHqlJQt+aNdsQm0l8gImQXftn979gt3rnkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043464; c=relaxed/simple;
	bh=NKB+nlFTmlFkOhdf8CR3nY+x8AlYs4436lcRPQE0Hmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svsomrs5/71PS2rvivO3myPs4LzBQbFdKf2IGAaKptwJhwi2ANbqj27ONNLkf6hWn8iGGsqq3GuowKdazwIOL9qt8C5kDLMnSbpBpI/umQtfbh1Wsb2LSEAfgI/SwusMh8aRzVpL4kkfGJWnWkMtbUnp9MJjciS73yiNgthnzFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=LeWMlqIn; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="LeWMlqIn"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81e8fa1b8d6so35906017b3.1
        for <spacemit@lists.linux.dev>; Tue, 14 Jul 2026 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784043461; x=1784648261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WA6CdRsuIEfzWnFUXJQW7oI+G4RwVrl/m9/NqdXdUbg=;
        b=LeWMlqInmrZTXJc2KMe5awmiP8vKPoRiO7H6VId/tyEwKu83FbLC818lGLTpWX4DNt
         wZRcOOk9XFcXc/xL6ABmuWKo3bM8qwiW8wTaF7lUzG8G7atpXN2UMzt2QVogDCnvBVAn
         7I8/K1QaXXDytUj+4uMemgau8hxvtEpe3E3YDplWQHLVbiWxvnOz36BDUHnysx5VpACS
         O8o++vnuzHb0L7nNnIUEip1qL+sOO3320Fn3Paf2O1sA0peeFIq9ch0n9tQEzzRpKGu0
         0+B9YTBv1FkTvzJCgnHd01rzyCR0b3xwwb1Nb/UCwskIKLx2ZOQj2Ps4tqh1T+7YjesW
         oA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043461; x=1784648261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA6CdRsuIEfzWnFUXJQW7oI+G4RwVrl/m9/NqdXdUbg=;
        b=OMThlpYWkA+kF6MMeFSqRVJZEnmu+X5LdFHufGesVOZlOwgExd9G4zdUCJWvSj/XZh
         5Zz55DoZhdSIR/Y1WixFkcPtGJwWMF9fJyeXcf6VHsaWVNsOXw7ZJr2eFi3s3bemJXub
         DWm5GUh3UPYglz5tJjPWOJZGWTXoXXxYEPYwT5+i/s3b5bscwH6/QEwq2vSFz1EAWHIS
         GZSWQPLEwzDjl9Zif5EX1fO0HrrwczP5BNnGrvtNLAb4H+sVOSgJQCEkLX44qapxfU/5
         G/ZPlVE+6PfJkGMQMc+OYY2tcN8MkdMFrIYmDA4IQbenjmkrrnUSV4VppsqRGMwGITiY
         8n4g==
X-Forwarded-Encrypted: i=1; AHgh+RpTpZtcWnxQJzlWYbbfUrTGM7IojVyWmw0wKvmclqlJdKGGkjg/o5tgDJOmy7OmDp8BzAmRfHXZ8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiByhfsWJw3T+bjTBrcaaqYms6ANsgHb0gTzHC9BroqL1oCIK6
	ljxR/zKDqsGcPCCZHKJIHswAfDTkqGLm5+7cSqDAtA7+JWPlDUODbIABCfK2tkDDaWU=
X-Gm-Gg: AfdE7cmG31az5K4SgDTXtYbVYAYMS/e9Jni9AYH72pbrHAQQREMjOZzZlSZ91TDMmnH
	1wqZvRqv+N4yzx8aYajLRn1299NkwTOnFTae1+dfsLIb2Eka1zfD90kiBsMqPDCyOeN7nthF10H
	QQM7veXyhVNr4cGcONm1TIS4qJ3eSuacNuhz/PPdeKx6YGutqUHZgXUbtTReG+9aNmfs0AK2R3h
	LLih969D0lIw/Q3JE0dijUqvpZsQrUSTabhG+RcbGOPxEUhlqMMUq+2sGwZrcmNsZOHiTF1AIw4
	tFBwFGaWh03upqbNt55a6bY45Q1YSNNR06fKYN4AFQEpNotrcHLFxgCj1V6c3kDTwyZP2gqwa0h
	TA/L4j/oCOscWrjnvjEbmFaH3KbvYvTSvmbaqIBT69tu0tsFKU38sFo5qiDX528+SdMJbx0GkBX
	LYgaVLyBfOWbgxSgYK5bzaB1hnb2opGNhk+LgrpVPYrxnLc6jbRCuv
X-Received: by 2002:a05:690c:316:b0:81e:6d9b:156e with SMTP id 00721157ae682-81ebffe8f58mr18337777b3.47.1784043461541;
        Tue, 14 Jul 2026 08:37:41 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1e5706sm144738627b3.34.2026.07.14.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:37:41 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:37:31 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Troy Mitchell <troy.mitchell@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
Message-ID: <k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng>
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>

Hi Paul,

On Wed, Apr 29, 2026 at 07:41:54PM +0800, Troy Mitchell wrote:
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

Do you think you can take this patch in?

Regards
Anirudh Srinivasan
