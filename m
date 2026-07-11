Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354541C72;
	Sat, 11 Jul 2026 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783737412; cv=none; b=tJLJIjM5XZDEIOeEt+3DIrm2uyRIEO0/X2ZLz+w0Mvlr7YHF7lsxbbztS/dAUP899GGhVjwq38chYTB9JeNlhBKbO9NDN5Anu8fLBd0ulfYu/c5M2bhrXtHCYos0ISVj9E51VCLyfR64Y/T9G0uyUR7kew9kdF6GDzwAKx+raXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783737412; c=relaxed/simple;
	bh=dpjtxq1s5UWAh7erVuNJEL2m0ijsm7BL9jBPsDKhrKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVwur/ousIYGpXgxaDeN/k5TqDSToGpnLsNOgOQBzH30m/sdaWNjC0gG1cIhti1Y2dmjYl34hiCkVRlu0lSkTO1UZ0FJ2mOAOawns7Cul3x6V7ADyruWic06J1QqYligUknRE6JKKcdAvW8fDpFXH+bCR2XCkAYdYgq9/vyTVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRH/SuAr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRH/SuAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771B61F000E9;
	Sat, 11 Jul 2026 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783737411;
	bh=JvGQgD/zL+fNY2gX0aPOTLx88oeXax1vm26FJzg3PNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRH/SuAr0s9ktamFAFNn0iIuDA5FkvUvLKxP9eLKw43mSTVOyTHVopp5CJ5F4oUof
	 f9RaQ622WSnCBsfrCxYPx6V80zVfYgFDuXAOPPsv+1lR0kLDymLGrl97Kfzu1hsbZm
	 p3LZrz0qNcCCHlOHYUgqH1zMdSZGoLWPDoEYN5ssNMqy7i9cU63E/ORNC9EHyJjCmj
	 Zuw7MvmvtB9UFadeCdLFR9eb/fumQ+d+bRk1oXHmt/SaW5d/iliG6NYxjYXZSW84oY
	 ZAYhcdpzRwM0zOOo5KBFAVXKjy7go2zD9s0H5VRLn9sMlkbJl54uNWVWCUNREwLcOK
	 yOq0PyHcbrbbA==
Date: Sat, 11 Jul 2026 02:36:48 +0000
From: Yixun Lan <dlan@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	wefu@redhat.com, Aurelien Jarno <aurelien@aurel32.net>,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: Add QSPI support for
 Pico-ITX board
Message-ID: <20260711023648-GKC106000@kernel.org>
References: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>

Hi Zhengyu,

On 09:38 Sat 11 Jul     , Zhengyu He wrote:
> Enable QSPI with proper pinmux on the Pico-ITX board, and describe the
> NOR flash wired to it.
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
> Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
> ---
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
