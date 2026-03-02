Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D1363C47;
	Mon,  2 Mar 2026 11:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451780; cv=none; b=HuUoqGlbAplnKWEiBBw+FffpZKfr+qxm9b4GXHQ6KakGgI3yNoTAlMTPTLntaFRlBjfLgJEssJiTGTdYS8UAvTi2O0Q2y1pSmGGp+qB3p499ZEhmPVD/ShaPvB/VHntPnsaNPzWGeQGdCLOMhLNd6NocXvpx7D8Ck7y3nbxQJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451780; c=relaxed/simple;
	bh=vvw9tnQE0DZbUNAHHgzgVlHQIekrFHzWJj4ctIf+n54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0ewNfl4MrCvKSPDVwzKC3O5lWT3oCBBwxchNAnfY/i34m72qRPsXyvaU0Tpa1tr4H89HYAZdvrsvNEX2yOVp4+SK9Xhb6TImzO/KHk+ZtDlpb17xkKkoofdYzBYCBSY8ekSFJQT3sqgCu2afhe7en63Rg1xjVFdANdVu9cNFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAnRn6o+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAnRn6o+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68FCC2BC87;
	Mon,  2 Mar 2026 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772451780;
	bh=vvw9tnQE0DZbUNAHHgzgVlHQIekrFHzWJj4ctIf+n54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAnRn6o+bjCxh8a/Y8JG+TiH34Xpz1Dx7Akkb5l9I4sJVKFADLI9eWpT5rSKB8PPT
	 Hx1pkPOJM4muunsjPAdCc+Kaor2DGNF2G4Vx8qRayN3wEgcZMFHRug0hu8wr96UWIu
	 l3jDZy4T1Z22xdFgKhwbzKMqiZh9UQQRY3LIwfzbiNSGNNWYsmI/E2fAI4M2UkoGtQ
	 ytgMVphMHDv0c3JjgivGrY3Nl5rqsBhPoJ4xvVCRI51H/zH2aIh6QWQR086X3tcsCR
	 rW5ur+LdWUUbaZtpkjOZGU0Ifs72kOPytu6YWl2zMDtR3m2yE6X+oz7yPh08v6bJHf
	 5FRI8xczQMOhg==
Date: Mon, 2 Mar 2026 19:42:57 +0800
From: Yixun Lan <dlan@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: adapt regulator node name to
 preferred form
Message-ID: <20260302114257-GKA289813@kernel.org>
References: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
 <87o6l6vd7l.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6l6vd7l.fsf@ocarina.mail-host-address-is-not-set>

Hi Javier,

On 09:37 Mon 02 Mar     , Javier Martinez Canillas wrote:
> Yixun Lan <dlan@kernel.org> writes:
> 
> > The preferred node name for fixed-regulators has changed to pattern [1]:
> >  '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
> >
> > Adjust all SpacemiT DT regulator node names to fix this.
> >
> > Link: https://lore.kernel.org/r/20240426215147.3138211-1-robh@kernel.org [1]
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> > In Review of adding DTS for OrangePi, Chukun mentioned fixed-regulator
> > has preferred node names [1], so let's change it now.
> >
> > This isn't strictly a bug, so I've not added the Fixes tag.
> >
> > Link: https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn [1]
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 10 +++++-----
> >  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  4 ++--
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> 
> Looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
A little bit late, I just picked this patch, but I can amend the commit to
add your R-b, thanks!

> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 

-- 
Yixun Lan (dlan)
