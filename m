Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10677264612
	for <spacemit@lists.linux.dev>; Fri, 20 Mar 2026 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008141; cv=none; b=kXFT7BEKBokjM2au2UsAeIAr0o1OqsdJtP+moK0tcbwAR1Gw6iqDmU958TdmSq3hhisx5Tvp8yU6igRsDFBLebfmujaxmoWKnIzAkZV6p276G8jSWApS6R0uJLJa94YGI3g1lrV9OJ6vniHvOqWFYgQFC0KUr0fP4ERs3jzXAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008141; c=relaxed/simple;
	bh=f7W2gT+v5OvJG9E6+8EfEXnr3fEu44JM/8Zu34YpB2s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AiXAjoCiR4m7frnNGMURZwebv08CFq47pnde6E43P9BbR5XFEUWjmxHLdCp5OLm7zGB6xZ1+5bQ7Vn46A5HZxkXWkQ0MfO0u8+HvUY3Z+rp4RkFfiqbUVNIWbRwfNhqwI5xqPgwBKv1+XI4hcbeiemJv8MWDU0Y5J+DrNK+EEmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3YYH-0004n9-Uq; Fri, 20 Mar 2026 13:02:05 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3YYG-001Ecl-2s;
	Fri, 20 Mar 2026 13:02:04 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3YYG-0000000085A-3NA2;
	Fri, 20 Mar 2026 13:02:04 +0100
Message-ID: <272ed19e2c0d8c9f53b6e621c01dc09f0635bf9d.camel@pengutronix.de>
Subject: Re: [PATCH v5] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Mar 2026 13:02:04 +0100
In-Reply-To: <20260320-01-k3-reset-usb-pci-v5-1-07f4a5ddd728@kernel.org>
References: <20260320-01-k3-reset-usb-pci-v5-1-07f4a5ddd728@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: spacemit@lists.linux.dev

On Fr, 2026-03-20 at 11:06 +0000, Yixun Lan wrote:
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware. And for DWC USB driver, it will match well
> with the number of the reset property in the DT bindings.
>=20
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> Also three reset lines each for UCIE and RCPU block.

Although I can't validate correctness of the id-to-bit assignments, the
changes look consistent.

I trust that the reason for the grouped reset lines was just
convenience, and not some hardware limitation that requires them to be
controlled at the same time.

There are no patches using the USB/UCIE/RCPU/PCIE resets found on lore,
so this is not an ABI break.

> As an agreement with maintainer, the reset IDs has been rearranged as
> contiguous number but keep most part unchanged to avoid break patches
> which already sent to mailing list. The changes of DT binding header file
> and reset driver are merged together as one single commit to avoid
> git-bisect breakage.
>=20
> Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
> Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support an=
d IDs")
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

If there are no objections, I'll pick this up into reset/fixes for
v7.0-rc6.

regards
Philipp
