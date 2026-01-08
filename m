Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087A3D7D9A
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870474; cv=none; b=JIo0Vq5RhlZFYttHye/JtCA3jRKG3Iry5wRVe0IOgB5Lxpj+O8knp7ehOvKc8udacFS8D327jZfUIS3N3M3Kb0m14NVwAH13jdb+ikok7n+O5tcGYCDAEwVHL+3pQZ6dFLJ0CZdN8hNi8tBzycAi3x1vWBpwLWdmH1TbKnl0y1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870474; c=relaxed/simple;
	bh=1slDODdYtFbvx+9LgPP0qBuwCcQV//dVL7NoB3/LS0s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hfbq3gyLzfTF4GS7iexPelr5nf9Rds5+ZJQFZEAiPcziXXkcJIoRswq3Y4EpCudSixqyGCCL1Oq9WXWvdQmjs4qgFcFYlk3o4O89bxy5kP/3LFujmb9Hgw7m8bTVBoJGEbSLtb/uGWMkOFl9gKenOFY6nSD6jbFQV+hRWTtkRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrY-0006JF-Tu; Thu, 08 Jan 2026 12:07:32 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrY-009fT8-27;
	Thu, 08 Jan 2026 12:07:32 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrY-000000005W0-2NQQ;
	Thu, 08 Jan 2026 12:07:32 +0100
Message-ID: <00ad0d7f5eebd96717d37be19944bdd2e7d77eef.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Alex Elder <elder@riscstar.com>, Guodong Xu
 <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,  Yao Zi
 <me@ziyao.cc>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Date: Thu, 08 Jan 2026 12:07:32 +0100
In-Reply-To: <20260103220005-GYA2070627@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
	 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
	 <aUYMjAi8YIqValwb@pie> <20251220025926-GYA1962618@gentoo.org>
	 <20251224114848-GYA1993014@gentoo.org>
	 <20260103220005-GYA2070627@gentoo.org>
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

On So, 2026-01-04 at 06:00 +0800, Yixun Lan wrote:
> Hi Philipp Zabel,
>=20
>  I still need your opinion in order to know which direction I should
> go..

I say merge via clock tree. I'll comment on v3.

regards
Philipp
