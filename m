Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949795;
	b=Vf7T0DW0+5+u+bjdrclbrl+YYngAaxjvMbAGBiyO5kNn90QlIpQRwfTAlNxHRgSHdyrz
	 Pj7XDGRU09z+2ETsNL2FDBU6PNAf7zStc8L+7jgWIV4P0dIzbGUh6/VamufZMdyJWSIgd
	 06uJMfnfAVRo85271fWhVwk1IIHdbWv4pf8x9mwjhoaDHqqf+b2iC1+TMCpCckaroMxtD
	 9bD+nQTYSBJLZUOLpT6GZTHyZGI7PTmT7xULiVUZkaGuucxSpCosDv+Ftj7Bfcoo0QNwk
	 BlWq5YMRVm/Rx7jUrav6yQOv7q7v++wHl/bOGlnMVbqbSaaZ9CVsLYjyAa3Y4u1045Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949795;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=EtVhHyW7aHGIibxC4T0ib9PS9njKICVdDDhJxL38oGw=;
	b=zCiZ7kHyJ1acVLs9sbYGVKNxS/k0Is6wQ3OF66JCmBsTVG+odHCLctz/4yiiFgOq0oEk
	 fmsp2U5gKtn/ZJiZR81fEMs6QImYPgA0BuVpBvJhonLgYh6fH3iIp73Uqa/gVd4WZsCwH
	 MLWeaWca+Jah0w+ionDb595TbszRor1AMhjcXItdmhaKSyh6YZkuwOlYspRCTms58OKb3
	 oVt3ij7dn3wYLhkGJQByHr+3FvRlsb2aG40zaweLEM2e6WzZWtN2hAsEfLya/qqmkpYzy
	 uhj9b1W5pvc5gy2wyV67AO7oD0UbiJ2s+kKrltxmg3eA49iMbjr7CnoX4SI9Vq6VwGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=Vlnj07HE;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEED606A31C;
	Tue, 17 Nov 2026 21:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=Vlnj07HE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=EtVhHyW7aHGIibxC4T0ib9PS9njKICVdDDhJxL38oGw=; b=Vlnj07HEQZhfE7IRgLQCX9skMn
	aJo6gXGLWOXucwKVPXL+859PoLGmk3foGjFfxnO8DOsJwUwibVcHvztSN8qlaLX+FpcxO5D6b/2r1
	lLmGmArVKunrLHuTyPyWMRe4h4Bg3L1llAajMlW189OED1+K7IZxsZ3NqnjDW1mXfg8eeOVtwPj7z
	0T8S1UCkvWiix5HCGozpHyQr2GgmGHbkJhieCNuv5wA2bCZdfFNUCuUwO+8SyrU4esccjciDyGrsS
	geSAbwPnRIFdSiXnOD+f5PwYrKmV2o/w4EqZ3621bXuUK1FWVYWBTSL5s4kAtNz1no4482vu+ybVd
	n9WnZ2YQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xTQQz-0000000GYFB-3DTt;
	Tue, 17 Nov 2026 22:09:45 +0100
Date: Tue, 17 Nov 2026 22:09:45 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, me@ziyao.cc, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <avzCmVhf8tl6hi_B@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116075423.1519438-3-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-11-16 15:54, Jiayu Du wrote:
> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> controller. These banks contain temperature calibration parameters and
> other configuration data.
> 
> Keep the root key and SSK registers outside the exposed bank ranges.
> 
> FUSE_READY reports completion of a software-triggered reload. Trigger a
> reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> snapshot. Fail probe if the reload times out.
> 
> Snapshot the shadow registers with aligned 32-bit reads and expose the
> data in little-endian order at controller-relative offsets. Serve reads
> from the snapshot and use keepouts for the remaining register ranges.
> 
> Enable the AES_WTM clock only while accessing the hardware. Leave its
> shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/nvmem/Kconfig             |  11 ++
>  drivers/nvmem/Makefile            |   1 +
>  drivers/nvmem/spacemit-k3-efuse.c | 199 ++++++++++++++++++++++++++++++
>  4 files changed, 212 insertions(+)
>  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

I have been looking at the code with more details. Is there any reason 
to "expose" the whole 1024-byte efuse address space in the nvmem layout 
(of course with some masking) as opposed to the 16 banks x 32 bytes = 
4096 bits only (still with masking)?

I find strange that user space has to know the address of bank 0 or bank 
7 instead of just looking respectively at addresses 0x000 and 0x0e0.

As the layout exposed to user space also includes status or control 
registers (although masked), this might makes difficult to support a 
newer version of the efuse controller which have a similar data layout, 
but slightly different registers colliding with the bank data.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
