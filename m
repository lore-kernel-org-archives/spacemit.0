Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B57378D9A
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076696; cv=none; b=iAlXZ7OpJzjbmW90oFzs82NKMvH/QC4IO+OtOOGMZl+6sfIB+9vWa6bIpj4qW7fVrOVfFAIzOcreVRtefxFEQZrA8D4OoKDFLZ9BKE4cG4oqSFnqe7U4cho+h3tM62zah3+PaLYadGqxf7Fkr5iLZ7pwv9cDU03x0C4JP1lHVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076696; c=relaxed/simple;
	bh=6R4gG9+TiV1zEt9QzN6VdOfwqXjtMSM/z3VQOQTcCII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLIC3FRuUjr+5lk4SubM1kR9bQzROBtqNQJqJlrga19SHPgm8QEdFZXpQ4ViNDZpLZ5e6n+8SvD5LBnvoCnuh1DrtDZuet21XOENN6BE01CRP7m1yPe1gy+Brsi70Tal+GgcgsER5LliVoMzIChBPbZGiFPsC5vgp5ohhb2YYww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 603E0341E75;
	Thu, 22 Jan 2026 10:11:34 +0000 (UTC)
Date: Thu, 22 Jan 2026 18:11:22 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <20260122101122-GYA63789@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>

Hi Guodong,

On 17:43 Thu 22 Jan     , Guodong Xu wrote:
> This series fixes hardware voltage constraints and enables flexible power
> tree configurations for the SpacemiT P1 PMIC.
> 
> Patch 1, n_voltages is corrected to match hardware register widths, as the
> previous values prevented regulators from reaching higher operational
> voltages (e.g., 3.3V on LDOs).
> 
> Patch 2-4, hardcoded supply assumptions are replaced with explicit
> devicetree properties. PMIC supply connections are board-design decisions.
> Moving this to DT allows supporting varied topologies without driver
> modifications.
> 
> Note: Patch 3 introduces a bisect breakage by transitioning to
> pin-specific supply names. Probe failures will occur on existing board
> (K1 Bananapi F3) until Patch 4 updates the corresponding DTS file.
This patch bring system-wide change that not only affect Bananapi F3..

Please also provide fix for other boards, I think you may not be able
to test all boards, but make sure the patches are available, so people
who interested can test, P.S I can help on milkv jupiter board

> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> Guodong Xu (4):
>       regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
>       dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
>       regulator: spacemit-p1: Update supply names
>       riscv: dts: spacemit: k1-bananapi-f3: Update PMIC supply properties
> 
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 ++++-
>  drivers/regulator/spacemit-p1.c                    | 25 ++++++----
>  3 files changed, 80 insertions(+), 15 deletions(-)
> ---
> base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
> change-id: 20260122-spacemit-p1-ae596efe885f
> 
> Best regards,
> -- 
> Guodong Xu <guodong@riscstar.com>
> 

-- 
Yixun Lan (dlan)
