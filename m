Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E5336897
	for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 03:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783914056; cv=none; b=m5iQUc+QPjfu+jYmcc5R3mwlEfR0whYXEjo4aZNzTNM2yjQl6YEOh/wza2VNUqjEWrD7YJjZwzarFbdaA9mj/eEnLWpORcn/YowguVpFH6+Dfhhdl3pUTk95oJwRWSN8UIJytuXdeYiHPtHHSxRAMlfp1SNcthjFb22UvWgHbRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783914056; c=relaxed/simple;
	bh=5h8jQL3TdcDQN5OyfaTjXVOYLwfig02OQQ0EFcveYAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIC51Q62YOcRAeBfrsArzuAxvMmv4G2gvO8iTGJOksC4nU76gXKDM9l+CHY+XeyosnaUGxA9Eu4R4NHJySyxkqWmwzZ0B6+q8b0EDkVaTx68Kx+4VqhBgO7/UUC6sfc8I4G9lSlDiaDqqxpYxONVIjsSG24luB8y4bWUH6NlPWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=N05TLIQH; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="N05TLIQH"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8143daf89c7so25944987b3.1
        for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 20:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783914052; x=1784518852; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DD337bllPU0qOfiBQScd86xJr2rrEeEQWd3DGNprvhw=;
        b=N05TLIQHOftRi4WKLaweHtDHR3ykrrhU4/F6xwsHvd5d4cnV6/d9Y8EzJC+agEqgod
         ysRy0ufUnTFBpqdTWhQz1XPn2u79VV5jQf9x1sFXjREQkNBgq6mH8pUbu08G3YB+7otD
         VnRlGXsCJPJq/yYFt0UyMqvgSFd9OLB6+LIgXOBTespC9vdIJdt5PD6hN+iOVwlzZHXT
         0dIbywBPxMrzZ0SsOG8C0+6iw71GrcovgglF+fF9aYxUAS4yzd3QuVI/kzEU8z1skckK
         uEzamdvH51FvDFsNJmnAzkLICxV0i0lDD4CM7xdggHmS1r4PxOw+amkPkx0Y3VyzmY4s
         V5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783914052; x=1784518852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD337bllPU0qOfiBQScd86xJr2rrEeEQWd3DGNprvhw=;
        b=Jlgf9P45w3O10fpBUoW6fNhswU5vGGa3sNhC1h0SYCZpwBSMcwz+M9AMIjtf/JYqYV
         zFI0dd0RSER6XLzqro3nhFXJL6NLwU/MH1rl4vlHAL2/ValEMKu0YWASHkC2QtEA3KxG
         AF7Mul6I23dTHo48SSpvtRSFf96H0iYfWap8QVl/IQmv4fKGYbjpUJjDa0vw6qiABk5+
         EBSY83AR7B8vDfBbaOzX4Pknr16Z3PO4S4HSHquNjmtNn1U3WftAwK0JMdB2nXOtIRS/
         DUKuiAnzKf3nVxX19uEDNXXSIECSdwiWeeKJj9JJB5H6T9i8SRFN329ULFXJquvCJjfE
         7Isg==
X-Forwarded-Encrypted: i=1; AHgh+RpY2j1aeinHX5c9gyDtJw3IhC+a2YoRiPQ7fv0DF8Zkcd6R6dHy2Hhdj9XdUfB4vSb8n6gf4/zFzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7/jOHi9HQ8gtrWskRgoB87FtiHTNS8jsfMBxxfoIQ+j19S/vP
	iVB2XeHpRpjcUEfjdLfjpOCmWhHUhCoepJeArOAKqUM5DTY03W122YlmpA1sAzyJSfk=
X-Gm-Gg: AfdE7cmFTv3Q0sxfRqchtJBLJCjeM/15YL6FmrcFcw4qKCIPQtDMjMjeFhqGNLhbrVw
	Vfi1LMrlXpigYMcedfnoo2wLE+hZjIMCSNJctdb14NUylaWMN+Gr9xkjjIwIhUgINqZqjQnWKxN
	6AGnbxGeeRiomKfc3H52Tf8HVIBpJBkiuha9PpotmsGSDhir+HrsDWuvtuQ26aqXqgQjApkcZbw
	Yded4McJGL2OIxH7AHXjAfYODIGnn+aTCMzFN70k60gF67WMENjxm8PIQOb4WHjIBPuYuYDhP3Z
	RHu2lrtYFmhsVqmD636spViANmVdiCIxiXqhD8A5y+yefx5uf2CHMLW2rD1sZMZo+owldfB1Kk9
	9yxQ4V3eCZcNJwG+APYPXrNBC4RY5XkMTFsR+AS7qmWlLaSt8hszvRqJk9+bYWu+72JMo1qXzeE
	QWRmUDt9pvJhrFFjo6DEa+Er5IsTowhAnEr3uTejxXq5BicZDGvqSbEHFUkw==
X-Received: by 2002:a05:690c:6981:b0:80e:2917:4b01 with SMTP id 00721157ae682-81e9003e955mr55511657b3.27.1783914052406;
        Sun, 12 Jul 2026 20:40:52 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:55c1:a162:6cca:b98a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm104348967b3.49.2026.07.12.20.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 20:40:52 -0700 (PDT)
Date: Sun, 12 Jul 2026 22:40:22 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Message-ID: <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>

Hi Yixun,

On Thu, Jul 02, 2026 at 02:31:34AM +0000, Yixun Lan wrote:
> This series try to add UFS support for SpacemiT K3 SoC, the controller
> components consists of System Bus Interface Unit, UFS Host Controller
> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> Management Entity (DME), Transport Layer, Network Layer, Data Link
> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
> 
> Please note, in order to test this driver, the UFS clock driver[2] here
> should be applied first as a prerequisite patch.
> 
> One known issue is that the device will occasionally raise BKOPS interrupt
> when doing some high load test, log from dmesg shows
> 
> [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1
> 
> Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
> Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org/ [2]
> Signed-off-by: Yixun Lan <dlan@kernel.org>

I see this during probe on a k3-pico-itx. Does the UFS chip on board
have an RPMB block on it? Is this error of any concern.

[    5.957864] ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus: BOOT WLUN not found
[    5.963319] bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus 'ufs_rpmb'
[    5.971155] ufshcd-spacemit c0e00000.ufshc: Failed to register UFS RPMB device 0

Regards
Anirudh Srinivasan

> ---
> Yixun Lan (3):
>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>       riscv: dts: spacemit: k3: Add UFS support
> 
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  54 ++
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   4 +
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   4 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  13 +
>  drivers/ufs/host/Kconfig                           |  12 +
>  drivers/ufs/host/Makefile                          |   1 +
>  drivers/ufs/host/ufs-spacemit.c                    | 931 +++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h                    |  90 ++
>  8 files changed, 1109 insertions(+)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260605-08-k3-ufs-support-c8b308e415e2
> 
> Best regards,
> --  
> Yixun Lan <dlan@kernel.org>
> 
