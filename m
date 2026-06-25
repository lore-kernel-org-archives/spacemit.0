Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C925785C;
	Thu, 25 Jun 2026 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409609; cv=none; b=sWH3Y6qobqoxNJm5C2ruxM+05WVynhDVWh1JPJsR+ZKmDrddBrVahgmqgQ9G8DDEMuvnmtXqyCTC8nzVvFXgW+2Ty0EjQEZpL2eQnFYDXRtRZtjyFjepW1UyF1SsOLn9KQyFjOR2kGh7uZWBgn27NAX+PfTSDKPtdO1s9I4PSjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409609; c=relaxed/simple;
	bh=O3P0LjkdvO3lnZ9rvJp9sA4O3eCjIHpgJD8XIHauBZo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Kxm0A/7DgTzhp6evh9g37w1jraInotbAvmj0wDZp6b+0o+s5WtcbR8EYnhBhRQDnEAuPyp5bBsA346+AFYp5PY+ogdgEApb50264/QRtqmFtzhwy7YQdJ9yxImKYHjx0lGzb6o/UgxcBfA/HDmsNv2dmvtoovE4TkXj4VVivNFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSxNHB+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSxNHB+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E491F000E9;
	Thu, 25 Jun 2026 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782409607;
	bh=w23cGRwX5IS5ZlV/pHDg+qB9kyiLmObqHEcTd7CFGvE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=RSxNHB+I/jJ6qw68tDzeZ0HpNAd3bQ2HvGV3wH3O/18mgX+h/UtaOFhRITFT2osRC
	 bKNk25wjyIN9oA8t2OKZNunclmHovblhWWyNGeQ5r2bS1kaQ6A5b+FJDVYvH2nw1B8
	 WyLqeK5FbAakQaS9Btzgy5N63fGNOfKQyqeqLF7fWHY67Vo2UNgkHsWVHymAXwqqFB
	 TZZLUv+0sNz7RsuhoIwBBK3CNQIjyAd96R+8uC/EFUBZxCnAipbXNhXPH2vp3pMfpH
	 O4348o0IDW9aPKaBpoRfWe/hFsspmm5o7wksXQ3kRB2Bm+JhJv3xJGxSP83mJTZ61I
	 3fB30qhuvsirw==
Date: Thu, 25 Jun 2026 11:46:42 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Drew Fustini <fustini@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
    Lufei Zheng <lufei.zheng@spacemit.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH] riscv: Raise default NR_CPUS for 64BIT to 256
In-Reply-To: <20260625-riscv-more-nr-cpus-v1-1-5da8c72b9269@iscas.ac.cn>
Message-ID: <825bb878-b5d8-7bdd-c5fe-744fc7f8e05c@kernel.org>
References: <20260625-riscv-more-nr-cpus-v1-1-5da8c72b9269@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jun 2026, Vivian Wang wrote:

> SpacemiT has already produced a 80-core RVA23 RISC-V server [1], and
> going further back, the dual-socket SG2042-based Sophgo Pisces has 128
> cores (although that had some issues achieving mainline support).
> Therefore, an NR_CPUS of 64 is not enough.
> 
> Raise default NR_CPUS to 256 for 64BIT (when !RISCV_SBI_V01, since very
> old firmware can't support more than 64 cores). The number was picked as
> a power of two that is at least double the known max. I believe this
> should be the right balance between not wasting too much memory and not
> having to touch this too often.
> 
> Ubuntu has already been shipping NR_CPUS=512 for riscv64. We have also
> been testing NR_CPUS=256 internally at ISCAS and found negligible
> performance impact and no ill effects.
> 
> Reported-by: Lufei Zheng <lufei.zheng@spacemit.com>
> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1140651 # [1]
> Suggested-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks, queued for v7.2-rc.


- Paul
