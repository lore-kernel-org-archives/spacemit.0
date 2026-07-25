Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD92E2DD2;
	Sat, 25 Jul 2026 01:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941833; cv=none; b=KGIF/AtfgRPWU0L5tSZS23fW0JcXnsXrm3pVykq9w3ELKhzLwkaG+Ho0oPYWuXRIdUiUzZuLSWrv1BI2ivRklLx1AJ8ZnI3kW9z2C+0xOYwi7ddKPfEOWoZSmxVde//CYxGmm0JAtxTUseUv0qPgs1U3URHRIOZLBsM5DEIISE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941833; c=relaxed/simple;
	bh=Pae+INSr6JAw2Gdln9UU9PBXItb860scM2fflpK/6DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEWZkFrNGG651yQ+uPPLhSSU44aWW2rCDvaLkLVVQDKZM3OlSPhVfPaNsLD0JaKbFHwc7gn27izUb4h65xiJlLAYrpZSCKK6vlrfURbDe4/XlT5I3RUah7N7HDPzW0UAzV6GBCBLy2MD9ARnNDWs3ccKB3uMu5D89q/GK0hqYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDb0U3Cz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDb0U3Cz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D413B1F000E9;
	Sat, 25 Jul 2026 01:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784941832;
	bh=7Tdgl5VWtqICxb+Y8DVatCG+1v07WZyrS2hVZIJk20Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bDb0U3Cz9TrjtxczsWNxtfeuuyiPtLOWKyqkdUKkaJRbznCe2PHVl9UXzK8yDX9qT
	 elV3PJOS1UAJn5NQ4lVn3lk/A78AdnkxrdYtznbUYBsKVnT/myzA1oqH78E8oFVgHu
	 cK4AYqR/jGadyvVhDAWRteWh4EWDK3RDsXJ6pF8+ThK4Y8iLszO6Ov/rjoIndB0b47
	 EMXqgFOzwzmuEOscxBjaFE1jKLEsA9Mo6Dt8P8zzkeQ1qFg3sRjddfJSdMBzS/5T0m
	 txsyoi6FHflbPHkIqx/uOZYfHTjZOyHgCvOm+I4NH8Iog2p5xHQWoXXSPtqFOOOFWz
	 33WMhZGvKlkUA==
Date: Sat, 25 Jul 2026 01:10:30 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
Message-ID: <20260725011030-GKA77474@kernel.org>
References: <20260710063314.1030249-1-inochiama@gmail.com>
 <20260710223804-GKB106000@kernel.org>
 <amQKpgD7NKlR8qEE@inochi.infowork>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amQKpgD7NKlR8qEE@inochi.infowork>

Hi Inochi,

On 09:01 Sat 25 Jul     , Inochi Amaoto wrote:
> On Fri, Jul 10, 2026 at 10:38:04PM +0000, Yixun Lan wrote:
> > Hi Inochi,
> > 
> > On 14:33 Fri 10 Jul     , Inochi Amaoto wrote:
> > > RTL8211F require at least 50ms deassert to guarantee the register
> > > access, 10ms is only enough for the PHY reset.
> > > 
> > IMO, it's kind of too trivial to split into two separate patches,
> > while duplicating the commit message
> > 
> 
> For backport, I suggest keeping two patches, so it can be backported
> in a more clear way
> 
Ok, fine by me, I will queue the patches for v7.3

-- 
Yixun Lan (dlan)
