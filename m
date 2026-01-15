Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF3E155322
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 00:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436903; cv=none; b=eUKSiTxzDu46K6zpjb8ZfAOejzbPO03VPg24JO7oGUCU4v1naEpvjMlZh1VfcN5U8IZvZsrBARaX+LojpUdJ1WDa+gJaNcwtEl8nywIZyWeMkStAKfqAItHN9A7vgld5xx4ix8PPBAKPf8DrhW+pB2veoIC4EROT9Ofv6OeUUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436903; c=relaxed/simple;
	bh=bfsjpqMvqqHjwrulwSWMwsQNyudp4jbk6bKszGUDRnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhXS7RKdzVN2uWZbhIBW2Q0q5Pbhh1ujR0EqR6McAizEoIGwfgVgH3vEp63YLrdRTqgmqoiKiiRHFn9fM6WqazIe3dbpS9ytj8h5cPQLp2n9t/PANlwZc5bqHeM0CZPOgaDA2sUMMWhdaRdXpOPHeAmH13+SLTEW0RrGXTFX3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNquOqxC; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNquOqxC"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12336c0a8b6so697356c88.1
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 16:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768436900; x=1769041700; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URN8+ZC1AFNXe0LdXxPcdTT+rD36xODGehUphyn7S/0=;
        b=fNquOqxCv7QxLOG4KhJT+onQd9agTRwEt2Zy2T2/jd5uxhCCDvBCeGDKG3akOBRvln
         4dHsX9zerlTbkj0ECkEOH8CrIi/2/ARf433rjFSkBjXzVEqQ6rcBmIe4Cxr/4OSMHnFx
         yfa1PrJl4iqtXsoX6MmCDxwk3QhRqUfIVqbTDqXcXSnVNInZfz2x5JErlK/GBdTAXwcV
         AtBt5eLxzzD0CCDiKboOeZUc+f30yLqLGYEz0Nzf4AUlWlTfz1mv89enov7KV+RVpXQt
         Rt4rKEIsv49W347vx2RfyT0Nr+cNMHeDkyL0ClkIxfJ4ENeJD0D3dLaSk9rltQs+KIsw
         /TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768436900; x=1769041700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URN8+ZC1AFNXe0LdXxPcdTT+rD36xODGehUphyn7S/0=;
        b=eiLR27aCeTu2W6QaxJtth7NJN+etEOzvfHGwnMUqTV9uVdpc0CUYJiN0n8t9hgdK7U
         3uvpVErN8jAh2k1P83+ZC+RA1xKRQW8wjYHIORugrkgNXwNS4FhB5CAatDNu3m0P598c
         bQCStneKndKKKW1+eAj6Mq2Lg07wj4AbchcxpuwxuXKDVLrbFfek52yb4Ir6M2QuW6yf
         t6W7x8wX9xVz1tf0Bi3xqW6RylFHszWdv+AZBxzXgRpZtb92dqrOaj3C4OaAwkIVccew
         uSzEsR+/X4T3sb/MPF2RziyLMz3DYxONI9i0J0M2s6LIm0YWNhzVJnlQJcNYlU/pF5fD
         M/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRGCAMbUQ9Lcw5cIDyQLrZzpMSY+DNicaV/Chwh+Y1rdjeEWJmGNFcKz2o4CERXUFwPnEyWKL0mg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtvPts9mubMVOUM/JELCvkthCNrDxEfCaJvV3TAWMvAnsU4TId
	FHkb/K/tVosVjfTxwGNpY+Uia+nm0piLSzNKRT8f2iG4+fs2UIErXWFU
X-Gm-Gg: AY/fxX77KygRuV0j2OiGxo0k41l64C2cn73SOA55VrMvjqNApASgnUPaqI31mn8hoMs
	3aHAXpCwV+LtQaBZbkszdQhAzsdfDb9CSAQii5eMBG8OUMMHFNBAOJ/CifAcH/BhErjrMcz4SMC
	YvazjlT1QvjG6odK2WyY1t2Ev8FSTsn2Mz8oWQQ3bZkfK14tOKe58oTkpZ31FEIaqqCtYxKYj7W
	NkN6tyrKbxbcNvaz8CE9H09hFIrXxG5sX0q/wPdEq5SrjAuzKCUjBgEHtt0HcjSc/QpGDdErLX9
	yoP/q1iDGClm/x2+yY+2ipSYAve2gzsnbhPBM30IaCy6D9HtK44tyVOAc4Ttypxa2W4t3GLTViG
	aQ+xdNKemsqy8QEd2VEM8hOIJm6hoz+C5L9Mh74ZOO9zW1j2Yp7gi7lH0MxVfcpNrbRmqbCgF7M
	cqyDEddno7OQ==
X-Received: by 2002:a05:701b:2504:b0:11b:ca88:c503 with SMTP id a92af1059eb24-12336a33f69mr4080770c88.3.1768436900049;
        Wed, 14 Jan 2026 16:28:20 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm32527342c88.11.2026.01.14.16.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:28:19 -0800 (PST)
Date: Thu, 15 Jan 2026 08:28:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Guodong Xu <guodong@riscstar.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
Message-ID: <aWg0XmwwBRZzOZ5U@inochi.infowork>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
 <20260115-adding-b-dtsi-v2-3-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-adding-b-dtsi-v2-3-254dd61cf947@riscstar.com>

On Thu, Jan 15, 2026 at 07:18:59AM +0800, Guodong Xu wrote:
> "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> checking rule is now enforced, which requires that when zba, zbb, and zbs
> are all specified, "b" must be added as well. Failing to do this will
> cause dtbs_check schema check warnings.
> 
> According to uabi.rst, as a single-letter extension, "b" should be added
> after "c" in canonical order.
> 
> Update sg2044-cpus.dtsi to conform to this rule.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch, a split from the Patch 2 in v1. This patch is for
>     Sophgo sg2044.
> ---
>  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
>  1 file changed, 128 insertions(+), 128 deletions(-)
> 


