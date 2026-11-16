Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822739;
	b=q+Hd5M1D092bqcOQVFlzRHwwsfKB1bOqQpx5PcsaI3Rvf+BjcScM0YuFfevwxfMC5Uli
	 dDL/VM/NeT7YdNxloBNuiTWtxmNYxx2igXMyhKljjejDq73sHlLet62sRm4pEg9LYm4wZ
	 dzTDFfZoA3H28mSWcSLbLo67UrAR1dRQk4SchX0tCg0RploSkhZKnVuOnm53sV4cradlJ
	 Bs263YR/MSyOOpSP9JSdoJFdNXdgnyb3gz+05IWJFYjWPSZTpP22cEnWYFFD97nzPAo8H
	 1grpaJK4JZ5tPjXugkQ6ByzDcquVowRKr3aijXIMdrjYSHbmkKLp6jGWhZHpSjVCL+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822739;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:Message-Id:To:
	 Subject:From:Mime-Version:References:Date:Cc:In-Reply-To:
	 X-Lms-Return-Path:Content-Type;
	bh=2iklAlBcpFJxRr/HPLPp4nje7OoKOirn0CCaVROWVsk=;
	b=Xp2gJ5szNWVG8y/O3rou/4ZIMMAA2LY62vpM45BVY9gzpwMRjhfe+Qn6WEjJeJ04z5cg
	 xQY+fS5Ud8MMI7Y8zKFNVwMe2ceIu61HK7QJ8xh9SHxveR9T3v7o6WjFP/vQJekI6pM+T
	 BglSRU+NKpz55OEXRzE6vbYv7Dk2HOisFR6rpaCM1bIym8NwiDSRcpgAjGBQ/hQhxz8Ev
	 YkT8xNDZFJ5k8GDpby3Mf98taFnS5DX4Q5SacLgBrAru2GCkfIQN5cnNQZD6EI5IX1kUg
	 JL8MScqa/2P2WqrxQo9lpxO0/O5/n35qLcUjjqkaPMdu6dwT2dWPM52XwUJiVfBNNQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=j1R36lNw;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35428606A881
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 09:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35428606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=j1R36lNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794822731;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=2iklAlBcpFJxRr/HPLPp4nje7OoKOirn0CCaVROWVsk=;
 b=j1R36lNwjUJ2addpgThY4YRKGX9vowt87a0A16L4g8HECGOeaVFtirnSJnzZYO2T/lctba
 bMW5tENiSmXuy4dRDwDsno+bvZOjZfcv1T3TAfvaUpkQ9k6nmwp9+8Fs92F2rx7cfNnEdU
 i+/wkUrokfrUfeV5JRwqYr/PY2StxwlNDvmVodmBE8wFnSWzi5CVEX9YYLbZ/wu1TrpSzp
 rsQG4ceW44HekJQLvFCkgM8BXG5DfH1Meurmf3gmzSpke/y5/oySyD+RoeaQ8WTm3tv5qq
 P7tsZPQFMHHFmqEFcbD32PCALoBReuKOReej/ov+48ydzegHN6EjoJIe29uAcg==
Content-Transfer-Encoding: quoted-printable
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.63da97eb.e7e5.488f.8751.a4a1c53db9df@feishu.cn>
To: "Yixun Lan" <dlan@kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033348.361452-1-sandie.cao@deepcomputing.io> <20261114075506-GKB100523@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
	<20261116082350-GKB100890@kernel.org>
Date: Mon, 16 Nov 2026 17:52:08 +0800
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"devicetree" <devicetree@vger.kernel.org>, 
	"linux-riscv" <linux-riscv@lists.infradead.org>, 
	"spacemit" <spacemit@lists.linux.dev>, 
	"linux-kernel" <linux-kernel@vger.kernel.org>
In-Reply-To: <20261116082350-GKB100890@kernel.org>
X-Lms-Return-Path: <lba+16afad249+451313+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8

Hi, Yixun:

> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Mon, Nov 16, 2026, 16:24

> >=C2=A0
> > In version 1 [1],=C2=A0 the patch is cd-gpios =3D <&gpio K3_GPIO(88) GP=
IO_ACTIVE_LOW>;
> > but K3_GPIO(88) is fake cd-gpio, it's tied low on board.
> So, there is gpio cd pin, but didn't work? it's hard to say without
> the schematic, but can you check with hardware people, if it
> can be fixed with SoC's internal GPIO BIAS pullup or pulldown?
> So, gpio pin is able to reflect card insert status
>=C2=A0
>=C2=A0

I did check with our hardware team, and the answer is:=C2=A0
there is a CD net on the slot, routed to K3_GPIO(88), but it is hard-tied
=C2=A0to GND on the board. (v1 of this series used=C2=A0
cd-gpios =3D <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>, which of course
always reports "card present".) It is a direct connection to GND, not a
strap resistor, so the SoC's internal bias cannot pull it up.

> > So In version2 [2], the patch changes to non-removable.
> > And In version3 [3], add comment.=C2=A0
> >=C2=A0
> > The options: cd-gpio, non-removable, broken-cd=C2=A0 all work on this b=
oard.
> >=C2=A0
> it works, but does not reflect the hardware status
>=C2=A0
> > We just need to detect the SD card when bootup, don't need the driver=
=C2=A0
> > to detect hot-plug event , non-removable should be suitable and faster,=
=C2=A0
> > we recomment to use non-removable.
> >=C2=A0
> No, this isn't a valid reason, it's use case should have nothing to do
> with the property.
>=C2=A0
> My point is: if the gpio cd pin still doesn't work, and the SD card is
> actually physical plugable, then should use "broken-cd".

The SD card slot is onboard [1],=C2=A0 put the board into casing, there is =
no
way to plugin/ plugout the card. So there is no card-detect event that can
ever happen at runtime.

If you still prefer broken-cd,=C2=A0 I will follow in next version.=C2=A0

[1]: https://deepcomputing.io/dc-roma-risc-v-mainboard-iii-unveiled-at-fosd=
em-powered-by-spacemit-k3-for-framework-laptop-13/

Best regards
Sandie
