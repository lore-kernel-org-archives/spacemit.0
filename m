Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3B02773F0
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 22:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765925285; cv=none; b=c+biTLlc9VegMu923fWuOWRxLxGNmXHZd2LBR9P0XKfD+/cRlq37WorydBqDLv/jroLcT0pPAcc1YZDIFykvrwIXyFw32TAORgschBba6gNtf867aQpoPS6xcyqbZv27bT4fqyPvwxw20mp5S2wd/Vr0WWBP9jUAd1pqo311MWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765925285; c=relaxed/simple;
	bh=OAlcXf06DqHeZITyuCm4u2rX3/A0ukQKXd0VUmaqUFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+pgrDPv4BsiM3Vl1+EtgXpyoWg8J9Z6ssrunZq7ilkd/sqdhqR8+pC5GFZvL3kIVyvKaKtJh7alpAAK4pqGiS51M03jC5Ss3Q2pEKMrS0qSHVIsXicc9Dx3cLigx7RwxhKxiQpV57YYCNet06dbkjJ+VfMcn2J0E+QXjtbPc10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIGFTxrQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIGFTxrQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so980242b3a.0
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 14:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765925284; x=1766530084; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9rGdkbmWGyQJZ2uzMV3zz7cGEtt/UxhE/bLykVRNgg=;
        b=FIGFTxrQISW+BMatbZaw9BiwS9JedYPluPK5V1H7u2S8pc4A41uPEMkxri+DsaJM4c
         1VjClVhr3noyzj6rUni4IonhRMjZIUdYUU4bB4dvK9agB/lnVhwRJSgpxhO40lvQNGWA
         xugrAL09YXE8DRr5pm5UXtozYEcrrbD64e7AwyrVeYL3eM958qhxXZ5OJ41XoIrz8AfL
         0nOylpPh/lFVKNgkGnSlAY+Zy2GHHEIokxuVG95xq1SSESahddGkYoN0Q/t2wJzVqOFu
         PngwUvVxwkmRzV6y2fbtPTIz08QkQS33/KW0kNm76HDkHEcQmaH/xwuESTh4UKVXmkoV
         T8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925284; x=1766530084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9rGdkbmWGyQJZ2uzMV3zz7cGEtt/UxhE/bLykVRNgg=;
        b=vy9ODEv9EiQYoCe5yRjZsN0YPVtNanNYxPCSYO5LSHOXJdHA0z0M8d8NddysKO1uLp
         TH7x2Aln4K9VLy/A8PZ8yyQkTDHDjjglJ1Ba1kVKWHejlB/Kt86eflX2C3xbAva6RU6s
         uCncoARkCbnRseUhs/nkA89sbN4vjry2xECli0P4ABTZ3WzlkSIyf1gGsEtSX85eGL/I
         P49zRrjxqp1UOEOF82jEFfCC5Z82CP3BsisASO8GQN8dBxvJt/X3D/w7ooxY3CJde80I
         DlpLVInlljRHzz2xbkhWyWMzgRsFk8MCvkv7AGnQIMgVbMCYxCWyulyJGFnpTrTtgmMP
         LJmw==
X-Forwarded-Encrypted: i=1; AJvYcCWOtEaYPvin0FvGQQBfxGNeu6dt+p7CxUUcxN4qvdQJhTk9HBwEvTSpFiNKHI7BtQUSjtVSFgZ4Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbglbUQlvM2/ZHBLrm85d4PMMiI27px5DdilUbZYXR7GKDjDcR
	Hv9f6b27c1mUM4zg8TChsTsb/z2KH6KHkYZKb5zCCQfIBxy4yPZp5frQ
X-Gm-Gg: AY/fxX46XCIWLeIkiO8ir+7LXviXUEvwwfph/KDeKg8o4JJ6LeeQesrSKN9C7rHp4tZ
	KHikvwrp78mcjsAFlfhcY+OwdKVEOlPxpIIQHt/F2QzQzqKCe5tPrk1L60DBrkkQDX14cUt71WU
	uk3+3gNvGo+p5/WIcJRAkPW4h0pcVomzPUiSk+6QzwRNzswI/8dg0omxaPKuSIukMqbOKNrrFUJ
	0LgBZVr8gnobKuDadrYJiCx4ipjIdGIN+surfjAKC+7MmcD2cOOy6f97tkj10n9Zll460saYnMl
	0ZsPiPvl04ULaT1c6PdiuRZkX0GPQ6Hzv15JvMo5pxOVdkmbF0XvugLL5pKfJy2e9EBRZzaO7fY
	bBD0OMHWqgR8yB35BidAKmshrFz2xS4zOlwUqh1A4tjb5VHxBvDCUf4phttyz6O8xktbp8423/7
	rqA5TrkoL1+Q==
X-Google-Smtp-Source: AGHT+IGpN9v1EcQ6pUGv0/ADFBj6VB7V4djHe72YLpgDuXNgYHZwaOdWyf2CzcAfbqYS8D3JmbWdkQ==
X-Received: by 2002:a05:7022:619c:b0:119:e569:fb9d with SMTP id a92af1059eb24-11f35484a3emr12886397c88.12.1765925283458;
        Tue, 16 Dec 2025 14:48:03 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f392500cdsm39814598c88.7.2025.12.16.14.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:48:03 -0800 (PST)
Date: Wed, 17 Dec 2025 06:47:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>, Brian Masney <bmasney@redhat.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, 
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <aUHgy0jzZk-oSUuO@inochi.infowork>
References: <20251214232938.668293-1-inochiama@gmail.com>
 <20251215221202-GYA1903981@gentoo.org>
 <20251216144845-GYC1903981@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144845-GYC1903981@gentoo.org>

On Tue, Dec 16, 2025 at 10:48:45PM +0800, Yixun Lan wrote:
> Hi
> 
> On 06:12 Tue 16 Dec     , Yixun Lan wrote:
> > Hi Inochi,
> > 
> > On 07:29 Mon 15 Dec     , Inochi Amaoto wrote:
> > > For build spacemit common clock driver as a module, the build
> > > process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> > > and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> > > build will fail.
> > > 
> > > Add these missing hints, so the driver can be built as a module.
> > > 
> > > Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > looks good, thanks
> > 
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > 
> On my second thought, since all functions only used in spacemit clock
> driver, how about using symbol namespaces? please refer the doc
> 
> https://www.kernel.org/doc/Documentation/kbuild/namespaces.rst
> 
> or check drivers/clk/meson/ for example..
> 
> -- 
> Yixun Lan (dlan)

Good to know, I will change this in the v2.

Regards,
Inochi
