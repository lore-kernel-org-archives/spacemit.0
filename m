Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA57280A56;
	Tue, 16 Sep 2025 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758013053; cv=none; b=sAF3BlXIcT8MmTuy6ieynSPZ6Rl7mRVdNtFQpehvwK2uGVJ05T8CCtjGsm1HWQ6RhJ2OnPB9ER8zZIu8CRmKbAF17J+ATeMAO+qIkMncDT3MRo9z60HI5kjrjHNltsyu0epeTtNImAp8t+UU+ikBh2pMYunW3LK++jL/QOLOIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758013053; c=relaxed/simple;
	bh=af7rjeVyq1V01VmfV+h18NMd8JU8MkjjJFZfdDYHg2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWatRUcwxyNO+hJR2llXqXERB9iZtc7Fqsi57JBOC+pXOg4G0LZn87eAldcVsn7dv9Xv6n4/IVdoVuD5++TgU/kqOc1FIlUh7DODYAUtou/lo6q/CtMmvpGl+Y1nhzbthUsH5K8siRDszAWVyAAR998WjlwZdhQbixPYt+T2IyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D2D98340EAF;
	Tue, 16 Sep 2025 08:57:29 +0000 (UTC)
Date: Tue, 16 Sep 2025 16:57:25 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <20250916085725-GYA1255161@gentoo.org>
References: <20250916064739.196695-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916064739.196695-1-hendrik.hamerlinck@hammernet.be>

Hi Hendrik,

On 08:47 Tue 16 Sep     , Hendrik Hamerlinck wrote:
> Add UART pinctrl configurations based on the SoC datasheet and the
> downstream Bianbu Linux tree. The drive strength values were taken from
> the downstream implementation, which uses medium drive strength.
> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
> hardware flow control conditionally.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
> Changes in v3:
> - Added /omit-if-no-ref/ to pinctrl states to reduce DT size
> 
> Changes in v2:
> - Split cts/rts into separate pinctrl configs as suggested
> - Removed options from board DTS files to keep them cleaner
> ---

-- 
Yixun Lan (dlan)
