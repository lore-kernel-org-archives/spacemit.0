Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001399;
	b=wrGHpJF71dCzEgB8KNnfDzHfvxEr8FMW2aQquqRREuFYfYintoqpsqrelnmtEa3ahUqZ
	 muhZm1qve2rZaoeqveDK3/pnRqWQLvwglqCc34Ej32mO+wyB8t7J2b0vzXtLuJTfVd8eP
	 0/yW4S6LlP/Q+yA8iWWxJo+vc3dploKYuW7XC4azSpIcjXbDjhRmt5BQGy2m3rZYyMT5r
	 tfvrOoIbqTNwymL5y+zJ3c4tHOYc6MZKBq6ndYBxE4BS2WHEw4Doz4OSPa1FWixVtJM/s
	 VYxrUyM5Mo1DB4b+ZqjddJqMXi6FF7hQrYhKcRuoCD/wpwgXomIsUYZM3B+Hsu6QyzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CKJXXPGigrKiCn6BqmrO398ZNmnv1y4ivGMlHte/o0E=;
	b=hLejYfZh7Tg9CfUQlCJkkbzNfc8yA9jHFhoI/NsJdyohbX0wYw88rwwkJaNI7aEwoxAg
	 U/BHNk+zkKvpT2jzc9xC0RaMzTaednrgx83+wQleUsNISJLo97+mFrucuYHgJebQYgzIc
	 c9XpMc0J16M6VHjN2hO6LyuhQIdfP3OSHDA7Era6BitGMSCAErVXV9YN99hTTbqgCSxPC
	 s5+KiJT769F0XP6F5gfPyO2mAqWOqHlXMKX1Lc5rnLvN428PxhHQov8IAuI3iOSsDHPS6
	 0JuxdMMdKddIV5mrGTH75hJUx0hNbGsPMSWitIWRVdlGy9PnrUk4wAOxExs89NjkO3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=siSxt21q;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B60606A31C
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 11:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=siSxt21q
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso703573a12.2
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001398; x=1795606198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKJXXPGigrKiCn6BqmrO398ZNmnv1y4ivGMlHte/o0E=;
        b=siSxt21qpZoa7E2ewKHOTWSIM4FlGAyI2Mv6IO7GiV/9kgLxGBJZWCHiAwSVA0P1mi
         z4WkI9H7fb9LX6qOn1OLQGuXj8302w/8KnwOSw+Zb0v2hMaUhPKk4eUxzOnb49LNPXII
         pqb4/wh5/EQ+gxSt7FJnlZ9ZEu+tdX+BpaXuIHi7Tn/O4vtNlUw3IfPkdwecUQ2E8M8w
         0IfeLGFbkjAIp6VvtE5rbz85DZncGVfQonDRLcIaJkZk5nuwbX/LewosK0oIxv8q29b+
         DDJYhTQr8oSgs6MC25fvGVUtwOBrex/vTOs4YLOrErbHetFOkVchegh80oQg0QQGWNTu
         C1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001398; x=1795606198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKJXXPGigrKiCn6BqmrO398ZNmnv1y4ivGMlHte/o0E=;
        b=r/TBp17V1K2twqVOkSoztMf9lgrA8/m78XZN1GIwE4EI5CbWJ4SzjdqxhJb8Zb/FuO
         DvWAdcyHge3USc0Yx6iIYetcjHwgSM15pBmrRItGunwXpMbULirKsk1SVNvQptQFQQ3N
         IX2Vptex4kGH+DPTIMPiCi6f4jnqluxyLJNuBZ2ctwDvEtPEu7IraqIpZpz4qgdwN+Ru
         tdHfk0O0e/uLjrayAi4mED9uC/hzqCxbYxlgbtzwPUwHuvLkCp0e6Qer6oa9+F7jdzru
         GwnI2R3xgIdWa+jXnCi+7LemAa2W6YfTzSmmHuXnLlhyxOKppnhhPQn3nidHy83eWHCl
         jxKg==
