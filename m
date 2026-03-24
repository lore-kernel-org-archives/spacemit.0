Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422C3AC0DE;
	Tue, 24 Mar 2026 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390192; cv=none; b=nrP1VZE1CDvu0mjE5SSiB0GP6wXysc5dAm5waGQnjeWxgAh1gwYGhtNatnBH+Xd/Xd2l9pUmAMrpQvYQwZxBoj5vx3k7tw7jbOFYfRjBjsjl5xCqKjd/p62BiVlMXbve5BVTgSqLTFac70CLK4eCMTHUK+NtVxps0e5ZBhTEpVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390192; c=relaxed/simple;
	bh=7j8Ky5lso1k7J2uDYMW9hlAWHsxyR7vRQ7da5WAJfEw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvTZAQQNDAxkvLs/grOeh22HMzyySeih4ISFvLx+/fyb99HGXzB+MbesXmFEYWTrx5jy0MSt5NNvW0y6sWQM6uRnVVnK+d26O716GARYqJ/a0+HGHezcAw2ABMCh0IZJTJwkVuyl0KzGlIcpf7ixrp7/6C2N8fcb9Litbsai8r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuXinN2+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuXinN2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4452C19424;
	Tue, 24 Mar 2026 22:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774390192;
	bh=7j8Ky5lso1k7J2uDYMW9hlAWHsxyR7vRQ7da5WAJfEw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=tuXinN2+A68pMTzb1oX5TWUcCu3BHM7Gkw0cdO5VaoJiw0yAVW+FaC1osUUNSIjvO
	 yKfi2qeDVFViC2Iuja2kaNFYuUCpfaE4RZ46wRugPwNGxOZPwiPoYRYVhdfOj/14DL
	 jBCyZo7wMmgy6DX3fcOGsXlEzY7pB0uw7N1M2ElDyjq8T1F0B66qD5TbRJb43LU0s9
	 IA7J5U+zJcSwWBGT4m+XhD9mOI9sGWlJ/YOsjklMtuuv23Om6JACnH+3YvLptzoQf0
	 YR9ZS++mfRRaOHfK1hcRgw9xgiOwG2VsaOYRY5iofCsOlRHFnJUeTVJF7OAKhQwQT+
	 9gMcSwhW4QQoQ==
Date: Wed, 25 Mar 2026 06:09:50 +0800
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on
 Milk-V Jupiter
Message-ID: <20260324220950-GKB767626@kernel.org>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
 <20260324090220-GKA739629@kernel.org>
 <acL_xPYiGXUp_Tir@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acL_xPYiGXUp_Tir@aurel32.net>

Hi Aurelien, 

On 22:19 Tue 24 Mar     , Aurelien Jarno wrote:
> Hi Yixun,
> 
> On 2026-03-24 17:02, Yixun Lan wrote:
> > Hi Aurelien,
..
> > ..
> > > Also add the bootph-pre-ram property to make the device tree usable by
> > > early firmware/bootloaders without modification, as U-Boot is stored on
> > > this NOR flash.
> > Is the dtb file actually used by U-Boot? I'd highly doubt about this,
> > if not the case or has not been tested, I'd suggest then not to add
> > this property..
> 
> It is currently not used by U-Boot, currently SPL support is not 
> available, but patches have been posted to added it. I just wanted to 
> anticipate the addition of the Milk-V Jupiter board in U-boot, but if 
> that hurt, i can remove it (or you can removed it when merging).
Not hurt since it isn't really used in Kernel, but I just don't
want to add things without test..

I can remove it if there is no other changes, then no iteration needed.
Let's wait a few more days to see if people have additional comments for
this series

-- 
Yixun Lan (dlan)
