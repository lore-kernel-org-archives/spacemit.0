Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA027E7DA
	for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 23:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212698; cv=none; b=MjbK5Nkqtaz2RdRYm27Hlo3ZRH8MzTQeUA0kDpNfjpQ3jtZadMx5EiVdMfk6gcaOUYsN5rj2OW4g1WfTEWi9ma3usp0u9DqYcQhp18+ee3SgGkDKUAGCr/dM69/xs7f3z3kFlIFxxC2HFTbv+0Yairkq+y5FpNz2u6GFERNcmg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212698; c=relaxed/simple;
	bh=nDkvW9eXGeyHrMroRV2TEpTBKrUVBFmJi+i2sLRNrsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRZfJCBc2sIYXyn4igl1xIdgSKqKJeJFOlPVurCfZ3XhwmVoPwCvzMFG+zrjyZxF/ywnXLr/YZS/L85EdgxcbctvlOWZfTVgC6Wrp7ThZnF/aieg4wX8CNU5aBI4XBJo4aN6RziHm7xsYc/vYD/EeKS4llCsJ+1o5wDT7Y+xKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 555AD341051;
	Fri, 23 Jan 2026 23:58:16 +0000 (UTC)
Date: Sat, 24 Jan 2026 07:58:11 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add fixed regulators for
 OrangePi
Message-ID: <20260123235811-GYB71302@gentoo.org>
References: <20260119030251-GYD47382@gentoo.org>
 <20260123145015.1926865-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145015.1926865-1-amadeus@jmu.edu.cn>

Hi Chunkun,

On 22:50 Fri 23 Jan     , Chukun Pan wrote:
> Hi,
> 
> > > +	pcie_vcc3v3: regulator-pcie-vcc3v3 {
> > can you follow the same name scheme with k1-bananapi-f3.dts?
> 
> Sorry, but I don't quite understand?
> 
> From fixed-regulator.yaml:
> properties:
>   $nodename:
>     anyOf:
>       - description: Preferred name is 'regulator-[0-9]v[0-9]'
>         pattern: '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
>       - description: Any name allowed
>         deprecated: true
> 
> Using 'regulator-' as a prefix is correct.
> There are also some commits that changed regulator nodenames. [1]
Ok, good to know, then I'm fine with the prefix

> 
> As for the regulator-name, it should be consistent with the name in
> the schematics so that people can look it up between the two.
> The BPI-F3 also seems to have some names [2] that need improvement:
> 
> vcc_4v     -> vcc4v0_sys
> USB30_HUB  -> vcc5v0_hub
> USB30_VBUS -> 5v_vbus
> vin-supply    vcc5v0_sys
I do not have strong preference to have label/node name *strictly* matched
with the schematics, IMO, keeping certain alignment is ok, you can still
make some adjustment as long as keep it clean and explicit..
also it's still helpful to give a high level abstract name in 'regulator-name'
for the end user to know what's the regulator connect to.. e.g. in
 /sys/kernel/debug/regulator/regulator_summary

-- 
Yixun Lan (dlan)
