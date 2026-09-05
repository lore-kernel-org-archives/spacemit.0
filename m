Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DCB45DF68
	for <spacemit@lists.linux.dev>; Sat,  5 Sep 2026 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626542; cv=none; b=RIrCB/A2a2gdFLgmSl9xo123rvdCuSXDmAcwvo747CaKEQCbuvTkvlJPaHfIrceMMktHpONYIHOzZhF5I6L8Q0YYOdm1h7zZN8Cd0nLw7YyTmLuAOt9giV8GXiLaNH9xoWWlfyYLUQXis0fRECiYYlx2804NCO4i4UglDDAIs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626542; c=relaxed/simple;
	bh=j8dShMQR8r+IY/PCkmrM4piAZ0AnVGy+pTSFaWHKVs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7O8ePN2pWjqk1dGYinVFVkIwhfYZRouPea+xY7jD6t/Yge+N40nhhe9xka4lebWLiqQk4PE/RFC+AdKSZkHLsgLGD6dnaZzwzj0X3mzjJVsT7Jnt4mv8f6/My9H8UL577dlIBGMFVpZgflzWGaxaPJ0pkUwmyjX3A7Yw1VjWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=LHVhrOIb; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="LHVhrOIb"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-861a2ae9c51so25715167b3.0
        for <spacemit@lists.linux.dev>; Sat, 05 Sep 2026 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1788626539; x=1789231339; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLW1pUYTfPr1fy7y/Zlio4LKr099xCCPQ8MqnoWy0Aw=;
        b=LHVhrOIbZB1N6j+DYnuEaNWBrhqlBO84uMjM+2rEUizor1gjaAt88tAiLmaTN3VUhU
         vk714ym3U2cZVbs6nZ6pqI0jerSFkb0ndZjkEpficSt6e2xJ2tOhLY/g3pBFGD/szGeK
         VAo2Baph3V+tbL8fuBjtz3Pkhwg0y2w7QCNa1d6H3kjtYxqMQ3Y3rVMIkZggXvQyZ6wA
         dSXmEiCcNokLMq+eM/mLmcZJbYh1E2QcJIxeJYNPoedGjD6eajVaYcmvHyYhOTTW1O1c
         31+R9BnMeUOIjjt9Aioa4tHSIjD/m5cbnHSgcAZrS/6MuDhreIAcKzsJtnnl21xOGbE3
         uxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626539; x=1789231339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLW1pUYTfPr1fy7y/Zlio4LKr099xCCPQ8MqnoWy0Aw=;
        b=cynH7OvxwiCT8WeO17ewt5KR3/4MC0M/I/Ycw7cSBhkT7OjimxJnGGzEiNe5CIRwBS
         YvWWc2lLpb6uQuU0Rx1HkXUPcxj49R7QEgamtQGivTd2/0MYHsJbKrK8/ryzBBIaD1s1
         EfxHd7oqrgFYj7k9rowZu7mZ5aNDFxar+I4ENsxwiZHA+/BnzkJ1RJBySgN52aYVuQ7R
         LylL938dESI4BDjgPa/RgxqizOo0eeO+peSKbjVgeWEg3Hf7PetRrdeiSLKaC6Xyx5NP
         6QChwyJFsI0OU4ebkVw/jZehazI6x/adABtAmss4R7L6qKPDpaTcPRWQXKzT0CgzAtIU
         vj+g==
X-Forwarded-Encrypted: i=1; AKwUvBxMCiG01CNRPxCgLv1pfpWPxVvANjSE7FPvrOG/Tty7xQdiumzlacY9i0aCYFPgqy488MrXoNx2Dg==@lists.linux.dev
X-Gm-Message-State: AFuF++lknqKTLigkmN0guiceMxl2vIS9f1mWQGIJyUxu2h3c4xJmvpaz
	i+PBqfwhfd8ip64culrZg2BYEW3zkVDmjtnzZ821E6qjEAPZz9wNe5Qzn8dkALdnY5c=
