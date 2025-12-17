Received: from out.bound.email (out.bound.email [141.193.244.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5953A1E84
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.193.244.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766009768; cv=none; b=NSFqFM6oozb9zuCJMuwQvNUqgNVS3izWCVB8aej/CvEDqoSmqqUN7oxOMUJ9+JYh5ViVu+8Oh8tbjHJ3d15vIPWNM85qmMZ6OvOoljN2iRDu6VaF180ceInmauCqsZtdN0vWmIMaATVs3/sKtH8jdcLXflnUmaA73y3ty6KFp30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766009768; c=relaxed/simple;
	bh=vmMdTK4xGKalrlZi028JHbfbtYx5xmdfR5Z4lHuxeMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jC+mtr4x/UK5jINC4Zsxv/U2linWoab/hM/hv3TkiBBbNond5U2km+OkMAMQYkoxMLIDVgmi5/GPIrSu8tvAfq1sZ1CJGm28mF0mw97PwZfgWbpRrMkSGQTn9QmZGclgmsOW8jFwPPrOBDFT9TNBt5BmKt16TS+28tIxNaT5sxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=erdfelt.com; spf=pass smtp.mailfrom=erdfelt.com; dkim=pass (1024-bit key) header.d=erdfelt.com header.i=@erdfelt.com header.b=uyZFrm4q; arc=none smtp.client-ip=141.193.244.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=erdfelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erdfelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=erdfelt.com header.i=@erdfelt.com header.b="uyZFrm4q"
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id A6F128A0A03;
	Wed, 17 Dec 2025 14:10:04 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 8FBC916006D1; Wed, 17 Dec 2025 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1766009404;
	bh=vmMdTK4xGKalrlZi028JHbfbtYx5xmdfR5Z4lHuxeMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uyZFrm4quEhq7GAN98gpdceCshOXNAyeh2nUfqF26mi1Grbhueu58eb7ClXfQNLiW
	 ahJ92LcbZ31QOtyG3VXrEGYA1gjXqxvxlZ5229LTajLx+JFn5CTkAJA63jqGrDpBD4
	 HcPjIm7NEz+1EVe3Q3drcD2W3RVX1B7O2h+rNk9Y=
Date: Wed, 17 Dec 2025 14:10:04 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Yao Zi <me@ziyao.cc>,
	Yixun Lan <dlan@gentoo.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <20251217221004.GD31109@sventech.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie>
 <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
 <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
User-Agent: Mutt/1.11.4 (2019-03-13)

On Wed, Dec 17, 2025, Michael Opdenacker <michael.opdenacker@rootcommit.com> wrote:
> Wow, that would be awesome indeed, all the more as my time is quite limited.
> Please do!
> I'll have a look at other aspects if I can, like USB and PCI Express.

If it helps, I have PCIe working on my RV2 board. I based it on the BPI
F3 patches but RV2 also requires enabling 3.3v for the M.2 slot.

I haven't ever submitted a DT patch before, but I'd be willing to clean
up my patch.

JE

