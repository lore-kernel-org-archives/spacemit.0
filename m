Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544151;
	b=xXPWevqZpdPVoiAmuaEGwg6UHuwU0isidlvW4pnAAjlwz+l8Rd9irr0oixSoVvDIM0nl
	 Eny1K7Dcc9lPYxFAamVJHEdGK4j/j8faTMZuhic7qFQ+VKQ70DkMzf0dbVzcMd3VnYyLk
	 eLobXGRO2PUJfu6pGOsEYxau2Wz2WIxqJsmGWqgBxwxqC7lPtzsBWy7YdXPdB0Hud9Epr
	 kPMxWwPCJ2comzuUllb+g4Gx3Qvw4TgtnOXPxR7nbgs0VDfakXrjOTKZYmrg6OnEQSwqW
	 KOocbYHJ41v2uuPbBQ8cbdSeGnzRhWayHydytDba8+NwG3p/zXyj19UJCxlBr1Ggfjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544151;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent;
	bh=6G63QTH0P52Wm7LZTOCz21z0QIqu9cIv0849Yq8dU8I=;
	b=D8oDNAwWyaG+0KtgqcswblhEghcm1eOfR+OHv9P6nuZ+aTx07gGcxrRCsHIqzlHoYAqz
	 +j8Gt3dAHBg1TfJMhvkPhfYNM+7CfMEPjqFuVH7K/M2Ya+gNlxcwPzLp5O2Q+Tbz+KD3M
	 QYtq4Pm2j3nQqTIRgshz3L82Wq/135+8Ytmeryl8ECSCQEeIAJMJxNC0QdI/y/ZkfcxVF
	 Zc3TMId0t/4qAU0c0tTgDviXUcMseqCAORXOlgh+gRD0MIjmuVU6Jjd5Kn7mMk4sBLFuE
	 CeT3dq7T2GfQSz38la8rY6bk9dJB6V3PD1V0MZ2geDyAcS1QxAbQrEQBxu0myn9CYmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=qlZ7bc5q;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C060B606A331;
	Tue, 24 Nov 2026 18:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C060B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=qlZ7bc5q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=6G63QTH0P52Wm7LZTOCz21z0QIqu9cIv0849Yq8dU8I=; b=qlZ7bc5q1QghNKdJi28KgFaO9k
	MWOgLlFEXe0+HPmxZakPl6vf2voPzwX25VWOHTTcMbUjv8u3Jlzv3qK33mPLQiR4PAejpFoho1R0y
	W5Lmmaz48/XNvGtAAwJ/nq4Ne5zTJ0T49M5Hm2oXWj/fLgBL+AD7sCZnkUoNSXu2c5npMdaJZQwKx
	zRQqzVhotSuuW7xlu7tUN4RXZEelWd069rkZwhFr+Af2A5PE9nFOdQe2r3ei++rkKiRNvztOM0HnM
	hnqryY+ukPCdbQB6MC5EFE9QakKLzRjrwi7e0/oYdHBo2mjswuKcmf3WCiysutn9lbsc7yLQMhhzA
	h3Sww9jw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVv3K-00000008lu6-2KEX;
	Tue, 24 Nov 2026 19:15:38 +0100
Date: Tue, 24 Nov 2026 19:15:38 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
Message-ID: <awXUSuYOUQMPCl-5@aurel32.net>
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
 <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
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
In-Reply-To: <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi Zixian,

On 2026-11-24 11:31, Zixian Zeng wrote:
> Hi Aurelien,
> 
> On 2026/11/24 5:58, Aurelien Jarno wrote:
> > Hi,
> > 
> > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> > > 256 bytes with an 8-byte write page, which can be found in schematic[2].
> > > The device tree declares pagesize = <16>, which does not match the
> > > eeprom chip datasheet which declares pagesize 8 bytes.
> > 
> > Oops, I am not sure how I got that wrong. Sorry about that.

The question of the page size has been raised in the initial review [1], 
and it seems that the GT24C02 has a 16-byte page size, while the 
GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms that 
the B version is used. Sorry about the mistake.

> > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> > > together, based on the chip model shown in the schematic diagram.
> > 
> > The k1-milkv-jupiter board is also affected with the same issue, despite
> > using a slightly different EEPROM (24C04).
> > 
> 
> The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
> the same issue, which you can find "Page Size: 16 bytes" in datasheet:
> https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf

Indeed you are correct, and I confirm that this is the exact version 
used on the schematics. Therefore there is no need to extend your patch, 
it can be merged that way.

> But I don't have the board, simple test would be appreciated. Perhaps I
> should include test steps in the commit message for the next revision.

Unfortunately the board has the EEPROM write protection pin connected to 
VCC, which means the write protection is enabled. Therefore testing is 
not so easy.

Regards
Aurelien

[1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/ 
[2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au.pdf

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
