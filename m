Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371F46EF98
	for <spacemit@lists.linux.dev>; Wed,  7 Oct 2026 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365714; cv=none; b=Co7a4n7ykVl7O0paCkhkYV2gY+KEe7fQDjTW79ZiIjmeXTdyRoqgxUhDDuhB1vpyJuYGrrG+haFRu+eQ3RqDvffLlMMtrdhhwFSCPM5bDA97hvcELyQThP2E1CZQjRyL3tzz6d+vijRKbI4k/4kHQ5Q7JlPjE7zA1m4sI2jtLY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365714; c=relaxed/simple;
	bh=zqA5PvJY1fJQyXB9bHamhsTkPJAzH/6Qx+yMMP48LyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pykEQnAONFgEXKEhxqXrjAbxaTG+1JUAW9kxFGM10n0gmwxcbsFui9qtEOno9/6S03svSa67gyZx0Bs5JKKH65vjU9e2+GWu16WbgznPVDaZvJRR3hwrmyEIdEqbApkpiFKZO4OkNvW/1EUEzpYdGRDgN983oT9PQXiWFJporO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=g8549FOz; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="g8549FOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791365656;
	bh=nx4BSnQh05oo5ZGU1CkIRTp4bDe4NnZqsSUeNy1DZ+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g8549FOz4DwFj/G9ThXOz3Eoh4c+2V+gx4U6tHZUKUX/yDZxXl+lwSfut3bEeX2iO
	 HiL1WEHqGcHS5V3gsytQwCjeJS3tE3sqoFWR23S7zePazsbs33dN+ZC6+mYIb6srAC
	 y5x3TfHkqhBPRonSAi1mK6Od3nfZnntfGtmMwLG8/C2QdkuZdL2NDjde9jSveRhTxT
	 1E4LI0xeYGrdXyMQUUvbDrgKyM7jiw0XZTWF8rnEageY+8aTfcQLFWbOjNmx2/uNBa
	 FHlRUYWWly+k3idq+xoZVId3eLx5rMsRPJG2FV3xAwTa2AgVmxdgl3jkbqnt0mE4e8
	 CYkN+uESqWNew==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id D0176B220CC4;
	Wed,  7 Oct 2026 11:34:13 +0200 (CEST)
Message-ID: <0ca9ef8b-67d1-40f2-b4ad-c9b53bce7019@freeshell.de>
Date: Wed, 7 Oct 2026 02:34:11 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] spacemit: k3: add clock and reset support
To: Yixun Lan <dlan@kernel.org>, u-boot@lists.u-boot-project.org
Cc: spacemit@lists.linux.dev, u-boot-spacemit@groups.io,
 Lukasz Majewski <lukma@denx.de>, Tom Rini <trini@konsulko.com>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Raymond Mao
 <raymond.mao@riscstar.com>, Guodong Xu <guodong.xu@oss.qualcomm.com>,
 Peng Fan <peng.fan@nxp.com>, Torsten Duwe <duwe@suse.de>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@flipper.net>
References: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 02:34, Yixun Lan wrote:
> This series try to add clock and reset driver support for SpacemiT K3 SoC,
> the patches are largely based on upstream linux framework.
> 
> The reset BITs definition lives in the same register with clock
> controller which make them tight coupled, so I'm also putting reset
> patches in this series.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v2:
> - add complete PLL clock tables
> - drop patch for SPL
> - Link to v1: https://patch.msgid.link/20260825-01-k3-clock-reset-support-v1-0-c430253e759c@kernel.org
> 
> ---
> Yixun Lan (8):
>       clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()
>       clk: spacemit: ccu_mix: add inverted enable gate clock
>       clk: spacemit: ccu_pll: add plla type clock
>       clk: spacemit: k3: extract common header
>       clk: spacemit: k3: add the clock tree
>       clk: spacemit: k3: add CPU PLL rate tables
>       reset: spacemit: Extract common K1 reset code
>       reset: spacemit: Add SpacemiT K3 reset driver
> 
>  drivers/clk/spacemit/Kconfig                   |    9 +
>  drivers/clk/spacemit/Makefile                  |    1 +
>  drivers/clk/spacemit/clk-k3.c                  | 2049 ++++++++++++++++++++++++
>  drivers/clk/spacemit/clk_common.h              |    1 +
>  drivers/clk/spacemit/clk_mix.c                 |    9 +-
>  drivers/clk/spacemit/clk_mix.h                 |   27 +-
>  drivers/clk/spacemit/clk_pll.c                 |  124 +-
>  drivers/clk/spacemit/clk_pll.h                 |   43 +-
>  drivers/reset/Kconfig                          |    1 +
>  drivers/reset/Makefile                         |    2 +-
>  drivers/reset/spacemit/Kconfig                 |   22 +
>  drivers/reset/spacemit/Makefile                |    4 +-
>  drivers/reset/spacemit/reset-spacemit-common.c |   93 ++
>  drivers/reset/spacemit/reset-spacemit-common.h |   40 +
>  drivers/reset/spacemit/reset-spacemit-k1.c     |  128 +-
>  drivers/reset/spacemit/reset-spacemit-k3.c     |  242 +++
>  include/soc/spacemit/k3-reset.h                |   21 +
>  include/soc/spacemit/k3-syscon.h               |  271 ++++
>  18 files changed, 2955 insertions(+), 132 deletions(-)
> ---
> base-commit: a06e89ab05eaa2b8344d521319399333cd760ae5
> change-id: 20260824-01-k3-clock-reset-support-815a0045526a
> 
> Best regards,
> --  
> Yixun Lan <dlan@kernel.org>
> 

For the series,

Acked-by: E Shattow <e@freeshell.de>
