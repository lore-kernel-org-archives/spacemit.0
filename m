Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0525B2FE
	for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274271; cv=none; b=A2yChkvd55MJGuWPLT/lYGhYL6US8TKLpPwhE0l8/mlgNVtTaOxYT4bmiKcD53rsptP5tLJTgJTgw7GQQuB6UqL2pwjB6b/By1+4APYZ4GcWbZS88WlPd3eELL4zIb/OADZFWNyOQ700YKvm2c87aCKyqx42J1Ae96CCIzHVnlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274271; c=relaxed/simple;
	bh=NyKqzzjL8Ljt9uODny9UYo/Dpru9ZB1VRSVbZL903Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGcNpZz8Ym+7AvRq9HSYbkp+Y7bwEvOyWAVeawew8mV8Z9GWpg6sha7qqt37mguvpauDwWs7tf6ZP1qVeFVy0xV+O7MkpbdmgFr20PQptiiIuEUJe4Q8avpqpuu5tgqcmAL7BG/dplBzj5dXetXI2Se4VFu+8S9ixKMqZ4aRKAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 09EE3341FEB;
	Fri, 19 Sep 2025 09:31:08 +0000 (UTC)
Date: Fri, 19 Sep 2025 17:31:04 +0800
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Elder <elder@riscstar.com>,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.18
Message-ID: <20250919093104-GYB1279412@gentoo.org>
References: <20250919055525-GYC5766558@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919055525-GYC5766558@gentoo.org>

Hi Arnd,

On 05:57 Fri 19 Sep     , Yixun Lan wrote:
> Hi Arnd,
> 
>    Please pull SpacemiT's DeviceTree changes for v6.18
> 
> Yixun Lan
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.18-1
> 
> for you to fetch changes up to 0f084b221e2c5ba16eca85b3d2497f9486bd0329:
> 
>   riscv: dts: spacemit: uart: remove sec_uart1 device node (2025-09-04 08:50:29 +0800)
> 

I just want to let you aware there is a potentional conflict with this PR(trivial),
please see more context from below link, I've already CCed to you, thanks

https://lore.kernel.org/all/20250919092507-GYA1279412@gentoo.org/

-- 
Yixun Lan (dlan)
