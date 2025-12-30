Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51610145B3F
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 00:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055816; cv=none; b=GNZMyx6kZneAZ6eRVOeDKPQx26EuOD2tvdqiWtH3PwoY76GSGwnLQe5k9IMFww7DMTInPpJa10H1kQWc8ucJqg19uRxYspS+qUsplNSgRpvBtNKsYKXPVcZlLeytzuNYBPZ6b1SfDWLUwGQa3GEahawtQeSxJuKJZJrqFZYmgVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055816; c=relaxed/simple;
	bh=42Du2CLON1ecQ5mNngEuokBJCgYS/KHqsmqoyYaW7kE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Vyd2DXzAq7Xgn6FiVMZSVD1AYsK7+pWbA7U36l2jCZDVi+Ad9IduXVb87Uoa7rHp4QfseGwalytXYcLIWguXMj5DCEkm4rKiqYUF5u+PdXJqwyiTgmGgUcPCmUuw/saY4mzJMEogQVCHbB4hSwUFsk9RjPbiZtA4PZQdF85do78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mPhlDxx0; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mPhlDxx0"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2d6df99c5so1007708485a.1
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 16:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767055813; x=1767660613; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXi9h2F6u/+Ag/dMKJ4V4r8/OUgCm6fykDTUehBQdYg=;
        b=mPhlDxx06+dG49cd7IPMEy+G7CRpz3l1EBKPDq6AdOcLkma+tBnvSbSmbiI3j/bBSW
         z1cFVI3CGe7YpevQDjhWm8sfsqim6Gr9u+GbRYQcog/YyWIR2Pq6JR/7d6ETwiydMd6r
         EtYSif/PvmKw5d+93vj0NiCfRuVW5d1BKBizMs5h7JQVrYjdqWOsPbFBPkMyeH9zlg6Q
         07Z95VQOacvnquhnFROPg/Q7LElf8cis/VYZhawtheYCz8rWIpUJcEML1SdIdfheZUtz
         F7Lvm+fYgrafblpM1rZOkmibBF9OydmweIdGyxpU7tQS5G3+cw3cDI5AjKD6vxDATfgS
         PdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055813; x=1767660613;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXi9h2F6u/+Ag/dMKJ4V4r8/OUgCm6fykDTUehBQdYg=;
        b=lYmmPy4HKzT9/h0V8SWXn+2Z/iae9voZdyI1qdcqpVVF4M/b6BrELQR3YeofHrBQTG
         NTdTBlrkYXEz/Lo8TOpyHgn5gpo3gJxdZ6xqPv5Mb+MZaSguY7UqTde2QTQkDcPpaMMi
         NMJTwEhNK5s1BF+hMfHvOh+uJ9n8cXNT9JfyhfpFpW39A6ebHS3sSBVKgdgzMSzxjuCP
         WMs9PwTXBu1bjU9Ikh93vdce/a/tWRLeGfpK1yR5ou8iYwHgBBdlsybbKvJCmEIMBpYQ
         f6s0mOH+XCtUlliqeCcN30QCVWY9Lyc/qItq2gXSAuHN8kRDkGQDvxmo5C5CrO3zo+uL
         pDjA==
X-Forwarded-Encrypted: i=1; AJvYcCVva1qDG3xslL+/CQzVxMpzHzXd5QF3boGNABDUEVEjSl+la89oIunyeecCM35l1YQT266BEZeDHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6g0FghQhHplHP/h3tvDPw6Irx3GJhPb8dgavgbIK+EsUEIi8n
	qspf+/tegBhkmWbihuY0gJOWBnhh/WUSxZdn2QVJ/EgMOfJpiWXY9i6WIZ6Ejlae/6Q=
