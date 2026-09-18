Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA22E22B5
	for <spacemit@lists.linux.dev>; Fri, 18 Sep 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723122; cv=none; b=aKA768FZEOPX7uscf0cu6huGnoQ90Ft6+GI9h2Lnp7kgkxMpLJUCwtsQFhv9kbYzHFS4EQ5E7lGmRP4jed8dTdV38fYYWiWlFkxKPvlynKlEAxUsbiA9DSDf4z7t5lJpBHitwu58NqJfHULkWpH6nuyO9SD7HjLa6/HTHsyARHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723122; c=relaxed/simple;
	bh=hai/QUIPAgSzPAy9uDMtWXL71pMRYdCoXrizvpLVbsc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=T/M164coYZb0p/7tVQjztSsBvjrb4GJNFjMpino5G8PBF9fkoYa3LAGtf16ZrmMMp8Q7l1NYAuCwaePxioSfpEpPJVlUEWPlX779MwqbsUQVIv1MDuTZygMHpB3479sefNwbc3aUXJVwxDgl2kfEVliefb3Tv9B1K0RB7NYDMjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN0/TB3a; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN0/TB3a"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so337794f8f.3
        for <spacemit@lists.linux.dev>; Fri, 18 Sep 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789723116; x=1790327916; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=311CbtIzx9npjWw+G87XYnFPfpSHlH7etn98HacsseU=;
        b=WN0/TB3a4zkXUrnpwe7fkeSkJJX6jsI63SeN0ZeZ70gMquPVap/jSKEl8+4mI1JobL
         ng05VSf2bHt6yd/We+e1jCCsLg1pFmwr+8f3iLq4arNVTeB2tkX8WW1vO0mFVXJ+Z1wc
         pVbK3WdACB0V3KN1wlP7r9vrA/z3j8s/fTQSFYqQWTzfclgc7swir40oouIft/017c1m
         WOPex6P0S1SBwypTLs7EKO8OGzDDvKBek23g8H6bunjHjyplI31PSP+RtXQQ4U/qEm+/
         TDmLy9QnALas9Lv7pwZDOdXYGuht/ox9o90B6e6gt/cky01vr6Fu/StmjEgF2KXwtyFY
         1OCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723116; x=1790327916;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=311CbtIzx9npjWw+G87XYnFPfpSHlH7etn98HacsseU=;
        b=dCa9tvaCNzY/C7wdHkPQ5ibztXibmJdF4BOyPjEGGKb7FmnWtQjPjI5eU2gnGMX6No
         DZPPGRcgeyWne/tcUVz7iInjtavZcyV/ZDSM7McTwdSFyBXAHV+CZJ37zCg3P+7lM9L/
         jlQ7c0OUCPU5W0b7fl4QRdgd00E/5e8blpqOKJSHqygTdUu5ktehSgea8kQB7iM14jZA
         vKLSN0iACVcNkpOA01WTS2wdRrD/FdMdteLyfLlgvJi9GNfXThy1+p3yk1Llp2sWvhTM
         nEM6f/7g+OSzIlF6n6IoOyZMPJJP1Y1sNAK1plWwYZopw8sJM539xUHxrgwBy9eKYvzu
         W8fA==
X-Forwarded-Encrypted: i=1; AKwUvBxMiBlbVwzvMaDhqo89qjtuyrw6JJsLnJFnrM0clh+b0k68UqEitzDlFxpidgTWWCg1z4rF4CI2CA==@lists.linux.dev
X-Gm-Message-State: AFuF++ll9mA0xh0bGDyWcS8jcj0vXZLB35D+NSwyG/bzQ4e2QI18DCTn
	a5LM8f/ukPMHUH+Wa3iyiU4X8SHPz2EQciUUt9jXGeStaIshrVybWXWY
X-Gm-Gg: AYBFou23Er0NXVKLbDV6EZCOQHjxdFpNzTbEw++c2LzX144wBlr6k8EgVPV690fBsFq
	oz5kTlTIp/tpdE1Z65V3aMfJYT+KPWRdDJzL+2YWj5CIsaplV2PnPI+q60s2VpVKMvwEzIqJnRn
	HGlTHa2mRYoaA+6kPwnQSzH1Fkc1G9e6O9Yv3SUOJFgh6vAoKP+0RzIdeqyfDmuPdlWdWQivoAD
	Y6q3ntTsXDexaw5R/QR21bE/YNnUBpOBkBoY4lANnL1K+8WOrmKvDKamH7evr314VgDIjTfnd48
	XYcF/GqBf0DWk4PSxeum+H5B+OZcfvfd032oepKFR5g5nJqWnNjySHlM6NPxRQeoUA1f6Ts1kHv
	Mk8JvvfSTmEOBYwdbapOAtJ0os31N68jE3rC9pH6fZ/wlvnAU1CUccGQu8pq428hyUTnWsh2tXG
	7/H+3eR83LrArFJR5ClNL+geZDJGViKY2uzas2bM0QLDNDb7kAokHzKE2zAvo37QIVHciR64F4L
	Jhwa3eKplMm0KB3yw7elQCuRaKyNoafXUaYcQ==
X-Received: by 2002:a05:6000:18a9:b0:487:88b:4681 with SMTP id ffacd0b85a97d-4871e21aa62mr4609512f8f.10.1789723116095;
        Fri, 18 Sep 2026 02:18:36 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-130-19.net-htp.de. [89.182.130.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff56411sm2649337f8f.21.2026.09.18.02.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:18:35 -0700 (PDT)
Message-ID: <ac94820c-5e34-4f07-91de-d08e1d4ef629@gmail.com>
Date: Fri, 18 Sep 2026 11:18:33 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260804133236.205668-1-a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

friendly ping, anything left for me to do here?

Thanks,
Andre

On 04.08.26 3:32 PM, Andre Heider wrote:
> This series adds cpu scaling for 3 boards, each authored and tested by a
> community member on their device:
> 
> - k1-musepi-pro
>    fixed include order
>    v1: https://lore.kernel.org/all/20260614122812.2287506-1-a.heider@gmail.com/
> 
> - orangepi-rv2
>    unchanged, included here because it's still unmerged, probably just
>    fell through the cracks
>    v2: https://lore.kernel.org/spacemit/20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com/
> 
> - k1-orangepi-r2s
>    new patch from Vincent, cc'ed
>    origin: https://github.com/dhewg/openwrt/pull/3
> 
> Andre Heider (1):
>    riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
> 
> Jonatan Hazell (1):
>    riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC
> 
> Vincent Legoll (1):
>    riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC
> 
>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
>   .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 35 ++++++++++++++++++-
>   .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 35 ++++++++++++++++++-
>   3 files changed, 102 insertions(+), 3 deletions(-)
> 

