Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82F1CBEB9;
	Thu, 29 Jan 2026 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710565; cv=none; b=aSGEbMF/yeoiiNCdlobg9wBff6L+QYKVO2usu9olx9vXst9YoyC35wIUYVkyaQx1lahHQzvxBVJuEbOLTviFvdvcVSmhDz7QFB38Mn3YYbNg0NLZ6Ey4FXyatNKD1OstC8AFwgJZ2EWJY5DuX2yv50yXHhTXhN9sGsexGDrdmxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710565; c=relaxed/simple;
	bh=4DXQDhnPotjP+UKYn76hb5JpjbepnP01qbt9I5JvauM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbFG39+/JgJOrDZ/iiZkHbaoGxzHN9/W+pzvtYfu4RDiVUWM+fykJXEdxmkvVaAIJ7dB4dcMGneCn1Oqi8phozGkda4kFSzicmOgL5cXDVx1q7OP06AixERqIbtiLJZC3s0FPpmwxCeYe5F8KyovH67C5CbZniAieBMFOwShR2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anB/Q/jb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anB/Q/jb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43245C4CEF7;
	Thu, 29 Jan 2026 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769710565;
	bh=4DXQDhnPotjP+UKYn76hb5JpjbepnP01qbt9I5JvauM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anB/Q/jbZNTJ+9hs9D5Hw+dbM8AF5A3/ahakg8HQK18cyX/ISdqRhjY56JdPSE7d8
	 z8tmnFZPr1sOAa1Ix1pEzt4IqsJTXA/fW9jB93ccEDojQbtc9RcO1XjAb2u834CE3v
	 5poZvGKmQkuXFZk+aS1Orib65norHrWzF3VK3ftyvc7vyoAEms/J9y1SEqcH8Fukw1
	 q/SrjR39Nvs/kxSKqmsQ5G3/6v2eZCIvSasGpVNMrL2BEa4/j5Btil28GUX/FzmMgy
	 bOffYtIGplJtqaHSlIZfGmWuYL8PcuG7lW93PU9hUdhQZrre1Z9uyL9blb1HHgiwmF
	 XgYMm5DwoUUrA==
Date: Thu, 29 Jan 2026 12:16:04 -0600
From: Rob Herring <robh@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260129181604.GA1398997-robh@kernel.org>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>

On Sat, Jan 24, 2026 at 08:20:17AM +0800, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
> 
> This allows different boards to describe their actual power tree
> connections in devicetree rather than hardcoding supply relationships
> in the driver.

You are breaking both forward and backwards compatibility changing both 
the dts and the driver. If that is fine to do, then explicitly say so. 

A secondary issue is the binding and dts go via differ trees and we end 
up with intermittent warnings.

> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: Remove providers from the dts example.
>     Pass the 'make dt_binding_check' test.
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
