Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF19023B63E
	for <spacemit@lists.linux.dev>; Thu, 12 Mar 2026 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773313923; cv=none; b=QQWmkomt33bk6d2QRR8iJy/rSzyIvRGZakctrXdBagHKh8uNP8vG76j1qKy0iO4hXgDirHXKupH+zpYzYkLKahTgQi6bf7MON1sTbwVdtW7gFclke/TKnx024Gom2Mq0adHsuKn1ZvXidU55pejBx06KuuLRJuZVgHEb1Yp//KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773313923; c=relaxed/simple;
	bh=jA+08dlgyeYHMMOWgtTt6FqHityvM6f2gc/ee0hecsE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q4cn4bI6ARWbWlU8CMnZFmf7Sw3m50O8+kmwdsGH1fE2/ISkYNQcdE7EAOCOII7gxZAJHY7hzyLWCnQjSulCZH1iOuByZHTyskYl6NOMDRHzCavX4LK+lA71mNhXGtvqncINpPc9CffKIQKhxyejI5uls0RyteUfuQFbLRoLqE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0dxE-0002E1-LA; Thu, 12 Mar 2026 12:11:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0dxD-0050dx-0B;
	Thu, 12 Mar 2026 12:11:48 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0dxE-000000006Ie-1L98;
	Thu, 12 Mar 2026 12:11:48 +0100
Message-ID: <075052918fdd3c279347b0a2ffd85c8a0db36379.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: spacemit: k3: Add individual reset lines for
 USB, PCIe
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Thu, 12 Mar 2026 12:11:48 +0100
In-Reply-To: <20260312-01-k3-reset-usb-pci-v1-2-022b24b7340f@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
	 <20260312-01-k3-reset-usb-pci-v1-2-022b24b7340f@kernel.org>
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

On Do, 2026-03-12 at 10:34 +0000, Yixun Lan wrote:
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB,
> VCC, PHY. The PCIe controller also has three reset lines - DBI, Slave,
> Master. So, decouple USB and PCIe reset line to individual ones.
>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/reset/spacemit/reset-spacemit-k3.c | 50 ++++++++++++++++++------=
------
>  1 file changed, 30 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/s=
pacemit/reset-spacemit-k3.c
> index e9e32e4c1ba5..9f58526b0119 100644
> --- a/drivers/reset/spacemit/reset-spacemit-k3.c
> +++ b/drivers/reset/spacemit/reset-spacemit-k3.c
> @@ -112,16 +112,21 @@ static const struct ccu_reset_data k3_apmu_resets[]=
 =3D {
>  	[RESET_APMU_SDH0]	=3D RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
>  	[RESET_APMU_SDH1]	=3D RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
>  	[RESET_APMU_SDH2]	=3D RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> -	[RESET_APMU_USB2]	=3D RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(1)|BIT(2)|BIT(3)),
> -	[RESET_APMU_USB3_PORTA]	=3D RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(5)|BIT(6)|BIT(7)),
> -	[RESET_APMU_USB3_PORTB]	=3D RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(9)|BIT(10)|BIT(11)),
> -	[RESET_APMU_USB3_PORTC]	=3D RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(13)|BIT(14)|BIT(15)),
> -	[RESET_APMU_USB3_PORTD]	=3D RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(17)|BIT(18)|BIT(19)),

If there are already APMU reset users around, these either need to stay
or the driver needs an of_xlate that makes sure the deprecated ranges
are never given out to consumers.

Or, if there are no RESET_APMU users whatsoever yet, we might be
allowed to renumber RESET_APMU_* into a contiguous range.


regards
Philipp