LGTM, I will queue this patch for the next rc.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>


> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> index 523799a1a8b8..3135409c2149 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> @@ -24,10 +24,10 @@ cpu0: cpu@0 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache0>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -60,10 +60,10 @@ cpu1: cpu@1 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache0>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -96,10 +96,10 @@ cpu2: cpu@2 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache0>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -132,10 +132,10 @@ cpu3: cpu@3 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache0>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -168,10 +168,10 @@ cpu4: cpu@4 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache1>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -204,10 +204,10 @@ cpu5: cpu@5 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache1>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -240,10 +240,10 @@ cpu6: cpu@6 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache1>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -276,10 +276,10 @@ cpu7: cpu@7 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache1>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -312,10 +312,10 @@ cpu8: cpu@8 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache2>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -348,10 +348,10 @@ cpu9: cpu@9 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache2>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -384,10 +384,10 @@ cpu10: cpu@10 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache2>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -420,10 +420,10 @@ cpu11: cpu@11 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache2>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -456,10 +456,10 @@ cpu12: cpu@12 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache3>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -492,10 +492,10 @@ cpu13: cpu@13 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache3>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -528,10 +528,10 @@ cpu14: cpu@14 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache3>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -564,10 +564,10 @@ cpu15: cpu@15 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache3>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -600,10 +600,10 @@ cpu16: cpu@16 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache4>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -636,10 +636,10 @@ cpu17: cpu@17 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache4>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -672,10 +672,10 @@ cpu18: cpu@18 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache4>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -708,10 +708,10 @@ cpu19: cpu@19 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache4>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -744,10 +744,10 @@ cpu20: cpu@20 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache5>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -780,10 +780,10 @@ cpu21: cpu@21 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache5>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -816,10 +816,10 @@ cpu22: cpu@22 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache5>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -852,10 +852,10 @@ cpu23: cpu@23 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache5>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -888,10 +888,10 @@ cpu24: cpu@24 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache6>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -924,10 +924,10 @@ cpu25: cpu@25 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache6>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -960,10 +960,10 @@ cpu26: cpu@26 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache6>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -996,10 +996,10 @@ cpu27: cpu@27 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache6>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1032,10 +1032,10 @@ cpu28: cpu@28 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache7>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1068,10 +1068,10 @@ cpu29: cpu@29 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache7>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1104,10 +1104,10 @@ cpu30: cpu@30 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache7>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1140,10 +1140,10 @@ cpu31: cpu@31 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache7>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1176,10 +1176,10 @@ cpu32: cpu@32 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache8>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1212,10 +1212,10 @@ cpu33: cpu@33 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache8>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1248,10 +1248,10 @@ cpu34: cpu@34 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache8>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1284,10 +1284,10 @@ cpu35: cpu@35 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache8>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1320,10 +1320,10 @@ cpu36: cpu@36 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache9>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1356,10 +1356,10 @@ cpu37: cpu@37 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache9>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1392,10 +1392,10 @@ cpu38: cpu@38 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache9>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1428,10 +1428,10 @@ cpu39: cpu@39 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache9>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1464,10 +1464,10 @@ cpu40: cpu@40 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache10>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1500,10 +1500,10 @@ cpu41: cpu@41 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache10>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1536,10 +1536,10 @@ cpu42: cpu@42 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache10>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1572,10 +1572,10 @@ cpu43: cpu@43 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache10>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1608,10 +1608,10 @@ cpu44: cpu@44 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache11>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1644,10 +1644,10 @@ cpu45: cpu@45 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache11>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1680,10 +1680,10 @@ cpu46: cpu@46 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache11>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1716,10 +1716,10 @@ cpu47: cpu@47 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache11>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1752,10 +1752,10 @@ cpu48: cpu@48 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache12>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1788,10 +1788,10 @@ cpu49: cpu@49 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache12>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1824,10 +1824,10 @@ cpu50: cpu@50 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache12>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1860,10 +1860,10 @@ cpu51: cpu@51 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache12>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1896,10 +1896,10 @@ cpu52: cpu@52 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache13>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1932,10 +1932,10 @@ cpu53: cpu@53 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache13>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -1968,10 +1968,10 @@ cpu54: cpu@54 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache13>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2004,10 +2004,10 @@ cpu55: cpu@55 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache13>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2040,10 +2040,10 @@ cpu56: cpu@56 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache14>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2076,10 +2076,10 @@ cpu57: cpu@57 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache14>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2112,10 +2112,10 @@ cpu58: cpu@58 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache14>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2148,10 +2148,10 @@ cpu59: cpu@59 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache14>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2184,10 +2184,10 @@ cpu60: cpu@60 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache15>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2220,10 +2220,10 @@ cpu61: cpu@61 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache15>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2256,10 +2256,10 @@ cpu62: cpu@62 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache15>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> @@ -2292,10 +2292,10 @@ cpu63: cpu@63 {
>  			device_type = "cpu";
>  			mmu-type = "riscv,sv48";
>  			next-level-cache = <&l2_cache15>;
> -			riscv,isa = "rv64imafdcv";
> +			riscv,isa = "rv64imafdcbv";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "v", "sscofpmf", "sstc",
> +					       "b", "v", "sscofpmf", "sstc",
>  					       "svinval", "svnapot", "svpbmt",
>  					       "zawrs", "zba", "zbb", "zbc",
>  					       "zbs", "zca", "zcb", "zcd",
> 
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
