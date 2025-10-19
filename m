Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D522609FC
	for <spacemit@lists.linux.dev>; Sun, 19 Oct 2025 23:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760916303; cv=none; b=h8JtH55sFE0r81Bu5dsSNUo8liqy6xl21B1fjJvfoNjM83dVGfH+4pGZLElK6YatDT8Z/v6HYo5t9CVkk6z8HwxjyDta8CEdaGmDM+Ynl9upr5pF1MCj4Uy9SGRQPNPsjcRMuBeuBsPz+kVWTuum9RriuM7TksDhF+K/eGsY4hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760916303; c=relaxed/simple;
	bh=rWArz2V+sfCHvKSAH6dynpU+HhMzcg6tfC8kCr+jbwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+vOwGsFpm3qJBDcVWJS5qAFp/3aP/TIHJyKSHAEovOdq0se7jZsTbf/AWSvQUWQlwryUzsuX8kgoCdcZIBuP1ePq4ACq4KHYiskANAWXgA+ct3DdjJLu0euUVaQOA4XkLEzUOm8tdQI3ck9ez8NQeKcnKotWu75OcGp7yXyk/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1F1DC341F9A;
	Sun, 19 Oct 2025 23:24:59 +0000 (UTC)
Date: Mon, 20 Oct 2025 07:24:55 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <20251019232455-GYB1506524@gentoo.org>
References: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
 <b6lafouoz6f6al5ki4oh7jj6gfpejwyh62sdrh7lia37sadd4u@rle3aw6grsiw>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6lafouoz6f6al5ki4oh7jj6gfpejwyh62sdrh7lia37sadd4u@rle3aw6grsiw>

Hi Andi,

On 00:32 Mon 20 Oct     , Andi Shyti wrote:
> Hi,
> 
> On Fri, Oct 17, 2025 at 03:27:39PM +0800, Troy Mitchell wrote:
> > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > master mode operations is determined by the ILCR (I2C Load Count Register).
> > Previously, the driver relied on the hardware's reset default
> > values for this register.
> > 
> > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > frequencies lower than intended. For example, with the default
> > 31.5 MHz input clock, these default settings result in an SCL
> > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> > 
> > This patch integrates the SCL frequency management into
> > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > which acts as a frequency divider for the SCL clock, is now registered
> > as a managed clock (scl_clk) within the CCF.
> > 
> > This patch also cleans up unnecessary whitespace
> > in the included header files.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> looks OK to me. Yixun, any comment here? Do you mind giving it an
> ack?
> 
Please go ahead, I gave a Reviewed-by, thanks

-- 
Yixun Lan (dlan)
