Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC6332918;
	Wed,  3 Jun 2026 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498057; cv=none; b=UqflvqPJWIpLWWOnr45JV4XlicDkKwT2voAdNZIB/vd3pI0eVamNT1x0AGOdbYm26nKWhgzvQ7//IE1q0eg8987gb4xDYjLmS2w9HG+ibNXALTyynb8uLdyoauP71ER6qTtCIFg54zyGg1xbev7/sTb8JtMY26w05OhF08uT4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498057; c=relaxed/simple;
	bh=2VT+L+lIyYigtHEYGkG2214m+FvItfVIlvDV+48Mhdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDAU3WK67afkV5GV+bgdfXJrbhkIIQMF47+EzHrEKrwZEVm6e/RNnqSlC5U6tRczUEQjB6A8O4FHRNarZ1XA7jnZlzaxIGW7IPkPEGYkYiotENn8fn+QGgXrmhZ54NpnOMC+WI3OlvXw1G5q2ZEpHnzc31IiKrMhfeMzTSr7h0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ud72UZNi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ud72UZNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFAD1F00893;
	Wed,  3 Jun 2026 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780498056;
	bh=Ex3dPkDbHhXsmXVq8gwIpJx6uQL7vpbu9YWBPFHr2h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ud72UZNi7Bps1ZJu6hDU7CGgLn5sdB6sXsTc4lfA9lBIgX7ij3Fumb4RkY8hZNB0N
	 LHLh9aHPJvyeHFcqIZAbZ3n3+EXjbtQo8EW224T6dK45E7taS5b3Te7+n9B59Yy3UW
	 NgkJzKqNGQc6qFdpS+eyKOnFaCotLvme/5/9EfNeORWFh9MnRVPTl8kpJAXh9VnDBn
	 KQmtI+DeuS/xMjN5AnV5zUf7BI60rX7u4173VSak+DXjNhNYTtAEyTam4VIivTwlYh
	 w9p5WMbANVIXbwkeSEzwBSZNfOs2jD+Siy5gwmdHUqv4VLR5Th9fXA36JyLgKNjmJc
	 ZJzmVhCKmgHDg==
Date: Wed, 3 Jun 2026 14:47:33 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Message-ID: <20260603144733-GKB3727415@kernel.org>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>

Hi Guodong,

On 06:26 Wed 03 Jun     , Guodong Xu wrote:
> Add a MAINTAINERS entry for the SpacemiT reset controller driver
> (drivers/reset/spacemit/) and its reset-ID header. I intend to
> maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
> that reuse the common code.
> 
> Link: https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Looks good

Reviewed-by: Yixun Lan <dlan@kernel.org>
-- 
Yixun Lan (dlan)