X-Gm-Gg: AYBFou2jYgjjTNa9RNp5xqCUPdJDh4VKlTd5gVx6RjzH1XJ12+7ajFOmdyMgvkYJgeu
	A1UvdA0deQLQGdWV0OuV2Z2WAnctPHHGvQO4UXrdchSeQqZr5TOYiSyOOQPPe1WgCRo3PM5V7IN
	x0w7XOCVUVhW0C7Aqn+w2ow85QVU8J0fk4T3Pb9n1i2Xf3IU9fsgDwZNM07Sr5A0+IKRYFApSqK
	CxrCMIrbQY05QOKJOKrMpTfyQFnJhQmAjv2WvjdJxqsmWabNHWDEg4Io+XDgJ+873YjtgPzTEk9
	KCnZ6NzM6zyKoofNZBMz/LAvyzcKCOQp+u8u/3dooQxM3WAsm3iAs2Y+PP/b4wX0LvgoZgZzYRD
	lq1+0tBdXkcL0wlRK12ovdWdmkVfsdBDy1P1HZ/4zuarB+8uJGnt5ckHqRuKgDH0LiihI6eR5fR
	o0KpA6RhPMYjFAq++cekF4n/mpe0DVmvK11rVy/UwZGs8TVxlfIK6ovPgmL7E1brG+Dh+moGXqp
	tDtzE/F/vNAvlm8zzy0TJv6DQyEYZisFm1Zk7YNWrou
X-Received: by 2002:a05:690e:4504:10b0:66f:c1bc:c075 with SMTP id 956f58d0204a3-66fc1bcc7a6mr1655174d50.61.1788626538948;
        Sat, 05 Sep 2026 09:42:18 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:9cba:538b:87b9:7f0f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm40923517b3.45.2026.09.05.09.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:42:18 -0700 (PDT)
Date: Sat, 5 Sep 2026 11:41:59 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Yixun Lan <dlan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, stable@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] clk: spacemit: k3: add CPU PLL rate tables
Message-ID: <uyl23bmb7dtvkneu7wbpmq24gkmrpmr5n5xkanjrnjf27xsp6g@gcjezv6xwolx>
References: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com>

Hi Troy,

On Thu, Sep 03, 2026 at 11:06:24AM +0800, Troy Mitchell wrote:
> The K3 CPU PLL rate tables currently describe only one rate per PLL,
> although the hardware supports a wider range.
> 
> PLL3 and PLL4 support rates from 1.05 to 2.4 GHz, while PLL5 and PLL8
> support rates from 1.05 to 2 GHz. Populate the tables with every
> supported rate in 50 MHz steps.
> 
> Cc: stable@vger.kernel.org # 7.0+
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> The corresponding U-Boot changes are available at:
> 
> - Add the CPU PLL rate tables:
>   https://github.com/spacemit-com/uboot-2022.10/commit/787b5cf44c8dbc99db886d5522c0c9cd5a96ffd6
> - Correct the 1.10 GHz and 2.15 GHz table entries:
>   https://github.com/spacemit-com/uboot-2022.10/commit/16a775c20e9efb54ca55352215e76eb3f12e6cf0
> ---
> Changes in v4:
> - Expand the update to every supported PLL3, PLL4, PLL5 and PLL8 rate.
> - Drop Aurelien Jarno's Reviewed-by and Tested-by trailers because the
>   patch scope has expanded.
> - Add U-Boot references for the complete tables and corrected entries.
> - Link to v3: https://patch.msgid.link/20260831-k3-pll5-pll8-1800mhz-v3-1-530ed0978615@linux.spacemit.com
> 
> Changes in v3:
> - Mark the change for stable kernels starting with v7.0.
> - Add Aurelien Jarno's Reviewed-by and Tested-by trailers.
> - Rebase onto v7.3-rc1.
> - Link to v2: https://patch.msgid.link/20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com
> 
> Changes in v2:
> - Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
>   will be handled in a separate series.
> - Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
>   patch.
> - Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
> - Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com
> 
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney+clk@redhat.com>
> To: Jerome Brunet <jbrunet+clk@baylibre.com>
> To: Yixun Lan <dlan@kernel.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/spacemit/ccu-k3.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>

On a recently new K3 board (shipped with OpenSBI/U-boot dated
end of July), I was seeing upstream kernel boot hang after IMSIC
initialization. Some logging indicated that it was hanging around the
clock controller initializations (k3_ccu_driver_init).

On a board running older U-boot/OpenSBI from May, I originally didn't
observe this hang, but doing multiple repeated boots showed a rare
instance of this hang happening. Some changes were added to OpenSBI in 
this period (end of June) that trap clock controller registers to M 
Mode and handle reads/writes there.

Yixun pointed me to this patch, and it seems to fix the boot hang on 
the board runner newer OpenSBI. I think this avoids some kind of a 
race condition with disabling/re-enabling a PLL that the clock driver
does. I'm finding it a bit hard to explain/understand what exactly it
the reason though.

Yixun, could this patch get added in soon?

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Regards
Anirudh Srinivasan
