Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE27831D730
	for <spacemit@lists.linux.dev>; Mon,  5 Oct 2026 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791227505; cv=none; b=qcbfqIPW/gER3L4MTTJlmPYIC8PhPFCfilExoz42qqZGlnGS4wQhBUojH4BSa/iNzcFkTipsf84Z3yJcTqZVXhhq6+N06ryw75xcyrnkZoYl+gx2clBG6m3sW3DtyOXBdlCmqTrtenS9QG3LtNe70D8JOH0Gw2YGu1NFtmSxj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791227505; c=relaxed/simple;
	bh=cpccFb5Kpw28idUTJiDi+thg7krEFL8CYEwlZW4bwWU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oxMNY8UWwldWGyVuG7CXQ/7u5fjL7Vv4qYqYnM4Xfzh8Nr5zgcJfQ/WY/B31+wSVQM9A7pizndCd26IUZrZEiebngPFyaGTzgmCUh2fgCLnXchM5Grh4D+j4lk+DjP1v4r+BRml0tmvluKqs8cmhU2SpRCP85ysdlCImMEsBC8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=lE6DFPa5; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="lE6DFPa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1791227500; x=1791486700;
	bh=bazphCU4FsrsLJ7Hr4ZLsCJ+aCxclFWA0FEhBRhFNI0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lE6DFPa5RkRl2DcZFsosGpUGE9+5Z9yJYs1/KlsMc6naFVmAlLt/rlIsQZWJh05pv
	 9z3kiCpdMbkFDNtnf8m9IZLYzyKWF+nRytJ0ABpc2plI/c2YLXZGJ3Jg/ld92/9Pa1
	 uA+TO6JkBpNYr3sIsx8hWZmGXfRK4dEC4alPTMcFTf8X+gpESMtxgD/lmVxvgU3NbC
	 qfCxqEPyQbyim2bULpvO0x9f2bRSArRUX9z9c2W6sldwiM2vzOoxHp36qSLYrR9zNq
	 mLcLjmRNm/pP6kdsFCAt62bSflDuFKEM7lNUaSq0xn7ULincBCw7FkxOAHMxOiqS6n
	 fLN45knllFV/Q==
Date: Mon, 05 Oct 2026 19:11:35 +0000
To: Yixun Lan <dlan@kernel.org>
From: Dave Klotz <DaveWK225@protonmail.com>
Cc: u-boot@lists.u-boot-project.org, spacemit@lists.linux.dev, Lukasz Majewski <lukma@denx.de>, Tom Rini <trini@konsulko.com>, Junhui Liu <junhui.liu@pigmoral.tech>, u-boot-spacemit@groups.io
Subject: Re: [PATCH v2 2/8] clk: spacemit: ccu_mix: add inverted enable gate clock
Message-ID: <20261005T150532-0400.inverted-gate-tested-by.DaveWK225@protonmail.com>
Feedback-ID: 100562830:user:proton
X-Pm-Message-ID: e57dd256c83f2538d81475bab0b227701d48cc5e
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On October 3 I tested the exact posted v2 2/8 on OrangePi RV2 and R2S
as a K1 regression check. Control af2c8f5b7fcc and candidate 649a72433147
differ only by this patch; the working board/DDR/clock support, published
EMAC and OpenSBI v1.9 were held fixed.

Both control and candidate builds completed without warnings for both
boards, including the SPL clock objects. The new SPL was build-tested
only; both boards retained their existing SPL. U-Boot proper was tested
on hardware:

- RV2: repeated microSD, USB 3 storage and PCIe/NVMe reads; EMAC DHCP,
  gateway/peer pings and three SHA256-checked 1 MiB TFTP downloads.
- R2S: eMMC HS200 repeated reads, USB host enumeration and three
  SHA256-checked 1 MiB TFTP downloads on both variants; candidate
  EMAC DHCP and gateway/peer pings passed.

Both variants booted FreeBSD with eight CPUs and the expected root,
storage and connected links. Independent FreeBSD raw MMC reads matched
U-Boot. Both original ESPs were restored with full read-back verification;
the existing boot regions remained unchanged throughout.

All existing K1 gate definitions remain non-inverted. An extracted-source
host register model passed 360 normal/inverted enable/disable checks,
including preservation of unrelated register bits. I have no K3 hardware;
these results cover K1 regression and the host model, not K3 validation.

Tested-by: Dave Klotz <DaveWK225@protonmail.com>

