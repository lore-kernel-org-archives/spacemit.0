Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCEAC8EB
	for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 04:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783916381; cv=none; b=u6ImNaLN4V++6QiZc500Lq7r3C3dwHc67NO1Cs0JdDDYmx26utm+sMalnBGqdfe7QVYjRWjlf0TI9yrxlh1vwkmYvpuYlkQWjdCt9ODDEN8mdXe8NeHabVAkRXrFTzqcqHe7yq5EQ5L3xy5fpmtTGfWnDErHsVrIazxXbVwW4ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783916381; c=relaxed/simple;
	bh=IxfDQyfKPrGzX5OCPSzHwmJBzwrnlzrD4tLJ1tiunh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwjGhQFfDoBR2q6ydOFHWbWGESHN+1cdP3+k5qCMoQwMDkDpmn0zbfA22tG3nunLhTIKu1XY05zpif++mNYxvZYUzpoDfzZw2v2uxQpk5VjAAtzrzav55TaoEEtGKHyScGOmpCD1EtphLKntJMN9yzUH57HWSVSyIccsxKKWHPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3Q0q4zD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3Q0q4zD"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so256287a91.0
        for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 21:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783916379; x=1784521179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgv4FYkRaN7PLX5rljI9fT7G1HxI9jDppUCYHF4loYE=;
        b=B3Q0q4zD6eEKyu6wPbaftz0BG4K2r1B8o57gLsalCxVuECZKNdANUPPUYSdE+jTw3T
         B1qOaRD9N1VpJbkjApoHCNj9tDlxdwopJXZg+ccCdKh7u9dcZBD88WC+YnEXbzTA46fG
         1NoABsmhJ8F5o70LoCVbJcHEcvvv2XklQveEjuc0JIOnKqv/CHpoX+1EQ9BQFr37eOW0
         vATVUHcXBOhfujkzKju1XAFXR6W9jkcWldrsuXxgVOg1CtuO2qWDveVItQcEaiCk1Vms
         Uk0Lrdsf437OVqSvacJpE4Sv6yvCCIDzOuuVhpGLdMDcAD13ID/8xmyY9CrH8mlChHD2
         KAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783916379; x=1784521179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgv4FYkRaN7PLX5rljI9fT7G1HxI9jDppUCYHF4loYE=;
        b=evlMsSqOqNWXSQPIKxesg0zmLExrrh1256An3+yZGIkSGB8gSkgR6cYdiBt7RWNLnU
         DKTd+w/dRZYJlT/LhahAQbtt8n01/b7juEQxGvSQospH0T+RKeUoL49vVxN74WdzT3r3
         Aq/7T2wTqhkYLPPGKZBAKya+b1wCLIKqJ8QmQbeZk5PiKjPPSqYueRjyg/LHPDq9U87R
         p5YwKILPlZga60ZWHtSQ2l6TkDVCwcmgUejo1+A1qoQ8rUJ2+OFW7hv3XYoMyLDbQM+M
         YsbhjbJhPYeNSrYWoaVQiG+YZD482ierK9N60tgcqytFunFSujXq0KNPCuf1ZUjQM1HP
         5Ifw==
X-Forwarded-Encrypted: i=1; AHgh+RqysHtIwtaUDhFBIZDqBJod0GZqYDH91g47DepC15HCThcVLYVj2PKIqk9oRqJf8IfEHKYVO+zdFA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmh87Uv9DPMPmiTsE2UXeoiFhw6OLD4HJ98CFiQOS90dl6zynu
	gJOXMS5JK+3xQ+Hg4RLO38EyTTx2vAkqkB6+AWWOgUk3TH0DTLxHOcP6
X-Gm-Gg: AfdE7ckkuKM/HC0gwQHvu8DoJFezaRO87ahVacD7YSPOB47lKfG3BkoOwkNY9jZaj5M
	5Vq56csMx2YmNP78QTLMmvQq2954YpbaASX0TJuDmGW3Iy9afR2wVRnnLWdmZsAT71N8YqX/dbB
	WKJXz6hblCFla3CeA05nHjTMs9r3Qy7g3K+OTHVtoeUBQgje/BtkPNMkbKPiIku249WZMRTOMDi
	ZDPmkv7sFjL2vBMviqEoUtb0BADjh7l8KFY3ntYtbKq+UxsZhr5n4LddJPzqwrLgMrCQwkaepAB
	XZOuGbmhQx+T1kHryUTDg0HbFeJ3XO7c4ZRLEezYn36wLdJb/GTx7ugdm07X2wj43cMMq0ltJDo
	0rMX9TkpJJZZTJ1c9IJjD5WxK/HfP9AA3qTuDhNh4WAsGO1nT9t68lcYVyMFbny5m
X-Received: by 2002:a17:90b:560f:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38dc7779d1bmr7680081a91.24.1783916378749;
        Sun, 12 Jul 2026 21:19:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11280409sm2565175a91.0.2026.07.12.21.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 21:19:38 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:18:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Message-ID: <alRmA-X4xbQ9zPFn@inochi.infowork>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>

