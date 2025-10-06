Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5D215767
	for <spacemit@lists.linux.dev>; Mon,  6 Oct 2025 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754473; cv=none; b=nTfm+xeDmAxVN+M2c807yyxYtVIGaqd/eNyC2MbIrtYyGYVaDRLJCGE2CDNtNlN7pVm0RS4oWU8C4xmmbWwD/P9/R99D4f///YSNmXqpNwBZr4PJZXp9rfEzfxgeRNOoextsCweGylw7HRiuLIWaxU84YfAEcwCoL6zACgeG1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754473; c=relaxed/simple;
	bh=1q+VIFZwiIkYLeXafY/FJdneXiBfYWG4ku3gvwDgztM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fh5mNU9YguzjHuD02HhBpHP5x4w2YXaw6FOWipBf77WRUde6AB6+h7whFFdzMIVWIvKve8OhOMlGNEOkUKhKtyX4garLlIcsoCygdeYlY3osNzx1CNNFNkTpvgrxQ92/wgPTYzVcloAtYdGKw3Lop0Jp+OILEuD7IgrU6wHoCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSCp/2Z9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSCp/2Z9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so56094165ad.0
        for <spacemit@lists.linux.dev>; Mon, 06 Oct 2025 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759754471; x=1760359271; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1q+VIFZwiIkYLeXafY/FJdneXiBfYWG4ku3gvwDgztM=;
        b=VSCp/2Z9J8g1+qUYbiH0ZiJHezUemsy3PFzY0BzGQFsA02bGgCXF0f1xgyBKWO0Uvv
         UtAA42YSufvMdMVTLOfsrtlKALnkknSA92hhEYNFY6IvCz7V+3HxNt/Nn3U/KpNcjdqV
         0RDkcweb+RnIQNj+J57h62j09ecEqMLA37ixJXuMA2uJgl6xEfXqCuoCFscndHxtr2T3
         n9ar8aZjLzLCs3iBO2qtfPTfhCKyv1m1gYCR7om7Qg1HZoGsppBwe/wmTQ393hZwjMty
         taj7V45+XT9JJS06BbF30nQNFxNdJlkJEvrWNudg2/4PK04aMiF7LBG8nVAvEC9fcNr0
         4vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759754471; x=1760359271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1q+VIFZwiIkYLeXafY/FJdneXiBfYWG4ku3gvwDgztM=;
        b=YwaLfLTnWrPfoxZMWafs3SUPRRLSGE0UjWJa+AyJRbV+RklgRszezWsvZiNLKqT4y9
         QiR/vE0ddnacNiFQmb6GxCDiMmW6W+HdoNObr7NXouZpHX2uNYYV++RO7kcPddPUtiV7
         13Ncsl7794NKyD0dKmeL1EC4G+C3yjpbZD5yQtNFHrE4L2FBi02xtOZjfmgGBexjU4ek
         6rLZFqLq1wSpE47IxAIRpRBWXyosPRvpFYR2aPPgM7tddVuL4s14z8AedX3sUk04kAiD
         Ml4qcPirGSzNwkxNiQzTYr1w3+g8b4zs0dsP07sMPkXJHp+BovmsK9TDTxq7iXKV5xkq
         oA6A==
X-Forwarded-Encrypted: i=1; AJvYcCX0PFzZDgYIwIj3mPYFmfN6mdbzG6IyygP9bJlmAX6EbemsGyt13K2mTNyKxXEWXXkirK1vaNy3fQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YymzOlmCz2F/dAmnDZFofgkbCmI+eqyih68HrizeOC6CseNdpPT
	wVBitwvlpguxvWyrvFYqbq49VPaacG1Z0h/O4WZND0FQnmY2vtHYZvN5eGTHbypPIk3AsRzdFKv
	k1QLfVqmEMn7c3uRpDy2uZcmELx7EeW5gaEPjoFGAcv/369KhP3Qtuqbcgg==
X-Gm-Gg: ASbGncvJbDnvgf9x2aTBw5dtrddQqVxdHk6ZPL9wtFS+STO+JIXKvXN/uy7QIiAbI+J
	tmR1c1kLCM5MssFFtOo/jK8+8sGywP5d7vEBYia4rYiV7s5qTdBSQG4xYLGmMuww5j8Y86NWnU0
	bOA2eqajOOm65Dm9mN5YawyXWXELGsEd4Sw09MogUXZq7xcDyjYp2xx601oFNUa9XageaoLJPvR
	BDat1jYZLwA66OVWXaHzq1iEXhWL2P0BW3xLtcR3cbT23NhrrsEFimdMtKlSwww0avaXMU9qiMs
	3FF6ssSoqZevqv9YBTzmPAZF
X-Google-Smtp-Source: AGHT+IGsLKBTasVAqEZ4v4KXBEfDfTM9A9ENdzksSzZ7BVLlJItKpXfKx4hZJPWcb6hfrOA5/IrXwYs5mVLZOS99Jts=
X-Received: by 2002:a17:903:238a:b0:28e:873d:91 with SMTP id
 d9443c01a7336-28e9a6563f0mr137927955ad.29.1759754471396; Mon, 06 Oct 2025
 05:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
In-Reply-To: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 18:11:00 +0530
X-Gm-Features: AS18NWASLNw80j6ptJPPHIfrc8HYOqH-1LzEniT9J7aBBeWXoMD5tLZ1N6aS2Wg
Message-ID: <CA+G9fYsTz6WTetGeWn=NX0fyX_j6qRR9XA_ETmJiYWDfCwyHWg@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix DMA mask handling
To: Guodong Xu <guodong@riscstar.com>
Cc: Vinod Koul <vkoul@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yixun Lan <dlan@gentoo.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, elder@riscstar.com, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 19:57, Guodong Xu <guodong@riscstar.com> wrote:
>
> The driver's existing logic for setting the DMA mask for "marvell,pdma-1.0"
> was flawed. It incorrectly relied on pdev->dev->coherent_dma_mask instead
> of declaring the hardware's fixed addressing capability. A cleaner and
> more correct approach is to define the mask directly based on the hardware
> limitations.
>
> The MMP/PXA PDMA controller is a 32-bit DMA engine. This is supported by
> datasheets and various dtsi files for PXA25x, PXA27x, PXA3xx, and MMP2,
> all of which are 32-bit systems.
>
> This patch simplifies the driver's logic by replacing the 'u64 dma_mask'
> field with a simpler 'u32 dma_width' to store the addressing capability
> in bits. The complex if/else block in probe() is then replaced with a
> single, clear call to dma_set_mask_and_coherent(). This sets a fixed
> 32-bit DMA mask for "marvell,pdma-1.0" and a 64-bit mask for
> "spacemit,k1-pdma," matching each device's hardware capabilities.
>
> Finally, this change also works around a specific build error encountered
> with clang-20 on x86_64 allyesconfig. The shift-count-overflow error is
> caused by a known clang compiler issue where the DMA_BIT_MASK(n) macro's
> ternary operator is not correctly evaluated in static initializers. By
> moving the macro's evaluation into the probe() function, the driver avoids
> this compiler bug.
>
> Fixes: 5cfe585d8624 ("dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Patch applied on top of Linux next-20251003 tag and build test pass.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh
