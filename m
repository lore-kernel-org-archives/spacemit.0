Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6741175A66;
	Sat, 30 May 2026 03:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110202; cv=none; b=b1V3CHYK1HlOJ8eyYYskjoPqLitOF2jZkFbU4gCsMvKYAbpY84Gf/GnygKpqxQiu9RTilk4OfNugmCw9jrM7EnpePnNxs0j03333Dv/+h3V8/9rfnwmK2+xuDHmhSB3gyIVWdJY1RAD5qUpG5KwxPrAuRxVfGgv1OqqCBWcxrE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110202; c=relaxed/simple;
	bh=9O2tdNxdzKqtSSFxKwCQqUXPKygGm77hCPN/2gyL7UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnoG+WN+aGiyhNzAQpQS3N5z18i/g7sCwcAWze6vECJyqDX4m0IVzmCEgNQkFdfOmK3CUrd4p94Ej+PMUOSx3/gtA8LGeUI9mpSrMJ1iH+bWkeF7J7AIqm6rnKef0CjriXzXfUq+eK2CRxyFKWkZA2unT+pLjUSXKBKoK24/AC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFeFMKOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFeFMKOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F831F00893;
	Sat, 30 May 2026 03:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780110201;
	bh=lV76AH1HBmgcxLbMccze3T0BHd4sPS3mDORlT8NSVC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oFeFMKOUmBDgQJ/Ers8G0P8ui1p3EETlX5hPRVKl4gC71fHeFzNm8vb3L043SmcnB
	 ZVVGpL6Whb92ngsvTjlxMUg8GAceD/BSN5NqaUaIvktbKWa4T8mhsh3kkSIik51sN9
	 WSyK4SG6HYO2V7cfdvioFDeU95fc4kgDk3gmDWfA1EzJ8wJ3kUxO9FPVi8oLGZowMW
	 TZg2bXVWxRJh0Mnp+PXzVohL7MgQ237ydtk/549EJLhn3MfvfpUh9b3oHW33YmCi4z
	 z2ErPhNqkBBBxv93YMWq27/Oy7p4YY2xrLKEWbqNWume/HhjLAu9DKUvM84SkYf9fQ
	 D6x+Qf21+wV1w==
Date: Sat, 30 May 2026 03:03:19 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100
 cores
Message-ID: <20260530030319-GKG3748271@kernel.org>
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>

Hi Guodong,

On 15:22 Tue 26 May     , Guodong Xu wrote:
> Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
> provides a forward progress guarantee on LR/SC sequences in main
> memory regions with cacheability and coherence PMAs.
> 
> The SpacemiT X100 core supports it per the SpacemiT K3 hardware
> specification.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Looks good, I will queue it, thanks

Reviewed-by: Yixun lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
