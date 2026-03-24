Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274903537F0;
	Tue, 24 Mar 2026 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389580; cv=none; b=rSB0hFkEXXrdRiq07e5xAaIMJgPm1g3FUOxXqbAQY05vAAxQm/Ho5cv/a3x5LlquKZOa8Mm3dEzPfFybOxVO5BvAiARqd29iFXKqV6vEDg0xLMP1Q+lgtG1r4W6cjfEwLc3SzX4p/EzQNgYNdkYCxWeU4R9A8Cka0BHobP15FGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389580; c=relaxed/simple;
	bh=3W9SbqXhQUaQ5JV8iher4Sg8sLttLuS/+h+tUjNkdqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n745uycDukFefg4Ew3rs1uU2XJL6VnaClVTXlXeV7eSCfPrQNSqC84Yr9dj9hxmWyZ5BvUuKU0nQitGrnjTNH05vIlcz3qeZjBztpdvVcaSxJYtVihqBa7cB/NqtJ35pZgUI7rlkECXlY51ORWj4Loc45AjhRzDXbZLDnrrQVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNf7aGe2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNf7aGe2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394AAC19424;
	Tue, 24 Mar 2026 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774389579;
	bh=3W9SbqXhQUaQ5JV8iher4Sg8sLttLuS/+h+tUjNkdqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNf7aGe2D7Mr7xsWaDsatMseJJ+U+s2m0Kt3vNiYSrRqcRc65Vc5lx4nJ8J3D/Ebo
	 94dUggiHvTj4XsGkZionAE8lQUFLo0+5BCtlhB/JWHAsBbYQN2GTk71yuAP5H1/0hm
	 SZD2PrdmC3qlYnCDjahmsk5NAKvYCQcqF2A81ft5xjxHuqpZxz/mFBptcHUkD9kgrl
	 MCxk3rfD3hr3nzAybhnSUQUb/Z8E3tKdD17FHhN8PKmjBfjlBnzTC9tKoNgasSeNJ8
	 OWmV5kfec0UlVicoxPMVh0Udi/g9eqy7akhJFS+2gDp+hQJNDGo9gI6JdpBlUCMPvt
	 PTAG/AOOqMKPA==
Date: Wed, 25 Mar 2026 05:59:37 +0800
From: Yixun Lan <dlan@kernel.org>
To: Yao Zi <me@ziyao.cc>
Cc: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on
 Milk-V Jupiter
Message-ID: <20260324215937-GKA767626@kernel.org>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
 <20260324090220-GKA739629@kernel.org>
 <acLE5xnEBoCtW4Vw@pie>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acLE5xnEBoCtW4Vw@pie>

Hi Yao,

On 17:07 Tue 24 Mar     , Yao Zi wrote:
> On Tue, Mar 24, 2026 at 05:02:20PM +0800, Yixun Lan wrote:
> > Hi Aurelien,
> > 
> > On 21:28 Sun 22 Mar     , Aurelien Jarno wrote:
> > > Add the QSPI controller node for the Milk-V Jupiter board and describe
> > > the attached SPI NOR flash (GD25Q64E).
> > > 
> > > The flash supports a frequency up to 133MHz (80 MHz for reads), and the
> > > SoC supports a frequency up to 104 MHz. However tests have shown that
> > > the flash is not reliably detected above 26.5 MHz, consistent with
> > > frequency used in the vendor kernel. Therefore, use this frequency.
> > > 
> > ..
> > > The m25p,fast-read properties is taken from the vendor kernel.
> > > 
> > So long as this is verified and works fine on board?
> > 
> > > Add a corresponding flash partition layout, matching the layout and the
> > > names used in the vendor U-Boot.
> > > 
> > ..
> > > Also add the bootph-pre-ram property to make the device tree usable by
> > > early firmware/bootloaders without modification, as U-Boot is stored on
> > > this NOR flash.
> > Is the dtb file actually used by U-Boot? I'd highly doubt about this,
> > if not the case or has not been tested, I'd suggest then not to add
> > this property..
> 
> Currently no, but it would be a bogus if we could do it at introduction
> of the device, if it's really necessary in pre-DRAM stages of
> bootloaders, e.g. U-Boot SPL. This would reduce the duplicated work of
> downstream projects if they decide to switch to Linux upstream
> devicetree.
> 
All above arguments are based on assumption, I object to add things randomly
without real test proved.

Let's wait once U-Boot actually switch to use upstream devicetree.

> As SpacemiT K1 supports booting from flash, the description of flash
> nodes are likely useful for pre-DRAM bootloaders.
> 
This is still a 'likely' ..

> > > 
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> 
> Best regards,
> Yao Zi

-- 
Yixun Lan (dlan)
