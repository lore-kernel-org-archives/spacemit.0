Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39DB199939
	for <spacemit@lists.linux.dev>; Mon,  7 Jul 2025 22:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751927357; cv=none; b=QGzHq1xZ/8X2XwcFsLKw1FhsB5W5oz3XbVwjrvZ6h+RV5COcA1hpcpKnCSMGotwNSvyoTd2hjEk+1NpB1QOzL2RoAd39+y/97Xwn4G/S0PHMzk2IjJ3Dju3aGelnQqJLViq7HYfLMm9b1XLFg8UD72fII+cpWBkFr4QDRafGmeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751927357; c=relaxed/simple;
	bh=MDF8zUlS1Pi0x+G3G5UDKyYb4IezZltpmz4zl1fscw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlvKatBfn8HaxcLY6xqeQvH/CUcYwlsJUEgNF+gIa13+TgCmF9OSg49E0oc3Ae/NxfjmgjO/wRW8dfN8jsQVN4GYgVVXZ5x9DBtwVzprlM1zKZFuXHgCCmhesLYS5VKqwcEVs7OI2vWYFRqWCtuUrLlcR2BKYk6/hDqI88a50B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 156F6340F39;
	Mon, 07 Jul 2025 22:29:14 +0000 (UTC)
Date: Mon, 7 Jul 2025 22:29:10 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, ukleinek@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be,
	heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com, elder@riscstar.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 6/6] riscv: defconfig: Enable PWM support for SpacemiT
 K1 SoC
Message-ID: <20250707222910-GYC408198@gentoo>
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-7-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429085048.1310409-7-guodong@riscstar.com>

Hi Conor,
  Can you take this patch? I've checked with riscv's tree for-next
branch, it's still applicable and meet the "savedefconfig" criteria.
  Thanks

On 16:50 Tue 29 Apr     , Guodong Xu wrote:
> Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
> to support the PWM controller used on the SpacemiT K1 SoC.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
> v3: No change
> v2: Changed PWM_PXA from built-in to a loadable module (=m)
> 
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3c8e16d71e17..3c4d9bb8f01e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -257,6 +257,8 @@ CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_PM_DEVFREQ=y
>  CONFIG_IIO=y
> +CONFIG_PWM=y
> +CONFIG_PWM_PXA=m
>  CONFIG_THEAD_C900_ACLINT_SSWI=y
>  CONFIG_PHY_SUN4I_USB=m
>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
