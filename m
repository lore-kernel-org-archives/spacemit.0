Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5820B80B;
	Tue,  2 Jun 2026 06:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780381058; cv=none; b=ORU2PIPf8lhKrO92UiJJ8NsBXmSxh7vp2/Xp0pHGoakF+AXXyPgUeFRBFgwaZZphk+bINu80fIL2tTPgY6wFYisT2ganNGfky3x2CgkwoWmAwR5B+SH5XuCBuB9HVMH7d1PBvcAzi05BtWLxxM5jvnYpfl73qPUf4fzaGKpQ+wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780381058; c=relaxed/simple;
	bh=g+WWstFohr4XgH1pa86nhmb5NQQNc09s9RD3WqGrHzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7RoMPKsXmIk73PMHHM4xVOtSTRok19DSVoPcQhmZfRGtg/TysUEFa1zEi1G606nhbApg3LxXh9Z6RtNvApfSQu5Fl4Kew2A4kCV5BuKb3m466mrDI9fBYoyHWWdzQDilOipwkPiGDTi7xfDP2MDkeGVTVo12r7GY7q9FnBJs1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzF6m1Vd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzF6m1Vd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6082C1F00898;
	Tue,  2 Jun 2026 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780381056;
	bh=1jN+H2Z0mlbgHjg8etd2+1gBs27Oz5beSO0czG79fUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LzF6m1Vd3isa6eEBj+SiWZl0ljK9y5YGOAMdWP6WZpBAAhVH0x3cSQeAKADQNlmfE
	 IrcTh053yTlcPfKihsfQd3DoZlGoVmaTR0oUi9BWG3GmqPODjkBber1fJl2siZuIkp
	 a39KoNpcp9JJehN0IRuv64lD1S4l9l7bplUGtEtqRy8M9oUYlV+VDjzPfhKe1+npK2
	 rQhMYfjljEbetDUliY5zZTyq8/0WhnvzRhlqe33vmKUzKpc2lFLOzsasmlVpfvu4za
	 l2mytWbsew22qsncwowKV4NYMtcYjf/r8fkduluVg9S2mfKjP99sNEdgQwjK/QZPpU
	 hRxo5OufHWavQ==
Date: Tue, 2 Jun 2026 06:17:34 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Message-ID: <20260602061734-GKD3815935@kernel.org>
References: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>

Hi Guodong,

I appreciate someone help on this, only few comments.

On 21:35 Mon 01 Jun     , Guodong Xu wrote:
> The SpacemiT reset controller driver under drivers/reset/spacemit/
> (common code plus the K1 and K3 SoC instances) and its reset-ID header
> have no dedicated MAINTAINERS entry; today they fall only under the
> broad drivers/reset/ entry of the reset subsystem and the N:/K:
> catch-all of the RISC-V SpacemiT SoC umbrella.
> 
It make sense to just fall back to SpacemiT SoC without MAITAINERS
entry, the whole point of adding a didicated entry means someone
willing to put effort in future maintenance, to help review/refactor/fix
you can emphasis on this, and I just want to make sure we algined on
this..

> Add a dedicated entry and list myself as maintainer. I introduced the
> drivers/reset/spacemit/ subdirectory, moved and refactored the existing
> K1 reset support (originally written by Alex Elder) into it, and wrote
> the K3 reset driver. The series that created this directory and these
> files is archived at [1].
> 
This paragraph provide addtional information of the history (which already 
done), I'd personally prefer not puting them into commit message, but put
them below "---" as background introduction if you still want..

> [1] https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
for the convention, suggest to use more formal format like 
Link: https://.. [1]

> 
also no blank line above

> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> I contributed this driver as Guodong Xu <guodong@riscstar.com>;
> docular.xu@gmail.com is my current address. A matching .mailmap update
> has been submitted at
> https://lore.kernel.org/all/20260601-b4-mailmap-guodong-xu-v1-1-ee9eff1e57ba@gmail.com/
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ec290e38b44a..c9d87244c1715 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25119,6 +25119,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>  F:	drivers/i2c/busses/i2c-k1.c
>  
> +SPACEMIT RESET CONTROLLER DRIVER
> +M:	Guodong Xu <docular.xu@gmail.com>
> +L:	linux-riscv@lists.infradead.org
and I'd still sugest to add spacemit mailing list explicitly

> +S:	Maintained
> +F:	drivers/reset/spacemit/
> +F:	include/dt-bindings/reset/spacemit,k3-resets.h
> +
>  SPANISH DOCUMENTATION
>  M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>  R:	Avadhut Naik <avadhut.naik@amd.com>
> 
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260601-b4-spacemit-reset-maintainers-4b5a91599585
> 
> Best regards,
> --  
> Guodong Xu <docular.xu@gmail.com>
> 
> 

-- 
Yixun Lan (dlan)
