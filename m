Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F04D598E
	for <spacemit@lists.linux.dev>; Mon,  5 Oct 2026 19:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791227868; cv=none; b=qR6caaxl5J6Es89lPTfzViP8hs9cyEpIa2OCGuCSoL4ARMu2cCl96NJJ7QHr4O6rodUdDxdzmBCoUvf6dBG3oM+WX8QLq1YH3da1ghRIioq1UIL8AFHYfjaYBTRFKsxIZaQuopRX+0ftHZRCYOSN/znXfGZqKstVIyLLMg9IIS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791227868; c=relaxed/simple;
	bh=4Ylbigh25Bijwv0+byEkwmrmawWZR/8frJ50sLV/Ckw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fuspcNXXdb7ByWRWjTB7TjGWzhQME89BRiAx5H+Ob4hSexTajDlfUcag5nwqvXawlQ8T5jPrltPsKywB0ZuxXhLq4no+Ve5kjADbnNYcT1adU7hi07ZBQMMrgrnoFm1kYBWGlZFct0hGJBAv3CbkJm4NkzS9PVIXaXQBb7PnrGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=QE62kwqx; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="QE62kwqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1791227862; x=1791487062;
	bh=wOz4DnzfmU/HYeLrl7a2IRmweJrrBl1OmC1LGZrrjZs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QE62kwqxNngB2nu75/HOXZHsbCBxgdabif4Wml3MVLg7YmLONQMHZgFtMQoa8pFF0
	 PZXP3KzvdbpzCUiqDFHfDt0K5t4L6A0wtSAfYMH/UtmVMc0Gc7oKKyFjnA8RE8YACm
	 yym9P0PeBCkeyqeuERCUR2eS3wJVanv3JREL3/eKly5f3XQbsc8fCaOb+3oMdck28r
	 dIT74zv8RosqCFQn9VmwukuXwcA6UuBjFTCS2wjhzsROEikLlXc8DDIk22EklVG8Ey
	 wZUjFnO4fveu+SSJA9JBx1rkPV8jupztucamX4e9AVcZ76iscybSC/Avl2Q79bIAz+
	 vBXQD8jUGubag==
Date: Mon, 05 Oct 2026 19:17:37 +0000
To: Yixun Lan <dlan@kernel.org>
From: Dave Klotz <DaveWK225@protonmail.com>
Cc: u-boot@lists.u-boot-project.org, spacemit@lists.linux.dev, u-boot-spacemit@groups.io, Lukasz Majewski <lukma@denx.de>, Tom Rini <trini@konsulko.com>, Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH v2 7/8] reset: spacemit: Extract common K1 reset code
Message-ID: <20261005T151511-0400.common-reset-tested-by.DaveWK225@protonmail.com>
Feedback-ID: 100562830:user:proton
X-Pm-Message-ID: a6be6694cf38154c84d8e0d46eeb1eb921c83e42
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On October 2 I tested the K1 reset consumers on OrangePi RV2 and R2S
using a combined build that included v2 7/8 from k3/for-next at
f4d1c8807a, together with my unposted OrangePi board support:

- OrangePi RV2: SDHCI microSD boot, PCIe NVMe link and scan, USB 3
  stick enumeration, EMAC DHCP/ping, and FreeBSD boot.
- OrangePi R2S: SDHCI eMMC boot in HS200, USB host start, EMAC
  DHCP/ping, and FreeBSD boot. PCIe was not exercised by U-Boot on
  this board.

These are historical K1 regression results from that combined build,
not a new isolated test of 7/8. K3 hardware paths were not exercised.

Tested-by: Dave Klotz <DaveWK225@protonmail.com>