X-Forwarded-Encrypted: i=1; AL+hErHt5T4JXdfFN8erxQUh0agSr9NRbtpfTYwShXGp84kmHlp2Otfh5qpPeO95cg5e45hMLds1UanaWA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8P6iAPmzfJYDAheMnytvX6tDtnwMUVAVlg7AyygDpb73w1aOTO
	iVfp7GKt4XARMJjRMn5Wq8KBhDZMMkOtRqmkImu+V9+1hjF5bu+n8sO3
X-Gm-Gg: AZFdTZcprB2bX1aytSsDUqEUH/gw4nEQvp7wEES8mJyan2QAiD3lQfGoIpJKlSZCaNg
	O6zHUVdMcL45vSs9KPAfzQXzyOE6r2HLW9DvJaOSqz0/+UPgqyFh4SDtCjK9Uf5YQpDHJpDOTau
	0VSjtucelhczuw3MZsAk/albDY4uGuVQqXcvwV5QLCHBRlHalvzcwJBj9o/GJPvh2R3IFjEDMor
	B8G9YrNC7IoDrg4r2r5BDCZizoisKL+ENMDhWIGRPClRYlEpH5/uFLEEPPcV6Mh3lmTXpVGlcr6
	NZA0sGLtS6xde1knNg0naHXweJQJq2CeC2CcspuwuYH7BNOFh+aJZXTRaRpsct/MXncSoJLXGu3
	BfOh1eo0Tv8RJCPNQReZlpC5e1Vp4lA6dLHD+CrhZ04LNQ6Oz3cqFxmmrkgfX/RBfb1rfA1hSGs
	dXFdEzyIVtpjiwiUkDTHSxGgkLHjBqMlzbR0rIFH9FOGk1q1V1WIlsvzBL0EzFZO85I6rSS5rvb
	amd85vwsyxnHWCdCtu+NQH5CV2oI7o1qnwDwARMikumnYJHXNmCti3VcmxAUrILORAp04sCZIAW
	NiNcVGWXH15AdCmVPK7updC7h14=
X-Received: by 2002:a17:90b:1a8d:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b3d06415fdmr2730809a91.5.1795001397974;
        Wed, 18 Nov 2026 03:29:57 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d143d69csm3960221a91.1.2026.11.18.03.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:29:57 -0800 (PST)
Date: Wed, 18 Nov 2026 19:29:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Peixin Xie <peixin.xie@linux.spacemit.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: cpu: Fix incorrect cached machine IDs on
 secondary harts
Message-ID: <av2L1MlTWoYI74eu@inochi.infowork>
References: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>

On Wed, Nov 18, 2026 at 11:04:33AM +0800, Peixin Xie wrote:
> During early ISA-string parsing, the boot hart stores its mvendorid
> and marchid in riscv_cpuinfo. This happens before setup_per_cpu_areas(),
> which copies the static per-CPU data to each CPU's allocated area.
> 
> When riscv_cpuinfo_starting() runs on the other harts, the copied IDs
> are already nonzero, so it skips reading their own IDs. As a result,
> secondary harts can retain the boot hart's IDs.
> 
> Read mvendorid and marchid unconditionally on each hart, as already
> done for mimpid.
> 
> Fixes: e482eab4d1eb ("riscv: cpufeature: Fix thead vector hwcap removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
> ---
>  arch/riscv/kernel/cpu.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index af84b97af3a1..64c0c83eff76 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -197,16 +197,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
>  	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
>  
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> -	if (!ci->mvendorid)
> -		ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> -	if (!ci->marchid)
> -		ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
>  	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
>  #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> -	if (!ci->mvendorid)
> -		ci->mvendorid = csr_read(CSR_MVENDORID);
> -	if (!ci->marchid)
> -		ci->marchid = csr_read(CSR_MARCHID);
> +	ci->mvendorid = csr_read(CSR_MVENDORID);
> +	ci->marchid = csr_read(CSR_MARCHID);
>  	ci->mimpid = csr_read(CSR_MIMPID);
>  #else
>  	ci->mvendorid = 0;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261118-riscv-marchid-fix-3ea3672d1e0e
> 
> Best regards,
> --  
> Peixin Xie <peixin.xie@linux.spacemit.com>
> 

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
