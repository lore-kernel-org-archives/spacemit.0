Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC2A28935A
	for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654356; cv=none; b=sz+qKJPDSfA/Di8wesd00ulTGwLOcrIbE8Zms9xxYSANARqFgeihaW/H54s/ju0eRZyenv8NyM7nHsakGlXV9jjETD0PjbqZRP1p7aUnZRcQ36Nz1UrTF+LuiQDHXbhrdlZ2xvpi7jJDI74JTTF3NJd6KvdiobQhNxR9BpylUM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654356; c=relaxed/simple;
	bh=r8A1/OXEw484ZNsSIzg2VWYDtiy/WuZ8xA8QHJ5Y0E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=av3973jvg2UNW1/mzgQkz3BXpPz9TRCTLMdQUSxlTmN+f3tM44/UWTtQhEb+TYQluclFkjdAdzQaG6jVsL5BE82T1lDxJxKPQ9wGGV0MlFMj2ky+n8vhR3n1sZ6l76/b9klx09VAqU3Z0IYlDzel/cpsYRrX0au/KprsHjMjCPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=s7rgqNIk; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="s7rgqNIk"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85e751cffbeso361125139f.0
        for <spacemit@lists.linux.dev>; Mon, 14 Apr 2025 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744654352; x=1745259152; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W++7Ey3dQSUtlzRbYLNczC2fDf4DSp323YSWaoMgCKM=;
        b=s7rgqNIkIAmfFd5daYlNYdfZmtEoNiBoU94PT4DImjoDjm551ZtudenIuKFraJDnYV
         4gUXrPEL2Sqdl8X985wGdpEIKPj3cNjHF6fo4wF/sIFLVnVQgDRBhoddf2svJuyYzB2n
         HVEfSwgKwNv4ZfYS9oGIsZy3P8eqhte9HxgusZ3AsimAu6G/3ykpMvsPJ69Z2A7WQl2i
         Oq5hi0SfBma+1IpV3tesjObOoO6n37UMruFMWuuovlMeBm96eEIJFCiDLpcS7oK4+WZR
         6tigeD9etjXndSRDxuKNtul85FKSUg5uBMMxwWDOup3/ASQKS2fqxexrfI4CuyUo2vf8
         3AdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654352; x=1745259152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W++7Ey3dQSUtlzRbYLNczC2fDf4DSp323YSWaoMgCKM=;
        b=iK+dZ5xUSLlUcKNY4j2LbqGQDzN+Oo1fNngAvTYEA1FZEKR8lPoU1Y+uxJ8lR1HF0X
         5sQkumd7m4pJBhBnRFT5JygKH5xOiUfCjLE4bGJ8/lF1dgdWs3TEfoxJOjDu5RMsaqDW
         OSPoBDTskKWlpoqhdRL6SZGsbdKKU1Yp2EakjwR4RUoOrtPROREofgxzYv2VuBaxl74p
         Zv5UZNL9JCC4hZvUZRl7gJF+nuU3OREuAgsupXp7lAbGh1Dq4UG9iaEAdND0v+EkJaGU
         FAzvMxjh3toLmCplAx1dkdlU7N37lBWfkoTR4QJ1AC2UIvmgQcSjqmZmDDloNLdWJvha
         G41w==
X-Forwarded-Encrypted: i=1; AJvYcCXKEDoNFFWoZX+RVTw6Rh5b6d5dXJ+IAklmB3fn3Ket7a4EASQFNuYffs3RDTRU+0aHq7ojFuhMQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwT52hW5P66ggflzHWqv/LWAQuMETfHF4KTQugllx10DsOZ5oQD
	3QX8HY0JPhRcxqGzPvnOa2Jcgxk1REfqJD0mFj1KpzJn1Ft2GkLeOFoaK2In4ec=
X-Gm-Gg: ASbGncuSJ2N2IPdv8i4L8xydmLXxWkDuNlhVl9O5uPy/qoYQpp2r53mw+a/3W8QwKMZ
	3/HbZIfsk6JYSnlo7Gdc0ErGeKsygxBikCmBz+KyHjekV0CvyVJDmUXFt1zp3IwSTnUbvJ+nB3A
	0jQ+rBvxZMFGIeeJbm7ZXxwNp7i9cMSa5TS+/1JlKSz4RUV1bhNkztHoa1XFQGJTUkdtBzhMhZP
	HyPs6Cn4Y9OerscurevqSqqLBVDA6v5tgYd/xByX1iFeEeYQahKbLho+KjgVFXKPUuyjPKGUeWh
	xR5DTW2JnvPAWd06mUkCIdOK1fox0bOPq32c3CuszXgjDCvccQ53mU5JkG4gXQrHwualJ4ywu8C
	QEQqx
X-Google-Smtp-Source: AGHT+IE/wgwkbNsHlK2gyNx1GJkEELkMB3G+2KIj9Z8NP9udlt6BR88zVmXF8+R9i96TFdJe49eIEA==
X-Received: by 2002:a05:6602:728f:b0:85d:a1c4:ee03 with SMTP id ca18e2360f4ac-8617cbbbb51mr1548100739f.7.1744654351717;
        Mon, 14 Apr 2025 11:12:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165428af3sm219588339f.15.2025.04.14.11.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:12:31 -0700 (PDT)
Message-ID: <b557a075-a184-4234-9793-ca1d13eac9df@riscstar.com>
Date: Mon, 14 Apr 2025 13:12:29 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250412074423.38517-5-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/25 2:44 AM, Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy

s/atomiciy/atomicity/

I think Yixun can tweak that for you.

> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

This looks good to me!

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/Kconfig               |    1 +
>   drivers/clk/Makefile              |    1 +
>   drivers/clk/spacemit/Kconfig      |   18 +
>   drivers/clk/spacemit/Makefile     |    5 +
>   drivers/clk/spacemit/ccu-k1.c     | 1154 +++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |   48 ++
>   drivers/clk/spacemit/ccu_ddn.c    |   83 +++
>   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>   drivers/clk/spacemit/ccu_mix.c    |  268 +++++++
>   drivers/clk/spacemit/ccu_mix.h    |  218 ++++++
>   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>   drivers/clk/spacemit/ccu_pll.h    |   86 +++
>   12 files changed, 2086 insertions(+)
>   create mode 100644 drivers/clk/spacemit/Kconfig
>   create mode 100644 drivers/clk/spacemit/Makefile
>   create mode 100644 drivers/clk/spacemit/ccu-k1.c
>   create mode 100644 drivers/clk/spacemit/ccu_common.h
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>   create mode 100644 drivers/clk/spacemit/ccu_mix.c
>   create mode 100644 drivers/clk/spacemit/ccu_mix.h
>   create mode 100644 drivers/clk/spacemit/ccu_pll.c
>   create mode 100644 drivers/clk/spacemit/ccu_pll.h
. . .
