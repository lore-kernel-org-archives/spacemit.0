Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA4B3AF65C
	for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 07:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163012; cv=none; b=QOCsEmbd+Jq1MItyuwIXfHBSzeB4bleK4f8VLxytwAKH0/4GrlPum4kDFReU+Z2K/03zayVzKhFfZYzaWEhdPYJoAsd3CDbzqe60cH8zkeTqaqj95/enlvMRa5uLi5Xj7XAr3H44prj9YC9yIveO2eHwJbSNOHH6pwazNEZPFDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163012; c=relaxed/simple;
	bh=fDrU3y/yTatGDnB3UYv1FrktwPZBuB5O5BWi06QqeOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3mtgqleMBXqm1KifJkNneTSCMHgRxqctc2t1h2b304gmKYncVUEY0hYf8pz+bdBtXezt7+w2fxpmq6X64sk0ogcw1UJrQaJPFVsU6vRHCrmingDpwMLo4bgF5RwNJ3nSEioQAs4aHk03sCoS+gbhRj14xpgBpNxg681Z9TKX7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=kPUPwVyS; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="kPUPwVyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1781162962;
	bh=tXwNWGOOumPfnfOExtCjj1A+ApEBHFbhZpzx7F0Nykc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kPUPwVySZMqiuG04aTeDdngzZ8VBrEfoCzQmkf1gC5+nZLlUJmtoVsoEdMfuuFlOI
	 wG07rIGtS39S877IWhyCcItkK4+43/gK2djrW+MSEv/L/V5BDy5RGCBQ2Ox0zCNEhC
	 927q87yHJSGxFzAHdPuurfGTJxEqDbyinPTAvQLPslaAKh3EMCB3J4FOroTWuqMXq2
	 S/iCDUQv3aM55kyi1pBYM76l9p32AutS4xOuD5UdDIItOBNaeG9SZ9a8wj/jxgPatK
	 QAVPXOXrUbGVSZ3rX6vLtnyCNd7jhR/Vflia/IMjotm9fOJ5p+oyfiTqGJ7Y7y0Vho
	 ZNqLG8KfYVLMA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id A534AB2213AB;
	Thu, 11 Jun 2026 09:29:21 +0200 (CEST)
Message-ID: <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
Date: Thu, 11 Jun 2026 00:29:12 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
To: Andrew Rembrandt <kernel@rembrandt.dev>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork> <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork> <aikmOfazxdrhpty7@mcmanus>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <aikmOfazxdrhpty7@mcmanus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 6/10/26 02:05, Andrew Rembrandt wrote:
> On Wed, Jun 10, 2026 at 07:14:56 am Inochi Amaoto wrote:
>> Do not do this, just leave the rx-internal-delay-ps untouched.
> 
> Sounds good, I'll leave v1 as-is. Many thanks for the review.
> 
> Regards,
> 
> Andrew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I do not notice any difference with or without this property present,
tested Linux -next with U-Boot modification to devicetree:

load usb 0:1 $fdt_addr_r /dtb/spacemit/k3-pico-itx.dtb
fdt addr $fdt_addr_r
fdt resize
fdt header get filesize totalsize
fdt set /soc/ethernet@cac80000 tx-internal-delay-ps <400>
load usb 0:1 $kernel_addr_r /EFI/BOOT/BOOTRISCV64.EFI
# throwaway use of ping is workaround for broken vendor U-Boot
ping 127.0.0.1; bootefi $kernel_addr_r $fdt_addr_r

Aside, there is still some problem with the driver which does cause it
to fail. This can be reproduced by unloading the module and then loading
the module; built from -next with 'olddefconfig' of debian Kconfig for
kernel 7.1, no patches.

# modprobe -r dwmac_spacemit
# modprobe dwmac_spacemit
[   61.469745] spacemit-dwmac cac80000.ethernet end0: cannot attach to
PHY (error: -ENODEV)

[   91.544646] spacemit-dwmac cac80000.ethernet end0: cannot attach to
PHY (error: -ENODEV)

If not reloading the module then I don't see any difference, traffic
passes (ping 1.1.1.1) with or without your suggested
tx-internal-delay-ps property. Is there a specific test to run to
observe expected difference?

Thanks,

-E
