Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC883DB646;
	Tue,  5 May 2026 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965831; cv=none; b=SmqQtRMAu+uIRxKeA3jk574ZmmbTupEdNLQRDocazCWrvR+aMiqhiJrjww0PmP3QLgk0+ze9r6G5CWDfXJY2tF4YI1rgymg0uSJWc1JT9FW/1FuPzFxeR8sLWdTD+fbhvjXD+fcedpmR0k8PS+wm/XRHcsa4xjdk7GoCQzxveKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965831; c=relaxed/simple;
	bh=lVEGQZADhV3IBGi5bRZNIIRtTV+/BGvbWgLuLVuyE1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvmUGZfWxBVdgJ0h1rluXX2SRtK7p3k0Ws6vmvCFEPYQ4/ioxpdpZV7eHRTfF407OZuW3uFHCcDRWZbXWS16ZAD4YjqQYdR5qsujZVWTUqQRSBZkBVwxo0i8vcoAtHeNAmP4R0WjgamVbQ+rdg3X2Cfz8DCyeJ6eZPA+Mqinct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sU9cyXpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sU9cyXpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8558FC2BCB4;
	Tue,  5 May 2026 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777965831;
	bh=lVEGQZADhV3IBGi5bRZNIIRtTV+/BGvbWgLuLVuyE1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sU9cyXpwi/EQ/gI46x4DzAEILkOO0ZXMCKA1wGYpZBq/nmNEPhVgMYtF9f7wrLAg3
	 PaZiRljnfn1a1T5gnS9nkEUHuF+9Wu8xLmKPI+8N1R/F21ZAL9bcnBJQ0NvpLJ/Yrg
	 Dd2jEZZKP0UKwJGxcQqwP28PRCcLiz7wJSp/7woOzKrMES6/O1derypCUGPz+phdKx
	 +n2Hkh2/UqOiiV4OfyT+ADhspS7o4m0Ytov/Pl9ur4W/Ac3OX4MAxoiedwFyW+rrh8
	 VwQcw0VtQxcxPo03i+5y/a3ZhGkLBChcKzefdBec3adw2y26EYbSg/h6NzBMMlMxAk
	 QeS9hTt01guow==
Date: Tue, 5 May 2026 07:23:48 +0000
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Message-ID: <20260505072348-GKB3537744@kernel.org>
References: <20260430-reword-overstep-3be08b7eab25@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-reword-overstep-3be08b7eab25@spud>

Hi Conor,

On 19:52 Thu 30 Apr     , Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Because the default console's baud rate is not set, defconfig kernels do
> not have any serial output on this platform. Set the baud rate to
> 115200, matching what is used by U-Boot etc on this platform.
> 
> Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Fixes: d60d57ab6b2a8 ("riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
