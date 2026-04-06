Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262A26A1A4;
	Mon,  6 Apr 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490137; cv=none; b=hoYd0n+4mDv5uhGGbaMkdSij4qrABCjcDrDUaGSDMbSlF/B7VYUbVqYr1RsxLLvENx0xi9sWHTPFhUqzWwnOqqIc+5tldNoO5poBfRerBBDHtRessTVYuYR7MtdvEkB0wQncQ4XKe5nZR0zS/ebgM176HNe6uA4MJIDLfefA8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490137; c=relaxed/simple;
	bh=9kwDP7Fdq6O0kEg8ykMS/DSiW4gf15wN95WmZXP9TTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjApdkTlcMy4oDS+Py8nTJJCwVDzPes0mRQ9j+hogUoRNeIGEo5t4xBJrpx9XisHx0rkoQzBuX4VzkyAXZp4J1EoiNa7LF6ECKC9freU5zB3DimhmKi5MXuRtXipxS+KmK16NuN6eEzFHkeW3hLugqjj835moDETB8qSkyeX1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=MuXkrcff; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="MuXkrcff"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=5X/ZUgziwtiHD9yGGaPm4Aku2aaC3iKgPb/oyM7rlB0=; b=MuXkrcffBpTDobdj/dKUkCnWyg
	xHJcj44lfEzuGhbV8TYnA+hF3NEDE2hM9Wl86AaIzt9ZA5FC0HOCjyAlk1P3HlIS+oRxccNAOSYSw
	AlNIVz3KsFhg9TE1zNroPWMyuKv04GgIEzv01sXXVYcaO+7m49T6bS9nSMJx3jACLpn8aXzXPSZgi
	tPAMv1VWQMndcg9Ka6qQ4jD/5WX8EhIIobakoGxZuYJK0iFLblVycEF6OSTU2brMuKIfPzS2NP2TP
	N+4w9NMM4v8mnyu92olLWSQRXdvA65K+LzISpZNE6f+NhaJCNw3PYIATkoPMbiTNX6QleyXKnE2lC
	6w9WKKjg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w9m5V-0000000Cvlv-3JRa;
	Mon, 06 Apr 2026 17:42:05 +0200
Date: Mon, 6 Apr 2026 17:42:05 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vincent Legoll <legoll@online.fr>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [RESEND][PATCH v5] mfd: simple-mfd-i2c: add a reboot cell for
 the SpacemiT P1 chip
Message-ID: <adPUTRAlzGBs2wQG@aurel32.net>
Mail-Followup-To: Vincent Legoll <legoll@online.fr>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
References: <20260401165437.1048786-3-aurelien@aurel32.net>
 <b7e182f9-8bd8-40e6-acaa-dc6e556f2a53@online.fr>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7e182f9-8bd8-40e6-acaa-dc6e556f2a53@online.fr>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Vincent,

On 2026-04-06 11:46, Vincent Legoll wrote:
> Hello Aurelien,
> 
> I tested this on top of next-20260403 + the USB3 patch series v8 from Han
> Gao:
> 
> $ git log --oneline | head -7
> 05054ef4ae1d mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip
> 5f56e5402644 riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
> 5b0a2f3f8fa6 riscv: dts: spacemit: Define the P1 PMIC regulators for
> OrangePi RV2
> a05128fa7d3e riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
> 2febe6e6ee6e Add linux-next specific files for 20260403
> 8ff4869c6f24 Merge branch 'for-next' of
> https://github.com/hisilicon/linux-hisi.git
> e7d27cf6777b Merge branch 'next' of
> https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git
> 
> Without your patch the board hang on reset. With the patch applied, it
> reboots but there's a WARNING, see the attached dmesg.
> 
> Tell me if there's a new iteration to test, and/or if you want me testing it
> in a different way.

Yes, as written in the original mail, this patchset depends on PIO 
support in the spacemit I2C driver:
https://lore.kernel.org/lkml/20260207-b4-k3-i2c-pio-v7-2-626942d94d91@linux.spacemit.com/

Without it, you might get this warning message and reboot is not 100% 
reliable. I still believe it's better than no reboot support at all.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
