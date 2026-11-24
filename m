Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557134;
	b=4jtdH0Z2Yy/qQLIZKW7zDob8HyYtu9xEfitk8ecarFq3hznLR3GvhSe7U8J8kWkiV+l+
	 qwru/Web3s+Vogm50OJys5iNbrz5nttAjcLK1meH9nV6XBjw0+3RipcvuHxcX9d9hQ5Ud
	 imOKQIPeOJnCr42uak9D6S1A8UyiiFGcKwi5fFiq6tmNhwVr9p18leYxGjSpPSNwhm515
	 KShn0DFr4jWhSGymxtj1WS4aCfJKv7sda0/c5zezvnD/QdeNkP/Kcp08FQRXP/N1E5ZUz
	 txOfuct78U4nKldV7qnJ64eAQJ9RGEkm7sXKT7+Peiko1uyw7KuuHg4SsTZypyB79Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557134;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=53YDCo8QbzEKoi/A/PIEZnOPiWUNZZ8Q6v9cpVBdB0s=;
	b=2sMopsH94qAHZOAB52cmfE/KTv4rV48sQpZpQmk8j3+nsvHwhCfHtIn229qBIMLNemss
	 YrZg7rWJoDJhIn/hoSUKAVzqN98vPFRi8JsZQpCfNkvHtovCjPsgmElH9lFCNML9eRFBK
	 QGSny/Vhg2pDjqtzcrQui5fwFqM/ncer6/4P3GKwuGkkP6CwH/1Aqy+LMITUWckWtDDZD
	 QzdUP2rLArjeVbWuMyxP7lPNwDCjNKwFZAiKGHuVSwCvpXQFFoks5S4L6VUoWbh7i7WlT
	 hqypVa48rEorV4ZwhFqeE+vJiOl4QEM6OlrhdqszWjkiVws3Tx1yWFbiVfmC6643HxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=N948NK5p;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE8606A32A;
	Tue, 24 Nov 2026 21:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BE8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=N948NK5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=53YDCo8QbzEKoi/A/PIEZnOPiWUNZZ8Q6v9cpVBdB0s=; b=N948NK5pZvBX3x91epD2ql/GVd
	4YHUMkpHAWjqwrAyMEje7gJTTiSVN43JdM0A5d64Ij/1sN9hN0EhmEkqzmcP3SHyHjRN8mYOujEZG
	sI1N4EJCqYKtfxNOLW5j1L6uRvB+lKIS0DnTgVi8/ww5wEaqCztJxOGCBuGiDeliou1JXG33MdIt2
	LK2mw4BytOVhEjABZZmJV2gruVAjD2q3R8ckCCuWobtM4SXHsPwAw9YzsxpjipYh/eYWePSA4MzYK
	hCVdv7leEUjimaWBczAP00TfwWfQSq1GmHPtpeF6AJAC9fOvT6kHX6ppVM91a6uCVFvYFDkabMLhy
	8ozfFvlw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVyQk-00000008zDA-12Zo;
	Tue, 24 Nov 2026 22:52:02 +0100
Date: Tue, 24 Nov 2026 22:52:01 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, me@ziyao.cc, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <awYHAU239WMaqVKk@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
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
In-Reply-To: <20261122173810.2409146-3-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi Jiayu,

On 2026-11-23 01:38, Jiayu Du wrote:
> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> controller. These banks contain temperature calibration parameters and
> other configuration data.
> 
> Reload the shadows during probe and cache the data for subsequent reads.
> Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> other banks.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/nvmem/Kconfig             |  11 ++
>  drivers/nvmem/Makefile            |   1 +
>  drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
>  4 files changed, 218 insertions(+)
>  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

Thanks for this new version. I confirm the nvmem format is now much more 
intelligible. The content for banks 0 and 7 matches what is reported by 
the vendor driver under Bianbu. Therefore:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
