Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163373BAD96
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077385; cv=none; b=AI6qpKGrsViGVyhoOUIsAU46WZJueHSvbhXADjNvV4cKM6Pl76n6Lc8/MBJmVOcRDNxM1HJglRWsjGW48CDV4tZEfhxsOKPmmgwYYGoAf8PSc13AEgxfktBittgh7exn7dxw2jwIT5cgG7ndnXUg6RyNv9b7fA5xxqveOhVwpGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077385; c=relaxed/simple;
	bh=ANNS0ARrq+yqt38ilBc0b/VrBSbg8FDzwRhQod1Hlxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbKPFVQ/OKBKa2LVZ7hXLugtrO++UzbdiPeGNGKhNTLxeIh/wGylvRsY3z5+bGXaKb12cSmKy4m6HV41qKTKBFt1oKoJ7RAQgt/bestHs0yr1tGNFjOR8CLfppWAKAMgguL4Q+b3J2/7v73KjtqTacuwwOt49asbI7+1iIPY77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5+jvsXD; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5+jvsXD"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so1862417b3a.1
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776077383; x=1776682183; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NprvUAprn5meoPNFX+W3YdkJtUZncCH1TUsT0ByUXfo=;
        b=Z5+jvsXDaMy5aVoiizsbiUXdhnM+HCW56POyUlv5S0VY3H/t5niAPjZyswkRqLsgIy
         C/xn6Iy82qW9ro+A8PkYqIo3+AmgHdMgRovnijkFr2EgYjxApYeNJk9obMS7RUnaJOXp
         9v8530MOkDKhW7xX+7X4fhUu4JfKRCIhgyioSsmDHiMxmA2GM4NRth4eV4yfWeBG8F8r
         22/A+HktyJKYx1Z4TrDckxO7sgKB3VKBNyXXVHwybVnUqJDWBbHrXnnvtrPJEcmP9plp
         csaEyzaNNTVB3fzD4Moy8Wst2jpth7Z4EUuGtNVEx/TtBTsoUCydC/pL0d5FndZwc41j
         1GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776077383; x=1776682183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NprvUAprn5meoPNFX+W3YdkJtUZncCH1TUsT0ByUXfo=;
        b=sSFf0/jimH9W4qqJAH1iiN0ivAaSSASWQxi5uOkw2ZYr/2Sb1pKr+JS1F5xgBnrdPA
         2PHcebd1umGXMeq0JYyFNk9Eaq+bWEGoCQk/A6TalENH1M4VS6YvjdP1ZHTAhGbDS8I2
         ZmS+aoAd8gCMB4JP1GvQOMNfYqZ5oHHS3aNdg1yJydxXeZNApjJHqqLIKBHWHEx6TVKI
         THc0JYIUVqkkQdbR2J2c1IDDzJZoCidabKpNVejECb6ou56ecGufL1FctVzG2o5yXWL6
         Hm16LgEGtMoNzZWTbKpG7pVye7tPZ/Ig2yXQm7FZxdfnDYAKcev9dzzmQCUD4jKcZU9/
         xiiA==
X-Forwarded-Encrypted: i=1; AFNElJ9TwsFGtkfptjLLbNzD8ObgnLW3qc7r57+huS+ek5NJVJnorArAWMpyIToMjKVobXkMl3OV+Nwc3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCt94x92HvV9cAPh6URzFAVpkBtRrp6PRnOewjG5tFBJcJf8Ti
	K1jvQ4qQWQ1vJQpNdai9/VhT0jIJTNy8CLq9QBRpG+D3h/LW3AQtTjUKtM918urXa2A=
X-Gm-Gg: AeBDieupGB264cJ7a+d79Si4R6xBIAWzSncbbOnD2Brglv1UdGStauC/V7CzLTOx3OI
	PBciAa/ypJeHPLgOaF7xi7maOJKcNwexWUNVgEL8BBgBxzrijj6qgb6ydTfvuV7lZ1+ZNobUWdM
	PoGOlCJwtnSOKiuqHh5DkMcxFdFe+bSVELvoOpz7YlPV+VMXA81nbneMg/0BvCPg+05jtOArLsT
	O9uoVP5p1LttohtQ96p7WUBi5PahlHPW8DTV51l0ZxmZQiyht5Ds1/+yevPqxwGLeq77JIzLGVy
	C6EAEGAxhwl31hGK4kNLOHOO76vjzNis51Ysu+zLTa+vQDm8sCAG+zKyEM5Mkn1QhUe5so765fB
	qiXXkWb4ejU0Io6Fl34aYFMTXjd/fGOjdpRq/xcAAaLxN3qxCJHQ9I1KqRqR2OeRYvPQmaLwH7x
	eqZLCv1sBIFQI3wb4CS+KkQZdN
X-Received: by 2002:a05:6a00:398d:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-82f0c187fa6mr13079040b3a.24.1776077383128;
        Mon, 13 Apr 2026 03:49:43 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm12070430b3a.13.2026.04.13.03.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:49:42 -0700 (PDT)
Date: Mon, 13 Apr 2026 16:19:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Message-ID: <siqn3bu63fxp7ignbaleamvfqskhjjtuzqp64taynlvz2vtiwq@uhpitslu3xnb>
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>

On 10-04-26, 15:58, Shuwei Wu wrote:
> This series enables dynamic voltage and frequency scaling (DVFS) for
> the SpacemiT K1 SoC using the generic cpufreq-dt driver.
> 
> Tested on Banana Pi BPI-F3, the execution time scales as expected
> across different CPU frequencies:
> 
> ~ # echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> 
> ~ # echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.07s
> user    0m 1.07s
> sys     0m 0.00s
> 
> ~ # echo 1228800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.40s
> user    0m 1.40s
> sys     0m 0.00s
> 
> ~ # echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.72s
> user    0m 1.72s
> sys     0m 0.00s
> 
> ~ # echo 819000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 2.10s
> user    0m 2.10s
> sys     0m 0.00s
> 
> ~ # echo 614400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 2.80s
> user    0m 2.80s
> sys     0m 0.00s
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
> Changes in v2:
> - Move OPP tables to dedicated k1-opp.dtsi
> - Enable OPP only on BPI-F3 with cpu-supply present
> - Link to v1: https://lore.kernel.org/r/20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org
> 
> ---
> Shuwei Wu (2):
>       cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
>       riscv: dts: spacemit: Add cpu scaling for K1 SoC
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>  drivers/cpufreq/cpufreq-dt-platdev.c            |   1 +
>  4 files changed, 148 insertions(+), 1 deletion(-)

Feel free to take it via the arch code.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
