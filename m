Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C423B19F
	for <spacemit@lists.linux.dev>; Thu, 12 Feb 2026 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907417; cv=none; b=ee26S3NTR51EfH/4J2QTrzqsf/dWfTvnQSeNVT3/oz7nEb04jgUuZaFq7p1U0HamOTsVPYgxIRsRsRe2k0LCqwqNO1IKVIxWFESU9n7MyCn3Wu0KRf63jvFLlxj1RwcJstpNQDULQ6m/fqE1BHrXZmrC/tUR3XDXfveZskC7cKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907417; c=relaxed/simple;
	bh=w73KRp9PrnpihVzS+UqGXLGhxOqbn/WPIjqajzpJC9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUjj2Xg55oYWy36b2ZkvIVtSOqj8CSuYHsbkn9OaLPF6LnDg4FJOQC2VNNX19r8zVJXtNXBxQz2judylrfpJ5Lz7e6LXyg2NSoDFUKloPuRlyl87BaEcjBoZW9YlJOZg4WsE5S4k0CvTkQi2PaXOYxtdENZ1ITQb90sjoM5iNbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4DB58342445;
	Thu, 12 Feb 2026 14:43:34 +0000 (UTC)
Date: Thu, 12 Feb 2026 22:43:25 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: k1-usb: add disconnect function support
Message-ID: <20260212144325-GYA164498@gentoo.org>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
 <20260212-11-k3-usb2-phy-v1-2-43578592405d@kernel.org>
 <aY24UOvYsnh_7ZCO@pie>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY24UOvYsnh_7ZCO@pie>

Hi Yao,

On 11:24 Thu 12 Feb     , Yao Zi wrote:
> On Thu, Feb 12, 2026 at 09:38:55AM +0800, Yixun Lan wrote:
> > A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> > it will fail to work properly during next connection when devices
> > connect to roothub directly.
> 
> This sounds like a bug. Does it affect K1 SoC as well? If so, I think
> it deserves a Fixes tag and backporting.
> 
yes, but I haven't checked if it will affect real case since the problem
exist with devices connected to roothub directly only..

anyway, I think it deserves to add a Fixes tag, so will do in next version

-- 
Yixun Lan (dlan)
