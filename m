Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2682734250E;
	Fri,  9 Jan 2026 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947270; cv=none; b=VHq1j1wi1AiJc8AUf+fnrIHeeO/V5vKaoX/jDHauW1Ar9Qo0exU0wP2seRH/wyJcE2ARWWgQ3wqoNOfNhqfdR8/4nKhq95EpeA/WZrtNaXvS3iQt+U6IrK7u7G+fq14HTfs79ut3CynnrsQsW/Ih0ItiS/AB+upBusqbBdj3zA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947270; c=relaxed/simple;
	bh=sodnMF8RrUOMGPgccPTwIGfL8xNULyfrhroE3CB86Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PN54YNkpIV5TpwgzySwGmSfCs7x3mkCURCL74ZSy/EDmI6k4k3/H6Rf4XVWIrUs7b6Z/Ri9WRHwObfHdllBD6IK/AvK8wUlRRrt2NGQ2lUAn2cTIEtOeO68fTPR700BLeqbNZ0swr8cG1IBKhIPPERprp11FdsG9TlMxaOSXcqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWYjh/Nz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWYjh/Nz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F41C4CEF1;
	Fri,  9 Jan 2026 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767947269;
	bh=sodnMF8RrUOMGPgccPTwIGfL8xNULyfrhroE3CB86Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWYjh/Nza7q6DWxWlfm0DTQwzBeuomnr1uhPPWhgbKqpcNms9qrF9YU4ApbTnGJZv
	 ddP/Sbxt3XuZ34ZKz3R6SYhKSV6iV8NJAy5iJ4DNHPNpfOXrZTHo3+st6r3JXgz7iW
	 uGGGgZGLwHygK/JpUf8jWUgdpfFKPHa2rO3ZmS166LEXQ++Wjf6WY/Hs/mifd7hd9V
	 Pneq8uqKqHqZeNPJSvweeVJ0gX5ER+xvqkD0Zwp9Ju+vFL5greZN1OzpEl2Xx8NTnS
	 72ICXChvJsuKEjiIPEvS37HxStleb0Cq+W2KCH71Xr0lBTkhO4wQeU+tC+3pcskmn+
	 +voaNigrcvNJg==
Date: Fri, 9 Jan 2026 09:27:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Haylen Chu <heylenay@4d2.org>, Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: spacemit: Add K3 reset support
 and IDs
Message-ID: <20260109-woodoo-energetic-hyena-1d2afc@quoll>
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-1-457df235efe9@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108-k3-reset-v2-1-457df235efe9@riscstar.com>

On Thu, Jan 08, 2026 at 10:22:14PM +0800, Guodong Xu wrote:
> Update the spacemit,k1-syscon.yaml binding to document K3 SoC reset
> support.
> 
> K3 reset devices are registered at runtime as auxiliary devices by the
> K3 CCU driveri. Since K3 reuses the K1 syscon binding, there is no separate
> YAML binding file for K3 resets.
> 
> Update #reset-cells description to document where reset IDs are defined.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: Update spacemit,k1-syscon binding to clarify K3 reset is supported.
>     Update the commit message to add backgrounds of this patch why,
>       instead of what.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

