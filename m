Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D7A145FE0
	for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 02:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768183451; cv=none; b=AIRDFSAisTClH7p7mHmBdqSeOaYWgjJgPVzKQRZF9WEMbkWEMNpAuIJbYX3uc1KrP3RkXPelyM2LdY71LTrDQcFyHT0l7o13cDnS+OkuKdk9j7LyPk6nvNJE+HFju2HEseU+HZUMpIYb3YxSi+H5KfIKDPsf0DAC0BOZc97XOyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768183451; c=relaxed/simple;
	bh=nP19cY9BLe+A+fwC7uSB2Gu1dLYRgTIoa9a2IkM2Fis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMX3ri9RrtYS+vlBOxue420cEGb8LUoAg0en8Lv8Vjml4tnGv4fG9lQFQ9TXgJTKUZwCGWsyaw/go0ml2BNIVHMVGUWX0g9jyLWA97yDl46q/lhrZsMGW+bKGscgCS1jho/Q+b0JCi1mqQPanKx4K/Zcfx4HZkmWwY/Sq90yMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BD2EE340FDB;
	Mon, 12 Jan 2026 02:04:08 +0000 (UTC)
Date: Mon, 12 Jan 2026 10:03:59 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Message-ID: <20260112020359-GYA19769@gentoo.org>
References: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>

Hi Ze,

On 14:41 Sun 11 Jan     , Ze Huang wrote:
> This patch series enables the DWC3 USB 3.0 host controller on the
> Spacemit K1 SoC and enables it for the Banana Pi F3 board.
> 
> For testing, the following kernel configurations should be enabled:
> 
> CONFIG_PHY_SPACEMIT_K1_USB2=y
> CONFIG_PHY_SPACEMIT_K1_PCIE=y
> CONFIG_USB_DWC3=y
> CONFIG_USB_ONBOARD_DEV=y
> 
> This series is based on the spacemit k1/for-next branch.
> 
> Link: https://github.com/spacemit-com/linux
> 
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
looks good to me

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
