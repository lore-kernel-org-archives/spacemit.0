Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5950C2DB787
	for <spacemit@lists.linux.dev>; Thu, 12 Mar 2026 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773313785; cv=none; b=uX1RKAEcdQJY+dNoweK4QuDkgKpMyt7+lVtERPlbciCsUwAcN27gmonXBZA4GYxAPUAFiZZvri1b7CJWSbErEKdLpRizlfjFJg9UHxtOxKj93JtRIGpb6JlZL7awfBoaXytgaNAzT73B6owqxatO5ssnrtePKZeclgxcNJGIqdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773313785; c=relaxed/simple;
	bh=Op03+RD3/hCwiJOIL8EBSDbt1vK5Jph9lkPjxsOpkbE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B4yRqcCts/tfL7XRgSOIYjElQeyJ7EeRJrJQCjgso/gY5rDDBCUu22iYMwrE05nir3ChLr50HAYXJpnVm4hmnpAVA8w32S5dBTJ2/suGybBW7dPMTDjoCTmlhRkCrvOlEz8EdDAAeA6NZBlIirytbGb8PaNKBCreVNpbxgsEREk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0duk-0001vZ-TI; Thu, 12 Mar 2026 12:09:14 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0dui-0050dj-2d;
	Thu, 12 Mar 2026 12:09:14 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0duk-000000006H9-0JQn;
	Thu, 12 Mar 2026 12:09:14 +0100
Message-ID: <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Thu, 12 Mar 2026 12:09:13 +0100
In-Reply-To: <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
	 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
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
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware.
>
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++++++=
------
>  1 file changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-=
bindings/reset/spacemit,k3-resets.h
> index 79ac1c22b7b5..c12f8bd32047 100644
> --- a/include/dt-bindings/reset/spacemit,k3-resets.h
> +++ b/include/dt-bindings/reset/spacemit,k3-resets.h
> @@ -97,11 +97,7 @@
>  #define RESET_APMU_SDH0          13
>  #define RESET_APMU_SDH1          14
>  #define RESET_APMU_SDH2          15
> -#define RESET_APMU_USB2          16
> -#define RESET_APMU_USB3_PORTA    17
> -#define RESET_APMU_USB3_PORTB    18
> -#define RESET_APMU_USB3_PORTC    19
> -#define RESET_APMU_USB3_PORTD    20

This is backwards incompatible.
Are there any device trees using the APMU resets yet?
If not, I wonder if we should just renumber all APMU resets into a
contiguous range and try to get it into v7.0 as a fix.

Also, this breaks bisectability.
reset-spacemit-k3.c will fail to compile between patches 1 and 2.

regards
Philipp
