Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA63C0A03
	for <spacemit@lists.linux.dev>; Mon, 15 Jun 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510519; cv=none; b=XWVMeyYHYG8nUQzdy5iZY05T/Fpzo7xN3klw+wrIUrkRokv8aO7FJIGsj2PAff8MmKSt9Pvtv/cmQ+eJT9BNeqZtrJWcAWfak83FnHZggWn6aINDuOOozKqaPiMfuzx5I0+b3PvdasjO4PEkpRsxUrUsQnxI/vnckdWZmSFjKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510519; c=relaxed/simple;
	bh=dYd01TaLWp+b1weWv03OfjwDWGyIew+KlNl179rn/70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaV/f+nV3XuXjZEBzBYkElqhj0XQOny78fYR7v6ZaI55hwCHMIIUcrtPPgnTIag2BNGiVHFOpKYcWwGXICPE4cf7ndlRESrKdi7VGJJrf+bM65ulMc1LdEp8TaQ/ESNvf/WyJf5Pj/6PzKDytI8nGvs57G+cxaT3PcFs3X+v0rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9KCQb+o; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9KCQb+o"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84236f9b638so1447809b3a.2
        for <spacemit@lists.linux.dev>; Mon, 15 Jun 2026 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781510517; x=1782115317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYd01TaLWp+b1weWv03OfjwDWGyIew+KlNl179rn/70=;
        b=J9KCQb+op94MM+opsbEmWRldpxvtxblfNilSV2jseBbVhix7+HezxPSdmnQjFYmaA3
         2witGH3hvSjedMm7ZlUeMmbtvX0GxcqZ6nnjiYkL+D0ciuUrG5jA5AF6abQlNuyjuL3o
         IoRzbpakxH8yYHAmtlINcJokYltRXJ5StwTJSu+jNjCOP0vRzCK4HWDk3Qyilde6t7Bz
         K0a5+T90UAw5IYaEdDj8a7XEQXW21Aa9iKF5vP51xjwOYMmhDt4U/yL8HsVW8qlBGuQn
         ElzNPzhCYDd5D3mnzHaGkEhcE0w9C1AmJbVRt6JyM6LoolUMnt0pw7uMH+gD+F/l8puG
         iIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781510517; x=1782115317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYd01TaLWp+b1weWv03OfjwDWGyIew+KlNl179rn/70=;
        b=sEaq1w7q8CuzxvXtJvpJtj8rcgsbog/1nyZKAbrs1Wl7LBILDU1SqE16RYFaRzF5qA
         1YXm0oYkwXtOg+wcKhScbGz7/qSVTkTFmq1eFOR7mbAmksQayBxlGYS8EcCtP9psfdzp
         v95dsh7lV/v8faSnKDA5dWOgHbJvYVj5hnv16z9xnpzzI41X0aiZCWompxX/uNWnR8kN
         JUJWzS9f5/Mk/aqCrl31YTumCTsFTkLpKOuXPX2MjZFuGHpyQOHQuUoRxbaH5G2XNCPg
         qWUeEjHN6fBJQ8y/jcjd+qhcKvqNcNvBxICYNPhgUQ1U2P6stzefZs06C92m/L0DXWVh
         9/mA==
X-Forwarded-Encrypted: i=1; AFNElJ9fr7XYCHEkBtX9al/SoaX/OMy4cV5J7iN9mcze8bxVkbij+rCxV2Po2Zua7TJsFuBKilDvTzBmGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+PbgiNS9EYvpSiPafWeIr8Mi0jXEop5ZeuRTPRUXPJ0aDKenL
	xqfVC3GwvUOry2AK8CwchUE0/vxyS10/1BrdFlEaHIF1m+c4OuSB8k/i
X-Gm-Gg: Acq92OE+Y7acB+Qbskhpacc5OIhwIEgfuxgChz7GXCy1ijZ86P6NEKccqJCJwTBMY3T
	1PMLuzb3AExgGhmUxhrBMZfHOkokUGBNDPACTQH8vWVw7m88Yeivn0AQLzVscXRZSTL+/acSDfo
	4NX74tAKrQavXfV6P0p59UP84s6a14a6lNkq0F6z4MPn2Dajtw9BUkd8dMKCrxZHpvxU0rJRS/u
	O1SsX3NIr0T9aSna9WySxPmWPpwBxygj/erusD3FwEOz33S7H5qOy2u8+gZzuvxDglQfyOR+JrH
	3n/cqI3NWZaa+hCrPPg3TwvpC0YNS5W8sA7DtXgT68ZX0PvHTLuQDmpSFrpC1vdzQpek7eXNoDr
	Rcgh6QyFfkqm66GbhdxYSxxVqI4PNXKlmkN0WD4JDG4y2wO5nc5LwtK9xz5shPUyvn6qLon0=
X-Received: by 2002:a05:6a00:984:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-844e1596c86mr10840924b3a.0.1781510516767;
        Mon, 15 Jun 2026 01:01:56 -0700 (PDT)
Received: from localhost ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm10890663b3a.57.2026.06.15.01.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:01:56 -0700 (PDT)
Date: Mon, 15 Jun 2026 04:01:43 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix wrong extended DRCMR base for
 SpacemiT K3
Message-ID: <4wo2ylvv2v2kmec4vzycgide3orx2zwjzdjunfm23t6pclknbl@pqtb7lw2parx>
References: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>

Hi Troy,

Thanks for the patch.

On 2026-06-15 10:53, Troy Mitchell wrote:
>K3 PDMA shares the same DRCMR layout as K1, where the extended DRCMR

K1 never touches DMA request numbers higher than 45. It's not K1 who needs
the extended DRCMR. PXAxx needs them.

>base address is 0x1100. Commit 6587b8661a0b ("dmaengine: mmp_pdma: add
>SpacemiT K3 support") incorrectly defined DRCMR_EXT_BASE_K3 as 0x1000,

The SpacemiT K3 datasheet still 'incorrectly' carries the base 0x1000.
Refer to [1], Section 16.1.4.6 DMA Connectivity & Assignments
which still states 0x1000 as the base:

0x1004 Request for SSP0 TxReq 0xD4040000
0x1008 Request for SSP0 RxReq 0xD4040000

I would recommend you double check with the SpacemiT team to make sure.
It's better SpacemiT can fix both the online document and downloadable PDF
as well.

[1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/16_peripherals/dma.md

>causing all DRCMR accesses for channels >= 64 to be off by 0x100.
>
>Drop the bogus DRCMR_EXT_BASE_K3 macro and reuse DRCMR_EXT_BASE_DEFAULT
>for the K3 ops.

>
>Fixes: 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support")
>Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>---
>This is a minimal fix for the wrong DRCMR_EXT_BASE_K3 value introduced
>by commit 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support").
>K3 PDMA shares the same extended DRCMR base (0x1100) as K1, so the K3
>ops now reuses DRCMR_EXT_BASE_DEFAULT.

Before we flip it, could you please confirm your source fo truth:
did you confirm 0x1100 on k3 silicon with a real DMA transaction,
or from the datasheet? It would help if you could share your
test setup.

BR,
Guodong Xu

>Best regards,
>--
>Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv
