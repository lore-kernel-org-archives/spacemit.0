Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62421DF76;
	Sun, 26 Jul 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785052831; cv=none; b=ZroHgohlDJ+OIqnc5Wv9w2TMGQGdeS634LBwWa3KnYXsJuLj/Gdqew5NXAidfoReQG+RphmIODwYHz0/3yR5UhjJHLcCFrP+Ct/W6tb6Ekwx98OMFjff1WErkUcY4rDNAQnW4N5heqcMwh853I9k8lmX2jdkBHT1RipUP2l4bbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785052831; c=relaxed/simple;
	bh=XeceXjmfVKSe9lLT7lWcU6G/f3Fb5wOs+gs0L4ZQ8c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6DF3X4HrIVB4HMYpHzVZDlr3iHddMzmd21qIPHAlxTXLghrQzQSPzBSPTGhl9WeMyIw2LfgAYLQwS/GlXxuiR8oLxZRwH/3CohYfbDDh+nfmDdq0uhzI3DWYJ8Ng4jb8dMkB5EV41Tfv7m+wOx8IQ9736s5Wu86+juCrWOh74A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qc+vVnPD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qc+vVnPD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602261F00A3A;
	Sun, 26 Jul 2026 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785052829;
	bh=DbMwK3pSQLlciY/1LkRLxZkGV9EuGsQ5BZXVpfHEy0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qc+vVnPD/3jcCWqnk+iBw6I4PSTH0jzX1eG9hCIEeDt9EqHoxvqttQsA4zUZf0Syx
	 pN9s8/PZulQ2nFzSqwa4Z/hJ8KpOtJnEfc9X6Ea8IGoVwH/7L341JcRW6Pr3qnRkC7
	 4s8cW2mkh7OyHSl4VUu9KIOgh8RBDhpBHWs4S/DhKnXCwiMQD95lAQec95SoMODb2p
	 mOF5g0Aa5w5ZzmHj5x8w07YmzdG3ED9VC8/50RY/0j/MoY2i2HUeXenk1m8/8zCTDf
	 ncEjl5+BF1YPZk7VveBbryjaYSXRRUtUam0H0wAXswqoA6VQaJmieeunY+1IUHYesr
	 gBgWwQ+F6gaqg==
Date: Sun, 26 Jul 2026 08:00:27 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Message-ID: <20260726080027-GKH77545@kernel.org>
References: <20260725233351.55004-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260725233351.55004-1-inochiama@gmail.com>

Hi Inochi,

On 07:33 Sun 26 Jul     , Inochi Amaoto wrote:
> As reported, the phy framework can not detected the phy id correctly
> when re-initialize this. So add the phy id compatible string to the
> etherenet phy, so the phy can be reinit successfully.
> 
> Note: separate this patchset as two patch for backport if necessary.
> 
> Changed from v1:
> - https://lore.kernel.org/spacemit/20260725005804.373698-1-inochiama@gmail.com
> 1. Remove all the c22 fallback compatible.

Reviewed-by: Yixun Lan <dlan@kernel.org>

> 
> Inochi Amaoto (2):
>   riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
>   riscv: dts: spacemit: Fix phy id check for the phy on com260 board
> 
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> --
> 2.55.0
> 

-- 
Yixun Lan (dlan)
