Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E113933A9CF
	for <spacemit@lists.linux.dev>; Thu, 21 May 2026 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779331082; cv=pass; b=pbQtfcUcxUsRE03kaRsd6L6BU22aKlbjd1JyUJ46hjFQSvFdJx+ZlEIvIPEeURRdufCqjTUK0BpBe75vcmaSlwyKonIvNjm5yNf8Kb9Y54v/hR6cNS3M+gOGSedKuef69/QAKtMvNVHjnocx7xZfBYk3CqmdDKeVk/FTajNRU2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779331082; c=relaxed/simple;
	bh=MyVARbUM1IuwTJO5a05pcpY4gz3lHi6U1SRewVObKCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jB3jLPCoNgoZSywiiEy0pqgKO3c6gWFP5egc+UQ9F8tIYMW4FlNrLLOiZ4Xr9L6/UuCEmMximVTIZ27Hj9KQRPi6crR9CVJvB9aS59i0r05BTN8bOxCYooctxvPA0G2GHPTgi+PIiNJUVmjOVSoM/ApOtug92csIluvy2EZKgCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=nfZg/cGn; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="nfZg/cGn"
ARC-Seal: i=1; a=rsa-sha256; t=1779331064; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E5oWCZIybdeNyISXzzZVKehJxZXDCQabRMC6IEAO8/5SXUS45j9OGdfN8KLNldnLBXYHMNq+prgG7eCKNvZcR3xw+cbu9aGb0cDSQ3chJmE0bVMcugFwSrlz59LQp2+H0K6wD6NEGsXW/myxeP7l8DheUjJ8kqvcfgwCNY7vpbQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779331064; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MyVARbUM1IuwTJO5a05pcpY4gz3lHi6U1SRewVObKCw=; 
	b=RQCKhWHGZJVRd3/x6zPCWgh/7BUGqJ/ZgalB92AskqXyYCBfb37CPxXxBTjuev4X8IXYM6qC4jWoPXZ0LkVMS5UYCkIkwH1bYJEsf8Rafk74f/afX3tHPSl8jWRfBU/JCd93ebuoetESPla0T9xLb4lrZ1AYhB/snR5fC/ZtEAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779331064;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=MyVARbUM1IuwTJO5a05pcpY4gz3lHi6U1SRewVObKCw=;
	b=nfZg/cGnLpxw+/LfxHpl+LQn3+5QDWrkapRi3zFJ6ii/xRd5Ji2BcpQlkwTbwGVr
	aPRGF2nKgB0tE7Iz0LSk5teAx3f310MkmoxhvWFl0ZKDCF1TLJ72WupXzjl7LP8iilt
	RNf+80p41rPP1Xi8aKv0liWpM1TQWXc5P3tbV78I=
Received: by mx.zohomail.com with SMTPS id 1779331062268454.53335231037977;
	Wed, 20 May 2026 19:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 10:37:30 +0800
Message-Id: <DIO07RWUBUJH.34HYMR8R5C61I@pigmoral.tech>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "open list:RISC-V ARCHITECTURE"
 <linux-riscv@lists.infradead.org>, "open list:RISC-V SPACEMIT SoC Support"
 <spacemit@lists.linux.dev>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 4/5] riscv: dts: spacemit: enable SD card support on
 Milk-V Jupiter
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Aurelien Jarno" <aurelien@aurel32.net>, <linux-kernel@vger.kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0
References: <20260519041458.3287843-1-aurelien@aurel32.net>
 <20260519041458.3287843-5-aurelien@aurel32.net>
In-Reply-To: <20260519041458.3287843-5-aurelien@aurel32.net>
X-ZohoMailClient: External

Hi Aurelien,
Thanks for your work.

On Tue May 19, 2026 at 12:12 PM CST, Aurelien Jarno wrote:
> Add complete SD card controller support with UHS high-speed modes.
>
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with pull-up
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
> - Alias it as mmc1
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Both UHS-I and standard high-speed cards are tested successfully.

Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>

--=20
Best regards,
Junhui Liu

