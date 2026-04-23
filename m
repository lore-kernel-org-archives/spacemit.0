Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186741A3029;
	Thu, 23 Apr 2026 11:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945163; cv=none; b=uKEvKuGW8mpFDUjSyofPegiQyLq2ax3AraGVBSChpcQwLCtQIkWM55gP8mMvSum9WcwNItjJaQHwYcx1v1Ebk+01XGK332WNvYEiO27KQgOGCYcZDYThdkmH0jsGeXLAfGkVO254HyKKh1SgIATD/Kv26oLSvUEVEbGVr7Rnefk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945163; c=relaxed/simple;
	bh=khu9hCGRWwD6P5ATFBgT/SxBupxKRfuGObzWbF9YMd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igFclj3wSU3m8SNcpAOQY+piT6eIcCLyIVE0IWXJmdZov9gvqEf/JlrK1rDB6UiZ3850o5X6GbQFn4Z1FJe+00UlcyO3hzpfZV1pq2eUC8O9RhGhWPtj+SOYVViDSLiNuZ2NeF3kn5z2B9KXEtDGVJRQGNky2Ie21JJrJ9pzC/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ug/wc//u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ug/wc//u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2DCC2BCB3;
	Thu, 23 Apr 2026 11:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776945162;
	bh=khu9hCGRWwD6P5ATFBgT/SxBupxKRfuGObzWbF9YMd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ug/wc//uDsfM07EOJTntKPjUWKDYJb9g4EuqFSuAZDa5NPLOwUWgPIMp9hsbQoZ0Y
	 8mz5b7Up60NgQ2kzIRH8j91jOfvgRKmr1mrWSU4AB98RPwtzYY+LPnrMQzkWj5Y9qY
	 34pB+P6TdorIutGVzBEDP9Rvar3e+gPNFCld6aSZ7aq0ZbOhCpZN49o/u6e+hPwgMR
	 3Jg47Wo5CLf2ubqln3bYzE/4/El+fbP+hckE7gmzpF1dCRFBZRsBTJ1LTaZ1epLUdt
	 IUCAMwLQ7eVqMEkoC5wgjN8UU8d/Kw/qPiUhfcQpDAVvqJGFkl9Jz8jT39OmUSafmB
	 C2XpYVpk/0w3A==
Date: Thu, 23 Apr 2026 11:52:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
Message-ID: <20260423115239-GKA3186731@kernel.org>
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>

Hi Sandie,

On 14:40 Tue 21 Apr     , Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
> 
> The series is rebased on next-20260420.
> 
Looks good, likely will take it once v7.1-rc1 tagged.. Thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

> v5:
> rebased on next-20260420.
> 
> v4:
> - Patch 1:
>   Add Acked-by Conor Dooley.
> - Patch 2:
>   Copyright begins from 2026.
> Link to v4: https://lore.kernel.org/all/20260413060524.1235982-1-sandie.cao@deepcomputing.io/
> 
> v3:
> rebased on k1/dt-for-next.
> - Patch 1:
>    Use formal format user name.
>    Remove Reviewed-by Heinrich Schuchardt from internal system.
> - Patch 2:
>    Use formal format user name.
>    Remove Reviewed-by Heinrich Schuchardt from internal system.
>    Add uart0 pinctrl.
> Link to v3: https://lore.kernel.org/all/20260407055557.1202713-1-sandie.cao@deepcomputing.io/
>  
> v2 (deprecated):
> Link to v2: https://lore.kernel.org/all/20260331071110.68321-1-sandie.cao@deepcomputing.io/
> 
> v1:
> Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.cao@deepcomputing.io/
> 
> Sandie Cao (2):
>   dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
>   riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
> 
>  .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> 
> 
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)
