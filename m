Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BDE625
	for <spacemit@lists.linux.dev>; Sat, 27 Sep 2025 22:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759011544; cv=none; b=ce1Xami8hR0+EYdtMO1NsU+n/sP7jpxvOLIK4+09jnRC2UtGWSnr8eqdLzfVUV0DM3SBuGN0cdJFVyOd0JX5eSTjEVDqGbRYtozxIZZejWutXrspgsDLptzDOVaGTbA110OtSka/VH+phLCL6opk23mo2iYE2mu5F26GOAWmIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759011544; c=relaxed/simple;
	bh=qHXGmAuIePeCpH7LdHQnGMsCPlVDCdbX+gIVg17PLhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIABPy+hsNJuvh7EgATS51uQI6CSXOEWmp61ogjj8NoMlIJ7bmRQVPFRwiUHcWnt+/mCgiRyFj3TYqXi9VM04GpEr5qWHlocgemS1BZU1P1HhEZXXHoGHb1Eo2jx6+nihcAlUFgmcOnw5gXoskEmVeyHVnQRwWiE5GBt7YDD3zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q+ZdEJYR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q+ZdEJYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QfbX
	j9fviVm/KFNwVC8Wb5YOEoZ878PUaOZEfMSIiHY=; b=Q+ZdEJYRpv71A5cbl19+
	RCU21hWfR6wYipSaz2V4xUo5R6tIfyxI4ec+PT1Qscr6twHp/+ms2mdTMr/Y3SpR
	gFkQU9Ngy08Y/1Adw4HkUNwoWeC+ZUcT6owDkV+zQ0XZhlC/Yrx9JCGh26P5nLZR
	1EiMIoYDbzHsmkKZb8EjAekQBi/sh2DhUoGRsh1nIZ7sL+OZvYdMTOaAD1HZCuyA
	blBd457OEJhBRJXiN4eK+pSnXRhZBqckYQR/chIZvnkVFk7WFO+Yo7yv4DB8zF+e
	UEEoT3ZmT6+/r6y6d9BMlHyVAWo2QwYC+wTUd31lRYgBSenW8MT1bverr1ze9syA
	4w==
Received: (qmail 2700857 invoked from network); 28 Sep 2025 00:18:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:18:59 +0200
X-UD-Smtp-Session: l3s3148p1@Fd/tyc8/rJYujnsw
Date: Sun, 28 Sep 2025 00:18:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: add entry for SpacemiT K1 I2C driver
Message-ID: <aNhi0vWtFg2v0nl6@shikoro>
References: <20250926-k1-i2c-maintainer-v1-1-3643be945fac@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-k1-i2c-maintainer-v1-1-3643be945fac@linux.spacemit.com>

On Fri, Sep 26, 2025 at 10:51:52PM +0800, Troy Mitchell wrote:
> Add a MAINTAINERS entry for the SpacemiT K1 I2C driver and its DT binding.
> (Suggsted by Wolfram[1])
> 
> Link:
> https://lore.kernel.org/all/aNW5KfIg-_4-Et1S@shikoro/ [1]
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Applied to for-current, thanks!

