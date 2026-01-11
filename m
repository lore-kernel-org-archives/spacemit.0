Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A49417B505;
	Sun, 11 Jan 2026 22:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768169493; cv=none; b=D4Jwy7fmV4ZmI0ZepCVO1SCYfXHvCAdW+JOuKayVw+uy6mmcB15L0E9ZNNBDiu7ebB3AcT029gWOp4xdaOxCjBQBWzpSfhE1PnDD8B35/lfKHDYCL3IUvBnjAtVS214T/2DvNWWc/GmnKM7mwi/TryzGCekoK1XwNTpQ6wFaCIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768169493; c=relaxed/simple;
	bh=fyuFy3gDiyxIQK2swhXAdbyrHk8yp6Tcd8rDBBoUIps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkPfGbJjm18AEtq9DcONF0Mh99m0/QkbnuFBkeEYFvrc5PDhXHu6nQDcS5tiwgftrbwo8sOPpxNbszdx29GSq32nRXqjE7vCLmlKI3cp3o6noOFmL4LGeGVY9Y1Sq6Vm9iUNhzOLrZKyTj9AgvpLP+l0qEKbaIX51ebITuPTG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=iWtWuLcO; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="iWtWuLcO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=gPstPsInb9Spla61rJxQEHUOiBzQa2NcgplZETRWFrM=; b=iWtWuLcOj/HdKu593I7VEfL4Kc
	qXuY3yroBM1deApaPnDH9YLD41koVgSi6aVUG19kRu9zcN6d9ri5fKwOXvbQ+JDby4FOy9tiqbcp2
	a00oDAsf6GceFmU2BoPOA4ClrYAnRwQXiznIt+drJ1kCyDnSc05cIQSz4DDnKT99Y6XkLR3/ND8u2
	eWYqeKPqudtWrpK6l0zJTHE4K6HB6fvaHbS3Q+PjkrbRDZty7H3tN5DAFQ52sAFuxuhHayySHpAC6
	VZ7mA6xRjBpeiFf7HMoM9UY6Ws8KuJd9mylKani0fQPsqpqp6DNk4nWcHXYstAg9o0EXIEYlcGqTh
	d+uHTAdw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vf3eR-00000000WRQ-3uhj;
	Sun, 11 Jan 2026 23:11:11 +0100
Date: Sun, 11 Jan 2026 23:11:10 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Message-ID: <aWQf_jojl-dzw6LK@aurel32.net>
Mail-Followup-To: Ze Huang <huang.ze@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
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
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026-01-11 14:41, Ze Huang wrote:
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
> ---
> Changes in v3:
> - rename vbus and hub regulator to match schematics
> - reorder node reference to keep alphabet order
> - drop regulator-always-on in usb hub regulator node
> - drop unmanaged vbus-supply in usb host node
> - Link to v2: https://lore.kernel.org/r/20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev
> 
> Changes in v2:
> - rebased on spacemit k1/for-next
> - Link to v1: https://lore.kernel.org/all/20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev/
> 
> ---
> Ze Huang (3):
>       riscv: dts: spacemit: Add USB2 PHY node for K1
>       riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
>       riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 46 +++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            | 32 +++++++++++++++++
>  2 files changed, 78 insertions(+)

Thanks for this new version. The whole series is:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
