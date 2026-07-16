Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111293D668F
	for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240674; cv=none; b=HtbjZcaalKkgURqhZV+8NK5VaTMeXSJWXGjOutqHfkCKXIZQ7h3vA/aHePIERi2dFiAGMwaEZbqmWSj2DotlGkKi7HKTj7NME4J6Z29OybxIZ7NN/zsAn5R+tiymiOJjGyBh/f9JLkjRWRnrierX+LMAgbiWMZRvVEMMZBJn0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240674; c=relaxed/simple;
	bh=tY5kO68rCs5HDRAHbRnGR5V/lZbXU+QUuaEDKnD915Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4Zamnm9B96CVqvmasi0xK8p2iPl8Lv2Bg/9Fb5iXRFdzSRIslQ4mz2nGHMuGyrJ2imrpbYNjHzwLnUzu6ii+iZJHNMlNUij2n35plpu1MV3bCO2e+g5VWILmPyLiEDgEpi/gV6Di3EzxbIU4mnWdCrUuxw2G+9ijieZDX3jIVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBv4HaVI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBv4HaVI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so35849905ad.3
        for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 15:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240672; x=1784845472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PybPTeqqbJDW21nWTn74STz945nRwE+oCCkAETAhAs=;
        b=gBv4HaVIko03gZBddzNIdQHut8bXewHhtAuamQwyD6Akziykksoh3nB6r1RDPjCeEk
         hhOwItylT48caOo/O2/C8tuAgRPxS6LlAvyQ2O7Hp/EIrvcQsIf1Pj3bqiQBdeluf8Hn
         ND3GKofRQYpucp2egfwibQvgWo49Oxsk/3/8l/UOVxCDP1ZR+YFE1/RBQi8yLDL75ZIo
         jltOS/m+uxbXks5QHxWC6wuOwDC6iTB1D8ai+V+Shq2dAEBVyIR9tJl3BuEGy9qHJZI0
         VGdNSsntwvsReC5StUA+Uj3fB2IvQwW6XHDpTfaXRYYWi+sX3yCeH8lF66O6TvlWK8dX
         28Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240672; x=1784845472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PybPTeqqbJDW21nWTn74STz945nRwE+oCCkAETAhAs=;
        b=D/UZGvY7U7SPQ1XHqM2QxWmL/LKSvv0RfMVjYNYERJPZ9VLGuDPJfPVP2RS5yr4jvr
         1V0HQyGDxQVcgEJNHNUhiO79mdiHgmCJHwnNYo/4meQH1Dzc2Z8nyZJ6xuvbyNqn8wks
         M3PEAmOq9QOjcUQCTN+b2xEjK/3OKZv13SSlquEspKDTZcy9Fmt6HIOTyzu4l2TP0vPI
         jGUuPvHcyyeY3rhpAzd+BygYTuS7T5lqQK7oyorQ/YJY5Nf9jbgl8GMHJZwWvW6HNsCU
         JFl4gefPpKq7fyidB+/KVIwqn1E540/Ceh8ZcquF+ZHORUmDbWqxCa38SfITEdsbVlu+
         D9bw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+riZ4S7NXUA98nvnbWoGk6kblCkQJCoa3+35TOTuEJ9PTjFv5cjlhj73/Tq9OwSogD3dGIChS+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjHLR+xk9BszRZnCTyeK5Y62Aw4HtPj20a9THj6Dfr94vrB9Zi
	ASLMd4RLHyv15SjT3bsK6qA6oKyzEKxvKKI8XoSlFlyczEYOT7G7bdcF
X-Gm-Gg: AfdE7ckm9umJxyYs31eGRvAW7T4Y+2dtdeD77u6FIau/zEl2eeiqxrdEiWIlNhTGGXa
	wNxgBQBBhBwCJgU8tCzcdVaJOZ/Uxf9d2BsUXgk9eax/ZbjIfIreUPRe3VCxMHJC4Q9nZ1buAoW
	CZXHze1NjSnX9B+oadF/ZvtiWjE+0WLIA/XSGg6uWKr/I3EdnYOeLqcD27nVivx9G18bEbZc2IY
	Daz1qkDs8Xgz60Sa9NxiPs0UFFDSL24EFR/rL/pgq0s0ysVdFEXEWM657OXy2MuVuCnGOB/0J4L
	vvHpt9p2g5xTrt3UGFmhNeeqXDAX+LlV9JfIYN2y6kB6ki+vRt+u+HRxdYDDP2HwbJtfg5Cchdh
	28xTUHBEgIpv2IRdxg3ah9mGBVXCOdww4uL+HHlb/F0FALc+TjiJPMA==
X-Received: by 2002:a17:903:3c46:b0:2ca:17a8:cfce with SMTP id d9443c01a7336-2cf2ec27781mr13004505ad.29.1784240672371;
        Thu, 16 Jul 2026 15:24:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4341a37sm12337420c88.12.2026.07.16.15.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:24:31 -0700 (PDT)
Date: Fri, 17 Jul 2026 06:23:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
Message-ID: <allZOmTRIvot39Gj@inochi.infowork>
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
 <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
 <e7a43955e41c4dbdb864e89edc3d9fe6@realtek.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7a43955e41c4dbdb864e89edc3d9fe6@realtek.com>

On Thu, Jul 16, 2026 at 09:22:17AM +0000, Ping-Ke Shih wrote:
> Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:
> > The Spacemit K3 Pico ITX Board has a RTL8852BE pcie card behind a PCIe
> > root port, but the SoC doesn't have any 32 DMA addreseses which the
> > rtw89 seems to use by default. Enable 36 bit DMA ability that the driver
> > has when this particular root port is detected so that the driver can
> > probe on this SoC.
> > 
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> 
> This patch looks good to me:
> 
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
> 
> But I wonder how this patchset goes via which tree. I'm happy to merge
> them into rtw tree and then wireless-next tree if people can ack
> patch 1/2.
> 
> 

These IDs are from my patchset.
https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/

I think Anirudh can move this ID and add them to the pci_ids.h
directly, And I can adjust my patch to depend on this. It still
needs some improvement to be merged.

Regards,
Inochi