X-Gm-Gg: AY/fxX4snIDf2BCaEFPH5PCI2LcP7yi35OZJuugqHJx/vGtlHlfR7W2px0MDpXfhaCJ
	gfI0B5CVGvoEHjoD0U6qZZx4cLSaM2WVpCmAvWOwIH0KY9LGrBw4cIks2qj2iJ6TNT4xtLevlvW
	tVs6BOnHo83atTl7fVMnOjYFHKdYn7mt/y3/DysCwMoAfLxXL4+IbyWUqWYP3W7mBDYhOjNsvQU
	2nwspIb58zaymPhzTRIrh+cncQAanCIUkjNnarKviTM10HsSaiuvn/oWO3kGYmLv2+qf/Wrzett
	h4PYS1ccLdFIaJtxR0vrciXXOZXBp+UAGZK+wgRynF6TDtzmilg50BMrl3bTRYkZ12l3qsXsjHO
	fW7FJ5/Jns/S5MQ/hjQEmhT93tBgyUa/bh+RFpbxv2iG1ARR43ASeia3m/tXIxKK1giCtNgD91l
	XVlRgoFCBJftLa/6F2hwr836442uIL1dv6fsKfbDKKEGRBjkl2OuhjRCqpemvTxA==
X-Google-Smtp-Source: AGHT+IHk1jnBQLry143qcwBHNuIgjGX/ECeDXUHHBnJflR5W+2APDyw+OrUHlSdhTu9nzhHG4A7//Q==
X-Received: by 2002:a05:620a:3f85:b0:8a2:595f:657 with SMTP id af79cd13be357-8bee76c8eb7mr5352874385a.21.1767055813193;
        Mon, 29 Dec 2025 16:50:13 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm2482817485a.15.2025.12.29.16.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:50:12 -0800 (PST)
Message-ID: <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
Date: Mon, 29 Dec 2025 18:50:11 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
Content-Language: en-US
In-Reply-To: <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 12:55 AM, Yixun Lan wrote:
> In order to prepare adding clock driver for new SoC, extract common
> ccu header file, so it can be shared by all drivers.

You are moving the definition of the SpacemiT CCU auxiliary
device structure, plus the to_spacemit_ccu_adev() function,
into a new header file.  The reason you're doing this is
because these two things are generic, but they're defined
in the K1 SoC-specific header file "k1-syscon.h".  So you
are creating a new header file for this purpose.

These are things you should explain here, to help orient
reviewers and will inform anyone in the future looking at
commit history.

> Also introduce a reset name macro, so it can be both used in clock
> and reset subsystem, explicitly to make them match each other.

This should go in a separate patch, and should change the
code to use the macro so it builds and continues to function
with the new change place.

However I don't understand why you think it's necessary to
introduce the reset name macro.  Is it because you want to
incorporate an SoC identifier in the name?

Even if this is your reason, I still don't think you need
the macro.  I'll try to explain what I mean in the
next patch.

One more comment, below.

> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>   include/soc/spacemit/k1-syscon.h | 13 +++----------
>   2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
> new file mode 100644
> index 000000000000..84dcdecccc05
> --- /dev/null
> +++ b/include/soc/spacemit/ccu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_SPACEMIT_CCU_H__
> +#define __SOC_SPACEMIT_CCU_H__
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/regmap.h>
> +
> +/* Auxiliary device used to represent a CCU reset controller */
> +struct spacemit_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct spacemit_ccu_adev *
> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> +{
> +	return container_of(adev, struct spacemit_ccu_adev, adev);
> +}
> +
> +#endif /* __SOC_SPACEMIT_CCU_H__ */
> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> index 354751562c55..13efa7a30853 100644
> --- a/include/soc/spacemit/k1-syscon.h
> +++ b/include/soc/spacemit/k1-syscon.h
> @@ -5,17 +5,10 @@
>   #ifndef __SOC_K1_SYSCON_H__
>   #define __SOC_K1_SYSCON_H__
>   
> -/* Auxiliary device used to represent a CCU reset controller */
> -struct spacemit_ccu_adev {
> -	struct auxiliary_device adev;
> -	struct regmap *regmap;
> -};
> +#include "ccu.h"
>   
> -static inline struct spacemit_ccu_adev *
> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> -{
> -	return container_of(adev, struct spacemit_ccu_adev, adev);
> -}
> +/* Reset name macro, should match in clock and reset */
> +#define _K_RST(_unit)			"k1-" #_unit "-reset"

The generic-sounding _K_RST() encodes "k1" in the name,
and it shouldn't.  Also, why do you use the underscore
prefix?

Anyway, I'll keep reading.

					-Alex

>   
>   /* APBS register offset */
>   #define APBS_PLL1_SWCR1			0x100
> 

