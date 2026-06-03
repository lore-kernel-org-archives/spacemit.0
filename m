Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74723403E8D
	for <spacemit@lists.linux.dev>; Wed,  3 Jun 2026 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472097; cv=none; b=sPzX8Eouwd/C2WofDiyICIAGWlM5kUX4XOqqHm5MO+g7HBSndIyG0nygWxgXpc82XZXavHCPmJjgje6Z3cDPKllgqX87aVqB1KR2s7/JZDyPyHPDmxe7489TZNd/UW7h5OXHq9Rl0nj5njvmBoa6Wql0pT03NQSff2Aw7mxgMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472097; c=relaxed/simple;
	bh=b45+hm70EOK8uOqmW0mQhAg1MkuxjCaCXifWs+QH0KE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UcMx7vEf/wazK8gtvx8HBeAfsf/iRmqqUnW8ah6PIBN004jg7JhLiW2ROOpbHj0MmUJ9YV/YK8cF/LfiuA7O5H94wsSyX7HbnmKhufd8HXTLd7bRSVuLY4VPPHKEWO5xGmZ3wti2qfM9WWnkVdPMAy65ACwq2ltBaEIFib/BkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUg7V-00031I-0c; Wed, 03 Jun 2026 09:34:33 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUg7U-000sTs-0R;
	Wed, 03 Jun 2026 09:34:32 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUg7U-000000001Jh-0ETg;
	Wed, 03 Jun 2026 09:34:32 +0200
Message-ID: <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Guodong Xu <docular.xu@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Date: Wed, 03 Jun 2026 09:34:31 +0200
In-Reply-To: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
References: 
	<20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
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

On Mi, 2026-06-03 at 06:26 -0400, Guodong Xu wrote:
> Add a MAINTAINERS entry for the SpacemiT reset controller driver
> (drivers/reset/spacemit/) and its reset-ID header. I intend to
> maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
> that reuse the common code.
>=20
> Link: https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdb=
e@riscstar.com/
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
