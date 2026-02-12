Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9C21773F
	for <spacemit@lists.linux.dev>; Thu, 12 Feb 2026 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906939; cv=none; b=ZXD8ViZ8SwAmUlrsejcX09WF1hcSq8Tn0tEFtc3OuQgz8g8kQ/z8AO6lKdOzFX4DqDFFw0riMzr2wFThLBtIjaJKR5J4P7nsFQx1nkhvD8Fc1EUHu0xGCwlJzN+FSnjYE8pg8phnOx9bMyE+p3HodkbMFSJJt+guPq1owFzEVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906939; c=relaxed/simple;
	bh=pCTxw9ZabRRyy67yWUvE+t6vwzKshHx3F1gUcULbzps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2DJfYfxszYCMoNAidQWdPMvyRHGHlsljDp8rxcePQ7aDg0efoSZZS9CUd91Jb3LKFcOhvEffaV+ebNU23vxF+W5f6TM/RyhX9GLtkr5rsWUOEKNMOdfG3/9uEBL+3M3aTR/TQlbLZBd3Pqp+ghprY53/77GB7/ZzLu50MglLaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D36B634243E;
	Thu, 12 Feb 2026 14:35:36 +0000 (UTC)
Date: Thu, 12 Feb 2026 22:35:30 +0800
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
Subject: Re: [PATCH 3/3] phy: k1-usb: k3: add USB2 PHY support
Message-ID: <20260212143530-GYB114046@gentoo.org>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
 <20260212-11-k3-usb2-phy-v1-3-43578592405d@kernel.org>
 <aY253_fOkoQKbi8g@pie>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY253_fOkoQKbi8g@pie>

Hi Yao,

On 11:30 Thu 12 Feb     , Yao Zi wrote:
> On Thu, Feb 12, 2026 at 09:38:56AM +0800, Yixun Lan wrote:
> > Add USB2 PHY support for SpacemiT K3 SoC.
> > 
> > Register layout of handling USB disconnect operation has been changed,
> > So introducing a platform data to distinguish the different SoCs.
> 
> Would it be clearer and simpler if you define separate phy_ops for
> k1 and k3, and point of_device_id.data directly to the corresponding
> phy_ops? Then there's no need to introduce either spacemit_usb2phy_data
> structure, or spacemit_usb2phy_disconnect wrapper.
> 
Yes, I agree, thanks for the suggestion

-- 
Yixun Lan (dlan)
