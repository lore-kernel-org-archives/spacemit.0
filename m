Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB438284B53
	for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288361; cv=none; b=H1JzMf5EcIBIQuTK3H1R0iq4Heqif1M6l8/Ntqpxh7F6YAhdB0LnMonzsZEH2PViK1gHtUgr0j0byBK4p36wGA5urnwWV+SzyKflvmpOpuMYSaAAyjPFbxqipjNgwz1s3zKRkdm9G8fewEZSg68/9G9NCqFjNGhZwYNzoY0H8Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288361; c=relaxed/simple;
	bh=vaduyXSktTjHWIM6mMUVuzB/JU/7o9Vgbb4ojf5mTUE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LMbhJ2WjPQ4k4k2W1G3XO/7RdR1q2IpKaaCOvAco9wgeK0lrG330rU7MdggwKgiPvxOOLftad9OmsQRYdApjQsxLxzNr9Xf82VRTyNA8UteVfArRyOjiH7+nWfluJaKx913L/MtR1BMliuU1Rjc47gH4qGDacNONEpCAqYRQILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KXeg9WPv; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KXeg9WPv"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c76a1b574cso246708fac.2
        for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744288359; x=1744893159; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvSNTACO1SZCY31F0gRrZZq+wvkmlB8UFBxIZ9DVjtE=;
        b=KXeg9WPv9SUjO7YMYiKZRnL/cansdFdqLAYukGEzSx2IcrFTJkW8IpzBpngHUKVKKu
         ChphwN/9silWiVweS4LfnxgSCs2WE+DOvGE9Nhz1aHkPvs3kThGlzLG1DBTbX0/NGEDI
         fls4BCBAHJYS9FGAo03w8DK/77AvSHlVex8sEfm94LDS+QhaHRLkJBoUdqXmuls1wT1j
         lrzO5dH/8taNwj+B8c7Vr2v18wo6Gj3VLYrXRynZomaFPegXTVl6bipP3xJAV9Un51rL
         wSJc9DmOtPp3Y1WH/3UzDbVedQ8EXJPlHocVQhPOZObyXkqwlFEa7WSRiBlr6Wtghf37
         Nqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288359; x=1744893159;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvSNTACO1SZCY31F0gRrZZq+wvkmlB8UFBxIZ9DVjtE=;
        b=oaqH8Y+AdfDJ0yjFGQfswlQmDG9net9/BpzZxc6jKGsj6W14bAfFucrE5I1Xj5zb7K
         55webepKcfWkhGAxb6eiBHgkHXtMK8ZUcDihHiaHwRvI+g6FES/dyJI3fjScVuhWpZRc
         MbVTJd0JIYnl9qXvAy3rR/G75WAAMRmRXKm/Lr2Pv5o+/IVKPaU0qq2bc5tz6fw+WQbb
         y9XmHyLi3O7spu+d+huYnIDwuvOvPVvfZEcj7T7djKLHsXkxKT3obYcBKKZpjWVTpcjQ
         ALket7SAy6UHD9fU8SJ4tzgTVDiolzjAMXz/dr/pOk8c++8Fq4YADZ8FckcyiFPOoHZ+
         IRqA==
X-Forwarded-Encrypted: i=1; AJvYcCXbHeJBRNNs2LucLop5H58cQxeQuOxZvjs4tSRLvAEqnV5cSYG37QOIU6CQDSZZwQZQGgoAHBThIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTbjMdnwr8Lu0VmvLcCgTJ3QY/P+I1nBWHn/WuXX0klYrBWFKq
	9taX6A4Cj8YkpQ1G6hJwcaWA9QC+YqZBDhhEvajmLQ3ulOZ8yAsMzQ5i/WIu6I0=
X-Gm-Gg: ASbGnctUOqwqtvDSfngHX1IX3B3U/GX/M2RJPChaGtAdYAvymupDeTNqjBN17mofydH
	vhjeF2QkF+3elv3mTFW7xsZfMeW3mVSy8AJxw8GzpgP/zLUGBCDGEWu8DEu+FdSqtWIKwf48wHT
	JLSEARTmPazIXKc8HyajWri0NuR+djEoufn2oEX71UO3G2bVtFuazYye6hCmT+TkE9ax9muNps8
	uWd8AsFEa96w0Z0VRF3YMaxqjwpbD+6dQO9U2F3qGQNN0LklRgHTMAr7skRm6AFS0Wp1XMmWmi6
	XgMaw5/m4a8IDDIwl1HUHY9qGw2qE2t+Hd9Nd6Q/p8G4t/UFqDOPSSMcaGlCNjxqvMoTRlBaUk0
	/FgBH
X-Google-Smtp-Source: AGHT+IEJuAZEVXhBtSWrNjlEQvBiq7KT4K1Km9MSzZyjIkHUjkvVril1VSVFFBGM/J31v9xCTSVpWA==
X-Received: by 2002:a05:6808:7004:b0:3f7:f7b7:88b with SMTP id 5614622812f47-4007bcdc348mr1582330b6e.21.1744288358751;
        Thu, 10 Apr 2025 05:32:38 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f5b28basm505694eaf.36.2025.04.10.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:32:38 -0700 (PDT)
Message-ID: <0ed3ce4c-9be0-485b-a1ea-6a34931179db@riscstar.com>
Date: Thu, 10 Apr 2025 07:32:36 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
From: Alex Elder <elder@riscstar.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
 <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
 <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Content-Language: en-US
In-Reply-To: <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 7:30 AM, Alex Elder wrote:
> 
> I'd like to see that be the only thing there, and have
> various SpacemiT modules define default values that
> depend on ARCH_SPACEMIT (or _K1) in their Kconfig
> file.  Like:
> 
>      config SPACEMIT_K1_CCU
>          tristate "Support for SpacemiT K1 SoC"
>          depends on ARCH_SPACEMIT || COMPILE_TEST
>          default m if ARCH_SPACEMIT
> 
> I *think* Haylen said that's what he's going to do.  You
> could make it "default ARCH_SPACEMIT" too, though that
> builds it in to the kernel.

Nope, I just reread what he said, and I'm mistaken.  Go
with what's preferred by the clock maintainers.

					-Alex
