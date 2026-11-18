Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986430;
	b=2UQYIPfI15AD6FjIf3pwDpms87UkzKYFfRd0Zt0WdOwqdhY33raPpHRN0+MJg+A/Osz9
	 PpxK1i84oagEmOTzvQ6eA2OlSCpMaojOql0gg7FXm3eIJkQNytvvfc+pBm2Qtb/6j8YyN
	 CvH7p+hnkr1LRnA2exuvqP4XEOzN7cGG/kpAcTvhkfcZpYU5t+7bKpfeuyfB/kgIgV+xz
	 1ErrmXzeLskzbvsVD5uljom8JxUKbH2pXOcfTTrdK2mDSq3h5uNWGVR/ksfoMYyBLC0es
	 58RvL3/FZBeZtcLliJ8ZTWqCz3h5cvTevoY11Zyy2hDGJRukz0r88Q4FRgwUsW0NmoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986430;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lxx1A+zrwMot67CrXBF9WBlbfa11lGwCfKsvX/5BHN0=;
	b=5AhfIq2t37WIbnV57qajvJUTJJQAfN62iOPQaVVC4JTot0PPcDnphTN8majONEty2Xfl
	 IQ6+r6uX0ilFWYQRYZuehlN/pMwFEYX/WkIpCHtxCivuMX2uXuTrz/UtvniaSqTu+2soM
	 HiN3p8Fu2sdfLj6SnlF4fbrlbYeFsNJ19h//Hpd/XJTLdrejSNRA6OBPqRaVpR3tOdj8s
	 O+rRECNEFmSo2uxStFxFzZ1WjuZxcjPjT2UMn7froHqQkNBa1dHkhjEGGy5rgXi9iCIb7
	 1p+vUzz803Dl+0vlpI4RohBzuQOlpG4s2BFt9jjfMaOxqQnkvT7oYgR5H2tTQKzFshA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mboLPc58;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CC3606A31C
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mboLPc58
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FC61F000C4;
	Wed, 18 Nov 2026 07:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794986430;
	bh=lxx1A+zrwMot67CrXBF9WBlbfa11lGwCfKsvX/5BHN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mboLPc58hAAEuz7c1hMop3M67riiBc030zRMMnTF0p32VJzEF9mKK6xcnntUNIRaE
	 KID5Li5SumEH3GzeQPbVWUsQjIOzXr8YTreTI7sthCupAeyB7xEP9WREyHe6syoWrv
	 melivE07ruhJC/FDTKrwDl8rO547aILvOYIkeWjHwAbIgu2+Sr9pbF/1CrCMN10CTu
	 ngYonohFo5TwFWuTFxd6K7wAaE35mrZH9n8rPjgT36+LJFaM7+tggSZH6hmxZ/CsLk
	 hci0rSn0F4quihF1frlndN7z1TbnUH/UyNt2VdsgwoEwgpAvSoeH8tPqPzX6wJZZhu
	 aIUtaUUjq2cEQ==
Date: Wed, 18 Nov 2026 07:20:26 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/2] SpacemiT K3 use 8gb memory size on CoM260 and
 Pico-ITX
Message-ID: <20261118072026-GKB156369@kernel.org>
References: <20261115195112.32120-1-e@freeshell.de>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115195112.32120-1-e@freeshell.de>


On 11:50 Sun 15 Nov     , E Shattow wrote:
> Adjust from 16GiB to 8GiB memory size configuration on CoM260
> and Pico-ITX for compatibility with 8GiB/16GiB/32GiB configurations.
> 
> It is expected that the bootloader will read EEPROM TLV value for
> ID of the EEPROM part and adjust the device tree node accordingly.
> In the simple case where adjustment is not performed however, then
> the previous 16GiB range may overflow a 8GiB DRAM optioned board.
> 
> DeepComputing FML13v05 is sold in 16GiB/32GiB variants and not 8GiB
> so it remains as 16GiB configuration.
> 
> E Shattow (2):
>   riscv: dts: spacemit: k3: use com260 8gb memory configuration
>   riscv: dts: spacemit: k3: use pico-itx 8gb memory configuration
> 
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
For the series, 

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