On Sun, Jul 12, 2026 at 11:13:07PM -0500, Anirudh Srinivasan wrote:
> Hi Inochi,
> 
> On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> > Add all PCIe device node for Spacemit K3.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
> >  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
> >  3 files changed, 266 insertions(+)
> > 
> 
> I see some warnings printed during probe
> 
> [   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=-22
> 
> [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
> 

This is an expected error because the driver does not support INTx
but the hardware claims it supports. Since the vendor does not want
to support it, so there is no way for the upstreamer to add this.

> I see that all the 3 rc nodes are missing an interrupts node and an
> interrupt parent (saplic). The vendor DT seems to have this. Not sure if
> this is related.
> 
> The 10G ethernet probes fine, but the wifi card fails to probe. Seems
> like the card is trying to request 32 bit DMA addresses and we're
> failing cause we have 64 bit memory only.
> The vendor kernel seems to have a patch to enable 36 bit DMA in
> the rtw89 driver. That'll probably fix this.
> 

This warning is also found on my test, it is not related to
the PCIe driver, but a lack of the RTL phy driver. :(

You may also noticed a bad performance on this 10G ethernet,
it is caused by the single queue used by the RTL driver.
IIRC, even 9800 X3D can not achieve the max speed.

Regards,
Inochi

> [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
> [   10.987983] rtw89_8852be 0004:01:00.0: loaded firmware rtw89/rtw8852b_fw-2.bin
> [   10.988151] rtw89_8852be 0004:01:00.0: enabling device (0000 -> 0003)
> [   10.988215] (udev-worker): page allocation failure: order:2, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> [   10.988243] CPU: 5 UID: 0 PID: 503 Comm: (udev-worker) Not tainted 7.2.0-rc1-00034-gc57907b4459d #1 PREEMPT(lazy)
> [   10.988249] Hardware name: SpacemiT K3 Pico-ITX (DT)
> [   10.988252] Call Trace:
> [   10.988255] [<ffffffff8001f2b8>] dump_backtrace+0x28/0x48
> [   10.988265] [<ffffffff80002612>] show_stack+0x3a/0x58
> [   10.988269] [<ffffffff80016432>] dump_stack_lvl+0x5a/0x88
> [   10.988274] [<ffffffff80016478>] dump_stack+0x18/0x22
> [   10.988277] [<ffffffff803984da>] warn_alloc+0x102/0x120
> [   10.988283] [<ffffffff80398b7a>] __alloc_frozen_pages_noprof+0x682/0x1470 
> [   10.988288] [<ffffffff80399980>] __alloc_pages_noprof+0x18/0x38
> [   10.988292] [<ffffffff80113494>] __dma_direct_alloc_pages.isra.0+0x26c/0x428
> [   10.988298] [<ffffffff801137a8>] dma_direct_alloc+0x78/0x3d0
> [   10.988301] [<ffffffff8011282c>] dma_alloc_attrs+0x74/0x240
> [   10.988309] [<ffffffff031a6bb6>] rtw89_pci_probe+0x20e/0xc90 [rtw89_pci]
> [   10.988375] [<ffffffff8087cd1c>] local_pci_probe+0x3c/0x90
> [   10.988381] [<ffffffff8087def6>] pci_device_probe+0xde/0x298
> [   10.988385] [<ffffffff80a80f3e>] really_probe+0x9e/0x3e0
> [   10.988390] [<ffffffff80a81308>] __driver_probe_device+0x88/0x190
> [   10.988393] [<ffffffff80a814f8>] driver_probe_device+0x38/0xc0
> [   10.988396] [<ffffffff80a81796>] __driver_attach+0xbe/0x208
> [   10.988399] [<ffffffff80a7e22c>] bus_for_each_dev+0x6c/0xd0
> [   10.988404] [<ffffffff80a806ce>] driver_attach+0x26/0x40
> [   10.988407] [<ffffffff80a7fcac>] bus_add_driver+0x15c/0x298
> [   10.988410] [<ffffffff80a82a82>] driver_register+0x52/0x118
> [   10.988413] [<ffffffff8087c44c>] __pci_register_driver+0x4c/0x70
> [   10.988417] [<ffffffff02fbc038>] rtw89_8852be_driver_init+0x30/0xff8 [rtw89_8852be]
> [   10.988422] [<ffffffff80017b2a>] do_one_initcall+0x5a/0x2d0
> [   10.988427] [<ffffffff8011d7b6>] do_init_module+0x96/0x2c0
> [   10.988430] [<ffffffff8011f6c6>] load_module+0x19a6/0x2078
> [   10.988434] [<ffffffff80120046>] init_module_from_file+0xce/0x138
> [   10.988437] [<ffffffff801202d0>] __riscv_sys_finit_module+0x220/0x398
> [   10.988441] [<ffffffff81010c40>] do_trap_ecall_u+0x108/0x588
> [   10.988446] [<ffffffff81022a14>] handle_exception+0x16c/0x178
> [   10.988455] Mem-Info:
> [   10.988483] active_anon:5773 inactive_anon:0 isolated_anon:0
>                 active_file:0 inactive_file:30149 isolated_file:0
>                 unevictable:0 dirty:222 writeback:0
>                 slab_reclaimable:3461 slab_unreclaimable:8595
>                 mapped:5588 shmem:115 pagetables:949
>                 sec_pagetables:0 bounce:0
>                 kernel_misc_reclaimable:0
>                 free:4028911 free_pcp:0 free_cma:0
> [   10.988493] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
> [   10.988497] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=64kB
> [   10.988501] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB 
> [   10.988505] 30300 total pagecache pages
> [   10.988508] 0 pages in swap cache
> [   10.988511] Free swap  = 0kB
> [   10.988514] Total swap = 0kB
> [   10.988516] 4186368 pages RAM
> [   10.988519] 0 pages HighMem/MovableOnly
> [   10.988522] 86381 pages reserved
> [   10.988525] 0 pages cma reserved
> [   10.988528] Memory cgroup min protection 0kB -- low protection 0kB
> [   10.988532] rtw89_8852be 0004:01:00.0: failed to alloc dma tx rings
> [   10.994421] rtw89_8852be 0004:01:00.0: failed to alloc pci trx rings
> [   11.000734] rtw89_8852be 0004:01:00.0: failed to setup pci resource
> [   11.007088] rtw89_8852be 0004:01:00.0: probe with driver rtw89_8852be failed with error -12
> 
> Regards
> Anirudh Srinivasan
